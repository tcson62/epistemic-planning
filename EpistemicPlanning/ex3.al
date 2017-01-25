fluent tail, has_key_a, has_key_b, has_key_c, opened ,looking_a, looking_b, looking_c;

action open_a, open_b ,open_c;
action peek_a, peek_b, peek_c; 
action signal_a_b, signal_a_c, signal_b_a, signal_b_c, signal_c_a, signal_c_b;
action distract_a_b, distract_a_c, distract_b_a, distract_b_c, distract_c_a, distract_c_b;
action shout_tail_a, shout_tail_b, shout_tail_c;

agent a,b,c;

executable open_a if B(a,has_key_a), has_key_a;
executable open_b if B(b,has_key_b),has_key_b;
executable open_c if B(c,has_key_c),has_key_c;

executable peek_a if B(a,opened), B(a,looking_a), looking_a, opened;
executable peek_b if B(b,opened), B(b,looking_b), looking_b, opened;
executable peek_c if B(c,opened), B(c,looking_c), looking_c, opened;

executable signal_a_b if  B(a, looking_a), B(a, -looking_b), looking_a, -looking_b;
executable signal_a_c if  B(a, looking_a), B(a, -looking_c), looking_a, -looking_c;
executable signal_b_a if  B(b, looking_b), B(b, -looking_a), looking_b, -looking_a;
executable signal_b_c if  B(b, looking_b), B(b, -looking_c), looking_b, -looking_c;
executable signal_c_a if  B(c, looking_c), B(c, -looking_a), looking_c, -looking_a;
executable signal_c_b if  B(c, looking_c), B(c, -looking_b), looking_c, -looking_b;

executable distract_a_b if B(a,looking_a), B(a, looking_b), looking_a, looking_b;
executable distract_a_c if B(a,looking_a), B(a, looking_c), looking_a, looking_c;
executable distract_b_a if B(b,looking_b), B(b, looking_a), looking_b, looking_a;
executable distract_b_c if B(b,looking_b), B(b, looking_c), looking_b, looking_c;
executable distract_c_a if B(c,looking_c), B(c, looking_a), looking_c, looking_a;
executable distract_c_b if B(c,looking_c), B(c, looking_b), looking_c, looking_b;

executable shout_tail_a if B(a,tail), tail;
executable shout_tail_b if B(b,tail), tail;
executable shout_tail_c if B(c,tail), tail;

open_a causes opened;
open_b causes opened;
open_c causes opened;

signal_a_b causes looking_b;
signal_a_c causes looking_c;
signal_b_a causes looking_a;
signal_b_c causes looking_c;
signal_c_a causes looking_a;
signal_c_b causes looking_b;

distract_a_b causes -looking_b;
distract_a_c causes -looking_c;
distract_b_a causes -looking_a;
distract_b_c causes -looking_c;
distract_c_a causes -looking_a;
distract_c_b causes -looking_b;

peek_a determines tail;
peek_b determines tail;
peek_c determines tail;

shout_tail_a announces tail;
shout_tail_b announces tail;
shout_tail_c announces tail;

a observes open_a;
b observes open_b;
c observes open_c;

a observes peek_a;
b observes peek_b;
c observes peek_c;

a observes open_b if looking_a;
a observes open_c if looking_a;
b observes open_a if looking_b;
b observes open_c if looking_b;
c observes open_a if looking_c;
c observes open_b if looking_c;

a aware_of peek_b if looking_a;
a aware_of peek_c if looking_a;
b aware_of peek_a if looking_b;
b aware_of peek_c if looking_b;
c aware_of peek_a if looking_c;
c aware_of peek_b if looking_c;

a observes shout_tail_b;
a observes shout_tail_c;
a observes shout_tail_a;
b observes shout_tail_a;
b observes shout_tail_c;
b observes shout_tail_b;
c observes shout_tail_c;
c observes shout_tail_a;
c observes shout_tail_b;

a observes distract_a_b;
a observes distract_a_c;
b observes distract_b_a;
b observes distract_b_c;
c observes distract_c_a;
c observes distract_c_b;

a observes distract_b_a;
a observes distract_c_a;
b observes distract_a_b;
b observes distract_c_b;
c observes distract_a_c;
c observes distract_b_c;

a observes signal_a_b;
a observes signal_a_c;
b observes signal_b_a;
b observes signal_b_c;
c observes signal_c_a;
c observes signal_c_b;

a observes signal_b_a;
a observes signal_c_a;
b observes signal_a_b;
b observes signal_c_b;
c observes signal_a_c;
c observes signal_b_c;


initially C([a,b,c],has_key_a);
%initially C([a,b,c],-has_key_b);
initially C([a,b,c],-has_key_c);
initially C([a,b,c],-opened);
%initially C([a,b,c],-B(a,tail) , -B(a,(-tail));
%initially C([a,b,c],-B(b,tail) , -B(b,(-tail));
%initially C([a,b,c],-B(c,tail) , -B(c,(-tail));
initially C([a,b,c],looking_a);
initially C([a,b,c],-looking_b);
initially C([a,b,c],-looking_c);
initially tail, has_key_a, -has_key_c, -opened ,looking_a, -looking_b, -looking_c;
%initially C([a,b,c],B(a,tail));

goal C([a],tail);
%goal B(a,tail) | B(a,-tail);
%goal B(c,(-B(a,tail)) , (-B(a,-tail)));
%goal B(b,B(a,tail)| B(a,-tail));
