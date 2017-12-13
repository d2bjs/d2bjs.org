define("ace/mode/yaml_highlight_rules",["require","exports","module","ace/lib/oop","ace/mode/text_highlight_rules"],function(e,t){"use strict";var n=e("../lib/oop"),r=e("./text_highlight_rules").TextHighlightRules,i=function(){this.$rules={start:[{token:"comment",regex:"#.*$"},{token:"list.markup",regex:/^(?:-{3}|\.{3})\s*(?=#|$)/},{token:"list.markup",regex:/^\s*[\-?](?:$|\s)/},{token:"constant",regex:"!![\\w//]+"},{token:"constant.language",regex:"[&\\*][a-zA-Z0-9-_]+"},{token:["meta.tag","keyword"],regex:/^(\s*\w.*?)(:(?:\s+|$))/},{token:["meta.tag","keyword"],regex:/(\w+?)(\s*:(?:\s+|$))/},{token:"keyword.operator",regex:"<<\\w*:\\w*"},{token:"keyword.operator",regex:"-\\s*(?=[{])"},{token:"string",regex:'["](?:(?:\\\\.)|(?:[^"\\\\]))*?["]'},{token:"string",regex:"[|>][-+\\d\\s]*$",next:"qqstring"},{token:"string",regex:"['](?:(?:\\\\.)|(?:[^'\\\\]))*?[']"},{token:"constant.numeric",regex:/(\b|[+\-\.])[\d_]+(?:(?:\.[\d_]*)?(?:[eE][+\-]?[\d_]+)?)/},{token:"constant.numeric",regex:/[+\-]?\.inf\b|NaN\b|0x[\dA-Fa-f_]+|0b[10_]+/},{token:"constant.language.boolean",regex:"\\b(?:true|false|TRUE|FALSE|True|False|yes|no)\\b"},{token:"paren.lparen",regex:"[[({]"},{token:"paren.rparen",regex:"[\\])}]"}],qqstring:[{token:"string",regex:"(?=(?:(?:\\\\.)|(?:[^:]))*?:)",next:"start"},{token:"string",regex:".+"}]}};n.inherits(i,r),t.YamlHighlightRules=i}),define("ace/mode/matching_brace_outdent",["require","exports","module","ace/range"],function(e,t){"use strict";var n=e("../range").Range,r=function(){};(function(){this.checkOutdent=function(e,t){return!!/^\s+$/.test(e)&&/^\s*\}/.test(t)},this.autoOutdent=function(e,t){var r=e.getLine(t),i=r.match(/^(\s*\})/);if(!i)return 0;var o=i[1].length,a=e.findMatchingBracket({row:t,column:o});if(!a||a.row==t)return 0;var s=this.$getIndent(e.getLine(a.row));e.replace(new n(t,0,t,o-1),s)},this.$getIndent=function(e){return e.match(/^\s*/)[0]}}).call(r.prototype),t.MatchingBraceOutdent=r}),define("ace/mode/folding/coffee",["require","exports","module","ace/lib/oop","ace/mode/folding/fold_mode","ace/range"],function(e,t){"use strict";var n=e("../../lib/oop"),r=e("./fold_mode").FoldMode,i=e("../../range").Range,o=t.FoldMode=function(){};n.inherits(o,r),function(){this.getFoldWidgetRange=function(e,t,n){var r=this.indentationBlock(e,n);if(r)return r;var o=/\S/,a=e.getLine(n),s=a.search(o);if(s!=-1&&"#"==a[s]){for(var g=a.length,d=e.getLength(),c=n,u=n;++n<d;){a=e.getLine(n);var l=a.search(o);if(l!=-1){if("#"!=a[l])break;u=n}}if(u>c){var h=e.getLine(u).length;return new i(c,g,u,h)}}},this.getFoldWidget=function(e,t,n){var r=e.getLine(n),i=r.search(/\S/),o=e.getLine(n+1),a=e.getLine(n-1),s=a.search(/\S/),g=o.search(/\S/);if(i==-1)return e.foldWidgets[n-1]=s!=-1&&s<g?"start":"","";if(s==-1){if(i==g&&"#"==r[i]&&"#"==o[i])return e.foldWidgets[n-1]="",e.foldWidgets[n+1]="","start"}else if(s==i&&"#"==r[i]&&"#"==a[i]&&e.getLine(n-2).search(/\S/)==-1)return e.foldWidgets[n-1]="start",e.foldWidgets[n+1]="","";return s!=-1&&s<i?e.foldWidgets[n-1]="start":e.foldWidgets[n-1]="",i<g?"start":""}}.call(o.prototype)}),define("ace/mode/yaml",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/yaml_highlight_rules","ace/mode/matching_brace_outdent","ace/mode/folding/coffee"],function(e,t){"use strict";var n=e("../lib/oop"),r=e("./text").Mode,i=e("./yaml_highlight_rules").YamlHighlightRules,o=e("./matching_brace_outdent").MatchingBraceOutdent,a=e("./folding/coffee").FoldMode,s=function(){this.HighlightRules=i,this.$outdent=new o,this.foldingRules=new a,this.$behaviour=this.$defaultBehaviour};n.inherits(s,r),function(){this.lineCommentStart="#",this.getNextLineIndent=function(e,t,n){var r=this.$getIndent(t);if("start"==e){var i=t.match(/^.*[\{\(\[]\s*$/);i&&(r+=n)}return r},this.checkOutdent=function(e,t,n){return this.$outdent.checkOutdent(t,n)},this.autoOutdent=function(e,t,n){this.$outdent.autoOutdent(t,n)},this.$id="ace/mode/yaml"}.call(s.prototype),t.Mode=s});