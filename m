Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C11ACEBF;
	Tue, 28 Jan 2025 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738103848; cv=none; b=iJiFJqxlVVZzVstmIPlukIy68zZVq67fsFLVHHwi7reTnB4t9AY5cP7uBTytfP1ojtck1GFtfB8gzBnAZTrI5Qokt0o04LEOKYL6i1CZ50XkWlkjMoKjbgIZWFbBND5Z2mUTVrch8zdrMe9h0aCm+WRnuLQGyGg5+t8J0ikW5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738103848; c=relaxed/simple;
	bh=psvuwervxUGF26YovkiF7DqGMiTummHv7BL2ZigzBow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kNvZbQF3tykk9NjWccJPCVdkecYiRu4lDZHm1WAnT4A0pyHng+NoVSa/yIqiNmHEQVezM0oAdAnjGpqW3mV0h277Y4IcgMxjjBtRdyYMmCbYUGUJv4tb+Ird+xY1z83BocR1HPZYoIQPVO2ZaVda3hnIdwIkkscOcSc/md+2sH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mgD23mAv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mgD23mAv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 70D62403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738103846; bh=uAJYpd/74HFafWXw1GzsBK0N7oIiJrlSt9JHY2Ialhc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mgD23mAvBlOok5CRSjxqsHodOpegluI8Bw2ar/2iAEjAwEv1dPrrihMbbkPTTTrG2
	 z2L0otUPVgZeEJ4zxlYtqmkSOtxF4cLbmjkD+EoAeYpOCgo6lUiLw5YNkVK+ollxQM
	 oRDVJYEnVi88DvyCQkAn6BV8O5DUSoymoAssE6P9/rVq+DPruK0vK3adMcTwOkSSOl
	 0ypvbCSBjeIpfr516L3alPMmamsIkEUtPW6uYtNxkwhu4GCAW3/LZvCDpQCnAPMM4G
	 22pubSGlz7+7k7+7qIPMjGKcQRCdB/Bi5g0QRJ67BhRTcJFBwHarBCpqgXwr2SBx7k
	 +8FGDVzFnIVsQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 70D62403FA;
	Tue, 28 Jan 2025 22:37:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 18/38] docs: sphinx/kernel_abi: use AbiParser directly
In-Reply-To: <fb800900352d90a0e501e5d6732e1bea277478f2.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <fb800900352d90a0e501e5d6732e1bea277478f2.1738020236.git.mchehab+huawei@kernel.org>
Date: Tue, 28 Jan 2025 15:37:25 -0700
Message-ID: <87lduu7efu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Instead of running get_abi.py script, import AbiParser class and
> handle messages directly there using an interactor. This shold save some
> memory, as there's no need to exec python inside the Sphinx python
> extension.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/kernel_abi.py | 26 +++++++++++++++-----------
>  scripts/get_abi.py                 |  2 +-
>  2 files changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> index fc7500fad119..93d537d8cb6c 100644
> --- a/Documentation/sphinx/kernel_abi.py
> +++ b/Documentation/sphinx/kernel_abi.py
> @@ -42,6 +42,11 @@ from docutils.parsers.rst import directives, Directive
>  from sphinx.util.docutils import switch_source_input
>  from sphinx.util import logging
>  
> +srctree = os.path.abspath(os.environ["srctree"])
> +sys.path.insert(0, os.path.join(srctree, "scripts"))
> +
> +from get_abi import AbiParser

I have to admit that I don't like this bit of messing around with the
path.  And importing things out of scripts/ seems ... inelegant.

I take it you still want to be able to run get_abi.py standalone even
after it's directly integrated into Sphinx?  In this case, it might be
nicer to have the common library functionality in its own module that
can be imported into both sphinx and the standalone command.  That still
leaves open the question of where that module lives
(Documentation/sphinx perhaps?) and how the Python path gets set up
correctly...

jon
