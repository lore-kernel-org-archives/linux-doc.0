Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3E44E04A
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 22:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290402; cv=none; b=oYL3/sB2+SO/z5VZ8GW8eWnlPmBsB3TXJkMaiCTrAfyFWjMU3yBjmrBbUUSAagmOmp/jfaPuScDF6CALJH+XD+XiByRYn/f67O5NjqHXhqvwvCdHSGicVmzN1wQ8wijsU7qg72HvzTCaGdGUgvSU1uXhkzawNgxb296583V2feM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290402; c=relaxed/simple;
	bh=kqsES4KHoZs1msV6+8Gynms+M5zjnX0qZVcy11wRno0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oUB0qhWtgk+lu/YDvT5CtqrM+MkD4c0v44cZ83HzO0xd4L2FfeTv5FgLjeQ3NFLhUmRcDZOm1pBmOkCC/C/DRO4mLJ5ZKoUa+4fYK2Uxrk7byPK4hngUERbQ7+4aRShgR+IzhTm3KHOFY/t2hD+RzjVcSIDjn6uRyP+gyV0s+QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezYnMi7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1jrUf2v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezYnMi7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1jrUf2v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMPYHj3467842
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 22:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=; b=ezYnMi7mMpeuODcw
	+WiLkeryjucsr3GUsliA6Q/qo9TCIvd1SSF+jrBzrQsbydlvqplcNShv16zQgQxI
	MZGRtlLbh1SH7v/AkrkJ4rsQTrubeuk55FyS3UYZA3e7Vb0jZYtOfaHJsc0CxZih
	etk7fMNAWWFGjHVbtpCZkh0C3smj0TUga8KPoHo0DhbMcC5s48nWQxTTlwwPM23X
	QjeAe/CIUE+1ffljI8bI50OGKNhfgBFjYbh7Tg1yB5i7NO5Vh63G1a/eoj//OtUr
	RfEUshvbHxlSjE1ljTH7HJPpxS/ad+gFcAm607wb7wN25GasXfj7gfZwpl42yLDA
	g5fLXw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4652bg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 22:53:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so442776eec.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 15:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790290395; x=1790895195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=;
        b=Y1jrUf2vZvd5keNzPFLcCbznpPy1iHyfiXVMz36wAAHIU2ajVC0lyws8M94idv9DdW
         /91swzMTNSC4G1bmslHfR3n4iVpSVggZv8c7ZqJ4k16ESoy35XGQaz2LRmFgmJgFRhaC
         0ChJIqufS5GAGzmTafB4tjajm4x4MnfTQel8+5wpcrUFFSGQya4Dt9KRlgPqqHX0bU86
         fSSSW6Ae8NKn62/E7E9+LXV+W2kx1SDyUbTfmfqqj7+7mMJDex7QqNMxwsneS2ZuAGrc
         nP5+Kzg3po8NuEekz5lLySe/X/QCR/Dgy0D5Y9YfR7IQTPlvncOSQDQlI2gncHY5mtUq
         e/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290395; x=1790895195;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26IKywfxXF+ovz3cISEJ2vKRNs4eRXW7AlvCnEjLpWg=;
        b=KYvIlx0KHoT9IYVGkyti65caOGNAPzZTDjGp2+bvWQVsg8jQ9YrU2qdsRy++lMiDE1
         uzcWYBVp3H2CVtZeR654n/09wCvp9qSi9F8RD2/HAz0I2SHjxt6Jejq+v/h3Aj3qdSD0
         2r+OpECjB0Dwh7F58Gz4J6PlBQ3b20DTQW6W9QJEkt+ya65MYEaWY8YJwyRs05k3PTea
         V9uJNuOWWQQhc3ONn43wiM4Nffzu/KFfOkuPbOmzOGRnEXcnCXsW3YvuhbPEVc2FBHmJ
         xyL883khJe0VjzpSh9VHZs2N1QcF2eu61M6q/+CD//0nYp0Lh0hJcp5YXGkz9uf/8vzN
         Gbcw==
X-Forwarded-Encrypted: i=1; AKwUvBwuKGT8HGujBybPG6Tt8L+GttVQ3WvxFqTTJwoNXIWL/XQxoCBeimH95wvHb3YLn0kamMEh56kQvzA=@vger.kernel.org
X-Gm-Message-State: AFuF++k0sufb8Y+gapHdf670gnmdEAJJIXcZ+bh0f21qXty6DFyIeYNR
	c/OyVQ0FIODpqU0hO51/YkvxClJCR1muBSpaawwf3M3BDNHJdildcQdoAa5bBVkqxhTaEXYtCKi
	/lf0lzMozNSPBdchrW3BOmuPsgJDUbJwNroFgG3V1Jfh+Gcij9ROhy8rwNozG4CA=
X-Gm-Gg: AYBFou2XfdWRhkKHpzjWamPnC6PKrMsP5dWa82xyce7KwddgVqwmvyGFVY1Cvq8ORFQ
	a5geICXfICqCc7IoLFx/CE+0PDgmR2C8Z6O5STiHXf+ZYXDf/njSjKubGfUfT0SC0z5DpDBwLIB
	LgMG5lUiU4j/ozEOxrZtwh0OXi6OWBV+j9S3iVNUutZG+sx++anOt+EuXmzOGWHVdCRGfVSWUIJ
	PVsaQTm8IMbNPIYy5dHqYzqM8C5ZPa6E6/aMIksV9gX+eGpapuZWzZkl40+8S9ckyKycwsxLtC3
	8Vsluj1DtULzJLTatqqBI/hw/wwT1UVm4kACagLeLv6PM3VwRstHu5jzm3VpjXLBvjkOJmonjoP
	V+LtGRjHrAfc1zRkIfAyt4FRTEXpESEn1SmdPIOYjjmp/aGUfq+rxiQ==
