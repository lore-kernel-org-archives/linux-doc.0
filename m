Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887192236EB;
	Thu, 15 Jan 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458886; cv=none; b=HBCXvHto/mkPSbRY/7B592k7i3zcMi+tJxPSZIZtPtduufNBnQ0HWCAjMST/qe1gqIaE4YdJVQx3g9PtXPtCuvWL7JKO5RVBxi3yv5ATnEY5O4JIHjlqh2GLi9zYhzzo31iE/p2ze4s5TKAgELzh283Qsz0cpQTI3HS8nCBrn2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458886; c=relaxed/simple;
	bh=mv94Uf47wLc2p2uUkPIInSKkBvPpEDMBknx63iRR++c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBvYpRwLgEjGIC9IMyXaeZOfwXpPUKGlGCSk5HCDtkhWfJO8A8BYn6j6Pb8kXZxt1kvG/U9seiTlXL2B23rZWRCV8jdyIESScQNcrPRKMxS+9eycip4k+iKgQQi9n0dDhIcE5Y4T/SqViupSnRngoPY5R8vLkmoSYdiN4sMPE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=t1Sy1xB5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t1Sy1xB5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=FelXLJKJFTPvfuGarv9AqXqto+G0br03snxCt1zdXxI=; b=t1Sy1xB5Uo5dt8EYs0M2a8PmzD
	nAvp6IbDaG6PTOOBTv5Jlp0uVjiz+RM0L9cHJNiE5s/7vCRUDROz1p+wnoFdL6agzVpecyg5cYAgT
	mxc/RFiqzvzkr0cWy7BMYx7Lzh+qrXMurp1mqOKL7kKd5rZ/BH+2zfV31ofLTBgV1P1zqGGwuXUgR
	dvrR8e0XVTjoLr3ycO7KK8Ol4lfmQ2mIIS459RAdLIsAy3qhqNaC0Dd42ZISnLoqrykewcSro9jjN
	vNWyhNu430RmfFhUVntlef/JN5SoRgskYMW2asM57izaGLoiudNE9OgVgOOaBNeIKlAHyrYiZpI8Y
	xYrbazWw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGwM-0000000BrRD-3Gzv;
	Thu, 15 Jan 2026 06:34:42 +0000
Message-ID: <d329da11-d33e-4f6d-bf1b-c2466ffb3165@infradead.org>
Date: Wed, 14 Jan 2026 22:34:41 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: docs: Add description for missing options of
 link_power_management_policy
To: Yiwei Lin <s921975628@gmail.com>, corbet@lwn.net,
 linux-doc@vger.kernel.org
Cc: hdegoede@redhat.com, srinivas.pandruvada@linux.intel.com,
 linux-kernel@vger.kernel.org
References: <20260115032952.6658-1-s921975628@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260115032952.6658-1-s921975628@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/14/26 7:29 PM, Yiwei Lin wrote:
> With the kernel update we have more different policy for SCSI
> link power management. Add the corresponding description to
> the file.
> 
> Signed-off-by: Yiwei Lin <s921975628@gmail.com>
> ---
>  .../scsi/link_power_management_policy.rst       | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/scsi/link_power_management_policy.rst b/Documentation/scsi/link_power_management_policy.rst
> index 64288dcf1..07fbfd937 100644
> --- a/Documentation/scsi/link_power_management_policy.rst
> +++ b/Documentation/scsi/link_power_management_policy.rst
> @@ -5,13 +5,13 @@ Link Power Managent Policy
>  ==========================
>  
>  This parameter allows the user to set the link (interface) power management.
> -There are 3 possible options:
> +There are 6 possible options:
>  

These table headings lines (the ===== lines) need to be as long or longer than
the text. keep_firmware_settings and min_power_with_partial are longer than the
headings ===== line.
Please extend the Value column headings ===== line by one character (just
replace a space by '=') to avoid these warnings:

Documentation/scsi/link_power_management_policy.rst:26: ERROR: Malformed table.
Text in column margin in table line 17.


>  =====================   =====================================================
>  Value			Effect
>  =====================   =====================================================
> -min_power		Tell the controller to try to make the link use the
> -			least possible power when possible.  This may
> +min_power		Enable slumber mode(no partial mode) for the link to
> +			use the least possible power when possible.  This may
>  			sacrifice some performance due to increased latency
>  			when coming out of lower power states.
>  
> @@ -22,4 +22,15 @@ max_performance		Generally, this means no power management.  Tell
>  medium_power		Tell the controller to enter a lower power state
>  			when possible, but do not enter the lowest power
>  			state, thus improving latency over min_power setting.
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
>  =====================   =====================================================

-- 
~Randy

