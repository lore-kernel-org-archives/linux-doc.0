Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7E2AB44
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Hb52MtOW"
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A535DC6
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 09:32:06 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-405497850dbso12315325e9.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697128325; x=1697733125; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zEFAq/CRrluRRtx0eqGeEhiSqDINW9W8p+WysscBUH0=;
        b=Hb52MtOWZjxxfZ7pzN8qo7bv0tgN4syqARBW16Iv0kg/BriTVxqdQMiRQCSViZyqpe
         qLTMiaSrTluO3EJkQbbiAx/3sRTgQwIFHvuHsft6KkeIWpIvPM0mq/MOSM4wKRTBbCvw
         va1toOvOK+uQDpzSXub8bdK7EIxPz7/Qx3Qkm7+DiNku7j+yRAW3SIgWiin1Lc7eoOhs
         Pjq/d8Yfz69YSClZjRMDC955zc6EKVSAPPsJORKg29Hy+KfW2P8P7mk6KWPfNUtHu4b6
         cHJ1gZh89VwwSbzC4cG2H5lq7sLg8s+QOpI9F8N4mmSp7LF1MYxwRfClwHBZv6rrmmdm
         nR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128325; x=1697733125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEFAq/CRrluRRtx0eqGeEhiSqDINW9W8p+WysscBUH0=;
        b=R87JXTg4xvmR2c5SZOIIDdw+8FjlLI6mCugtGobOyaQvtaW00T8/JEuFdJSJydp8ei
         5lll3EFfibTp6EDixd1PSaq0BmOAwkaqANEVWBph5hCk5FbhYVsgjwlpc7DXpsvyVAdX
         yZXeNYfc1mYN7TAJAxGe/wNysZcoOZZUsP86pUEj4qa5xH2asX9sTA2rlMc7OX/UmC3s
         xuvygfR+RyJBhQwV50POaBlhkVyyNXtsRZisgUfmpj5mpxoaBBIWswj1mvejpAminFhX
         938JuisoqUKyE6uc4CE8oAJpLJOqnYCCx060jaF6NWXOhABDL7CpCnSRNq8bNmeFjCFz
         Sh8A==
X-Gm-Message-State: AOJu0Yz+nFox7HsXllTpJQOXd+ehlaLb7FmzHAIFFlPs7MbaXtPb6+QQ
	TwIgUKBYZNonNvkUlIcNCuhWcw==
X-Google-Smtp-Source: AGHT+IEMnXKlbQXLsUFxh8NA3bzTb4Kdxrf5jq7K3WHmfryz76lj4mVKcCIgczcHf9l0kFfkjrarVg==
X-Received: by 2002:a05:600c:3781:b0:405:1bfb:ff14 with SMTP id o1-20020a05600c378100b004051bfbff14mr20483223wmr.9.1697128325100;
        Thu, 12 Oct 2023 09:32:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b0040770ec2c19sm30176wms.10.2023.10.12.09.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:32:04 -0700 (PDT)
Date: Thu, 12 Oct 2023 18:32:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v1 01/13] riscv: fatorize hwprobe ISA extension reporting
Message-ID: <20231012-8d049a0366f3333ff4a3223b@orel>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-2-cleger@rivosinc.com>
 <20231012-matriarch-lunar-819c1d2d7996@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012-matriarch-lunar-819c1d2d7996@spud>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 02:53:43PM +0100, Conor Dooley wrote:
> Drew,
> 
> On Wed, Oct 11, 2023 at 01:14:26PM +0200, Clément Léger wrote:
> > Factorize ISA extension reporting by using a macro rather than
> > copy/pasting extension names. This will allow adding new extensions more
> > easily.
> > 
> > Signed-off-by: Clément Léger <cleger@rivosinc.com>
> > ---
> >  arch/riscv/kernel/sys_riscv.c | 26 ++++++++++++--------------
> >  1 file changed, 12 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > index 473159b5f303..5ce593ce07a4 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -145,20 +145,18 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> >  	for_each_cpu(cpu, cpus) {
> 
> We were gonna add a comment here about when it is and is not safe to use
> riscv_isa_extension_available() IIRC. Did that ever end up in a patch?

Yup, it's in [1]. But that series may be hung up on spec stuff, so maybe
it'd be better for Clément to integrate it. And, it appears we definitely
need this macro, because it has now been suggested by three different
people :-) (I later saw Samuel was first[2], but I hadn't seen his before
submitting mine, otherwise I would have given him the credit.)

[1] https://lore.kernel.org/all/20230918131518.56803-11-ajones@ventanamicro.com/
[2] https://lore.kernel.org/all/20230712084134.1648008-4-sameo@rivosinc.com/

Thanks,
drew

> 
> >  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
> >  
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBA;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBA;
> > -
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBB;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBB;
> > -
> > -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> > -			pair->value |= RISCV_HWPROBE_EXT_ZBS;
> > -		else
> > -			missing |= RISCV_HWPROBE_EXT_ZBS;
> > +#define CHECK_ISA_EXT(__ext)							\
> > +		do {								\
> > +			if (riscv_isa_extension_available(isainfo->isa, __ext))	\
> > +				pair->value |= RISCV_HWPROBE_EXT_##__ext;	\
> > +			else							\
> > +				missing |= RISCV_HWPROBE_EXT_##__ext;		\
> > +		} while (false)							\
> > +
> > +		CHECK_ISA_EXT(ZBA);
> > +		CHECK_ISA_EXT(ZBB);
> > +		CHECK_ISA_EXT(ZBS);
> > +#undef CHECK_ISA_EXT
> >  	}
> >  
> >  	/* Now turn off reporting features if any CPU is missing it. */
> > -- 
> > 2.42.0
> > 


