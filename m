Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FA02931F7;
	Sat, 22 Aug 2026 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787419945; cv=none; b=CBGH84qldBPSBPo5PzFsjMZqlNU9fIIs2YWMlR+ZdG/dVZl6gRMH+98sCZZzpECcb+ekHXAzemPmioDt5UjCx10KN7Lla9i93TD+miVy3hi3yyoJSAP4uIt0Mo53BG+LCenuwboZEw/QXyW0hl6LZZtT+H+Zhj4ONG1UBOytdWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787419945; c=relaxed/simple;
	bh=xHc28KrQxc30rm9iM6s3Y0AH4dD9zjtfRb7qfYwj1Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2szrRTEXTkpCH4UDre3equtsict6QeU/p6VGbUsIKhPgWZ+t8OM3HEbwZnFZYtdQDZdxZH65opbKZp39V7FDJjcj+6Jvhw+yiBqrcDSm8C0A5xLTTwmIoNfJdU4/T7difY/HMXNeiAuLqiE3PXVeFYaRd7UrWz66hLQfQYS3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0IPHHFpP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0IPHHFpP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=M2zYFEeliRMl6kDC8Ji2RXUQX8VTP+OiQNRqQeupaeU=; b=0IPHHFpP5ETOHolyCDlUqdNR5y
	TssoZ+wY4l8zFjOmNGJ3SYHR3ExsFhBErMXNxeJOs3SbVG03wIjDK0R/UVQa2ML7g5Z1n3b1NLy/V
	UG0yNzznLyb3tWWODco8k2oF8pb0N/a96DtYvSDd03j2kORi+02Q2GewToLRYfbHQDqvUTeMzLWK/
	A4I/BcHWn22pm67CAXNh5/yCvKpD9FcE1CcUd1M5zy97MU0OWQbMWTRxgpLEQFqy2g+47XOWN4s5x
	yaM1rf4KXWH617NTeix4XMvGffGeZAjYX4jtWLVOqzTlOeWgpz79Pq/YxHyd5Zu4OHyOLiLNGCLxT
	+b4DbDlg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxpZu-0000000EgrX-47MZ;
	Sat, 22 Aug 2026 17:32:23 +0000
Message-ID: <a77cd90d-c52b-4865-a9ea-fd73129b42ff@infradead.org>
Date: Sat, 22 Aug 2026 10:32:22 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] docs: debugobjects: Fix debug_object_init() name
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-8-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822121651.1559-8-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 5:16 AM, Karl Mehltretter wrote:
> The initialization helper is debug_object_init(), not
> debug_objects_init().
> 
> Fixes: 691cc54c7d28 ("debugobjects: add documentation")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/debug-objects.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/debug-objects.rst b/Documentation/core-api/debug-objects.rst
> index ac926fd55a64a..708775fc581b7 100644
> --- a/Documentation/core-api/debug-objects.rst
> +++ b/Documentation/core-api/debug-objects.rst
> @@ -129,7 +129,7 @@ When the real object is not yet tracked by debugobjects then the
>  fixup_activate function is called if available. This is necessary to
>  allow the legitimate activation of statically allocated and initialized
>  objects. The fixup function checks whether the object is valid and calls
> -the debug_objects_init() function to initialize the tracking of this
> +the debug_object_init() function to initialize the tracking of this
>  object.
>  
>  When the activation is legitimate, then the state of the associated

-- 
~Randy
