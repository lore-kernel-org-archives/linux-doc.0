Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606303;
	b=mza0tHjEgw7KhQLfB8obkQbIjDtnWzYmmiNykJRh0H7rXSfRwkgiFiOzT6hYSaPvx0OB
	 vfgkRnwv2Tfb5wnJhupxb2jqEbfftuuypt+gr15waQqC5VX9ISx3jvREin/1kDtYIDUN0
	 d054jY8HaaS+gfoshiQyOjukKE4T1XIJ/jY90/Oo2461s6S6prb64ebLvz6KszcBafS3J
	 DKDqDA1ZsWwc8qgUj8HlNs1VfLD22wwCcBpIz+0TAp7HZXr6K5JXRBoivjKTmbBp4B+ma
	 0p+u1ZN+5jUOaQLDgsynb0+QlNJtfAjxMf+u1Jnm9ByB/BB1EN8F4Ig4x7BK8k7NwNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zajgpZEWlkO9hnDwMwdkleexKLADl3q/zhIDBDjaWRQ=;
	b=UPLBzI2jAUOKM22Rme+9uiaO+yXccYtnsmOAgn3Jb0rbxsX6IG99zrzfLQ3Ff5XUo0eK
	 E0znFiM5vYeBIdaAl9DviS5JKsXJCt7j6LTMlTidBinrKoU15looTa693pDJm1ktsT077
	 xp/+JOsIRYmEdzvIcclamJmgTkJAVnBjD0ScynE7Ew0s6GHVrDI8A3ynvNHdi0sNkbfFT
	 ezCPzzagciCpPL4ZeOMFPx6G+6TA4pFmWTm/Z2Y7a2otdxTpNJkNykaooZVdvjO/snMO8
	 CNBjOj/8lPCu4fozJCrjYaA4FZYDs5LvTTtWicGzOnoPox6Ho/xSotGi47qTfscflkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBq8By91;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaGqCK7R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D92606A31F
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 18:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D92606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBq8By91;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaGqCK7R
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHpEgQ1795039
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 18:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zajgpZEWlkO9hnDwMwdkleexKLADl3q/zhIDBDjaWRQ=; b=KBq8By919CR0Wk6J
	i6AHGYv1uzl0plIu0g/ZjSagDkXy5EsbBsmzhImhAELaJ/l3SfReAUQpWiSHeVNf
	BufY1pa+JPkBGkez43hmPC7dSe/wTdocSPdgRHEIkjXg+77SAdYjTQAo3aTC702v
	wIJaXklJi5pC3EQlxvgOlS9JUMDPzA8ux1CypnFa/HaSbozJtLx5c4F1YuTj12X7
	fPuROybpD306YEcuArWKV69DugzhWLf5aBj0QG/MFJEbJRpq1GRrz3FGnTg4Sr+J
	HgvYZbYSilPrBWCFEs8avj6fFE58i34cFDbduqKYWVEMlX2iQVhEPuzZodKWCD3h
	tK/n4A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3g57k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 18:11:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36803927a49so1619873eec.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792606300; x=1793211100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zajgpZEWlkO9hnDwMwdkleexKLADl3q/zhIDBDjaWRQ=;
        b=YaGqCK7Rzl2stBiPjB2XmkxdVkbLq0gkYJ9dR/bWa3JZRJBurr9bJnuotCMi03y9Cq
         U7ZpsiBsl/bNdXEmBnovl8NsnMdrTHkBUuf6znyK+NvOdjqXH3ot+htk4K6DGwWEMkAq
         h2yX2eyn4loxTooaCw8uib2vTBjOxQCbQF/aLK/v6eHmPfqHwSv7LJvYfAhnCYeS5z5K
         2KxAyoZt7nbx3vZ/Og3QKQCmwFmz1BqHao11D64WPL1hhGNh1bqGI2utYOy/lDXyUunr
         kXnvirkudF3PNCnMhYh3KVkSw5GWdyIn0AA8DOxfFCpCCN55cxpU1bRvDab2OjSfZqq3
         Mm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606300; x=1793211100;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zajgpZEWlkO9hnDwMwdkleexKLADl3q/zhIDBDjaWRQ=;
        b=F87IKO8OKJNH9T5JMrfQGupAR3ViR7ISTnWQlXqUech+gfFlIhVqO1j4hcot8y64Q2
         06JQ9n7rCCWxgiklUZs0rd5iu6NXnBl9Wv07zv/3R/3H88Njbz3c3vErpn654eHgNYxe
         AFmABuBVyJ416w8xX7v4F322+X7kj03NiGTtHP5mALG2o2rLHrb0RxYxAZTyDGc31QO6
         UR03Of5xMe/PMA/zoPgDMPqstqauz4BA95Cmwo17E+lDTlBuYBBQr69NxuU1f6OmR2HD
         TFB42aI531RrX2dtWn5YMP6s6KPDWivSjZfSVk4j/BTMAhsyUzhigx5L7Gex/DI9c7R+
         GwcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpqfzNLfiisOIzB/mADoRTj8NpKrfu2DHNli/Kg67S+73yI4FPqVO9RcWTnclrQrdDyXvSTsph2+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfISYGgHqCxaZYzH3eLHZeQ3YC/AM/mcWUpxJCcZZOCsDd6eH/
	njUHB+PEDX+/OAFVTYXVWCEzEuMP83sqU+VlDEAKx6Y58is0E2qm0hy9c/DaQdjLhyzPWhNUWaR
	sTmV7/bsCGyMoCpRgO2EDtntZritsd4I16/Ebq7vdl7ex36vhPzXHpPdnXT4yRkk=
