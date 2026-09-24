Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46AD274658
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 22:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289764; cv=none; b=BtJ4AAmuJStOPQuE3Z1uEx6vOje0wUM6xq/07HOEzhrx5NNKDhxiGSxoN/Z1QmptZGyVzql711OG8/wT8XwLsik4nJfZHXEd8tCBZas9gDAvwTsT7N68yf9+lABa5R0ptu9RGYKIWStlh4QnvOqbkWbhwHlx2Kqaxv2CRFt4c3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289764; c=relaxed/simple;
	bh=2G1FOvOSJrV6/l8sO+qjbSBFUO9X0CWF5KTVr1JnZkM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ABxUMIjY76NJxwIurmzuGnSp+h7unhgvQ3kBdY16z8b/IqJIyAeeMbsuMcXb4rdE+7B1t8SbDXR5M9gxuLMxLTDo6OJNix0n4wjb1qggHG8rxv0lLV7b84xYO9+CfGh5iGkRFcMfBvMzIEpQ6X8Dw6HRh8LErrk5Z+5gASQ4Ojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eaJiYBco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LISNVNHZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eaJiYBco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LISNVNHZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMP5Zi2970639
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 22:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=; b=eaJiYBcoVJ7qevSl
	dhfq+tXf9Yrht/mLq/jwiRTObIgOPPAp4gq7bt1mDqjTW0V6kXIW+8178jTvvqEY
	/g72Tu5uLFr9TmxDOZ/WTOw4Db3jptMoLUpu03x0RYDq28zhhqtQH8+V6kNLVLAO
	1Ua+MyDrNoK2wgREaJE/EZogzihYwOq1s6HaLVkWSmzeuJh3HKsCfCtwvHP6+Jd8
	ENol9vchyHUhmq3K8SCqt3P2t3zGBv8XLggSyAt3yjEQk8zBoVPz6YK9sKvOoTjx
	qeijDJMaDaBEWWHG3mt12b/Lo717uv1T508Ea2fRW/yjOhQsk+HBOm2Y6914Juvl
	Prcy/g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e1sbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 22:42:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso426125eec.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790289757; x=1790894557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=;
        b=LISNVNHZOretqe6gWASIioEkOL85A7DwJRyC2RPAW7VcmZ981qh7IeLTLfXxILA2KK
         nyWoIb8clQJHhS+Pk4fhS/QO21MuSwb+M6s7SzL/VGdM+0MZk8mYqs89YYHSdCkskRjV
         4scvciuR8BoymBM7GXR30I29IMcb7wU8x2J/VrKp4amoceqLy9QedjYO9X3HhwYjW6Jj
         Luzm4enLgcyu+DUywzkGpLFiLkt7TbyYEp6DyJdJjlSIrRRhoFq6WzkqzyYZEGkSuAJr
         uvvXBRgOXu/+pCIcPm0Om0r4GpPXE5yquka94ZeJusMFi3R7L3zdTo9LvOT43SUSEbb5
         88JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289757; x=1790894557;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81QaywXThCj9GvWcrqbFC8hrrggxf6pFQEEvB0A8Stc=;
        b=vlEam7EE5qr2UPmW7lfGq1Dxrku9gCwwkyAQ/XIPRdYNfj3PfhbU/WpdL5NmTvDvJs
         VjEeYFj+Sgvt797VLModqCkFFsfeMaOVoDrpfZi0WDpWLWTltY51TZsHVMaOVpK07Cpj
         KFhJfd53l6/FJLCRNmgpfZmtmst5dcrFaCUsmZyHp3ZCoxBoNBcXcKK6wSnB69ydCSSO
         laLVDAxhESfoRq7DobweDXh8QeZbx2xqNsxeLTNTLEupuUnxd4Bdg4StGKO4McNNQIM9
         Ff1t1KW7g5sUVxO25cP9SP0VHBTtM9jC6lTzxZRhfPM3M0f8KqQuvdUH7Iz2q70wZDew
         Brcw==
X-Forwarded-Encrypted: i=1; AKwUvBxcampQWOTI9Y/5PUImQaP7qhROWzs3X2b9xVQxLWdukDrmdzxMQTG/o+qGqFgIROwAyc27KXt+Jo0=@vger.kernel.org
X-Gm-Message-State: AFuF++kxMvz87tkhdHOmbxusvOm0yBNug8OTGtHNV8M+vg3J7sycTjh3
	1ipJw69qhNu7oQUVmqfMkvDScRhgq1VSTxJn5Ap/hcbrlBsq9RnGL+MQvA2CRfvb/c7cI8K3LlD
	0hsqSFVXYc3ll2ZNGdo5H71+97hKiZvnjTU4Hl5wvL1q7ZUtHyQzvcbNtuwjRXbQ=
