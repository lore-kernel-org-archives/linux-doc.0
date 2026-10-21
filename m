Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604624;
	b=VzN7rSvA7C/PkpzJ0zgCeyCNMBM3UR7cDn1WTt5nki/mEVdZcagBMe6YLeqLK/iU8O4u
	 3Mv81pbWIdpt24/eG+Bb/NUG7ovdgtBtKMCe4PVH0KShoeIHNvdRWaFd3ozoOIY7CZJR9
	 WOR2rAhKOlRRrkyeC+QjddbdkEqzcCXtMioijBu92Gqlg5fW/ub842oWvG5lGXtZzNLS6
	 OrovQEKvmOLm3s2Pg0JNlHjABqHNMaQyjeFU/L/72ngk1GGKc+nr6exL7obMw01kF0lkj
	 TSKqLevc5+Nfs6dh91yny0XJIiQg/Hn6sOKaahX1NY7YNC2n/zDuaENpu/x5vCns/xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vilmZRHHMNfnexi+YGDujqWXf83C8yeE3BqzopJL6bY=;
	b=aqyRwUr6kDYCw5dQxcJeZW7Vd/VqfFVR8n+jL1wXwR/V3PYP5Ux3KFRd2Q/A7owUetSA
	 CwD7zDUAzLopVHvi2YBsZR+5Si1LMkoGXo0ZyPXO2qeb7L//I/vRTBc02R3EdecCX++aP
	 2zbLjPjbho6Un2qH1aNokYeqd8UK8vNszDdZuENLZhmnKUxjj0/M2SwzCkwHdxEb4rs9v
	 /AdgkobhM3y9VBrxOjmf5+5wU3CNjMPQ5kdCx/fLwo4QFK5VKZH9fXz2o20O9j6GbuGvw
	 u5WSP1GFvS51umzjjwUxc8dh4yxNPQ9ijhx0LNdACuTE3NeHyzKct1+2OZ1sbILz8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoyi9og8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPBJ2VMc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4042606A325
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4042606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoyi9og8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPBJ2VMc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTuv4141299
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vilmZRHHMNfnexi+YGDujqWXf83C8yeE3BqzopJL6bY=; b=eoyi9og8lE7X7gFs
	6zN8p4jNwkyfCNTayV/KpLYTog8YiPf09MNrJZcVJnd8ebBGnM3y90AF6J6wPsgu
	KIHm6p3JiNc6RZfwNDa4t1fGBEFrTEmAppjPtFmqqXsDcs6gCeSuRZZlb5bNDOS9
	ImS1uhcDnN727Uzxw2NojUhBmpaItcPZUTIJpC/20W36NsqozA/ILY/A7RqOC8Fa
	fp6nVz6bC6n4qpaiLw/MFEox+9rhuaWmCR3mtKA8Cekf76hFS10V2nlLwjUarK9d
	b3wbMfLBTWZOussj3TRqDPdEihPsXKcxNsCG7ejdilg63VQy4NSwejKyn6ahUKZG
	iSFgwA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex58986p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:43:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso2719300eec.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604622; x=1793209422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vilmZRHHMNfnexi+YGDujqWXf83C8yeE3BqzopJL6bY=;
        b=VPBJ2VMcXcNaHj4LvsAXnFhW1FlDSGpaj2nJ67NIv90rlCtfQrlm3xO2OP8/6q3U3v
         m/GywmheMx/wIgDsfVLHSLgY8RkZnG8Q4BjhxWHOhLRuYL+ZwHntk2e+DA2w8++IrGkr
         7taUWS2dgOWrmoN+0sCwZUd9bWehyi0IcJXVqUby/F+KkeuwMKzDA+2/A/QYRhi6dN8T
         TgkoO+f1LeOWlAfFzrzlPWw6NvnyBvLkPrbTgCqMCHglJfTtBKjYW9wITBbwCKrvukU9
         mWriQnI4utRmRal8KvRNBjJxkrWcOFT9PhHcVop3Pl2aAniGBamO/Gn2qlaJ4T3qeaQY
         ZWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604622; x=1793209422;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vilmZRHHMNfnexi+YGDujqWXf83C8yeE3BqzopJL6bY=;
        b=HL5z/Qu3/q2IQ5gRG3ICbVDZAe/WJiOVQkCQwnWeE4OSo/ZigPXXBWkhJA8e8IAE5x
         iACrWbGDhefM2KCrD5LPeqb+Eg8Czhg3V5myJO6peiQS/a2LpoA/Y3aZuLd8QlB6GKtF
         gmGHPynqsrbkUfP21UBN7mgZJWjUAgxcxWTbvmmhABwmgK3CDmuwfs4b5uqGlIAI09Tj
         //akz6RiuI1MeH5Y74zDGUxZBO0w7Bu750/2kCffeNqQX7TS5CymBFMV7+YGK9KHwKmN
         Nm8JsVIT7ja+mO2j7iW/krKO5zilEemRfiV9rXbegBkCBAAzLCjNrTcketzD7MuBjn/I
         jY+A==
