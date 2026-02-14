Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692981A9FBC;
	Sat, 14 Feb 2026 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771089581; cv=none; b=AY4vaeALnB8vD1UYkCud1Ha7u7BtNgDgtJP8d06h6qdNCJdwWsorSOFEaQxhJAjYAMII5PVszefeL9hYjfHtIOmKZXqH92p6Wxu9AVbC3hXc5sq/meXHf0EQwUb03PczwPzhwvhPXlLiw32zLys/w9oZNDmZqSQQClZe6zVClR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771089581; c=relaxed/simple;
	bh=yqGapZ3QXFbeAXaniAxIGuQHYTtzFjoEiPDSxTjei1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jorsoKavJB94/pX2yjWSFRlYbtBU2311Q4yJpa0OQVzbzVTanVAOGDGX9SjnSvZr+4aVWg6vBKkisPBHoVbI/nSMzI4wNCZ4Fyka7oYIy3UyOQ7T5q9ZAy7qyU/OJFaan6ygK2oPoZ6faDGqUvtDH2wm+l2u1PD5xVH4N4DV1aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aljd6Hn2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aljd6Hn2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 93C95411EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771089579; bh=Q4WnyOnH1ZA632IaUS9uEGNzFCiC5AlyvhabOQbMS9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aljd6Hn2XqYgvpNsJrMZ6EGZUAiwsEMNv7ptl9vL2IPKr+C7YCfI5VoZ2Ibp9xdBg
	 rYiTZS9+GM7oxi5KN270pPWVvNGK5XnubN5JCcKt2+x1qRvHg17xzT8kFCcVB5E8uu
	 kRgwtvBAGcQtjVaCz/lRUoCnP/ZftmAAgyEf535HEjgHi9V4ziRdjU8FwI6T69PSk1
	 NLLJIkenQ8HtB0MkLzdp8Oc0tnVYHOZoxCxfQzZ6ZT4ozlW05LQgiwmSw4BDAel5Fc
	 dYIykdo0qnb5NBcjSzG5+JIqcU+h8hZoYosgbJe5SM3ZiPBrcKdRdrzy55kwpAffFM
	 QUgvDghV8g1vg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 93C95411EC;
	Sat, 14 Feb 2026 17:19:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: b@berkeantar.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Berke Antar
 <b@berkeantar.com>
Subject: Re: [PATCH] docs: toshiba_haps: fix grammar error in SSD warning
In-Reply-To: <b9085090-e70f-46ac-aad0-96da1fc7cdcc@smtp-relay.sendinblue.com>
References: <b9085090-e70f-46ac-aad0-96da1fc7cdcc@smtp-relay.sendinblue.com>
Date: Sat, 14 Feb 2026 10:19:38 -0700
Message-ID: <87a4xbqm39.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

<b@berkeantar.com> writes:

> From: Berke Antar <b@berkeantar.com>
>
> Replace "make this driver to fail" with "cause this driver to fail"
> to correct the grammar.
>
> Signed-off-by: Berke Antar <b@berkeantar.com>
> ---
>  Documentation/admin-guide/laptops/toshiba_haps.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/laptops/toshiba_haps.rst b/Documentation/admin-guide/laptops/toshiba_haps.rst
> index d28b6c3f2849..0226225b82e1 100644
> --- a/Documentation/admin-guide/laptops/toshiba_haps.rst
> +++ b/Documentation/admin-guide/laptops/toshiba_haps.rst
> @@ -43,7 +43,7 @@ RSSS    Shuts down the HDD protection interface for a few seconds,
>  ====	=====================================================================
>  
>  Note:
> -  The presence of Solid State Drives (SSD) can make this driver to fail loading,
> +  The presence of Solid State Drives (SSD) can cause this driver to fail loading,
>    given the fact that such drives have no movable parts, and thus, not requiring

So I've applied this, but ... this document was added in 2014 and has
not been touched since.  I do have to wonder if it has any relevance to
current users...  but the driver is still there, so I guess we should
keep it.

Thanks,

jon
