Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A8331716D
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439908; cv=none; b=ZhKb9fZUXMeccIGTH+4pE5uXZJAMXnUdjcrBRQMyUTalM1yxIY9r82aN913LE67KfEGeiVruf4Xd0eTWLN1p7dDTherS5COrrlQ38/8djycPAV6nNa3yBDMo+rd0uWzdS1o2pzvr2YSwIXNMZVDZzoi6PyRQGkBddh3IcsV4i1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439908; c=relaxed/simple;
	bh=mQM8iO+zt5QYIp0Zyu8xKeOXW6PSpr6CP7eG/xPY764=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QB/AokHCbiR6NnmuUiCYdVU8nqmeE05Gw2VMVgKDjuJehzoDN2hG4OKUBxm6bqsBlD4+U52J4ZX0Rc9us2Z0GcRlwVn2PG3txzW87VRQK3GrRUtz/usKmDbukvJIfmzHilvGobbyNqIQpR5+exZhB2IOIVesf9OMW7M8fRAN6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C60Yibao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLRdkQ/p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C60Yibao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLRdkQ/p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BwN91434020
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 06:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=; b=C60Yibao8onkV6FM
	w2Vqcu1Ki0Yr6cfzts0IeIUvieAvOvsXjV4alKG8EFG2PXC+l+CYbcDTQTMliPWq
	c9ecXeXC6vhJKzKBY0rzPCtES5jeYjuG4JzBbu8sp6M13BbBS0zsPLx7y2Kd5MIW
	WaZbZbUnAbNIjEuBShDWvoO+csLWikYp5zCRjHkj33hSjw+3MIK+bmAqjr71Ijk4
	XY988HPKjnP0FwnXLvCrTEq1PFA80pq7IabbK4RQAgCv3u9DGx87eOBZVaZUkMVV
	2PIx1kfdbcWnlPqwx6d5NItHcn3xDzlFl2/cEXbmFWc3NYvt+yldy37mnnGDjfpK
	3dYMwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hgeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:11:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a813204f87so3447629a91.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 23:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439906; x=1792044706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=;
        b=GLRdkQ/phLAxnXQe5MR0wVPi1h27S3jBb/NHVGun/V+V1WECk0QtTpTFRS1FYRK4+U
         lFkU1ME3eQGx7SlNFJiGjtWbfX0UjvWZqNlUGfWyBgBtWdPSCOWHgQHXT+QVxfls+DYM
         Wn3LrBl8kRdp+hOukE0b37cqf52j94rZKyDLq/HbE7VMjP/MhVA4yIGlONJZlWhLGPuB
         IxPeImYycR7OnXPKh8esRNVOiDkfpgf1YNd+rHO1/+o0i824zEk5NraUUr6Zp9fyoumC
         XwDhaRap0bW7O85dfzovcYvJ0kco8HgYXDnya6x01Zm7ht4XYMaYskJume++GfgGrVBS
         qocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439906; x=1792044706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=;
        b=Gjn5wMX0pj+ycMNMISbQ31lUpSHyYPbIL8YSs58H5U2IXLUSEjiJa9RPee9dYwUX2p
         U71elQ3r6g8ZmwhIomEVatCZGwHCv3wg6YOxewejWHq+7osytaBdkz14ucyI1XFRQlrK
         srnyfkbE01WIeSrnEaRpvQ7xHqADdWVpEXKxLwuPfGiPmOIqoivlWle510r9ZkeDpJIH
         HsLbeQDnQeX1JAVjIGCDo0uVQa8mi6bCQtr8FnBLKBqk1WmPo1HeOFND+3FBjcOXH26U
         oF3DBOGbK9ijwxlFhjTNTQNcjgi/yRfUCaT35Yrwk27QwAD3BtuDfc25zFH7rfLwMQIs
         t2Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwruvnCD8DSrCUevszrybX7otuq9s1PppK5WoiTWcVhUmEu0ktV8NwYqV3lXg7VC84aXETwmF3zCXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGE4HgCkMptgBCrnqahPN3XHAi/C9KjOk2r7j7ty6TJd2IMmqh
	NYbAX9YV9klHWw9/ZJ085QLwfURkZ9zFRtETr1bBdLQonphvnlWuurXWsqoFfOZbtfBnVhJOUiC
	6MsfkZDJHHx6PZzafBCtyPYt8eqxrlZgfUO7LaIg6+BVOH3a/7rIo1mVKHrSh8Q4=
