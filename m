Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A0231A21;
	Sat,  2 May 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777739716; cv=none; b=s9214Vm2SsyxFpSCrbPEoUvRKtLfegZ6SklXRJgcGYA5JYbF+5mpG/HhfSQV6xwOdUGCkko+hUjONUG1FJiqGY9pYyQXH4auW+rmrAfdRrqbSdtj5FMpY2K0hu0wFL/e+CpmpmaZKihUnnyWyZQ059ZoPnrNz1nAhfNY7XoIRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777739716; c=relaxed/simple;
	bh=soB1OtMgQvZOIn75d2OcQxxKHT7Ndcn/daCsKarZzco=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PrqFIfTJ3BAtQ8hadhDnD47QLpjNKgz9POuDAK/zc5/tadobDu+uby15zQ/BiHEAr0ElGSzJNSLabSYxxK48U8OjD2x2HcItFMExTahg/7R+paVOSbLRXTRJcowUD4FpD5JTAQe4+BQictwpp/dR2my3iAQr1UAJlDpIMTwOqYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KpQqV8bJ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KpQqV8bJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=Zv0+okVqUfFBB0xN85ocI6HJzWcJw1RYgseOCPYB2NA=; b=KpQqV8bJRWNDanwSh/Hcq+E2o+
	oR3mH7WkOQSw6bWzJdDgwZ4GD2RSvHmNseEh8FbndtwsnOGz5xMSTid/3zSaTyLuJYtu4Wcq+T/mF
	X8Z65dKCObjvdqerynpgTp8bpswFlpBD962OL0OrFQKy4oHzCv7DPmejqmMv0RBv5gDRX0Il+v9Jw
	j2IzxaVyJNrVbmLBSIXCDwKj5CQj5BfE0POxfVWHvtn3FAPCMpctzXjAuYOF7ykGuhKoMG/f/C/rG
	uBRkrdtnTTQAbF9q1gEqNN7EQt2VKhZMVC304jwZ0IO1MxkwVQCKIKoLxiYzxS0pab5rFIme7nPnt
	gvElopwA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJDJC-00000009KbU-086w;
	Sat, 02 May 2026 16:35:14 +0000
Message-ID: <70322b63-be09-457d-a73a-2fd2612b71b7@infradead.org>
Date: Sat, 2 May 2026 09:35:13 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: Remove stale ISDN parameters
To: Costa Shulyupin <costa.shul@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260502120206.1289126-1-costa.shul@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260502120206.1289126-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/2/26 5:02 AM, Costa Shulyupin wrote:
> The icn= and pcbit= parameters referenced drivers removed in
> commit 02bbd9802da7 ("staging: i4l: delete the whole thing").
> 
> Remove the stale parameter entries and the now-unused ISDN tag
> from the legend.
> 
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Assisted-by: Claude:claude-opus-4-6
> ---
> v2: Remove pcbit= and ISDN too
>     Address comments of Randy Dunlap
> V1: Remove icn=
> 
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---

Hi,
Your Signed-off-by: should be immediately after the
Assisted-by: line and before the first "---" line.

I'm curious: how and why did Claude assist you in this?

Anyway:
Acked-by: Randy Dunlap <rdunlap@infradead.org>

>  Documentation/admin-guide/kernel-parameters.txt | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index c13c354728bb..96c189e5f5bf 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -24,7 +24,6 @@
>  	IP_PNP	IP DHCP, BOOTP, or RARP is enabled.
>  	IPV6	IPv6 support is enabled.
>  	ISAPNP	ISA PnP code is enabled.
> -	ISDN	Appropriate ISDN support is enabled.
>  	ISOL	CPU Isolation is enabled.
>  	JOY	Appropriate joystick support is enabled.
>  	KGDB	Kernel debugger support is enabled.
> @@ -2245,9 +2244,6 @@ Kernel parameters
>  			syscalls, essentially overriding IA32_EMULATION_DEFAULT_DISABLED at
>  			boot time. When false, unconditionally disables IA32 emulation.
>  
> -	icn=		[HW,ISDN]
> -			Format: <io>[,<membase>[,<icn_id>[,<icn_id2>]]]
> -
>  
>  	idle=		[X86,EARLY]
>  			Format: idle=poll, idle=halt, idle=nomwait
> @@ -5037,8 +5033,6 @@ Kernel parameters
>  			the specified number of seconds.  This is to be used if
>  			your oopses keep scrolling off the screen.
>  
> -	pcbit=		[HW,ISDN]
> -
>  	pci=option[,option...]	[PCI,EARLY] various PCI subsystem options.
>  
>  				Some options herein operate on a specific device

-- 
~Randy
