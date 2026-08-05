Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3CA255F28
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968141; cv=none; b=Kkv0MhdcSnd9Pf8T2YckAQDFbBU5xkWImh5UZ0f9Pt+b6VXzI/8cmUbwoEpAuMX8c94Nyu8SPfVJrh9gYlT7qfqte/YlojZ2MKPwC4Ah3vjRNbHrSHYb7X1JBQNaAYJYeVkM3Ym3ZO4kq2qX9fnUBKn/sjWDwy6gLYZeOuhj6aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968141; c=relaxed/simple;
	bh=ZpNHxuXhbDEFtZ1OSgSyMpxWGX/wGPxvPGGuMRPNaPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=i34ewegvz+Nlzbg7vJs8hG3DHgwcVA6JkppRdbdqY5Meb+5azIk5f33cuM5T4bZlwRAw87YgQHtNZ5sr/AolM90EtmsNon5Psy+n3Av8InLwEib8Uk4DXnJ2ZLpvK4xDS5QjTaGDG4m3JyhHYkwuW0j6S2Fo6t9Z9+mNYIOexYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=OvKGrX9I; arc=none smtp.client-ip=84.16.66.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="OvKGrX9I"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hFl1l6m8PzSZy;
	Thu,  6 Aug 2026 00:09:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1785967755;
	bh=kTmq/lyljeB9XdCxTC8Eu3Mw0VJU1VQh+/P0mBv8CS8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OvKGrX9Ia9sne6wpWt8aqvV82YrUaJa2YGuYFGee4zT/ca07sLp3p9gSF+ErMSW9Y
	 yySDcXww/xs38eYd5TDI/BiQ4W01/A03EAbr5XjDNGMDkvKryTW4RdgpxLuUeVpNJB
	 mycwh8yTVAu+yxq2vI8Xf/8kN6IMcTl31Zzz91ZgNT7/WJgGh17OzfsQ3twP7yb90J
	 v3qXS7PIggJB8m/vF5BSJFzlb46ozu07K2GpBqqf7lNOkr+CJZP7hMCn5X4nEVYwx8
	 shPCrGt2oDb/yXo4tjG6EDBRmdOm4egw/dLMMp1JSn8U9oUDOGi7+uQV5Dc+QgFi4Z
	 xSZMPA3bE9vBw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hFl1k0j1SzQS3;
	Thu,  6 Aug 2026 00:09:14 +0200 (CEST)
Message-ID: <b784820c-a027-44fd-a47a-ba51e52de7ea@gibson.sh>
Date: Thu, 6 Aug 2026 00:09:13 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260624124326.746525-1-daniel@gibson.sh>
 <20260624124326.746525-3-daniel@gibson.sh>
Content-Language: en-US
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <20260624124326.746525-3-daniel@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Infomaniak-Routing: alpha

Hi,

On 24/06/2026 2:43 pm, Daniel Gibson wrote:
> Some Lenovo IdeaPad Slim 3 devices and similar with AMD CPUs (so far
> observed with Zen3 and Zen3+ CPUs) have a nonfunctional keyboard and
> lid switch after s2idle.
> 
> It helps to delay suspend by 2.5 seconds so the EC has some time
> to do whatever it needs to get done before suspend.
> 
> Devices known to be affected are matched automatically, others can
> enforce the delay with a amd_pmc module parameter.
> 
> This is now documented in amd-debugging.rst


any chance to get this merged?
As the delay_suspend parameter for the amd_pmc module are in all the 
current stable kernels >= 6.6 now (6.6.147, 6.12.100 etc) it would be 
great if the documentation was also available.

Cheers,
Daniel

> 
> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> ---
>   Documentation/arch/x86/amd-debugging.rst | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
> index 3176a1240fee..3725adb42673 100644
> --- a/Documentation/arch/x86/amd-debugging.rst
> +++ b/Documentation/arch/x86/amd-debugging.rst
> @@ -249,6 +249,31 @@ state entry.
>   
>   `commit 40b8c14936bd2 ("drm/amd/display: Disable unneeded hpd interrupts during dm_init") <https://git.kernel.org/torvalds/c/40b8c14936bd2>`_
>   
> +Keyboard and Lid Switch stop working after resume
> +-------------------------------------------------
> +On various variants of the Lenovo IdeaPad Slim 3 with Barcelo and Rembrandt CPUs
> +the lid switch and keyboard, or at least the Fn/Multimedia keys, stopped working
> +after resume, until the next reboot.
> +
> +This was caused by buggy firmware having timing probles, the EC needed some idle
> +time right before the CPU cores are suspended, or it got into an inconsistent state.
> +
> +For laptops that are known to be affected this workaround is enabled
> +automatically, to test this workaround on other machines you can set the
> +``delay_suspend`` parameter of the ``amd_pmc`` module.
> +
> +If you need to set the ``delay_suspend`` parameter to fix your machine, please
> +report this at platform-driver-x86@vger.kernel.org for it to be added to the
> +list of devices that need this workaround, so in future kernel versions it's
> +enabled automatically.
> +
> +Note that the current workaround isn't perfect: On some devices the problems still
> +happen if resume is triggered by a timer (wakealarm).
> +
> +`commit 9b9e60dd31da0 ("platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops") <https://git.kernel.org/torvalds/c/9b9e60dd31da0>`_
> +
> +`commit 428b9fd2dce50 ("platform/x86/amd/pmc: Add delay_suspend module parameter") <https://git.kernel.org/torvalds/c/428b9fd2dce50>`_
> +
>   Runtime power consumption issues
>   ================================
>   

