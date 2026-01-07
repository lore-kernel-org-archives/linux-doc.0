Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE295318EE2;
	Wed,  7 Jan 2026 19:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814619; cv=none; b=ZKrI9Q+mkHSnXfqkfVSlsL6JdP5De5rnITvurAfCLKyam9a1BmU/LZ3pIMCDs5Xx5DF3VQ22ktEEMjZxAGp3jLE0CxmOe+4MYQUaVUP708HpcbdwYfXQRxgXxJ0yTQjMGV92eacuIvADkJd2Gt4sfhhHiULmSIBBO0wFP3essNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814619; c=relaxed/simple;
	bh=wGXfb/h9dHEqo4OYJ7lobK5I8Wv+t9L3leil/n6O8Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=douE0pnH0foA65pcU+tP75Hj4R8FSTocxW4f8o5peN/qioostXWtp1ywfECVmTmPX8eCUBWgeDyaTlL4lCE+fI6OGQUUnIvOa1neW40Cw2AVIZ8rwqfHZixCJvZfRq56CbYzN1ZeafKmqmqvGwUpMAcABR8R4F5LaKLKg/tfwMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IgJxdSAe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IgJxdSAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0753C19422;
	Wed,  7 Jan 2026 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767814618;
	bh=wGXfb/h9dHEqo4OYJ7lobK5I8Wv+t9L3leil/n6O8Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgJxdSAeZ/7+lfhqGZ9rBlTXNIozisFIcAkxXqUcopcqhT47BBzZNAXGHXN2S1cuz
	 sE3S/4D8e2LgW/CFYURXyeLn59O+LRgHFLBPpDv+3F5osve2zP01H3o5Q1WQsnXmQw
	 djJgIz4O/wMvzdiDAuqVNLsW2SkI8XFnTtMPhuCo=
Date: Wed, 7 Jan 2026 20:36:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bagasdotme@gmail.com,
	catalin.marinas@arm.com, conor+dt@kernel.org, corbet@lwn.net,
	dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org, dev@kael-k.io, haren@linux.ibm.com,
	heiko@sntech.de, jose@osyx.tech, kever.yang@rock-chips.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org,
	neil.armstrong@linaro.org, palmer@dabbelt.com, pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
Message-ID: <2026010704-heaviness-quality-f543@gregkh>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107162829.416885-6-joaopeixoto@osyx.tech>

On Wed, Jan 07, 2026 at 04:28:28PM +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> Move the IPC shared-memory hypercall ID from architecture-specific
> headers into include/linux/bao.h.

That says _what_ you did, but not why you did it :(

I have no idea why this is needed at all, sorry.

> Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
> ---
>  arch/arm/include/asm/bao.h           | 5 ++---
>  arch/arm64/include/asm/bao.h         | 5 ++---
>  arch/riscv/include/asm/bao.h         | 7 +++----
>  drivers/virt/bao/ipcshmem/ipcshmem.c | 5 +----
>  include/linux/bao.h                  | 3 +++
>  5 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
> index 5ece9ecb1455..7d13591fe669 100644
> --- a/arch/arm/include/asm/bao.h
> +++ b/arch/arm/include/asm/bao.h
> @@ -16,14 +16,13 @@
>  #include <linux/arm-smccc.h>
>  #include <linux/bao.h>
>  
> -static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
> -						   unsigned long ipcshmem_id)
> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)

This does not match what you said you were doing in the changelog :(

