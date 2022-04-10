<div class="card mb-3">
    <div class="card-header bg-brown text-light">{{ include.title }}</div>
    <div class="card-body">
        {{ include.body | markdownify }}
    </div>
</div>
