Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1762FFDE2;
	Thu,  8 Jan 2026 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767855265; cv=none; b=un23u2qBA02B79xAAjJZHEZp+l48cx5lkNzUnwLJ4V1FZme3iNOPANxpgqIZHnoR2Vjiy5ymCtBM+ytesN3TelGpBjGqvIcTkAlj+wZQawxarFR3ZYbRcN46Xr+xdkIcMj2VOoGNkCnVbbPA1jZcN+4ofDqXr81Psp9vQKXGWxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767855265; c=relaxed/simple;
	bh=WZ+9OaiDZpnfghcK3ZKtKK8veQs80H9O8KZ/x5kG/lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eWMv+dN27BpDlHoJwLMczkNZenNGbB1+uaVuwdAPRbSqENYX0fJl83SkBIHQxmRdf7ZUzptszQTKPdDNZwWBDp5iOvDVlPBd/WHc1EfNzhEo90nVkC9NSGEBml4w797Bag3Cvw9hUQrVdUo56pr5ui7leLJbxd0Q2y8lqL2LOIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aB/TSfo2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aB/TSfo2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=ZztfcB1D7hrVE5+6az1xvVwh0WTD/jf5jaC9NFxgIjc=; b=aB/TSfo2xnCQ/gaxW4C8nRchcO
	zKp431ahuCIDTJbu3i3sJl21X4JXFvaCyVhX4Q5rpVCPBFjEh568EsoOoWMcfYQA6VC+2TXhDkx4s
	lv8EIqcKvWbx+8/0eCq+UJczwwgWlV+/8NtfOpNIEt93ibimMqpK/hCMh5KNZ1v4pJV6Q8Fsi0Usp
	Hs0ZJpMvIefrqAkDdL7QyY0ElKcuhYKOIqiVSYL/36bKbOUQl+Kd/uzsA/S23VnutH1Jg/tPyAWgU
	170eQFHL2szL1a9Ho/4gAiYRz5dxQNuAYJYchAYyQlFK6Au49cLimnZZPl7P5ZNKK561jqvK92GVN
	bOa42zHg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjuL-0000000G20c-2GAp;
	Thu, 08 Jan 2026 06:54:09 +0000
Message-ID: <84aa1a20-e507-4db0-a1f1-3a0b7342f2c3@infradead.org>
Date: Wed, 7 Jan 2026 22:54:08 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: x86: fix malformed table in boot protocol doc
To: Daisuke Iwasa <iwadjp@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260108064615.144113-1-iwadjp@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260108064615.144113-1-iwadjp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/7/26 10:46 PM, Daisuke Iwasa wrote:
> Sphinx reports a malformed table warning in
> Documentation/arch/x86/boot.rst.
> 
> Rewrite the "Assigned boot loader IDs" table using a simple table format
> so the multi-line entries are properly represented.
> 
> Signed-off-by: Daisuke Iwasa <iwadjp@gmail.com>
> ---
>  Documentation/arch/x86/boot.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
> index 6d36ce86fd8e..18574f010d46 100644
> --- a/Documentation/arch/x86/boot.rst
> +++ b/Documentation/arch/x86/boot.rst
> @@ -433,7 +433,7 @@ Protocol:	2.00+
>  
>    Assigned boot loader IDs:
>  
> -	== =======================================
> +	==== =======================================
>  	0x0  LILO
>  	     (0x00 reserved for pre-2.00 bootloader)
>  	0x1  Loadlin
> @@ -456,7 +456,7 @@ Protocol:	2.00+
>  	     <http://sebastian-plotz.blogspot.de>
>  	0x12 OVMF UEFI virtualization stack
>  	0x13 barebox
> -	== =======================================
> +	==== =======================================
>  
>    Please contact <hpa@zytor.com> if you need a bootloader ID value assigned.

That looks good, but this has already been fixed:
commit 5288176a5412
Author: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Date:   Wed Dec 10 09:28:14 2025 +0000
    x86/boot/Documentation: Fix htmldocs build warning due to malformed table in boot.rst

Be sure to use an up-to-date kernel source tree when making & posting patches.

thanks.
-- 
~Randy

