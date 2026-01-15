Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C412DCF7B;
	Thu, 15 Jan 2026 07:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460415; cv=none; b=dq02X+CUmTB041rgWu0rb5qeMvrQTFHyZEUYX24IgJyy6XPeGTgNMkO162QCxi1EdhooGqDktLEOa3Qq/Wuo+mjk2Ph+nWwTggO8VScy0lG+hEOw/8pAvsYppY2Qtanuw2gRjte9TO2a0konRZv+oJa9keCTYOyH4YBk2FOjsbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460415; c=relaxed/simple;
	bh=fXDFaVAEy2iMcRBsTvQBRvfUDzOzcdo7N0l1qQ+2F1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUEaPjUoZEc7wQUCHdCZskpmXEtNPSmufDKlL/sScUfdwkmsP/dXkmHHImaUiv+Gg0FGdXz4EgFxdMtXaxllE2lH45IhYmAHdHVZBVHtQ04a3CZ0/LdWFOv1gRRIyZMaxDHuuZ313/lrXr1nVn0Rk8kDti3FJg+bVfW6jDjxNQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pB2R2T3Q; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pB2R2T3Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NTnRz1ij4tdNuR51ooUW8vmC4jxIvM98mZ6ixj12ew4=; b=pB2R2T3QvjSJyD6QsW/p/TyO0t
	estJkro/thayemQNSmVU9LnIAxpiHG340Osin0FHydQrXLA03l0ZoLLL2qNbqqRhynARAzk4mAnIe
	NuVvY9f0zLaTkzqdVc19Ww+ksbJIj89OIqLeUL+768hcTfDevFGBRCR+Z/f8EDDLYAhjYukAIpFss
	P1Zg5IIW7G1VRnw9YrceK6q6NzREw7ihRqvSg/g2bqGd5YYeM8z9Pjqx58Rzvc+ZBWvn6gcNX2O7O
	u2MRxQNa8U0wnMJLRxRTgKHv+b7jMyWYpC6qL3zzam+i8RcsucoyAfIj8ffuhHcbUfA607zMBmEHD
	MpLeyD3g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHKu-0000000Bu2A-1HV8;
	Thu, 15 Jan 2026 07:00:04 +0000
Message-ID: <6872edf2-b005-4b8e-be01-b8fa5d17222b@infradead.org>
Date: Wed, 14 Jan 2026 23:00:03 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: docs: Add description for missing options of
 link_power_management_policy
To: Yiwei Lin <s921975628@gmail.com>, corbet@lwn.net,
 linux-doc@vger.kernel.org
Cc: hdegoede@redhat.com, srinivas.pandruvada@linux.intel.com,
 linux-kernel@vger.kernel.org
References: <20260115065341.10230-1-s921975628@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260115065341.10230-1-s921975628@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/14/26 10:53 PM, Yiwei Lin wrote:
> With the kernel update we have more different policy for SCSI
> link power management. Add the corresponding description to
> the file.
> 
> Signed-off-by: Yiwei Lin <s921975628@gmail.com>


Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  .../scsi/link_power_management_policy.rst     | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/scsi/link_power_management_policy.rst b/Documentation/scsi/link_power_management_policy.rst
> index 64288dcf1..e350892cc 100644
> --- a/Documentation/scsi/link_power_management_policy.rst
> +++ b/Documentation/scsi/link_power_management_policy.rst
> @@ -5,13 +5,13 @@ Link Power Managent Policy
>  ==========================
>  
>  This parameter allows the user to set the link (interface) power management.
> -There are 3 possible options:
> +There are 6 possible options:
>  
> -=====================   =====================================================
> +======================  =====================================================
>  Value			Effect
> -=====================   =====================================================
> -min_power		Tell the controller to try to make the link use the
> -			least possible power when possible.  This may
> +======================  =====================================================
> +min_power		Enable slumber mode(no partial mode) for the link to
> +			use the least possible power when possible.  This may
>  			sacrifice some performance due to increased latency
>  			when coming out of lower power states.
>  
> @@ -22,4 +22,15 @@ max_performance		Generally, this means no power management.  Tell
>  medium_power		Tell the controller to enter a lower power state
>  			when possible, but do not enter the lowest power
>  			state, thus improving latency over min_power setting.
> -=====================   =====================================================
> +
> +keep_firmware_settings	Do not change the current firmware settings for
> +			Power management. This is the default setting.
> +
> +med_power_with_dipm	Same as medium_power, but additionally with
> +			Device-initiated power management(DIPM) enabled,
> +			as Intel Rapid Storage Technology(IRST) does.
> +
> +min_power_with_partial	Same as min_power, but additionally with partial
> +			power state enabled, which may improve performance
> +			over min_power setting.
> +======================  =====================================================

-- 
~Randy
