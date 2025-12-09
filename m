Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B1B2FC86B
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274519; cv=none; b=bg4LLnf54aUsFjfdvUM/LoY7XrytqBT4RvFDLWBMJWrtlI115UMZOs3uLDvfCIkQwy/98yYG6cO4b4NAk7SewH2rFSNimDKJB0e9VJUZy1kwnkaYsdbbWsga1McLXDvZZXOwKH2tkXoGlVxRVgPoDyeI3r07QIOcbt2Cah/Buls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274519; c=relaxed/simple;
	bh=27zc19RUqiobn1FdOI9EJekgFOJNVWDQv0dVuHpl1pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCTY/Q92de8gyAsu1frZseZ75KfEQ1bnOQbk6SD3V23QqUg0t/mNIbNV3Ms06M4i4YX43DUkoMeD6cywcNjceAHFYKiXUqTj+Ir/sNBvIJdaj+1GOseQrGx4X39bmdV+e6MZWnjmT9x0ctqfXSYhLr44PpVk3mOAYUezVIrRF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ev+5iRxG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ev+5iRxG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso51148465e9.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 02:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765274515; x=1765879315; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4iL3RBpVh7pc34QSUOCK2Mk0ozYK7xld1FEeAxyl7I=;
        b=Ev+5iRxGHXXbBkrITQcfbGu78SsUX4MWXqVbNbqJqXgQHH0YETvV/+bvP/+cNGkJxt
         mvNGi1RIOitZ/+PYzjbQXeA6imPXu+K3tko/FTapi4Efg9kN7HgCDKsSbCQJ+fFnzsU6
         mN9qm6sEdjfWHxvu3ff8iWKSgT8eB8xafVEXSvOt/wPVc/bBH+UIK/RUrEruZvsSjzFQ
         BynULHWApeTt/c2i0yfuFi+sfPlpIsT8YQbL1FGOJdLwDoAReNkM1/nzcuizHJ+gw5yK
         oBXPrtpE+NrHPU44OU3F2HR5LZGDSyZ/RXa3iUYrrixtgcgmIEiCF+ApofKJBkGLVViP
         xjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765274515; x=1765879315;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4iL3RBpVh7pc34QSUOCK2Mk0ozYK7xld1FEeAxyl7I=;
        b=jnN77Qz1V8K28C9rzbW1ivR2gMrb3ytEkUmIsw8xepwExF+wNUQn1+EGEweigdfySH
         GXSY8NOybI3Xq/+EGaTSYL5TzkiiU6trPlv2lHcYOUflc4S8k1COdkUwLam5+zwK2poT
         LQVcS2uQuzwzTQzIfAN/DgBYJOiuma/ARASogJoP1jps1lMM/B1GrJyepmv11DfSOM3m
         l05YR8VSHQHbJTq7Wt54kMR+egvXK/6ji5m+xBb/YVG+GPhAv3S2MB0ojaceJCBQJUz7
         HQ6/wg47QBzS9Ns12kDRj3RTw9XOseSTvb28oPUnMEnxtMWiwFtJgkqh9+zi+VXzZrE2
         FAyw==
X-Gm-Message-State: AOJu0YzmiBgii+jRO3ivYldD/FVx71Sxtryu262Gcxw11xy43HV24qpd
	OxQMBrq3S+9EQLd4NW8lkPRuqYGUDiAxNVmuqEBQJpK+zeD4swELI/F3/c6n71ePQ43NhYmbVZU
	1p/xpEqo=
X-Gm-Gg: ASbGncuujtNtOzoInvmWXvNFduBZCKWnHkddR0XRDPwyJROJcpnLovDxIpn7MPv+njq
	ZS4qlrfbxp/mVPHGNCQZ6oCdhpuroHfAPer1N2YBYvj7MxTFLvz6s7TulIVCPwLufRcp7SXNmyf
	VzZetA0RIgw3PcZZdwh2XDdHAQzT58DyXiaJNRkPouJ2cVou+0wxDf17HiitWpM6Ngf90/LEDc7
	rehTE1pynKeG7xNZHkG3VDo9nDEeKI0+H/i7EYi2I7lJVIMP0LRrUWPYYKqUehBqP/Z1B4RFEn2
	lyZK2qxOreh4waq4YGLkdAzZS3V2LQZYzSKjzT6mncx4dpn5BjdLF3h1ziEwUA54Eq/rFboWkpH
	bcqIlwT3gRqV1UIfkKuJ4dsmLJRJdke2SMuwrLkPASj/yHCyH6VaVVV6Ut3RiccMvqK6NhaGMXL
	dyvs+vZK/X7haEmEOsqI0esGxnYPlBy7ztvKcJqA==
X-Google-Smtp-Source: AGHT+IEjifALW1HIvd+cGciFhHDvB7hgp9ovQvuKqeyygbtUagjmrvXtp5XRHCETPhXRmni4v2mN/A==
X-Received: by 2002:a05:600c:888e:b0:479:3a8e:c85c with SMTP id 5b1f17b1804b1-47a7f969677mr7844355e9.18.1765274515072;
        Tue, 09 Dec 2025 02:01:55 -0800 (PST)
Received: from r1chard (1-164-67-35.dynamic-ip.hinet.net. [1.164.67.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf686b3bad4sm14639150a12.10.2025.12.09.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:01:54 -0800 (PST)
Date: Tue, 9 Dec 2025 18:01:50 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: linux-doc@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH] docs/x86: Update AMD IOMMU specification location
Message-ID: <20251209100148.25284-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)

The current link to the AMD I/O Virtualization Technology IOMMU
specification (document 48882) in Documentation/arch/x86/iommu.rst
is outdated and points to a defunct URL on the AMD website.

Update the link in Documentation/arch/x86/iommu.rst to the current stable
location for the specification. This ensures users can easily access the
required architectural details.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
 Documentation/arch/x86/iommu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/iommu.rst b/Documentation/arch/x86/iommu.rst
index 41fbadfe2221..9b8b5e514e35 100644
--- a/Documentation/arch/x86/iommu.rst
+++ b/Documentation/arch/x86/iommu.rst
@@ -5,7 +5,7 @@ x86 IOMMU Support
 The architecture specs can be obtained from the below locations.
 
 - Intel: http://www.intel.com/content/dam/www/public/us/en/documents/product-specifications/vt-directed-io-spec.pdf
-- AMD: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/specifications/48882_3_07_PUB.pdf
+- AMD: https://docs.amd.com/v/u/en-US/48882_3.10_PUB
 
 This guide gives a quick cheat sheet for some basic understanding.
 
-- 
2.51.0

