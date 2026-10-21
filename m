Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600406;
	b=rK1d8j2HGHNpKegiJqKQsb+B8XeWac6nuyvV0bmea7EoIpPphVBIoc4dviwd6WySICdj
	 hJw852/oNUY1fO0AS3WHMMATxbPaEJyCEP1FdyzSpIAtcidiWdl8XyrqkCaEYiZeE3Flw
	 mw23WxpdgRg2erXB7G0plnEaqRY/kOy1jQM1eY1YXL+tMIeWOsOtmxFI0qyyW4MfJoh5m
	 HT2G4+MZZYLkGH+K2PogVHcwtOcoKjqfP2OvfJkoa2PpCIARGLay7hzsedo/++XHAIsWo
	 GcrGd3R2/xJaFqkSDKokYBut3b1r6aBqOaRlvG23/i/P58wlqTKY6SKnSlCiTXWBfqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5S0gFGL7jUhkinHTL4yVeHOzYpusQ3d8V09xofjMzsw=;
	b=WV0Wi0R8n/P4LEe5qmKCZLbgmQZKLJQ4fG883uNkebyyPFEs0Yf+Mu3WmspuBzu8AkrF
	 KHdyuI7em8vYW4IzOxTjqArGmthmyJ9hVAmUMJINob55AklyDJoGWqL5RyrV8SWp6FQTC
	 XeN/zKKhOENHueERwAQUcZzMHsxQiDaJljb+NP0JLeYxKVVDxIYlQ7CSrpIfq3H8hJEKG
	 ED3vK2EzTy/knVNYqna6/dfRSNbxu5WkzeesWX5aolRAYDl3hsjIL2UWKNBUbA1ZNaAks
	 5Gb6oM74YWbQZAmHva6yCvluLDk/6AsTosDFxzMz1vsOVAq/6LNvLcrlC9uP2aGN2Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GUi+svDU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUmJEvst;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C39606A322
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C39606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GUi+svDU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUmJEvst
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU5rK2102390
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5S0gFGL7jUhkinHTL4yVeHOzYpusQ3d8V09xofjMzsw=; b=GUi+svDU/yyymhsl
	VrHOtB1d73sBGwG7COM52idcWEEDctYMa+eF6Pt4VtlzcUUOeQtAh2n1Vsh/2WQu
	0u2tDuR/jArqfSZjo5WeZDkmKKnq5Cyx8LpPJLaBgJ14HSsFT34pk/oMJnE/QjZP
	wyw5Luv8WVqQT2T3xAGbmx03QPVfE3A+2OotuyjaMF4DqeoByKTYNGCQZF08de+c
	iWVSRHM+0Mr8/oSDoL8AAiVZP7kj7Tx91KaLcsM4HRQSlR0x5UCwgmmD9m+hLCQj
	/j5oJYm/JjLQzfXhoQU6IC244z8l/Pqlkc+kupWm84Z9ZYCfxIBs8ju/HIUwivyK
	DroMWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuhhuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:33:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad436a9d00so924365a91.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792600404; x=1793205204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5S0gFGL7jUhkinHTL4yVeHOzYpusQ3d8V09xofjMzsw=;
        b=NUmJEvstuVXE/tFZM2esXmuv3658YshInDdySPbrRF3yWviKEdk0fOMWFJAkCexFb1
         /zokv5p0CPry3SeWu3Prxvcmv2qZgDT4IK3A2By04GvL6SdhHDW2H2UBzMWbUMVVF9z0
         k53jxv6Qwt/j+0PrPmrxMtlEmqNG9UCMJBM8X9+esboLh6Xs8PRYprzgsS2w67CGcGjS
         oX+f13kUk+taAl/Klgo+b5SDplOcLjj5kOEK6tONmQ+oLIcUrikm30dMmA+Wt1xcPw8I
         AG6LILRXd4RgRW4JLbJN0sddoSipHTJ/bfNJubKWZfcfcfnyUxQCWLuCLb6wYoCJi8R+
         9rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600404; x=1793205204;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5S0gFGL7jUhkinHTL4yVeHOzYpusQ3d8V09xofjMzsw=;
        b=dxJdmZNw0egU5VMqzF51jLXLtdendA/VZw93R/idgq6BdSRAL6e8rUE3c+hL9gsSvo
         Y8QOViYDK0LBqcT3lKVAq4EAzT/LY4oB5t77Nf3i/CPeJ5CP5dAeD0DfCXCq+gRdX9ny
         KkfPnqGes1PI2ojc3Lcam5ShHNH7Sl/cYpfrT1DFtKPevhS48Ed6RTAD3qGFQE2a/DU2
         O4i1/sE3pCWFNuZTnvEU2pyGutjIi+zxfLUtWDcaO1j1O1THx7ZhjAhT1ytvyrkhR40Y
         2AsaWZfCE3KE6gn35SOZVPshBiif5auFctxWYBC4swtnJfkzCgcIXWzC+KhQMSdWFTHY
         rmww==
