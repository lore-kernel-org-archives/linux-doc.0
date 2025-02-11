Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6948488
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 04:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739246778; cv=none; b=SXTWZJa5Yol/g85DyGlBYLxv8CAg2RkhPKd7Uc3iOOn56pwiKIl/0iIfeCDn64NNEu7RdyVv+n1Wgfgv4mG5WtYzHMHuTnH6JOb5QyLjRrKczOU+Ds/nw01OycbA+ayGQmNmgz5fdDKGOWZf1EYm8SPsKW8ct5W9v/3EK4twoYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739246778; c=relaxed/simple;
	bh=Y8Fb7c3oMJFhdqlpFFInDUQpR9IOTEPfZpM3xko40Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+C2S9eMTBR/6PYqEKrZ+pfX0NJqaJ+RoJ1wEX0PnrMxHxofGE+Fs++2b70HhiCChu/1Ks3uClDxOZsK7ZhzfVVtl74695Y6cTF0z/mJAnvQvnJ70+uuW/n2XvfSvgBgtA+KMEDyASid9AwTZ7i9Z+/Hnu6LKDIfKDSyY5ARmL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zVZ+f+bC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zVZ+f+bC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f61b01630so51256735ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 20:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739246776; x=1739851576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyKn8f6FlNrtiJWD+T1fk3XzsKPAFPZ0BSNq2D6GOdI=;
        b=zVZ+f+bCNBJ8qKlfMcYNOmMk/9ffVieJwJSW8z31ufAqZdoHUEnVzz9Afcm8HQg2iJ
         6s2FsqllFrWnxyxj60/30SiHaxFnKACuo7jkaxCCFkaH+oeu8+yDRl/Ss96A4A8ZEEHW
         ygtWO62NzHAiFvHrY4+Em2DwLZtoXmfM/LMlPqxt3iyw1l4UtkvUcj/dfETUk+yIMbq0
         yPG1F3h4DqN4EQ1a7eyL7FyAYlRhSYRtZ3xHLv6T4O25WjmC67BnT3mNZyrPGG34QjXG
         BoqWfliw32xZ4S2zZmyOIOc0UURQOHshI4xi1nrZ4p5Qlpcz5xYirSFbp0bPrWgCYnLe
         zEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739246776; x=1739851576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyKn8f6FlNrtiJWD+T1fk3XzsKPAFPZ0BSNq2D6GOdI=;
        b=Gi1uQgPR7hv+orZdKrkwQZwK/gubXRSWwk4w98bSjpmdnFjJaTzfmoV4L85IhKYNYu
         uj2eU0jKX5cLSbe4dYuvOhvdFz2njLzIrS5kKJ3iKbq07AaqR8Hzv3cQMP6TGpnr3OWd
         RNYPiA8jy3TSvkJeHGanaeWtzesfnJb/bPaZehxmuG5KckpR4ZvwDaON4ry7T0ighI1m
         V+FtZSWvHTep0a2H0ixdKq41RaKujy60SnAauHj7se31mTeZhp8qWqkpimQrtBzajBfl
         frvUD+JdaybN/3aGsRNRB3ElRrslMWkNrSo7MiwRnH1NmFRewLd0smI9AmvSCaQzfwoC
         2mhg==
X-Forwarded-Encrypted: i=1; AJvYcCUVwxqyJ7wo27ira3mSmnqWrwNh92sG7FOsU/0AE5g72uCoRhEyp1vui49uhJZ6kmqy9YsEOOokIbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcZeeodprA7onSBDVGjsq6FIiSAiTgNCgLXLRFez97/LSVs32
	neGIP57zz+KuIRLydHX4r1uwGToTyk0ORVoGYTb/UPQ03vgBSk/2A4M6135i4G8=
X-Gm-Gg: ASbGncvbkTqC505YS2z7I+nxPIn10qss7I9zFnsv4n5YH50e2s95XZc4KZterT0txia
	QY4DGsGBy3F7vVpHlDp6lSLUL7d+HCI1ZNeOGReCC+YvouFDeS0GhdVtqH3hBkWRBghUkWKV/EI
	scBt+JaxsYugo/Jygz2x3hst88RVt26WHPG8AoIiPVzcxy0NIgTATzH6fJfBqpg0/xbcN2JAiQ3
	73xx8TUbdxp0L3vK0bFQvWnchPhf/jSMefU8x/O6CEYbF29cuFWVKEcJkk9/CAnh3LhfgJ5/5Bo
	UcDsV+a3fPDLR5yp/UXu9ajGkg==
