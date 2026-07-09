Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A127B3B389A
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621969; cv=none; b=MPkZbuE141bNrBU9VzpP/j8cizX8ME44hYlo6kaGO+sTMPqdgG4ogYD72XZcqzckxBvajyIvlnhjgQE95OhDzSm8H9sgVUVbqtzMRYJGsd5FUFpic/Ra4tTXjLXhX4DqTLaMomze8NQRFmHM/W5r8Isf/DI9sVNP5UURWSav4sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621969; c=relaxed/simple;
	bh=CuadLq4gnh6A+s/YbTQsNOibHt22WuOTEhntcyj5qbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VggngBifPitcmTxJM6bL+r1A66hpUBAePPW+XvVAdlXSE1SnO91zTMKfqqFNLSD3/dfuFK9EvgLGwdYSJ9TQNtncL1V2aIA8LwkJx06/IpXRP1fhC//7rnu/q+oTQ2/67+myVbBOtqAqwq2xGZl4+2RyE6jUzgAWbej8jUmN8VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWkpnfjV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWkpnfjV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso111839a12.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621967; x=1784226767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/JWBZ9pJgvX+aNnWpGPI681HI0WIvMMNN0M2xj5UX4=;
        b=KWkpnfjVTlyooxWnZivEMv29Lc4Rx9cDyF6J4LOxWofw2SYGiJ94402vXOQ3L+AEyX
         OnHDDP8J9Km6O1Ukmg3JVJARFTtv5Vxn8ULRTTXToivtQVQDPK5shmO1WDcLAh59C2OK
         F2Ny+Uj3ulcIuBV5OCgRwwra/fPpL9rhXVKUjB8BACaokK+QN/ogvVtY6kvcNBm9ot3w
         8GKcwjakfAAIawsqSPIGtmErK29jdSKpm3MEi1SXtRLJ8qaw4JiupfmgggB0TOs7i8QJ
         U4iRx6lyMoDPncNyF79obx9o/iFypE6ksXFgAbBOaoWpQYxJkULwJUNmAUBfXVhOssdN
         YcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621967; x=1784226767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/JWBZ9pJgvX+aNnWpGPI681HI0WIvMMNN0M2xj5UX4=;
        b=gYxHDZj0PmGkkK3BM2K+cHKeiy6aMccNYsloTW49iExWgSWptUOGnVlc562yeYmysT
         7/TphTyugX7s5GzjtK201UYOkAa56d/TQCZFqbt19v/oMUzQmV/onerTYm6Gu71Q+Xlz
         +Ni+fwYMKDXxNigAH12h8eCu9tD4WUjAdSs4v4FkXG1NqC4sCUJQH18IVWZ669v5lzwU
         6oED7Za6aEg0WNAW4QqvGE2TPSPN6vuhdcz2tVHbaHjU9EBkqavVxcrATOE8cIpaQ9dc
         z2+rlO8ealV2RBRN6Q9/ca6CApOyUiZ20A2AEnmGHx4rfykS7MTQ4h5czxhMuKw+iZPR
         U0zQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvdWTLRT6zN1P74uDCGg8jI1XFs51geMbf8RRUha6sCcwf8Eqx1F/z+O3IR916epUkIEH+/ImqFAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5LVPVefMwb4T3w9wHhdaCc3a+C7ozEcUErvbzTZBsdbKrI42a
	ndsmBYDzU3wKIEWZgTWaODdPG7eFx4Ba86Bb9e4W3Vb8cYZzFLsHN/vK
X-Gm-Gg: AfdE7clLWFwkl2iOIGM/HTqE7VEX0xFIvwrl7wm2f0mGn+kfAU/TC/SS9uFd45zPAag
	fTbecdz9K1FevcDc5Cyx3v32QR9dGgtyw2KFLlBkIhxqGuk9cmDbdFcFMIiEc2kZ9MPgZKO1bSi
	mTiAAfHkUt/qX+awI/Mv52P3d5c/wF64av3ZHCOHBcWAC2PGxDbpNOB4ZiM9+KAHlnuXCafsuVf
	GhYFfb7hHchMuZXVy+LoVS3kE01mID3ZMff2+29ao2jz/C68yJu4Vlh0ggDADDR0HK+nTOpUqx0
	WSDqItWC21xGhaVw/KfZLmce+2HYnOhehpHWkRxTOKuHh/oEY9TF2k7Lh8zunYo2zXlGhdxhQQs
	M8lHIlyTr2XC/Xv8LTQeep2y7yTS8Dj1agEN0EIzdKEg2Wxm4WxHhau+1/PdJldMJthsdHvdBsO
	l6P7VEFdy0DvtIG3d6wQ8VSCRJR/lI8FfJcOSohkDSHEvjdxsSYlBpi8cl71ILgFidihZwsVA=
X-Received: by 2002:a05:6a21:3295:b0:3c0:9c18:d5a7 with SMTP id adf61e73a8af0-3c0bd1c4948mr10580989637.68.1783621966489;
        Thu, 09 Jul 2026 11:32:46 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm55669365c88.14.2026.07.09.11.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:32:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:02:27 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
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
Subject: Re: [patch 01/18] powerpc: Move stack randomization after
 syscall_enter_from_user_mode()
Message-ID: <ak_pE64J_xnLQBMd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.718191130@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.718191130@kernel.org>

On Tue, Jul 07, 2026 at 09:05:58PM +0200, Thomas Gleixner wrote:
> add_random_kstack_offset() is invoked before syscall_enter_from_user_mode()
> establishes state. That's wrong because add_random_kstack_offset() calls
> into instrumentable code.
> 
> Move it after syscall_enter_from_user_mode() to ensure that state is
> correctly established.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org

Thanks for fixing this.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

[...]