X-Gm-Gg: AYBFou3qGYc6mQP1oWFwNKxGxykG7f4XR9NaEnlgRTvRnXoIKkuVAZBtEneZiKXt8yH
	ZMIJuIeQTbHBlM/PKXbA6d7DO1LtonSvzZf6ABKiw0SO/9GRWIhk2ySrl+KlWHFadpdUaeekDTI
	lQ4LPg9EGhCdeyxCoVV8n46blK+J690DDhhGUdQeM7VKs93c9EcZKFU3cCTHMJt7YYLA0KOyxwk
	1l2OU/Ig9boZLTzp/ic0/p+oY39EKihE4xsknPLjBA90Cq/ZMdYSRnMV56V9fKyFcgoH/WOKORj
	BCTOCLcokUwwgUBe80hVt+AFxh4BKE3XYFx0eQvH9u7hm4+pOJsTCtxNVtxRypYQ7LBkSUn8FwD
	55I+xvVrgaazcd8RYYm6/r/XRt+fjEXyqxa22tXQ6O/E=
X-Received: by 2002:a05:693c:41cf:20b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3674f21a97dmr3790642eec.24.1792606299627;
        Wed, 21 Oct 2026 11:11:39 -0700 (PDT)
X-Received: by 2002:a05:693c:41cf:20b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3674f21a97dmr3790596eec.24.1792606298974;
        Wed, 21 Oct 2026 11:11:38 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674206d1f1sm9116156eec.28.2026.10.21.11.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:11:38 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:11:15 -0700
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
Subject: Re: [PATCH v2 15/15] efi/arm64: Implement ARM64 DRTM in the stub
Message-ID: <20261021111115.00004c5c@oss.qualcomm.com>
In-Reply-To: <15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
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
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad9005c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Ikd4Dj_1AAAA:8 a=Sk9Lk7371zlc0StAK_oA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: lL1AAAZspq9eM659iYVzqAw3DPPn4dFr
X-Proofpoint-GUID: lL1AAAZspq9eM659iYVzqAw3DPPn4dFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfX8lvbw65OYcge
 fqC2Dw60pXdiLQtH0Ng3zBu2EuytHSSWlqRzBZNfoQGZutu0KaNF+PbidzBv1DwpjoBPD3V200l
 QHDIHHqKx8PyN5ad+cgwsa/9Cxn+m5+yVADei7owfgR4pnE6HkAqZWOKRuvoduCU2334J3gt6Sw
 Z97apYaLKqqdHF/ImeG2SDd3XQSSiQzp+ft62KewO2JcVx4SRqrZTwp4O7QDB+ZHYR3tjQD6ZTI
 vjpQ8yYApHX33u/ink0M6DjughzHmXJm2146KPusfZ/4E2rCh0vyBcHm7Ke19kH5jjrPwOvSOE0
 /YGGQTvMASetJ69BZeCDbLLq7peZHDy+OC9BFzkInAalHS+Vx/TgWNzF98R6BqpSUUTn6Is/ElB
 nlsEvcG88HcxwZH4Bigf2m5ttQFeF1hLdFWswWrQjvSSXKGthMBpHFTyFoGsm3rD/VG/0/9d4hS
 m7YM7wbtkMsfX8LbikQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfX82bPWNdBS8FE
 lA56j67Kp3NqYHNj6WGyDkULNkukVsd75Og4UgUjMY+lTo3cOxVGhfQwEM5d8hhMLDmbAbtJt3K
 FtcPmoWdtO/REsB8zE89ORcs7wSQ5Ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210072

