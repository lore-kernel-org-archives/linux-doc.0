Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA13793A9;
	Fri, 12 Jun 2026 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292275; cv=none; b=F8ImUfRTbrThmG26zZfXE6uYU7ajjo/Cjv//gl41HzSQJHqee+BTyK+W9XwuHyCC1ZNtJEFdn8cWz+NoR4L2+VAVkkmG/NXRr9Ml8Tlsaq4erPL6RoU6ZejSan3rb/Xe306H+Vm+NcyR7szj5S82cfjRO+Ysxr514jKTrQAs+3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292275; c=relaxed/simple;
	bh=bROSqV3TMApAupD6IHuX4UEzK6o7OAIIUQ3bqTshy8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HfzfZzaTptkygDNccw8qcJGveKRXON3uQRZnjadSIGDWgXrOR/jjoG7QyNYWQBUo6Zcfipiktbb0GCgFrf2cTaMTFCLazZay/d0qNk/bOpMKIzRNlikj6NlAY4K/TZiP3XnVATuHhimFej95STJ+U6c3S1ItA6Ckbxc146Ekffo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EPSAibUQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EPSAibUQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2DD3340E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292274; bh=XiDH0YWgv6JyQDjAQR39mWCnvtc8vvQROoCXChhCMcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EPSAibUQp+HMhZAT3uvpEEV2hVpZt491NxLeQ8PZ9bmqqXy/99CUiuDNQLBYWQl35
	 6+S9fOwAFArgQcQENvZvO3YfKT5ch00yi1nRY9T67gfBriQfXKMJA/CCfbTcW++c4s
	 krrtZJjaKp8jibuH41ebiufcE8TE2mYYYHnXoQt+NxrmLRd/CzcI7QFgFXP2YRpBXu
	 6490jU5zr6ZkxmVMuktMt8aD60t8NCKxEqY6QaCI/iSfnNVTg2vLBviTynjZPUt89N
	 6oNbZeqffI8g84PwAfYnKePur7Soyqllei8C9b56u6SRzPThKcV27ziklEbTfOk4+N
	 wEkZpc2sSncFg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2DD3340E4D;
	Fri, 12 Jun 2026 19:24:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v2] Documentation: bug-hunting.rst: fix grammar
In-Reply-To: <20260605190055.15921-2-manuelebner@mailbox.org>
References: <20260605190055.15921-2-manuelebner@mailbox.org>
Date: Fri, 12 Jun 2026 13:24:33 -0600
Message-ID: <871peb7ea6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Fix a grammar issue to improve readability
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/admin-guide/bug-hunting.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
> index 3901b43c96df..642bf8474726 100644
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

Applied, thanks.

jon
