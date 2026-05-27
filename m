Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E8D42EEC5
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899716; cv=none; b=S+1QY5p9iVAbsxSdNMg/EO5FBupKeEsAxWWe+OgFeENx4dINIoq7OWiWdz+PEnreEchYRXjdGAbKNhieUbtJcfvfo//e9oHPXbmOaZdQLgxfT7cQX3DA4FwDvNT2CY1emZlEKlg1GqLLz1l7uIpJiIJ9qlX4h4sj1gIfQCtmeQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899716; c=relaxed/simple;
	bh=QDw8Jsuw+6AP8iu7lgfzYciOXYThi6tQVsbGIJHSjOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGB3kJjxlVblSL3qHMZ6ALe+VNulcw1kYyyeW22Vd9H7arUhqeFdTpXfNCOKd1Po8fg//Hi8AM9IMpTMAILY3fBdUcJdYPwqlL0cC3DamH+XzDduFu+tD5OmKnvWTDQr6Hl7s0OuPbwWlYUqtQ7cD/501CRzSqqeto+KVFk5pE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OljyIpPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdKxPXrA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OljyIpPW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdKxPXrA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RA79MN1150174
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 16:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3o/qC8F03FVtWvVL+To0ZZ8G
	ZQPvSZaDhCCbgVrIpSk=; b=OljyIpPW1Bpt0pM8Vh+sEa5MvLEqha4zmw6RCVwi
	21zDtiVA67hiZVBT63mzSLd71m798KJCmzz7Cb31jIh2FIDkxXrBHMc+l5sB4RtO
	UYUoKMTW1TJERhd310gbTIiI2uTZcazPB+oOedZ94Kl0yN3mjmPOXQEB0C2vw/zP
	ThGhorK1HP6NZB7dpThJKIS2iW3vQ03ZPDC7smO/GG2cAKAmJWEv7QY7Rw2MZKqO
	JA1vqLu7t+k6/9LibvGr+YjcCi92vj1FS/gHIbDNmIZfeJ9qUc/E8pwXycGG+sgH
	TvEovUyhF434EdvWvxzbGJ/vrcaUENG6/J9vpRGIMb6NYQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxjshgge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 16:35:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so1244018eec.1
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779899712; x=1780504512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3o/qC8F03FVtWvVL+To0ZZ8GZQPvSZaDhCCbgVrIpSk=;
        b=GdKxPXrAeKQBxH4i/v24LgNK5lAfhtaU/OR669oPgXQDi39h/rIwVX90yL6xolFWzV
         db3/OEbGOn/5ERmatLHxzRpnTGZs9V+ak8p6kRTDezj43lN/LoFEDEdjY7sVbZZ4LV/G
         S7LZ/0XzKY9Y+5TOX5p/xVZZq7/f1pDCbxHqRynpd/5lKTjMk5XiA1If96gQ8DrX4c43
         1AFuxnFEPnQQe3HXRH9zsEvB+BGP41zOVaK9uAT/uITGPRd+e59qT+Lkk9thB4oKLmb5
         HaAjhf85WtixcLP0vI8KJbl1qmekS1FccAMxo9DcVMPpz/0f/8JSYCS4pf71TZ9VVeZp
         WrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779899712; x=1780504512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o/qC8F03FVtWvVL+To0ZZ8GZQPvSZaDhCCbgVrIpSk=;
        b=PTBvezupzQ0yrQnrzVRYBCyLVjIGJBmfMfPVhPLVvPedW+HwvPAmtfHABUlQbYcqLp
         ITWD9q2nB8GyZ1zgRBkdUiMB0KGcuiTFa5vR+tESCllSfy4m1v7mm+xZLVI+m87k2AAM
         SJBRYezwv3Ht3jw8LhVfDXEf2bPcF4RuYc/hvjw1uVsvMcTie+woI61n9qhr++GXVFJ4
         fvewvWswxzvmnBjwOaa0SCkkKLu8bHgELf7L494HFf7qLcyK+Id/025wKHtdPQXyuFux
         ancNdWtTNg4pe5wLLgti86bhyj5yuimlufp8D0ovecr7LsfZUALKjHpD/owf6o5nGgpr
         ptxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hGAoQHieE0p9hLUjfCbnOzOwoASglEHiBM6kJycbxAcsuqvP5OPvtclpcIyKf3JSHiuVOqtbo14o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLnwM5/91HvPm0m9hyFa5gbLUjNyKoNfiXuPvC8uUQSvpGzo0G
	WpVEcbeohc/RyzW0MIdAHF1jaIuy4szuaGwpczR0mgoNqXIX9VXqfEddDc89TmLyVwdiSIatfEX
	NaYStsK/Yniq12kh1H5vG8xE7Go9aBdXIj+zvduQ2M/yBzZCvYwvrcSFRLgmUAcY=
