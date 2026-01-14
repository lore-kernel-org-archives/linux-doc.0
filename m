Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF872D876B
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422765; cv=none; b=SAHccbQnxcCD16LBAobA3ANqZyTuLV073nrqa/u+0HMKO/B0SuR9csTVTKCQEjjXgZ4591Jqv/7DQPSLSQxVyZFRm9PgZiNcm5MXxkruzPb+UPMz+VpHcLwto179G64+7qgTJ/nCLjiSzeR3V8fcTgc7P1SyyaqyJ7hKK98iajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422765; c=relaxed/simple;
	bh=U+3ZNQscai9GlxC1QAuNaCvr6MJnmMEaB8dbQhg//S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImUmnEx5uHEu5UhbUjTI3KxcDy7S8QfZUZKsmaPZ3oIb+t2l4zq9HVmKdlYjVvxQjQW1zXjEnisSMTIye0fvPD/SOdtB7ZUcUMk7jkwoc0R5JVkQY8W4PIdOZzayzxU8oS8sOv2wim1MT5eKVcDAZTC+dviZG9aSnz1jH5QjejA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7xpqtyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9tPDXnE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7xpqtyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9tPDXnE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHDX882902925
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VR1pGYu1k6kGYDP61Yy+ZO9r
	3dhq0yO0jV49pm2zIRM=; b=a7xpqtydG761ASyzEx4bM7E+s9ss0qHEXHAmuHC2
	CgdekNrTTq31/OrjA7P4gy3rTeWLuReUSe1LIGCaZw5jI3dlYc7KoHP2IfCOeO9F
	GundZBnWePfjr/2JP/8gE1kZbuU1vd6NVGDrYm+v3uD2BXp4iKJWD+A/3Wh2o3GN
	8BTAhuhks4Y8QVPoSqhTSIwmNXIYCH8D9xxrdc93RzNR1H1jyl9QxdgUxTtJbAQH
	C2UgM21ZwHiwTnDIckHt8sdQN9C1aJvfdtp0whomyI1PkQRz/2ZsDUuRCefmhkGp
	LP2cYM1xKDdSNxcdGnFsyt2C8kH41EdWVkS4otmXRBqnNg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931j3mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:32:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-121b1cb8377so364203c88.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 12:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768422762; x=1769027562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VR1pGYu1k6kGYDP61Yy+ZO9r3dhq0yO0jV49pm2zIRM=;
        b=C9tPDXnEojT3Mn7N0GINGZH2FRKtilLbefg1bKAmaZAuXdShECEKnWJ2EnDaWeqxXR
         VEEfq/O08mw8LdxrxTxDiAPZr+9TMC4zOL1xajeBLBkS0otBf0VAXX53I2gERMXuzPGC
         H1dLR5rX1oXydavCdJ9FEW8GAyNJ/Zrf2ERN5c/BNiZrgw+dwEqgyuEERM20++b4K6p1
         gtq7+Ix7hnuXbRrO7CAvLCCySqAzIHavASrgtIG6+R9+cMeOkM84YnKWCIAYAa6pEUtU
         cw7XiMZRGB8NJGHaF6wV0d7hYx+Lg4wb5CwF3JUzfPcXKgUNz8h0Q+o+3j3Lu0M2Vg61
         CTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422762; x=1769027562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR1pGYu1k6kGYDP61Yy+ZO9r3dhq0yO0jV49pm2zIRM=;
        b=Rz8SxH2pP0l9E7vY9Rtu6fz35Hj3b3USi/wDUvB0e9w+ODGfZE8JKg2j7mrtosqC6F
         woiZdy+q0zjxJHjv0Z/s/Z5QRDqrf+uldeAJ7YpE0htcCpINn1vtk+fUfrloyWUbk72r
         Sc+LEMQYtGjcYx5MxEZlBKsJYSo/WP4WHCrqaq3OI5HdHEa1WcdtTMLljhCq5ZHZOVUu
         rKtvoY2Mifo5TmgWENnNV9ndNfR8BmCA3t05bzkgtzZixSHd3zsBIVYzGMBk+kURlpOx
         PYAsbMVOXu/j4wTcGXiI+ociYw9hZ1BEcIWAUNvK5hqrzVHzl5ULapn2M2gYEOoRH9+a
         uaZw==
X-Forwarded-Encrypted: i=1; AJvYcCWTb/Xs6+aBbPDh5w75b+uyKQUw1ADLd5GDVxbCUHzi+shyL3J7HU4sB4QhwlHzPeFEbW3Vjon3Rx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pDNwCxSye2trz2xbYY7I8dVd7vkBarbhdp+UKH7io6RES4jN
	VlDAR9PouDLhB12Mt/gEM/aCWmcqLmre5yB8goxA3srWCtHKqPtGWdSAxxXiiu2tLoSXSo7Av4L
	oNiDOWjIV3rv+nR9gqSzLzmGfmNhhx1xEm5hl6RR0bXStmTTa0e7DwyZ+JsXlYb8=
