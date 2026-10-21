Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604854;
	b=BMTvrDBcLMcf54Pawa+OCUjNV8B44G5GQLaSZnkh+dA5aYaPY/b+MG4GgZjfoKon0Fio
	 kcVIbuhnKGKGXCp/7w5hC08We3zFsC5en/vOrZBcvu1vEzzzCZPE2ivyStvX7XqU4QBXA
	 Czc7Yi8o3FaJyI5083THXTJm2ymD8nLrrTpzyOf1Pp1ZSjqSkCVjqG05goz2Bk50KT2tb
	 JSbZyFOJli0lf0BqKNeHeBwdc9ggB/oxDEWnVNiv1QwjXGRuvo2Y0hbhFNmr0014gbAeV
	 I+Ghi+m9wPkoBzEBCNIBgQUJWftN+NH8PCCQQyiu9KV2hMyvB1lE7JUHziXPCSxATfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kD15e1tCEFZb0oDM+2xTBELmNwYQTz7QW2OQ3oM2K7k=;
	b=j+fDinAHJnK0iFRdiFN21vgB7CBD72+JJOn1UDkeIqBOoVpvQBWNubrff518F4jSVs3F
	 PSPPmkVnvhUez+a/yXEF+aGjGHH0buHgkoR3XM/T38qltXoMjKSYlgxNbf9UwAJ8Wt7a9
	 UVaPJ11aBPJxBpNbLJkNIg0x3EY9DmH5NKaxi9sdCJJULvk7HwjLHKdYRVu6K+h2CjP2a
	 4uxM+wK8EWqwCbez6hT7hs/nbuxcUfNDRQ0EjFp34plilR4uo40T2wuvg+smWCw9MNwyi
	 nhwTHXdWlt/ulgFq3RdTpzaSbsDiVSXborEculclAwfjepRpxGusAI8jqKX61m2Qvtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfpCRj+j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxyvmbLd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7BD606A31D
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7BD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfpCRj+j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxyvmbLd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFoAZr524156
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD15e1tCEFZb0oDM+2xTBELmNwYQTz7QW2OQ3oM2K7k=; b=hfpCRj+j2KxWdKAB
	AHRIXbKs8512TkOfMBg7uAuf4pQwBrgHnCXqjXGBqRwBoq/H7P7OrFgZF0Zfi+tR
	vu+VfuJDugBApslvid6veWNBEZZcyRXJAke9i6292jK0t0YZGi9NrNaWSpT8tY+V
	s0gVcVKmPr81HHIdp7X7HflfO6HpD/K1SRGxm3CFbfoBQBPSdCsoYQ7ODmPPoU7T
	R3UtMzJ9hljMDpG1WZQeQQuRgdzWHC+h+yxC/BvbZHBOb3CssvTUbrb7Z5UqBp16
	83IkxTQ0zg67ak7mU7qRBBySHW1fHCbjzIGN0Kp3HDrdNz9pEeOQETK0hUBs98qx
	h9bHVQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv0hnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:47:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1677373eec.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604853; x=1793209653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kD15e1tCEFZb0oDM+2xTBELmNwYQTz7QW2OQ3oM2K7k=;
        b=LxyvmbLdOsZxUwrTx1onxCooip8x4q/sb4QyCokMkc2qtq/N9VNCawNfuzRzDY3WnN
         5VH0FCiN5eAUTOseG5A5LiFEcHt7L1nKqsnbyN/oZBUMidpiJLhBXxTIBIqbzwNzbfje
         8waG3/t7QFmpiDSsk9gNWJvToE2lvN+2WXT0MmTYCpMScTs5bTRLTQCM/09zx4wUj3xN
         35hYYe5lOoPNAyk2buaHqcY9GgRrktpCpggEtZcemKKfFaKr87K60I9rQba3EB59we7m
         ZNv3Kb2PQIaAIR035ItnPyK7XduTXioO2l0Gv/RpFaBL9ghrY5ST3Wrbudn4WtW4g6u5
         NUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604853; x=1793209653;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kD15e1tCEFZb0oDM+2xTBELmNwYQTz7QW2OQ3oM2K7k=;
        b=laedpJ8VqjoKCahV+cfNyewui1PaYGLq6loVUwL/fYH3BgAmX90fDQmAQjlt/znrSJ
         DMu3HVEcDp5DLhj7oFq0i1ieDMoHsbNeQrHxuRJIFoV1TadPKIQj++BoyG41WttOrG/J
         ZWTvSOzFnHtAAupIuoYKxVJRG74To9/QjVZj9Dk3B55Q35OIkumYGhHiJeRQBb1ogasX
         nzRNosQLm2ECX4hWeXszL++nqJvPxsiJeuNooccNO976H8JU+4cPnoh2LOhbcwZ71uNq
         hOrg9JsUcoAliZB6iNB+Lgm9UAbb9c3GGLhiK8zH+zxfNdSHRJ1lcIXRGZh3kpLhO7iC
         iPaw==
