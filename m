Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEA634750D
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445114; cv=none; b=eWk3nzewyldLfnIXQZydy/L8gsYTEBc6aH3rhZ1Sozgg1TO7vsvbOuIX4ocAFMOLkA5VyPT9O4PYhI2wFhSaCuI2Kau5N44IqrVVBqihFgD7iRiClbPQ64grWSdQuQeEwiKpIMV5jvcgCEYgPwBqhDOQcbLDDErr3ZNWWWEcQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445114; c=relaxed/simple;
	bh=fmFV98A4dxvkS/+Es5tL72Fc9O3yCXyDW1H4ZC2a96g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxthCMEyBaVXiZPcK3iRn7jqaPicUFgK9k/brjIs5XdjHCVbEIBJGJN8KUa3RHw4Dbw92/+Mw1fe4l1A4C5CennSkS9WzXtvtfgiu/36ldIQ/uPf0EVBZd+lh3VIR0V5he6LVFjMoNDwe+u2d1sM24KHBc5X4kEAtDfT1Ky6MXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUH09lgE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UoUj8Z5I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUH09lgE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UoUj8Z5I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987Kbwq730868
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 07:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOJu5XY2y1FzePi8hUc8AL65vLsOspAwCK8JQc1Wq9I=; b=mUH09lgEPA5rU+zo
	NLWofU3DCVMCBdmU2hBU6YIOvsLjjT6lKQCKl5ZtWMXH9VMafn3okaV0RRlf87RQ
	RAlNUJIEm4cPa5x7lR8fKTQRzlMaE4KMldluAhIJAZbUU53UkI3vJtPU4PMo6eX0
	sw9I6OBJL931FiFpienet/FMbkdk2FAs8UikEaEgQhkPONkYh4jtyXBk0ALLxdhX
	VQWIMl81UGd4d2jf1EDND8AR/LOTyQyR5NNdYSniVZrHUH9Ho/8H7FttgCvKJQxg
	O5gGIqtSPhj+S+cKlpE7WLLDWrz+l0U0mqWODoHDOuB2xjerbXoA3agEYPyadOEI
	PDMlqw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31ptb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 07:38:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8880b8aed53so321800b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 00:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791445111; x=1792049911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOJu5XY2y1FzePi8hUc8AL65vLsOspAwCK8JQc1Wq9I=;
        b=UoUj8Z5I8/udOanimVSCAygDfvIjkgtRDBa6Hz597YRxdFnbAhTycCSMKGGRm9Zo0x
         pCS6osoiVfvWDsZFk2wqhhe5BEYQixkFf/AdxvPY85TCmRO8A4us4tfweQorWdbI1iUB
         rU9SIiTj3W3OE5GW/AtGVxg07/YtfKxQINSxUS2KaeMCsrwNoXCpobEv46q2aeuAbsoE
         CC4GomQhXblxamdtxQSGkHsyWllF+yFvHdYfFRjPfcJqFRS+wXiIeP1NP/aBMRB25fvk
         tWeY9tdOZwcdsJbfc+4fAsLSjxmGscP4FI+sciGmP5wPdZ2C8K4nWlU5VVdCenyys3R9
         Am4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791445111; x=1792049911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOJu5XY2y1FzePi8hUc8AL65vLsOspAwCK8JQc1Wq9I=;
        b=KhpJq3WcEKbFhl0xcuzo7sHLx1FnsyBh80FB/O+7v7wOfoaUItPhtX4ROW1sMYCPp3
         t3Px8+8MZytHamjss3/9CpITacPpOfc7P5AFsq8mq+IjxLnXLrrwtJmHmMAtjaIldMHW
         8JsFpGyAcDW8LPu3OccyzeaK29P/aaH9C2DyJ0tP8XpA7XEQpzTgZMz/Du+wQSg3Vt2G
         r2jZh4z2r3rtvCSuGdcB72VcpDlGAZLZHz0N5ad6jvUOMHG0U/ek7Apm54pZ15eUoxHU
         JA0uqVOCPVUbl5LtZO/3Xbo1TsnoZ/E1Ek/wbBFoGbvZDrCBw3Fhx7WSh34iZDEKeEXa
         IoyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw36IOTcQfoTvAuaxTG7nfmwdSK0pbKW7QFOdTiBbrtkRuzHukv0yEGAgyJmMBgpKA/bqUPO5gjwrk=@vger.kernel.org
