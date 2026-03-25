Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB432580D7;
	Wed, 25 Mar 2026 18:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464792; cv=none; b=e476D5EfwtpDlMk352oPPArbzdH3ZsvKYR9Oc6au5Mdij1BAyL9BAdQxQJ5W4B95dDXgBENm+TIpiienBafbq6OuuqCWfNmk8TzChoP36LfYzA1vovxMiD/JizI8fVPz1t8zqZY6/3oijKZTK8SvKNNUiosSOu5R3Y0zbs7t/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464792; c=relaxed/simple;
	bh=gMGnsXXt+pIAumvO3ZSYn5TDwYZG38VX9jfs+DG4dOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IZVd/RStKirYDPUdcGhqZeCYFguis7Fw1oEVBz8ZV5MKnyv5mYaP1la2oA3sBIdqZNA8/RAhkuOZ1fPw9j/V+ksYtks9YZw32Gg/CCUsKrm2b4QlUdbUpGzPpCCAmkTftiVmpEjrsvdGFLPQv+UIcQQroxFK2t6WVi8CviFmptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MGLpdPND; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MGLpdPND"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0A44B40C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774464791; bh=21S0a0oTj8kfsTKp3HFsAz9eX/did/akAbT6PM1D/aU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MGLpdPNDT27Yf9FkPwWfIrOoUcGorgauH8Xz3C28J91uEYqkJ0LLIo9tfN6WIwRs8
	 4h/IcBIyNUz4x4LGjdxD06o4WYPuYXtvIy6XATiwtDp1tpmEFTg66KsCNYyKPMy2Yo
	 IyrhuKnhDchcoeQ1AAwBey5la5w49LTr/MMQh7sU2QrYOC3dwSIvL8KQXoh0obkNEx
	 xhGJkkUAFlestX87tbxfGfhG8Tf+OJ6yYi5xwFQELY/Zs4AaeMp59KNdZLGvTNVfB2
	 LUiYEJ8IVfZ73JJlGIdBJ7JrN5ThQLyUzjylaUuXvgzGcYOEdgV7u4tsUC39V0RK95
	 +etnBXyKxNIKw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0A44B40C79;
	Wed, 25 Mar 2026 18:53:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v3] docs: wrap generated tables to contain small-screen
 overflow
In-Reply-To: <20260323153723.34735-1-rito@ritovision.com>
References: <20260321133811.17854-1-rito@ritovision.com>
 <20260323153723.34735-1-rito@ritovision.com>
Date: Wed, 25 Mar 2026 12:53:10 -0600
Message-ID: <87mrzvg2qx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rito Rhymes <rito@ritovision.com> writes:

> Some documentation tables exceed the fixed-width main content column.
> On desktop this is usually acceptable because they can overflow the
> 800px body without harming readability, but on smaller screens the
> same tables create page-wide horizontal scroll overflow that breaks the
> layout.
>
> Wrap generated HTML tables in a dedicated container. Above
> Alabaster's existing 65em breakpoint, the wrapper uses
> `display: contents` to preserve current desktop rendering. At and
> below that width, it becomes a horizontal scroll container so table
> overflow is contained locally instead of breaking page layout.
>
> Examples:
>   https://docs.kernel.org/6.15/kernel-hacking/locking.html
>   https://docs.kernel.org/6.15/arch/arc/features.html
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4

[...]

> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index db24f4344..d7c8c4f18 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -23,6 +23,13 @@ div.document {
>      margin: 20px 10px 0 10px;
>      width: auto;
>  }
> +/*
> + * Wrap generated tables in a container that preserves desktop overflow
> + * while allowing contained scrolling on smaller screens.
> + */
> +div.body div.table-overflow {
> +    display: contents;
> +}
>  
>  /* Size the logo appropriately */
>  img.logo {
> @@ -96,6 +103,15 @@ input.kernel-toc-toggle { display: none; }
>      div.kerneltoc a { color: black; }
>  }
>  
> +@media screen and (max-width: 65em) {
> +    div.body div.table-overflow {
> +        display: block;
> +        max-width: 100%;
> +        overflow-x: auto;
> +        overflow-y: hidden;
> +    }
> +}
> +
>  /* Language selection menu */

So this CSS perhaps makes sense, but..

>  div.admonition {
> diff --git a/Documentation/sphinx/table_wrapper.py b/Documentation/sphinx/table_wrapper.py
> new file mode 100644
> index 000000000..dfe8c139b
> --- /dev/null
> +++ b/Documentation/sphinx/table_wrapper.py
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +"""Wrap generated HTML tables in a responsive overflow container."""
> +
> +from sphinx.writers.html5 import HTML5Translator
> +
> +__version__ = "1.0"
> +
> +
> +class TableWrapperHTMLTranslator(HTML5Translator):
> +    """Add a wrapper around tables so CSS can control overflow behavior."""
> +
> +    def visit_table(self, node):
> +        self.body.append('<div class="table-overflow">\n')
> +        super().visit_table(node)
> +
> +    def depart_table(self, node):
> +        super().depart_table(node)
> +        self.body.append("</div>\n")
> +
> +
> +def setup(app):
> +    for builder in ("html", "dirhtml", "singlehtml"):
> +        app.set_translator(builder, TableWrapperHTMLTranslator, override=True)
> +
> +    return dict(
> +        version=__version__,
> +        parallel_read_safe=True,
> +        parallel_write_safe=True,
> +    )

But why do you need to inject another <div>, creating a whole new
extension to do so, rather than just applying the CSS directly to the
<table> elements?  I just gave that a try, and it would appear to work
just fine.

Thanks,

jon