On Fri,  2 Oct 2026 20:31:52 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Provide an implementation of the CONFIG_EFI_STUB_DRTM protocol for ARM64
> DEN0113 >= v1.1.
> 
> First, it queries the FW for support and collects all the
> information. This is needed to compute the extra_size, which comes
> from FW reporting how much memory it needs during the launch for the
> DLME Data and DCE-owned data. The generic stub ensures there is
> trailing memory after Image for this.
> 
> Then the DRTM_PARAMETERS launch structure is computed using the
> offsets in the efi_info.
> 
> Finally, the stub does ExitBootServices and calls the actual launch.
> 
> The feature discovery process is deliberately fairly verbose to help
> debug any FW weirdness in the field. Enable it with efi=debug
> 
> It looks something like:
> 
>  EFI stub: DRTM: interface version 1.4
>  EFI stub: DEBUG: DRTM: TPM algorithm 0xc, TPM hashing unavailable, PCR schemas 0x1
>  EFI stub: DEBUG: DRTM: minimum DLME data 73728 bytes, Normal-world DCE 0 bytes
>  EFI stub: Decompressing Linux Kernel...
>  EFI stub: Generating empty DTB
>  EFI stub: Exiting boot services...
>  EFI stub: DEBUG: DRTM: will launch, selected launch features 0x0
>  [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> 
> Eventually the launch'd kernel is going to require built in crypto
> libraries that match what the FW is using so it can validate some of the
> information left behind during early boot. Refuse to launch if these are
> not built in and build in the most common ones from the ARM64_DRTM
> kconfig.
> 
> One nit, if the platform does not support SMC then using drtm=auto may
> crash on the SMC op. As far as I can tell there is no way to discover SMC
> support through EFI. Learning it from the ACPI FADT is doable and costs
> about 250 lines of code.

Ouch. Sounds like a must have if there is no easier way.

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

One thing inline that confused me.

Otherwise seems fine to me

> diff --git a/drivers/firmware/efi/libstub/arm64-drtm.c b/drivers/firmware/efi/libstub/arm64-drtm.c
> new file mode 100644
> index 00000000000000..2fc58babc3e7cb
> --- /dev/null
> +++ b/drivers/firmware/efi/libstub/arm64-drtm.c
> @@ -0,0 +1,426 @@

> +
> +/* True if SMCCC 1.0 or later is available. */
> +static bool efi_arm64_psci_smccc_compatible(void)
> +{
> +	struct arm_smccc_res res;
> +	s32 status;
> +
> +	arm_smccc_1_1_smc(PSCI_0_2_FN_PSCI_VERSION, &res);

A function that is meant to check for smccc 1.0 is using the
smccc_1_1 namespaced calls?  Maybe add a comment on why that
is ok to do.  Is anyone actually using SMCCC 1.0 on systems like this?

I a bit surprised we don't have a common helper for this -
I guess the version checks are often explicit in a particular
driver being bound.

> +	if ((s32)res.a0 < 0)
> +		return false;
> +
> +	if (PSCI_VERSION_MAJOR(res.a0) < 1)
> +		return false;
> +
> +	arm_smccc_1_1_smc(PSCI_1_0_FN_PSCI_FEATURES, ARM_SMCCC_VERSION_FUNC_ID,
> +			  &res);
> +	status = (s32)res.a0;
> +	if (status == PSCI_RET_NOT_SUPPORTED) {
> +		/*
> +		 * SMCCC_VERSION was introduced by SMCCC 1.1, so firmware that
> +		 * does not advertise that function through PSCI_FEATURES is
> +		 * using the valid SMCCC 1.0 baseline.
> +		 */
> +		return true;
> +	} else if (status < 0) {
> +		return false;
> +	} else {
> +		u32 version;
> +
> +		arm_smccc_1_1_smc(ARM_SMCCC_VERSION_FUNC_ID, &res);
> +		version = res.a0;
> +		if ((version >> 16) != 1 || version < ARM_SMCCC_VERSION_1_1)
> +			return false;
> +	}
> +	return true;
> +}


