Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C12853E9
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586917; cv=none; b=RgQZZKQTgtL3LnNBvSHLJGLpsRSNM7gSVFGNgfQHM2cgc/b4dk8ZRKmaDMqdBcwj3TIfMNS1SqYSCznL76GW6peoniEy4AhIEreZzVqeH9RNco0LirdCGjbLrf+ZQeq+4d4X5VYhHoUYJx8kg+VWx5da3KYiciXQPBuN8L/jFZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586917; c=relaxed/simple;
	bh=vcIYcFn8wOu64JToHCd3V3ghUBsco6aWxPDuriYHfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEVD4SBRjmU11lCJKu4CvFKNvu7Cz/9vQDFcxkNTlcegtGxdzflc3mC8NniF7xNY4zi7+yQFIPHjTq5YiME1M2NeJQRsw8qLm0+dQA/ov0hOi8YmMaR1G3urag0adGCSN1T7CxXIOcz73cR3920V37/GX8etOwLW8uDa+F/8H84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso23706525ad.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 01:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586915; x=1784191715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=lHdVlNnWLxpayZJb7TxgYyRkqw6L7Z/Hhx7FOpt2Vc9LFGXQwarZBgXoP1gIDJGKBT
         yTuK/U4SuHZVWRLIXKlVjNtrV9Ug0tcBAWdqCOoTOegPQDq5AS/2sQ6tzRbSbCGr5az5
         p+sawwyy6U55oL2Rkk3mPHcjQk+uFuDv2zqW8+O0HNa37Ypus0xodQoA3+61xC04zEsj
         lrfIPRNxCs38PAx6Eqf3C4FRCrLCn+3Ym5xjo/jAM1fV5fU3DuW6/vHeYBBtqZrTMieR
         FGtpJS1a5MxSGz1ejFNs/8Vd66EGfFP2NrmzwThP9vkxikoIreg/kfVBozvGEK9Ev5y/
         89cw==
X-Forwarded-Encrypted: i=1; AHgh+RoU6JRI6B9Nokgfs4Sb6zFiEk1oKl3pD5sLdPHrtFz5tNNFlE5v7EpyfhZR2ZGoxo32YZpzmDckEUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx12YTGwLHzxHpeWbrEZiGBdZ2Jz3ztQL/nlW0omWhkmnEICVzo
	9eqtWu8NGMMGBWyY9U0NobiCXe84ox565snrjPU+wATfKhs9e7Ajd1j1qXX9Ppc4zD0=
X-Gm-Gg: AfdE7clb6x+VRk4qYWlXioSZrYNmFL3+ooxB0XUQRgcyw70egsKfZHZ2lU2zWcsSC2K
	lV6MS4dksdU9vrSdTHqefIe2v1ZqsxgfT+zUcZz5HFj7e87R4u+fRZs92voXEg7/WVnIgt3wTTe
	BHO2kWwV3wMIUJNG23DB/U29/T/Gu6Fv52Tm8HKd1Di2ipMnSuK2TdyXosB6T3kCqduh7dC/PJS
	IT5M/fTswevLQqsyACn7GdD3FAiIISB+It4brCJfIwgfW5O9QUSHGaKdq0Pxg46FNBy1r9lAT4O
	56X31l0j+P+qbbTaKOpRWMqQpMAgUbC5ts4SS+3gVjft58VAe7bFqxqGtnvvRwQH3FUanTOIyqW
	e7Yp8kAK0PMhjl7MZNKR/wBY5yAGRbUfjiwa8hZ20FvN18Ng1zU5trlfJ9gXmv7AiHcuI2ITPLY
	VNDQvmwZi2DwT3xpwzf21UCxR8cw3AXO8A/mAiwg7J9+wJW303Ig==
X-Received: by 2002:a17:902:e74a:b0:2ca:e08e:9e70 with SMTP id d9443c01a7336-2ccea47fc80mr61026455ad.46.1783586914749;
        Thu, 09 Jul 2026 01:48:34 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm40144315ad.78.2026.07.09.01.48.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:48:34 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3817f800c8bso1361357a91.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 01:48:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqwDw2pJO9N1U3HoJrdOPhxm+Cts7vHXPkj78SLN7+M5/TEPaPuaWW3ZJOg6GfnEeAeYkZwWPenQpw=@vger.kernel.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
