Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6203942E8EA
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783952173; cv=none; b=kVNB04pKhGAoE9BkL5P7/1PMwKiJLZ0qfmS3Rcgcq6LriPEYN90zv0ETXiwJ+xwJBwg89t4FI4zj30l9n9+VdAmqkMi3Xngj97GxxPwmwLM/vms9XaVJQrCN68XBg2VLTL727N+BEv4nn/EI/RYWoD0Pz+hEzrh1Gv7zEnH9ITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783952173; c=relaxed/simple;
	bh=rjRRwXeoSvQ2Yt2kDuIXsZVmldbbQ93lhgFEVsggEBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzbLyY0zzyLIcnwmApJ75RRX/uqLXprZiIXwj58O9EeN/f0l7h8XbCMBEtJhcUqIKTv4zvXyXPazmcwLsddtUexHG053htqbbV+cR/8pzLjkTYbO67202BUkJ2H+mhQeLc+Td+KVrJ+dAPqwc5cK2ACXBhR7tfr0+T/48kbqCy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a89fZUTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdVI+wlZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a89fZUTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdVI+wlZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDv6W1428285
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 14:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=; b=a89fZUTKY0N0QfDn
	ltmn0X2fEeXWAMOmkV1ChSPUa4LS39VVSoRq/MX4HbD3qqM/PSJhF8PpwLaXSCa8
	o9nt5KCmu4pxH/m1eaEOoVi2fQ9Q9X2Kt7TTtdVbWz1ofkcMHyIdecFd/UW3j/Ak
	qqd0pgE1cnesSMa/qX/22P+8OfLKvnaLqAoWZqi0XhbhmKzjeDMWUWDZGmAagz75
	VlkBWRdyd5szxUzaEjlTba9l8CdVIuFjrbIYZS+ZbE2PXLX6aMTPY7RUq4ah5BSG
	R/pzV6uYg9lieDTYDjXTzL8sUm2HcMJCYuuayVxWkymPCXXUxbWBpiJ5QYGHGwvQ
	l4gJLA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn1fry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 14:16:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484739a9cbso4167964b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783952169; x=1784556969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=;
        b=WdVI+wlZDmaK3lyYN35qalo7WpnokSscPrKHRzP2Ves/cO/rqLduxuHsz+CJkVPRBk
         XTbZ+xsESfTpNnUSW3hw+eR3M1BPv+puC63J6/fcEFGypcDAU9zFVuBa29yy9zGi/gM9
         j5qMGZwtpGKaE2EGhiNwvEzVkcepbflHYTYG/4I00wzPrcZp3fsvPYnM9nb7snrzmCcY
         Zk/U/XoeVTsawBsNtMqm64PTaudMK6po4unWCtfYqU1bEVaL7RiLd5a1AwUWxrQbLZgO
         YU+knTaKDGpTzar56PdaK7bt2Oqvy75gX2xedsm/mjh/tmwD4rVgFlmVL1RbJafhjLxi
         QQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783952169; x=1784556969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=;
        b=sBBVT2QaXwl3gX/4R5o61sRjH6Q+RmJqZ5M1uhZ/BWTFHzYbsuu8VISUl3g14KG5RU
         yWp+i8JuckeAuDZGmqvYGhaxu265QBenPjNCl2/W7qfBf1VSJG9+uzccssWoCFZ/AXEA
         c39raNNPGtEzXmuBFM8/9gWj4/VKpKYSXhoklPDWp7JSDjKCJZEfA5Yu9avNMIfbEbRc
         ji9kzy2tNAmtj71ICWj2eVdRXLTvf2Bk3L+Oq2ipDaufEUJY0l8BzhE7/5y3qB6z44iK
         Jp6yen4m6MrtJroOy+SLNJps2u+RcMe9q3bNBkEg3Ca6cGGDpvS+6p3J7tSHpUGaexJh
         njRw==
X-Forwarded-Encrypted: i=1; AHgh+RpGNuFPM9MU1mBfVdMwOPSa7FLBDnhfVRm5vjiCbXSQ6lwvZlkcDOAbyW+Dkid+MD/pZf9Wz4WTnQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9NPTk+VNYsVOaTXc60fMZeIUFagc9SV46YioaugH1WUIMNYYt
	pj15CVx9gP12IxoDxEhBNA7PGOmlc9yyFX2UFhj12d/6KgOxZYRBw7rEt7KeiishxOwuKodZmxW
	jsNt1rl2j0JuZbO+gspyLVTPB7SgPrgrEAqk26m7ucvyDxGArTq+f8gxCTOskETkfigf2j8U=
X-Gm-Gg: AfdE7cn3DT7llXlpsIIGmdv19UMMu3CZCf+0YhRmuH1cno8KTH4P+i+ix8bUCaGuPJq
	NUI36ji2wTiwqD/iNZU3xq/yB7/h/3V5ebKrFaUntIPBQ45SOQ794rQFKYveHJo2dpLIrSmd/+f
	i3qZHiiHxO1FqpB8wugXv0bEgow1Tn3wTrrsAb1KdvJ3TicZq/GvAO7m3nKLj4BRRqZuqJslJXD
	32CNp6TT7MmRLWxFtmnY5dilcmWilveZy7NFLBMqMfACUeGKH/dVzRkqsi1VCpLeST5s8mZgXiP
	qeeRzWmeygOENCyeirXO25Bjs96jTi8aLaNV1++TZycKYWlzozbwAVInJX1dssRRrVTultdc+e9
	wuRrKGEacok0u9oDS2td/98ZkaW4wSw90je9JW5AD8GWI
