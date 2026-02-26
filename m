Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5E38A73F
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772085502; cv=pass; b=k4S1d5UhyLHfrllAcg5MgNfXXQnY796/CSmSLEhk26QmY95cPduCj29eUoR2QrlFZi658JUEJOpYYLCJiH5NWxIK8SyL1HIZqTOPui7Ngw/83FGls5LLVgrnypXUK2rxYPV/dtxAf6NJc5D/wLH7xj8GdtPwH95/y7hTBNiIlgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772085502; c=relaxed/simple;
	bh=+uiRQvIVKV/GlsSk9BknRY59jG7QBiEf2fcYYxWccMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V03GXX9J2NLeeAtWkpXospdJt5EGDurFBfhFMrRJ+MjY0azY9duzf42xep891gAwgAe/LMGqvQv7VU8J8S1cYauzlB7+y4glldfNf5DIMkq/QHZHECVLAPXyn0Zn3Ds2IkORYGwb/07E2BnkCmzn6J9kPS40ln+s8T168AUpXkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3WKY9oH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KN8gW8DI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3WKY9oH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KN8gW8DI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VMNY919314
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 05:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06WGVto43FxvVGdmnMyUzlNLnDWIe1ZIbLMXTt3zPbw=; b=o3WKY9oHfg4/cMhI
	gs1+YiPTIqvHlAMO37lS2mfF30HjGxgXsuO77MhchZOFQa+Hxb/d+5ktqn6st+3K
	eGg9/5xd1vo2BkgQCFxeGg7skSZ0x+cZ4iRWu6YjvXJWfhdGS583npPHtVVKdE2g
	neSXgiCS2O08/S35T1587vNbUSMIf1bfsY/pahSfFhmKEBs3CKkEthXJbj3EToTJ
	GTSiUQIURZc4yWAo8ii4059uLYw8ecN7Jaxy9Ubg4Z4jnXOeNp9/loMo73rLRoEy
	bfH9jwDWu3YN3TcaB/NPqXnaiEGisrUXY1bYc+WjuRdZMCuwdFmTGy74lTkMGhxN
	PeOw9Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4t1nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 05:58:19 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-66308f16ea1so3857337eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 21:58:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772085499; cv=none;
        d=google.com; s=arc-20240605;
        b=iC5BZPnN5Ej8Z67aYLIKXL4f+6B6bITbfnrHfnDQC0IAWz/wRo0fXB/TpBNPgjKi7v
         ISc19XNuZpSRoo/O0zBa1/xuHhvLFZU94kW2Z2bpOSX7/xeduYQq6d8JJkG0S8UdwpkG
         Dtg9X/dyEArrCLJ0R5AheaCLRXpXc16wMpUuyJhR8fGMUxkd6ughz4ICiozDVpB4GidW
         +xUaAR2WFZZmVRMStm/hrvyXdo1OU7mJpctAtwe/QSOfBcMaY8D1HPawe20lGOa+ANDh
         opjeamYDULaDmkeQRmouE0+DxOx+okQbb6J4TMOFqfH1BUZeYqty9McrKBth2n/JscGD
         FN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=06WGVto43FxvVGdmnMyUzlNLnDWIe1ZIbLMXTt3zPbw=;
        fh=J7cLBGqLYb08cFavobRc7Mz8v7P5IJC3dd1jVaP/xeY=;
        b=dbFPeQYpIgXSormDbsKlzfOxFZqCxKiiE+NFHt7hfXzuz+DiBuJYBVH5CDpzuezbp+
         VlbgLR4bteNGuxmb0/yMReVtiz5W7GmoIBdGrgq58TQea82xmHJ+mIOFWKvrSx1gGbjy
         9tYyAqljcBA6AFb+6q8u5JkSDHpgPWqGAc39dR/G/TuZno75fnen014WeYPVS0+iAoot
         zZS8Fw0V+2APB74lG41ZwKc19ePuVsWR+5//9wxWLXhWZeO2/1wFGGFMnzFvXrlC8dld
         QUtBi3lgMVgrgxS2/m06Oxxvm7aksMHJxqEr8EJzJ8exf5eM5BYyTsVyvYk3rGs6J4UE
         fLNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772085499; x=1772690299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06WGVto43FxvVGdmnMyUzlNLnDWIe1ZIbLMXTt3zPbw=;
        b=KN8gW8DIz+DTkuERhTryS6YgfOTYkxbIRguPIA1361zP5U6K28H1iphCZsOy5Z41JY
         k3q2SYsmOVjJqxIEmlDhJlJCNV3RB6HiBGz2mh93KT50w2nK1G0/Y1EkjP8ZAAsCEkNp
         dRtvFVQEtIZJXlmtgecicEOyMqec7hjX/FxqE2EtFdzZMY6rSltsCfZKB2CkZ82DNYy5
         PJEpdWHRHl+7uqwNIvY9GXB0IyAiRqy0jvkQZNJOjhif9XHNdLVamzfnSKw0kGYRLucd
         SfU5+jBGCLHiPLw167JWobnwQhm+fuLZTkP5aImMkwmDyyU9zSd7yuLUjNgcYK4+ZLWl
         KoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772085499; x=1772690299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=06WGVto43FxvVGdmnMyUzlNLnDWIe1ZIbLMXTt3zPbw=;
        b=SlYuTd2un8lPUo4KP20o2WwxNJJDeUvkIwC3AXhqxl591bVOt9HA0IJTiKI7Ynnb97
         uZ2nnYLVONuEnKVgABxkMnm7DxVGRZAAA6wgR8713t23PpPFYwpcIxAmdD5RrcyajJIp
         zwMwDMAkas4vDkB3X9wyzUjUKndyiR0HSSDWmnwaCcoqwNnN7gBPyDTbJtHL2Pzkk8KL
         qzfoTdo/WW+m2xidzlvZAvej26+NDom7IrQ/mABSA9ABvnMjd3U9p4kI2LzzRAKaK4bU
         WEJg5oDfqLB4c1Srx26AoAUGA6/Lt1gJK3ca4Gk1777kfX2migd26mW+Yqeg7kNgMHzh
         8XeA==
