Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00825487C
	for <linux-doc@vger.kernel.org>; Sun,  8 Feb 2026 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770568993; cv=none; b=qfmmG57vo+nLmwBbVdzWFceiC3ls7WkONCa2ILJdKfUUGW403/I4Fq/lKUPyUk/vZKFARySzMD6nEO4hnkTt0u1H6lt4lJDKh2yuI33qsKVf2IKFEX1qIWNYtfRGi9lVKC6fcQdwmOTDaCFQrFjNhwb5mtJSJ6lECP+KhlqqfAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770568993; c=relaxed/simple;
	bh=1uA505iVZAojZE3XL8gGwiGWP+M0qwYo4cUNtxEaoiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b61R5DHy5of0U6glJhLzinuemVObvNgXG9k02W/JQZZOZMWtEmzuDqpgfSWOJTtZsTagOBOXLVp9fQRjnmSERxW4wSMpjx9VCBVN44g758p4vx1OqpTUUOLUeUYhpVkbxV8EzAGljspB2IBKX+vNsFcINf16kZlw7qtOMEtlpSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkutnRG+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqGWzX/q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkutnRG+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqGWzX/q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Bd4uT4025674
	for <linux-doc@vger.kernel.org>; Sun, 8 Feb 2026 16:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qyFbrkasGvytW0vFg5FR+HBR
	DKrens4j/ebP3iog8uQ=; b=PkutnRG+Gn+RCa1hcMKBojXKg1NgYLPsuKQj+Ziq
	qYhbZykVzF4yBRMMUQpsoC+wbsDpZjWv7J4oCl8rRK54CTL9L1yZwU2sSk4Hvrkl
	qgYerpESiVdjvGPXXV8YAM78/Rl0T4b8/gO7oqYs80Oe6Ka4H8O+Uz0Mvc0HwGmn
	pa4cT5xqkb4yYdVQbZxeTo0Cj00r2nqLHrvreL5Shl+o9VloQY8kM28uaN7kDEVB
	32Rsf+oAbLNgXN8O0Xb7Nma55nC9/zFFKO70CkxUZaFz7vkXc6Ahic9AshI/Y1ZN
	x9vwJvc/Q1GCr1wm1iCmS9IzpttnqY7Y7bHpL12pekSHVg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd2m9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 16:43:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127133794b6so911604c88.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770568991; x=1771173791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyFbrkasGvytW0vFg5FR+HBRDKrens4j/ebP3iog8uQ=;
        b=WqGWzX/qmLu9bFvrDvJeiHipf2aappFCtn8q8+nZp4sjrwFpLMYhScnQlrTxq3rShD
         /q+5NLy6sEp+Iq2Z0TpZvtwARwyQxy1gLTKMsyylC9D75dRM1C8fBTfvNcRZR2lVXgKq
         Wh0wC7gv6U24conKDCHKXDKHW9CDMMogWUVwbYhV50y85dtnufF2GLNyDIi6ZKQlHvJG
         V46EWPiJyrU4stMI8TcCkrrT3SkFr0u31WGOf3s+XT3ZGYKwbvzfTROAPnhBNo0lIDc6
         zloofDkv8A2FTW2pbMHtZ8wzfuHmHGI+O6WC9+mds0MpwcLtqj5EVeXi1yA4PPtAoAZm
         a4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770568991; x=1771173791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyFbrkasGvytW0vFg5FR+HBRDKrens4j/ebP3iog8uQ=;
        b=BzjEAEcCqGiNmAlm3MsHzl92jorZulvcjQvN4xjh5amXTaX/RrBJhFyFwtFormuVkS
         uVHjx9V/e2Zt1hDf1M/eWuAzjloULtSAiUaNqTuXnWir90+l/GdTondmVh1t0PreZLz8
         hxxzRKjQzERFPCBlwoBDU9suKr9J0Z5nPfpN2724bjIDD/Ed6keoi1vArQHWSRPi7DqY
         B2Z9eeJy9P2tE3D9yL7gwYr1OyzPQGSoqOd5JLXdOeG002aVu9KHGw/UOb1bOlT4KW5c
         V9pWTNi4gLmuKJrVcDp6V/bs2ps73XRTjuUw9N/dAxS4b/ptGWUGDWd+9CYmIbW3VFhG
         qH9g==
X-Forwarded-Encrypted: i=1; AJvYcCV1zBfO6hBF8h5Q3ahpx7VNzTaHTapN7ikt3PNGDHsblOI4iQJgoLq+ztMZygA1qL83Wb0gJFHQ39c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRYKrIfOY6AnhUdxTR0rQ1c2zlGDdj6gf1gw70NthOvud0LZgO
	Ix0bCq1jwjMev7KAbWuIaluXisBMq9ysGYoPXko1Os+GzfyPeP8OeeAPCWTkE8JowvSykKiG/PX
	vkHqavJQ8xDKIfkCLV4LEbeFR0UdqLpCf7bamkTTw6Hg3YbF8mPFc4G0NjfGE6To=
