Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982192C159A
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700462; cv=none; b=GQLKTaqklrwU6sxIOQYUF8/H46AmmoPBT1CVH7wimZcYRS1H8La5QwnjyPecxv54XpGb77SyxPu4Rsjc2B4B6yG11N/gNVQKcW05jOvvOjGAGEY2t00Z3YOuYX+jzUWmmBbK4sUMfBoAAaZnJmTh9fXjCtIwEzRZzHvhFl2Ojt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700462; c=relaxed/simple;
	bh=hr/f1/qoxYAV6yNHyyt9Ytzb2s7niqZHq8CGNFSla/E=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Guu14YjgK1eJa327irvzSFeg4B8JM6PIOOyf4/zXcpRr1CKmJZmqBln7KIXEfMTsGo6oJp87tDVmeOz4rPV78m7/MaGvjnAuzJGEvAVaRjjI61ldjrHlBDt1viI69lpiwx/vT3gMZPBGG1VFtLOoba8J5cz83LQOlLglTkJqkhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lm+Pl4lw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCFmthxS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lm+Pl4lw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCFmthxS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9eVXY3143774
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 15:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScOC4GuemLF+vD6HqYRKrExatm0/7pF+N+hUpuGlD6w=; b=lm+Pl4lwNanlF8MG
	x05/DQHvA9ngneLxFBxDmTgdaEi2lEc9+nA+8s9bmWNXByRIYIVPCErqeYr5CYxD
	EhuAN+7e5w20mADS3ka/V9dwiShZl6g//O1JD4+t1D1q3dBCOBeIPst1Sltynwf5
	plcXSMY0k1wG1E8KiAEoa2SoeuInJ0n2JJoqfdXZi1mZmFmhgjhob6nteDNrdwtl
	m+XeoiHKr5pjeWJewDgTtjuGc9ro4f01UwfaKq7UZDFRLs4zjS5EmvpwfdCkbWdY
	ppUmw3mo+W01rOKceE7Zf0mUu2mvzK7SDZZG/VIpp19mvArQMm1PMQHkE8PSbnd8
	Js1agQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byqpxkj71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 15:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so326083985a.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769700458; x=1770305258; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScOC4GuemLF+vD6HqYRKrExatm0/7pF+N+hUpuGlD6w=;
        b=jCFmthxS7ZwbHFiNLo/dBK8Qu8TDq5vDkThr8blrgYGLDj7qiRpsMHKEzH7QKu+lHb
         ByCtgO7qUyhXIaa+80jCI+XVKe4UIT2sE9zzfGqUiLlBzgSNCDvXr3X6HioGdbMxWR3c
         RXIJeBo13cT0tVbEb7yHO7Fyd9u9nCcrjnyZCWXLe5YSv0dMUTv/z9mInbqyA09qDClw
         AOLvRX9n+tQBGVnOAZsfj99gtpeM8QKJvJ3UgYVHH0DKFLVqdMikES3zJ9oZf/pUwr8D
         1x7vjQLCY4cNqA44uGjjgZlKbj2JQhTWZrYtPmSIGtTcxkt3GdQDbAn9nJEmS5KENrid
         +5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700458; x=1770305258;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScOC4GuemLF+vD6HqYRKrExatm0/7pF+N+hUpuGlD6w=;
        b=emQDLiBFCYLwCtDG0b5DCwNxpkUoq4qkH/Vdi9XVcXUzFb1BijJGgakmGFmEAXwP4l
         3N8b3Vp2StLbgcIwENGTOKz/b7zSRfFaoWZF6RAxcT/8CjBgx75okSPiLdk4TffsHv/9
         SmRXMWUMWf7GeDngxQkfr7M5ySgzfS7pWaqpEP6oMdxFgXEtTnl2wfj0Ky63WvW17DMH
         BXdD7k7EoM5HEppYJ6KDnPYPb2Nd7ud9wOxQc5MlXjvVpoNnTn9wbDsWaEJhZ2nbds7E
         NoTLdWXaCqK1OcmR0+aS3BS6Qi0iRpsOxDC1YqZAkkZ3GntFnmvqZP7Ve5Sv2fwZYLmR
         3FiA==
