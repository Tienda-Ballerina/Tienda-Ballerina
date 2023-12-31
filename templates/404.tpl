{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if not show_help %}
	{% embed "snipplets/page-header.tpl" %}
		{% block page_header_text %}{{ "¡Hola!" | translate }} {% endblock page_header_text %}
	{% endembed %}
{% endif %}

<section id="404">
	<div class="container-fluid p-0">
		<div class="row no-gutters">
			<div class="col-12 text-center">
				<p class="mb-1">{{ "Este producto no esta disponible pero..." | translate }}</p></br>
			</div>
		</div>
		{% set related_products = sections.primary.products | take(4) | shuffle %}
		{% if related_products | length > 1 %}
			<div class="row no-gutters">
				<div class="col-12 text-center">
					{{ "Te invitamos a que hagas" | translate }}
					<a href="https://www.tiendaballerina.com.ar/" target="_blank"><strong>CLICK AQUÍ</strong></a>
					<p> para ver todos nuestros productos</p>
				</div>
			</div>
			<div class="product-table row no-gutters mt-5">
				{% for related in related_products %}
					{% include 'snipplets/grid/item.tpl' with {product : related} %}
				{% endfor %}
		{% endif %}
	</div>
</section>

{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
    <div id="product-example">
        {% snipplet 'defaults/show_help_product.tpl' %}
    </div>
{% endif %}