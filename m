Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598917;
	b=yaCL1y1qNOjnsgPnXb4/+zv3o3qdhz9/QrTE8WsN15/aCis2XW8U92kSXxpS07bc/NeX
	 LBmchkT4jsqtHPV1JUyAv6q9Yg2jfbeSB+CCwWpyt2lOkq2W3anIMoZ73wvRfjup5Rv2F
	 aWI2lgQqoiDEqqoG/aMftFz+fAHrrXkgMH3ofgQdVjX5UcQeXAmdI+OakFdHiGikJCL8s
	 wuanrtZi6uYUZ1lY5RPr7eMP7fUbHw+ynRZS2WgBmzZHlX/gS0chuesqcHUMRYMQulPeB
	 kjdw4Wpz6x4qQNHacppHuWzXCKnPBxvlBjtW48QuZ4jKuyoXhS4LcRl0+XthDyewkcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xpcFx5Tgg5MtNBAEwITPf99dESr1dNj5mhlvVGEZ9HE=;
	b=43S6Z5RUMkqiVsDBNUECbA3GeIbDeTgEERhC290XTYYfaJKAA+YIgsucXKOgN9vyBerK
	 rnmc1ulQMmjZ+Aayb21CXtu/dfwD6dic/WVFB0uuCgiF0wOtFMcF2agWh6BitOXf3ItPl
	 fLnHMjrhNIoV5qtFYNOjX07BkmmsMGZMo2vr6Ce20fKkBAlnhkzunR1OFd+NEp9l/mXVk
	 Z37tgV/XeydMgKvU9/RFsXkCXMSc6VyNgHOnBNBvvETSIoWCwPTWgjGG4+v7O3NXOW0Km
	 BH6q5+MnwghMRhR6xeCT6r2pm7r5boLOhNr2XUbrg/P+rMDuNwlB90Eu43Gb0RV1jXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppsqazaf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlgG2yKd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE10606A31B
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE10606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppsqazaf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlgG2yKd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTw0d991790
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpcFx5Tgg5MtNBAEwITPf99dESr1dNj5mhlvVGEZ9HE=; b=ppsqazaf3z/Ovnn1
	SzWOwFC6FBH4fWPIj1FFpw1+MfbxoKTpq3L+dL3Z+e3w7356YZ6RysSOxUSlT+jE
	QJ63VeLe4fC9YoZU8/wWjZGfXODKSBwllcZGiYbUnENdNs5V4JoZtOO0xT0uHd/I
	xWphiIy5SHHmhNox7zwzrK2Vqs+UWLy3gU0nXuyduCWSyhwAtJrrWHEuN+VRgTMm
	hlzoca2KU2LPeFWWVXhGFOSPOe97rBtnG8yGmM71Gq6BNVbN2C1Iwmwrje5lGBva
	VCVasiUkD3EzsCgdmldMxwRAjdIFHG23zVG5vKxeMRaRrlso7XF2npL2q3GBF2Sc
	GdYlJQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3xmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:08:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so677638b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598915; x=1793203715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xpcFx5Tgg5MtNBAEwITPf99dESr1dNj5mhlvVGEZ9HE=;
        b=AlgG2yKd9rezGDoVAK8tHC1EbYhTk2vdFncR/cM32rw1R4Kg3pGEJ0vzzMUUx7am2N
         86uFG8yz6c1dkLP+e0mlLOW74Aii11LwnHh6fizV8MJzmvSB9foYSYt7B6+SfKXOmlOU
         Y6Cd4lU5EU+M/yf9x4qe2bkTw4WDOkMAUJHSr6XLAbH8+Y8BH17FStqqZhf/2q8FscJw
         cB+wBWGPasCxLlurN9xiTMFpKGvWaFBONYji6K3D+LV/lFZp1gWdKI7v38J83C01YMr0
         gyz0RChxfsYPVwnpEgXAWOU5LDy9m3J/wYoFEU1tDek9N9ZCBN27nPim2GM+ANVs7qIi
         W2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598915; x=1793203715;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpcFx5Tgg5MtNBAEwITPf99dESr1dNj5mhlvVGEZ9HE=;
        b=2fCwmwBLKY8ylrqeL5S/3pKDkFu6Gr2TvdZFztvRQ/OdxQA292xXlwWdDJq/1O/Noz
         XeB99XjPErMXZhOyNIu+tjVYlK1NGqso1HeJktWFl/bsvKTpzEE3Ik8lrS9SOJNpgzvq
         1WMbWrfMEVkfs0t89aciO0iTQ6GWL5e27QuSOv3J++71Sy6qSH62aKBawNA6OT8nLrG8
         kIVfsJH0g8ASmEEEM3CgJWmemGPyvEm6QjuAgFmraXk0AQ4kjPqiOUaJeKNiGqVQK1MW
         bM9PpNYZ/6zsKM5xj7HeNthzG1pCZaSD5O0B9RjFshCe4+xl25urEyPM2hbZ0NwacyHT
         9Bdw==
