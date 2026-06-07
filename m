Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFBA175A91;
	Sun,  7 Jun 2026 00:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780793460; cv=none; b=n3vAzeWqD3Aod8n5wHYfCJ7Rl1ugZl0ycSl472+PYfrv9AJNEBlPESH3gaHrYlb51dYDGzEqno6j7EV/u+jAEh/496iwPtyx3gdAsDrQKkt0PhA4w/M0jhOx7t3sLb5zGSrw6SWl91h40iHQNDlM3pGXO71jiCdyaWOPHqRVbiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780793460; c=relaxed/simple;
	bh=0X47tu+dMiH9XQzKE5bAFNNUDDOJU2Zt2qW6tbg+l7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XhL9FCBcYLKQ62+yhr5FRO7u4NL8TROChWu0diOLPncK3qu02zdKaA3aKkYErz8K0MPihTUvvFjKVd+PGzGrakONrsjce9gsCUojPcA8P28fM6IkLHVj0BLMJo3qIxfV8jGmagHBjdWa5Q1LrzaYxAoPij1dOUNjwyHSQji2AVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMmoJEjK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMmoJEjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE571F00893;
	Sun,  7 Jun 2026 00:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780793459;
	bh=DBgS/IeCcJwTQBGQhv8ELU0KEo6N/7Ws5o60dsxB8Lg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=oMmoJEjKw0xCvmUahHG0oLab5Eko7Yg5SUOvguR1eJIvYLSbU2gIlU6BcJFcwHYan
	 FVn+47gECBhDwEf9tPwwPOVvYyLYYtrIyC/SKX0byIMM6xIJbu8dG17qfUQxbIZ93K
	 vLwLtjIrxtVmu0rS9AyoRrEUyJ11D/F/7H+DJOG4K7+D5mm3A0n2qGDdIImKHBxvOr
	 DCflpYTRgLkT0bBZbAoFuNjgaNhwitpR41+syjrxajpnoXUbtgdbKgG0qBzUG3BXXe
	 JT9m7pyLIIv7RXy9uLCMHITotL78jY+A6dTNKzSuilhtMF1luPnzn8iM8UIKCbOPOT
	 Ef63FyHb+7frA==
Date: Sat, 6 Jun 2026 18:50:55 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Miquel_Sabat=E9_Sol=E0?= <mssola@mssola.com>
cc: linux-riscv@lists.infradead.org, corbet@lwn.net, skhan@linuxfoundation.org, 
    pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
In-Reply-To: <20260605141247.253315-1-mssola@mssola.com>
Message-ID: <f63eefc9-769d-409c-4099-274254432129@kernel.org>
References: <20260605141247.253315-1-mssola@mssola.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-331715424-1780791531=:1833245"
Content-ID: <4f54938e-d337-ae77-26a3-588b02bb1cdf@kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-331715424-1780791531=:1833245
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <d56e784a-c6ea-d849-a556-126111a2ab60@kernel.org>

Hi,

On Fri, 5 Jun 2026, Miquel Sabaté Solà wrote:

> Support for atomic Compare-And-Swap instructions has been in the RISC-V
> port of the Linux kernel for a long time. That being said, we apparently
> never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
> Kconfig, despite having all the framework to support them.
> 
> Signed-off-by: Miquel Sabaté Solà <mssola@mssola.com>
> ---
> This is a resend of [1], rebased on top of the latest commit from the
> for-next branch.
> 
> I have built this patch with multiple configurations and ran it with KVM
> (the VisionFive2 board that I have lacks the needed extensions). All seems
> to work, but I do wonder if we did not enable these for a reason or this
> just slipped through. So far in the code I believe everything is in place,
> and I haven't seen any commit in the git log stating otherwise.
> 
> [1] https://lore.kernel.org/all/20260220074449.8526-1-mssola@mssola.com/

Thanks for the patch.  Your comments above are why I've been hesitant to 
merge it.  I'm not aware of any publicly available hardware that supports 
Zacas/Zabha.  No one has stepped forward to provide any Tested-by:s on 
hardware that hasn't been released yet.  You mention that you tested on 
your VisionFive2 board, but it would not have exercised those code paths.

Of course, we already have Zacas/Zabha support, merged back in 2024, in 
cmpxchg.h.  I assume (?) that it was tested in QEMU, but I don't see any 
comments about that in the patch series.  No one sent any Tested-by:s 
then, either.

It would be good if you (and ideally others) could put this patch through 
some testing on QEMU with Zacas and Zabha enabled, before we merge it.  
The affected code paths for HAVE_CMPXCHG_LOCAL seem to primarily involve 
per-CPU counters and MM zone counters, so those would be the areas to 
focus.  HAVE_CMPXCHG_DOUBLE seems to do nothing useful other than 
preventing the AMD IOMMU driver from being selected if it's not present, 
so that part of the patch seems fairly useless.  In fact I'd suggest 
dropping that from the patch and just sending a separate patch to remove 
HAVE_CMPXCHG_DOUBLE from the kernel completely.


- Paul
--8323329-331715424-1780791531=:1833245--