X-Gm-Gg: Acq92OFiPnKm3IFuXCfsVvh+xUku6cW/Mws7GKHZEDDrggdjZrmjo8k5PGlUan2mw0l
	QqQGpbfXF8cGqNyGGJL69HZNfp5PVKbptouebzYNCMX6jyFtyGVgPafm96ug9veN2g2WlJn4/wr
	tNDrO9eX7fZyMh8cXzJkZgXQAbuXtoUKjCLcs99jLHtSI0iKrN2ZPpPhvcn2vt0GTWqZKkJMfsQ
	XUDx+9dA8NC9arw/rlfCryDxm/vZMPFZufWiJABXIHUaZkFQrEiTn5sfQKU7oaim0DnoYpAHXF5
	32dHJE8DR82pptouAW4xCPhV2gN37ppRjQ0orXuBCbaqpEFUT488UdxvzgmMMse5F8pJ52DHwJv
	D6xCX5AHqMA8lhZWSp9v9TtGiu9bRkj8=
X-Received: by 2002:a05:7022:fe09:b0:134:ff2e:a71c with SMTP id a92af1059eb24-1365f600b14mr8303624c88.9.1779899710833;
        Wed, 27 May 2026 09:35:10 -0700 (PDT)
X-Received: by 2002:a05:7022:fe09:b0:134:ff2e:a71c with SMTP id a92af1059eb24-1365f600b14mr8303599c88.9.1779899710070;
        Wed, 27 May 2026 09:35:10 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13381153c88.15.2026.05.27.09.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 09:35:09 -0700 (PDT)
Date: Wed, 27 May 2026 11:35:08 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
X-Authority-Analysis: v=2.4 cv=C4PZDwP+ c=1 sm=1 tr=0 ts=6a171d41 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=4F2392DG074ZRd-8RbwA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE2NiBTYWx0ZWRfX6hBMQyxEi7wC
 9qSzVoEp1GexSBfo7ueNTuoRKWMoWhGWsTjp+TVpmixZ7No9BuUEKQR2OXIJjWZa1Y+5THb/8fQ
 D+6y7TEv8LVC6i2zyHaaaFeVAxU8hG0FFs9hZiUwcf6I/Z92MBmpVJfIAWyOx0EsdDpCBfArflj
 ZBqe6uHGxXb+DiFG711FmI3RVbeqgDZKil+HiFzqGIGEB4fDA5YHuRSlqZ54RaUJH+v55RL5Uvv
 QU48hx1A/rfAkdLvldBP5kuplJZkA/ySX9EvY0f8298+zfnHsSDBGxpeJvbMn1hmabxjtI4wqhS
 SpTZxAMnd9teuqHF+DLnGUlLgM461PH+JYkX7tsSylkNa678f5xmNcc84MOz3o4Bg512Vie/BEr
 3F1NkRY3HoFA22Av0t88KD5eQvsax8gOUbaw9et2alGlfgD/t2Chqnw74dsEuQkWh/+KMJ9rzVe
 2emq66zGVMmvA2L/XXg==
X-Proofpoint-ORIG-GUID: r4wxu-zACTElVj3E62KJKhM287Vy30vd
X-Proofpoint-GUID: r4wxu-zACTElVj3E62KJKhM287Vy30vd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270166

