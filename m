Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411723D1CA5
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902196; cv=none; b=hpcAs3wfsYo1jLcmMBAK0cCXIQE1iWSNPTRuXjbSkcfdwLmRqlzFHo6SZlbmgIG3yYu3GppdEPkBXv8BC8zZe4UMGii1dpGoaWcFA1ZKZdT/gKBjE4pWUTJe9CT6hRrsQ/AdJ/LAttGf5ztj7OdOAJxtbaAu3Hqd5Rhk/18zc+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902196; c=relaxed/simple;
	bh=AFBuZF9+MK6MOBrXljGd2j9MG1qbHJ+p1ga5zd6y3rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjQ4Sczgk1wKsrhfcpdOLaVo0SNJU8UKiwIvuEVd+QljSXVLKDi65fN3PySsIUEWxdfghJ+doO+WRK7Ua6Yq3oEAclQ4Mjhl1lEnX3zFE3VdAKTED9Pn7mSLpFs1QzbEHKWlzQ0xbsis4ofermhbBdl7rYMvm90auKpdwNbbfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xjv5oH18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da20vxMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xjv5oH18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da20vxMJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8nPD683610
	for <linux-doc@vger.kernel.org>; Wed, 1 Jul 2026 10:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=; b=Xjv5oH186eURa32i
	pv60++cqYka6A4+MLPNPZRWttiWo+5Uw2mVC44ibCjKYpdE0dW8g70mIx8/qk8gl
	G5zuZ49wxkH2HZmrNyKCN3vwBb8lFzGDz5jBklbIOFRrb7S6FJ+qAwkSvxiAiqc4
	QqUpem95ahLLmmqKjQHeYDkK9NkTi6IhynEpP1U5H4IySL6+zee/d2xxxT26ub1I
	LxhvIFr39vOOk171cF4ljxL8981ABXnArN2jjqza5A6ApZl4dYJ5kNCtJDsRsQ3/
	uomUn8l+wyrN13QziaD+IjncZ0ruKigT/S1KPDRXFxYcmn9Ri4AWG0NZ1GlBAqY/
	oyChAQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqks12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 10:36:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8479b45ad08so520894b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902193; x=1783506993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=;
        b=Da20vxMJfIiOuakRTJClKmVWEAeNrBFyikKEAkkPWB1e5O4GhZXgWDneiurGqWV45O
         2KiDzWiWbzWXb/aOd7c9L4Cve78qhcKyYJUNZgiKJnPF4BMAEftdljS08RIvsY3yIgfe
         7QXNOzzGHXolVTi5M6jAzwngOZ/KOHN72v106y2Mkj2qrMAf02jHvR0EP3zMnS+PVNIS
         dVYYPYVxOI4Nm+PhE0idOi9npBWvoflzqGX5dK7UMb9zJR11cSI/tWhkMMF0rPdyNsTL
         oYxyStxZTtdZQKowB3lKZrLhOAG1oWDnXy9YGy35xys+klEI8PbdneezN4bttsBJaYEX
         igzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902193; x=1783506993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=;
        b=ikkfTsa3Qn5U7MDeRLNeudMBcxp5sD1H7gMa3GaPg93bF2gENG/6TXUP0Lw8Z61mYG
         buGcfNBBZw9UV1GdBjIRSNp9h2tQrD9DJU+OCXbQB0/zhmpXvcVwFvoyPl1m2P2OhlMD
         4wKwmeUFMRRktyv1Yahcd7q9XA8cGm3+DO6s/yQAYFHj98XVJ0j35X20WfhVllTAM8S7
         QRhFH5ta3U/ls62aCFGipBLUxNNWkjD9NWApdTTina+pt0MVrEbQR+JEJ+nLrcdNySjD
         wJKgoIxYRAVLT27c0qwskgYLb1bAzouTTjDZ0XGvN9Uhuk73VxALIiHXXbGdisgDJcXX
         AHeg==
X-Forwarded-Encrypted: i=1; AHgh+RpfWsld16/qf3shPzdCEJ1x2eXk+kursLIQfb7n3LvihGP2I+O9bcP16PKg6ACEUKfh6EpYE2x9a5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSHEbrBbS9VEMTg5tmDKH+5fRufvrgzedC7sBNSIWyTM5TyDeF
	4Ni9Jp9SwWwyWsKKiG33WfGVFzv1K90laCtzUMBR9UH68SBBF279s9PgdYWd+urci9vRHsH269F
	3cG4ZvBx+7Hc6CZ07sFFq9Ru13KXJS+9/i4tZt8SB6nI45stquzthjFYmxPuHl4Q=
