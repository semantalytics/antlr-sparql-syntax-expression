grammar sse;

/* [1] */
SliceOpt
  : Slice
  | ProjectOpt
  ;

/* [2] */
ProjectOpt
  : Project
  | GroupGraphPatternNoSub
  ;

/* [3] */
GroupGraphPatternNoSub
  : BGP
  | Join
  ;

/* [4] */
GroupGraphPatternSub
  : BGP
  | Join
  | SubSelect
  ;

/* [5] */
SubSelect
  : Slice
  | Project
  ;

/* [6] */   	
Slice
  : '(' 'slice' ProjectOpt ')'
  ;
  
/* [7] */    	
Project
  : '(' 'project' '(' (TERM)+ ')' GroupGraphPatternNoSub ')'
  ;
  
/* [8] */    	
BGP
  : '(' 'bgp' (Triple)+ ')'
  ;
  
/* [9] */    	
Triple
  : '(' 'triple' TERM TERM TERM ')'
  ;
  
/* [10] */    	
Join
  : '(' 'join' GroupGraphPatternSub GroupGraphPatternSub ')'
  ;
  
/* [11] */    	
TERM
  : '?' ([a-z])+
  | '_' ([a-z])+
  | '<' ([^>])* '>'
  | '"' ([^\"])* '"'
  | '\'' ([^'])* '\''
  ;
  
/* [12] */    	
PASSED_TOKENS
  : ([ \t\r\n])+ -> channel(HIDDEN)
  ;
