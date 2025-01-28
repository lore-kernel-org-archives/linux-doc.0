Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194BE19755B;
	Tue, 28 Jan 2025 22:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101926; cv=none; b=iqxdoDNLj921ayxGwNRBKPOLaNP2P/DCbtkLfzHcHIGckx9UPTi8akw3BHaFZ9N7On02kPnjajtsEzAmZB9Lz+kL8s48/1q2ngiTg4g4hs29bMws+WDwrYLYEvYo53AySPOYspZxMEILk44T1XC0TtVpMBfQxV9PFBdCfcKN11k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101926; c=relaxed/simple;
	bh=I2jac1lNKSNUcUjnSbK02AorX+Oc3BNAzWXusEwD5JQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bjzAwOe/xaYC/GNXRGoH0SifSau7/lJ1rOrc1NzF5SdR2KscZ0BsQUS/IAV6kFDpEpnEqI8gbUw2Jx7o7ag6BW2Z+OEKIjmbMezQ5WzaKK/wQLvpvE9uZzQDMQWityJSaBlHEX79Z6VRgbWfU/noauKPaWfS57f98wm+M2PFQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lklFLdxN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lklFLdxN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3309B403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738101924; bh=x/+mioitK2qdu9XjiBTUtYN+JgPRREqnf4K6OOH3Vus=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lklFLdxNCHQhj7y0MWJ8pWxtSiQ2jfT5PK6eU8xvBFztzD6WHaa1fOWpLuRWZJrK+
	 JR60ICL5qhsbXc0ycOVOcaw8ehbOBATnkDER/oaTq34gadepNDEmbnSY9ObbblkIeW
	 lJWGIsO08Ruc6QN6N66C6rMeNZVgXsZm2fpRIASEcCnxAkanwYcFEzzltHFxAicYma
	 p7sGy1PEEjQQ1smc8YUvegAW+PrpZn3bHKKbTOOnBOAvQg//QXejZ2KF/5c0qmCwko
	 V1kTzQyUResw78knXulCYfKC59nBdxLIuX6VBFO7KOE6aPhnhE+JvcZ5/dyUXH34F2
	 56ZRj7JLJa/7g==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3309B403FA;
	Tue, 28 Jan 2025 22:05:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Carlos Bilbao
 <carlos.bilbao@kernel.org>
Subject: Re: [PATCH] .mailmap: Update incorrect entry and my email in
 MAINTAINERS
In-Reply-To: <20250125154721.1035737-1-carlos.bilbao@kernel.org>
References: <20250125154721.1035737-1-carlos.bilbao@kernel.org>
Date: Tue, 28 Jan 2025 15:05:23 -0700
Message-ID: <87tt9i7fx8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

carlos.bilbao@kernel.org writes:

> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>
> Update .mailmap to fix a mapping and my email address in MAINTAINERS.
>
> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
> ---
>  .mailmap    |  1 -
>  MAINTAINERS | 10 +++++-----
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index 83837191affb..0768824e9d19 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -139,7 +139,6 @@ Bryan Tan <bryan-bt.tan@broadcom.com> <bryantan@vmware.com>
>  Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
>  Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
>  Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
> -Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
>  Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
>  Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
>  Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>

So I am getting confused ... why not just send me a correct patch for
this file rather than expecting me to apply the incorrect one followed
by the fix?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4006434e0155..f7e70513ebff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1077,7 +1077,7 @@ F:	drivers/video/fbdev/geode/
>  
>  AMD HSMP DRIVER
>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> -R:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
> +R:	Carlos Bilbao <carlos.bilbao@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/arch/x86/amd_hsmp.rst
> @@ -5793,7 +5793,7 @@ F:	drivers/usb/atm/cxacru.c
>  
>  CONFIDENTIAL COMPUTING THREAT MODEL FOR X86 VIRTUALIZATION (SNP/TDX)
>  M:	Elena Reshetova <elena.reshetova@intel.com>
> -M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
> +M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>  S:	Maintained
>  F:	Documentation/security/snp-tdx-threat-model.rst
>  
> @@ -11228,7 +11228,7 @@ S:	Orphan
>  F:	drivers/video/fbdev/imsttfb.c
>  
>  INDEX OF FURTHER KERNEL DOCUMENTATION
> -M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
> +M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>  S:	Maintained
>  F:	Documentation/process/kernel-docs.rst
>  
> @@ -22018,7 +22018,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>  F:	drivers/media/dvb-frontends/sp2*
>  
>  SPANISH DOCUMENTATION
> -M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
> +M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>  R:	Avadhut Naik <avadhut.naik@amd.com>
>  S:	Maintained
>  F:	Documentation/translations/sp_SP/
> @@ -22030,7 +22030,7 @@ L:	sparclinux@vger.kernel.org
>  S:	Maintained
>  Q:	http://patchwork.ozlabs.org/project/sparclinux/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
> +:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
>  F:	arch/sparc/
>  F:	drivers/sbus/

As Willy pointed out, this last hunk looks like a mistake.

jon