X-Gm-Gg: AZuq6aJYW/EpwIEyFh7Wb4BNQX6GUW4KnshAY28ocOEtKiWXFmeY3Yh9x8aGeIMEKsH
	KMEwyE2pdRgEoEuBf8CEbJqgdGhwAT4tP1lLEiRQn94u9eBfibczCGKOvGZ5pN6BrPxEYe8j7F3
	inaZ5Z9yBch+82nTkBto22YPEsWQiUPb7J388ev/B/7VnQbr/zuu3X7SsokAzmp3mrygbkr5OaY
	W27HFjz7Jaa/d6C9t21YO7I/ZAU98u1cHpq2h5k47fKB/o8/BMFskDMO9B0/QaL3Yy8yeUSAVod
	IJOQyDvqnkCPARWG2K4tmmeAeePdtV5EofYtFNEKcCg5LBqvTeTjHeNad8NlLruud5FBwplU7dl
	LatN+GtkNlOAoKG65pl8=
X-Received: by 2002:a05:7300:cc0c:b0:2ba:6e87:5263 with SMTP id 5a478bee46e88-2ba6e8788a8mr523578eec.32.1770568991447;
        Sun, 08 Feb 2026 08:43:11 -0800 (PST)
X-Received: by 2002:a05:7300:cc0c:b0:2ba:6e87:5263 with SMTP id 5a478bee46e88-2ba6e8788a8mr523561eec.32.1770568990890;
        Sun, 08 Feb 2026 08:43:10 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba6d1c61c3sm1199441eec.19.2026.02.08.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 08:43:10 -0800 (PST)
Date: Sun, 8 Feb 2026 10:43:09 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/8] riscv: cpufeature: Add parsing for B
Message-ID: <rbhjt6qmraoxsdur74mhl2ugy7orr2mb237ynq2sxrraqkl5zm@yc6kim3ic6as>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
 <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com>
X-Proofpoint-GUID: HulHhGDRNwBmhMoOj62ay8CRSlAJDXs6
X-Proofpoint-ORIG-GUID: HulHhGDRNwBmhMoOj62ay8CRSlAJDXs6
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=6988bd20 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=Y2NC8pMVq5XtuLsIzfUA:9
 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE0NCBTYWx0ZWRfX92vUUzMMbpjK
 4e1tQD70hb8uNS41i+toeyTSSVXPzEulOJIRFACrnNPpkTE51peCN9FOVgZ2W5vD40IZDeFOcKp
 S9jOykaXikImrvVf2uH7+2kcnbthW/BqaTdalRPxwadn/cndM/+JChYre5QniOPA6f4AAaJNjLm
 Xl1bFFVWn5Bw40aEu7q7cimaF8t0f8PaDdnNZRsZQbsbipCCfwGlLS011SnjA5pXpI25s/+/m2L
 4ltllz0Dbn0QerYQVzMATZwgpRtcNaQHH5H4j96/JRoVr75apvi+hpQhkZ/iaLryO3rsFVikwY9
 YPhFwZdYF5H71uYLTmRjZIPvKuEtRSMKWToCNKHkjvnurt2HbhB9nyZoRO9QpofSsakhb/AQIvG
 qmrt7so27dXf3FvD+P+SEwC3tljnLlaMtuoxfXQ+RyxtTJ+Ers7bZp7t0V6vHm4oZw1KCRUaWU/
 DiRytDEMBCapcww31Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080144

On Sat, Feb 07, 2026 at 06:27:55PM +0800, Guodong Xu wrote:
> The B extension comprises the Zba, Zbb, and Zbs extensions, as defined
> by version 20240411 of the RISC-V Instruction Set Manual Volume I
> Unprivileged Architecture.
> 
> Add B as a superset extension so that when "b" is encountered in the ISA
> string or devicetree, its sub-extensions are automatically enabled.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/include/asm/hwcap.h |  1 +
>  arch/riscv/kernel/cpufeature.c | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index aa2af21f3bd32573558e964f94b32f9739f4c89f..35e87e4a8475a9201e84e7f9f8a4d10dfd9e4759 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -11,6 +11,7 @@
>  #include <uapi/asm/hwcap.h>
>  
>  #define RISCV_ISA_EXT_a		('a' - 'a')
> +#define RISCV_ISA_EXT_b		('b' - 'a')
>  #define RISCV_ISA_EXT_c		('c' - 'a')
>  #define RISCV_ISA_EXT_d		('d' - 'a')
>  #define RISCV_ISA_EXT_f		('f' - 'a')
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 63ad6393b2c6dcbfd6e7e247cf4bacb6c11fe58e..3d3af82a53250f29204a3fb138feaf520a878d0e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -480,6 +480,15 @@ static const unsigned int riscv_supm_exts[] = {
>  	RISCV_ISA_EXT_SUPM
>  };
>  
> +/*
> + * The B extension comprises Zba, Zbb, and Zbs.
> + */
> +static const unsigned int riscv_b_exts[] = {
> +	RISCV_ISA_EXT_ZBA,
> +	RISCV_ISA_EXT_ZBB,
> +	RISCV_ISA_EXT_ZBS,
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defined in
>   * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
> @@ -528,6 +537,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_b, riscv_b_exts),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
> 
> -- 
> 2.43.0

Hi Guodong Xu,

As part of the "hwprobe: Introduce rva23u64 base behavior" RFC [1] I
posted a similar patch where I also added B to hwcap. Can you take a
look at that?

[1] https://lore.kernel.org/all/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/

Thanks,
drew
