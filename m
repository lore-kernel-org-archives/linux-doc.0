Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02B4322B75
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274628; cv=none; b=AeVvrMQDAqiHwp6CMIO/imt+ttDG8C4eGVNrb8GSD+hR9vQcYilKsKOkPj0zw2fSi8PBuBiV4J4xizhvLvKhcyUemxjsKZDPLe3JclbLp6SIbxb/agwgywUlRt9hpKxu1JEnPnxHgBs1vHteEDayKoKczYmYV6UTkUjo1JZwEgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274628; c=relaxed/simple;
	bh=27zc19RUqiobn1FdOI9EJekgFOJNVWDQv0dVuHpl1pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dJw7HJlRkxElgYslJh+vm+aoZ01xyHGjq8QQquTnKQoFTluNDfxtb5xE8FoDoYS9U6eVraFz0LDUK/MCgCFkBQes9lUJj+xO0RbzvpQndqKx2YDuP7NBRWnu/VLOVpWWwYlbdo4J8KOgSosr7DckEAny67Gdy82gM2uOsB/PiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F9SSD823; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F9SSD823"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7277324054so789048466b.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 02:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765274623; x=1765879423; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4iL3RBpVh7pc34QSUOCK2Mk0ozYK7xld1FEeAxyl7I=;
        b=F9SSD823QteOi628F4uWTaxBP1ymGpNmgws0pZZF9IxFAZb3W5LQHkqTCZQYzgQlts
         WgNRuG09hfD3AhoPWPQKQouoysSfKIRScDvJX7RvjtMS+AGrGrPmv/Ha5pjnkaSjvQzF
         OKmiF2K4TUmOkvOrP3mTJ/8MLWqVU0RgstVFSv2uTPA7QGmU2cTN2FoYoiwJzDr5a0EV
         GwRcS2JRHMGA2SjkrlHojxpuUrTQXV/nkHbs7h2lnbi+o6BMmPhJ7KNnDZtwVLouv0hA
         bZghDLz6CJlKrFZL+vNP3nk4biGETZ3WnQRH1AvJYDFO8ZWBh3AchzmHbVL3SRCN8eFE
         eX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765274623; x=1765879423;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4iL3RBpVh7pc34QSUOCK2Mk0ozYK7xld1FEeAxyl7I=;
        b=ddWiRGc9OXkwKHHrVsGuU8KVRgkx6Sr3CDr6lY4QhDDss4XCK6Holrxjmm2Jz31uJ+
         MM0oFlxHZj9Dwl+sPQXN/pMp1AaUFwBDHnHGToXk6hbgNpjb1UwyLruaSKtRBMT8c6Pp
         AEj52K25jdXsVuUfyC8LgODRNZEeIQ8DsWbPvw1ZpepZnLMTSy2KRyS9dhZiOHQX2J6J
         q/wz90JFtVjWRBmhRFXvWvA99orcIAbqAgaMCxTOi7M7rRp5CMdk386OrZdndfGvR1Cc
         sMrrjV/gqoF09dOwrWX+BTk/Kghrz/itSk3cNrVVMhJjiTm/lR86MoaK4x6BpUzKO62E
         AWMw==
X-Gm-Message-State: AOJu0YwkG4T8ElsY3neBs1VK2EmMdtu2DtCVVBRJJ4MaE8IuY5r3mwa0
	XEz5EsJNWPeX9frStPsREPckJ7k98zUEu2p9sg2csH++UoQv8BBBZwscdnUJ2O+kO99uU7l60Yu
	xTl+Y5q8=
X-Gm-Gg: ASbGncth1upfvzb+obVnED2yXKmHbTjt5ncTgQ2QCUZOJm0+CL3HiDdfN1J84Nix9dC
	/6KbClzptTniuXjVwBKT1GUpfpdqigGvMdNTI85laZ11yxMHkH19Io6or6a16MPTstLhsEOzpPB
	L5qtPDVNKRU52wmPkLRI+QsRv1yXKTXsymqX5SAjjgx6gUlXAYyyxT1tobChtp4dE2UScL+xNJs
	/SeNaIzlYmevLg3dxtwurPo8yXNUP1vdUBNzdaM7TcqDI3RVC0IyS5th5Rt1x3TbqNFxvDbE7V4
	A+5SPGFCs4/OyT0jxGCO/cP4PAxR1ZMDfky7qmTTtda/iOZpnHruBc0bDJMTLnMJyQgqJJE1PQl
	PnZzl+J7GzzpBUln1Yf2xpudGf/M8ND5v8c3v90INb5y+Yxokgmvbl5QjmVK8PifzFbF/nvSAnU
	/nzUFwrwPYfTtS+fB9f96OVkt4JK8OmG30NBIJMg==
X-Google-Smtp-Source: AGHT+IGOR7Q9ksYi3EGLonhjlCmTc2Y0MLmq2kbIEJ1uH7tSnVoGK7/bASZaiIrjyzCmOVO6MZKLCA==
X-Received: by 2002:a17:906:6a29:b0:b79:c879:faad with SMTP id a640c23a62f3a-b7a242bf519mr1149464466b.21.1765274623566;
        Tue, 09 Dec 2025 02:03:43 -0800 (PST)
Received: from r1chard (1-164-67-35.dynamic-ip.hinet.net. [1.164.67.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29e4f15accfsm52957045ad.35.2025.12.09.02.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:03:42 -0800 (PST)
Date: Tue, 9 Dec 2025 18:03:38 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: linux-doc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH] docs/x86: Update AMD IOMMU specification location
Message-ID: <20251209100336.25409-1-richard.lyu@suse.com>
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

