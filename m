Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781440;
	b=Fmd4+Ub8kY/8ZLB9+gz1r2mpBptvAu82xUk26hYVu2LmrfBD4WclUMwWa71iIBR+RCOA
	 yfc7x9pG1Zc5X8o5QrVeFUyDRZU1wTxd1EozlDqoPcixBUlN7u6SNC++rnwkeiWFCBsu3
	 RXZfuR+MBMPveDiyzos6Ubyh0WvUFYhNeCXx0T8IBaTSHcL3qqwLDp1tWmazDTHk8hzdk
	 8v7GQk3nDQyuHgd0L8bCYcB7BvAQhLUOfySQ502ABW5MMBRDrJzbSz717Tc9N0PeBGVCi
	 Pw9UxN78w4xriNcH9oizTe8zafJaGyyGtbqMJw1fWqI3D2uKgethPmMdg07txwFundA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Edlnli8/pVvjmsK/V5fSAop1oIXHSuOLdm8aMgYJNLU=;
	b=A6lYiLLHmmUPm++UuBVAyPAdRfen4tE1IWJ8bw2bh6SPwvjZu85QR5Z1665VUEnfg78a
	 hVtconNzy1gKiW+/dBHW3fAMNr2yYpr27duhuvUpoOgM2AKdxaKwIi3iI2I//QV1pb7f7
	 R8OeOfSVjrlrYEtdKJByfg30iaZjPwhRFfsATy1S/nxWb7HQ3dkB8HK4OrqevlFiaXOnY
	 z98ci1Bx1LkhmXyWtcUKMAo2g/PwlAXrk5Y6YtasvT6b9WGfLdVLwiHqlV+o3ITtN4mce
	 aelGne5Om+9+b2uVAHFkhWS878smOIB4Y3+23SA5cPJ0mdYVhitsquf96Y9OJx7BbkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NME0/zL3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9ssFRfx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A8606A31C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 12:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 277A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NME0/zL3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9ssFRfx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApD3Q2677321
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 12:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Edlnli8/pVvjmsK/V5fSAop1oIXHSuOLdm8aMgYJNLU=; b=NME0/zL3lOee5+hA
	/Mj60l7TselHqAE2SvbCoAJihq0N6SaOIl9sRs65slPfhPSyAyBKIY2Vlo4MkRbW
	+PfwaFn5WjxTgoE4kcKnUv8stNlGPARGhfcGAklz1ZgcG4JBOKs5192vM/lyDZal
	5ZDPAXlYhpRLeMf8J7V9mv8IQKjMV0/DDHCeQjK0pBOMtyjK5u7fSdOMFX8c6LxZ
	nd7wiCoICVjweMbV9tqb3HU4HRDm0SVyPp0bnXBgLZ1Ff9L3MouI8equqEWkHMpt
	32kbbOWVOhSihkxsYHOiEs4blKFK0xs0W0Aqy3wH3d6So3o7vGti7Q4x7P911Dmo
	CVUH8Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9asm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 12:10:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdeb1f93b63so133290a12.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781437; x=1796386237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Edlnli8/pVvjmsK/V5fSAop1oIXHSuOLdm8aMgYJNLU=;
        b=C9ssFRfxwZa5kc2BV8cV0s7EZM4CtUyhCyfxO76uNWU6Tg3aMnGw5OcPF5dxsZ8QBO
         7w5iYSruqnl6jYsgDFlwsug0ml05Szcf4qAqDP04FSKtyhhtgnDB2DbCAjq5b4BdxqYM
         Djmw7sk7s+Lc8t1U0NG6OgCXAZXLv17gr3jkN23DQFKXJT+1wdJvONGiUVLVG/wYlKoI
         8oOew/3upnw81FOj0T9dQgRpbaAgEE+GOl/WGcVggb4rE+BlcV7FqxpHzNAx4k4PUV0s
         GXWHXHCoeBs2IngqUaW26lELE10ygXkKFVtQwpw+//ZBmbU9bgRnKLEP5hgA0jf8bup4
         zqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781437; x=1796386237;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Edlnli8/pVvjmsK/V5fSAop1oIXHSuOLdm8aMgYJNLU=;
        b=jBqt/fbQqn9R+aHeKIhrFl3YH3fdkHTdtn8WJtJr1HoVK46oXATuKO69sbeZbYxM89
         ba2Iyr+h3945FClxCqyqmN2xecZwoRH5FvYuJPIVehkfl6ne68t0DIpYopH6G7sJHkkN
         O+jZUcrThxw3Eg5BKRMX6BdhBhd2//nsy3GT1pky+KhIiC7r6VI6Fa1hR6yXJhRx9Z45
         sSJEMiTP+Er4eOn7ZkMi0uPD+MQgQOr93lwnkLhBjE8VxbnhHfAv8gmWn37stQVruGjx
         bHNTbbiMpzArFwIQ2FmOVF9UG7GefQnfMZbN0qqijljZjf/KYOOnrCm/8qmbK0zPoqQ4
         B9DQ==