On Mon, May 11, 2026 at 09:34:53PM -0400, Guodong Xu wrote:
> Introduce a per-hart and host-wide bitmap of conformant ISA "bases" --
> named profile-class sets such as IMA and RVA23U64 -- and compute
> both at init time.
> 
> This is the cache that subsequent consumers (hwprobe's
> RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
> read without recomputing.
> 
> riscv_init_isa_bases() iterates over all possible cpus to populate
> each hart_isa[cpu].isa_bases, then computes the host-wide
> riscv_isa_bases against the AND-across-harts riscv_isa bitmap.  It is
> registered as a subsys_initcall so it executes after
> core_initcall(tagged_addr_init), which probes senvcfg.PMM and
> populates have_user_pmlen_*.  Without that ordering,
> riscv_have_user_pmlen(7) would still return its default false and the
> RVA23U64 detection path would always bail.
> 
> The detection itself is encapsulated in riscv_set_isa_bases(), which
> takes an output bases bitmap and an input ISA bitmap.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2:
> - Implement riscv_init_isa_bases() that runs at system init time,
>   after tagged_addr_init() populates have_user_pmlen_*.
> - Split RVA23S64 placeholder into a future patch.
> ---
>  arch/riscv/include/asm/cpufeature.h | 14 ++++++
>  arch/riscv/kernel/cpufeature.c      | 92 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 106 insertions(+)

Sashiko points out a few things about this patch which I think I
agree with

https://sashiko.dev/#/patchset/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc%40riscstar.com?part=8

Additional nit below.

> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 739fcc84bf7b2..facc31b2960c6 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -25,10 +25,24 @@ struct riscv_cpuinfo {
>  	unsigned long mimpid;
>  };
>  
> +enum {
> +	RISCV_ISA_BASE_IMA,
> +	RISCV_ISA_BASE_RVA23U64,
> +	RISCV_NR_ISA_BASES,
> +};
> +
> +/**
> + * struct riscv_isainfo - per-hart ISA state
> + * @isa: bitmap of ISA extensions this hart implements
> + * @isa_bases: bitmap of profile bases this hart conforms to
> + */
>  struct riscv_isainfo {
>  	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
> +	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
>  };
>  
> +extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)];
> +
>  DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  
>  extern const struct seq_operations cpuinfo_op;
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 81145621dc378..6e8dd33aa3888 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  
> +/* Host ISA bases bitmap */
> +DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
> +
>  /* Per-cpu ISA extensions. */
>  struct riscv_isainfo hart_isa[NR_CPUS];
>  
> @@ -1305,3 +1308,92 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  	}
>  }
>  #endif
> +
> +/*
> + * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
> + * conforms to, given its resolved ISA bitmap.
> + *
> + * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
> + * used.
> + */
> +static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
> +{
> +	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
> +	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
> +	DECLARE_BITMAP(tmp, RISCV_ISA_EXT_MAX);
> +
> +	/* IMA */
> +	set_bit(RISCV_ISA_EXT_I, ext_mask);
> +	set_bit(RISCV_ISA_EXT_M, ext_mask);
> +	set_bit(RISCV_ISA_EXT_A, ext_mask);
> +
> +	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
> +		return;
> +
> +	set_bit(RISCV_ISA_BASE_IMA, bases);
> +
> +	/* RVA23U64 */
> +
> +	/* Zic64b and Supm with PMLEN=7 */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64 ||
> +	    !riscv_have_user_pmlen(7))
> +		return;
> +
> +	set_bit(RISCV_ISA_EXT_F, ext_mask);
> +	set_bit(RISCV_ISA_EXT_D, ext_mask);
> +	set_bit(RISCV_ISA_EXT_C, ext_mask);
> +	set_bit(RISCV_ISA_EXT_B, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
> +	set_bit(RISCV_ISA_EXT_V, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
> +	set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
> +	set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
> +
> +	if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
> +		return;
> +
> +	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
> +}
> +
> +/*
> + * Populate the host ISA bases bitmap (riscv_isa_bases) and each
> + * hart's per-cpu isa_bases.
> + */
> +static int __init riscv_init_isa_bases(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu)
> +		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
> +
> +	riscv_set_isa_bases(riscv_isa_bases, NULL);
> +	return 0;
> +}

Missing blank line here.

Thanks,
drew

> +/*
> + * Registered as subsys_initcall so it runs after
> + * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
> + */
> +subsys_initcall(riscv_init_isa_bases);
> 
> -- 
> 2.43.0
> 
