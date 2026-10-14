Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB654A7EC
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 17:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998289; cv=none; b=t/ih3eIiOTR7JOkXxJ46+IvLLw60duydx2tG3hJ/JgCiCQhziF7BFBdXjRpUlTK/pneNVYxSS9NOpuuaow+vF0PaEu71QCdyaF2NHK35SqKX2ZkSln7CEUnA+VKZeyhTQl4Z0b8zghpbOJCcRjtvp7d3D7mlz6Ww5YrmfQ/argg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998289; c=relaxed/simple;
	bh=U8C4ikERfYpajWxwclTi1qVEjn3fUdD4Le7Oh4gEcIw=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qakBLBauoG9MoQ6rBo1D2XwpfZiT1FzcyywMphqSZ2DGoc5xF8cxOcaog9Ja9ug9qkldXYpy1qQWHJAr/g6ErGo+HkwmSzwkpOYV+AO3y7EQjjYOW6zXlEvYdT1ihqgfRaQufe+WcX+7LTyLSqDH9tWnIl/fay08vVoiX9mRBcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aKLkCI6t; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aKLkCI6t"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0A089408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791998286; bh=vzWFRIHXX98u7qE9KfZuHB4popVaPiveL9TBJtQSDGk=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=aKLkCI6tKh83J68sy/jjuRgbb44SY13pH6LLLKE4SteV/eln38jGbwl4ovHNnxTp0
	 VKl9skHGA9cMEu7PUx2trl+4LgzlgH4eDYG6m5M4c1c7FPQJaj98mCxrbHhnsy11GR
	 N8W1V/QFQPs5iCDZcekF9NfhG9Ub8wv2qqjFC6Sozw5vNWNtv5vHRIaxU9LHIcWb2T
	 KqBfRwH/zMU7ytbDKBAXdkbbf4OIwKnxxvHzdrhngi9UL+wfLpQVjYxkgB58Xl1ch2
	 7gkfu7Q3z057O/t6FWoU9rNH1+tibdRePh4j2gVsNihqoPF7hGGZeME5XikqqG2UMh
	 TVcNTA5BIvaEA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0A089408FF;
	Wed, 14 Oct 2026 17:18:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/10] docs/translations/pt_BR: admin-guide: add
 multiple translations
In-Reply-To: <20261002171133.50969-1-danielmaraboo@gmail.com>
References: <20261002171133.50969-1-danielmaraboo@gmail.com>
Date: Wed, 14 Oct 2026 11:18:05 -0600
Message-ID: <87y0c0uroy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This series adds Portuguese (pt_BR) translations for several documents
> in Documentation/admin-guide/, continuing the effort to expand the
> Brazilian Portuguese documentation in the Linux kernel:
>
> - features.rst
> - sysfs-rules.rst
> - sysctl/index.rst
> - cputopology.rst
> - hw-vuln/index.rst
> - LSM/index.rst
> - perf-security.rst
> - bootconfig.rst
> - kernel-parameters.rst
> - efi-stub.rst
>
> All documents were translated following the original documentation
> closely and keeping formatting, Sphinx directives and code blocks
> intact. The admin-guide/index.rst was updated alongside each translation,
> moving translated documents from Todolist into appropriate toctrees.
> All patches have been validated with checkpatch.pl and verified with
> 'make htmldocs'.

These add a huge set of warnings...?

  Documentation/translations/pt_BR/admin-guide/bootconfig:422: ./include/linux/bootconfig.h:31: WARNING: Duplicate C declaration, also defined at admin-guide/bootconfig:31.
+Declaration is '.. c:function:: uint32_t xbc_calc_checksum (const void *data, uint32_t size)'. [duplicate_declaration.c]
    Documentation/translations/pt_BR/admin-guide/bootconfig:422: ./include/linux/bootconfig.h:76: WARNING: Duplicate C declaration, also defined at admin-guide/bootconfig:76.

...lots more...

jon
