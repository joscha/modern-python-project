from click.testing import CliRunner

from modern_python_project.main import main


def test_hello_world(snapshot):
    runner = CliRunner()
    result = runner.invoke(main, ["--name", "Peter"])
    assert result.exit_code == 0
    assert snapshot == result.output
