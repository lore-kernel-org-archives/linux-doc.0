Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB65279DDD
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756826294; cv=none; b=LWIU6kcMRcZWepn031l+WAKR6ZCvQTHoegupgX2N846aFnIo15VCKGbH6rxJvyGmwgfXDE3Ry7JvBbTSrqy/f6zjoxfGjnhq5Vxq+KqtP5l4/EvMvOnZGdh+TtW01XIE/dHP3XVm8cmC7JS44+deH/yfcg0uvr6qITDDU45BJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756826294; c=relaxed/simple;
	bh=i0yEm7DAOxSX2/DrdyNK0VViKJQ4pRLDStd6ButJDBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kuZpMrbyHEStZKOiKjBly5rd2HX7doHGryP4iM+SRmaY8K8GuttBjUAh89EFQHpUcRaCvquTaMMN6LoE3SyYIxLn+c0klDeicd/GAEAcj3X+VV3FasnZ8jCIdk1utYRcj0cPOBaZoaIhlrrhunUqfGa+bleovHIBTRQe+Ex04HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=D0G/MywU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="D0G/MywU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E325C40AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756826292; bh=9wBWcHMD6oonsqAqqawaHg8aXPlFpEyA9ZI1gaIQXys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D0G/MywU8l3KMnaU5uQV0elqM8BNk5h4LZBJe6p6CVw6hZ1yaJJIpqEQq3Stog1G2
	 p6FKGLhqUKhMzEHYUl5AP7phodOhZUd1g9x8d9ZIjjF8qDQGtGw4qFDp5htfDFayIK
	 tXeJ0YmU3gcS3tBhliJccDQufhVuNwyItmH1+PPLQOqDdIRUc+53DXlHYbFFHjA6ac
	 9qOvuxoYEhYIvJWMygJ8JzEUKcLnJbCjOBt3WAy+O8akpFiYbVDN7Ag8ayUMt4P6uV
	 A3yTe8/cVZV8OtlqjAGlQRalpmQIVJQ0idd/Y+OdWV4jbxcqYM6LJlRYqAuek7Yu+l
	 AMNKtakkCbMDw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E325C40AFD;
	Tue,  2 Sep 2025 15:18:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zhixu Liu <zhixu.liu@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: sphinx: handle removal of
 utils.error_reporting in docutils 0.22
In-Reply-To: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
References: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
Date: Tue, 02 Sep 2025 09:18:11 -0600
Message-ID: <87a53cx4r0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Zhixu Liu <zhixu.liu@gmail.com> writes:

> docutils.utils.error_reporting was removed in docutils v0.22, causing sphinx
> extensions (e.g. kernel_include) to fail with:
>
>>   File "/usr/lib/python3.12/site-packages/sphinx/registry.py", line 544, in load_extension
>>     raise ExtensionError(
>> sphinx.errors.ExtensionError: Could not import extension kernel_include (exception: No module named 'docutils.utils.error_reporting')
>
> Add compatibility handling with try/except (more robust than checking
> version numbers):
> - SafeString  -> str
> - ErrorString -> docutils.io.error_string()
>
> Signed-off-by: Z. Liu <zhixu.liu@gmail.com>
> ---
>  Documentation/sphinx/kernel_feat.py         | 6 +++++-
>  Documentation/sphinx/kernel_include.py      | 7 ++++++-
>  Documentation/sphinx/maintainers_include.py | 6 +++++-
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/sphinx/kernel_feat.py
> b/Documentation/sphinx/kernel_feat.py
> index e3a51867f27bd..d077645254cd4 100644
> --- a/Documentation/sphinx/kernel_feat.py
> +++ b/Documentation/sphinx/kernel_feat.py
> @@ -40,7 +40,11 @@ import sys
>  from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives, Directive
> -from docutils.utils.error_reporting import ErrorString
> +try:
> +    from docutils.utils.error_reporting import ErrorString
> +except ImportError:
> +    # docutils >= 0.22
> +    from docutils.io import error_string as ErrorString
>  from sphinx.util.docutils import switch_source_input

This is a step in the right direction ... but the exception you report
in the changelog is sphinx.errors.ExtensionError; why a different
exception here?

I would still rather just look at the docutils version in any case,
rather than trying to interpret exceptions.

Thanks,

jon
