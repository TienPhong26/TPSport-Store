

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4>Thêm Danh mục mới</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.category.store') }}" method="POST">

                            @csrf
                            <div class="form-group mb-3">
                                <label>Tên danh mục</label>
                                <input type="text" name="category_name"
                                    class="form-control @error('category_name') is-invalid @enderror"
                                    value="{{ old('category_name') }}" required>
                                @error('category_name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="{{ route('admin.category') }}" class="btn btn-secondary">Quay lại</a>
                                <button type="submit" class="btn btn-primary">Thêm danh mục</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