X-Forwarded-Encrypted: i=1; AKwUvBytyafLc/vGDH+tZdsiwKXK6nvO0GG41RZFEy1/W8jo/GpvG5LBz+Mh/45Eet7/gEJ0i7gWMCErpJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwzRN+4CnL7FbByTy55MCU7H5OCxnamZtvZILjrQU5N+NYXGCa
	lFlHmcPH28jXep+rle6ZQmvextX9lqCf69bNfnMmDGwgJvQ0xkf5Zsh14uwbSw2xxvcG7gccL/1
	ADZMExVg1jgW6S9+gC093f0ptCl98NdJ/GHDTj/Og3vNudhYSEwUnEhBFmJACmps=
X-Gm-Gg: AYBFou2QvRd2qFSRbag7hLLXk3At8JZRPpPpGA6rz5wJzLVcOQRPdz4xrpoq1T9qIQ7
	8sgJ0R0hU032P4z3ujFdGIq7uggEBq1OE9paI5pR6S6zDKmrJDCUm6Kjfwjf6uCZ+OtcZMYg2Ii
	h0VxvPuWLLabeQVBACnbew1fN2OQNcLBf8A6hR9WpsAee4xXJ2sbiHxkhAsrqVJ/Qe0nGB5z6LG
	TupfK77MZKCXYK2HyiKGQVAnkLZG3kA7jvGkOnA3qHpaWSPMBsdlL8dp+4nDBDZHDPIyoRzsJGw
	t+ym4fqvQ9yjLq2pM+SBDTVoAyqlRidpeLfkuRMu+qAVmLY+9CB8THwV2t4nCyKiTUFyk05xQ9R
	i+wmpV9DK0BW/KNpbloTPMv/vAXimR29NaTlmvkvdRA==
X-Received: by 2002:a05:6a21:3288:b0:3e2:2b76:bf23 with SMTP id adf61e73a8af0-3e287eda189mr2084238637.68.1792598914716;
        Wed, 21 Oct 2026 09:08:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:3288:b0:3e2:2b76:bf23 with SMTP id adf61e73a8af0-3e287eda189mr2084221637.68.1792598914240;
        Wed, 21 Oct 2026 09:08:34 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b861c7dfsm188964a12.25.2026.10.21.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:08:33 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:08:27 -0700
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
Subject: Re: [PATCH v2 03/15] efi/libstub: Free cmdline_ptr in efi_pe_entry
Message-ID: <20261021090827.000078b8@oss.qualcomm.com>
In-Reply-To: <3-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<3-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
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
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8e383 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=gCM90IwNaqpJe8xd-nwA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: nSmi2SypQRZhtuTsv_bLiTWUWYrZJ7Wi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX4HhTmvrlBgu6
 RQv+Te9net9CZ+gygzzTNgQWGZEj91W0STiV4zsnWd2a05Cge2Hr9rhzvIpYTxEu1XXt9+NH0Ae
 WXkjDsFyv8Xmj9dHHyMZh0VhYRL7QilSjCOXJfMihVN6G1Pu58NSgv4jczi/g+jVlzKGg8XLni0
 /MOOznZHRGUzJ+v6vH0rxbYB3XDjGVydvbSey8Sk0ipDu/hNXULhnt3XgnKd412HPeH7jOEMNOL
 IAFKYfzI+eOQqJepC1sRr8CICsKtFCBuZhI6mj9OItSqqH0PH/sftgsuJnLGA3kJlbEixXBP1x2
 xqmo1J98du5dWI79ySQd8gOhYlVQnvKSHDmgHLshBGADvAe9qW/18Ld+GwGG+Sms6dm0RBNDwP+
 2Kh0vrDr6Bf7buINmlgU40vDmQCybU+8kspFdAdNgzGW3be2uyYXyQKaB4zbCzZqqKHJGc6x/rd
 uthHGLLeoo411Rq+Jag==
X-Proofpoint-GUID: nSmi2SypQRZhtuTsv_bLiTWUWYrZJ7Wi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX1EBv7hOR2ENX
 ZzKRWP1+pGVDRjehT3LPrRlWvuF9SnBnsECgiJrF/p19PGdNDuFRwc6xJB65eX+rh9pYILjtIey
 5tvt/Pao/LtxxCBPDabTP0WhOeNF2J0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064

On Fri,  2 Oct 2026 20:31:40 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko points out that efi_handle_cmdline() allocates this memory and
> hands it over to the caller. If efi_pe_entry() ever returns it should be
> freed. Add a __free annotation.
> 
> Fixes: 42c8ea3dca09 ("efi: libstub: Factor out EFI stub entrypoint into separate file")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Seems sensible. 

If anyone has more time than either of us, I note the efi_handle_cmdline()
use of __free() should move down to the point of allocation.
It's only a couple of lines, but none the less...

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
> index aa85e910fe595e..fc1282fb442e71 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
> @@ -40,7 +40,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>  	unsigned long image_addr;
>  	unsigned long image_size = 0;
>  	/* addr/point and size pairs for memory management*/
> -	char *cmdline_ptr = NULL;
>  	efi_guid_t loaded_image_proto = LOADED_IMAGE_PROTOCOL_GUID;
>  	unsigned long reserve_addr = 0;
>  	unsigned long reserve_size = 0;
> @@ -63,6 +62,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>  		return status;
>  	}
>  
> +	char *cmdline_ptr __free(efi_pool) = NULL;
>  	status = efi_handle_cmdline(image, &cmdline_ptr);
>  	if (status != EFI_SUCCESS)
>  		return status;