X-Forwarded-Encrypted: i=1; AJvYcCW7eg4a51fzYxaXm8H4fZc4NBXE+D+slerGA0rizlKN4r6cx0MgHSeSjyedBCQtE+QvtUw/ENWNL8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwIGquSrWqqKKzGlpZpRwTZlhGoBDjacrB5w9yCd0qAVi/pS0y
	i1pszHnHtqUabeRc2qE8rNm2n16QJB/7grK2D+5ldK7h4ZFbHHiowHiX/atyCXnvs7Jm9f4wDml
	m01ncoB8drBUBLS4I6YwGv1U7FyA2aWTzDf28ap2KGMJ6frrr6zhKTCQSxYVHMzjv8Uq82qc+/s
	QW4YGvgnzvJtQV/RL1EGQHB0NGb5rP2HWmfXxUgA==
X-Gm-Gg: ATEYQzyZPqMY+5iiWGdHwP3zMICBu/8D8rzz68F+EIxJylzsmfx4IBJtgIzQ9hyP2dw
	62LkLTRpYsUeCGcU8KzKBpPzxSQQwkfHMYdLx046i8qNNNRwljVv/xiPbQVERLEUz+3n9IunBCh
	uxPUeCqgGZYUAUIw0X2/xpYDNGSeUPWBrQt6F4lE68+uiaHdeUa7gkQ67Z/XblAPe5K5VEgt1Nv
	VDtBQk=
X-Received: by 2002:a05:6820:1990:b0:676:6c3c:a1e9 with SMTP id 006d021491bc7-679f3da6aecmr436089eaf.57.1772085498452;
        Wed, 25 Feb 2026 21:58:18 -0800 (PST)
