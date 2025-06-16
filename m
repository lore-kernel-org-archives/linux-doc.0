Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAE2E4250
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075541; cv=none; b=tYwBHXxN/tFGd+pIv+hrFF8JHg8nsOLyzE78CO/+IQkYuZMuRSRWBBn4CCcKKHZVwXah0sV5Bc+MbV/RvbkXTfZSBtieU4neycloKm8zIAqtsfl2pltf79LgnxSTeM/owFCmRHAu9GMGD9Ah7ctZXfcZGj8/11yi9mSEZhJjCgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075541; c=relaxed/simple;
	bh=4ONtF5DFEmvn+t3QPc8nYHRRLcaNTmew2XcecFw75k4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KxUULtQmIwLnoWAd+IdZYDBdu+W+X5rzIH2zZh+NpNZRRmiOoc7noZj3itkkwb3GQkS98C7fatDCn6TfmDjEipdCVLLRlVCwhGsY97VC8Y4i+Eu7g+s+oO8C3WIn9BbD3eTrnarXIQsan5VW+99Gyu93+fMx32jDx3CfHGTy+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nx6gvBtz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nx6gvBtz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F12C4CEEA;
	Mon, 16 Jun 2025 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750075540;
	bh=4ONtF5DFEmvn+t3QPc8nYHRRLcaNTmew2XcecFw75k4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Nx6gvBtziCTPXqX2dme2JaBELCoU88kCU9pSNnT9D13TyRWiHzOK9/9HP8qJwnd8N
	 kUQXQ1RpSn0rVf9QSosCzVCxITcjEdPWsTcGia2a7BJu+ErK8V/lgL2Qte7h0isRkC
	 312ioqzt1abdY+GwLs3rpKW1D2bjludOZK5chIBQnn+BeGMompvpiGIXsXOnp1tiZv
	 oLIwusz+aT57rOdMcUi64kJY+akenekDKhNJSN3Tpgl8a2knpnJDpMoSg1+Ngg+urB
	 zEshH7SfeV5aJxnCRvracT+3QYqSpl4Twf6Y1kYEJ7OLjAWRkx63jAGE8OwzTOUmKJ
	 50YdhOTOpPhEA==
Date: Mon, 16 Jun 2025 14:05:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250610
Message-ID: <20250616140450.79b3fedb@foz.lan>
In-Reply-To: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>
References: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 16 Jun 2025 20:18:22 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi Konstantin,
> 
> As you might well be aware of, latest successful documentation build against
> linux-next at https://www.kernel.org/doc/html/next/ was that of next-20250606.
> 
> I managed to reproduce the build error using debian bookworm's distro packages
> which can be close enough to Sphinx 5.3.0 used there.
> 
> This is the error I got from "make htmldocs":
> 
> ----------------------------------------------------------------
> Extension error (automarkup):
> Handler <function auto_markup at 0x796307745bc0> for event 'doctree-resolved' threw an exception (exception: argument for warn() given by name ('stacklevel') and position (3))
> ----------------------------------------------------------------

Sphinx crashes generally generate a python dump. Maybe you could take
a look on it.

> Bisection points to commit d6d1df92c25f ("docs: automarkup: Mark up
> undocumented entities too") queued in Jon's docs-next branch.
> 
> Reverting it resolves the error, but honestly speaking, I don't have
> any plausible theory on how that change could cause such an issue.
> 
> Actually, when I install Sphinx 5.3.0 by using venv and saying
> 
>     pip install "Sphinx<6.0" pyyaml
> 
> on Ubuntu 24.04 today, said error doesn't reproduce.

Perhaps it is related to docutils version.

Assuming that it doesn't work with certain versions of sphinx or
docutils, instead of reverting the entire patch, IMO the best would
be to add a check for Sphinx version, disabling the broken refs
only for too old versions.

> I'm not sure but there might have been some minor incompatibility
> between past versions of dependencies.
> 
> I'd rather upgrade Sphinx to 8.2.3 (latest).
> 
> Konstantin, could you try it?
> 
>         Thanks, Akira

Regards

Thanks,
Mauro
