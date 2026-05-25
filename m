Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9520F3DE441
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697404; cv=pass; b=kABEp/05jdlXJQU6RzxUjrFwd2+/NStrzXYooF3GUrXynkr1UOn1GbMTazl4N6O8S2bDZExXp7NqjZoxanm/aujT9aKRxTaeV/+MbDra0nFPkfFfj3F42DcpT4J0OdvLud3TY3UnGmaJV1QXayf1iizzJP771uxpxlEs14nJQfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697404; c=relaxed/simple;
	bh=0achz9n+qw0t1Oo82cOOIyvX9+EU24sy7AuCwSzREkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0xTL8WHF8dg/0Tdf/h+rZtOSz1kXzG8HIe9bcvbLSw/e3Yq742FE97OAkZLiu/AnJUE28m/w98MEGP/UKN781ILkgB9IwHpasx6PASY9FLFATkEHycT6wuKnYRgTmoaRX31fbVZ/3RQGe9fQGusWteW2x9ucU8xvjU3Z333vMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnS3UKKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWGu9FHY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnS3UKKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWGu9FHY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Q2QB3019604
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 08:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Y00jVBsOO5l3g5o3U2vjZ9VsbHwpeMj0hXubWYDZVoE=; b=dn
	S3UKKIUaiBLrAZwS0idvEBG9uLwSe38I9zNIU0aBjXqnXXGFennybsL2PX9kvf4y
	XBPwDUKGPZUe/E+Sl2FBLU2WYdrHRyBoibT9UiLwlGuI0/9kZlQld+nbNDhgUPlO
	X6RdacDuhzmD1uULNM1A4NkKZjcjvldfHFaiVDgfVHc3TWf2ofXypIW8ZBawLv7x
	bWLg5Yaib53OBZXheovHkGqWKmCmBCCNuknxrjX32gJjLCW5p/QCzqvU32kEZBv4
	nuPHrAxHPt1ONgp6dJIiIqkGFIpITz1VgqMczdrxZKV8fjhLZ2WYO7BPjS4fx14n
	gMVF8uufE8IIZqeVWr8w==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t5x6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 08:23:21 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bdecb2f4a7so51606277b3.0
        for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 01:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779697401; cv=none;
        d=google.com; s=arc-20240605;
        b=AoiCL8kBHtJpZ0jg9RdOdaQlYr4HEbwZEmBahxCx4JkJJigirFfaWqm00VZpVEkfMG
         jzD7WFf6jqT0HHXfZVJFepJvZbzFQEGzpJkO96ShqHa+t1JUMlQ04h/cJmAa6RlodSXy
         VeVNUWK5t5OYpOxN7vQwmajfXY+mDo/SQtKJVkGTJqhlE0uz/MXhS5TVLVd0zyHfVm0d
         /HX/+SxQbz0xKEE/8qEiqHYFlNf+pCpweBEojWf/Yr9p6E4u2cfr93tvYFAoo0FMkV8Q
         dmYK8SvI6YxiRM+NagXBg0BaJhJ8gTmW7/bYpb3nnB9uYsKn/GxOW4GLXWuTBQn/zBei
         Mm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Y00jVBsOO5l3g5o3U2vjZ9VsbHwpeMj0hXubWYDZVoE=;
        fh=jCYqhT0v+LKJdOwMGpxcBSR13LZtW7lKd/zARib0OVI=;
        b=hHnf68H1+6GS3PFbM3uy9HLPTOSi+rNuH9ftFVTaHQVC/BShEoSHQ9Q7CpYFtQsdNd
         OJRUNqHBWmtCKFbvnjPoVJpgAMPlAI3CrS1ttB4uqeH610pEBBVyRW5wjnHlzJaw3csj
         MDsfblvEYeRhKYqZPpFvae321oFTLhdH3RcmjBYRU4jauZIacom/q9NQh8MByoziwdZZ
         GCiajeMDSm8lLEGwO6AEXYLof8jz8GXPMZr80R0/uAS7QaNm2AO5ggwRJZAuI9VDdfzK
         3qfkChvgoAgUG/7MmjBSDq2tYaD77wUqXDADqpvv6ut6otckSsC+bbaTyoO8HBhnFg05
         +K7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779697401; x=1780302201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y00jVBsOO5l3g5o3U2vjZ9VsbHwpeMj0hXubWYDZVoE=;
        b=WWGu9FHYdit781ZHLrkIWGZqnw2QsmIJg6I1bT/lZqXLNT9pctH1Uo6eQTVO1DxQac
         M6BuupWsMUdH8cuhuDVbfe/PRaM8zrxAYjda2IDY82LKaWQTkZB72rQVNZiZJMXkhhDc
         fvUqcwczHwUwUVsFtIGxznEzqqYuWi1ZDVYYgxs06iRXY+r/XlTfePZdEWt3ga/nVMtZ
         0nO7T6OR3RsJoy9jJhHCnILH4XHcofLKrbnHeGmU+wWq2oHCcrUCXdpYmQwqnVNR+cig
         3SZm8ctSenARvfVHHpxINDUF3VhmflNDxcfORyXOpYd8Kr9tpwrZmdMFbymZcpPo4oQ0
         RndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697401; x=1780302201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y00jVBsOO5l3g5o3U2vjZ9VsbHwpeMj0hXubWYDZVoE=;
        b=BKl4RkyO6nq6Fwlty4eLwXwgtYWQpS3mOkydNl8QFYYnBz5v+yVqooRavseAaDSXJJ
         A3ImJ7GtOcGeaGduCnybeLD1pT6I0zoFNaF0sCxXLEnY4S8EwCg0UiCbxyufuwP1txaX
         t5L22nrpLwDxTaWhhvfAGrGuTCeN2IqL4PqfwxkPNF6+cBlt0+EtjcHodcU1SclpJESc
         sNSwZtKvAO24zqhCOazT06gJssRCiYBhBwZABl+hFoIcSP4EYQw3jEM9ZTy2OQ5QJzPU
         w5LpIQogIPSR+z5e/2jrEKl0BJiSuf1PTuzJDunjCtrt/PTdQo2572LXqFwOXBXPLiJR
         YBqg==
