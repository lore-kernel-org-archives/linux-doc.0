Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC544B663;
	Tue, 30 Jun 2026 19:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847815; cv=none; b=exjI9yMAP1m3BjXV64uGfSqMJbnFYNWGRPpIXBV/ihyDpqlX54CN2GSPFCESBAQSrqD192H3eLl6aGWNrdWG7xJts7/qbL9Ue5zBSIboTYELvxkHQ4Kgz29hZNphKxkGwn4Scgl5ZLnqvVzKI/e4I/6WrzAMpbUs2yn94PGzyBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847815; c=relaxed/simple;
	bh=wspRHTX2FR7plNDt2wLtIVhOqbNxzr8uW2Tj1QTWKEY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SKxBmvsZ4VLmFPkNmSGikMyRpFdVIpgNPOaYiPZoxIZkmSGRYzfw4242C0FAp+/Cl2Fo/C9TneyCbCh7XGfT5ARjaXZcx//pwHUwDPKRwZw5ejM/Qh1SUwPWgqOxEpr8edpwBEBM+ldgu2xbjm7zM8H3bPfOPJ4yrieI4ilGRYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XtYDjScO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XtYDjScO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 23E6740E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782847813; bh=lyzqaYQv1/NaoJz0+Cf9D5exn0gN0Fivr9KNrejNWoM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XtYDjScOGMFz8Xaap/WhUjOge0CoqCaaFBCREEG5yBTL3Cr/orVnu8NAwEz+bRaOO
	 lbsoSrZ1dixNpF+wgMeCHgdOG5UBgu3p02gv5cPqrq430xxNC/ubmgkANFUkX3GdS7
	 9t4QOu9Gdz41VaM4175WITnoJR7+4ww8afW9HGZEhjKq9VJc+kgz99ksOrig7nm78i
	 a2JWjIOHuYxx3SqfsEVmJw4W2WCyy9Jl/u4s59s4vSf7WSnGyOhF2WnLcy7qpXquWa
	 7tndLrxspBpWgTePoZyTzofWHP0aa1Ln0wHK66KzAaD5WbMEBTkbxRrrPunsdxHKH2
	 g7Eq+Up7g3/Hw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 23E6740E27;
	Tue, 30 Jun 2026 19:30:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Vlastimil Babka <vbabka@kernel.org>, SeongJae
 Park <sj@kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v2] docs: kernel-hacking: fix typo
In-Reply-To: <20260629152912.86500-2-manuelebner@mailbox.org>
References: <20260629152912.86500-2-manuelebner@mailbox.org>
Date: Tue, 30 Jun 2026 13:30:12 -0600
Message-ID: <87h5mjsu63.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> 'GP_KERNEL' -> 'GFP_KERNEL'
> Remove trailing '`' without clear purpose
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/kernel-hacking/locking.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
> index c969c76ef7cb..674475123593 100644
> --- a/Documentation/kernel-hacking/locking.rst
> +++ b/Documentation/kernel-hacking/locking.rst
> @@ -1317,7 +1317,7 @@ from user context, and can sleep.
>  
>     -  put_user()
>  
> --  kmalloc(GP_KERNEL) <kmalloc>`
> +-  kmalloc(GFP_KERNEL) <kmalloc>
>  
>  -  mutex_lock_interruptible() and
>     mutex_lock()

Applied, thanks.

jon