X-Forwarded-Encrypted: i=1; AJvYcCXL8WQx7Tqqn5/6q/nO4Fl7NeY0TvftCrO/pYbJyDxL98DqNZG8RzmUNBYZTh2eCwuc1VQxz1sX4EI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeBuYPrxNcRb46GIDz0N9EzEQ+QNovwlUTnTAyCNARCu1MVeWw
	26Ssp2aQFMQ1+9cMWxZ5ybh1yybsKQU4H6eN6LzS9WFjeIkmuEakmlLIoswYOJGsHZtLV+0sxyg
	YIm6658yrgvwfYgJNa9KEC0QEZo+SfOMWYSMe4fx4FcD+3XCNcPujuKStxWc0X5Q=
X-Gm-Gg: AZuq6aJQAa1zobBA1HPcAs6NyqNR2oV/0/dsdJlVAYCtfXLPdOoiaaxWX/2SwrnkPNk
	vH3tWXh+NIC8YImSBa4oiIUC8l7UnxPqWT/FuL+i7wyfN46VexXOkGmdGpcwWFE8Hh5o2FESz+N
	agFJYktrwUq4ABk14BRLevL1OSIqOEV6SmyFDCyokOqyclLXzYX/nZrL3jyoM6VPUWXxJ1li6qO
	s14C1m2iBXz9EaviyVT76zlYKpeJnff+7PdqZsVtaT60q7ZoI+dFloXGQbBuEP25mF/YRJZTDJu
	Z4z/PelxxeJV/9hdia06h1OxjIw/8UcFdX9hoz63RS2cfkEeWdVSm8r8U9I94oQeRmYYFJvmoKg
	AKwU6jHXfWVLPiC2bLsQE0e957leGYnpS+GfJzPDg5l6hOKqd
X-Received: by 2002:a05:620a:bc8:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8c70b92cc4emr1250375885a.88.1769700457644;
        Thu, 29 Jan 2026 07:27:37 -0800 (PST)
X-Received: by 2002:a05:620a:bc8:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8c70b92cc4emr1250369285a.88.1769700456838;
        Thu, 29 Jan 2026 07:27:36 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cefdsm15219531f8f.23.2026.01.29.07.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:27:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 15:27:35 +0000
Message-Id: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <andrew.jones@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Support runtime configuration for
 per-VM's HGATP mode
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20260125150450.27068-1-fangyu.yu@linux.alibaba.com>
 <20260125150450.27068-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260125150450.27068-2-fangyu.yu@linux.alibaba.com>
X-Proofpoint-GUID: hcdJLiNyCfglim_hX9Enudm5zP7YrmIK
X-Proofpoint-ORIG-GUID: hcdJLiNyCfglim_hX9Enudm5zP7YrmIK
X-Authority-Analysis: v=2.4 cv=dfSNHHXe c=1 sm=1 tr=0 ts=697b7c6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=f4C2yWSDeSD6iuI_DtIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwNiBTYWx0ZWRfX+SZvrlNbkzWe
 hiteFEKEKAGwD4pLXXiTF0uL4u+feZh5tZatuIs6pL+KDJw2W+wRbuzfGwd5XE3Kn1K4GEQzL92
 1m2xD62/2MTK0nVX9NMcbb5JN8iQ1jhS7f/JwDvUMAyXIWFO6Eqp33H7Mp1JR8mtGw/HoB47DZt
 Nt/CZBio1bGtDOQizhzYwT6wmE9k3ddF+ICDbLMvKJ+bcvXytdcQ3ezxLF9FFprdp8Z8s2GHeXR
 WQK+ugUWM+xfv58T6Ez0aoRe+LNR2vIXzj3qJRRqhcvEWuSpIBNmkSHDkXhvamQ7EFkoURQBYBg
 L7KX8k7LmQPc6Bfe6jXrsZt2UkmOlgXvjb6b7hYRF3/jHLVcsMKxvQFDcgatAmqTSjHo7yZNeQt
 71N7fjeKyGOI6UXuPUMfcVXYBmU7yON1C51L5FVPtG4fZc7dI1o51WmyGTfumLFL0AksyJkloxM
 YNUgXwVWbI2/nPVFO9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290106

