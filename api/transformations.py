from fastapi import APIRouter, File, UploadFile, Form
from fastapi.responses import HTMLResponse, PlainTextResponse, FileResponse
from saxonche import PySaxonProcessor
import tempfile
import shutil
import pdfkit
import os


router = APIRouter()

GENERATE_ACT_XSLT = "files/InspectionAct/MiniEditorOKS.xslt"
RENDER_HTML_XSLT = "files/InspectionAct/file.xslt"


@router.post("/render", response_class=HTMLResponse)
async def render_form(xml: UploadFile = File(...)):
    with tempfile.NamedTemporaryFile(delete=False, suffix=".xml") as tmp:
        filled_path = tmp.name
        shutil.copyfileobj(xml.file, tmp)

    try:
        with PySaxonProcessor(license=False) as proc:
            xslt_proc = proc.new_xslt30_processor()

            act_xml = xslt_proc.transform_to_string(
                source_file=filled_path,
                stylesheet_file=GENERATE_ACT_XSLT
            )

            with tempfile.NamedTemporaryFile(delete=False, suffix=".xml") as tmp2:
                act_path = tmp2.name
                tmp2.write(act_xml.encode("utf-8"))

            html_result = xslt_proc.transform_to_string(
                source_file=act_path,
                stylesheet_file=RENDER_HTML_XSLT
            )

        return HTMLResponse(content=html_result)

    except Exception as e:
        return PlainTextResponse(content=f"Ошибка трансформации: {str(e)}", status_code=500)

    finally:
        os.unlink(filled_path)
        if "act_path" in locals():
            os.unlink(act_path)


@router.post("/render-pdf")
async def render_pdf(
    html: str = Form(None),
    title: str = Form(None),
    xml: UploadFile = File(None)
):
    filled_path = act_path = None

    try:
        if html:
            html_result = html

        elif xml:
            with tempfile.NamedTemporaryFile(delete=False, suffix=".xml") as tmp:
                filled_path = tmp.name
                shutil.copyfileobj(xml.file, tmp)

            with PySaxonProcessor(license=False) as proc:
                xslt_proc = proc.new_xslt30_processor()

                act_xml = xslt_proc.transform_to_string(
                    source_file=filled_path,
                    stylesheet_file=GENERATE_ACT_XSLT
                )

                with tempfile.NamedTemporaryFile(delete=False, suffix=".xml") as tmp2:
                    act_path = tmp2.name
                    tmp2.write(act_xml.encode("utf-8"))

                html_result = xslt_proc.transform_to_string(
                    source_file=act_path,
                    stylesheet_file=RENDER_HTML_XSLT
                )
        else:
            return PlainTextResponse("Не передан ни XML, ни HTML", status_code=400)

        with tempfile.NamedTemporaryFile(delete=False, suffix=".pdf") as tmp_pdf:
            pdf_path = tmp_pdf.name

        config = pdfkit.configuration(
            wkhtmltopdf=r"C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe"
        )

        pdfkit.from_string(html_result, pdf_path, configuration=config)

        return FileResponse(
            pdf_path,
            media_type='application/pdf',
            filename=f'{title}.pdf'
        )

    except Exception as e:
        return PlainTextResponse(f"Ошибка генерации PDF: {str(e)}", status_code=500)

    finally:
        if filled_path and os.path.exists(filled_path):
            os.unlink(filled_path)
        if act_path and os.path.exists(act_path):
            os.unlink(act_path)


