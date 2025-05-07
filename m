Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5AA289344
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629104; cv=none; b=rkFd76Mpb8dbRGUrtxrvf3CNh//pi4hPZMpRdrgQ5WDuCBj81mVfOBKqI3xM9nEYZ+OijGXmOrfBrqHEB8kp7RYE8vyUpBpfsICubJb/XfGeVgyPXbSB254YoxdbXgXjIdmZZLPKEMEtZvAV0BMk4KKtbZ3QeKy8/mC3KxfpikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629104; c=relaxed/simple;
	bh=tZ2tnxBpqO3egzOCu698iOmtRZV6XjV/vwDG1DfxqTA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqwwPceTN0ZNJKZUuPT27GTZ65EVqALx/3qRfqnb3SZ0wz4l8R6mMFZubxKwdey2TXAozrisPiT1MmuPvNK40JzmtDXeVGi6zOewHyWD+6YIA96eW3ZkDb2SEf7KDoK197bdlzXFpOjSHOTRYmiDm1pm/0aM9g+2MGbR3VYtg18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFVBHl+T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFVBHl+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD4CC4CEE2;
	Wed,  7 May 2025 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746629103;
	bh=tZ2tnxBpqO3egzOCu698iOmtRZV6XjV/vwDG1DfxqTA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iFVBHl+T+koV6C9rieV0HBmXGu3JfxUcGlerH1ke9u/J0ii+bVbHlm2NRDYqZgWE8
	 G3BY8fjJG3GJylnX/cFFa7y51gBpO69MgNXDk4nLLV9UJRLUHPRJsppItXCX5wpkuH
	 ZhpgPLFD9dOuwwTfvGMo+2Tx8dWEuN2q9qn2cJ+6mp+HqFQW9B5A9cYOjowHEFtqnp
	 5op0fE1HwMt4iqsFjwCWz2KVo9bivvH4XtfmXn3zEHTXpdq4O5IEVDe3Srwn6Rpsyl
	 onKRLc4bfRoTEPrFMet9BfXyml/iV9awZq4reWnYrqrzYRg5tKlWV2yQcZXK4yERmK
	 RUPKlGZCBqXgA==
Date: Wed, 7 May 2025 16:44:55 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] docs: Makefile: Inherit PYTHONPYCACHEPREFIX setting as
 env variable
Message-ID: <20250507164455.76daaae2@sal.lan>
In-Reply-To: <0253ce98-960c-4498-8ace-a4354e3ebc26@gmail.com>
References: <0253ce98-960c-4498-8ace-a4354e3ebc26@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 1 May 2025 17:21:07 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Commit 6c2f0b28d76e ("docs: Makefile: store __pycache__ at the output
> directory") assigns a new path to PYTHONPYCACHEPREFIX for building
> kernel documentation.
> 
> However, it is not necessarily optimal for everyone.
> 
> If you find PYTHONPYCACHEPREFIX is already set, it strongly suggests
> that the developer has selected the setting as best suited for one's own
> workflow.
> 
> Use "?=" in the assignment to PYTHONPYCACHEPREFIX so that the path of
> $(abspath $(BUILDDIR)/__pycache__) works only as a safeguard.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sorry for not answering it earlier... I took a quick vacation last week
to rest after a long trip abroad.

It is a little late for that, as Jon already applied, but the change
looks good to me:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> Mauro,
> 
> I left other Makefiles commit 5c5c32d7abd9 ("scripts/kernel-doc.py:
> don't create *.pyc files") has touched, as I'm not sure which path to
> assign in them.

Well, O= sets some environment var, but granted it requires some time
to understand kernel Makefiles and see where exactly it stores the
dest directory. I won't have any time this week or the next one to
check it, but I can try to write a patch for that later on, if nobody
does that before.

> Additional Notes:
> 
> Python's default behavior, which is safe in cases where the source tree
> is never shared heterogeneously, can be restored by defining it empty
> by saying:
> 
>     export PYTHONPYCACHEPREFIX=
> 
> As the path in the env var can have white spaces, a quote pair is added
> to make it a single token.

Perhaps it makes sense to place it somewhere at the documentation.

Regards,
Mauro

> 
> Thanks,
> Akira
> --
>  Documentation/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 59e95ebae786..d30d66ddf1ad 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -82,9 +82,11 @@ loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
>  # $5 reST source folder relative to $(src),
>  #    e.g. "userspace-api/media" for the linux-tv book-set at ./Documentation/userspace-api/media
>  
> +PYTHONPYCACHEPREFIX ?= $(abspath $(BUILDDIR)/__pycache__)
> +
>  quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
>        cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
> -	PYTHONPYCACHEPREFIX=$(abspath $(BUILDDIR)/__pycache__) \
> +	PYTHONPYCACHEPREFIX="$(PYTHONPYCACHEPREFIX)" \
>  	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(src)/$5/$(SPHINX_CONF)) \
>  	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
>  	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
> 
> base-commit: c0fe189b590c754f69e0cb87c5b5674cad535cf6
