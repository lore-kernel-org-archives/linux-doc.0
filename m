Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FB2D191C
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 21:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766440708; cv=none; b=WCt0uJfqidBrN8Ya0nARPEfGRbT8LvfHGo5Hmu8eQxiFlTXcnd4dribNeJ4u43iw61fOZxkx/N20/XqYmagUbrs3zSszT2d6VEmCFbeszzjCINYUmOg9wh6qEtWs9f9VMoy4ujWvDmAy9BIj6tma+fvBxyDWctZ/Ge+/T4WQvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766440708; c=relaxed/simple;
	bh=5/cjd6i6OA2p4NKVtgLXpdbd6k2YcK9PApB3lbSbt2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VR+E2V3voHLiN6/v7zqqdq1dMuw1YxcMVTS+B4NG+JSshTOhAOAxtA5cnYrvjLUQalqIJKUqYdCkK2qTfDrWZZpCDrJp5Fq730/11UtPK/Wg1vqGG7B3WjKuOgpFkFBB7n0aTfSlTC5ViFD8GRzoCVih5vbNZBOVqCbBZDLQq1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MSx6oTqs; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MSx6oTqs"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 266684040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766440706; bh=3TNY9QbUJbDRzZVuMo0rQRSG7pIQr4IrBzCuOzge5WE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MSx6oTqspl2aXUI9ePFp03PlCwbJyDGDQYzwCKIpoiqY4Zcb6HyaXzOxvdqw64x8L
	 QgXI61nWugKDLndIQ4XCN+IE5Bx4eN4we2chsEiPV6xD7xoHwoMu2sOjvdBOBzOFR6
	 cMpMFYMwfZj7Co5wpHbQH6tDJMDLAXxO0oC7/Xm03nfPTCLWHSRUGJgmvGGlZ4xhCL
	 Z4gmGD58t/jVIxCMpStX/M6WCzCMxx30QBLRyPNpN6J5ciaFGwLF1XSOvQWVt10zZR
	 8INsqq6OtjC1KYmyanOt9OMnqbd6t8toWPs4E9qRr+zaHhOFvQC0wiP0FSEj6qLr26
	 3UiK2lli0eogQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 266684040B;
	Mon, 22 Dec 2025 21:58:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Max Nikulin <manikulin@gmail.com>
Cc: linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2 2/2] docs: admin: devices: remove /dev/cdwriter
In-Reply-To: <3d7f473d-174a-488c-8852-533b8a81c58e@gmail.com>
References: <aSuj66nCF4r_5ksh@archie.me>
 <3d7f473d-174a-488c-8852-533b8a81c58e@gmail.com>
Date: Mon, 22 Dec 2025 14:58:25 -0700
Message-ID: <87jyye18n2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Max Nikulin <manikulin@gmail.com> writes:

> Remove /dev/cdwriter from the local symlinks table and change the
> related note that this alias was removed long time ago.
>
> Creation of the symlink was removed from udev in commit [1] that
> became a part of release 115 in 2007 [2].
>
[...]
>  
>  For SCSI devices, ``/dev/tape`` and ``/dev/cdrom`` should point to the
>  *cooked* devices (``/dev/st*`` and ``/dev/sr*``, respectively), whereas
> -``/dev/cdwriter`` and /dev/scanner should point to the appropriate generic
> -SCSI devices (/dev/sg*).
> +``/dev/scanner`` should point to the appropriate generic
> +SCSI device (``/dev/sg*``).  In the past the current CD-writer drive
> +had the ``/dev/cdwriter`` convenience symbolic link to a ``/dev/sg*``
> +generic SCSI device, but its creation was removed in ``udev`` version 115
> +released in 2007.

As a general rule, kernel documentation should describe the kernel we
have now; if we try to fill it with all of the history of what once was,
the end result will not be pleasing.  So can I get a version just
removing the obsolete material?

Thanks,

jon
