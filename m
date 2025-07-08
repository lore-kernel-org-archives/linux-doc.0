Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AE1A23AC;
	Tue,  8 Jul 2025 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984711; cv=none; b=QwJOEpWMjUcn03XxVulFkgtmfjJdhT1sZJ28ZvoARKD/aqAUPnaakIOKPzfTs0N2pkIUD8vKwsLUKUX8h4211HLjuzIzK+AA5cNe9Rr9gD8dVKizdffzJcTxMH95/L3sKRbtiVoczKaKP8uPo7PC8/BBDu2fGoOpB+L5uUutgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984711; c=relaxed/simple;
	bh=bzRHVe6Kpi4lLvXAcrzfRLYdccxp4AMFOfhrJv1AxMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bzgFDY3sjXfsztxGOegeMebg4/vGgXyD0UNgqeYDEbdwd652sRVOgk7nwa80vl9Yku8pJYlXMiTnpVrm3S7DUFgv1UL62mFwSgjhyBMcPttE1rs4ljMPr5q3RsJVcaynBJToSnYY5CVeyg+e8UJw4obHivP+h7M9YXgMyBB2DM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jOxYw0SD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jOxYw0SD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AB173406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751984709; bh=JjHyHNv5v90JOFZqyLEJOOsKa7GNYy4wKUVbR8clN24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jOxYw0SDPoXSaQs/EW/M8sVBvmc/2maZjphCUlWFaYqAU175tosDi+EVASWwyRPpL
	 G1DhwoWI6mGFOhEWavQp7jeLuIw9IrXM0+QdA1BnKPN4eyUYk1z/rpBFg2yzyyJ62D
	 ki9W6ds81e547MtwGpN+DmuG+iLF1YoLYCD1Mrn5I5F9PaRMXVio4IVFI9SIRSD0Bc
	 mag5NFKV2un0unVpULUECG2iPMI6+MgUvaBWqidhwH0zrMCHmo6jUaTosQj88wEpcM
	 oStmDShrlEapqebeMeqrBthOd/NaesJFGvMXVDKYPxkNSLrKN1BNDn2AnwiUere3Jz
	 j0h871Aw4YvQA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AB173406FC;
	Tue,  8 Jul 2025 14:25:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Sai Vishnu M <saivishnu725@gmail.com>,
 Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH 00/15] Translate sphinx-pre-install to Python
In-Reply-To: <d37eab74-a034-4be6-b92b-e0da60a99477@gmail.com>
References: <cover.1751318230.git.mchehab+huawei@kernel.org>
 <d37eab74-a034-4be6-b92b-e0da60a99477@gmail.com>
Date: Tue, 08 Jul 2025 08:25:08 -0600
Message-ID: <87bjpu69q3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi Mauro,
>
> On Mon, 30 Jun 2025 23:34:48 +0200, Mauro Carvalho Chehab wrote:
> [...]
>
>> The test script also ran the install procedure for system,
>> venv and native Sphinx install.
>
> Which install procedure did you test?  The short one with the "--no-pdf"
> option?
>
> I am asking because installing the full list of packages in podman run
> of opensuse/leap:15.6 didn't complete successfully for me.
>
> And by the look of things, you stopped at installation, because you are
> well aware of all the issues in running "make htmldocs" and its friends
> after the install.
>
> I assume you (or somebody else) are going to update the script once this
> series is applied to make the suggested lists of packages be useful for
> newcomers.

Thanks for testing this out.

My question would be: are the results somehow worse than those provided
by the existing, Perl script?  If this change regresses things, we
obviously do not want to proceed.  If it reproduces the old behavior in
a more maintainable language, then hopefully it is a step toward fixing
things in the long run ... ?

Thanks,

jon
