Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3651B277006
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654513; cv=none; b=p1yiMiM3O2LGgF+8/+zYTsJVW7HTEfq55ZyGrfXJNOs/D8HqcoN853lzIPlyeiE+cWN64YRNXiXPw4ElaN1HWpd8bruNC1gRwgMqVdFJmNnKdV0bQR8CfjmlQSOBjeCpsm2TYymPATikiY4NRzOVuJsdrHPIF1bEORgKnpBfnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654513; c=relaxed/simple;
	bh=eu9rWVlznA/C2vswdguAQyQ/0svrmPWXDeC+Fw0kykQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M5gwFIcSNN1RUoRaZ3EvAnS/eoJHz4axqk8qFVeGq1PxxCzyS64heOQWSKQjWIZ/pj/q3/JmPWuDV3IKFyddgIMmoouBqPxYkOmoE2Tn/0npPL/2YWbdJm+o0yy7S4aCtbyO0+XBeQFnIQYbjAPEUjYUjdW6ZLjbq2SHm2mNSgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Hx8wKJma; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Hx8wKJma"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 481F141086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747654511; bh=rC43ctk3JgjFsdCSePqHwMZ8viwNN7FFEhe7VqOcA+E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Hx8wKJmafxprU76vsy0oROS8sec/4ZvLev9ld8LX27lokXPk0+d20kHJflIaWWVaX
	 Tv0K321QQczUN9alXNDBi9i+8jcYEdtry5GFslr6CBiqiuhF40DRaaHT4GSU6B+lC+
	 LnwiGUYyXIYzEEoVOmyPWjWpOF3tDf4juGxZyyJzgkHC8jA9fEUB0+t28jMVwypXTG
	 NzQEIGHFKQqQKSkk2uPdAMmb4XgajdngrlF1IWifmxiBQ5RrHgvIZ8IujbzZYF+8qT
	 yV301vax8+wlR4PsTzqbyIJqnFaS0g23o/SxE/QuXryd8E8TEQ5xS3X5fBQd1dhWWw
	 MQWEnY2PyQwKw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 481F141086;
	Mon, 19 May 2025 11:35:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Anish Dabhane <anishdabhane71@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
Cc: Anish Dabhane <anishdabhane71@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Fix spelling error for 'parallel'
In-Reply-To: <20250518140107.21310-1-anishdabhane71@gmail.com>
References: <20250518140107.21310-1-anishdabhane71@gmail.com>
Date: Mon, 19 May 2025 05:35:06 -0600
Message-ID: <87sel0kf4l.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Anish Dabhane <anishdabhane71@gmail.com> writes:

> Signed-off-by: Anish Dabhane <anishdabhane71@gmail.com>
> ---
>  Documentation/gpu/rfc/i915_scheduler.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> index c237ebc024cd..2974525f0ac5 100644
> --- a/Documentation/gpu/rfc/i915_scheduler.rst
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -26,7 +26,7 @@ i915 with the DRM scheduler is:
>  	  which configures a slot with N contexts
>  	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
>  	  a slot in a single execbuf IOCTL and the batches run on the GPU in
> -	  paralllel
> +	  parallel
>  	* Initially only for GuC submission but execlists can be supported if
>  	  needed

The patch itself is fine, but a couple of nits that are worth picking:

- Always use scripts/get_maintainer.pl to see who you should send a
  patch to.  It should have told you to include the DRM maintainers on
  this one, since they generally handle their own docs.

- It is also a good idea to look at patches for the subsystem in
  question and match their subject-line style.  In this case you would
  see examples like:

> 0454a490bdeb drm/doc/rfc: i915 new parallel submission uAPI plan
> f587623b78ff drm/doc/rfc: i915 GuC submission / DRM scheduler

- Some maintainers will never accept patches with empty changelog text.

For a patch like this, none of these are enough to ask you to resend,
but issues like that will get in your way for future work.

I've applied it, thanks for helping to make our documentation better.

jon