X-Forwarded-Encrypted: i=1; AKwUvBwX9x1MsU95KiJ6h0vZTSPv3WzwhZ7KJfsHI8ZpYyaeomR0gNYomovyyc1BwumjiGI+uv+RswGq/mA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6LtWKBviqG/ClSg4V6FSgyRuehZYL+KujG4sOJgNMad0FpxEt
	H04D0GVvjPjS5TPrekQ58UIbeqR1AtVEFlGoobrh2NDWEYMsIXdDrT0qpKu/TTD6FIhV6z5HxXy
	urQPMwqu2o7PcgQ7QIdDYZ+ag5nvtkBR3HFgCMfGXIWbNfYPeRDJOEXcTXYv0w9Q=
X-Gm-Gg: AYBFou3esgFqC3+J8zSX9V+qh4GwaZv648vP3IVeeUls5zbKfioFHtaH/Z+M3myZ/Mm
	sM5t6o5/RRxu1FO2halaJZd7AQQYGo8UI5tnrL/7mF7rQviiVmFxHS+fzrHRkEhVJbihPwPg5Ff
	vxxV4x5JwDOao1vpJ9RNw1H9L8KD847fWjKf7EaWmGRyQ28KT8Hf32NyJr1DYZ6hY+40ATN77N5
	gpzMtHR6UGaZeeAmR0QZPjDaupChQJQFXQKXCCf9B366GYWF6lYg0nf6eJB8j9qAb3IRvE9Itup
	P2J8hqSvZnpMqISBdghIJTCDK32L1Hj/P9uWigGFdCYAebfIgfTqLIQct+Ier4xGG9OlmLis9+e
	w5tKjNJET6jdptoTbceOZylDLFQGOafTige7rM0BAXg==
X-Received: by 2002:a05:693c:65db:b0:366:8efb:bab9 with SMTP id 5a478bee46e88-3674e450f24mr4349175eec.11.1792604622290;
        Wed, 21 Oct 2026 10:43:42 -0700 (PDT)
X-Received: by 2002:a05:693c:65db:b0:366:8efb:bab9 with SMTP id 5a478bee46e88-3674e450f24mr4349127eec.11.1792604621677;
        Wed, 21 Oct 2026 10:43:41 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741f753f7sm8840346eec.27.2026.10.21.10.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:43:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:43:36 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev,
        Piotr
 =?ISO-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
        Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 11/15] arm64: drtm: Add macro definitions for DEN0113
Message-ID: <20261021104336.00000437@oss.qualcomm.com>
In-Reply-To: <11-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<11-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX1EyM/95NXQVB
 y+qhUsqF0G3u/5hOXQ8b9kaZK8Oymj0BkpEbtir4FyA+jD0w54jrx5eHbph5OUeiyrSjeX0vgFF
 wxWLzwS+PqapzIjqhz4hF/i+CSiJtwo=
