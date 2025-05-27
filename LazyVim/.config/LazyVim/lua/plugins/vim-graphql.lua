-- Do not forget to install TreeSitter parser for GraphQL
vim.cmd([[
  let g:graphql_javascript_tags = ["gql", "graphql", "Relay.QL", "svelte", "ts"]
]])
return {
  "jparise/vim-graphql",
}
