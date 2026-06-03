Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2539438B131
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 05:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465608; cv=none; b=tv0nX7B3UjJnOLt0aeD5SzIH9c0vMRy8t79B+7LnQk05FEpSCYby+DV3Htwv29vY473vhDMe+jGbqmdjXYQU1eNZKYBn4DW9eDbBvhxpc+n9dtYNpfzIkSKU14vB/GrFZ3/5ZUhM+RxaNgmd8BR9JkVo02H6Vzz+0fauRoMZoZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465608; c=relaxed/simple;
	bh=0YcqXif0Sc0+zfmEVlu6cC7JsndqG3qCjJYzOwNGScc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4O5Ceeze4sZlcBUibfYjtPsNKySv0oq83jVgpjM/tFyYzbaPT+sPBLpH2G4wSYZPPNU3YoTBrxnW0cT0PajmY4fOVSBS8rs2fs4nQI8NlQhhWvyIG7lk/M8QYOBeqBcRqrI1OMjReoN7226/S3t3VdJwG0wI0ioFgsPKYSCjPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8j4zNtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTdz3UQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8j4zNtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTdz3UQq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6535WQ6E1077593
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 05:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=; b=l8j4zNtbaNo9Nw2A
	dI861FKta50sP94zsAFz9s/HbxVQJGYtbZTU2VKRrawcVwcmjArJCbq0vLiB7uko
	TqsWqSXPjhAYWSPF5mi1LZCU65HiO7bA10vMCnENN5ctlYxx742kBHkKvrWgFODQ
	X5Xw8JTjr/cBAoH7UvLA1+rBgO2rLZEQFrVs/NTqTgbLtYeXyEGSwvdywLjO90QK
	rUZBHOjPcSqFNwUow8/nseSuP41yZlhym007DBINCXH8wwdLwLK+IlmzKZFXcDYy
	LvqTBWpN4jSXiXqGARQS11F5LpoA+bicR5UPgRXZ7kF47zWEJkUo0G+erkD7mDGJ
	QqVu7g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw0bmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 05:46:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d99629fd6so5327751a91.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 22:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780465605; x=1781070405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=;
        b=KTdz3UQqOZZUWyJfULYlihRQUhjWBks9I5j0vQ27NfJoMePkLvlGreIJ1u1gC/pCEc
         u7Ff7kPQ+qpMKVM3t8ND8QZHORwViN9U19BdIi5oaGPZy7bTt6N6/da3M7sG+pRbx8Z7
         6+mRvWxAprKpy2FO/P7aqQydxosOEPNJseEZr9e9r2cgXZR1XoL5sl17z0DxjKZwtx0o
         qJG+vGyHHoiGIRYQvX/kCbyRAz7crsWvSzTGpZoCZWP5bAfOTFuErcD3YYgQo447ZMEg
         bV2yA60tiPQygZLSFMF6pcIQ4Vw6Nmt+7KL+ILgmIkN1h3T/bs3C9kbpO+vGgi+UDzIk
         H1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465605; x=1781070405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=;
        b=QiaaZGIYWRbZK2O0DVkqoAnbLeM/3wBAGMKg9yOYC2Rlv4EthrkuJjVs/9dQI1jm1X
         C1cApLHK98pumJlniijM98A1uA7c/bP46EtTe5yujcPLDg3YLzTBIpRGsabQISLiIZs5
         gT7XmynNP6nPtMc6aO2VIZqkvMOU34419GY0LoO/v++IPbJxsEieytKCc4wo5mOLp/GX
         IxZjGSBaz8c3kuSs9wRVfI/JO148yqxUSTdYZbXrM7dh6zH6KzJ1foQ3sw7b2hKioAS1
         j4KpQd3Ilpb6Uiss7wjMwfuStMAZF0/pTK/DxortF4E4I5gLRTWOlk/8ZzBbYhTAivUO
         vHxA==
X-Forwarded-Encrypted: i=1; AFNElJ/gItUuEM/ipQ0pcXY0S+CQ75mxEdjnFmVeu0CZahSbhoXGgBjKGy38XiMrduGsweZcmdC0h0ZAH6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAFBRoNS+mCy3XysnInQNeSBz7sf6HajHE80BfONr4I9wI2Zhx
	SdFeTz8VagbQoEZ4kFl+omsA+3JFElnomxs2x0TasmVcdyY6Ks5DS3tF0PrEJUTgh9ciPPI9RJZ
	s6DM9VPokM/fAP3vswgUfAei7t9P/+uZucvtyp3MZEn2J33qETwtFKtX+ncmoAsh1uxwndgI=