X-Received: by 2002:a05:6820:1990:b0:676:6c3c:a1e9 with SMTP id
 006d021491bc7-679f3da6aecmr436077eaf.57.1772085497991; Wed, 25 Feb 2026
 21:58:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
 <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-3-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-3-347fa2d7351b@arm.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 11:28:06 +0530
X-Gm-Features: AaiRm50j2ioKzT8O5WkXwOBzaz_quUV9p2zoAkjwudfimibESDbgnebOCS_fs4k
Message-ID: <CA+Ht8=aL8wp0nwH3vnnm8FnRmfp1nUasfXh3HjeWwi8UadBLOg@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] ACPI: APEI: GHES: move CPER read helpers
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
        robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: JWDjx-FNuoU71PcqKKRDAmzmem-FVTxo
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699fe0fb cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8 a=MJR9BmDR2wurswiG5j0A:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1MCBTYWx0ZWRfXzVVy8O7+S8B3
 9tFH+BDheKXhlpQ1Nh5UmbZm0sGxu2dohQiSid1KuuO/1HIHZG+OXazZN/TZ7MXYnyRBgWjrUu7
 0JDVsVjAkW6SWbecAa3v/KJrWkyltpi5kghB5LXp6G6i0E1pTZbr37WzROxsLcvfJ5GPb/lqBVG
 qds8E1YV7dulyNifXnMPW8/ixmMg/lPVwvKUhc/NhGOfOPneb7sSz+I8woW3K2kYnZNSy5J0Oxv
 iSn4vURDLe71ft9bgABeafPTAyMMcFYUH3D0iYLT9l1D90gw1ZQYpXyklTIPXFM4PO98JTA1jrm
 DGg09MjDdv2gO1o23y1rwNUU+nX1jDpdp+2gDn28rQMoQ1uv1X6xa03SiW71ous8p87WzdTKWP2
 rJevwl/SnMFtnvKFa1X4ComM7xsj8X/D7z5cU3zuQ5sCtq0SpnMQ2Ilmhdt/qkUhsTS7mWvfOpN
 uBU+/UnkDJI/ep9YaPw==
X-Proofpoint-GUID: JWDjx-FNuoU71PcqKKRDAmzmem-FVTxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260050