X-Gm-Gg: AYBFou1oKm+37TP+EQ0dcccxWy2hQ6y0+gEt3Ry8k0TfxNLANIuovbUuVu2UeCXkb+P
	WhoEXt6jMkzGkLhbZkJgjIpzGusquUiz4QerXgJchEzlvkH042PwPijurlmIdbp52HRIjaUQVPe
	sTMJ4AQIHEeom5ztitxClgwNy+6v/zeyFWfa9CUFC2IEoDsx5MzY2NghYAYVWExnGDZASwxzj+t
	vXJDK7HoMI+fWdGXF6xqD8xyBEAZOWfiBeimD/UFcBG3OOJFXyV5TZU9r59BL0iC0vsFsSdvMWB
	iD34o+tv2N0ES2+Cui/ZM8Bo6DXwqi7KU+CvcCYWXNs5DKu8QBILAMoNMa183LgkRQcGH2MAcq4
	9/bdS2RHIhEjRY8JWodHW54DqTc4sVNeSz7Lve0HrvfXeS1RgLCD7tw==
X-Received: by 2002:a05:693c:601c:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-341973cf3cfmr120998eec.13.1790289756363;
        Thu, 24 Sep 2026 15:42:36 -0700 (PDT)
X-Received: by 2002:a05:693c:601c:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-341973cf3cfmr120917eec.13.1790289752160;
        Thu, 24 Sep 2026 15:42:32 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm1538764eec.25.2026.09.24.15.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:42:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:42:27 -0700
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
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH 01/16] efi/libstub: Fix error unwind freeing fdt in
 allocate_new_fdt_and_exit_boot()
Message-ID: <20260924154227.00001cbe@oss.qualcomm.com>
In-Reply-To: <1-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<1-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfX3NJD9rAgdtIT
 Tc7bD1W0L7XQhf2YLuTYgnSq0kxstYsca8fYiMaPwryVPpNR2AlvTWrAHCrr6G+ioEeGXdVfr0/
 I2/4rxhWyo2BCc/xlVzdTQpQKEyaj6mFxuaugXbnJbySIB4Nh+qYYddeJHxMd/PIu4Jv3db8n0N
 8bh/q954X6puCMpjuAkeBFZ30W9ZIwrxBLEoF6EYYs6qfqght+jikG+Vszm0h7LZNirAC/Sgf8w
 9UyxIfLaF0Ke0qRpBcDIJKS9NQ4okx++H6+AHO+G0Lc7hjv/bwm4R4da5du2k3gWHoDjSw67jIZ
 +IJd6c9Tx+DfQmpIdO6ZMhV/845K52M9VWI+aGuwsPwtM9jO1ND64cxl7MedCFbDxJLS/t1dXEM
 /4EYC4XpeKv6BNbXMNyDuq75MtxcIxqPosGoGxnBJMVV1cKltqZhAVHj1NzB1fTKCDARtPtVCQu
 owsgEstGjFi6/4wicaA==
X-Proofpoint-GUID: 70oy2MzRLZBYKVgVRvpbt70nsnKZwknS
X-Proofpoint-ORIG-GUID: 70oy2MzRLZBYKVgVRvpbt70nsnKZwknS
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab5a75e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=7U2iMG9xLqzP7ZOKqLsA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfX8LYyJhwoDw7+
 n4xhSdsUulpttj5AOsdB/ujwPot1PCQk8ROQONHYLGaOo1e97osdPx/hE1MP+bTK8CAQ0EBctLY
 JOm/SFLqcdI8BoWtwmm7v904mi/Feh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240092

On Thu, 24 Sep 2026 10:53:04 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko says fdt_addr can point to either an allocated fdt or the fdt from
> get_fdt() which is memory owned by FW.
> 
> Only the allocated fdt should be freed on the error unwind path. Use a
> dedicated variable for the allocation's size so that the free does not get
> confused.
> 
> Fixes: 4fc8e738ff3e ("efi: libstub: remove DT dependency from generic stub")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/firmware/efi/libstub/fdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
> index 23b3543d3041b0..5b2dd709d7b151 100644
> --- a/drivers/firmware/efi/libstub/fdt.c
> +++ b/drivers/firmware/efi/libstub/fdt.c
> @@ -229,6 +229,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  	u32 desc_ver;
>  	efi_status_t status;
>  	struct exit_boot_struct priv;
> +	unsigned long fdt_size_allocated = 0;
>  	unsigned long fdt_addr = 0;
>  	unsigned long fdt_size = 0;
>  
> @@ -257,6 +258,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  			efi_err("Failed to load device tree!\n");
>  			goto fail;
>  		}
> +		fdt_size_allocated = fdt_size;
Hmm. I argued with myself for a while on this.  Which one of fdt_size and fdt_size_allocate
is the appropriate one to pass to the call?  In the end I didn't get a good answer so
oh I guess this is as good as the other way around.

Bug looks real to me and this fixes it I think. Give I know this code very little
take this tag with a pinch of salt.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

>  	}
>  
>  	if (fdt_addr) {
> @@ -334,7 +336,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>  	efi_free(MAX_FDT_SIZE, *new_fdt_addr);
>  
>  fail:
> -	efi_free(fdt_size, fdt_addr);
> +	efi_free(fdt_size_allocated, fdt_addr);
>  	if (!efi_novamap)
>  		efi_bs_call(free_pool, priv.runtime_map);
>  

