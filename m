Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598431;
	b=S6kncliCAityRULtALBq/V3G125ZB7tN2Nc9CGhfqg8IlQaJrQrX85cCOOGxMCLlYdD4
	 //cc9BamGuyEwWaN4h6anNYgk84/2kK2xl0GcpLkrEqTbaGe4W6XNInp4pclIpTR3kmX8
	 TQDL8YQHUbYcrXROZ7jz972LJpU9155GtmDLDtyKPrjydETLKHLAii1yPbylPxx7BTIAC
	 Cef7Y5KH6RE2Mb62sS5mlxTf2tjjFto28RgqVxp7oP/BGS/sasMslJFMHY1fLFDHP8MBv
	 VcMEZp3BPiplotrFcAgGJ2zYiBrp0iS/h+trflcdHL6+8rACQZ1g6h6mibaN0qqtR+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZCSVqnmCg2tgiS2qJzUGfrVmwaXnekD3uvjwV9akWpI=;
	b=mMyNCVaxl9lqS6lVEJ7Muyb0TRXUYFEi1IDd+L+LWLGWqB6AZZHU6AmQO8IscRfoNl/7
	 BARuKcxyEfbEzChzygl5IVtdrQRH0jZFlozEaLj1e3FX6hfhJqZLc4HPtdvhfwbJyfnzs
	 eLXKRDK7CT3XXsYucE+YQLQaMzgDFG1f/gRh9KgkfGsRpZxn3zsePRZFl25IQwYohFyiA
	 PY6vKM7xPNcYQYQylCWNzCat25b834Co2PTvYIW5Ku6a6qT4rlD4yU+SygaSjJgyn7EA3
	 WLSN0351ue7lJQhwtC23do4G7CiHLn+WCrUIPb2lyEHGbO1rC6IgkbonfncKQnklUvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwgbev1Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q2tlbF2T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8605606A31E
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8605606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwgbev1Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q2tlbF2T
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU0uQ824396
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCSVqnmCg2tgiS2qJzUGfrVmwaXnekD3uvjwV9akWpI=; b=fwgbev1Y755yo0Wk
	UtrQff0d+SDedqVBkyUwA25GdbsQr1gedtRARzdBI/EmAOe0XsQToYsDxG3dcNo7
	WzxSgYac/ZGOsmY8agUmPRwldZjLtqwf49ThqvX1StCK7jmI7HXPKz+sOHF/9RsX
	d2pytN0NJDGCo1MhMPxlfFPfca6UKvw74dPxLEl0uCzKdYPb+HZyLX3GECv4+38B
	1RGJ0zWdQGHzDf3e0b63brnwjxFoTAwfwuugTBfdk1u7TM1ZeuovSwyIH11w2+ZW
	SdnPxbpBiqOcHpBXKX9x9UDSHSBDxYFiyv72OFxlygXqyI/101YubsytU9S9Gndm
	8d/hEg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4ujh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:00:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3580c07911eso2444044eec.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598428; x=1793203228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZCSVqnmCg2tgiS2qJzUGfrVmwaXnekD3uvjwV9akWpI=;
        b=Q2tlbF2TrLWZ8WCd1iDkCT/5A7bIP778/bGJSMgFeMYPGy1HjZ0EiwgkRZ1lhWOCGO
         VKn8WZMhwAZZohJhk9LvzbzgTV8gA5UC1PE7uwZR0SuRwoutQY1q3lkEMGBv3fuAMK0Y
         IlQlYeWPVxpZ4Gdw727J4mm3WcZZzNMD9S52o8D9UCyyDRYoAJEWLnmIUfmV2AqfRaHB
         SUOcZ7492XJRWTccR/T6+Hfj0BD4/XPZwkhu8Mv+Ok7z6/ydar+z2JxOJpPnPm1Debuc
         rfHf+Ua+vqbqkEHGDbCLNjrMtVty+4CROjLoZsEXNVbWRYk4jUd3utyStnHcMwc2DjaE
         FXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598428; x=1793203228;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCSVqnmCg2tgiS2qJzUGfrVmwaXnekD3uvjwV9akWpI=;
        b=cTdoYQSpJJV6ylPmf7XAq8s30Z6dHom3VmU92F2/asPSndss1PTqxLQjw6Szw/JOi5
         sejKdhCVhKlj2rGHz57bXaADkl5RHR9jGarGF3nWaKN61V/YfBUzHUcE05zWWha3pAlP
         PCGQF8bJu0NY/2/UcBkgFeIhFeGVcKniIxt6bv1cbaBIRJESMCgOddJ1T/OBwBgNHoOZ
         9/opMz5Ry3Lm12iLsqqC8Z1Az56S1eWfo4brTVkZmMR5K1TknKFCtDRWvhrxmSGVz+qU
         kkL5F8xNGdAz9J9MuaYAZ0hfoBRUm9NfPQ4F/ldqiWQN3WW4KMc8j7q2WIVIrNGYFzev
         YKwA==
X-Forwarded-Encrypted: i=1; AKwUvBx1nY1xgYglTYFFiGETugyb+CujhpZCUmreIvq8ykHQ4VJysLZ8zFdhAOCDEX90wJ+MR/6u/b4ZeGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRCwMBdW5DJV5x3l2ufVw+tBlyYiXglwo4nkVM3a5Fa4Bvi59B
	Oxtrw2MI6I9r+IryBw5KPDypLOAIPT+3awHFR+tR44l0sVMKAhN5cYdP6HVepalxZuWSTDLzKlj
	8mQyCyxFoqWfOvHwUHKuN0tdh9yd/hvZeCJLIB0ia4vdKgTCimGUN3yT7ZdMYphY=
