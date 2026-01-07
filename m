Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95FB352FA4;
	Wed,  7 Jan 2026 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767812062; cv=none; b=mXjcHJsDKUZMGr1A+C05nCeD+cKp35isUpb8vNmXsBTwbZ8++Fi0QI3KqdFYEXHw3BM98e9V9yeuFdXfDnfwYqR3J90i7+RpDDxXXAOuaVLpfdJfYV1Dq/4okJN5rFnWtHEj13GQ7/V+2ZliDsCRTk+/uJOBkRPiblWRctLq1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767812062; c=relaxed/simple;
	bh=4oUiglibFG4afDebq+S2P2CesQFe49jxQ2qTxawnztM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LC9e0b/7jkzUQ/kYC7omhwWZEJAAZTXwr9gxJQm7zi7fGCYAZxAqFY30zL9SojHq+AqadE0api+nVTdysVO3Wb7/cBEXGIfVwx1NNc5EHS3fDLKIXIOs4Ajz/wTtzM7wHpqPiLvrROS6/kCjsltRhv9XwWX17/fT76A0AiprUu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UYCXmkKI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UYCXmkKI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uuSJqpZaH2QhA3iIANu4E7xN2malXmvke17n9OdaCSs=; b=UYCXmkKIK+FFoJqcmLQSEeOBVP
	yLg8/B4kpjdrbXH1J/zYC8gu+b0/s7zVldWHMfFPjxK9s9c4rFiFCNUDiiS+XZwZ9VtRnbdtU1BQL
	dXvnbDET5hCrlNu79yXYxPt3ZowrHlGENuxtsL5R7F3oMBTTMc3cp6fuKs1ZKuQ8m9tu9CSfWVXnh
	ROcrZht9x9ZlUPI4jhTF4ttb+oWAVnyJ2FKQWBGfZ9tIBU5FVe/IN1cv7nBojR+fBV7GGx4Tlc++d
	0tXx9YI/OfCXpcEmVj5kCCwrXzXPgCDGfaB5N58QIVULeMXWi3RGA1r8c4vytZLYnPDsFhgkp+xRz
	plZrRg3Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYff-0000000FV2K-03q8;
	Wed, 07 Jan 2026 18:54:15 +0000
Message-ID: <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Date: Wed, 7 Jan 2026 10:54:13 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
To: joaopeixoto@osyx.tech, linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260107162829.416885-3-joaopeixoto@osyx.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/7/26 8:28 AM, joaopeixoto@osyx.tech wrote:
> diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
> new file mode 100644
> index 000000000000..966bb75aa495
> --- /dev/null
> +++ b/drivers/virt/bao/ipcshmem/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config BAO_SHMEM
> +	tristate "Bao hypervisor shared memory support"
> +	help
> +	This enables support for Bao shared memory communication.
> +	It allows the kernel to interface with guests running under
> +	the Bao hypervisor, providing a character device interface
> +	for exchanging data through dedicated shared-memory regions.

Please follow Documentation/process/coding-style.rst:

10) Kconfig configuration files
-------------------------------

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.  Example::

  config AUDIT
	bool "Auditing support"
	depends on NET
	help
	  Enable auditing infrastructure that can be used with another
	  kernel subsystem, such as SELinux (which requires this for
	  logging of avc messages output).  Does not do system-call
	  auditing without CONFIG_AUDITSYSCALL.


-- 
~Randy