X-Gm-Gg: AY/fxX5QD1+/dmqtdpTXNIrO8SK/miQpU5k6hSKsiSPqQpt7T7x22NhAnbt3OdJ/uzN
	Hm0t8MO5ZH4K4Hw/0jJf6K5Qg6kHLuKo3RS+dC5yeqQTZE5AsVCmQ4vbkDNgetz+lLu71asXouR
	D7OfKC+oACSLzcQYIFuC8TeyiOg18WsE8WBetir2HeUQeteaTZwJnUTR0BNOJW4d7pr4PNzUdwC
	s2YvdA0dERCiXM2hg1CBh2qlC7vrPRrfU1eOphC93vYGB7EuPTYx4G5q/EwclBu6tWN4q/P13VF
	5yPzW7UHh0oZhoZUJB0op+IpdW0nKFdJAvCQ7YTl5Tj2xRWTkyun9OIbuSgQ5Awpm7/kG6mMZ4q
	yj0XxjOwSVEYSQ9IEY7A=
X-Received: by 2002:a05:7022:1e09:b0:119:e55a:9be4 with SMTP id a92af1059eb24-1233696e203mr3863557c88.0.1768422761969;
        Wed, 14 Jan 2026 12:32:41 -0800 (PST)
X-Received: by 2002:a05:7022:1e09:b0:119:e55a:9be4 with SMTP id a92af1059eb24-1233696e203mr3863526c88.0.1768422761394;
        Wed, 14 Jan 2026 12:32:41 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12316f2db84sm12807661c88.14.2026.01.14.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:32:40 -0800 (PST)
Date: Wed, 14 Jan 2026 14:32:38 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 4/6] virt: bao: Add Bao I/O dispatcher driver
Message-ID: <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-5-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107162829.416885-5-joaopeixoto@osyx.tech>
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=6967fd6a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N2YwmVq2Bvn80NP7DBUA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: Ohnzrvh4H2pggeQjrW28QN4x2FdITEt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OCBTYWx0ZWRfX90pQbINtdWAC
 EsXTq8tVujrPJUi9wr/o6yiQgltnF1jewN2lGDtC2zLqyn9rFhNcN7zocqoP4TPGgxPtilaG8i7
 gDjJ1g3oKzdElXEMR0EQ6/AGA8jjsmju6/ZzY/raA7aEtcdFBxbRyH5b78o/0AwJwBmJYwYKlNo
 tnPRR+wWWH+a9hou0PHWXd3u/JRZEvZpGETs4EaSw8eP2jBoX39F3DsjTwW7+OkfT0cgILwD4lY
 cQlQr9Y5VuWIM/AF93MAGAELpgOZc2WCo1KjKNE8gyTs0VYv070Ys2tfb9mTGHtcWXUgg5eIzBj
 KlOydCMQ5cNCRKFndg+JW/BL6qAXMWbusiye4BSb0SOiUkSewQ37PrCz29n1bUgWSWhz7akPoIv
 pT5D4lKjKY3SAZylISs78EwknyK8ntAcr9ADPexJ5a9RN4je5mibFlodKevRL/QAPajiAtYpZuT
 ucYnClFAd9b5/s5EA7Q==
X-Proofpoint-GUID: Ohnzrvh4H2pggeQjrW28QN4x2FdITEt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140168

On Wed, Jan 07, 2026 at 04:28:27PM +0000, joaopeixoto@osyx.tech wrote:
...
> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
> index 35658f37e1bd..f04e6cd33fa9 100644
> --- a/arch/riscv/include/asm/bao.h
> +++ b/arch/riscv/include/asm/bao.h
> @@ -14,6 +14,7 @@
>  #define __ASM_RISCV_BAO_H
>  
>  #include <asm/sbi.h>
> +#include <linux/bao.h>
>  
>  #define BAO_SBI_EXT_ID 0x08000ba0
>  
> @@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>  	return ret.error;
>  }
>  
> +static inline unsigned long
> +bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
> +{
> +	register uintptr_t a0 asm("a0") = (uintptr_t)(ctx->dm_id);
> +	register uintptr_t a1 asm("a1") = (uintptr_t)(ctx->addr);
> +	register uintptr_t a2 asm("a2") = (uintptr_t)(ctx->op);
> +	register uintptr_t a3 asm("a3") = (uintptr_t)(ctx->value);
> +	register uintptr_t a4 asm("a4") = (uintptr_t)(ctx->request_id);
> +	register uintptr_t a5 asm("a5") = (uintptr_t)(0);
> +	register uintptr_t a6 asm("a6") = (uintptr_t)(BAO_REMIO_HYPERCALL_ID);
> +	register uintptr_t a7 asm("a7") = (uintptr_t)(0x08000ba0);
                                                      ^ BAO_SBI_EXT_ID

Using the experimental extension ID space would be fine for an RFC, but
this can't be merged until an SBI implementation ID for Bao is added to
the RISC-V SBI spec. Then the Bao EID would be '0xA000000 | <Bao-IMP-ID>'

I think we'll also need to discuss whether or not firmware/hypervisor-
specific extensions are exempt from all rules in chapter 3 of the SBI
spec other than a7 being the EID. If not, then this function should
just call __sbi_ecall() and the Bao hypercalls will not be allowed to
modify any registers except a0 and a1.

> +
> +	asm volatile("ecall"
> +		     : "+r"(a0), "+r"(a1), "+r"(a2), "+r"(a3), "+r"(a4),
> +		       "+r"(a5), "+r"(a6), "+r"(a7)
> +		     : "r"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5),
> +		       "r"(a6), "r"(a7)
> +		     : "memory");
> +
> +	ctx->addr = a2;
> +	ctx->op = a3;
> +	ctx->value = a4;
> +	ctx->access_width = a5;
> +	ctx->request_id = a6;
> +	ctx->npend_req = a7;
> +
> +	return a0;
> +}

Thanks,
drew