On Fri, Feb 20, 2026 at 7:13=E2=80=AFPM Ahmed Tiba <ahmed.tiba@arm.com> wro=
te:
>
> Relocate the CPER buffer mapping, peek, and clear helpers from ghes.c int=
o
> ghes_cper.c so they can be shared with other firmware-first providers.
> This commit only shuffles code; behavior stays the same.
>
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  drivers/acpi/apei/ghes.c      | 170 +-----------------------------------=
------
>  drivers/acpi/apei/ghes_cper.c | 170 ++++++++++++++++++++++++++++++++++++=
+++++-
>  include/acpi/ghes_cper.h      |  14 ++--
>  3 files changed, 177 insertions(+), 177 deletions(-)
>
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 07b70bcb8342..b159dbee90ac 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -118,26 +118,6 @@ static struct gen_pool *ghes_estatus_pool;
>  static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS=
_CACHES_SIZE];
>  static atomic_t ghes_estatus_cache_alloced;
>
> -static void __iomem *ghes_map(u64 pfn, enum fixed_addresses fixmap_idx)
> -{
> -       phys_addr_t paddr;
> -       pgprot_t prot;
> -
> -       paddr =3D PFN_PHYS(pfn);
> -       prot =3D arch_apei_get_mem_attribute(paddr);
> -       __set_fixmap(fixmap_idx, paddr, prot);
> -
> -       return (void __iomem *) __fix_to_virt(fixmap_idx);
> -}
> -
> -static void ghes_unmap(void __iomem *vaddr, enum fixed_addresses fixmap_=
idx)
> -{
> -       int _idx =3D virt_to_fix((unsigned long)vaddr);
> -
> -       WARN_ON_ONCE(fixmap_idx !=3D _idx);
> -       clear_fixmap(fixmap_idx);
> -}
> -
>  int ghes_estatus_pool_init(unsigned int num_ghes)
>  {
>         unsigned long addr, len;
> @@ -193,22 +173,7 @@ static void unmap_gen_v2(struct ghes *ghes)
>         apei_unmap_generic_address(&ghes->generic_v2->read_ack_register);
>  }
>
> -static void ghes_ack_error(struct acpi_hest_generic_v2 *gv2)
> -{
> -       int rc;
> -       u64 val =3D 0;
> -
> -       rc =3D apei_read(&val, &gv2->read_ack_register);
> -       if (rc)
> -               return;
> -
> -       val &=3D gv2->read_ack_preserve << gv2->read_ack_register.bit_off=
set;
> -       val |=3D gv2->read_ack_write    << gv2->read_ack_register.bit_off=
set;
> -
> -       apei_write(val, &gv2->read_ack_register);
> -}
> -
> -static struct ghes *ghes_new(struct acpi_hest_generic *generic)
> +struct ghes *ghes_new(struct acpi_hest_generic *generic)
>  {
>         struct ghes *ghes;
>         unsigned int error_block_length;
> @@ -255,7 +220,7 @@ static struct ghes *ghes_new(struct acpi_hest_generic=
 *generic)
>         return ERR_PTR(rc);
>  }
>
> -static void ghes_fini(struct ghes *ghes)
> +void ghes_fini(struct ghes *ghes)
>  {
>         kfree(ghes->estatus);
>         apei_unmap_generic_address(&ghes->generic->error_status_address);
> @@ -280,137 +245,6 @@ static inline int ghes_severity(int severity)
>         }
>  }

Can it be "ghes_finish"? We already have "creat" without 'e'.

