Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405463;
	b=HwCKYmt4hlGhobHPfvtcAAb13tDGS5ilq460WRef5e3PmLsJZ1osz5UanYRN2iJt319s
	 FfBRcfKPzu3R1X8NKQJf3PGsH67mC++ijMibDCaQlIc5us5WZ+VQ6zdfvsNLUrvOBdEtk
	 b0Bahcadkac2LMTRBSSo1PmsofWr+FOabwDbA4eK1yug6c6Dd4ROwO8oD9KJH0Io1bOop
	 CEC8+6dkJ0qcvFFOe7TjKJGaVXIB+UaCaoCiUMT0Cjxh/v/nzEdcj+HwXSEZlZiCWpxEw
	 D6TGWynI7u+CjUBkjE27ySaXju/BQDy7OZlBZJHnLY3VnOY7ky2y9AVKnEvi1+hbMJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405463;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7OayvwVyWzvQMLzg/8vpv2bnMtoPYxC0zzH7bx4Z0mw=;
	b=irWfgos4BnoojnjNbd4wfS7MRn3t0ipbyXtfHJLUU66UMRu9EUfcJeYNpotYYeSNSbBI
	 1TJxA0WJ8SHbZYLMTkBLxZUzrw7/d689DPWxz7+18fjg8NU/5vdTnaeKOmigdMRq9GZ01
	 lFrVT7GRxeTZKlMSHm38sH0IQsoDugjvUAwgorNiPDwKNxYQZSTVbj3B6FLrTZ81S/Cmu
	 TO0EqyuCcLXyBltq0Lk6gJOwjykDP+QpuuhqpTiSYQLZ2da2XNb+9re/Rt3uYcl5MoomD
	 3tQBXP6RkS/6SVxZhHtB2M7wR2bv9eOQ1IHTE0hQJft7IHvrbDUQ3gwLDtrH+A/zk0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EYJ8OI+F;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7068606A32A;
	Mon, 23 Nov 2026 03:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7068606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EYJ8OI+F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=7OayvwVyWzvQMLzg/8vpv2bnMtoPYxC0zzH7bx4Z0mw=; b=EYJ8OI+FZeTd0crTdpMiICTDuZ
	p06P7u+mzxsjicmUgAaKhTC8Q0szL8Lykwpqojelp2s6aL0jg1guxJpbdtBHGk43GK29486lnpMXy
	yDrTcRxSo+8n6opOEyhilDiQup5i4Ps0HvWLVmBU3sj4i9Lr9nyjGWEGWmS3K+fEbga44pMU4P4tB
	V+Cj3+f5lRMElmKfFLm7EI/+AEUwMTpiTQFSmguh+66xubrCOsobnbVqjz8vD9Bc6mTBkTnQWhfE6
	LWXg3MNWISmWYrA/YipiWncJGHvSH5h7TqKnABthDWqcvUujmneFzlDEh6QLGR8KklSg8QBE3xvZl
	j0cQP2yg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKyQ-00000002EHf-1edv;
	Mon, 23 Nov 2026 03:44:11 +0000
Message-ID: <0cc7d474-adf2-46f8-bd4f-f352696313af@infradead.org>
Date: Sun, 22 Nov 2026 19:44:09 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI
 path reachable
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
 skhan@linuxfoundation.org, james.morse@arm.com, rppt@kernel.org,
 arnd@arndb.de, kmehltretter@gmail.com, dapeng1.mi@linux.intel.com,
 elver@google.com, enelsonmoore@gmail.com, bp@alien8.de, jlayton@kernel.org,
 catalin.marinas@arm.com, sean@starlabs.systems, will@kernel.org,
 jonathan.cameron@oss.qualcomm.com, tzungbi@kernel.org, kas@kernel.org,
 steven.price@arm.com, chenhuacai@kernel.org, tzimmermann@suse.de,
 wenst@chromium.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, vladimir.murzin@arm.com
References: <20261123033222.1067923-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261123033222.1067923-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/26 7:32 PM, Jinjie Ruan wrote:
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 176648941aec..9a3ce8ed18f4 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6958,6 +6958,14 @@ Kernel parameters
>  			1 -- enable.
>  			Default value is 1.
>  
> +	sdei_nmi.disabled= [ARM64,EARLY]
> +			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
> +			path in place. Requires the kernel to be built with
> +			CONFIG_ARM_SDEI_NMI.
> +			Format: { "0" | "1" }
> +			0 -- enable (default).
> +			1 -- disable.
> +

Alphabetical order, please. Entries are a bit messed up in the s* world...
Please add this one between
	scftorture.weight_all_wait= [KNL]
and
	sdw_mclk_divider=[SDW]

>  	serialnumber	[BUGS=X86-32]

-- 
~Randy

