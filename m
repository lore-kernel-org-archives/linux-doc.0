Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244D8289E13
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439962; cv=none; b=oThISeFglzGD8n/dkDiqdGhTfwBzu9MH2A1Llku86lvE0lQkQOQAHs4Qi618sIWmcJQnKk0HphWoGb6eF7bo/sPJVgiHBRK9mlbEASYX8Yw2oA7ZuSqB63E5zB49rePt0ft7vrVKxPpmRM/b0OcLcrxpES9h+v0Ax8uP/8kSghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439962; c=relaxed/simple;
	bh=sCkEiN+qolnUMYJu0zZCdc1+ix2cmxHcK5i99B9vty0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDvQsD9+/bWHfeCJr8W7w0EVxEgvCKRrLAatnrqdBnLJ70BDVB8Ca9OQzcX4swtvNxmcMP/HOljyDoDX6naQkiWFvZM3vcPnlUyx6CinECuGIoDgJJfH0FozQnLz4yiWseC7ovHudI+1NUQBpsB3PB8iogiC7EYUm/pybuRDyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+Y8weLU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckhLZgIb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+Y8weLU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckhLZgIb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTC4928469
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 06:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=; b=d+Y8weLU28GSBE3q
	hyzTdHjUqu0MoG9oE7BMMVpixr0jym6chlbVLyh95W9Eji88xVsqFZJNef/DoUw7
	Obx3sfnhxloT9BDE4BWjzaggfa5zK6RhZvt5Fn5e03n1QSqVN+5L/Q09mf5s3A2m
	6m8E29+WzGV6cSLDo2zKcwsUMkQZEEKMXzGXewuQ9g3z2VwazZOJDakO5hU+J6ue
	jn353z90aVVqQKwpnSbMPgAsfI19ORNDVGef9D7QiAn2jhihcVk8Kg0GWS195L6C
	IB5lYTVH3G+1aSlcItsbmf31Dq5zIu6O2XgAXelbEGz3Fzhq7dOX5uBwezXMiGQQ
	y7YsxA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sdam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:12:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso5410458a91.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439960; x=1792044760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=;
        b=ckhLZgIbBc4eLJj+FuSXTyIyrdtBtOoQ8dyBdZ0Equ4IfYrA2PBilNaTJfziSMQjVG
         sjvVS+gbhDuROLyFqaNPKEpfDNyyanpXavB3RUl4JIUeNzfjphh28gRXlHcNzPswW033
         0Q3tw0h/9uH239iNjTK4WJc/NPKE3wp2qmK7viXCCOs6nsNfo/UqLG6KqwxlfPGthKVP
         Xz89OiOaHg2zqfN3qzdLNj/DlFebuYtvHyM+wPSjjN7HMTWyviOGNmWdt17Q8XrZ9DkP
         P20yciF8ZTBfvBNjCQw1M2HvW8w7nOmRIHyLeeSWx7c0efTy/4YGbl82B8Mu0HwUVnHH
         Uahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439960; x=1792044760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=;
        b=ArLNM+zcqJoudn/ymT7Vg6eWnGcsU/eSqx3m3p8w9SAPO3mlnel6ibP1cH9LufmACn
         F8tWxHcejLCB1GJGsz7xU/Al7INKJeREYh0oSWtf/tqezulLP9dzo39Q1fdanxEMRmSp
         kji+DcLO2B+tZaP5R+Tp+3Y/hv25Fhs7WY/+l+ilhYX6hGdvLm9NMww/dPFf3OP2LQ5y
         n4HsqonRaz2hA9QR2Biw9TtCMC2B10xp2EkfCm7zXY2DvJ56k841Baqotw2Zw4P8T+mv
         jYE58VCqIpsD0Pkjo4uANADbQFmZR3zMgPAKWgB2xjSEtMEDL5154QXMY3ZeOyz8yrGl
         K7BQ==
X-Forwarded-Encrypted: i=1; AKwUvByBSuYRqgxvGBcOux0nm6/HejGc3ULUhnIfbugkHaIpPB66pUxliypsTjrYosdy4rB00IFwNwGtqSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf7Emh13C/ohwOrawOEeUkXjbU/8Zv6f6p4RgRmQYQzyHx02wN
	5dFdDXoDivDWEd4H0mvxECu5Wb9Hfu6No59z8ffpghPEuq3SuOZ0mnEArDUxuolqCFs0Rhuz1o2
	zvS/0TKUMHLuSw1VL7KGWmHxEFPrKbTIEUjxwzgbPMFsaJPesRGv9M0kd7P76KkQ=