X-Forwarded-Encrypted: i=1; AKwUvBzSDIs7r6KuPNlmUVgPId6El7NGgo6HrViAufCBcWSFoXlY0Z+AinN1PCDcUx6CVwRM499X1MuqYNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0oIi7DwRCnre0GprHPZizl9BVdUrSrSChlxZTTKsb45aGB4Eq
	9eMnJFMVl2wo/ZSqFpBvcx0iAEHMwEY/5914IQCCKaqQdWcmL0LAM7sExaekeOWNyAnvTYIeluG
	06quUnXw3IJCGoI35dTmNmu67+fxebmei0kRtSlp7hq163MIV2TE47iMNvuzSHrA=
X-Gm-Gg: AYBFou1W8fzDOP3RhaHBZCNyhBMdKl2bGtaHO45zH2c0jQ+jFuLms4IkCo4/jRnmBtX
	Mn+rRROXgtkO8he+LTOP762FUrketQJ0bIP8wnI/U2mNUvVFzOo3f13xMJHE0yd/MDWewZtmOK7
	iH2bgL1JxRnrH8hNF7ArlQ/d+BasmZ9Oi7+LuGLW0w/UaJN6VrVcmDnQmj6L4bfp7Ih51HXKuCZ
	QkXmfJAM1hQy/CveCG8b1KncC3hz65ucRw1U1gmWtdqBKIVby0nG6kd0w4waslfMHWtj4YTeWNv
	9r1EclEizD/rlX6PaGIzSs5ls1yUurthcGV3/ND6mFpkRQWYsG5vdEJmBhv/OqLY0ONIp4cgG5S
	7xJQn6oTq6p2yMAJelRMEutE5sAVyILjrchYwndOsow==
X-Received: by 2002:a05:701b:4214:20b0:143:297c:276c with SMTP id a92af1059eb24-190a5d6f349mr3478024c88.33.1792604852542;
        Wed, 21 Oct 2026 10:47:32 -0700 (PDT)
X-Received: by 2002:a05:701b:4214:20b0:143:297c:276c with SMTP id a92af1059eb24-190a5d6f349mr3477983c88.33.1792604851896;
        Wed, 21 Oct 2026 10:47:31 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm8915123eec.13.2026.10.21.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:47:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:47:26 -0700
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
Subject: Re: [PATCH v2 14/15] arm64: drtm: Call UNPROTECT_MEMORY
Message-ID: <20261021104726.00002640@oss.qualcomm.com>
In-Reply-To: <14-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<14-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
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
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad8fab5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=4lc54p1sSd76nvOad-kA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: OWB2Kh7fXOhF9s9oheJKuufyqgC2PLQs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX9HkA/XIG7/KA
 Kpfz97UZaYN4auCLpVNiq6YlgncIu9g6URyyVsL19ToczZ7ftr0KOTqsMkMmSu/9/TCq2Fd7w/X
 D2EnSS5ZKwDsaw0ofYgG8nZNJWWAAyg=
