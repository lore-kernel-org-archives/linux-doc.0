Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4884F77F12
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 04:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707195217; cv=none; b=nGZlBZfXGWZMwz133z3VVeaQARv9QHnr8i+LmvkYw9kY0TyJuya7KdHAJrrR6XPFBVVjtojluwpBDa9GHBaqEX4uCqX1zHC12P7a2OwMFA/5HNaMOuZ0zsPbhVmVtwBfsxX3vbLVx8Wd9qpOyHptxNicKiIVgRKbrSvrn159vaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707195217; c=relaxed/simple;
	bh=yPp5j9VqRFGMHs9ZsB5uQn0CYYesMb+4InN657bhUls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ERRqRBx4GdtaYUtYX/GnU9dQcVfXBxsfzmnI148GoJg1Ady/sNwo4gqANQ3if1mfbBlSEtniObaIhWwU6BlBJYr04Bitcs6LLChA3BDuuXbkf40sELzOLjKCOLdWUDGwrkypaDb+BkGOeR0pXJZcQv8i1gBMnt+AT/Xj/Fv97AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBYcMOm5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBYcMOm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B29C433F1;
	Tue,  6 Feb 2024 04:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707195216;
	bh=yPp5j9VqRFGMHs9ZsB5uQn0CYYesMb+4InN657bhUls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EBYcMOm5iehR550dGZxU3b9Mv6Z76dwGgy/xPqks+LUkZ9YzffwYD9YgztNEYTJuZ
	 KzgDE8HqlCiDrLprjo0uood5Tc6Xfurv2lfZIPmY2488cBVGBdlD9UZdj05+WkrzZC
	 ifFgWH3i47/Q9x5ALezslvkXg9mHiUHM7ROlvOFvWGQp4p969qZqBNpxPiSbku6Tr2
	 Ydo2wVq2Dwgi4YSpMpkW4lX5zxv1nIp1uGQ2qUbfYEs8M9VP1sELXMT2G3rEOHWtBI
	 vQgi8MzX34cQfcaNBMENsyFwlbqvNCO5jeE5hbOdxo7KVGGojO/CIPGpfM+/raBdPq
	 +LQhXpUb4z8nA==
Date: Tue, 6 Feb 2024 05:53:32 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 8/8] doc: kernel_{abi,feat}.py: warn about missing
 directory
Message-ID: <20240206055332.110fedb6@coco.lan>
In-Reply-To: <20240205175133.774271-9-vegard.nossum@oracle.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
	<20240205175133.774271-9-vegard.nossum@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon,  5 Feb 2024 18:51:33 +0100
Vegard Nossum <vegard.nossum@oracle.com> escreveu:

> The underlying perl script get_feat.pl does not complain when you pass
> nonexistent directories, and just produces empty/useless output:
> 
>     $ scripts/get_feat.pl rest --enable-fname --dir asdfasdf --arch arm64
>     ====================================
>     Feature status on arm64 architecture
>     ====================================
> 
>     =========  =======  =======  ======  ===========
>     Subsystem  Feature  Kconfig  Status  Description
>     =========  =======  =======  ======  ===========
>     =========  =======  =======  ======  ===========
> 
> Let's add an early sanity check and a warning if the check fails.
> 
> get_abi.pl doesn't have exactly the same issue as it actually produces
> an error, but we can add the same check for consistency.

Fixing it is a good thing, but IMO the change should happen instead
at get_abi.pl and get_feat.pl level, as it is a way more likely
that someone will misuse it when running the tools via command
line than when modifying the places where they're called.

> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/sphinx/kernel_abi.py  | 7 ++++++-
>  Documentation/sphinx/kernel_feat.py | 8 ++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> index 9eb7282cc941..52af2750e634 100644
> --- a/Documentation/sphinx/kernel_abi.py
> +++ b/Documentation/sphinx/kernel_abi.py
> @@ -79,11 +79,16 @@ class KernelCmd(Directive):
>  
>          srctree = os.path.abspath(os.environ["srctree"])
>  
> +        dir_path = os.path.join(srctree, 'Documentation', self.arguments[0])
> +        if not os.path.exists(dir_path):
> +            logger.warning("path does not exist: '%s'", dir_path,
> +                           location=(self.state.document.current_source, self.lineno))
> +
>          args = [
>              os.path.join(srctree, 'scripts/get_abi.pl'),
>              'rest',
>              '--enable-lineno',
> -            '--dir', os.path.join(srctree, 'Documentation', self.arguments[0]),
> +            '--dir', dir_path,
>          ]
>  
>          if 'rst' in self.options:
> diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
> index f1c9e4a54964..e0bc6e03579c 100644
> --- a/Documentation/sphinx/kernel_feat.py
> +++ b/Documentation/sphinx/kernel_feat.py
> @@ -79,12 +79,16 @@ class KernelFeat(Directive):
>  
>          srctree = os.path.abspath(os.environ["srctree"])
>  
> +        dir_path = os.path.join(srctree, 'Documentation', self.arguments[0])
> +        if not os.path.exists(dir_path):
> +            logger.warning("path does not exist: '%s'", dir_path,
> +                           location=(self.state.document.current_source, self.lineno))
> +
>          args = [
>              os.path.join(srctree, 'scripts/get_feat.pl'),
>              'rest',
>              '--enable-fname',
> -            '--dir',
> -            os.path.join(srctree, 'Documentation', self.arguments[0]),
> +            '--dir', dir_path,
>          ]
>  
>          if len(self.arguments) > 1:



Thanks,
Mauro
