Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DAC2E6CD2;
	Fri, 21 Nov 2025 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747451; cv=none; b=YWu71pbs7k1gq/JFp1xoKOK8SGsJ17vZQDLtB/gLlW1ktTEq0fDEdhgM/CNd4f0TLz6OIxuDgMimU3rG/uYyx+QhyR2BZ/LD8hdzTuvjGcdDLVOKgQsGvtYn1ssmOf3q81a1YD1b4H5wiZ+DaiQ0/h3na4fNUqqcT4+VK5x58Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747451; c=relaxed/simple;
	bh=GwOBb8KrmM+LnA+GBczsq/AWTWuxcx4GnKWl54ZKHm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rNkGGEiiyVcPU0gLN7TpdRtKbS5Hg0A1t91kqNUK+j7kzQn/8EkPHx4E7ZLfUX9k/dB0J+AvLnm2ZxchI/yK/0n0nuUHoCRDhuNKafFwBIWfmaaY1WdILj3K8mRAx8u41c0nx44aVubhdV7+FsYXvKaT0BY75fOuw7c8eFd49n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IHoYR+h3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IHoYR+h3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BFCED40AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763747446; bh=BRgXSov2bpe9uv6AW102C6fNsoAZo5VJ4PGOohm8a+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IHoYR+h3hJFvsKFd25YcXRpm2GcdctSYa64ZyDUXsKm9z/IXi9LIMgnv8hxyQWpc5
	 lNX3xSA5ZgxpEwwif82GdiLVxMSrJvTKV5R+vma2T5plB2/7dSYLIccqLsPRdMYlV9
	 9XQBL0mK34FpnoN1w1g7nphrNdQ4DdlwN3MTQGUkGyo69PTWcVYXMTiJvMweM7SGlk
	 Uy4/b9rGRdhDsuAxY/XiOK2WW7FmUBEP4koXqcV2iqUPg8NTu+zc2h4O59+ukgPnbH
	 FB92Gb3veJNm5pnXv6BB8wi/br0jmCo9P4/Md0PFYwkdPpPdpka61BxX3UQvltD0Bw
	 cpndyvb/g2OeA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BFCED40AD1;
	Fri, 21 Nov 2025 17:50:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH v3 0/2] kernel-doc: add support for documenting vars
In-Reply-To: <cover.1763291890.git.mchehab+huawei@kernel.org>
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
Date: Fri, 21 Nov 2025 10:50:41 -0700
Message-ID: <87bjkvtgum.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> As suggested and discussed with Randy, this small series add support
> for documenting variables using kernel-doc.
>
> The first patch adds support for it.
> The second one documents two variables from media. 
>
> While two documented variables are part of kAPI, I'm documenting them
> mostly aiming to test the new feature, as those are meant to be used for
> debugging messages, so we could live without having them documented.
>
> I'm pretty sure we'll likely need to improve the parser regexes to
> catch everything. For instance, I had to add a logic on v3 due to the
> choice I did for the vars, which are pointers.
>
> Mauro Carvalho Chehab (2):
>   kernel-doc: add support for handling global variables
>   docs: media: v4l2-ioctl.h: document two global variables
>
>  include/media/v4l2-ioctl.h      | 15 +++++++++
>  scripts/lib/kdoc/kdoc_output.py | 45 ++++++++++++++++++++++++++
>  scripts/lib/kdoc/kdoc_parser.py | 56 ++++++++++++++++++++++++++++++++-
>  3 files changed, 115 insertions(+), 1 deletion(-)

This all seems fine at a first glance ... except I'm missing the update
to Documentation/doc-guide/kernel-doc.rst.  If we don't document the
documentation system, our moral position when we fault others for not
using it is ... weak ... :)

Thanks,

jon
