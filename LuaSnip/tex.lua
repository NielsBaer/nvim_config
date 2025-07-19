local ls = require 'luasnip'
local s = ls.snippet

local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

local inmathenv = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {

  -- some stuff in math mode
  s(
    { trig = 'f', dscr = '\frac{}{}', condition = inmathenv },
    fmta('\\frac{<>}{<>}', {
      i(1),
      i(2),
    })
  ),

  s(
    { trig = 'ut', descr = 'text subscript', condition = inmathenv, wordTrig = false },
    fmta('_{\\text{<>}}', {
      i(1),
    })
  ),

  s(
    { trig = 'dt', descr = 'd<>/dt', condition = inmathenv },
    fmta('\\frac{\\text{d}<>}{\\text{d}t}', {
      i(1),
    })
  ),

  -- basic environments
  s(
    { trig = 'eq', descr = 'equation environment' },
    fmta(
      [[
	\begin{equation}
		<>
	\end{equation}

	]],
      { i(1) }
    )
  ),

  s(
    { trig = 'ali', descr = 'align environment' },
    fmta(
      [[
	\begin{align}
		<>
	\end{align}

	]],
      { i(1) }
    )
  ),

  s(
    { trig = 'fig', descr = 'figure environment with includegraphics' },
    fmta(
      [[
		\begin{figure}[h]
			\includegraphics[<>]{<>}
			\caption{<>}
			\label{<>}
		\end{figure}
		
		]],
      { i(1), i(2), i(3), i(4) }
    )
  ),
  s(
    { trig = 'tab', descr = 'table environment' },
    fmta(
      [[
	\begin{table}
		\centering
		\caption{<>}
		\begin{tabular}{<>}
			<>
		\end{tabular}
		\label{<>}
	\end{table}

		]],
      { i(1), i(2), i(3), i(4) }
    )
  ),
}
