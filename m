Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2683A3E72
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160324; cv=none; b=Jkf+M1Hwb7c8/h2JhF/++KvFI2fjkayHzsTjjiRWtY7bbq1Ue606rdyouIGE7ljbNF1KySlA1CRbE6BxsjtBjSaGb8sAiMAtNeZtGhM5FTSROVBPMXYtNhr6cdcs/iqwctXcBKt5w4TU7OloIYkC1uNbYPWrQ7fgmxuA2m/NUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160324; c=relaxed/simple;
	bh=I/Hd0vAKGMDZBsVaB8CR4NASLw78vH72UmpKGDKvXls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COqw3bFgD8jTUXV/lDwJo1smIWtaTnD7nOtIowQiduYzUsBrf0loi5wZrD81c6fiuy5tOpCcYL0RmZC9bPnQULGpMeNWwlTty2Hu9keo0Xr2LSr9hnoX0AIbuL9GrqsjnfnL8skxIvrC/J/wTzv77D15hWnG543s+fp1Ce3jGvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHiqGMki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhqdnErl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHiqGMki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhqdnErl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6chgS2633423
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=; b=bHiqGMki65PNXwWu
	gXNn0tbZTg1G5l8GfGJ4Pkp0yMcVwCUwNSP7dR04q5O8C1WP7ckzIlJu2BdY/BvL
	LBycAzjEQXg8P+3DzmoMYlm1hB0iKBNIzylpkrssghagOmXAgPAS9k/Fbs/w9HJq
	DJGj3cxxlP1+T6Br5v/Yd9AGjM1/mdf/HYHjchx16byeoS5rtSy78fE1HsXzif+V
	ls0LGCwhg3kv21uXUt+2arqD5WPZ5Nyexw0WfRfpOB+kL27XfpYzaV2LZ2O0BBSq
	syUTun0532GqMH/rXLxEd75Pqckkq+7DDn4KwFl/XPgz2lMzX9CXs8N4ssRm4YhQ
	nCYIEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca5pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:52:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f3eaf4b9aso1039894b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160321; x=1776765121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=;
        b=AhqdnErl+XfNfsRjCv2c4qdohwqc7gmHP6zFuCBVs4Up7XGtHcmsllGrF+gLPjPsAy
         WpT2ZYmnWn1q2jLlyUfWQbROLl+wGcI4IY48Ch8DsiGSrBfYfTsuJ33DWsrnVqV8a3ur
         wcuv9uCx3fXGvy8zqEsvhONo13vBc3uDmn9pRsbfpYoHgUSxXWUMDchF5WeN97WGsopX
         CwEGazMgyrgLX1TZ21w/Al7MyJuxYyVa2UoXN4KN3DkHzPFm1o5zNpQSpowh1BwT6Lr5
         PTsztUJ5nRG9EDWzs/3o8s+49EqLlTfV8WIc2ukl1EioXiEs7qzBxUhQ3bztDJhv6SAg
         eB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160321; x=1776765121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=;
        b=reS/x6ogdCT95Cbpknk0aCB6VgEItIpYTvDoTHFYFVdmRWRUcdqYzsaiTCrFSD2qrv
         O4AXTs9kShIQ74cIv/DlQ83+Kp9xVLX4n3fTqJOOeHSAck6QBaBuR8rCXTfgijG4yeiM
         sp3FA1PVscUOWtflZoML0tyH/rYd0jay4V0urnQxnxIB7/J2C/qOzyk1XHyeKX3tbGME
         x1HawsereQNIZ9W+afeegVdS1HciQo2Su3oEP+hJkO9mLp/oUBAjXOTS7o3YfmcACvO4
         dNymovPc9qzX9w+ul9u9bl6JWo1hqzaQDKwAHwpk/7ind0ZF+06cb9itXtm6ErO8c8Eu
         NINA==
X-Forwarded-Encrypted: i=1; AFNElJ+sAgzy/WacjBdkUJyoJyQdC+SDQ2eiVbMv7fcPaA2Fc4MPmhAgCMWt5uCAJUXpfXWTZE6iDfJd+m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlBWtGPmLoPIvd/56OJQ+jVB+TsprqR0hfkam6DZnTqMQm5HHs
	Cdck7AkH0WXyZtjv0uLNBI6YqO8SjVODGgwwfEfPGh6swRJfWWnmn8SDiTtHWo8LstJ1eD1ldM4
	Z0YpS10FVuAnZWtDIsqCIGJRduUjyA+ELqlxPO2+mELIEJ8k+C2qyJGioDwpUDzE=
X-Gm-Gg: AeBDies2JYi4y2ACbrWsdOLUKvb2wLeC9ROtyc3nvJu96UHu3YC8xSPsELAGLhfyLxZ
	jTxGnRhqDVuey2IA1mfkZdcM5Fp4NxokYfoTjnTC/uQBuIMp/uiV9o0V+suaEvTbITkTGl5jSG8
	q+HOzopm5eK5O6DNe5eS3uXR0177NismTuedHQaBUe4vrEtbuxwuj9VnTYVnLI7fSLgrXBYstc0
	d6eYVrC1X5Lj2j+3ycfREa8r2e/XCEpbPNTS5yrqjxi4vlmVJWVAnNlES61qSiBGttPyLM9fZ2W
	fvOdVKkrw7P/206LKpejdMaJz7zUFM1ps3OxBwfMO/49ZfaQ0+gV9iLtTR2UBXoY4bAX3H6NxzR
	6jCNyLI51JEX92/SkwPIjS9Y9vFJ2L3oi0b8kgS6kAvluKi17GQ4wsw==
