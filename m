Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602392;
	b=oW+FRfIUVQMbUikoqr1xMorrXlzTRY3+KEbbNUmsoxe2svy5gAYBK/Nl2brqFASBjGdM
	 E+DHxQUyTxMSvwaFrfC6Dr9ta0cUIuCrHDo/zshxi02ufUy7hjBVJ1Ty8l+FNL7t49eWV
	 6TXZttZqOG+d4BPI2/gQqoffzVAnWf1ldayp5uTA27pwFw69hy8fCQHMQADX6m6a4+Ncf
	 ecOIIWa/Y47SZALQQgZaQS9gqSI5iGX2xzBmMMa5QqidAZEiHZAd50ppDjodX++Oz52H9
	 e6DizLPndH3UoVw1tpsQP6fCRs45wJY15tjfj8sJxaADRaR1fwHgWGdDrYCXRpkCutQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602392;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4KgtddslSOEOaN73E6Xh0kX0j9JGBALLWlHj4vZIcu8=;
	b=Y7efZasxydaozDaJ0xGxIoUrm9I0rB3eCXMTeX5XOBPEvVdDncSuJjHCwlNY4omZKwoD
	 CYkYHBWao81jWEaorEO1MR6XHdcydKhJTwv81LEiKHKvNLzfk9CfUWnwrFDYitzfinNMc
	 WtKluz0OtxlgynBvVmGcV4vgG7vKcZPv3y1gh/BMX2HwsaM/RUSxiS03jENCkIWjaKhDQ
	 EkNT630W1MPVtYOglFLdM+zhGNvr5sJUD2cRk+4HT3QMlr6NDKYaODhzmrqHx6xOxmNoq
	 ugEy+qZh0YQMTOZgYNwvnnhCxMu0gVDz9e0fy3wQY7iIlgYsNMCzIW6UXjm6oRfpiQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OSlcL8cO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0lM1fWI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAAD606A334
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAAD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OSlcL8cO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0lM1fWI
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTuKW1045409
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KgtddslSOEOaN73E6Xh0kX0j9JGBALLWlHj4vZIcu8=; b=OSlcL8cOU5zXbryB
	8fphfV9zo1XreQA4OpWxV/h7tO89Sx+6X2Zl5p6+0ULsUn90taN9eGxYH16jm+qk
	L0XZJ7Dn3v8XGxu9eL4AUwpW89Q08hqaGYjoQLd+s7IfocWo3yT9caDh8KNWlz5H
	s2wvu8IN32qEW3e4b+swbEmyIx4Sb7Bfs53jhsZpFAhMxFVFGH/lhgrGUhOIl9na
	ZHCzsoC6k5dyzggh321+7NzEQC0sx6z0Q589PxqQBdkJCqG9N/vTM/t84N6WLpwZ
	XNzQ4yeKMJxtggMzRJOTsDyC0PwIrehi/AU/krpfAg39mwEvzewP39PNMVc/Bg+a
	pxwNPQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj49wys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:06:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so58100eec.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792602390; x=1793207190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4KgtddslSOEOaN73E6Xh0kX0j9JGBALLWlHj4vZIcu8=;
        b=S0lM1fWIw6Y5hJNpLN3G50Ucns5COX1CrBE5hbyjPvJoSWfaUU74zEBfK5Y9LOfw2o
         3qJuezojUa7Gwuxzpuy/sRiQzyLvOc9/wbbwX7fNFq1fLWNTYoqZf2H0HrpG76BxzJkd
         j4NEOGLlwqNWTzlkJzpYzISQUweCoK4ctrM0+yYr/nhRkxxHwelCf8Yr47GhsPdS/Gh/
         VebX6ND7e/SueIFT8iifQkT50U24TtcvbyCvGuKBnDq3FtCLV80e+kGT9AWueohj3ns1
         ZLNryXgd9nc5t4EbUsKv7TiPfGLjKNrhfFHKWolwtgbwMqQR6ThArwPN1LlmwKKUPgZc
         Ru6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602390; x=1793207190;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KgtddslSOEOaN73E6Xh0kX0j9JGBALLWlHj4vZIcu8=;
        b=20O42htO46wgDrXUs4egGlvbQYjHlqIwVhu4uELluSms7BW18TVDgcstr9kVoM4J/7
         8scst8MY8zoX3eSe9PvOH7SQ6uXfbmk3lJXAAEiWMMjIG/6xnRmasyBAsZuA2Uy+JKeg
         zt0VjTZpu8Ln38Nz1ExPkDlz8da0P5JmfL+u9tCyekeY565I3gkYmOoSM9Icq/yokQKI
         5BjwQiiqgJiOIz2Jxb3sS8Rb/6VQTnsgsVhfPxwumkZxxWbS8ZRbMP2b/BzbTGEKeOz3
         xaPQ9/w++LzZG3XLk5iltD/0b6HYVWcWwE5BDiBrbDxR/1kk+UhDGP24FkJdGt8q6xE9
         KwfQ==
