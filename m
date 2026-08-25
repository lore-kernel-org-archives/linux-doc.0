Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACAD385D89
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641596; cv=none; b=IrSVGhOFJhJ3aX/OJbu0d0hA6FbgXHXScYtF/Qs2YjaiY3M5AJrvDu6CAPlTi7toz/Dd4QxweZM7Z432TxtuO/b2WzWCT/YznjRrM+0X80wSFZXWpZwDqpue84kpT5JPFCcVu4f2uG+uZcDEm2i+Ux2XfzAQ8EZyULhMOv3Yy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641596; c=relaxed/simple;
	bh=Q/8gSOHAJgd2SRYbzG1DwwWvl7MRYBB6FR/wRRWch5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utKiwfyLzKEYUvqtWYWQT+MjMKnLznXcWEudH0z0yRIyu9+D2+E3MmjgHXJcqcHTNOunf/olVM38bQP1bcdH58EbcfJE1Q3OuVFLa7IKVSvol6Rxk3m+mpARChWStH7tXlqv0KHP+LFdBbhuHH3m0BoRFrVq1FnJQ0b+4dFM7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3aSoxu1; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3aSoxu1"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso7500828a12.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641593; x=1788246393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3xyRM/wAlBwrs4J1zBbo6tL/K6FbpaVSr4RYy/4QHY=;
        b=S3aSoxu11IgAIMElTVXsiHCdV2lMRsNMwOjxCismqj0gwIulpLrcoj/WIeJa2Ac/yy
         7Z2S+4UjFGiFjvHVuWJj4AViCZ8Ew9JlIjib8LSd4SzleK/vnKoDlxrMPrvaOzCa8n6H
         5iQ8QXGFAlX3phvv5HyUoEvE7sGJSa3j4oryPHxRZoiuyIpSjVwpbWEuPxNcQt4B55Qy
         HbKJrWo4Ft9SbwgHGVQnEJ+qXDiDxrzhkiT/beSOFK1OWMrvD6yAyz3LTcTbxt/VQakO
         o2Yxh+j7wf+8uBK4anXPbcQkxJBWXysNYdcbS5kYLbdljCKpu1xpoUeZYa6FnJNe/lyj
         siZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641593; x=1788246393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3xyRM/wAlBwrs4J1zBbo6tL/K6FbpaVSr4RYy/4QHY=;
        b=Cff09mkQ4Q0p+f+/KG1WxREcTOiSoisy2jEZa65syQe5bGD2IcWWqMtZaOisrMW3g/
         hrn1Y39YI6Fk/IoIR43vthN2PeZxPwAOJwzhUx94JBng4Outk4ZEO4+H5ggzFpq9/Buw
         RlWdnAaGFSxws+CUWzjGCZ/tm4DTOWFj1FPD4D+FhgXslyiXbyOsoAGMehaiWw22Ji3N
         bU4Yx3K1paxRXjnxn5SaV48Sn9cSCzDF2u7S9gtGDm2QSBP2oRtp+XOS2WB7va7Uz8rf
         m8yA5bZ4WaUa4+bwMxfdcnTl5CDj6cWonquMVyBDOHOJ9PuFXDEnQtZgvYdoJHP9t9sv
         BmvA==
X-Forwarded-Encrypted: i=1; AHgh+RoCV4S/JgiMH9Bb7Nl7ec8fQ6bYNO/fUgOdm2HmVsid9tWRgrpi1JFd0l1m3CVfjtcjRkOzDWsoEkU=@vger.kernel.org
X-Gm-Message-State: AFuF++mDFx/2qr2tYgSs0t2ncrSID1FMkglHw5dKBhGl2f6GOh52/9sU
	M46WwCtkzd8C+FEiktJENl5SA0w/mIh1FfpeawsTKgHAPI1zZLnDIWqS
