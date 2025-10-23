"""Tests for the main module."""

import pytest
from your_package.main import YourClass


class TestYourClass:
    """Test cases for YourClass."""

    def test_init(self):
        """Test YourClass initialization."""
        instance = YourClass("test")
        assert instance.name == "test"
        assert instance.config == {}

    def test_init_with_config(self):
        """Test YourClass initialization with config."""
        config = {"key": "value"}
        instance = YourClass("test", config)
        assert instance.name == "test"
        assert instance.config == config

    def test_do_something(self):
        """Test do_something method."""
        instance = YourClass("World")
        result = instance.do_something()
        assert result == "Hello, World! Configuration: {}"

    def test_do_something_with_config(self):
        """Test do_something method with config."""
        config = {"debug": True}
        instance = YourClass("World", config)
        result = instance.do_something()
        assert result == "Hello, World! Configuration: {'debug': True}"

    def test_do_something_empty_name_raises_error(self):
        """Test do_something raises ValueError for empty name."""
        instance = YourClass("")
        with pytest.raises(ValueError, match="Name cannot be empty"):
            instance.do_something()