X-Forwarded-Encrypted: i=1; AKwUvByexYz18bxYxfGUTpe6Tqz7GfYkKfq3WIMQyPb73vTTdQkSNgbteu3vprtDVN6Pcq//Ho3rWWVwvnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTAS2jgI0Io1582klBdeJLw49pA3LviPHGhrQb3GsbBEitcHCz
	xAcfVGuvyzfKKIeLWUq4fPQ8i0lho2FWCP5k8MexSRtCl/BaUVrfVCzAtR9EuGzxTxESVsGH8vb
	zHG0WDRUK/PRBl16D7rvfKvm6sI6SR5vhTI0gwueuIePPUAIbOXr+FCI8NL643M0=
X-Gm-Gg: AYBFou1Mtd8oaxWeORItq8+F0Ex2qYnmhK+KTEuPlYMPvbUF38n5qtyElb+AqpU0qWq
	DMPmo3balQBCV7t4WTfC4/GfKsCbFcPlJBYjRDNi6PvcYKV7uL6VafluRzM5hPYT8PHkamHsWwh
	pNn0q2vdUrPtH5jV40tDOLkQ4pJhbq6y53kcaRpf+grDkG2vCh2c8wdtyGx3UXSo/xaDBQOtgkw
	Hp1RpLp2QgjlFYfG23KxTgCWcet5ywkkwkgnw7M1D8J9ubBfQP99suG/tV2SzqP9u49TDccu/bZ
	B0LyCP7HmLHPULctmcmXnOVzKInRSl1rK1P3l0+eTFTZcIct9Hssa0v0aMUyYUolWdhRT9zlfJs
	z3utF8F7QXYj04aiPJYAi7Y8qNXz7EowEVz6phjE5Nw==
X-Received: by 2002:a05:693c:20cf:20b0:363:a45d:10b1 with SMTP id 5a478bee46e88-365fa49061dmr6847163eec.5.1792602390142;
        Wed, 21 Oct 2026 10:06:30 -0700 (PDT)
X-Received: by 2002:a05:693c:20cf:20b0:363:a45d:10b1 with SMTP id 5a478bee46e88-365fa49061dmr6847104eec.5.1792602389510;
        Wed, 21 Oct 2026 10:06:29 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367f52ce166sm5334511eec.29.2026.10.21.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:06:29 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:06:22 -0700
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
Subject: Re: [PATCH v2 08/15] efi/libstub: Have efi_kaslr_relocate_kernel()
 handle extra_size