X-Forwarded-Encrypted: i=1; AL+hErHZZGzhJ0ffYKfJ0CB2dPJDZHSj3YQp3DNfmCOte7L8SqbELSfal89N4dNF0XmXQU7KOBDSRLvpDoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A70Rto8nVWI3pZM/92yY1fNDKyXdo55gdM8NPCogQ85Y4z1UZ
	Y9idNvnw5dob51fbcwPac8yfOd5Ua2snVo3Ni4Gk7Lf5UJs+iYaD+NJmXbg0ESHkvJpW+vND/Fo
	ymdwwaZLKf/KXo7o7K3vfqo6e7mNFGD3JtaZSUfFEGN9pfuoHmzY7P0h7YC7yIt0=
X-Gm-Gg: AZFdTZfXt8AtRbS8v773savGccBF7UKvgJ2GzutOW6JiMm8Iyp+1MFK/chGJKHHxcwp
	Okw+MULRYe5nmK9ZsxTMlALtPyPq1/bsRaCiRyKqLoepBCbLOvbPTJYtcgSQ+8g7OQEA8sWuf+a
	6brz8qtlN5QG1jLaOkj1rdSe98CMJTZjuUKPoltAmnk36dmT5mMhhG6OBd103JSJqs+wBl8nMgP
	aT5UMjnemQEj6wimb/ldGRv3HOCCrH5nuswZmQbz40s/CVGExbWqSDSLpZoWOgT9O64N2+ZJR/t
	VSxKB9dhSl4eDWD0mb94TG5oKBhRR4Nol12sb+tlJwPbinQxk7rvs/F8keb7NfKjZJNDn+7zbC2
	+W4E9NYGxDaHouOwXVP1gESPYYlxj4eIEZQJ4/2cvs7dF+5Sk6c/0yo3qM0N+8HTbg4PvMWDh9D
	i54bItADhrx7Nrs2/DBaKiwKCjCdIDX25Iw1dXRKcniwF2cz/w6LPkGhnHy2IGm6FgLs65Os8k+
	RM=
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr387785095ad.2.1795781436630;
        Fri, 27 Nov 2026 04:10:36 -0800 (PST)
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr387784315ad.2.1795781436128;
        Fri, 27 Nov 2026 04:10:36 -0800 (PST)
Received: from [10.149.104.122] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm119339635ad.58.2026.11.27.04.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:10:35 -0800 (PST)
Message-ID: <079e0de1-f07d-429d-bb50-c0f6b8600c70@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:40:21 +0530
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 2/2] ras: mem: Add ACPI RAS2 memory driver
To: Borislav Petkov <bp@alien8.de>, Shiju Jose <shijujose2008@gmail.com>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
        dferguson@amperecomputing.com, linux-edac@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, tony.luck@intel.com, lenb@kernel.org,
        Yazen.Ghannam@amd.com, mchehab@kernel.org, ashok.raj@oss.qualcomm.com,
        jic23@kernel.org, linuxarm@huawei.com, rientjes@google.com,
        jiaqiyan@google.com, Jon.Grimm@amd.com, dave.hansen@linux.intel.com,
        naoya.horiguchi@nec.com, james.morse@arm.com, jthoughton@google.com,
        somasundaram.a@hpe.com, erdemaktas@google.com, pgonda@google.com,
        duenwen@google.com, gthelen@google.com, wschwartz@amperecomputing.com,
        wbs@os.amperecomputing.com, nifan.cxl@gmail.com, tanxiaofei@huawei.com,
        prime.zeng@hisilicon.com, roberto.sassu@huawei.com,
        kangkang.shen@futurewei.com, wanghuiqiang@huawei.com,
        sathvika.vasireddy@oss.qualcomm.com
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-3-shijujose2008@gmail.com>
 <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
 <CAG4KcR+NOKHNzg6FN-oLLHgUxeitZHKXg9cN7dz24+Ap=RrwSA@mail.gmail.com>
 <20261110071729.GIavLFCfLKzPx8R0i0@fat_crate.local>
 <CAG4KcR+ikfQEBjCZiNJ1CUz=u3Gtbk_XDroA_GQqYpgO4Lo5Qw@mail.gmail.com>
 <20261121194030.GBawHzrrCNCMpfr7Gx@fat_crate.local>
 <CAG4KcRKhE1UXwrhscUdSpDJS8R0t7kWp8RXZm8j_9yXYJSQ2KQ@mail.gmail.com>
 <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local>