X-Forwarded-Encrypted: i=1; AFNElJ9SLbcsiBYkRuYwDVIIThdNuG+eziXtFXBVFSsFrQBPgXrxNvT2X+WnrDUOd+2ElfRwectXZIB3eiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7dC6cTHYD5oZZymLV1P+d3OV7ecEmggWzS8aVTV2PfP5XSt3
	3FAeWO+b4zafWuj3GKtATY0Qzuo11at0w9E/gQiVYV9H4o3rcLiRCjPGxoeB4YUMG4wqk6cbdcn
	Oy0vN+U2g6AJit011gUtjvnSjsC7nR3Cybp9mbmJSN8gBnQHzz2obzhIDoNhw+fotnZZEo4gpLH
	TKZeo/CLF3AhQUsALJnXKgUFYcjsJyec9sOslE5g==
X-Gm-Gg: Acq92OFYKmgpxFPipzkenjBwXmGemEg9IZr/ami1dYlUOmNys55El+of1W8uBvlbzn7
	hDaUsPov3W0DTaN4lu/i/JGSkg+Rz7dhO2jKNmtkzKZxPIQqah7OZwAaGdGUvbQ3Utx3MVJcMBP
	vtwImir9Yy4STIdbrO3ZlNXfNlgwKvcMCZfQ+/bL2RrWjMsK4BMLKWGeOBEMm51ULCJrPqqjrwk
	9kRXacw
