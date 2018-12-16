

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'webec.SecUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'webec.SecUserSecRole'
grails.plugin.springsecurity.authority.className = 'webec.SecRole'
grails.plugin.springsecurity.logout.postOnly = false // allow logout via get url /logout

final statics = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.controllerAnnotations.staticRules = statics


grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

grails.plugin.springsecurity.securityConfigType = 'InterceptUrlMap'
grails.plugin.springsecurity.interceptUrlMap = statics + [
		[pattern: "/login/auth", access: ["permitAll"]],
		[pattern: "/lecturer/**" , access: ['ROLE_ADMIN']],
		[pattern: "/quiz/"   , access: ['permitAll']],
		[pattern: "/quiz/edit/"   , access: ['ROLE_ADMIN']],
		[pattern: "/quiz/showStats/"   , access: ['ROLE_ADMIN']],
		[pattern: "/quiz/create"   , access: ['ROLE_ADMIN']],
		[pattern: "/quiz/quizFillout/**"   , access: ['permitAll']],
		[pattern: "/question/**", access: ['ROLE_ADMIN']],
		[pattern: "/answer/**", access: ['permitAll']],
		[pattern: "/student/", access: ['ROLE_ADMIN']],
		[pattern: "/student/create/", access: ['permitAll']],
		[pattern: "/studentanswer/**", access: ['permitAll']],
		[pattern: "/**",access: ['permitAll']], // default
]

