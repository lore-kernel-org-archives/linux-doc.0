Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE413BD22F
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160616; cv=none; b=dkj6iZeo3CJZBwrPtFbeVESRPXhfYZ3jOld0xUtrvwLXhHEMl1texsmn6/VoUtZ7jfJ+LvQ/qdIMqbjpF119cXqIJN2I43zI9/qmty7xuPfRlOUbRnYY0RRdBrwo5yLkafdoxzf0yK0IuZfFYv7QL89gvEj+XeQ1QWyNjBivHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160616; c=relaxed/simple;
	bh=QzX1eIfDuXozU4tY7IyaWnqDasvIQsq/MODmmHbhvQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4p8S+IBTLTmsxdqt8MKZnBjD/0DLUrDc1NK/thOzHq46auD1/iB5A2TMzEjTvZ4xm9+w5dB+QJ2cDeA5S8c2gTrhcAOCT3U3rBS14lcUMIV3+huaHEF6SgO/x0ho8JEuS78bQKyqxI2eo1svRQDHTkNEs6eVsS1BFWWSJLL2O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fINXBuae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+HmekYi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fINXBuae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+HmekYi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6CoC0395301
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=; b=fINXBuaeo4mpid8+
	3BEEhZKngQhbZtJ4j6jFm+Y9za7UY4yTTIHiDG5J5+2AA3AcWwkUI15Oypv0jkj+
	ZX7yYnuUBT9sYCJY4h1N/S3EIrRRTM/hDraGd04y8kJoC7epbbshIwRSvVNcCcOd
	5V07kyB3cEnkp0Sj4WYN1E+rUumAyPYduw+Y7Lhpl21uAdTwquf39Wu+f79t/IRu
	/czo33J2MZO9kVwApxm8NleZXnFxKTRQZaBfpdnNEhSFIqSA9UZ36wR+uU+QyzqV
	IGJSeCaF4dF+c/2GhCQo2Q5ptQMFXCo0o0k8hA+/oWGibJc98GB/xSyFJxpOhNgv
	ldpcCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t6r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:56:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76b6d4337bso3143551a12.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160613; x=1776765413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=;
        b=V+HmekYiMN0Se10C+fpZfIZf2M3fPGLTGmqdqWvT15QKTil45NX5/HQRuPD1x8xcA9
         pxGyV3vfIIKjY7n/t4k0YBUHENbT72A/9yeyMj05f2hTzp7qQKyL+/z/FaySXS05D/GB
         lG5Pg2UJXVuXOOejZa0+8LudLSZzIqJsjawCqbBH9T6jId2iflz4CFG69qViAqLrlbOP
         1+HP1PkBg+cH2l10SW3IYz8DP3OWV5lLHSIu7zrk4kbKpf/2UjpaDKryAOiIk/+ernWK
         wnQHFh1Mz1xZ5rgWnKcbRNOtVFVL3R1OsDDV8iE2ZNh2fFZIun1KHfs0XhyRRbjwMe5r
         rnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160613; x=1776765413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=;
        b=ib4zF+yK1tay2xBl6qe8WpwHbB6aaAcyDqGv4qWqWDpadu6hXjatDRH6qCBsVvlAhL
         UVKM0Rfhsl9Ao0r4JoocvnTq/84/01eUfyn2s2iyOVq3rmHkEEsBUFgj/z7kdOV8NWQ/
         mVsjtlUjYNbnDM7GY4LFUX7q7S+eWiJuv/libmuYO2Gqwk4pNJJcwlRmd6+uW48JpU6j
         b9gTY/GFhRr02C3J62x/hotpVIuBApSB47YQZffeAxaPQiqjIhD3vd6kv9twb3uzQETg
         VJVeUhVPN8G9bVvbvsl/Tg1kibD8qDW8MhD4X2NFT2fcYHETqoxJ6bAxxXzoMISGCgos
         sbjA==
X-Forwarded-Encrypted: i=1; AFNElJ/F9hcwln9Do7vr155gDzynDcIlYxxviMlSvwxxawQLdoMtObKDhk0qJn1tjM/Bwtw86byLSGlEgH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSKh6qjrqEJocIHYy4Ws+aM/Ry4BTLFSaRcLFwpoP5X6ktzyO8
	mKmXoNS/q0l8k8RFBH/5egeC7jAfAUAE/JhC4R1UYIt81UywH2ow+yoQHO2kwYrCjPR+iKm17zh
	vl1UYrvEazrqkd3GoLY+yWjzMaskU8qPlHSgW91riBA7gmJMppQK59cqVkshFibw=
X-Gm-Gg: AeBDietilL/KEl+PIF3PBpI9ghOxbAifILEjK4dJMWDUVZ7rhmjVd0Vfu3UvFvRDLPF
	6g9FUf1DolpGG73iOm7WNcO5b99aYwp5uDGObYHeUi94gcw6w+Vi+9igmAgPsPdhjgGVZys1tHF
	aLW3OBFtglw6oNzkAOKXVBLIwNFjXEk7ZUES/kFmrrWgXrW2MFg+o6zMhmYJUus2cYYFbMlVcxF
	Su2YMgRLlz7mXsELjqt1ju8e6IxZc6DCagJ7E5ZAMuc5yxx50JfwHYVIQXyEe4bIYG66Yd0V9rO
	zA3i5zT90YqvNYCy0LFVIXW7QbbBsu6O0kQRzL+zvLMiY/tkkhg2F+J4KBqalm1MOdopI36vPxU
	yObEvzK5cN7+cZlJ1siBluwaT1JhjtwA34ZOuh3QdfXg5gwx8reYUgQ==