X-Received: by 2002:a05:690c:6b04:b0:7d0:3bbc:c81 with SMTP id 00721157ae682-7d335fbcccamr151395317b3.13.1779697400739;
        Mon, 25 May 2026 01:23:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6b04:b0:7d0:3bbc:c81 with SMTP id
 00721157ae682-7d335fbcccamr151394667b3.13.1779697400112; Mon, 25 May 2026
 01:23:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org> <20260524-ssqosid-cbqri-rqsc-v7-0-v5-16-78d3a7ba9dbe@kernel.org>
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-16-78d3a7ba9dbe@kernel.org>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 25 May 2026 13:53:09 +0530
X-Gm-Features: AVHnY4I5dwBeqtX2znAoYje4xvPMK0mJtZxt7UsaZlw7JojvDtp7xcPyAAfXdI0
Message-ID: <CAB19ukE9r_V=0eop3=f8zohhnCavd=9GjDEK1VMMbOb0ReOtDA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 16/18] ACPI: RISC-V: Parse RISC-V Quality of
 Service Controller (RQSC) table
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Adrien Ricciardi <aricciardi@baylibre.com>,
        Nicolas Pitre <npitre@baylibre.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Atish Patra <atish.patra@linux.dev>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Weiwei Li <liwei1518@gmail.com>, guo.wenjia23@zte.com.cn,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn,
        Reinette Chatre <reinette.chatre@intel.com>,
        Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
        Peter Newman <peternewman@google.com>,
        Fenghua Yu <fenghua.yu@intel.com>, James Morse <james.morse@arm.com>,
        Ben Horgan <ben.horgan@arm.com>, Dave Martin <Dave.Martin@arm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, linux-acpi@vger.kernel.org,
        acpica-devel@lists.linux.dev, devicetree@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-rt-devel@lists.linux.dev,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: H6Wc3QlX3jwSW5hWLm7o3KiKT6lPwN5-
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a1406f9 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=V1jnuoLLAAAA:20 a=VwQbUJbxAAAA:8
 a=oLomzfTcYbT1FT28YPsA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: H6Wc3QlX3jwSW5hWLm7o3KiKT6lPwN5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NCBTYWx0ZWRfXwJVdtvzdBJLt
 zNNNA3ZKkUyLxxYQQTFec+g4wHKbHSOsTTaEFPY6gmHFzPLjK+g7OkRQytDcdgoEB1LLZ8k9uup
 DHbNDx99c7YGhfvFkyTgPOnUbEe/SRWq+cCFepTJVpsYjjRN6PVacHD61UJF42311xBq2GNMLfh
 RzKtV2UA0Wxq9oRk7zyYiH0P8a/5dPRqIyaQKoDo4vOw1m4W3PehWbXbet+MrHrjx0mkejXW7lA
 nbHhYktNn/R1yOBj/JEaXJ49U4fmKeE4j3VlmS4bQWYppRox8mrT0smmxlqJMJ3XKkJICNhUlcY
 74l+4Qjk5gUv4kCawyGCD+OtWxfvelHGghqarLLLLWfzFWf/DnmWCpJ/0WPuWLCc48k86kgIUjM
 kshcdAmyH2zCbgkGpbT8+zAx5JGrv9bWLY7KP4+9I4l8ThuJ1Yempeomn7IXYCMZGM31ozi7/qn
 TXTWMZD3aHip7rL2ttw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250084

Hi Drew,