X-Gm-Message-State: AFuF++kFncfSNec74l45eIXVtUEfrPhEJHVdiaPXzL6QPzG7XI7LZbAC
	bef2Ru0Buqzv0jeGJN1F7mKo5PsaK/VzLWrmg292Axi8OSbnBEvuHyu6GgCeE+ppfFrt31ocBTH
	AtKlkFqI0C6f7m0d5IfW3u70ULxcLkEytbOGk9AE3PjMW/H2vFu7ai7uWk6OWmFE=
X-Gm-Gg: AYBFou2lIQyEOSULnqme4OfpR/rW+OaJo1AvoJbwMBBMQK+cyraTFB4qkHTgkhZTD34
	LKJp11SjcHg3KXTu+FtviF7fdfxlysCiXJzrSitVTIe3vd4qvr7WC+YK+Y85T0uv8pfbv9Fq2Q4
	xkjhLq1GreSih0KWJ6F6hG6/WZhNCMl/HC2qajMShJzJnyTNW8VinncsH/whbuey8VL2G/+ITuS
	joR/4SOHvwbVzO2dhpbw+I6FnWlVKva+/zrlIiLAcSB6lJIFj4185azzGpXSw/YFll5Hd1B+UJh
	ux/p6V9maUCk2c6r0yxMCT0ZbWA9JvGhR4UTbufqjxGmvQBmSgIVBfBp1J03N86VhUj4KI59mWZ
	Q3OqN3zobSnTTfM1QmDf+KQBc9zYT4uNg5ELqjkxkxA==
X-Received: by 2002:a05:6a20:94c8:b0:3df:15f4:756e with SMTP id adf61e73a8af0-3e14a520ea6mr2795648637.1.1791445111039;
        Thu, 08 Oct 2026 00:38:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c8:b0:3df:15f4:756e with SMTP id adf61e73a8af0-3e14a520ea6mr2795588637.1.1791445110484;
        Thu, 08 Oct 2026 00:38:30 -0700 (PDT)
