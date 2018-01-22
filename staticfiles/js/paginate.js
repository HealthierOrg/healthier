'use strict';

var PaginateJs = function (config)
{      
    this.size = 5;

    this.captions = 
    {
        prev: '<',
        next: '>'
    };

    this.prev = function () {};
    this.next = function () {};
    this.change = function () {};

    if (typeof config.pagination === 'undefined' || config.paginatinon === null)
    {
        console.warn('Please specify a container element that holds the pagination.');
        return;
    }   
  
    if (typeof config.container === 'undefined' || config.container === null)
    {
        console.warn('Please specify the container that holds the elements');
        return;
    }
  
    if (typeof config.size !== 'undefined' && config.size !== null)
    {
        this.size = config.size;
    }  
  
    if (typeof config.captions !== 'undefined' && config.captions !== null)
    {
        this.captions = config.captions;
    }
  
    if (typeof config.prev !== 'undefined' && config.prev !== null)
    {
        this.prev = config.prev;
    }
  
    if (typeof config.next !== 'undefined' && config.next !== null)
    {
        this.next = config.next;
    }
  
    if (typeof config.change !== 'undefined' && config.change !== null)
    {
        this.change = config.change;
    }
  
    if (typeof config.page_link !== 'undefined' && config.page_link !== null)
    {
        this.page_link = config.page_link;
    }
  
    if (typeof config.page !== 'undefined' && config.page !== null)
    {
        this.page = config.page;
    }
      
    this.elements = config.container.children;
    this.container = config.container;
    this.pagination = config.pagination;
    this.pages = [];
    this.buttons = [];
  
    this.init();
    this.bindToDOM();
    this.bindFunctions();

    return this;
};

PaginateJs.prototype.init = function ()
{
    var pages = Math.ceil(this.elements.length / this.size);    

    this.buttons.push(this.createButton(this.captions.prev, 'prev'));

    for (var page = 0; page < pages; page++)
    {        
        this.buttons.push(this.createButton(page + 1, page));
    }

    this.buttons.push(this.createButton(this.captions.next, 'next'));
    
    for (var element = 0; element < this.elements.length; element++) 
    {
        var current = element > 0 && element % this.size == 0;

        if (current === false)
        {
            if (typeof collection === 'undefined')
            {
                var collection = [];
            }            

            collection.push(this.elements[element]);
        }
        else
        {
            this.pages.push(collection.splice(0));
            collection = [];
            collection.push(this.elements[element]);
        }
    }

    this.pages.push(collection.splice(0));

};

PaginateJs.prototype.bindToDOM = function ()
{
    this.container.innerHTML = '';
    this.container.setAttribute('data-current', 0);
  
    for (var page = 0; page < this.pages.length; page++) 
    {
        var current = this.createPage(this.pages[page], page);

        if (page !== 0) 
        {
            current.style = 'display:none';  
        }

        this.container.appendChild(current);    
    }
  
    for (var button = 0; button < this.buttons.length; button++)
    {
        this.pagination.appendChild(this.buttons[button]);
    }
};

PaginateJs.prototype.bindFunctions = function ()
{
    var buttons = document.getElementsByClassName('pagination-page');
    var self = this;
  
    for (var button = 0; button < buttons.length; button++)
    {
        buttons[button].onclick = function ()
        {   
            var current = self.container.getAttribute('data-current');      
            var next = this.getAttribute('data-trigger');      

            if (next == 'prev') 
            {        
                if (current == 0)
                {
                    next = (self.pages.length - 1);
                }        
                else  
                {
                    next = --current;
                }
                self.prev(next);
            } 
            else if (next == 'next')
            {                
                if (current == (self.pages.length - 1))
                {
                    next = 0;
                }        
                else  
                {
                    next = ++current;
                }
                self.next(next);
            }
            else 
            {        
                next = this.getAttribute('data-trigger');
                self.change(next);
            }      


            self.container.setAttribute('data-current', next);   
            var pages = document.getElementsByClassName('page');

            for (var page = 0; page < pages.length; page++)
            {        
                if (pages[page].getAttribute('data-page') !== self.container.getAttribute('data-current')) 
                {
                    pages[page].style = 'display:none';
                }    
                else
                {
                    pages[page].style = '';
                }
            }
        }
    }
};

PaginateJs.prototype.page_link = function ()
{
    var link = document.createElement('a');  
    return link;
};

PaginateJs.prototype.createButton = function (caption, reference)
{
    var link = this.page_link();
    link.setAttribute('class', link.getAttribute('class') + ' pagination-page');
    link.innerText = caption;  
    link.setAttribute('data-trigger', reference);
    return link;  
};

PaginateJs.prototype.page = function ()
{
    var page = document.createElement('div');  
    return page;
};
       
PaginateJs.prototype.createPage = function (elements, reference)
{
    var page = this.page();  

    page.setAttribute('class', 'page');
    page.setAttribute('data-page', reference);  

    for (var element = 0; element < elements.length; element++)
    {
        page.appendChild(elements[element]);
    }

    return page;
};

!function ()
{
  
    if (typeof exports !== 'undefined' && typeof module !== 'undefined' && typeof module.exports !== 'undefined')
    {
        module.exports = PaginateJs;  
    }

    if (typeof window !== 'undefined')
    {
        window.paginateJs = function (config)
        {
            return new PaginateJs(config);
        };
    }

}();