X-Forwarded-Encrypted: i=1; AKwUvBxQLgV3ZeZgTgQlBlUQ7tFVMU8Z+IyuzTzahKQFm3uuitSK3UvZTF3eFY92vT4p3Y0INpGs7qQEf5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWRUKJdBVYQjAgCTezo0bpRxjBd1Hg4auNupSDLufXz1ITQFQe
	EFUyft5aqkMU6FMvzXveaxJgCToDP/XRacPuJU8MHjl0flICDlWQUt8Mo5x36a1w0qC3e/Vxf+S
	IYSVvBgr46nuY3VjtbqasJDG0/fhzCWOxHw+o4HNzoXJsoBhrDCNhx7/0tMGcBL4=
X-Gm-Gg: AYBFou3w/mZrZHQw5A0iknscwQhzySu3Y3JjkzQs+F8+81ZSnFDXJ6+Nm0762FQxxzZ
	QAbj6AXAAjdcxt0L1XhTkG7/NG8NIr/i/YKzppf2GgYHq4LV3y6Sv9olmty1NjtSwXP9dN7Cgoy
	EfQlCU3gJStx72fS19GEfXpcH1WLFua3WNtpCN1JkmonoEkyhIcxA2nKA+PUGTfK71PBjwobDdm
	InL7BNIT2aLvRK/0VldA2AFkt5q6rqeYz4tPVxjxpepQlJ623fgC3SoRE5CiaBZWLTA7NaBw0Gb
	+M+cajH3Xj+ktNy1GfSjbbMP9UnZ8ccwJDQtEE2XMD4nVKPAF9DLMtsd68M6Vg+D/DYR3rInM4c
	KRNmRFJY2GQi/pLZUrN0+JMkEoviax6ByqodznBKVCQ==
X-Received: by 2002:a17:90b:5688:b0:3ac:b185:fa16 with SMTP id 98e67ed59e1d1-3ad86ef57d3mr2257163a91.43.1792600403606;
        Wed, 21 Oct 2026 09:33:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5688:b0:3ac:b185:fa16 with SMTP id 98e67ed59e1d1-3ad86ef57d3mr2257139a91.43.1792600403107;
        Wed, 21 Oct 2026 09:33:23 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea4005a7c1sm11891595ad.71.2026.10.21.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:33:22 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:33:16 -0700
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
Subject: Re: [PATCH v2 06/15] efi/zboot: Lift efi_cache_sync_image() from
 efi_zboot_decompress()
Message-ID: <20261021093316.0000594b@oss.qualcomm.com>
In-Reply-To: <6-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<6-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
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
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8e954 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=w7afb6Jpyl5axNu8_tQA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX62U9Y54BHgYC
 guCsiW20hDNxsYs7e6q3IKJ0Zrv3EmsRWnFBP6VRwsLTr+xNlsFbDbXDzieE60rjG7SnieppKtJ
 ywDT8jrBI+QO8gllnqJ+QyJmdQGWKpE=
X-Proofpoint-GUID: VbvV_1-ZbIOaWsBaljDIWgenRjdCANCX
X-Proofpoint-ORIG-GUID: VbvV_1-ZbIOaWsBaljDIWgenRjdCANCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX44eMcsv4W+Oi
 tli4rUljOC47IeCvcS77GL4Kq8wiVX/PekWE0HxlFXGdcQ/RrAgC6WyoHRVxPBjmfypAzN3az0H
 vAAEyaodkhyxhTWIZKLvbo3P7t0UMhkpsgdvkkq0BGwOKCWUAaB47HRGk6NuQc64+P//N7w5daF
 uP06iHddrs+N/KMPWYrkf4wkB36y04mCVPe+2YY28hb5wSWDQeolfLcGIIZe0qSabguwO2g3+ef
 kIviBST/IW0XtL3L2jjk2XBBYdVKWp5T7ggBx7WETxveOiQcA/FrJZzINhKrerd7i1x5ldmLoP9
 9Xexlv+N5+LRuPvRji5QYLm/otbYjaUySOO0CJFdgui709XczwAxHMPDPmXS1QyQlx36Evxv29u
 kJwErmLLJUkvsllBvOK54qW6ejjKIzyAW124Tb85yCK/bJTRaLvn+CR1p/QJv5VsndjP2xFcnob
 Tclxupv04QU+frcQGWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065

On Fri,  2 Oct 2026 20:31:43 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The two decompressors duplicate this call and the next patch needs to
> change the argument. Hoist it up to remove the duplication.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Some mutterings below, but I couldn't come up with a better code
style, so

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
> index 4b76f74c56dae0..e3abaa05fc4183 100644
> --- a/drivers/firmware/efi/libstub/zboot.c
> +++ b/drivers/firmware/efi/libstub/zboot.c
> @@ -92,9 +92,11 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
>  	}
>  
>  	// Decompress the payload into the newly allocated buffer
> -	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
> -	         efi_stub_common(handle, image, image_base, cmdline_ptr);
> -
> +	status = efi_zboot_decompress((void *)image_base, alloc_size);
> +	if (status == EFI_SUCCESS) {
> +		efi_cache_sync_image(image_base, alloc_size);
> +		status = efi_stub_common(handle, image, image_base, cmdline_ptr);

A little ugly though less so than original code with that implicit assumption
of EFI_SUCCCESS == 0 that is avoided in most the rest of this code.
__free magic would be complex given the need to provide the size and hence
we are down to a helper.  Ok. Maybe just not worth the effort given how small
the code is.

> +	}
>  	efi_free(alloc_size, image_base);
>  	return status;
>  }

