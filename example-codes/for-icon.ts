
const f = (...x) => x;




type aType = string | number;
const a: aType = '27';
(async (a: aType | any[]) => {
  if (typeof a === 'string') {
    f([{ x: a }], true);
  }
  const s = await f([{}]);
  return (x: any) => f(s,x);
})(a).then(r => r(new Map()));



function v () {}