X-Gm-Gg: AYBFou3g48kohm3JGMVwBKBx7eLFHgjSzPOVqjJr+P4CSA5PZxfbHa0j6omJp6Ml0ER
	m8hz6ynW7CN4KAaKfZ7su6nFfzGFPH/ls3SIwaPy6CJLGpVsyh8EU3P2xYYg2btZ82wh55I05XM
	+qd7LqRnDkCFaPdZaxgOHBVAXagfKbxpzR9eUhHySwZiX8QYi1T00sg2D63s4eLKpgQEl8Ocxew
	TP+Co9C6HoOIFFJxsy+TruTHQG20XxDYlkxBxMzhmtBxQk27jt+ybViwSV+lyCZJeFVywKqvIGL
	FJJW8qnIFWfnsMkKrOQmYN5OQIzry5OvRq2ZQFDa3MZiqxDIgCCShlbT0Ke7q0zlKHgBD0wPM4E
	uX3g9Wz7kYHihFyFr0L7lPzQd/5kZ/ss=
X-Received: by 2002:a17:90a:a89:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3a8cb54e725mr1571770a91.19.1791439905546;
        Wed, 07 Oct 2026 23:11:45 -0700 (PDT)
X-Received: by 2002:a17:90a:a89:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3a8cb54e725mr1571754a91.19.1791439905042;
        Wed, 07 Oct 2026 23:11:45 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d416348sm4247427a91.0.2026.10.07.23.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:11:44 -0700 (PDT)
Message-ID: <4ab383a0-5fd3-4cda-a0b4-8d9bd5d015ed@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:41:37 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] bus: mhi: Load DDR training data using device
 serial number
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
 <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX6StbRIPy6VDR
 nTrkFgc5Xz4YjTik0p80yok00ilGtuZPw9RqiMKGaKPtQPASavgh2BTRnqcNRDoYR8Z24UTyjeb
 r8s93R2293bYK42ROVZ9s7ZSg6M3OTk=
X-Proofpoint-ORIG-GUID: Kt2jmVKwBQMPHzPt489LMMgvKiM85nt_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX8URF5I5M2a/6
 5P2ROMX29ZRidsm8P3KWYkdEPnxkYM6S3eOdeydPQYLytG0gugFuVQeTfsdB9zR40EYzhKGvivE
 17TLKRPk4xsyfb4f28mFRKj2yxyMMm66KC4TtwViEYrBwMpHdOVpeOSicMH/GxGPhcyU6cFySML
 Z+rOlO3gzPFM6v1ZawXNCgTh3qMH5q/BBCvXPOg5+lxWeE5UnngdRLKVzMAQxu/K+8bGCjC74WG
 wiWnLZNywr0pu2+Pz3+v+rkUQLhfOUxPYAC1bEyA/sS1eCbhTWYIwOvtiTcGNVM3eIhZdFl6jKc
 83QPdJgHe18cSipG813RHNJxI5tT3p1CuMLP0ZRwzoBX7QrXbfz6VTTvoljMiJ01S5e5d1YvNs0
 umVRyAyYjy1JeSrSi0Oezza1qHft4nLnN6PnhiisLRvAmDKbZaOrUS+JFH9DmY+Hqx9swPIrsox
 n+NDBna2FMiTjxlx15w==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac73422 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BmEjwzUHSYKQsWGf9k0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Kt2jmVKwBQMPHzPt489LMMgvKiM85nt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/9/2026 11:51 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:39PM +0530, Kishore Batta wrote:
>> Devices may provide device specific DDR training data that can be reused
>> across boot to avoid retraining and reduce boot time. The Sahara driver
>> currently always falls back to the default DDR training image, even when
>> serial specific training data is available.
>>
>> Extend the firmware loading logic for the DDR training image to first
>> attempt loading a per-device image dervied from the device serial number.
>> If the serial-specific image is not present, fall back to the existing
>> default image, preserving current behavior.
>>
>> This allows reuse of previously generated DDR training data when available,
>> while keeping the existing training flow unchanged for devices without
>> saved data or for all other firmware images.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -59,6 +59,7 @@
>>   #define SAHARA_RESET_LENGTH		0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>>   #define SAHARA_MEM_READ64_LENGTH	0x18
>> +#define SAHARA_DDR_TRAINING_IMG_ID	34
>>   
>>   struct sahara_packet {
>>   	__le32 cmd;
>> @@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   		return 0;
>>   	}
>>   
>> +	/* DDR training special case: Try per-serial number file first */
>> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
>> +		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
>> +
>> +		fw_path = kasprintf(GFP_KERNEL,
>> +				    "qcom/%s/mdmddr_0x%x.mbn",
>> +				    context->fw_folder, serial_num);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +
>> +		if (!ret) {
>> +			context->active_image_id = image_id;
>> +			return 0;
>> +		}
>> +	}
>> +
>>   	/*
>>   	 * This image might be optional. The device may continue without it.
>>   	 * Only the device knows. Suppress error messages that could suggest an
>> @@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   				      context->image_table[image_id],
>>   				      &context->mhi_dev->dev);
>>   	if (ret) {
>> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>> +		dev_dbg(&context->mhi_dev->dev,
>> +			"request for image id %d / file %s failed %d\n",
> Spurious change.
>
> - Mani
ACK. Will remove in next version.