X-Gm-Gg: AYBFou2vGrVyIltsWnJTjMeTACJsYGUMaSCU49UedoWeEDx7vtUecGsPQvSn152IeY7
	KCSU1JF7s7YX9ZQnT6fSWNFOnKGrLZ0SJr2Oq7IX5V8gSGixQXTb77kzt6UXL2EFVlYhoqHJV39
	2atfrmTB8HUUR4H7PeWgrIbByw/2M2dODYcaF878QFvQGWo4oV0ua3Hlu3A3hMgcZXR/AowEHHD
	JMkTZuC1NgirwSwlrGUD/KhTebq7JjuZ9flqdrhQ8QciNVhbdEjPq4nf068EdohipNUo5vn0QXH
	JE4M7ZxBag0n5GWYziIyv0U3e+2xAThUQO9G65h7UgB0BIpfBn25OM14xT67MXA4/JXoYcPEiXk
	K65PuzVXGDA6p0T+B4npS+hZGfsXJzuqv
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4086860a91.45.1791439958828;
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4086833a91.45.1791439958315;
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a23c82sm2882655a91.1.2026.10.07.23.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
Message-ID: <d57835a1-9a56-465c-946a-ff261d2df0e1@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:42:33 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
 <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX8c02Dl5Q7Qmj
 LVpCNOfCgYiplI6HIWXgitIztHBcqrLTeuAI8Q12vg+eBx5DHtKPYqlvgCyE7N4GrD+xlJKr2l3
 PFBKVG9dXLFAfM4b5bASMMrcblWlNbA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX+j8vSepCMquu
 ZEMMF5KtLrQZwAoO1zYs4ZMLkzM/WwnLNiZZw0xrNHZQkHLk5ol9hEaGjIbtv1vAthR1H10mVHG
 rjX2bwqG+5t4HUqcUVONVf2MLUEZ9ErSobq6mqK7lnZeaJi3JM1T6BoatQeWPkeqqybMCJ6+yBy
 48z9L7n5ZbkCuhUElVfmMQSrnw++xt6o+0OQ2xMvrYYRtePa449XG1iJG6f4hL1IMxuG5ClqYrb
 FJyIK+KGjeGQYySMclUqvDe/j9uCHue5fFqxeRWG2ZRup8tgc005l8mBwqCUr1N6wEovpBwtKYK
 MWA2q3hOrdOmlUuWZR7NQcvWhwm9CCaXnN1uo2BXLzuLVSpuXtPBQhozM/QnjkitLklA9FgQcB/
 hTrunLEgGWleAFtcYCEiCXID5Ph3PJrVLHH2Xb9SaqRHGG0r+BuCHRLM3U+mGw1fWPxrzBnL22Q
 lrU3jUwt8dlOexn8ONw==
X-Proofpoint-ORIG-GUID: 9D6AKE18HYzgN2_JDPAUC5LchGpzL0Am
X-Proofpoint-GUID: 9D6AKE18HYzgN2_JDPAUC5LchGpzL0Am
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73458 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0IlxrgZsFcjQ__LXY9EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/9/2026 12:27 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:41PM +0530, Kishore Batta wrote:
>> DDR training data captured during Sahara command mode needs to be
>> accessible to userspace so it can be persisted and reused on subsequent
>> boots. Currently, the training data is stored internally in the driver
>> but has no external visibility once the Sahara channel is torn down.
>>
>> Expose the captured DDR training data via a read-only binary sysfs
>> attribute on the MHI controller device:
>>
>> /sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data
>>
>> The sysfs read callback serves data directly from controller scoped storage
>> and protects access with the controller training data lock. The attribute
>> lifetime is tied to the controller device via devres, allowing the data to
>> remain readable after Sahara channel teardown and ensuring automatic
>> cleanup when controller device is removed.
>>
> If this training data is RO, then what is the use of exposing it to userspace?
>
> - Mani
The sysfs attribute is read-only because its purpose is to export the 
training data captured by the driver to userspace. Userspace reads and 
persists it as a serial number specific firmware file. During next boot, 
the Sahara driver loads that file through the firmware framework and 
transfers it back to the device. The data is therefore not written back 
through sysfs, making the attribute writable is unnecessary and would 
allow arbitrary data injection.
>> Userspace flow:
>> 1. For each controller device, userspace reads the ddr_training_data sysfs
>>     attribute.
>> 2. If the read returns non-zero data, userspace persists it using a
>>     serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
>> 3. On subsequent boots, the Sahara driver attempts to load this serial
>>     specific DDR training image before falling back to the default
>>     training image, restoring DDR calibration data and avoiding retraining.
>>
>> Add ABI documentation for the DDR training data sysfs attribute exposed by
>> Sahara MHI driver.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
>>   drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> @@ -0,0 +1,19 @@
>> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
>> +
>> +Date:                   March 2026
>> +
>> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
>> +
>> +Description:            Contains the DDR training data for the Qualcomm device
>> +                        connected. MHI driver populates different controller
>> +                        nodes for each device. The DDR training data is exposed
>> +                        to userspace to read and save the training data file to
>> +                        the filesystem. In the subsequent boot up of the device,
>> +                        the training data is restored from host to device
>> +                        optimizing the boot up time of the device.
>> +
>> +Usage:                  Example for reading DDR training data:
>> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
>> +
>> +Permissions:            The file permissions are set to 0444 allowing read
>> +                        access.
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 07bc743aa061dd2fa85638067d494562152474e3..72ac751c302a98448b5756c9feb438647bd0ce4b 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
>>   	return ct;
>>   }
>>   
>> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
>> +				      const struct bin_attribute *attr, char *buf,
>> +				      loff_t offset, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct sahara_cntrl_training_data *ct;
>> +	size_t available;
>> +
>> +	ct = sahara_cntrl_training_get(dev);
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
>> +static BIN_ATTR_RO(ddr_training_data, 0);
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
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
>> +	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
>> +	if (ret) {
>> +		dev_warn(&mhi_dev->dev,
>> +			 "Failed to create DDR training sysfs node (%d)\n", ret);
>> +		return;
>> +	}
>> +
>> +	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
>> +	if (!cookie) {
>> +		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
>> +		return;
>> +	}
>> +
>> +	devres_add(dev, cookie);
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	char *fw_path;
>> @@ -1131,6 +1191,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
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