X-Google-Smtp-Source: AGHT+IGlh9j8ErK64T4ScD+I1yhp+hSLhhu8tQ8C1OBgFV46tBgTiWjpNTOBq5c7bhEw0dyoInj7tg==
X-Received: by 2002:a05:6a20:1591:b0:1ed:a4b1:9124 with SMTP id adf61e73a8af0-1ee4b5bfde2mr2966111637.8.1739246775980;
        Mon, 10 Feb 2025 20:06:15 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73085c8360asm3653872b3a.132.2025.02.10.20.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:06:15 -0800 (PST)
Date: Mon, 10 Feb 2025 20:06:12 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 01/15] riscv: add Firmware Feature (FWFT) SBI
 extensions definitions
Message-ID: <Z6rMtBud/hsKYYIw@debug.ba.rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-2-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210213549.1867704-2-cleger@rivosinc.com>

On Mon, Feb 10, 2025 at 10:35:34PM +0100, Clément Léger wrote:
>The Firmware Features extension (FWFT) was added as part of the SBI 3.0
>specification. Add SBI definitions to use this extension.
>
>Signed-off-by: Clément Léger <cleger@rivosinc.com>
>Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>Tested-by: Samuel Holland <samuel.holland@sifive.com>
>---
> arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
>
>diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>index 3d250824178b..d373b5c08039 100644
>--- a/arch/riscv/include/asm/sbi.h
>+++ b/arch/riscv/include/asm/sbi.h
>@@ -35,6 +35,7 @@ enum sbi_ext_id {
> 	SBI_EXT_DBCN = 0x4442434E,
> 	SBI_EXT_STA = 0x535441,
> 	SBI_EXT_NACL = 0x4E41434C,
>+	SBI_EXT_FWFT = 0x46574654,
>
> 	/* Experimentals extensions must lie within this range */
> 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
>@@ -402,6 +403,33 @@ enum sbi_ext_nacl_feature {
> #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
> #define SBI_NACL_SHMEM_SRET_X_LAST		31
>
>+/* SBI function IDs for FW feature extension */
>+#define SBI_EXT_FWFT_SET		0x0
>+#define SBI_EXT_FWFT_GET		0x1
>+
>+enum sbi_fwft_feature_t {
>+	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
>+	SBI_FWFT_LANDING_PAD			= 0x1,
>+	SBI_FWFT_SHADOW_STACK			= 0x2,
>+	SBI_FWFT_DOUBLE_TRAP			= 0x3,
>+	SBI_FWFT_PTE_AD_HW_UPDATING		= 0x4,
>+	SBI_FWFT_POINTER_MASKING_PMLEN		= 0x5,
>+	SBI_FWFT_LOCAL_RESERVED_START		= 0x6,
>+	SBI_FWFT_LOCAL_RESERVED_END		= 0x3fffffff,
>+	SBI_FWFT_LOCAL_PLATFORM_START		= 0x40000000,
>+	SBI_FWFT_LOCAL_PLATFORM_END		= 0x7fffffff,
>+
>+	SBI_FWFT_GLOBAL_RESERVED_START		= 0x80000000,
>+	SBI_FWFT_GLOBAL_RESERVED_END		= 0xbfffffff,
>+	SBI_FWFT_GLOBAL_PLATFORM_START		= 0xc0000000,
>+	SBI_FWFT_GLOBAL_PLATFORM_END		= 0xffffffff,
>+};
>+
>+#define SBI_FWFT_PLATFORM_FEATURE_BIT		(1 << 30)
>+#define SBI_FWFT_GLOBAL_FEATURE_BIT		(1 << 31)
>+
>+#define SBI_FWFT_SET_FLAG_LOCK			(1 << 0)
>+
> /* SBI spec version fields */
> #define SBI_SPEC_VERSION_DEFAULT	0x1
> #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>@@ -419,6 +447,11 @@ enum sbi_ext_nacl_feature {
> #define SBI_ERR_ALREADY_STARTED -7
> #define SBI_ERR_ALREADY_STOPPED -8
> #define SBI_ERR_NO_SHMEM	-9
>+#define SBI_ERR_INVALID_STATE	-10
>+#define SBI_ERR_BAD_RANGE	-11
>+#define SBI_ERR_TIMEOUT		-12

nit: Space mis-aligned(^)	^

otherwise
Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>+#define SBI_ERR_IO		-13
>+#define SBI_ERR_DENIED_LOCKED	-14
>
> extern unsigned long sbi_spec_version;
> struct sbiret {
>-- 
>2.47.2
>
>
