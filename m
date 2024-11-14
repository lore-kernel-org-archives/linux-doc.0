Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD99F13A3F7
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731553352; cv=none; b=ay7jhCDLtwaH3JHoOgadPV514HEep9LDn1SNbxi7CzYtuXZT4sDvHCI7cuUoqc94FJzu45oCfC+ei3WY+5QLfqfnrnvhZ+c3WItfY1dZfVxx2pQvgj45NGeh6MP70ZjxFNrvxHnHsw+IWLkRVdDeHNBSHidy5r5IqasvRf3O4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731553352; c=relaxed/simple;
	bh=eC/Je7lf4cTIs+XfRclfsG7Gw/l6OPSkqZyilcBiabw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dd+fa8U/kHu8uj2EbZshGjKCrvHGVsXM1CXxROhzmh+ktbHLqFu1HZVEbUCffyj1hhC2LA35xRH6AmQo34r/6ulIE2gCAi24W+Oj5V0z2eCCvPomQ17JOIWrmVeG2D9CEpiS13EnBCA+vk++LOGXxZrtOkqysrJTNHptkhnp/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0gNyjYm7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0gNyjYm7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cdda5cfb6so944655ad.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 19:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731553350; x=1732158150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3slBWyvgUqyrNTtRBU44b5VuzePQ2w/b3OOC87VCWo=;
        b=0gNyjYm7ze8YVCSeiSmsx2TUiwt+Ci2kpBNn9I460Sk1UbN3K95uDXp//R7/1FEJgX
         ALCpP2c/rtUnucAqJkzn3QzDpEOqvvqEfv0eVmq85zgS/JGSS5kUNeVs1p2GCR3DDjlz
         FjeojBkB+2hrWvSUzL1MJrsnFf28Y9yvSOrvyLKySZe+7zpDEaNgfiZVBOKuEcs+H0ME
         v8On3Gl9MHWWLHKyZkBKSOrl9X21zj70KCkx8iBOLSFFVLKNEuGY5dKMwTyfDQ0Wqcsc
         JV84y+Dev3BQkyYHOaHGTG3D16G9apEjGUInjAS1PhgdnaMrzGi/bH6wpUxfaA/2lZCV
         i2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731553350; x=1732158150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3slBWyvgUqyrNTtRBU44b5VuzePQ2w/b3OOC87VCWo=;
        b=KiPd65YWE2/RVuSBO7aL8ajit16CEBbTObEdfkbpGDlGKgoamI5AKhHjdS6W+U3SW6
         E1Yfa2I/L8Ir58jE+R339anKwj9mHf/ZiZfptk9bFusUpvbjbwfYxw+MuueQrc12WsRe
         CzS132M4WiVfwFFT082GQq77aOMY2fySaqmYiZomEcKBdBKcE37A8M0Ha04QnDGfCAB2
         JQd/MIRITZXLC+5IgKUASk+L69oXZZWr1Rwc3UXMdWa18HRCGc99eKFGBw/k42Ysnwu7
         UUmP5d1exYiDV/vBfDKXpjhPW3/HzgGPu5jAQ/6Azyi1MIObGFn+irE+9eIxT3Utef37
         AbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP2yVioL79hdZHgnhzP7MmmTxYVfqpjFz2X/0KQ4BksjOdg+ZPWkU1P+lI+b5WWTPaW2rYCdhea08=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY09qrR9vZq+DvFSWmZOvUF8QF9cM0REY//ZdS+XBpCwf4coux
	myxxrWYcwGfO5JZu9OALjrek970YCy77gmoOXLHTyGCl5PLez+1rgSL1sD2b0Kc=
X-Google-Smtp-Source: AGHT+IGfSosQZpd7ro/3P8ybXqRalEFqAIaugehdNVkBtjrErQ0ikNqH6xSPtSFBIgViM11iMSZkOg==
X-Received: by 2002:a17:903:2351:b0:20c:da66:387b with SMTP id d9443c01a7336-211b661df27mr59390095ad.20.1731553350082;
        Wed, 13 Nov 2024 19:02:30 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d06940sm706985ad.199.2024.11.13.19.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 19:02:29 -0800 (PST)
Date: Wed, 13 Nov 2024 19:02:26 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 10/14] riscv: hwprobe: Add thead vendor extension
 probing
Message-ID: <ZzVoQi6D0U30p9sg@ghost>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
 <20241113-xtheadvector-v11-10-236c22791ef9@rivosinc.com>
 <tencent_5B500856E30E1FB920B6B68D6315EE70CC06@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_5B500856E30E1FB920B6B68D6315EE70CC06@qq.com>

On Thu, Nov 14, 2024 at 10:44:37AM +0800, Yangyu Chen wrote:
> 
> 
> On 11/14/24 10:21, Charlie Jenkins wrote:
> > Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> > allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> > vendor extension.
> > 
> 
> Hi Charlie,
> 
> How about changing the name of the key from
> "RISCV_ISA_VENDOR_EXT_XTHEADVECTOR" to "RISCV_HWPROBE_KEY_VENDOR_EXT_0" and
> use marchid to identify what the vendor is, each vendor will have its own
> bit definition in this value. So we can avoid adding so many hwprobe keys
> for each vendor in the future.
> 
> I proposed a commit here: https://github.com/cyyself/linux/commit/36390645d85d1ac75dd71172f167719df4297f59

I actually originally had this in one of my first versions of this
series but was convinced by Conor to change it. The problem with it was
that tying vendor extensions to mvendorid means that it is enforced by
the kernel that vendors cannot share vendor extensions. It is possible
for vendor A to purchase IP that contains a vendor extension from vendor
B. This vendor extension should work on platforms created by vendor A
and vendor B. However, vendor A and vendor B have different mvendorids,
so the kernel can't support this if it is tied to mvendorid.  It could
be solved by duplicating every extension that vendors have, but then
userspace software would have to keep in mind the mvendorid they are
running on and check the different extensions for the different vendors
even though the implementation of the extension is the same.

The original conversation where Conor and I agreed that it was better to
have vendor extensions not rely on mvendorid:

https://lore.kernel.org/linux-riscv/20240416-husband-flavored-96c1dad58b6e@wendy/

> 
> > This new key will allow userspace code to probe for which thead vendor
> > extensions are supported. This API is modeled to be consistent with
> > RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> > corresponding to a supported thead vendor extension of the cpumask set.
> > Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> > to determine all of the supported thead vendor extensions in one call.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Evan Green <evan@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/hwprobe.h                   |  3 +-
> >   .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
> >   .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
> >   arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
> >   arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
> >   arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
> >   arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
> >   .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
> >   8 files changed, 88 insertions(+), 2 deletions(-)
> > 
> 