X-Gm-Gg: Acq92OFKpmd9AhbEx/RD1GC1pOrOO0D5xXtSqoEbxbC0YenmGPZ520Q8it6tKdnP4Ut
	SbmPf0Df5cw6Vqv6J2/dTIqZP3M0/ome3xWFoSD/bAKTJ1VJT3zYgJhWQzYyWf3CUrTxz/15dDD
	l/uvXsA2FC/backu0MHkjc64+EGLAqKRUSBpUGJWh8rb7RRolRTAN0En03Ciq6KBtJAc9QUSe7N
	TxACTpvmZDfCCKCY7Tgqe5YNODxauoYwE8sMuC6wDtWWuQQIxBDLMjsGhnb1LDQeL+Z4cMQvd0I
	i2A6Qvq6BkAkJ1yL0BVsqnfwRlkj8Th2SGuLriIjGVTCq8kBGfkUVm5beL4OjKelkKzV9tk/3+l
	e3tcD05ZSBWi+u8NAtWzxYvCYgzvH1f+xQ6L86eHCjthbOklW0DI0rs0VzMOa
X-Received: by 2002:a17:90b:3a90:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36e33bb9354mr1974862a91.18.1780465604756;
        Tue, 02 Jun 2026 22:46:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3a90:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36e33bb9354mr1974830a91.18.1780465604223;
        Tue, 02 Jun 2026 22:46:44 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ca4dsm10999325ad.76.2026.06.02.22.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:46:43 -0700 (PDT)
Message-ID: <f146f972-6508-4147-86f1-2b88c80e1c89@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 11:16:35 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] accel/qda: Add memory manager for CB devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
 <a6n2qquynwzlquzqmnmjmkg6vkrldj42muuejwzln5wna2qmhi@ki2slzuyt5qw>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a6n2qquynwzlquzqmnmjmkg6vkrldj42muuejwzln5wna2qmhi@ki2slzuyt5qw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wJvG02yodZp0OYbHTX_BknABaoTtvcBG
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1fbfc5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LzV4jstc-Az_XmsxRYMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1MyBTYWx0ZWRfX1Q/nka9utKwI
 04fIx0UukkmIWuwVEbWsDfHZ61D7RfmwvZEt8M+lCIn4WoFTu+WgUKt3AZCGohj/shH+PTG8866
 9pMVQjZGeP2vFETrpp6dE58OJFJ160f4VaQkqbu046huqw1E+lb59niyuQ0yMOiSPBRJx9buLVd
 Do7vCCYjbOnUQSc10ey9nTDa5djpzDMbnlgiswWgJSu3gIwbozF2r1Q/foDn8OclvnHfVh9hMMi
 OaE0IXcC1V3ppcswLOMFTduMi5VrBAF/XmL41NDlPAdiVSiwgMEzL0qLrm58oqAc8wSNMSTUJmi
 TTRP39IKL5sAu8Xnx7VDhhAs2LJbncCtVFoAzPzFdWpEGacYhOjdNGUQ5oekzaJ7Ge2Gf0OQlf9
 yGB7GTUZW/bHhRyt4r2PGc9VZ5aMN8qjQM3utdz7KyRGleu6Gej03NnQqtrjKccjejGWoZa+Iqr
 4zpnsBZR0lK0nqLMjCw==
X-Proofpoint-GUID: wJvG02yodZp0OYbHTX_BknABaoTtvcBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030053

On 20-05-2026 19:57, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:57AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce the QDA memory manager (qda_memory_manager) to track and
>> manage the IOMMU devices that back each compute context bank (CB).
>>
>> Each CB device registered on the qda-compute-cb bus is assigned a
>> unique ID via an XArray and wrapped in a qda_iommu_device descriptor
>> that records the device pointer and its stream ID. This registry
>> allows the driver to look up the correct IOMMU domain for a given
>> session when mapping DSP buffers.
>>
>> The memory manager is initialised in qda_init_device() before CB
>> devices are populated and torn down in qda_deinit_device() after they
>> are destroyed, ensuring no dangling references remain in the XArray.
>>
>> qda_cb.c is extended with qda_cb_setup_device(), which is called
>> immediately after a CB device is registered on the bus. It allocates
>> a qda_iommu_device, registers it with the memory manager, and stores
>> it as the CB device's driver data so that qda_destroy_cb_device() can
>> retrieve and unregister it during teardown.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile             |   1 +
>>  drivers/accel/qda/qda_cb.c             |  47 ++++++++++++++
>>  drivers/accel/qda/qda_drv.c            |  34 ++++++++++
>>  drivers/accel/qda/qda_drv.h            |   5 ++
>>  drivers/accel/qda/qda_memory_manager.c | 111 +++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_memory_manager.h |  49 +++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c          |   7 +++
>>  7 files changed, 254 insertions(+)
>>
>> @@ -61,14 +62,20 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	}
>>  	qdev->dsp_name = label;
>>  
>> +	ret = qda_init_device(qdev);
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
>>  	if (ret) {
>>  		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
>> +		qda_deinit_device(qdev);
>>  		return ret;
>>  	}
>>  
>>  	ret = qda_register_device(qdev);
>>  	if (ret) {
>> +		qda_deinit_device(qdev);
>>  		qda_cb_unpopulate(qdev);
> 
> No, this is not how you unwind in the error case in the kernel. Follow
> the established patterns.
Okay, I see your point and the same you highlighted on previous patch.
I'll update this.>
>>  		return ret;
>>  	}
>>
>> -- 
>> 2.34.1
>>
>>
> 