X-Gm-Gg: AfdE7cke5OzijC67XtHPP92XhsX+ZCyOKRNhHMog8cVp6ImXnAaiODmJOkrf3CyuLTp
	qaOD4lVuRF4HprJyxQkpG8Y+aIXTHyJ0qNyJymti3WN0pSou4+R564iPeF1MFhLQPeWcMEK75sR
	aFuOWbcewRcLkrBWjEE/E5irONvojQA62y0WXIhg5BsmwJdCbfpTG+yc3Mk6yz+kvQ87B1iFPhF
	fLA0J8gtBzgR92BXph8hPa/S0A7pg3zIiVnW/00WI1sYQmfphQDF+ikLUtb07Y1AlhNh8nQoVub
	UeDZq86XSWDg4xjovOu4DEXyfCX46YVjNvZrSjl6F3+RrnFskMBHo8mbYEXhPpIMYu4CVqbegCB
	C/8d9eFnrGg5+aCUH3nWT8bFGpb+93JetT54qFQaScgU=
X-Received: by 2002:a05:6a00:1a88:b0:847:8625:f7bb with SMTP id d2e1a72fcca58-847c09f1bd2mr873353b3a.60.1782902192724;
        Wed, 01 Jul 2026 03:36:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a88:b0:847:8625:f7bb with SMTP id d2e1a72fcca58-847c09f1bd2mr873321b3a.60.1782902192198;
        Wed, 01 Jul 2026 03:36:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa4f0sm3803736b3a.19.2026.07.01.03.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:36:31 -0700 (PDT)
Message-ID: <6a40311b-8f3d-4bcc-a3d7-98022ad119eb@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:06:26 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
 <20260416-sahara_protocol_new_v2-v5-7-6aebf005e4ba@oss.qualcomm.com>
 <x732txb6wf2giiv22xw66sqrnkjluaua5kbsmjugv4rbvpjqrw@ro2wbv2olzbd>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <x732txb6wf2giiv22xw66sqrnkjluaua5kbsmjugv4rbvpjqrw@ro2wbv2olzbd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N5452wLr2zSMnUBlE8363Vrxn6BdnY21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX4Hhg48k9327G
 //h6GVnaXzdEtlKwkttpprSRkHxhVLh9WKEbNBdwc896Ctfbx6vcGB1Cu1T0lSbJYS48wxd+lDs
 l9+Hz2AF6IkX86QaJW/zvvBB5bvnu5ijFW6o0PwxlnwpSmIQiF8AFsEgK/FghR2XlwwkATUa2sQ
 xL+lgLcoYWL7sn/gbk/hEuzEnCVLNpeUfK7EGnWngHECQl8zhJczFXHHJ3IZTN9QZOHJk3qUyke
 kEKJdnyBSlHuarQtxCpKPt8dIJ2BYrZ/0HVipzOa/rN3bzIT6qO2CPfM5AV6Ztel2usrFVoZLx1
 YpBIlaognsmOn5FMR4rVAbmW5gcVI7RFUu7prDmTy1yq8KNnQDA3PvzDuKCF91w7/KxDvm+8buQ
 sy6Va/uBFtSE2c5YUIdgVjxjy20eYmQmR0hAyresqdwlm5Y/Pnu9e7S4NObhL04pYJo2xDJIhqK
 jfRRPlFPhcfE8dHPVhg==
X-Proofpoint-GUID: N5452wLr2zSMnUBlE8363Vrxn6BdnY21
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44edb1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=n9NIK8s-xoBB9Vmc4qAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX9Mi8JmrZw3s1
 jvhAE/TC9tVZW9YJJ9wuEsGJN9q1+2sNdeMp9mD+tvy6bWT16NuJgAZTmR7IP+55z0lzWMyIFr4
 H/YSYLBfq+eWXjqG06mnAwy2CDm6MTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010110


On 5/12/2026 7:49 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 16, 2026 at 07:39:48PM +0530, Kishore Batta wrote:
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
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 ++++++
>>   drivers/bus/mhi/host/clients/sahara/sahara.c       | 69 ++++++++++++++++++++++
>>   2 files changed, 88 insertions(+)
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
>> index 07bc743aa061dd2fa85638067d494562152474e3..fef5dc1d8884133397d204f23361584fd1d9b075 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -273,6 +273,73 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
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
>> +
>> +static const struct bin_attribute ddr_training_data_attr = {
>> +	.attr = {
>> +		.name = "ddr_training_data",
>> +		.mode = 0444,
>> +	},
>> +	.read = ddr_training_data_read,
>> +};
> You can simplify the attribute creation with BIN_ATTR_RO().
ACK. Will use BIN_ATTR_RO() in v6 patch series.
>
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
> So you are expecting this helper to be called mutiple times without teardown?
>
> - Mani
Yes. This helper can be invoked multiple times for the same controller 
device without a full teardown. In this case, Sahara probe can be 
re-entered across events like subsystem restart/warm resets, while 
underlying controller device(mhi_cntrl->mhi_dev->dev) persists and is 
not re-created. Since this sysfs node is associated with the controller 
device (not a single probe instance), it should only be created once per 
controller lifetime. The devres_find() check is used to make the helper 
idempotent and avoid duplicate sysfs creation when probe path is 
re-entered. The sysfs lifetime is intentionally tied to the controller 
device, so it is only removed when the device itself is released.