>
> -static void ghes_copy_tofrom_phys(void *buffer, u64 paddr, u32 len,
> -                                 int from_phys,
> -                                 enum fixed_addresses fixmap_idx)
> -{
> -       void __iomem *vaddr;
> -       u64 offset;
> -       u32 trunk;
> -
> -       while (len > 0) {
> -               offset =3D paddr - (paddr & PAGE_MASK);
> -               vaddr =3D ghes_map(PHYS_PFN(paddr), fixmap_idx);
> -               trunk =3D PAGE_SIZE - offset;
> -               trunk =3D min(trunk, len);
> -               if (from_phys)
> -                       memcpy_fromio(buffer, vaddr + offset, trunk);
> -               else
> -                       memcpy_toio(vaddr + offset, buffer, trunk);
> -               len -=3D trunk;
> -               paddr +=3D trunk;
> -               buffer +=3D trunk;
> -               ghes_unmap(vaddr, fixmap_idx);
> -       }
> -}
> -
> -/* Check the top-level record header has an appropriate size. */
> -static int __ghes_check_estatus(struct ghes *ghes,
> -                               struct acpi_hest_generic_status *estatus)
> -{
> -       u32 len =3D cper_estatus_len(estatus);
> -       u32 max_len =3D min(ghes->generic->error_block_length,
> -                         ghes->estatus_length);
> -
> -       if (len < sizeof(*estatus)) {
> -               pr_warn_ratelimited(FW_WARN GHES_PFX "Truncated error sta=
tus block!\n");
> -               return -EIO;
> -       }
> -
> -       if (!len || len > max_len) {
> -               pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid error statu=
s block length!\n");
> -               return -EIO;
> -       }
> -
> -       if (cper_estatus_check_header(estatus)) {
> -               pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid CPER header=
!\n");
> -               return -EIO;
> -       }
> -
> -       return 0;
> -}
> -
> -/* Read the CPER block, returning its address, and header in estatus. */
> -static int __ghes_peek_estatus(struct ghes *ghes,
> -                              struct acpi_hest_generic_status *estatus,
> -                              u64 *buf_paddr, enum fixed_addresses fixma=
p_idx)
> -{
> -       struct acpi_hest_generic *g =3D ghes->generic;
> -       int rc;
> -
> -       rc =3D apei_read(buf_paddr, &g->error_status_address);
> -       if (rc) {
> -               *buf_paddr =3D 0;
> -               pr_warn_ratelimited(FW_WARN GHES_PFX
> -"Failed to read error status block address for hardware error source: %d=
.\n",
> -                                  g->header.source_id);
> -               return -EIO;
> -       }
> -       if (!*buf_paddr)
> -               return -ENOENT;
> -
> -       ghes_copy_tofrom_phys(estatus, *buf_paddr, sizeof(*estatus), 1,
> -                             fixmap_idx);
> -       if (!estatus->block_status) {
> -               *buf_paddr =3D 0;
> -               return -ENOENT;
> -       }
> -
> -       return 0;
> -}
> -
> -static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
> -                              u64 buf_paddr, enum fixed_addresses fixmap=
_idx,
> -                              size_t buf_len)
> -{
> -       ghes_copy_tofrom_phys(estatus, buf_paddr, buf_len, 1, fixmap_idx)=
;
> -       if (cper_estatus_check(estatus)) {
> -               pr_warn_ratelimited(FW_WARN GHES_PFX
> -                                   "Failed to read error status block!\n=
");
> -               return -EIO;
> -       }
> -
> -       return 0;
> -}
> -
> -static int ghes_read_estatus(struct ghes *ghes,
> -                            struct acpi_hest_generic_status *estatus,
> -                            u64 *buf_paddr, enum fixed_addresses fixmap_=
idx)
> -{
> -       int rc;
> -
> -       rc =3D __ghes_peek_estatus(ghes, estatus, buf_paddr, fixmap_idx);
> -       if (rc)
> -               return rc;
> -
> -       rc =3D __ghes_check_estatus(ghes, estatus);
> -       if (rc)
> -               return rc;
> -
> -       return __ghes_read_estatus(estatus, *buf_paddr, fixmap_idx,
> -                                  cper_estatus_len(estatus));
> -}
> -
> -static void ghes_clear_estatus(struct ghes *ghes,
> -                              struct acpi_hest_generic_status *estatus,
> -                              u64 buf_paddr, enum fixed_addresses fixmap=
_idx)
> -{
> -       estatus->block_status =3D 0;
> -
> -       if (!buf_paddr)
> -               return;
> -
> -       ghes_copy_tofrom_phys(estatus, buf_paddr,
> -                             sizeof(estatus->block_status), 0,
> -                             fixmap_idx);
> -
> -       /*
> -        * GHESv2 type HEST entries introduce support for error acknowled=
gment,
> -        * so only acknowledge the error if this support is present.
> -        */
> -       if (is_hest_type_generic_v2(ghes))
> -               ghes_ack_error(ghes->generic_v2);
> -}
>
>  /**
>   * struct ghes_task_work - for synchronous RAS event
> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.=
c
> index 63047322a3d9..7e0015e960c1 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c

IMO, just "cper.c" would be fine.

> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   *
> - * APEI GHES CPER helper translation unit - staging file for helper move=
s
> + * APEI GHES CPER helper translation unit - code mechanically moved from=
 ghes.c
>   *
>   * Copyright (C) 2026 ARM Ltd.
>   * Author: Ahmed Tiba <ahmed.tiba@arm.com>
> @@ -17,10 +17,176 @@
>  #include <linux/slab.h>
>
>  #include <acpi/apei.h>
> +#include <acpi/ghes_cper.h>
>
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
>
>  #include "apei-internal.h"
>
> -/* Helper bodies will be moved here in follow-up commits. */
> +static void __iomem *ghes_map(u64 pfn, enum fixed_addresses fixmap_idx)
> +{
> +       phys_addr_t paddr;
> +       pgprot_t prot;
> +
> +       paddr =3D PFN_PHYS(pfn);
> +       prot =3D arch_apei_get_mem_attribute(paddr);
> +       __set_fixmap(fixmap_idx, paddr, prot);
> +
> +       return (void __iomem *) __fix_to_virt(fixmap_idx);
> +}
> +
> +static void ghes_unmap(void __iomem *vaddr, enum fixed_addresses fixmap_=
idx)
> +{
> +       int _idx =3D virt_to_fix((unsigned long)vaddr);
> +
> +       WARN_ON_ONCE(fixmap_idx !=3D _idx);
> +       clear_fixmap(fixmap_idx);
> +}
> +
> +static void ghes_ack_error(struct acpi_hest_generic_v2 *gv2)
> +{
> +       int rc;
> +       u64 val =3D 0;
> +
> +       rc =3D apei_read(&val, &gv2->read_ack_register);
> +       if (rc)
> +               return;
> +
> +       val &=3D gv2->read_ack_preserve << gv2->read_ack_register.bit_off=
set;
> +       val |=3D gv2->read_ack_write    << gv2->read_ack_register.bit_off=
set;
> +
> +       apei_write(val, &gv2->read_ack_register);
> +}
> +
> +static void ghes_copy_tofrom_phys(void *buffer, u64 paddr, u32 len,
> +                                 int from_phys,
> +                                 enum fixed_addresses fixmap_idx)
> +{
> +       void __iomem *vaddr;
> +       u64 offset;
> +       u32 trunk;
> +
> +       while (len > 0) {
> +               offset =3D paddr - (paddr & PAGE_MASK);
> +               vaddr =3D ghes_map(PHYS_PFN(paddr), fixmap_idx);
> +               trunk =3D PAGE_SIZE - offset;
> +               trunk =3D min(trunk, len);
> +               if (from_phys)
> +                       memcpy_fromio(buffer, vaddr + offset, trunk);
> +               else
> +                       memcpy_toio(vaddr + offset, buffer, trunk);
> +               len -=3D trunk;
> +               paddr +=3D trunk;
> +               buffer +=3D trunk;
> +               ghes_unmap(vaddr, fixmap_idx);
> +       }
> +}
> +
> +/* Check the top-level record header has an appropriate size. */
> +int __ghes_check_estatus(struct ghes *ghes,
> +                               struct acpi_hest_generic_status *estatus)
> +{
> +       u32 len =3D cper_estatus_len(estatus);
> +       u32 max_len =3D min(ghes->generic->error_block_length,
> +                         ghes->estatus_length);
> +
> +       if (len < sizeof(*estatus)) {
> +               pr_warn_ratelimited(FW_WARN GHES_PFX "Truncated error sta=
tus block!\n");
> +               return -EIO;
> +       }
> +
> +       if (!len || len > max_len) {
> +               pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid error statu=
s block length!\n");
> +               return -EIO;
> +       }
> +
> +       if (cper_estatus_check_header(estatus)) {
> +               pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid CPER header=
!\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +/* Read the CPER block, returning its address, and header in estatus. */
> +int __ghes_peek_estatus(struct ghes *ghes,
> +                              struct acpi_hest_generic_status *estatus,
> +                              u64 *buf_paddr, enum fixed_addresses fixma=
p_idx)
> +{
> +       struct acpi_hest_generic *g =3D ghes->generic;
> +       int rc;
> +
> +       rc =3D apei_read(buf_paddr, &g->error_status_address);
> +       if (rc) {
> +               *buf_paddr =3D 0;
> +               pr_warn_ratelimited(FW_WARN GHES_PFX
> +"Failed to read error status block address for hardware error source: %d=
.\n",
> +                                  g->header.source_id);
> +               return -EIO;
> +       }
> +       if (!*buf_paddr)
> +               return -ENOENT;
> +
> +       ghes_copy_tofrom_phys(estatus, *buf_paddr, sizeof(*estatus), 1,
> +                             fixmap_idx);
> +       if (!estatus->block_status) {
> +               *buf_paddr =3D 0;
> +               return -ENOENT;
> +       }
> +
> +       return 0;
> +}
> +
> +int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
> +                              u64 buf_paddr, enum fixed_addresses fixmap=
_idx,
> +                              size_t buf_len)
> +{
> +       ghes_copy_tofrom_phys(estatus, buf_paddr, buf_len, 1, fixmap_idx)=
;
> +       if (cper_estatus_check(estatus)) {
> +               pr_warn_ratelimited(FW_WARN GHES_PFX
> +                                   "Failed to read error status block!\n=
");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +int ghes_read_estatus(struct ghes *ghes,
> +                            struct acpi_hest_generic_status *estatus,
> +                            u64 *buf_paddr, enum fixed_addresses fixmap_=
idx)
> +{
> +       int rc;
> +
> +       rc =3D __ghes_peek_estatus(ghes, estatus, buf_paddr, fixmap_idx);
> +       if (rc)
> +               return rc;
> +
> +       rc =3D __ghes_check_estatus(ghes, estatus);
> +       if (rc)
> +               return rc;
> +
> +       return __ghes_read_estatus(estatus, *buf_paddr, fixmap_idx,
> +                                  cper_estatus_len(estatus));
> +}
> +
> +void ghes_clear_estatus(struct ghes *ghes,
> +                              struct acpi_hest_generic_status *estatus,
> +                              u64 buf_paddr, enum fixed_addresses fixmap=
_idx)
> +{
> +       estatus->block_status =3D 0;
> +
> +       if (!buf_paddr)
> +               return;
> +
> +       ghes_copy_tofrom_phys(estatus, buf_paddr,
> +                             sizeof(estatus->block_status), 0,
> +                             fixmap_idx);
> +
> +       /*
> +        * GHESv2 type HEST entries introduce support for error acknowled=
gment,
> +        * so only acknowledge the error if this support is present.
> +        */
> +       if (is_hest_type_generic_v2(ghes))
> +               ghes_ack_error(ghes->generic_v2);
> +}
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index 2597fbadc4f3..2e3919f0c3e7 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -74,21 +74,21 @@ struct ghes_vendor_record_entry {
>         char vendor_record[];
>  };
>

ditto. "include/acpi/cper.h"

> -static struct ghes *ghes_new(struct acpi_hest_generic *generic);
> -static void ghes_fini(struct ghes *ghes);
> +struct ghes *ghes_new(struct acpi_hest_generic *generic);
> +void ghes_fini(struct ghes *ghes);
>
> -static int ghes_read_estatus(struct ghes *ghes,
> +int ghes_read_estatus(struct ghes *ghes,
>                       struct acpi_hest_generic_status *estatus,
>                       u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> -static void ghes_clear_estatus(struct ghes *ghes,
> +void ghes_clear_estatus(struct ghes *ghes,
>                         struct acpi_hest_generic_status *estatus,
>                         u64 buf_paddr, enum fixed_addresses fixmap_idx);
> -static int __ghes_peek_estatus(struct ghes *ghes,
> +int __ghes_peek_estatus(struct ghes *ghes,
>                         struct acpi_hest_generic_status *estatus,
>                         u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> -static int __ghes_check_estatus(struct ghes *ghes,
> +int __ghes_check_estatus(struct ghes *ghes,
>                          struct acpi_hest_generic_status *estatus);
> -static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
> +int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
>                         u64 buf_paddr, enum fixed_addresses fixmap_idx,
>                         size_t buf_len);
>
>
> --
> 2.43.0
>
>