Message-ID: <20261021100622.00007ae5@oss.qualcomm.com>
In-Reply-To: <8-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<8-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
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
X-Proofpoint-ORIG-GUID: O9dGQ657EvYUvopu8MCcJfosbsC4eWgA
X-Proofpoint-GUID: O9dGQ657EvYUvopu8MCcJfosbsC4eWgA
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8f117 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=z1Vexnt6jiiBlSUV7TIA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2OCBTYWx0ZWRfX1b5BQuYnUDgo
 e1LEYFWZ9TSHRuyekT5NTOiuSyG2y+SY7poBQc87ENYHgggXEyWkX3tHFVbiL/dPezTLyb4cCJl
 M0zjcxjSgVQxXmIO3JbuTSd+f9l4Sd+oa6mYXLcx4ofMFOrqC1ZTZcC9lMtM8ILOD0PImi2ghvq
 0le81d8bs4u1OauT8VjqNdL0OujG3XGJ6C0hTZ6Xv7v+B7LyxcOnd7eixTkgIVPV32yRPcJIdGF
 ZHMGJvXgULVVcCNsyxsMwR0FjLhoGm/eik3+y+jFjdfLu6M3rpKz5c8c1oD6m3/i4hzoPHUfCBj
 Ckg998adCK2RxN/rKReZu2skpQxtMJtzfeqprDAXXNZTz6xR+5NN5Fd1ay+rq8WCrB36KKYa1yA
 uFTc2KoC8AhZDvgyLNcs+egrWo9MzK3ime9fpaXzyo6fZPJar0lJaR7Du8K4RKe6rbLZJjKAF/E
 VQBv07ZrZ00e7XqpgHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2OCBTYWx0ZWRfX70tO3nvw0CU6
 lz8MNpnG+Gqij2IdrOC6rd73H6EUoc6+Al5JwR0d0WLnERutRBwYR94dZ2JH9n3BUCA+592mWwj
 OqQO/DiCV5CYRYX9EB/FwLza4hstMOo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210068

On Fri,  2 Oct 2026 20:31:45 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> There are three possibilities here, each a little different:
> - relocating for kaslr, just request extra_size like the zboot flow does
>   when allocating from EFI
> - in place, attempt to allocate from EFI precisely after Image to
>   confirm nothing weird is there, failing that
> - like any other error with the in place EFI location allocate
>   non-randomly with extra_size included
> 
> Remove the callers' assignments of reserve_size since
> efi_kaslr_relocate_kernel() now does it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
A couple of trivial comments.  Otherwise looks good to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
> index 4bc963e999eb97..e419f3800af517 100644
> --- a/drivers/firmware/efi/libstub/kaslr.c
> +++ b/drivers/firmware/efi/libstub/kaslr.c

> @@ -125,16 +164,29 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
>  	}
>  
>  	if (status != EFI_SUCCESS) {
> -		if (!check_image_region(*image_addr, kernel_memsize)) {
> +		bool image_region_ok =
> +			check_image_region(*image_addr, kernel_memsize);
> +
> +		if (!image_region_ok) {

Why this change?  I don't particularly mind but seems to be churn that isn't
necessarily needed.

>  			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
>  		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
> -			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
> -			/*
> -			 * Just execute from wherever we were loaded by the
> -			 * UEFI PE/COFF loader if the placement is suitable.
> -			 */
> -			*reserve_size = 0;
> -			return EFI_SUCCESS;
> +			   (unsigned long)_end + extra_size < EFI_ALLOC_LIMIT) {
> +			if (!extra_size) {
> +				/*
> +				 * Just execute from wherever we were loaded by
> +				 * the UEFI PE/COFF loader if the placement is
> +				 * suitable.
> +				 */
> +				*reserve_size = 0;
> +				return EFI_SUCCESS;
> +			}
> +
> +			status = allocate_image_tail(*image_addr,
> +						     kernel_memsize, extra_size,
> +						     reserve_addr,
> +						     reserve_size);

I'd move reserve_size up a line to group it with reserve_addr.


> +			if (status == EFI_SUCCESS)
> +				return EFI_SUCCESS;
>  		}
>  
>  		status = efi_allocate_pages_aligned(*reserve_size, reserve_addr,
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 725b634c517919..a88b2d275e5bb0 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -37,7 +37,6 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>  	kernel_codesize = __init_text_end - _start;
>  	kernel_memsize = kernel_size + (_end - _edata);
>  	*image_addr = (unsigned long)_start;
> -	*reserve_size = kernel_memsize;
>  
>  	status = efi_kaslr_relocate_kernel(image_addr,
>  					   reserve_addr, reserve_size,

