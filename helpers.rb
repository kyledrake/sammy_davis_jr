class Sinatra::Base
  helpers do
    def h(text); Rack::Utils.escape_html text end

    def onclick_delete(msg='Are you sure?')
      %{ if (confirm('#{msg}')) {
           var f = document.createElement('form');
           f.style.display = 'none';
           this.parentNode.appendChild(f);
           f.method = 'POST';
           f.action = this.href;
           var m = document.createElement('input');
           m.setAttribute('type', 'hidden');
           m.setAttribute('name', '_method');
           m.setAttribute('value', 'delete');
           f.appendChild(m);f.submit();
         };
         return false;
       }
    end

    def onclick_put
      %{ var f = document.createElement('form');
         f.style.display = 'none';
         this.parentNode.appendChild(f);
         f.method = 'POST';
         f.action = this.href;
         var m = document.createElement('input');
         m.setAttribute('type', 'hidden');
         m.setAttribute('name', '_method');
         m.setAttribute('value', 'put');
         f.appendChild(m);
         f.submit();
         return false;
        }
    end
  end
end