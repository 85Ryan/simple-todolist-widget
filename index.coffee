refreshFrequency: 60000

# ToDoList Entries:
# Use a '#' for the item title
# Use a '-' for an open item
# Use a '+' for a completed item
todolistfile = '~/Documents/Todo/ToDo.list'

command: "cat #{todolistfile} | awk 'BEGIN {print \"<div class=\\\"content\\\">\"} /^[#]/ {print \"<h3>\"substr($0,2)\"</h3>\"} /^[-]/ {print \"<p>\"substr($0,2)\"</p>\"} /^[+]/ {print \"<p class=\\\"completed\\\">\"substr($0,2)\"</p>\"} END {print \"</div>\"}'"

style: """
  top: 120px
  left: 30px
  color: #f2f4f6
  font-family: Monaco, -apple-system, PingFang SC
  font-weight: 400

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.3)
    font-size: 13px

  .content
    padding-left: 20px

  .content h3
    font-size: 14px
    padding-top: 12px
    padding-bottom: 5px
    border-bottom: 2px solid rgba(#fff, 0.3)

  .content p
    margin-top: 3px
    margin-bottom: 3px

  .content p:before
    content: "#"
    font-weight: 600
    font-family: Menlo
    font-size: 13px
    color: #f2f4f6

  .content .completed
    color: #e2e4e6
    font-weight: regular
    text-decoration:line-through
"""


render: -> """
  <div class='todolist'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)