X-Received: by 2002:a05:6a00:1c99:b0:848:2ef5:50dd with SMTP id d2e1a72fcca58-8488ad09145mr7755448b3a.37.1783952169273;
        Mon, 13 Jul 2026 07:16:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c99:b0:848:2ef5:50dd with SMTP id d2e1a72fcca58-8488ad09145mr7755409b3a.37.1783952168780;
        Mon, 13 Jul 2026 07:16:08 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a49591cbdsm452482b3a.40.2026.07.13.07.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:16:07 -0700 (PDT)
Message-ID: <21867efc-b5a8-4ed9-92b4-059a020731a6@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 19:46:02 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
 <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AGttqinJySJKHFclURRZf8XDTMsFrUEL
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54f32a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ggBkse9BzyKxnYN-cX8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE0NyBTYWx0ZWRfX6W7BD6qB/OKc
 YzXABQuWo+vYL3Q6zDuTKm6J7PwXE8mTXiNoGFb74Er6tvaMeu8Kpiu+4tGtP/X8AuSu/1OSEc/
 B5KWZm5zNEFKtdYroc6q6Qli/rzHRRA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE0NyBTYWx0ZWRfX2WRdwSrzxpe4
 0J5JfVFqtYfmy62rpW3Uwi5RgZ6cgvNLJGjy7ZQjqvnZ8Lu7S83LZeqDORBZwIZ+NFTqYajPNX5
 e+wFmwtL1ayz50s4VGUvPKrxHXrKHdF/wuIKGTQW41DlvhuoVqBF4i1jkqGAIWeJIf6u95WO1gA
 /p64/iJRuCeS4nPl3881Ro4RB8NlYrJ9XWvxhcWGYL3ku0gV9vV6uAhdKa2AL30LjcW8qi/sQfa
 jplWuuDXEGZcCPIWIZIOuDV40MXg7ZFN6rJT8vapYeVFJVebkQfCIfJeINEP3lCBopiG83vAC0X
 Wi8HPg3t37JHcP7tKeu03VlbBLxD+KUg4YVw+khrz7EUTiMKCCxQQRSxOZWi2BQfjK1GtgMX0Gt
 qVqp8GrFrFFeL8quIkPPuUj4sSP4ApVbHSbB8S/lPiqrf64bj40MqcvxpuSIScctffFd91L4Pgf
 ouigBSjPelZRZOhm4eA==
X-Proofpoint-GUID: AGttqinJySJKHFclURRZf8XDTMsFrUEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130147


On 7/9/2026 11:49 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:38PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects a firmware image table based on the
>> attached device, but it does not recognize QDU100 devices that expose the
>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>> QDU100 devices with the correct firmware namespace during image transfer.
>>
>> Extend the probe time variant selection to match the SAHARA MHI channel and
>> associate it with the QDU100 firmware folder. Add a firmware lookup
>> fallback for cases where an image does not have an explicit entry in the
>> device's firmware table. This allows required images to be provisioned by
>> the platform.
>>
>> This change only affects devices matched on the SAHARA MHI channel and
>> does not change behavior for existing AIC100 and AIC200 devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
>>   drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
>>   2 files changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
>>   
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>> +	char *fw_path;
>>   	int ret;
>>   
>>   	if (image_id == context->active_image_id)
>> @@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   	}
>>   
>>   	if (image_id >= context->table_size || !context->image_table[image_id]) {
>> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
>> -		return -EINVAL;
>> +		if (!context->fw_folder) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"Request for unknown image: %u (no fw folder)\n", image_id);
>> +			return -EINVAL;
>> +		}
>> +
>> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
>> +				    context->fw_folder, image_id);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +		if (ret) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"request for unknown image: %d\n", image_id);
>> +			return -EINVAL;
>> +		}
>> +		context->active_image_id = image_id;
>> +		return 0;
>>   	}
>>   
>>   	/*
>> @@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   
>>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>>   	{ .chan = "QAIC_SAHARA", },
>> +	{ .chan = "SAHARA"},
>>   	{},
>>   };
>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>   
> This change should belong to a separate patch.
>
>>   static struct mhi_driver sahara_mhi_driver = {
>>   	.id_table = sahara_mhi_match_table,
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 391ab146f501c6ce1c81f6138f7c491a49c2f264..82e41632afc555a53dec3d8395558ae039b33bbd 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -300,6 +300,43 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>   	.reset_on_remove = true,
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
>> +
>> +static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
>> +	.image_table = qdu100_image_table,
>> +	.table_size = ARRAY_SIZE(qdu100_image_table),
>> +	.fw_folder = "qdu100",
>> +	.non_streaming = false,
>> +};
>> +
>>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
>>   	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 2048, 1),
>>   	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 2048, 2),
>> @@ -1399,6 +1436,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   
>>   	pci_set_drvdata(pdev, mhi_pdev);
>>   
>> +	/*
>> +	 * Provide Sahara firmware mapping. Sahara consumes it via
>> +	 * mhi_dev->mhi_cntrl->sahara_fw at probe time.
>> +	 */
>> +	if (info == &mhi_qcom_qdu100_info ||
>> +	    (info->name && !strcmp(info->name, "qcom-qdu100")))
>> +		mhi_cntrl->sahara_fw = &qdu100_sahara_fw;
>> +
> Why are you adding QAIC MHI controller config in pci_generic driver? This driver
> only handles Modem devices.
>
> - Mani


Hi Mani, Above one is for QDU100 device. QAIC is not added in this file.

>
