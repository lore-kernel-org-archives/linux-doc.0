Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC24BC030;
	Tue, 19 May 2026 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193608; cv=none; b=ikphtNHjTPkIRmrGKKRsfa/cJ01lXftG//ojDP7J0O+XUHWxmaX5m4BI3mHgV3LewOL7LNASGRANg5mpBKWbT8t5DsE3Eju+jceZQvURYKDQpp98bmRYuS14R8m3KAixFDO01GaSIkS2qjj8+ZTlujmfenz7qSyvDjsy7psFmF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193608; c=relaxed/simple;
	bh=mRba9h2gfvXWw5pBqvzT+wX9InA2J38+IlZ4u6dwt8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8iurokPAxRCh6jOgjrXUZ1TVhuFL1sgcdUfjjNHnU8vi42r5FHXF8UabX1DvnrjQTYhQ7dH7ZC5MzbeelXLigIzwHDAvOlVITPvHXadYvYOVnrOuYe1ULsODwPFfaySMwC2cAk/3Oe7X6SIcbCcbp+kCp61vwmN+c0r6v49VEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=GYp3AcZJ; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="GYp3AcZJ"
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 43AB814C2D6;
	Tue, 19 May 2026 14:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1779193603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n96hixq1CKIOyyia02VL4n7Ha7jZSPQbAVaxVmHdhVc=;
	b=GYp3AcZJOKPiNX0Ate2YF09BFlIDEEb51ldjcIKFo2xdSBc6ceWn79kihimAYeNTcFilGi
	QQkgQHR1ZwboXxwm7C1jXxI6AuggT0YVEdJJhvvQpWHOBPx0Lxqsi219BcQFYvQumPTj6Q
	feQ5c7nG2aVnpGPQlfiQ+JYr3+p17+SoGeF+z9g+A4lDA/IFqSuALAfgD7f80S4d3njkst
	MvadhpZWQKYEb1PRF4zY0eDOSjfYnw8/KgZhWEaU3Yg7tvkWC/14NOu49mSmLAnybO/zzP
	0BHj1jQ7kOQ88GoOq42tPXEW1qjk1poRcIS/dnICmPKygz/KysZ5EO907MvvdQ==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 3d4f33a4;
	Tue, 19 May 2026 12:26:39 +0000 (UTC)
Date: Tue, 19 May 2026 21:26:24 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: ericvh@kernel.org, Aayush Patil <aayushpatilsch@gmail.com>
Cc: lucho@ionkov.net, linux_oss@crudebyte.com, corbet@lwn.net,
	skhan@linuxfoundation.org, v9fs@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/filesystems/9p: fix broken external links
Message-ID: <agxW8An7fRApCY1r@codewreck.org>
References: <20260510182856.17569-1-aayushpatilsch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260510182856.17569-1-aayushpatilsch@gmail.com>

Aayush Patil wrote on Sun, May 10, 2026 at 11:58:56PM +0530:
> The xcpu.org links for xcpu-talk, kvmfs, and cellfs-talk are dead
> with no archived snapshots available on the Wayback Machine, so
> remove them. The PROSE I/O link redirects to a dead server; replace
> it with an archived version from web.archive.org.S

(I assume the final S is a typo here)

Eric, it looks like you're the one who added these links, would you
happen to have a copy around if you care about keeping these?
Otherwise I'm not sure of the value of listing the papers without the
actual files available, but I don't mind either way.

I agree dead links are of little value though so will pick this up if
there's no reply in a while

> 
> Signed-off-by: Aayush Patil <aayushpatilsch@gmail.com>
> ---
>  Documentation/filesystems/9p.rst | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
> index be3504ca034a..65809a1dad21 100644
> --- a/Documentation/filesystems/9p.rst
> +++ b/Documentation/filesystems/9p.rst
> @@ -23,13 +23,10 @@ the 9p client is available in the form of a USENIX paper:
>  Other applications are described in the following papers:
>  
>  	* XCPU & Clustering
> -	  http://xcpu.org/papers/xcpu-talk.pdf

I found http://mirtchovski.postnix.pw/p9/xcpu-talk.pdf but I'm not sure
if it's the same file

>  	* KVMFS: control file system for KVM
> -	  http://xcpu.org/papers/kvmfs.pdf

Looks close but perhaps not the same as
https://www.kernel.org/doc/ols/2007/ols2007v2-pages-59-64.pdf ?

>  	* CellFS: A New Programming Model for the Cell BE
> -	  http://xcpu.org/papers/cellfs-talk.pdf

Couldn't find anything fo this one

>  	* PROSE I/O: Using 9p to enable Application Partitions
> -	  http://plan9.escet.urjc.es/iwp9/cready/PROSE_iwp9_2006.pdf
> +	  http://web.archive.org/web/20110101152020/http://plan9.escet.urjc.es/iwp9/cready/PROSE_iwp9_2006.pdf
>  	* VirtFS: A Virtualization Aware File System pass-through
>  	  https://kernel.org/doc/ols/2010/ols2010-pages-109-120.pdf
>  

-- 
Dominique Martinet | Asmadeus
