Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFB7238D54;
	Fri,  5 Jun 2026 17:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679779; cv=none; b=S+3narQMubt8sSJh9uJXrdHewG/ib9EoFmBfCjBZQV9mWyIIQRjFMIDCG3uZgX1gs9feLGSfkyg3X4d7cF8BRwljcA4b4g37tWZYhK5dCLia0qEpeSRcY0yjBziXIQ7Flc+xD54VniIA25p5Lyz1RHjblpQhz6A3EybIgvLp4bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679779; c=relaxed/simple;
	bh=GO/pgNPcS35lIEodd8jOMUk2pXIF5EHmU8toJli+mcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XKMjrAQzgxS/30/YYWz7aoe2JIeaGjtV7vakMe0kZwhQ0tYOYQrX06k9MvNyjgJ8fA42l5xQpajZPDp/dz52Z2W4WP/tgBY6rJyZQjlptvYA6Np5wpFf+PWLlWZbgfaRzR/+AMxlltgPj3bXJuEyO3q1pRr/a366kYA0eid5OLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dITsftl6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dITsftl6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 93E9740E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780679772; bh=ncz9wEQK+kAlbNfMHWkdTB3ShKTzhLRb40wiI7h9dKI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dITsftl6XEfKiY0eRFyfacquHZ53VQda2XqrjSEEA1zdp97d5hyGDwOUxUNg4SFRF
	 FoPIK5JKLw5lrz5mmDy+dGiVqrLa5Oy/LXT6c+CkOBLkPgDoz1ICGyMH0XeKaAdqbe
	 0LrfCYCD60NehkyvxH5u/7KcU3i8pWW+g1HMnbgBXOH39/k5SvYNberw36xAY+VdTR
	 k+hejf/HdHeVULRtzEaYbFD8gDm2VIp2ZcaKKX0F1KJEA5KRJHhNM6Zq/bqbN3I2A7
	 Drv1SzI/klnBGA6LfG4luZAOjP2SvnmB/My/P8ZuqTv4SqZSEkFcleTVXYqpH3R5F8
	 ygZhxUzQWEWiw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 93E9740E29;
	Fri,  5 Jun 2026 17:16:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH] Documentation: bug-hunting.rst: fix grammar
In-Reply-To: <20260605170851.14096-2-manuelebner@mailbox.org>
References: <20260605170851.14096-2-manuelebner@mailbox.org>
Date: Fri, 05 Jun 2026 11:16:11 -0600
Message-ID: <87h5ngvrfo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Fix two grammar issues to improve readability
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/admin-guide/bug-hunting.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
> index 3901b43c96df..a74ffe2d8951 100644
> --- a/Documentation/admin-guide/bug-hunting.rst
> +++ b/Documentation/admin-guide/bug-hunting.rst
> @@ -63,8 +63,8 @@ Documentation/admin-guide/tainted-kernels.rst, "being loaded" is
>  annotated with "+", and "being unloaded" is annotated with "-".
>  
>  
> -Where is the Oops message is located?
> --------------------------------------
> +Where is the Oops message located?
> +----------------------------------

This is fine

>  Normally the Oops text is read from the kernel buffers by klogd and
>  handed to ``syslogd`` which writes it to a syslog file, typically
> @@ -72,7 +72,7 @@ handed to ``syslogd`` which writes it to a syslog file, typically
>  systemd, it may also be stored by the ``journald`` daemon, and accessed
>  by running ``journalctl`` command.
>  
> -Sometimes ``klogd`` dies, in which case you can run ``dmesg > file`` to
> +Sometimes ``klogd`` dies. In that case you can run ``dmesg > file`` to

This really just seems like churn?

Thanks,

jon