On Mon, May 25, 2026 at 5:32=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> Add a parser for the ACPI RQSC table, which describes the CBQRI
> controllers in a system. For each table entry, populate a
> cbqri_controller_info descriptor and hand it to the CBQRI driver via
> riscv_cbqri_register_controller(). The driver owns all subsequent state,
> including cpumask resolution at cbqri_resctrl_setup() time.
>
> Link: https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/
> Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  MAINTAINERS                   |   2 +
>  arch/riscv/include/asm/acpi.h |  10 +++
>  drivers/acpi/riscv/Makefile   |   1 +
>  drivers/acpi/riscv/rqsc.c     | 194 ++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/acpi/riscv/rqsc.h     |  63 ++++++++++++++
>  5 files changed, 270 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7821dd5159cb..eab31c7b5e91 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23025,6 +23025,8 @@ S:      Supported
>  F:     arch/riscv/include/asm/qos.h
>  F:     arch/riscv/include/asm/resctrl.h
>  F:     arch/riscv/kernel/qos.c
> +F:     drivers/acpi/riscv/rqsc.c
> +F:     drivers/acpi/riscv/rqsc.h
>  F:     drivers/resctrl/cbqri_devices.c
>  F:     drivers/resctrl/cbqri_internal.h
>  F:     drivers/resctrl/cbqri_resctrl.c
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.=
h
> index 26ab37c171bc..3cfd0102085e 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -67,6 +67,16 @@ int acpi_get_riscv_isa(struct acpi_table_header *table=
,
>
>  void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_=
size,
>                              u32 *cboz_size, u32 *cbop_size);
> +
> +#ifdef CONFIG_RISCV_CBQRI_DRIVER
> +int __init acpi_parse_rqsc(struct acpi_table_header *table);
> +#else
> +static inline int acpi_parse_rqsc(struct acpi_table_header *table)
> +{
> +       return -EINVAL;
> +}
> +#endif /* CONFIG_RISCV_CBQRI_DRIVER */
> +
>  #else
>  static inline void acpi_init_rintc_map(void) { }
>  static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
> index 1284a076fa88..77f8f0101b7e 100644
> --- a/drivers/acpi/riscv/Makefile
> +++ b/drivers/acpi/riscv/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y                                  +=3D rhct.o init.o irq.o
> +obj-$(CONFIG_RISCV_CBQRI_DRIVER)       +=3D rqsc.o
>  obj-$(CONFIG_ACPI_PROCESSOR_IDLE)      +=3D cpuidle.o
>  obj-$(CONFIG_ACPI_CPPC_LIB)            +=3D cppc.o
>  obj-$(CONFIG_ACPI_RIMT)                        +=3D rimt.o
> diff --git a/drivers/acpi/riscv/rqsc.c b/drivers/acpi/riscv/rqsc.c
> new file mode 100644
> index 000000000000..1cbc5c07e191
> --- /dev/null
> +++ b/drivers/acpi/riscv/rqsc.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#define pr_fmt(fmt) "ACPI: RQSC: " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/riscv_cbqri.h>
> +
> +#include "rqsc.h"
> +
> +#define CBQRI_CTRL_SIZE 0x1000
> +
> +int __init acpi_parse_rqsc(struct acpi_table_header *table)
> +{
> +       struct acpi_table_rqsc *rqsc =3D (struct acpi_table_rqsc *)table;
> +       struct acpi_rqsc_node *end, *node;
> +       int num_controllers =3D 0;
> +
> +       /*
> +        * Reject revisions newer than this parser was written against.  =
A
> +        * future revision could extend the fixed RQSC header before the
> +        * first node, which would shift the resource subtables and cause=
 the
> +        * sizeof(*node)-based offset below to point into the wrong place=
.
> +        */
> +       if (rqsc->header.revision !=3D ACPI_RQSC_REVISION) {
> +               pr_err("RQSC table revision %u, expected %u, aborting\n",
> +                      rqsc->header.revision, ACPI_RQSC_REVISION);
> +               return -EINVAL;
> +       }
> +
> +       /* Reject tables shorter than the fixed RQSC header. */
> +       if (rqsc->header.length < sizeof(struct acpi_table_rqsc)) {
> +               pr_err("RQSC table truncated: length %u < %zu, aborting\n=
",
> +                      rqsc->header.length, sizeof(struct acpi_table_rqsc=
));
> +               return -EINVAL;
> +       }
> +
> +       end =3D ACPI_ADD_PTR(struct acpi_rqsc_node, rqsc, rqsc->header.le=
ngth);
> +
> +       for (node =3D ACPI_ADD_PTR(struct acpi_rqsc_node, rqsc,
> +                                sizeof(struct acpi_table_rqsc));
> +            node < end;
> +            node =3D ACPI_ADD_PTR(struct acpi_rqsc_node, node, node->len=
gth)
> +       ) {
> +               const struct acpi_rqsc_resource *res0;
> +               struct cbqri_controller_info info =3D {};
> +               int ret;
> +
> +               if ((void *)node + sizeof(*node) > (void *)end) {
> +                       pr_err("truncated entry at end of table, aborting=
\n");
> +                       riscv_cbqri_unregister_last(num_controllers);
> +                       return -EINVAL;
> +               }
> +
> +               if (node->length < sizeof(*node)) {
> +                       pr_err("malformed RQSC entry: length %u < %zu, ab=
orting\n",
> +                              node->length, sizeof(*node));
> +                       riscv_cbqri_unregister_last(num_controllers);
> +                       return -EINVAL;
> +               }
> +
> +               /*
> +                * Without this check, a node whose length claims to exte=
nd
> +                * past the end of the table would advance the loop curso=
r
> +                * past `end` and silently terminate.  Flag the corruptio=
n
> +                * explicitly so a malformed firmware table cannot trunca=
te
> +                * the controller list without noise.
> +                */
> +               if ((void *)node + node->length > (void *)end) {
> +                       pr_err("RQSC entry length %u overruns table end, =
aborting\n",
> +                              node->length);
> +                       riscv_cbqri_unregister_last(num_controllers);
> +                       return -EINVAL;
> +               }
> +
> +               /* GAS must describe system memory. ioremap() consumes it=
 later. */
> +               if (node->reg.space_id !=3D ACPI_ADR_SPACE_SYSTEM_MEMORY)=
 {
> +                       pr_warn("controller has unsupported address space=
_id=3D%u, skipping\n",
> +                               node->reg.space_id);
> +                       continue;
> +               }
> +
> +               /* Address 0 would map page 0 (reset vectors, SBI, boot R=
OM). */
> +               if (!node->reg.address) {
> +                       pr_warn("controller has zero address, skipping\n"=
);
> +                       continue;
> +               }
> +
> +               info.type =3D node->type;
> +               /* RQSC v0.9.2 section 2 Table 2: 12-byte GAS-format regi=
ster interface address */
> +               info.addr =3D node->reg.address;
> +               info.size =3D CBQRI_CTRL_SIZE;
> +               info.rcid_count =3D node->rcid;
> +               info.mcid_count =3D node->mcid;
> +
> +               /* See CBQRI_MAX_RCID/MCID in <linux/riscv_cbqri.h> for t=
he rationale. */
> +               if (info.rcid_count > CBQRI_MAX_RCID) {
> +                       pr_warn("controller at %pa: rcid_count %u exceeds=
 CBQRI_MAX_RCID %u, skipping\n",
> +                               &info.addr, info.rcid_count, CBQRI_MAX_RC=
ID);
> +                       continue;
> +               }
> +
> +               if (info.mcid_count > CBQRI_MAX_MCID) {
> +                       pr_warn("controller at %pa: mcid_count %u exceeds=
 CBQRI_MAX_MCID %u, skipping\n",
> +                               &info.addr, info.mcid_count, CBQRI_MAX_MC=
ID);
> +                       continue;
> +               }
> +
Do you also want to add a check for the statement in the spec "At
least one of RCID Count or MCID Count must be non-zero." ?

> +               if (node->nres =3D=3D 0) {
> +                       pr_warn("controller at %pa has no resource descri=
ptors, skipping\n",
> +                               &info.addr);
> +                       continue;
> +               }
> +
> +               /*
> +                * Resources follow the node header in-line. Only res[0] =
is
> +                * consumed. Bound it against end before reading its pref=
ix so
> +                * a table that ends partway through a resource subtable =
is
> +                * rejected rather than read past the mapping.
> +                */
> +               res0 =3D (const struct acpi_rqsc_resource *)
> +                      ((const u8 *)node + sizeof(*node));
> +               if ((void *)res0 + sizeof(*res0) > (void *)end ||
> +                   node->length < sizeof(*node) + sizeof(*res0) ||
> +                   res0->length < sizeof(*res0)) {
> +                       pr_warn("controller at %pa: node too short for re=
source descriptor, skipping\n",
> +                               &info.addr);
> +                       continue;
> +               }
> +
> +               if (node->nres > 1)
> +                       pr_warn("controller at %pa has %u resource descri=
ptors, using first\n",
> +                               &info.addr, node->nres);
> +
> +               /*
> +                * id1 is u64 on the wire but cache_id and prox_dom are u=
32
> +                * downstream (PPTT cache_id, ACPI proximity domain). Rej=
ect
> +                * rather than truncate, so a too-large id is not silentl=
y
> +                * mapped to the wrong PPTT entry or NUMA node.
> +                */
> +               if (res0->id1 > U32_MAX) {
> +                       pr_warn("controller at %pa: id1 0x%llx exceeds u3=
2, skipping\n",
> +                               &info.addr, res0->id1);
> +                       continue;
> +               }
> +
> +               /*
> +                * Pair the QoS controller type with the resource descrip=
tor
> +                * fields that index id1.  RQSC v0.9.2 Table 4 defines th=
e
> +                * mapping: a Capacity controller indexes a Processor Cac=
he
> +                * via PPTT cache_id, a Bandwidth controller indexes a Me=
mory
> +                * Range via SRAT proximity domain.  Mismatched pairings
> +                * (e.g. a CC whose first resource is Memory) would other=
wise
> +                * route id1 into the wrong downstream lookup.
> +                */
> +               switch (info.type) {
> +               case CBQRI_CONTROLLER_TYPE_CAPACITY:
> +                       if (res0->type !=3D ACPI_RQSC_RESOURCE_TYPE_CACHE=
 ||
> +                           res0->id_type !=3D ACPI_RQSC_RESOURCE_ID_TYPE=
_PROCESSOR_CACHE) {
> +                               pr_warn("CC at %pa: resource type=3D%u id=
_type=3D%u not (cache, processor cache), skipping\n",
> +                                       &info.addr, res0->type, res0->id_=
type);
> +                               continue;
> +                       }
> +                       info.cache_id =3D (u32)res0->id1;
> +                       break;
> +               case CBQRI_CONTROLLER_TYPE_BANDWIDTH:
> +                       if (res0->type !=3D ACPI_RQSC_RESOURCE_TYPE_MEMOR=
Y ||
> +                           res0->id_type !=3D ACPI_RQSC_RESOURCE_ID_TYPE=
_MEMORY_RANGE) {
> +                               pr_warn("BC at %pa: resource type=3D%u id=
_type=3D%u not (memory, memory range), skipping\n",
> +                                       &info.addr, res0->type, res0->id_=
type);
> +                               continue;
> +                       }
> +                       info.prox_dom =3D (u32)res0->id1;
> +                       break;
> +               default:
> +                       pr_warn("controller at %pa: unknown type %u, skip=
ping\n",
> +                               &info.addr, info.type);
> +                       continue;
> +               }
> +
> +               pr_debug("registering controller type=3D%u addr=3D%pa rci=
d=3D%u mcid=3D%u\n",
> +                        info.type, &info.addr, info.rcid_count, info.mci=
d_count);
> +
> +               ret =3D riscv_cbqri_register_controller(&info);
> +               if (ret =3D=3D 0)
> +                       num_controllers++;
> +               else
> +                       pr_warn("controller at %pa: registration failed (=
%d), skipping\n",
> +                               &info.addr, ret);
> +       }
> +
> +       pr_info("found %d CBQRI controllers\n", num_controllers);
> +       return 0;
> +}
> diff --git a/drivers/acpi/riscv/rqsc.h b/drivers/acpi/riscv/rqsc.h
> new file mode 100644
> index 000000000000..f7b556f29e16
> --- /dev/null
> +++ b/drivers/acpi/riscv/rqsc.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Local definitions for the RISC-V Quality of Service Controller (RQSC)
> + * ACPI table. Will move to ACPICA's include/acpi/actbl2.h once the spec
> + * is ratified.
> + */
> +#ifndef _DRIVERS_ACPI_RISCV_RQSC_H
> +#define _DRIVERS_ACPI_RISCV_RQSC_H
> +
> +#include <linux/types.h>
> +#include <acpi/actbl.h>
> +
> +#define ACPI_SIG_RQSC  "RQSC"  /* RISC-V Quality of Service Controller *=
/
> +
> +/* RQSC v0.9.2 Table 1: current revision number. */
> +#define ACPI_RQSC_REVISION     1
> +
> +/* RQSC v0.9.2 Table 4: Resource Type values for acpi_rqsc_resource.type=
. */
> +#define ACPI_RQSC_RESOURCE_TYPE_CACHE  0
> +#define ACPI_RQSC_RESOURCE_TYPE_MEMORY 1
> +
> +/* RQSC v0.9.2 Table 4: Resource ID Type values for .id_type. */
> +#define ACPI_RQSC_RESOURCE_ID_TYPE_PROCESSOR_CACHE     0
> +#define ACPI_RQSC_RESOURCE_ID_TYPE_MEMORY_RANGE                1
> +
Memory-Side Cache, ACPI, PCI devices missing?

Thanks,
Sunil