X-Gm-Gg: AR+sD107XNYp+5SfpoOAUHeMbJipIStUMtgWFCU5OF8DRCkDdWtih8z/BB5Q1buEUQ0
	2FscsrgsyB89Fcv56ek56HIKQrvgGnwRag5GP/j1fL2t1boOpQqiIWJlEq0/KbIufaroMVL0UVy
	Lf7fmqcFN6ez0wiBHgyh5ZL7Vmg2Xxkuz8Aqqpv4w/ZXXpkEyO4I3+bN3cCZXKg6cfQQMP4aAXg
	n7o33po1ujEAkxTeCChhzjCLPm0BqlR4I4mEjdF6APi0bFkKK/3P/fXFeUX+w04HD14+GDlPpDq
	vkAz8+7fQ4MPMc3KLIm7oqbMC5e3is8goat19pTUGP3UprZg2nGHts/LYz5EQXCjH/JCNFfTXAH
	yrJ9uaZvZp4TFM1PuE0AvuoSs1DbiYGH3qO/U3d3v/CvnHJ+CM5oxQKSyYqLx2ICI0Y+qqsiWHc
	BgpNpln+kGKKCHtjaxo+UhEF+ZlKqFyyDVD7PucJXqamZuzFtZCSNUdylKddBuWaxAQ2LVONSsA
	ZrBDh+uA3rD5K1Ggg0HRxSQ86nR+HHjbaysRgZXpMRAFN1SnukwIx3EB/pTN9QK5/CY+ELEqe6H
	h24LptJGiTQjzG3qmEP8JyQKABXRFNSR+LQ=
X-Received: by 2002:a17:906:a353:10b0:c1c:5c90:1bb0 with SMTP id a640c23a62f3a-c246a353d2emr2513381166b.8.1787641592969;
        Tue, 25 Aug 2026 00:06:32 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1565087966b.15.2026.08.25.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:06:32 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:06:31 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Francesco Dolcini <francesco@dolcini.it>, Frank Li <frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] arm64: errata: Add NXP iMX8QM workaround for A53
 cache coherency issue
Message-ID: <f5nfbi2lmc73wtxxmzs4damrjtd67p4eb4p2zy5ssqrc3wohne@cjcxqua5dps6>
References: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>

On Mon, Aug 24, 2026 at 12:02:04PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> According to NXP errata document IMX8_1N94W[1], the i.MX8QuadMax SoC
> suffers from a cache coherency issue (ERR050104). The upper bits, above
> bit 35, of the ARADDR and ACADDR buses within the Arm A53 subsystem
> have been incorrectly connected. This causes some TLBI and IC
> maintenance operations exchanged between the A53 and A72 core clusters
> to be corrupted.
> 
> The workaround requires:
> 
>   - Downgrading targeted TLBI operations to broadcast-all variants.
>     Instead of patching the low-level __TLBI_1 macro (which interferes
>     with the REPEAT_TLBI workaround and causes excessive over-
>     invalidation), redirect high-level TLB flush functions
>     (flush_tlb_mm, __do_flush_tlb_range, flush_tlb_kernel_range,
>     __flush_tlb_kernel_pgtable) to use VMALLE1IS via static key checks.
> 
>   - Upgrading IC IVAU to IC IALLUIS for both kernel (via ALTERNATIVE in
>     invalidate_icache_by_line) and EL0 userspace (via trap-and-upgrade
>     in user_cache_maint_handler with SCTLR_EL1.UCI=0).
> 
>   - Disabling KVM since correct TLB maintenance cannot be guaranteed
>     for guests.
> 
>   - No need to touch SMMU Broadcast TLB Maintenance (BTM) since i.MX8QM
>     does not support broadcast TLB.
> 
> SoC detection uses devicetree compatible string "fsl,imx8qm" or
> "fsl,imx8qp" since the boot CPU MIDR_EL1 (0x410fd034) and AIDR_EL1 (0)
> are not unique to this SoC.
> 
> [1] https://www.nxp.com/docs/en/errata/IMX8_1N94W.pdf

Hi Peng,

I tested this on our HW and the random crashes that occured when both
the A72 and A53 clusters were enabled no longer happen.

Tested-by: Franz Schnyder <franz.schnyder@toradex.com> # Toradex Apalis iMX8QM

Thanks

Franz