2026-01-25T23:04:49+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Introduces one per-VM architecture-specific fields to support runtime
> configuration of the G-stage page table format:
>
> - kvm->arch.kvm_riscv_gstage_pgd_levels: the corresponding number of page
>   table levels for the selected mode.
>
> These fields replace the previous global variables
> kvm_riscv_gstage_mode and kvm_riscv_gstage_pgd_levels, enabling different
> virtual machines to independently select their G-stage page table format
> instead of being forced to share the maximum mode detected by the kernel
> at boot time.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/k=
vm_host.h
> @@ -87,6 +87,22 @@ struct kvm_vcpu_stat {
>  struct kvm_arch_memory_slot {
>  };
> =20
> +static inline unsigned long kvm_riscv_gstage_mode(unsigned long pgd_leve=
ls)
> +{
> +	switch (pgd_levels) {
> +	case 2:
> +		return HGATP_MODE_SV32X4;
> +	case 3:
> +		return HGATP_MODE_SV39X4;
> +	case 4:
> +		return HGATP_MODE_SV48X4;
> +	case 5:
> +		return HGATP_MODE_SV57X4;
> +	default:
> +		return HGATP_MODE_OFF;

I think default should be an internal error.
We can do "case 0: return HGATP_MODE_OFF;", or just error it too since
KVM shouldn't ever ask for mode without protection anyway.

> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> @@ -319,41 +321,48 @@ void __init kvm_riscv_gstage_mode_detect(void)
> +unsigned long kvm_riscv_gstage_gpa_bits(struct kvm_arch *ka)
> +{
> +	return (HGATP_PAGE_SHIFT +
> +		ka->kvm_riscv_gstage_pgd_levels * kvm_riscv_gstage_index_bits +
> +		kvm_riscv_gstage_pgd_xbits);
> +}
> +
> +gpa_t kvm_riscv_gstage_gpa_size(struct kvm_arch *ka)
> +{
> +	return BIT_ULL(kvm_riscv_gstage_gpa_bits(ka));
> +}

Please define these two functions as static inline in the header files.
They used to be just macros there, so it'd be safer not put LTO into the
equation.

> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> @@ -105,17 +105,17 @@ static int __init riscv_kvm_init(void)
>  		return rc;
> =20
>  	kvm_riscv_gstage_mode_detect();
> -	switch (kvm_riscv_gstage_mode) {
> -	case HGATP_MODE_SV32X4:
> +	switch (kvm_riscv_gstage_max_pgd_levels) {
> +	case 2:
>  		str =3D "Sv32x4";
>  		break;
> -	case HGATP_MODE_SV39X4:
> +	case 3:
>  		str =3D "Sv39x4";
>  		break;
> -	case HGATP_MODE_SV48X4:
> +	case 4:
>  		str =3D "Sv48x4";
>  		break;
> -	case HGATP_MODE_SV57X4:
> +	case 5:
>  		str =3D "Sv57x4";
>  		break;
>  	default:
> @@ -164,7 +164,7 @@ static int __init riscv_kvm_init(void)
>  			 (rc) ? slist : "no features");
>  	}
> =20
> -	kvm_info("using %s G-stage page table format\n", str);
> +	kvm_info("Max G-stage page table format %s\n", str);

Fun fact: the ISA doesn't define the same hierarchy for hgatp modes as
it does for satp modes, so we could have just Sv57x4 and nothing below.

We could do just with a code comment that we're assuming vendors will do
better, but I'd rather not introduce more assumptions...
I think the easiest would be to kvm_riscv_gstage_mode_detect() levels in
reverse and stop on the first one that is not supported.
(I'll reply with a patch later.)

Thanks.