X-Received: by 2002:a05:701b:204f:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-14503f966ecmr3398060c88.20.1790290393263;
        Thu, 24 Sep 2026 15:53:13 -0700 (PDT)
X-Received: by 2002:a05:701b:204f:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-14503f966ecmr3398015c88.20.1790290392489;
        Thu, 24 Sep 2026 15:53:12 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm1524306c88.12.2026.09.24.15.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:53:12 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:53:07 -0700
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
        patches@lists.linux.dev, Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH 04/16] vmlinux.lds: Move DATA_LE32() from arm64 to the
 common linker script
Message-ID: <20260924155307.00007dfc@oss.qualcomm.com>
In-Reply-To: <4-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<4-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab5a9db cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=Qd5iYfxjV735tpeAhwAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 9lSj_iy6_R4oKva0xKm3iY2S2LRtOyoB
X-Proofpoint-GUID: 9lSj_iy6_R4oKva0xKm3iY2S2LRtOyoB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX5A0U85H/jQ8i
 pnfGYzT9QRpkIBEwhQv5aIgahBGzocEnFZPilxh0c4g7PiJaUfs3hK9G+T1mSYAfO9az040GRrY
 Ev5YEE64CvjkHeA5jsELy7tUSVwmBU/hc1e/TeKfoIMfc/7JEECtHZQ6qLdCzBMLSR/dLRYGpOX
 fxBYyrxl8vDOpEW8HspPHVtK16GyBuubYObefOEpT5NFRtHStvaeBQLnphPjm5YG7kwX0Nx5FcV
 kgRfrD37Eb4sdtZAIOfLhrWoCjJX9e5ckBsJSMnRuwo+qSyKMA1E0zsz9EVStgOYXlI2/r6q/6i
 CrbtfX8Az3n50xGk5cxZcxyh4TCTDTBf/+z3gDTNwNELb9YeQGDphvqOruBBsko7gu+1yrgpAYd
 ktgTwtTruwFBygZYEFfHFJvhefyLv4G3haGWE7tjYVSb4Apdik1kwz2mfIhhwKR/xNWy7DdWdag
 RJedmPzZcwWoapKR99g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX2iK7eewXkcY8
 MXwSpB1P5zXk3q+/NvzMg6Kz0d3F81HOVDWFc31y4MAECHHenVHnKlj+T6p1F8/gTmGsyIbedib
 cxqwlf247jgvEd6/NTLrJBs7OvT+MMU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240093

On Thu, 24 Sep 2026 10:53:07 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Other arches may want to use this to get consistent fixed endian output.

You will have to grab it quickly!
https://lore.kernel.org/all/20260918145217.1669-10-will@kernel.org/#Z31arch:arm64:kernel:image.h
drops that definition as part of ripping out arm64 big endian support.

+CC Will for awareness.

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm64/kernel/image.h         | 14 --------------
>  include/asm-generic/vmlinux.lds.h | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
> index 7bc3ba89790191..1bff6b061b6cab 100644
> --- a/arch/arm64/kernel/image.h
> +++ b/arch/arm64/kernel/image.h
> @@ -14,26 +14,12 @@
>  #include <asm/image.h>
>  
>  /*
> - * There aren't any ELF relocations we can use to endian-swap values known only
> - * at link time (e.g. the subtraction of two symbol addresses), so we must get
> - * the linker to endian-swap certain values before emitting them.
> - *
>   * Note that, in order for this to work when building the ELF64 PIE executable
>   * (for KASLR), these values should not be referenced via R_AARCH64_ABS64
>   * relocations, since these are fixed up at runtime rather than at build time
>   * when PIE is in effect. So we need to split them up in 32-bit high and low
>   * words.
>   */
> -#ifdef CONFIG_CPU_BIG_ENDIAN
> -#define DATA_LE32(data)				\
> -	((((data) & 0x000000ff) << 24) |	\
> -	 (((data) & 0x0000ff00) << 8)  |	\
> -	 (((data) & 0x00ff0000) >> 8)  |	\
> -	 (((data) & 0xff000000) >> 24))
> -#else
> -#define DATA_LE32(data) ((data) & 0xffffffff)
> -#endif
> -
>  #define DEFINE_IMAGE_LE64(sym, data)				\
>  	sym##_lo32 = DATA_LE32((data) & 0xffffffff);		\
>  	sym##_hi32 = DATA_LE32((data) >> 32)
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index b2988aa12f6645..1786a8e4323b9f 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -56,6 +56,21 @@
>  #define LOAD_OFFSET 0
>  #endif
>  
> +/*
> + * There aren't any ELF relocations we can use to endian-swap values known only
> + * at link time (e.g. the subtraction of two symbol addresses), so we must get
> + * the linker to endian-swap certain values before emitting them.
> + */
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +#define DATA_LE32(data)				\
> +	((((data) & 0x000000ff) << 24) |	\
> +	 (((data) & 0x0000ff00) << 8)  |	\
> +	 (((data) & 0x00ff0000) >> 8)  |	\
> +	 (((data) & 0xff000000) >> 24))
> +#else
> +#define DATA_LE32(data) ((data) & 0xffffffff)
> +#endif
> +
>  /*
>   * Only some architectures want to have the .notes segment visible in
>   * a separate PT_NOTE ELF Program Header. When this happens, it needs

