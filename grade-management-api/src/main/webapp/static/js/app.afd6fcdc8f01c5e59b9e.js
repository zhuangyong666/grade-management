webpackJsonp([9],{"4dEq":function(t,n,e){"use strict";var a=e("//Fk"),o=e.n(a),u=e("mtWM"),r=e.n(u),c=r.a.create({timeout:1e4});c.interceptors.request.use(function(t){return sessionStorage.token&&(t.headers.Authorization=sessionStorage.token),t},function(t){return o.a.reject(t)}),c.interceptors.response.use(function(t){return 401!=t.data.code&&402!=t.data.code&&403!=t.data.code||(window.location="/login"),t},function(t){return o.a.reject(t)}),c.install=function(t){t.prototype.$http=c},n.a=c},"8KwA":function(t,n){},"Du/2":function(t,n,e){"use strict";e.d(n,"b",function(){return a}),e.d(n,"a",function(){return o});var a="SHOW_HEADER",o="HIDE_HEADER"},IcnI:function(t,n,e){"use strict";var a=e("7+uW"),o=e("NYxO"),u=e("ukYY"),r=e("mUbh");a.default.use(o.a),n.a=new o.a.Store({modules:{mutations:u.a},actions:r.a})},M93x:function(t,n,e){"use strict";function a(t){e("8KwA")}var o=e("xJD8"),u=e("WSyR"),r=e("VU/8"),c=a,i=r(o.a,u.a,!1,c,null,null);n.a=i.exports},NHnr:function(t,n,e){"use strict";Object.defineProperty(n,"__esModule",{value:!0});var a=e("7+uW"),o=e("M93x"),u=e("YaEn"),r=e("zL8q"),c=e.n(r),i=e("q8zI"),s=(e.n(i),e("4dEq")),p=e("IcnI");a.default.use(s.a),a.default.use(c.a),a.default.config.productionTip=!1,u.a.beforeEach(function(t,n,e){if("/login"!=t.path){if(null==sessionStorage.getItem("token"))e({path:"/login"});else{var a=sessionStorage.getItem("routers"),o=!1;a.split("_").forEach(function(n){n==t.path&&(o=!0)}),o?e():e({path:"/home"})}}else e()}),new a.default({store:p.a,el:"#app",router:u.a,template:"<App/>",components:{App:o.a}})},UjVw:function(t,n,e){"use strict";n.a={getHeaderStatus:function(t){return t.headerStatus}}},WSyR:function(t,n,e){"use strict";var a=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{attrs:{id:"app"}},[e("router-view")],1)},o=[],u={render:a,staticRenderFns:o};n.a=u},YaEn:function(t,n,e){"use strict";var a=e("7+uW"),o=e("/ocq");a.default.use(o.a),n.a=new o.a({mode:"history",routes:[{path:"/",redirect:"/login"},{path:"/login",component:function(t){return e.e(1).then(function(){var n=[e("QwEa")];t.apply(null,n)}.bind(this)).catch(e.oe)}},{path:"/home",component:function(t){return e.e(0).then(function(){var n=[e("lO7g")];t.apply(null,n)}.bind(this)).catch(e.oe)},children:[{path:"/",component:function(t){return e.e(7).then(function(){var n=[e("42Hy")];t.apply(null,n)}.bind(this)).catch(e.oe)}},{path:"/teachers",component:function(t){return e.e(2).then(function(){var n=[e("EphA")];t.apply(null,n)}.bind(this)).catch(e.oe)}},{path:"/upload",component:function(t){return e.e(6).then(function(){var n=[e("r6r7")];t.apply(null,n)}.bind(this)).catch(e.oe)}},{path:"/students",component:function(t){return e.e(3).then(function(){var n=[e("FEm1")];t.apply(null,n)}.bind(this)).catch(e.oe)}},{path:"/courses",component:function(t){return e.e(5).then(function(){var n=[e("2d9D")];t.apply(null,n)}.bind(this)).catch(e.oe)}},{path:"/scoreLevel",component:function(t){return e.e(4).then(function(){var n=[e("8PFt")];t.apply(null,n)}.bind(this)).catch(e.oe)}}]}]})},mUbh:function(t,n,e){"use strict";var a=e("Du/2");n.a={showHeader:function(t){(0,t.commit)(a.b)},hideHeader:function(t){(0,t.commit)(a.a)}}},q8zI:function(t,n){},ukYY:function(t,n,e){"use strict";var a,o=e("bOdI"),u=e.n(o),r=e("Du/2"),c=e("UjVw"),i={headerStatus:!0},s=(a={},u()(a,r.b,function(t){t.headerStatus=!0}),u()(a,r.a,function(t){t.headerStatus=!1}),a);n.a={state:i,mutations:s,getters:c.a}},xJD8:function(t,n,e){"use strict";n.a={name:"app"}}},["NHnr"]);
//# sourceMappingURL=app.afd6fcdc8f01c5e59b9e.js.map