Received: from [172.20.10.2] ([152.57.136.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bb89fb03sm1204138b3a.47.2026.10.08.00.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:38:29 -0700 (PDT)
Message-ID: <ac2a8f1c-295e-4791-b233-cc8549430e07@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 13:08:13 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 0/2] ACPI: Add support for ACPI RAS2 feature table
To: shijujose2008@gmail.com, rafael@kernel.org, bp@alien8.de,
        akpm@linux-foundation.org, rppt@kernel.org,
        dferguson@amperecomputing.com, linux-edac@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, tony.luck@intel.com, lenb@kernel.org,
        Yazen.Ghannam@amd.com, mchehab@kernel.org, ashok.raj@oss.qualcomm.com,
        sathvika.vasireddy@oss.qualcomm.com
Cc: jic23@kernel.org, linuxarm@huawei.com, rientjes@google.com,
        jiaqiyan@google.com, Jon.Grimm@amd.com, dave.hansen@linux.intel.com,
        naoya.horiguchi@nec.com, james.morse@arm.com, jthoughton@google.com,
        somasundaram.a@hpe.com, erdemaktas@google.com, pgonda@google.com,
        duenwen@google.com, gthelen@google.com, wschwartz@amperecomputing.com,
        wbs@os.amperecomputing.com, nifan.cxl@gmail.com, tanxiaofei@huawei.com,
        prime.zeng@hisilicon.com, roberto.sassu@huawei.com,
        kangkang.shen@futurewei.com, wanghuiqiang@huawei.com,
        sathvika.vasireddy@oss.qualcomm.com
References: <20260726212812.89266-1-shijujose2008@gmail.com>
Content-Language: en-US
From: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
In-Reply-To: <20260726212812.89266-1-shijujose2008@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX6ZJbD3sBJsVi
 1URcey4iKBlh9dvI14iAsoRKVK5r2SosWlctE+yd7Fl+rpZ5hfOeg0laReQhZ5FEYvHgyWYoGwC
 quTsmxSSdRw00VUBPn9jvprIopEE+oaxR0xd9zMlHa8BsraPs/GDGXGqiz3BPs7lH/MuWYN2Mfb
 SWLsFmi0dlbPDyyHxzjbHMXRoJo/sKxGkWL3oyeih/yQ0E3dLVjRBcz+jw3Emr6uhM8Ga3A0tEw
 7F7V1tMbG4vL9djOQfyobVPBKF8GTNJrMpPj0wGMhViFGdHC1eq6grZARNgFZgUthKj6aa4JPX3
 754azX/7GIRKYDubcBA5TDAJfAWzJWEVk+c6IVet6D/IvxkpV25oLnN+z5IfzVS5ZY3iNGSJ6gE
 D/TLXRfe5J2y67M3RRUTe8vQ/OBpCpAh/n6LPfKIi2emEblzLqnC/TDy05YVOv1CXQTs/oqIlOZ
 cXMjyjvcBaydEVDnbWw==
X-Proofpoint-ORIG-GUID: L8np9gR5vdPJIeeBojqexjZ6Mgk4XZg6
X-Proofpoint-GUID: L8np9gR5vdPJIeeBojqexjZ6Mgk4XZg6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX/sdTeZ8Lsyii
 zYPXFbWOERsHXxWF/FtOD19FGANot/do8QcVE+tnG1MGPJ61TABlrZAXyLJmQSqgLCuMLpT6G4l
 H/oK1VisdCUwpa2ftNbNKuR4cUrmr2Y=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac74877 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=wYZPontbJtJ1d4/P/lQeJQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ZZ33wcIyg4nDkeuy9NgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080030

Hi Shiju,

On 27-07-2026 02:58, shijujose2008@gmail.com wrote:
> From: Shiju Jose <shijujose2008@gmail.com>
> 
> Add support for ACPI RAS2 feature table (RAS2) defined in the
> ACPI 6.5 specification, section 5.2.21 and RAS2 HW based memory
> scrubbing feature.
> 
> ACPI RAS2 patches were part of the EDAC series [1].
> 
> The code is based on linux.git v7.2-rc2 [2].
> 
> 1. https://lore.kernel.org/linux-cxl/20250212143654.1893-1-shiju.jose@huawei.com/
> 2. https://github.com/torvalds/linux.git
> 

[snip]

> Shiju Jose (2):
>    ACPI:RAS2: Add driver for the ACPI RAS2 feature table
>    ras: mem: Add ACPI RAS2 memory driver
> 
>   Documentation/ABI/testing/sysfs-edac-scrub |  20 +-
>   Documentation/edac/scrub.rst               |  70 +++
>   drivers/acpi/Kconfig                       |  11 +
>   drivers/acpi/Makefile                      |   1 +
>   drivers/acpi/bus.c                         |   3 +
>   drivers/acpi/ras2.c                        | 509 +++++++++++++++++
>   drivers/edac/scrub.c                       |  12 +
>   drivers/ras/Kconfig                        |  13 +
>   drivers/ras/Makefile                       |   1 +
>   drivers/ras/acpi_ras2.c                    | 624 +++++++++++++++++++++
>   include/acpi/ras2.h                        |  86 +++
>   include/linux/edac.h                       |   4 +
>   12 files changed, 1349 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/acpi/ras2.c
>   create mode 100644 drivers/ras/acpi_ras2.c
>   create mode 100644 include/acpi/ras2.h
> 

I applied the v23 RAS2 series on top of Linux v7.2-rc2 and tested it.

Verified ACPI RAS2 and PCCT discovery, PCC mailbox registration, EDAC
scrub device creation, scrub capability sysfs attributes, background
scrub control, and demand scrub operations.

I also reproduced the PCC TX ticker issue reported during Ashok's review
of patch 1/2 and confirmed that the proposed fix (initializing
mbox_client.knows_txdone before pcc_mbox_request_channel()) resolves it.

Without the proposed fix:

   # d=/sys/bus/edac/devices/acpi_ras_mem0/scrub0
   # echo 0x8000000000 > $d/addr
   # echo 0x1000000 > $d/size
   # echo 1 > $d/enable_demand

   [125.577700] PCCT PCCT: Client can't run the TX ticker
   [125.577704] PCCT PCCT: Client can't run the TX ticker

After applying the proposed fix and repeating the same test, the PCC TX
ticker error was no longer observed.

Based on the above testing of the complete v23 series together with the
proposed PCC fix, feel free to add:

Tested-by: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>

Thanks,
Sathvika

