Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8E5421895;
	Fri,  1 May 2026 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667673; cv=none; b=e9Sceb4QwWaIzV+JPI7Q2quGbhvOXmOZLDc1CHpfux9eSbXdGaipqyPUGxd/+ibrzbNQwa9zmtIPsktUBMA7goN0M8f6JxHNKm6GeAP23mZkyq1EHQL18xftXLChzVpVTCEoVXpP7KRd5mA84YV8MLLRPNK/USFNjkcf2cUoXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667673; c=relaxed/simple;
	bh=bZN3/dDl/N/BW4VSa+lQKR6PsbyLxu2lnNq3BRBi1EI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vdlw6p5qMY57UlCoORljL2RQQI/UWUiC/c3XMOiyLwIhq9nzfwI4eEnvaqc6HNhY/xfNyDiz6xUsnnA7+iX0PkB/WAlChqxSxJI2fNrxOwlrjXpydDDqM+ABmP2togVgk1aGQcrpsGXU277FjbYgfHSXz7fLSV43GiDIOnT0F2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZmJQASpk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZmJQASpk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=kwofkglT0UKAQyH4oQDWBijGICgphUhKZgKEs845LpM=; b=ZmJQASpkBKQPOG/lmASsWLbnJ/
	tJoCQrCe6NO5iEvJyMKZaX5VkYdvvfyGFfsnaYtPLLbbN5qF1lr6zo768lSPlgefgPeNzYUTwGojt
	hnGtxXCRgMtYaGSSAgASJVirZtxgc/Hf2RVc9Ab7cDXpW5pCLiCRh1prcev+P7ynZXF9kmJJLUGqa
	Su112XopFPUANVtxPFRhliMDIpLk11Bja844HP90XEwX/hde6htdWdTXzjbTCi0u2j+thzBXd3M6a
	/eS3HIaP5CdIE8yZRIX/KvPamwrb549FVo0iA6CvB0XEiubWoXqruj1pyF8SlaoX3FvLF9jpnoUHk
	auaO3VAA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIuZ0-00000007f9e-30vZ;
	Fri, 01 May 2026 20:34:19 +0000
Message-ID: <d813fb5a-9256-4f0c-8663-c198cca9f80f@infradead.org>
Date: Fri, 1 May 2026 13:34:17 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: Remove icn= ISDN parameter
To: Costa Shulyupin <costa.shul@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>,
 Marco Elver <elver@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Li RongQing <lirongqing@baidu.com>, Eric Biggers <ebiggers@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260501182634.1110715-1-costa.shul@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260501182634.1110715-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/1/26 11:26 AM, Costa Shulyupin wrote:
> The ICN ISDN driver was removed in commit 02bbd9802da7
> ("staging: i4l: delete the whole thing"), but the icn= kernel
> parameter documentation was left behind.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 41c657cd362c..6e21d8638d77 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2245,9 +2245,6 @@ Kernel parameters
>  			syscalls, essentially overriding IA32_EMULATION_DEFAULT_DISABLED at
>  			boot time. When false, unconditionally disables IA32 emulation.
>  
> -	icn=		[HW,ISDN]
> -			Format: <io>[,<membase>[,<icn_id>[,<icn_id2>]]]
> -
>  
>  	idle=		[X86,EARLY]
>  			Format: idle=poll, idle=halt, idle=nomwait

The pcbit (ISDN) driver has also been removed.
Would you also delete this line:

	pcbit=		[HW,ISDN]

-- 
~Randy