X-Proofpoint-GUID: OWB2Kh7fXOhF9s9oheJKuufyqgC2PLQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX8J4rmamoD+Hk
 OSuIY0ZF3YJpisX9nj/o8OGROrOdqyvUaBi7Xn+GB6bybmj7JLeSLmfxfq543aSb2gv0jieGhF1
 8AvwzliiuA71sGPrA6KaMGnqQdcVR2VmJavEEI0fo+0CCVgatIlzkH7aeKpE4iQ6AbSGX9rtN2D
 uEF8/5A3A93wLRlqFlG9O9PZz185UMc7Lk/ruWzQlYbu/m6/dcrIxsVamqm3zn4LACmE4dzdOqc
 awo+zk+cH6Z2oaBCyz6WwKGFqb0dO1GgMpxqHVrxk59mWrcKXeQxTKYSJjJ2X7yJIyjxxqiFIO6
 Xj9edpCmJxv24RX9uqgTuayuyyKjIm2kS8OJmrKkFzeHcTj11QunXi9MWG8RLlEtkyWx3GhjATi
 DTCWjN88uwf8PJx7CxXZOmzEpxGNb5lu9E0ZQlA5xSy69Ta32/4MWz785LfW47jXn/wayu37OaO
 14Ivj9cO8/XwaUvW89A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210070

On Fri,  2 Oct 2026 20:31:51 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The stub always requests ARM_DRTM_LAUNCH_DMA_COMPLETE. On a system
> with an SMMU the COMPLETE option is sanely implemented using the SMMU
> global abort register. DMA_COMPLETE should be mostly a no-op. It
> seems to be designed for the region protection mode that Linux does
> not use.
> 
> However, the FW can still do something interesting under it and we
> should call it. Choose late_initcall as we know the SMMU drivers are
> loaded by then. If some platform does actually block DMA beyond the
> SMMU, then this would result in a noisy failure of built-in driver
> DMA, not a silent security gap.
> 
> The platforms I'm aware of are OK with this placement, and it is a
> reasonable place to start.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm64/kernel/drtm.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/kernel/drtm.c b/arch/arm64/kernel/drtm.c
> index 14493948a27f0d..6062980a5d9e53 100644
> --- a/arch/arm64/kernel/drtm.c
> +++ b/arch/arm64/kernel/drtm.c
> @@ -3,8 +3,47 @@
>   *
>   * Support functions for ARM DEN 0113 "DRTM Architecture for Arm"
>   */
> +#include <linux/bug.h>
>  #include <linux/efi.h>
> +#include <linux/init.h>
> +#include <linux/printk.h>
>  
>  #include <asm/drtm.h>
>  
>  struct arm64_drtm_handoff arm64_drtm_handoff __efi_data_handoff;
> +
> +static int __init arm64_drtm_unprotect_memory(void)
> +{
> +	s64 status;
> +
> +	if (!arm64_drtm_handoff.drtm_enabled)
> +		return 0;
> +
> +	/*
> +	 * Currently Linux can only fully support a DRTM implementation that
> +	 * relies only the SMMU.

That sentence doesn't parse.  relies on maybe?

> This should be called directly after attaching
> +	 * a driver to every SMMU but before binding any drivers that want to
> +	 * use devices attached to the SMMU. Our boot flow does not have a way
> +	 * to do that, so for now call it here.
> +	 *
> +	 * For SMMU based implementations their UNPROTECT_MEMORY is probably a
> +	 * NOP since touching the SMMU here is forbidden, but they may still do
> +	 * something interesting so be sure to call it at least.
> +	 *
> +	 * The stub excludes the most likely case of non-SMMU by only using
> +	 * ARM_DRTM_DMA_PROTECTION_COMPLETE, which is defined as:
> +	 *    Complete DMA protection is hardware-based enforcement at the SMMU
> +	 *    that blocks all DMA from Non- secure devices."
> +	 *
> +	 * For now if people have such systems they cannot include built-in
> +	 * drivers for any DMA devices, those have to be modules to be ordered
> +	 * after this.
> +	 */
> +	status = arm_drtm_unprotect_memory();
> +	WARN(status != ARM_DRTM_SUCCESS,
> +	     "DRTM: failed to unprotect memory (x0=%lld)", status);
> +	if (status == ARM_DRTM_SUCCESS)
> +		pr_info("DRTM: launch completed\n");
> +	return 0;
> +}
> +late_initcall_sync(arm64_drtm_unprotect_memory);

