Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685261FDA61;
	Mon,  3 Aug 2026 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782203; cv=none; b=fZ2bG6vYSEA2XNkkliW3P186bfgcxzrUOYd88PSeWCzSMbirU1dwg67szBy9lgWK2Rd5VyRn7ScCnkVIQg1aS5dpICB+DhSmm6vG0rN6cVo7BtMaV94Herq1V1TKkleeycvRymitNqQPPswa3GQB6y3WPYsIJSPb9DJQIGlc9IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782203; c=relaxed/simple;
	bh=eIFul9NhNRRZH16bDMhFiACBq3Do+sMbAPiS20XGDiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kXS5SYil1jTn2rw6JUw8LJs9nOfgXlMMeRDwl6UgO0jgfmfhNJfkAWws0MstUe70zMNm6U2Y1xBN0GEr6szljO39NHSs+Ryz8G0vJ4nN1Fgcz4jjs4otLSw9w51DILKhjO88ly1aIoTbYQtea7K5qPrqCFJbsQP++J541/jvpVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=L7YIRlkx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="L7YIRlkx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A97F2408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785782201; bh=Z3T70MeEJHqWvzW3OiDVqtlCnFaQkbjUKacueY0TP9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L7YIRlkxNlLd/rx7YkoH4x48HMj8IK50r2WAQNM/jWAG/ZAJHhj8jm6Ol92d88O2X
	 +91P6tL+sJ/UgmwxSG/SHqDaF17bEvsTdDLjG1OoSfjmCUssTSG/JZC3e/dvXDbu2f
	 7PkTESH26ud+kwdVzeb8ESnUpEWe5czesj0vPG2Cn/hI3mRzFtwKWtkdUNHpEFVjJk
	 CWXMfF2WgqWvVOwGEATkOSItILni2Dygdy52P8oiJEbqhZvYTFwSq3eGb7MTSFZKIb
	 sSfneKx5YK6YUu9+AVpNPKuLhuLKEAsxVcNpYpW3UcIUSmOIYfOVsCoRlTJp6TA9Zi
	 RACBQIHRcJPJg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A97F2408B2;
	Mon,  3 Aug 2026 18:36:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, Federico Vaga <federico.vaga@vaga.pv.it>
Subject: Re: [PATCH] doc:it_IT: align doc-guide translation
In-Reply-To: <20260725185005.138887-1-federico.vaga@vaga.pv.it>
References: <20260725185005.138887-1-federico.vaga@vaga.pv.it>
Date: Mon, 03 Aug 2026 12:36:40 -0600
Message-ID: <8733wvyrt3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Federico Vaga <federico.vaga@vaga.pv.it> writes:

> Update the Italian translation of Documentation/doc-guide to catch up
> with the following upstream commits:
>
> doc-guide/index.rst:
>   commit a592a36e4937 ("Documentation: use a source-read extension for the index link boilerplate")
>   commit d40981350844 ("doc-guide: add help documentation checktransupdate.rst")
>
> doc-guide/sphinx.rst:
>   commit f1c2db1f145b ("docs: move test_doc_build.py to tools/docs")
>   commit abd61d1ff8f0 ("scripts: sphinx-pre-install: move it to tools/docs")
>   commit 9322af5e6557 ("docs: sphinx: add a file with the requirements for lowest version")
>   commit d6d886005d32 ("Docs: doc-guide: update sphinx.rst Sphinx version number")
>   commit 5ccab49c104c ("docs: doc-guide: clarify latest theme usage")
>   commit b31274d58d21 ("docs: drop the version constraints for sphinx and dependencies")
>   commit 40be2369dc0e ("Documentation: multiple .rst files: Fix grammar and more consistent formatting")
>   commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement to 2.4.4")
>   commit 86b17aaf2e88 ("docs: automarkup: linkify git revs")
>   commit 35d4a3c67eb5 ("docs/doc-guide: Clarify how to write tables")
>   commit 26d797ffc1c0 ("docs: update sphinx.rst to reflect the default theme change")
>   commit 679b4bc25fc7 ("docs/doc-guide: Add documentation on SPHINX_IMGMATH")
>   commit 4d627ef12b40 ("docs/doc-guide: Mention make variable SPHINXDIRS")
>   commit 7c43214dddfd ("docs/doc-guide: Add footnote on Inkscape for better images in PDF documents")
>
> doc-guide/kernel-doc.rst:
>   commit 827b9458c933 ("docs: kernel-doc.rst: document private: scope propagation")
>   commit eba6ffd126cd ("docs: kdoc: move kernel-doc to tools/docs")
>   commit 90f1d896d59f ("doc-guide: kernel-doc: specify that W=n does not check header files")
>   commit b580fa304c85 ("docs: kernel-doc.rst: document the new "var" kernel-doc markup")
>   commit 8deb5d725b48 ("docs: kernel-doc.rst: don't let automarkup mangle with consts")
>   commit dd3e817e879c ("doc-guide: kernel-doc: add %CONST examples")
>   commit 7e8a8143ecc3 ("docs: add support to build manpages from kerneldoc output")
>   commit 9e6c5870bb44 ("Documentation: kernel-doc: enumerate identifier *type*s")
>   commit 23a0bc285159 ("doc-guide: kernel-doc: document Returns: spelling")
>
> doc-guide/parse-headers.rst:
>   commit 6ae0f2072768 ("docs: parse-headers.rst: Fix a typo")
>   commit 68f3d40ea0ce ("docs: parse-headers.rst: remove uneeded parenthesis")
>   commit d69a03a97a2d ("docs: doc-guide: parse-headers.rst update its documentation")
>
> Also add the translations for the following pages, which had none:
>
> doc-guide/contributing.rst:
>   commit d96574b0b49d ("Add a document on how to contri
>
> doc-guide/maintainer-profile.rst:
>   commit 53b7f3aa411b ("Add a maintainer entry profile for documentation")
>
> doc-guide/checktransupdate.rst:
>   commit d40981350844 ("doc-guide: add help documentation checktransupdate.rst")
>
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
> ---
>  .../it_IT/doc-guide/checktransupdate.rst      |  59 ++++
>  .../it_IT/doc-guide/contributing.rst          | 319 ++++++++++++++++++
>  .../translations/it_IT/doc-guide/index.rst    |  13 +-
>  .../it_IT/doc-guide/kernel-doc.rst            |  88 +++--
>  .../it_IT/doc-guide/maintainer-profile.rst    |  60 ++++
>  .../it_IT/doc-guide/parse-headers.rst         | 220 ++++++------
>  .../translations/it_IT/doc-guide/sphinx.rst   | 178 +++++++---
>  7 files changed, 757 insertions(+), 180 deletions(-)
>  create mode 100644 Documentation/translations/it_IT/doc-guide/checktransupdate.rst
>  create mode 100644 Documentation/translations/it_IT/doc-guide/contributing.rst
>  create mode 100644 Documentation/translations/it_IT/doc-guide/maintainer-profile.rst

Applied, thanks.

jon
