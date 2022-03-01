# DensityEstimationDatasets.jl

Package to automatically download common density estimation datasets using `LazyArtifacts`. For example:

```julia
train, valid, test = twenty_datasets("plants");
```

For more details on available datasets refer to `twenty_dataset_names`. The datasets are stored in a separate location, see `Artifacts.toml` for more details.

