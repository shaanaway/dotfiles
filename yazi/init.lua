function Linemode:size_if_file()
	size = self._file:size()
	return string.format("%s", size and ya.readable_size(size) or "-")
end