X-Received: by 2002:a05:6a00:2d85:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f0c303511mr17536291b3a.26.1776160321535;
        Tue, 14 Apr 2026 02:52:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d85:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f0c303511mr17536273b3a.26.1776160321051;
        Tue, 14 Apr 2026 02:52:01 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c330925sm15955528b3a.15.2026.04.14.02.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:52:00 -0700 (PDT)
Message-ID: <dbcea41f-cf98-4654-bb30-49308a5422db@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:21:56 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
 <5lfbhyzyyji6cuve3uzd26rfgnqotcupelppgehdj36dq7op6j@hn3jmhtqzntq>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <5lfbhyzyyji6cuve3uzd26rfgnqotcupelppgehdj36dq7op6j@hn3jmhtqzntq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NXIHrPMMhJ2hgME3-3lrRXmXamVR8bZ2
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0e42 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Io-4PmWlcMg8xS9VqXEA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX5VTmVbdbCfqe
 +MmxyY3MqJPMCliEekGyxac3XfDDFPlumVKoVu3RD9U5bVcvhLbKw8Z5g6Bic50sFFV9GPkOAkx
 8T+qmIQHbUR6T7TzDVATRZiCjMUnGGDboMiHUoht7ZJbH2xTyqtAcdOP9QRNXcq6dN+f+uML189
 YyUzYJ5LAKp2JjSZ41Mfa4I+9SdrRs4KdzZ1ox47Wj9K4BZR/PWg9GDwvz8IfJtFWodzNgxNm+J
 5dH3aTjqMsO9+5v8c3JFkVNK927G89l8P2HG0tBQcxdIEe+6t70P1xCUY+gCdDsz0ofn0WKqjjD
 A7yzKyQ7xSJQRyj9bNT6HXessKsd044NwxHKmr0ndzuVSDj5VWxRqcHRKxG6Dc8Lrzk263NqtTw
 wUBlxBaJU42Jm5x8s5xZ5YPyKRNLrSzxkrP4O4z9H0pMfx460lfWKIEPb1Ifb0p/tByi0nDyU1N
 TBPdf6AxPCx6da3Dpdg==
X-Proofpoint-GUID: NXIHrPMMhJ2hgME3-3lrRXmXamVR8bZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092


On 4/13/2026 5:04 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:45PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects a firmware image table based on the
>> attached device, but it does not recognize QDU100 devices that expose the
>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>> QDU100 devices with the correct firmware namespace during image transfer.
>>
>> Extend the probe-time variant selection to match the SAHARA MHI channel
>> and associate it with the QDU100 firmware folder. Add an image_id based
>> firmware lookup fallback for cases where an image does not have an explicit
>> table entry. This allows required images to be provisioned by the platform
>> without requiring device specific client drivers or additional registration
>> mechanisms.
>>
>> This change only affects devices matched on the SAHARA channel and does not
>> change behavior for existing AIC100 and AIC200 devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 72 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
>>   	[78] = "qcom/aic200/pvs.bin",
>>   };
>>   
>> +static const char * const qdu100_image_table[] = {
>> +	[5] = "qcom/qdu100/uefi.elf",
>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>> +	[16] = "qcom/qdu100/efs1.bin",
>> +	[17] = "qcom/qdu100/efs2.bin",
>> +	[20] = "qcom/qdu100/efs3.bin",
>> +	[23] = "qcom/qdu100/aop.mbn",
>> +	[25] = "qcom/qdu100/tz.mbn",
>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>> +	[33] = "qcom/qdu100/hypvm.mbn",
>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>> +	[37] = "qcom/qdu100/multi_image.mbn",
>> +	[38] = "qcom/qdu100/xbl_config.elf",
>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>> +	[41] = "qcom/qdu100/devcfg.mbn",
>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>> +	[45] = "qcom/qdu100/tools_l.elf",
>> +	[46] = "qcom/qdu100/Quantum.elf",
>> +	[47] = "qcom/qdu100/quest.elf",
>> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
>> +	[49] = "qcom/qdu100/shrm.elf",
>> +	[50] = "qcom/qdu100/cpucp.elf",
>> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
>> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
>> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
>> +	[54] = "qcom/qdu100/qupv3fw.elf",
>> +};
> Why the Sahara driver hardcodes these firmware names in the first place? Sahara
> is just a protocol to transfer these images to the device, so this driver
> shouldn't have any device specific info hardcoded. IMO, this should just act as
> a pure library. These firmware names should come from MHI controller drivers
> instead.
>
> - Mani

ACK. I will move these image tables to respective MHI controller drivers 
by implementing a registration mechanism.
>