X-Proofpoint-GUID: JuufH_JB51SmETLHBNs1yRJ9yucCXBHz
X-Proofpoint-ORIG-GUID: JuufH_JB51SmETLHBNs1yRJ9yucCXBHz
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8f9cf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=cBdanpMcOxUnX1AP4g8A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfXwAQym+G3ultv
 KkhSMNuv6q/8fKeJPeMW9/YfXnZ9MCYBrZdJwMpkCXdAt81sTLJQ+XlRV91djTPlchRzrwzkKSO
 uauLmq1CUUfE1asgu8cxgKZ7DiitPuSo2S7sMyQcqCEx03fNLz7/y1QcDPU3oo/O5XUQM7+dCiq
 3LHEq1rw8fcThf+RLplzhLIIIQ+mi9RgZpulfNY92bcBpQCVFbQsHQLpw83TSr/jNxY/OQN1bki
 55RbMOCN/4FzLDWfPkH3+H3zflKtZISQk+kxfPt02NFavnI0P9oz6o31YbEHXxkMZi4ZxMGWXyY
 WN9l+SgVeXx1pOV1LrAg72/kOslPDxttx7YH9T13FzOK9kJbh8Pt8yocAx7ibDuWTIeS1fsY7Et
 QU6K14SMTmeM8AgRN3sNSW+r1W2LG87+nZ6p9812gnNmoujwbi7q8rUSpEa8wyFhU67SrStNIjV
 qwYULuiyI6ATj22nkww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210070

On Fri,  2 Oct 2026 20:31:48 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Taken from rev 1.4b of the spec, following the SMCC register layout and
> constant names.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Nice - appreciated the spec references as saved a bunch of searching.
A few really small comments inline. Either way 

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  arch/arm64/include/asm/drtm.h | 304 ++++++++++++++++++++++++++++++++++
>  1 file changed, 304 insertions(+)
>  create mode 100644 arch/arm64/include/asm/drtm.h
> 
> diff --git a/arch/arm64/include/asm/drtm.h b/arch/arm64/include/asm/drtm.h
> new file mode 100644
> index 00000000000000..8188af1b582bb3
> --- /dev/null
> +++ b/arch/arm64/include/asm/drtm.h

> +/*
> + * The spec uses 4KB pages for sizes and alignment throughout, see v1.4B
> + * sections 3.3, 3.13, 3.14 and 3.15.
> + */
> +#define ARM_DRTM_PAGE_SIZE			4096

Maybe use SZ_4K from linux/sizes.h



> +/* v1.4B section 3.3 "DRTM_FEATURES" */
> +#define ARM_DRTM_SMC_FEATURES			(ARM_DRTM_SMC_FN_BASE + 0x01)
> +/* X1 input parameter */
> +#define ARM_DRTM_FEATURE_SELECTOR		BIT_U64(63)

Maybe define the alternate masking for function ID - for completeness if nothing else.

> +#define ARM_DRTM_FEATURE_ID_MASK		GENMASK_U64(7, 0)

> +/*
> + * PCR schema numbers. ARM_DRTM_PCR_SCHEMA_MASK is a bitmap indexed by these,
> + * and the Launch Features ARM_DRTM_LAUNCH_PCR_SCHEMA_MASK field holds one.
> + */

Similar to below. Maybe this dual use is a bit fragile.

> +#define ARM_DRTM_PCR_SCHEMA_DEFAULT		0
> +#define ARM_DRTM_PCR_SCHEMA_AUTHORITIES		1