Content-Language: en-US
From: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
In-Reply-To: <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX1Y0+b/Ymu7Yj
 y3BhsOHk/bWHlCiOBw6xaXIwctbXKVUeJMjNyqc4lfVeHs8JTM4yZh/rNLDXLwypYwBc8j57S4P
 pldF+ipVRfV1WIqHphi0bdok3MWUmg8=
X-Proofpoint-GUID: FIfKuCaneTKcen_ysTonI_XUJgM-SXcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX+WdamZeBTW17
 55bBFDT5HC8uISrJyT9y4IKBL/JhaoGpUE23GyDpjgCwlw3Y5AEjGIKzmvmf5LZy7YVckuRYQ7r
 voRzr2NxFBxWR+qyd70ryftQtMAY3pBwKqe9/aMjTSjJanTtKca257vkQB9F+F52hvv6s9q/1ir
 uFoMxrhtuDABU6ouH3rIxHOcuDDNT15YOws+3nHt8eaASZzAGdsiDAs76cUdF/IGJ9XIqRdrWN6
 jwQ8VBCxOEu0XiSUjB+SeRvcmnVR2cdCTK2stCBnEVwWzZnLsHG/HIAxLHjnnu4NRT69jMY+wWJ
 0Wp6STFr4cVEzpvmz0gUOtSzILTM1XISeA5UhKMi5gcuO9ZDSadWl/ZbLQwazpJpcO9fiKW9ker
 sP91fXUgyi/EAYfo4tSD43/TEWnjSrOhsZqyccKtkLO1753+0tQ/DICnEY9u02VrzbBBwM/0IMA
 CNDVTyT10j7TrQEXHzw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09733d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PZ-A5icK-3gcoNPXnSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: FIfKuCaneTKcen_ysTonI_XUJgM-SXcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270048

Hi Boris, Shiju

On 22-11-2026 02:37, Borislav Petkov wrote:
> On Sat, Nov 21, 2026 at 07:53:54PM +0000, Shiju Jose wrote:
>> Please find the attached patch with the changes.
> 
> Thanks, you missed a spot. I fixed it up:
> 
> diff --git a/drivers/ras/ras2_mem.c b/drivers/ras/ras2_mem.c
> index 70f7f0b497ed..de5555d2e1b8 100644
> --- a/drivers/ras/ras2_mem.c
> +++ b/drivers/ras/ras2_mem.c
> @@ -117,10 +117,10 @@ static int ras2_get_demand_scrub_running(struct ras2_mem_ctx *ras2_ctx, bool *ru
>   		return 0;
>   	}
>   
> -	iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
> -	iowrite16(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
> -	iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
> -	iowrite64(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
> +	writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
> +	writew(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
> +	writeq(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
> +	writeq(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
>   
>   	ret = ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
>   	if (ret) {
> 

I tested the updated RAS2 series with the readb/w/l/q and writeb/w/l/q 
changes. Below is the git log --oneline output for reference:

f2508c0f7672 ras: mem: Replace ioread8/16/32/64 with readb/w/l/q & 
iowrite8/16/32/64 with writeb/w/l/q
21c2b3102060 ras: mem: Add ACPI RAS2 memory driver
cefb17f4cc2b ACPI:RAS2: Add a driver for the ACPI RAS2 feature table
4dce97c6c265 Merge tag 'ext4_for_linus-7.4-rc5' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4


Since my tree is not based on linux.git v7.2-rc2, the diff suggested 
here did not apply cleanly. I manually applied the equivalent iowrite* 
to write* changes in drivers/ras/acpi_ras2.c:

└─$ git diff
diff --git a/drivers/ras/acpi_ras2.c b/drivers/ras/acpi_ras2.c
index 0849dd247cac..cb80fb193347 100644
--- a/drivers/ras/acpi_ras2.c
+++ b/drivers/ras/acpi_ras2.c
@@ -117,10 +117,10 @@ static int ras2_get_demand_scrub_running(struct 
ras2_mem_ctx *ras2_ctx, bool *ru
                 return 0;
         }

-       iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
-       iowrite16(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
-       iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
-       iowrite64(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
+       writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
+       writew(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
+       writeq(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
+       writeq(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);

         ret = ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
         if (ret) {


With the above commits and this additional change, RAS2 functionality 
works as expected. I also verified that the series builds successfully 
for x86_64.

For the series with the above change, feel free to add:
Tested-by: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>

