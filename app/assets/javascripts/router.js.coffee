PudDown.Router.reopen
  location: 'auto'

PudDown.Router.map ()->
  @resource 'admin', ->
    @resource 'adminPosts', { path: 'posts' }, ->
      @route 'new'
      @route 'edit', path: ':id/edit'