> +/* v1.4B Table 6 "DMA protection features" */
> +#define ARM_DRTM_FEATURE_DMA_PROTECTION		0x03
> +#define ARM_DRTM_DMA_PROTECTION_MASK		GENMASK_U64(7, 0)
> +/* Only valid if ARM_DRTM_DMA_PROTECTION_REGION is supported */
> +#define ARM_DRTM_MAX_REGIONS_MASK		GENMASK_U64(23, 8)
> +
> +/*
> + * DMA protection types. ARM_DRTM_DMA_PROTECTION_MASK is a bitmap indexed by
> + * these, and the Launch Features ARM_DRTM_LAUNCH_DMA_PROTECTION_MASK field
> + * holds one.
> + */
> +#define ARM_DRTM_DMA_PROTECTION_COMPLETE	0
> +#define ARM_DRTM_DMA_PROTECTION_REGION		1

The dual use of these for bitmap indexes in one place and
values in another seems fragile.  Maybe it is better to have
different naming for the two even though the values match?


> +/* v1.4B section 3.4 "DRTM_DYNAMIC_LAUNCH" */
> +#define ARM_DRTM_SMC_DYNAMIC_LAUNCH		(ARM_DRTM_SMC_FN_BASE + 0x04)
> +
> +/* v1.4B section 3.5 "DRTM_UNPROTECT_MEMORY" */
> +#define ARM_DRTM_SMC_UNPROTECT_MEMORY		(ARM_DRTM_SMC_FN_BASE + 0x03)
> +
> +/* v1.4B section 3.6 "DRTM_CLOSE_LOCALITY" */
> +#define ARM_DRTM_SMC_CLOSE_LOCALITY		(ARM_DRTM_SMC_FN_BASE + 0x05)
> +
> +/* v1.4B section 3.7 "DRTM_GET_ERROR" */
> +#define ARM_DRTM_SMC_GET_ERROR			(ARM_DRTM_SMC_FN_BASE + 0x06)
> +
> +/* v1.4B section 3.8 "DRTM_SET_ERROR" */

I know I'm the one who asks for references, but maybe the SMC numbers are obvious
enough without given the name matches the spec section?  The table references
etc below are excellent!  The do no harm beyond a bit of bloat though so I don't
mind if you want to keep them.

> +#define ARM_DRTM_SMC_SET_ERROR			(ARM_DRTM_SMC_FN_BASE + 0x07)

> +
> +/* v1.4B Table 8 "Definition for error IDs (Bits[10:3])" */
> +#define ARM_DRTM_ERROR_ID_NONE			0x0
> +#define ARM_DRTM_ERROR_ID_PARAMETERS		0x2
> +#define ARM_DRTM_ERROR_ID_SECURE_EXCEPTION	0x3
> +#define ARM_DRTM_ERROR_ID_TCB_HASH_UNLOCKED	0x4

I'd use NOT_LOCKED to align with spec.  Maybe it makes a subtle
difference somewhere? UNLOCKED might imply a transition to that
state, where as NOT_LOCKED doesn't.  Meh, doesn't really matter
as I'm probably over thinking this.

> +#define ARM_DRTM_ERROR_ID_TPM			0x5
> +#define ARM_DRTM_ERROR_ID_SIGNATURE		0x6
> +#define ARM_DRTM_ERROR_ID_IMAGE_FORMAT		0x7
> +#define ARM_DRTM_ERROR_ID_VENDOR		0xFF

> +/*
> + * v1.4b Section 3.3.1 says:
> + *   A return value of greater than 0 means the feature ID is
> + *   implemented, and there are other feature-specific
> + *   feature or capability bits available in other return value
> + *   registers.

I'd wrap to 80 chars.

> + * And for FEATURE_SELECTOR all defined features return data in other
> + * registers, so 0 is not an allowed return.
> + */
> +static inline s64 arm_drtm_query_feature(u64 feature, u64 *value)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_smc(ARM_DRTM_SMC_FEATURES,
> +			  ARM_DRTM_FEATURE_SELECTOR |
> +				  FIELD_PREP(ARM_DRTM_FEATURE_ID_MASK, feature),

> +			  0, 0, 0, 0, 0, 0, &res);
> +	*value = res.a1;
> +	return res.a0;
> +}


> +
> +#endif /* !__ASSEMBLY__ */
> +#endif /* __ASM_DRTM_H */

