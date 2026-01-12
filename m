Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A165362156
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236074; cv=none; b=JH7f+6LNtadgbPOVhv7+SmvTav+ufJjkJdewn4Mvx9Evgt0NH4xPhWrSO6UVQoXI2Bs1arsy71kuEad/eWH7KE1cCJpbgcwDvGe7skKlYxZXtZQXnKznnjJkfK/yOfFq/qROmhTdqvxljmPxci0XiHC7vEGYW8d7KEsmnOpbcd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236074; c=relaxed/simple;
	bh=eg9OwO/7+Eof8fWU/apRyqC/GxqUZ6yykMrcQj8oVbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ks10smmR2Aw9NCGTDHK7UBu3E3zFSohANgTAcAOBEwEC8O3dYWzXhascpgzuP830uga54wmoQVQiLgW2Bw8ISbyMSWvvBFA1kV+L8W2N8fp51zeORTKrJmk4k7EXGOmOZnSA8UMJUSXTOU5OmrxRFNvZzTkE80K5900slSYi0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ETSQ3pfe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ETSQ3pfe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4F84240C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768236072; bh=gOkcyIxg+e2795XtCf4OxcPw1bJPhmUFUxb1/1cI0pI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ETSQ3pfeM4kw5qtiz5SRgOdTLiQtGjmclbM+TP7YjqmUo4qbPoty2HHDuMFUmW91u
	 dgDdHMXkY3VKFcNQuHbzH6mgh9UESYIH1AVhoAAvQ5pBAo72/29RaMBA7yhwSThwR5
	 8Ts0JB/TLU3X5CcBBBHX1kam/jwhPRnnhCofNL8m0DHnCmgVEGKQYaSz6n0zokM04T
	 zisS80o1xSnj/tfjJS/K+QeZH6sQgnhg14sDJWeDP4wl0dUVI8z9JJxhj7Dl4vl08M
	 8wCFl/xMBZmYUkCiMwwsAkA21jvF4cTn3EunwV0VMQWFJcarsc0UBWRL/fAEvx+Rrq
	 xrvTLVlvOHE3Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4F84240C42;
	Mon, 12 Jan 2026 16:41:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Vorel <pvorel@suse.cz>, linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Michael Kerrisk <mtk@man7.org>, Alejandro
 Colomar <alx@kernel.org>, man-pages@man7.org
Subject: Re: [PATCH v2 2/3] Documentation: Remove :manpage: from
 non-existing man pages
In-Reply-To: <20260111233534.183272-3-pvorel@suse.cz>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-3-pvorel@suse.cz>
Date: Mon, 12 Jan 2026 09:41:11 -0700
Message-ID: <877btm2388.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Petr Vorel <pvorel@suse.cz> writes:

> Removing :manpage: from non-existing man pages (xyzzy(2), xyzzyat(2),
> fxyzzy(3) in adding-syscalls.rst, including translations) prevent
> adding link to nonexisting man pages when using manpages_url in next
> commit.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New in v2.
>
>  Documentation/process/adding-syscalls.rst          | 14 +++++++-------
>  .../translations/it_IT/process/adding-syscalls.rst | 14 +++++++-------
>  .../translations/sp_SP/process/adding-syscalls.rst | 14 +++++++-------
>  3 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
> index fc0b0bbcd34df..1f61d0b114120 100644
> --- a/Documentation/process/adding-syscalls.rst
> +++ b/Documentation/process/adding-syscalls.rst
> @@ -111,7 +111,7 @@ should use a file descriptor as the handle for that object -- don't invent a
>  new type of userspace object handle when the kernel already has mechanisms and
>  well-defined semantics for using file descriptors.
>  
> -If your new :manpage:`xyzzy(2)` system call does return a new file descriptor,
> +If your new `xyzzy(2)` system call does return a new file descriptor,

Here, once again, you're retaining the backticks.  If we need to mark up
those references at all, they should be ``literal``.

(If you simply remove the backticks, you might run into conflict with
automarkup, though I *think* that the section number will evade its
regexp).

Thanks,

jon