X-Gm-Gg: AYBFou1GAW9knSeBo6uWt0nnSDOhVIJQ5nhHAOIaw3LzyKj4alFxrDny/FbMtsRpmqR
	/vL0FduE9/xGIBI9qKMyJsCJIzu6S0yYhNXnOZqLJbJ2OOR1G1WMw8pmphHOqKxi1k9CYqlYHC1
	2Snqh932GlYu2QzD0IcFu9alzRiee7Tm7MFS4s1MMgHVL+rIRjBsMzd/ThagH2rw8tae511HysW
	X+8bxRL6r1RnuMmBpQ8HuajykUYrzzqincLTCMW8p96e4yicJPTQDHTVi5JFMM3JOIW8BTYx/HM
	vhd+NuuBK4WVjH1HZ/bK0vNxgMHqDFaCaUXAhgq7mvTfCwQrwZNvvYRiP1LZIUX94aIo1It/Y/a
	WcuX2bMlfXvn/ZTLRk8BN30kdj6c+KOLx/ILS5rJUWQ==
X-Received: by 2002:a05:7300:106:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-3674ef292b9mr4299683eec.21.1792598427220;
        Wed, 21 Oct 2026 09:00:27 -0700 (PDT)
X-Received: by 2002:a05:7300:106:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-3674ef292b9mr4299533eec.21.1792598425455;
        Wed, 21 Oct 2026 09:00:25 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm10188327eec.5.2026.10.21.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:00:24 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:00:19 -0700
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
Subject: Re: [PATCH v2 02/15] efi/riscv: libstub: Don't set image_size in
 handle_kernel_image()
Message-ID: <20261021090019.000060c4@oss.qualcomm.com>
In-Reply-To: <2-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<2-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX+UZOAVAtYHvu
 6OgxH3tmKxNNVu1TvqCeMUYK5rFzKr9cAP/ys0rMueNL8SavZAlWVFFV6SmoFFt7Tmm/gBUpi3D
 Bdktru2dewPb7rKvI2Fw5bTJKnP+mrs=
X-Proofpoint-ORIG-GUID: TCjmSWBk_9lqXQKYPCGiURXNhSTzCxW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX1eBndYEOeMUy
 /8uWRFJgjG3WRHQPFCd+C0mnung2qirn9gHGy8x9y4vXUi4XlTASFpxSQWCdG0hCglKKjsAg2AA
 gc6GWgDkhJGI5YwDya5FCiL5pswgsJFgmGyrWug1cfA4gWXEdjcYKZGXU5ovbs++mJG7cLhrlpq
 ZpBwXkczpRN4xrnN2SQlKjkOC7vHYQNeG0OyihrV+6ZYo/rdD05B+6asRM0jLbdl82rJQY4YzWD
 jDPYyLO6HXJxiM+BHVq3VjRDfWLVRhf1smJ6R/w8hwMoPtjSXlNQpMNAzhnPboI/L5SFN11SbaI
 N4C85hboodHB71PV8DwBbnbqS9mr6EIeuXFOqzH6bqnvPvbxcVNKp09eLb9PzDqQe28LAmeXAQB
 2jTzRYYnrybfftao9GhBGgaE7otRjaaqRbYEPlP90Sjq0XXrFsF2VLy8WAMU9n/X/AhhT2YxTN2
 6UPijDwnzEnkgm0AouA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8e19d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ikd4Dj_1AAAA:8 a=xbFV6RGmdEKkzbgyJ_QA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: TCjmSWBk_9lqXQKYPCGiURXNhSTzCxW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063

On Fri,  2 Oct 2026 20:31:39 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko points out the image_size should only be set if image_addr was
> reassigned to some allocated memory. If image_size is not zero then the
> caller will free the image_addr pointer.
> 
> efi_kaslr_relocate_kernel() never works like that, if it changes
> image_addr to allocated memory the free is done through reserve_size.
> 
> Fixes: b7ac4b8ee73d ("riscv: libstub: Implement KASLR by using generic functions")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Hi Jason,

This made me curious on the differences across architectures...
Looks like there is perhaps some room to make them look more similar at least!
One small step below.

> ---
>  drivers/firmware/efi/libstub/riscv-stub.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index e7d9204baee312..725b634c517919 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -37,17 +37,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>  	kernel_codesize = __init_text_end - _start;
>  	kernel_memsize = kernel_size + (_end - _edata);
>  	*image_addr = (unsigned long)_start;
> -	*image_size = kernel_memsize;
> -	*reserve_size = *image_size;
> +	*reserve_size = kernel_memsize;
>  
>  	status = efi_kaslr_relocate_kernel(image_addr,
>  					   reserve_addr, reserve_size,
>  					   kernel_size, kernel_codesize, kernel_memsize,
>  					   efi_kaslr_get_phys_seed(image_handle));
> -	if (status != EFI_SUCCESS) {
> +	if (status != EFI_SUCCESS)
>  		efi_err("Failed to relocate kernel\n");

This print is replicated at the caller, so can drop this as well I think.

> -		*image_size = 0;
> -	}
>  
>  	return status;
>  }

