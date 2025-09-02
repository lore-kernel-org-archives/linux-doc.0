Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E3EAD5A
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821150; cv=none; b=k70nt+6tB5OwOlt96n2jdAbByb3BXGXu70BWQPQGuSdEWkllmXHjF6WoFrAdNl08I/INNSD/7/KA773EQ2g/1sUoG61rgyMZls9Tue6pCOpciounvESKockSPuszmRPASlfaz93l17Zi6Gv3QiyXW0xM9+pNUza5kF4c0IZABTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821150; c=relaxed/simple;
	bh=j4omSiEz8SQ76MIfU7sQ2tby0jBs9N4EdplCJvukJSo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ow2E3LLaLERHu4hythPBxITQkbkvvS9kQ9+w6+IJ6X80UETM5jC69UATd5/idyDG5oQk59vrAM441K4KEtQGG7O6IlagmiZWn3HlGWUwp1kXgkm2BfJkackTgn7GMvK/eLeLKcHwiXnZDqIf+lHHCAV4ffEsurS/bcrmTyTJcgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pnikott2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pnikott2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5B58A40AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756821142; bh=CdrsFYl+ug69obCFiZ41v8Gg+xNOer0+wQZ67Yk8zuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pnikott2tKKfMr0CCaDBYhvKj85AHjiQbByT0OWuhgQ3lCeXArBG9HjZ+bZog37UX
	 SZloMEM33CILzQUfqQQJ2iNZ9Y1VclSInrQyzANg+Hgb7IeCwBGAPI76+PWTXw6JTF
	 8FIDCRGGQgOyiBFl/YIyfjWpSyIj1DSLGx1va6dWW7/BBRXmnURWEQljgsTOuSBjRD
	 Q1fAT1uKclw3mH++fZb/w/c6SCexUKm5gFFYZU91H0oq5gqqyOG1J+u+XdialDH07J
	 d82ErCWdy0QkDJLOVWppLL9hG1rBwydoOHreNVUUiwkjBCf/R5I3IuIzLYHpKJW+Jp
	 +aSSukA5co2wA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5B58A40AF5;
	Tue,  2 Sep 2025 13:52:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zhixu Liu <zhixu.liu@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx: handle removeal of utils.error_reporting
 in docutils 0.22
In-Reply-To: <CALMA0xaveoq1PdvucwLGr=Oi0D7u+ouCpq7JNKc6qeMJbLUd5Q@mail.gmail.com>
References: <CALMA0xaveoq1PdvucwLGr=Oi0D7u+ouCpq7JNKc6qeMJbLUd5Q@mail.gmail.com>
Date: Tue, 02 Sep 2025 07:52:21 -0600
Message-ID: <87seh5vu5m.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Zhixu Liu <zhixu.liu@gmail.com> writes:

> docutils.utils.error_reporting wass removed in docutils v0.22, causing sp=
hinx
> extension (kernel_include) to fail with:
>
>>   File "/usr/lib/python3.12/site-packages/sphinx/registry.py", line 544,=
 in load_extension
>>     raise ExtensionError(
>> sphinx.errors.ExtensionError: Could not import extension kernel_include =
(exception: No module named 'docutils.utils.error_reporting')
>
> add compatibility handling with try/except:
> - SafeString =E2=86=92 str
> - ErrorString =E2=86=92 docutils.io.error_string()
>
> Signed-off-by: Z. Liu <zhixu.liu@gmail.com>
> ---
>  Documentation/sphinx/kernel_feat.py         | 5 ++++-
>  Documentation/sphinx/kernel_include.py      | 6 +++++-
>  Documentation/sphinx/maintainers_include.py | 5 ++++-
>  3 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/sphinx/kernel_feat.py
> b/Documentation/sphinx/kernel_feat.py
> index e3a51867f27bd..95f852c0722e1 100644
> --- a/Documentation/sphinx/kernel_feat.py
> +++ b/Documentation/sphinx/kernel_feat.py
> @@ -40,7 +40,10 @@ import sys
>  from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives, Directive
> -from docutils.utils.error_reporting import ErrorString
> +try:
> +    from docutils.utils.error_reporting import ErrorString
> +except:
> +    from docutils.io import error_string as ErrorString
>  from sphinx.util.docutils import switch_source_input

I really hate to see bare except: statements in Python code; they hide
bugs far too easily.  If we have to do it this way, please catch the
ExtensionError exception explicitly.

But can we do this in a more straightforward way looking at the docutils
version?  That would make what's going on a lot clearer.

Thanks,

jon
