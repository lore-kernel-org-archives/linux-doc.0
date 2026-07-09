Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FAC43B3E7
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622635; cv=none; b=rqSPNz94OxSc1xAMu+s8W+VJqUX11N2jRwDJtBRaLIQoUPb3CnCnL/V5/N1ZDl7+C+D/M/CokoWHRml5ryPboKWjpyqq0HW/WsBnL306ax2r6vkDhpwU4uedqo4cqAqwau0gWmWHd6ud3Exw9Ih8qEmGfef7Xq7QgvtzHomEPlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622635; c=relaxed/simple;
	bh=5522vd31FFvseMtFKZmNLN0MO3Bnoibk1qUMw3Ml4Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idoxr+so1pRJ8ga8WFKLskgQ4a3Zm9DoU3j67P3kaJQ61xg+J7xSJDmlm8wST5UdQlDdL5ihLeKEiCLswOLTJaNuGI7gz/bCtyEj9B+MT2hjZ4xJ19WaTUskTBM4pSCpe4dv5YPTUUZqHKAT3/H6f5UOOlzetN2vqQGGrXi6+wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riRQKuR+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riRQKuR+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso248797a91.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622632; x=1784227432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=riRQKuR+XX2MFtODdxhiHEdB6Za+0kzqtImMsil4VbDuA817S5zqgMg4uvu6P96FE7
         7JDwU6IFNZWY+m5inz7S1JRNEV0pJq1SuNE4iMk5XqvbhYLLkn0bjNBxwUf9qOUN2Riz
         HM0IH5hgCgsqi8gYgjgMP7Xd2SZ3DtTjvWBDs/srg8sOh/E+PRqxOd2wQwj3ckbekDbW
         BTHjh4M1wqSW8OSNoDIskaYzem2+TgNitTvM5S8O01RWbtvA2hWMp5LAUmO5AyghuAfb
         EFNNKlzrlZxq30FBfoVXPInHkqfdJZCaBlM7q8/aHgjUHzb/iYK8b0pMrmGC8qtLfb/p
         ekYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622632; x=1784227432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=VCjVT+ZWF0aVaHCLBoPLpIehcrTITzxMszoXbNU/12Q5Z6bEmTsM7JyF7BgeVju+fK
         tB0m15GqeN51wT9dcSAALJQswida9iFVZHDOAy+W1snaYRW9AxbRluzzZU84rw+1puDn
         edcowSDmyTHw+2PSJvBiOmnAO69K7qw9b8P0jWCa2le/xqpeb5wrJb5X4IptZF3yG/YA
         Z/mY6bKyWqX72p0CNG4+CJLY+prMJ+j3aXCu1IIrbKEFbYfu568tdsstop4abcn+Z4gU
         B7nnwTj8AHDDTefpFcE08zdmxKYRL24nq8ciaEb9AiYXEPCAzJcNXJdlt4hYzKCqjNLt
         5odQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+6HSfgVNBHeuvuUPZRXCDz/ELWLMz/t9/I8fGnEkwiWzshgCN2Vmnq3aCGWPa+x/7l54cQmjwQaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwawR980w3DnVrCdWTpzmChe14bq5io2BWvlquI4IfWcR7Fl5Cy
	qcV7p+9jEfpuSaVsdzqSSREdAzHXgfYZd1HXMv79IiL7SX75SIFFXzCp
X-Gm-Gg: AfdE7cnBueLExlp9twWNNqNWMwqoQnoU6yHWddzj6pRrsY+VSf+NEDjpOLI4Ou8b+Sc
	K6FJYOYAMLCRYXZQ8saqnyg5kc1qxNh0IGPtIAa8Dh/KsWmQklkX3WUaBh75lvbrifkD1QEUgnd
	86oWryj+R6QJqUdssaAJts8uc3GHGIZjyjUTDRNbKmuANMBN8Atg2hpkI1ABzb594xCrk3FQFeM
	8lyXSN04WHq0VCiha8pkFumDc95rKi+sOykS2G/FziTJvRENR4/WmKfjByEet0cpaK93vBFtmMm
	Jwzq/LCe3wnvHI3DeX7Bz9yn1LndPZBFXOzQbsrkbiNwnnj8FKvbWYzIlj0o1vMWYtdsjVPYTXi
	nW5/uFPb1w+cqawSUfWh6AiYXVYMdNotHP1e0nqWYgUgsZxUhiehzH+mA+N58WAuj3B5x9bhwY3
	SC4/IiHvbLecTYpCNwygV1HhfMLT1HM3fjeCIC9ruNaoNaqz0beFU5IIYL77Ed
X-Received: by 2002:a17:90b:564d:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38943d404dfmr8538131a91.43.1783622632431;
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm35673867eec.30.2026.07.09.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:13:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
Message-ID: <ak_rx2gFCLtG-Qpy@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.030598804@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.030598804@kernel.org>

On Tue, Jul 07, 2026 at 09:06:23PM +0200, Thomas Gleixner wrote:
> enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
> the subsequent invocation of add_random_kstack_offset_irqsoff().
> 
> As a bonus this avoids the overhead of get/put_cpu_var() in
> add_random_kstack_offset().
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/kernel/syscall.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
>  {
>  	unsigned long nr;
>  
> -	enter_from_user_mode(regs);
> -	add_random_kstack_offset();
> +	enter_from_user_mode_randomize_stack(regs);
> +
>  	regs->psw = get_lowcore()->svc_old_psw;
>  	regs->int_code = get_lowcore()->svc_int_code;
>  	update_timer_sys();
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