X-Received: by 2002:a05:6a00:ad8d:b0:82f:316:3208 with SMTP id d2e1a72fcca58-82f0c35628bmr16502550b3a.29.1776160612646;
        Tue, 14 Apr 2026 02:56:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8d:b0:82f:316:3208 with SMTP id d2e1a72fcca58-82f0c35628bmr16502526b3a.29.1776160612161;
        Tue, 14 Apr 2026 02:56:52 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm15060311b3a.2.2026.04.14.02.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:56:51 -0700 (PDT)
Message-ID: <8f620562-2e1e-4d61-a823-767fbe51828a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:26:47 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-8-47ad79308762@oss.qualcomm.com>
 <tbwahssgudfeacfj3wcg32yw5fkqorswees4gv4geypjmmdcyu@tv6qkuhyw23l>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <tbwahssgudfeacfj3wcg32yw5fkqorswees4gv4geypjmmdcyu@tv6qkuhyw23l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vhbRBAZESQgL152drC6s3E8-042zedoi
X-Proofpoint-GUID: vhbRBAZESQgL152drC6s3E8-042zedoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX7ahit2c/oIvg
 FPL8ZWvSwONZNGN9w9brJPuJ+V3ic35fRRtzN2awtN8gzTxoZKfQfe62ZP4SVvn9uuD1A5IPPx7
 NYXZSVXF7ftP2l/Re+5wmjNoOYwzecSdgeVDY1Bc52TikDjpwmLgCssU/NkP8uQlEgXCj0LleXI
 n2StcMOLqZQwu/lQTyQvX366Q1Cu22i29TxC2opfeebs0jjr2NChW2q1BwfZL6bt8q+anFhO3JV
 EtFQX1rSYyaDASS5guanknyDyJl6mCo3kgRMPz1tylJ3A1NjPuIZo2PJE65OVS3V1gE9KR//3N+
 sYrpgIDgj2vIMkQvrd4n5EBbSfGgfHlwp6GvoYkqPsbUaFpoi3++5W/HFFYuJOvyPKyS/OqPP47
 xtA1QZt9u8ytg2M2PQ+oQPSC5cRvWxGqs44ORG3vlwooWavqJHJs+jwCFZDFVtPTiuLFabo2sAB
 4twGUP0F4obP9IqNEsg==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de0f65 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7NWoxAv4aW94f8snxxYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140092


On 4/13/2026 5:28 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:48PM +0530, Kishore Batta wrote:
>> DDR training data captured during Sahara command mode needs to be
>> accessible to userspace so it can be persisted and reused on subsequent
>> boots. Currently, the training data is stored internally in the driver
>> but has no external visibility once the sahara channel is torn down.
>>
> Maybe share some steps on how the userspace is expected to use this calibration
> data.
Sure. will update the commit message with the required details in the 
next version.
>> Expose the captured DDR training data via a read-only binary sysfs
>> attribute on the MHI controller device. The sysfs file is created under
>> the controller node, allowing userspace to read the training data even
>> after the sahara channel device has been removed.
>>
> So once the calibration data is read, how it can be used further?
The userspace will store the calibration data in 
"mdmddr_0x<serial_no>.mbn format. In the next boot, Sahara driver loads 
the real DDR calibration data and training data will be restored. No 
repeated DDR training is performed at target end.
>
>> The sysfs attribute reads directly from controller-scoped storage and
>> relies on device managed resources for cleanup when the controller
>> device is destroyed. No explicit sysfs removal is required, avoiding
>> lifetime dependencies on the Sahara channel device.
>>
> Missing ABI documentation.
>
> - Mani
Currently i have added in a separate patch(9/9). I will squash it with 
this patch in the next version.
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> index c88f1220199ac4373d3552167870c19a0d5f23b9..b7208738df10fc3c3895acd46873412818dc1730 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -415,6 +415,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
>>   	return ct;
>>   }
>>   
>> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
>> +				      const struct bin_attribute *attr, char *buf,
>> +				      loff_t offset, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct sahara_ctrl_trng_data *ct;
>> +	size_t available;
>> +
>> +	ct = sahara_ctrl_trng_get(dev);
>> +	if (!ct)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&ct->lock);
>> +
>> +	/* No data yet or offset past end */
>> +	if (!ct->data || offset >= ct->size) {
>> +		mutex_unlock(&ct->lock);
>> +		return 0;
>> +	}
>> +
>> +	available = ct->size - offset;
>> +	count = min(count, available);
>> +	memcpy(buf, (u8 *)ct->data + offset, count);
>> +
>> +	mutex_unlock(&ct->lock);
>> +
>> +	return count;
>> +}
>> +
>> +static const struct bin_attribute ddr_training_data_attr = {
>> +	.attr = {
>> +		.name = "ddr_training_data",
>> +		.mode = 0444,
>> +	},
>> +	.read = ddr_training_data_read,
>> +};
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &ddr_training_data_attr);
>> +}
>> +
>> +static void sahara_sysfs_create(struct mhi_device *mhi_dev)
>> +{
>> +	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
>> +	void *cookie;
>> +	int ret;
>> +
>> +	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
>> +		return;
>> +
>> +	ret = device_create_bin_file(dev, &ddr_training_data_attr);
>> +	if (ret) {
>> +		dev_warn(&mhi_dev->dev,
>> +			 "Failed to create DDR training sysfs node (%d)\n", ret);
>> +		return;
>> +	}
>> +
>> +	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
>> +	if (!cookie) {
>> +		device_remove_bin_file(dev, &ddr_training_data_attr);
>> +		return;
>> +	}
>> +
>> +	devres_add(dev, cookie);
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	char *fw_path;
>> @@ -1272,6 +1339,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   		return ret;
>>   	}
>>   
>> +	sahara_sysfs_create(mhi_dev);
>> +
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>
