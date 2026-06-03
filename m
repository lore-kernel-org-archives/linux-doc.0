Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8013CAA3A
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 05:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465504; cv=none; b=LH+X+/vM0QhfuANpZzAkV2jDTq+U57RY9WwA9KS8DSJyS/34UCW8ttq27KvpbffsRDvBd+dn9b2cGIvslBwjrZ/AsVIkDRnTAMhn8qKLNkSBQEyv2QvYYz+AwVxRPrrFupskFJXe3NSJXxSpsugBYkQcfXha9IC3lBiii6JMn4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465504; c=relaxed/simple;
	bh=CTvSQbKtW8FpaJ7tHjCWQB0GUs6qdPLidJ/+54VFGyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdYSVhgoZ45cDg/VXnIrMiD78MVHA9zpbW0nV52EIaHj+FdKrJEngZfX45Bh8IhWfLSDl4rRKpNNFcFgmeLbee7aaN+7wjDqoVxGuDKdHRnb8VZXZicXNdIMcv/ueN7nKiVmi9GDhJE3c9Kv/mtoCJxnAWQMWZOO7rkiLmhRsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyd0xvc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcvAzrqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyd0xvc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcvAzrqv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6535WGhF752987
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 05:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jD4EFN8Ib2vXd/ldbSvARuiM8o4JnTecmLZxDIIYI3o=; b=nyd0xvc38qGbLOMG
	UfHnb4VdWUp5i29VrqUpHjKTi7OpdukBs4avraR0zi4jlw2chzcBnD5PDoI8DUOj
	WuayLgSxLQ13A8lEroReSxKimfdbUH2JJw8ZLAPm5r+oTsiiYNbMzCb+NaSIZSBd
	mGwFBGBDx/VLUvNMvQS7V8VdoyBFCvWV7oSo6qNnuZXwXAatlGOjhk237ZfMrCRc
	4Y5eOs4JXAgvZDmUWVArjXlHM1yfJfSBol0ciyAFguLOiGv2Hw/MUMcaJAVzTFzK
	lVvF1Y1fVS7LAx3R05M1uYRKt9m+fOQTzD1/BltriPzL4Qoaei9Q7yr5W9R8Gam6
	2JBdhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9htb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 05:45:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c3315d31so35630775ad.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 22:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780465501; x=1781070301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jD4EFN8Ib2vXd/ldbSvARuiM8o4JnTecmLZxDIIYI3o=;
        b=JcvAzrqv3O1COKTCtqXePUQWqWFpaVDoqXvu+MvD5R5tTcSaL+uPzQeE8kE70EDFtd
         IMuz4ne+ljZSIFhHHGwUkaZeqyyxSQ1sKqE9XgcrulsB+6ezlHRun6fZ+6X/p0Psx4f0
         7z50DpKGm2yrz/MZkIV7GDVDiHeGcDKz8aBj0QZg2fL5CtytjPXSdfWke69WbNeZr2sM
         rdY79+XbvLhYlVqt9sz3DMmEmGGCn/BbVFvfzXLatvERfPDzowh07SkZC5k3KgtftrKR
         VkEyrzaIn1dUjf3PKHWWsaHvL4gHAB/IRHcIXg1kmHW5HCKd6ewNPN4RhFgzcr6T1FsN
         pRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465501; x=1781070301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jD4EFN8Ib2vXd/ldbSvARuiM8o4JnTecmLZxDIIYI3o=;
        b=mJwtqN0M/SoZBtYIMY5vFXr7xnJus/t8itHdWoZCEu822sAKo6QDypSshKUVgWbfoN
         iF/wMgZ/RDm/edgWFYswzEtT5rU9EUKJhK0kumg8BfvaKiXsxbt+L/iCI9m5ygRlOpK+
         DHM+Hm33fg+QDX36NRGcjk9MSJ1YQ9rznVvBUFxYoI13UD90yI00+xuLk6H2eFQ9rBxC
         owgryno5KClweH7Ma5swkcxN7w8uB7MVqZiHl3h7hQqDNf0vyLiBdex12Pu6lUSVhgDD
         dOlYNbYJEh/8eZS57w37gyEkvClkeXyfVr7NizdVXqjlpHlnBwz/RWjFkTbCum9z+z5Y
         zBWw==
X-Forwarded-Encrypted: i=1; AFNElJ+cFNUhE8URsxXqLE2qKUHs2a4v7atLI7m66YSLZqZuf8mcHR9GLCH51d5BsPC9HUL0AT13Ywl9dyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDXtB3g6pQzAuHXUE+/T1usy80Rtnr94fbc+jAqYSJcG5f9MS
	b8GrPYjHic72UIypgzGinBbMmDckfzyICePMbW9nZB+UDpL8DjdX67AoHHGA1UizqK8yjtMpCxY
	T0JctgA8a9dt1N8gUXx1IhA9ymUcs9kVRl0rutr7C9ul41VySibGAhXag6wwCX5Q=
X-Gm-Gg: Acq92OHRXJyiLTwCN+8WLRRwuAzHlZnNwq7vD8ZJU9+L2Jm0VW3F+vhwoAK14Sr0/zM
	WfqZ0Yb2LaRCt+9gFTaz2oaBrSB7PgjfxfjcSRg43y5bB1UiHB7u2by76H6Koc45YLnT2YQABHW
	NtzH+ssp3/N4oFACYheMhFLY8GzKaLURLkf4Q+OvogEmlRStOYYuycgum6mnKmESAmqga4mVHJn
	AuDWVKBQzUm8yvcCLlSFzSoUIksKtdVdMCupYb2Wb36WY+fMWfXf+5m9xBTFqXnbkmrMRJQub4v
	8tasvkj2sQ2+ie0sMF004exk01fUaEvYi4yh2dD3Zm0/Lt1eT3mXxmZAeiHxLNka2ujYuLWpkCE
	Mdv26X9rGMX+G9PDbh/SekFjDEkHogEeylmEFghYBFDgozWGSbV76BMzylk7g
X-Received: by 2002:a17:903:19ef:b0:2c0:ca99:3d73 with SMTP id d9443c01a7336-2c163a28aa4mr20235925ad.8.1780465500692;
        Tue, 02 Jun 2026 22:45:00 -0700 (PDT)
X-Received: by 2002:a17:903:19ef:b0:2c0:ca99:3d73 with SMTP id d9443c01a7336-2c163a28aa4mr20235635ad.8.1780465500059;
        Tue, 02 Jun 2026 22:45:00 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm11366185ad.50.2026.06.02.22.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:44:59 -0700 (PDT)
Message-ID: <2e66a50b-f392-4ce3-89d2-997e9fef0e6b@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 11:14:50 +0530
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
 <sbktzorprxvo5625zkqwjgsaj723xtbsgzyypbnbgdbbxdgnnh@do5rprsx4oxr>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <sbktzorprxvo5625zkqwjgsaj723xtbsgzyypbnbgdbbxdgnnh@do5rprsx4oxr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: st5ax_7lTtUjjxNeKlwi-BEM1r1z9Fax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1MiBTYWx0ZWRfX6XjrTactWXn8
 Lszxei6+IXHrRGqEOz6F63jRRN07EP+bhADXVltk+d+7AkKT/onZi8YuhUVIUO44RaUw3MNksHV
 dQm3A7oYRaw5pzivMNfPfx2ewQiZZe1zl+3FRT8AiP0+iUEflSTR2m81La41y/1YCIHN+a+LTeY
 hvY6zbwhemGLMG8Eh8gipwzJ6T1fgvsNqD0jnBDjknggaqjgNY2BHR69n4j+/p5WRCYfnwMVmva
 ZfYN2+cuDYRl1EHtUhXKCVCCWq9+4vqKGSU3x0g7FzQZBibWcpNWCPFkyiQAm9nh/+GGb6Q5Y04
 PZnNmWfhycQKPpGbS39hMdiO452BPZWl79/KRCN7XvGdZA0w0xhnkzXDEusDcsB4w52/h1IFYQS
 4PxuEW9BaRhSrBLcmLalupSnQhVOSlyDk/Wo8mLQKLhgMPcd7ZqVTcCQJdsBjaHTK8+DCinDF2n
 xrboMtjbT1W/XCjliSQ==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1fbf5d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=njyYu5vTmptnp6f7sR4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: st5ax_7lTtUjjxNeKlwi-BEM1r1z9Fax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030052

On 20-05-2026 19:56, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:57AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce the QDA memory manager (qda_memory_manager) to track and
>> manage the IOMMU devices that back each compute context bank (CB).
>>
>> Each CB device registered on the qda-compute-cb bus is assigned a
>> unique ID via an XArray and wrapped in a qda_iommu_device descriptor
> 
> Why do you need an XArray? The number of devices is (more or less)
> fixed. You can use a normal array, allocated in the probe function after
> counting OF children nodes.
Normal array should be fine here, I'll check and remove this.>
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
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 143c9e4e789e..701fad5ffb50 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  qda-y := \
>>  	qda_cb.o \
>>  	qda_drv.o \
>> +	qda_memory_manager.o \
>>  	qda_rpmsg.o
>>  
>>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
>> index 77caf8438c67..6d540bb0ec7b 100644
>> --- a/drivers/accel/qda/qda_cb.c
>> +++ b/drivers/accel/qda/qda_cb.c
>> @@ -8,11 +8,42 @@
>>  #include <linux/slab.h>
>>  #include <drm/drm_print.h>
>>  #include "qda_drv.h"
>> +#include "qda_memory_manager.h"
>>  #include "qda_cb.h"
>>  
>> +static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev, u32 sid)
>> +{
>> +	struct qda_iommu_device *iommu_dev;
>> +	int rc;
>> +
>> +	drm_dbg_driver(&qdev->drm_dev, "Setting up CB device %s\n", dev_name(cb_dev));
>> +
>> +	iommu_dev = kzalloc_obj(*iommu_dev);
>> +	if (!iommu_dev)
>> +		return -ENOMEM;
>> +
>> +	iommu_dev->dev = cb_dev;
>> +	iommu_dev->qdev = qdev;
>> +	iommu_dev->sid = sid;
>> +
>> +	rc = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
>> +	if (rc) {
>> +		drm_err(&qdev->drm_dev, "Failed to register IOMMU device: %d\n", rc);
>> +		kfree(iommu_dev);
>> +		return rc;
>> +	}
>> +
>> +	dev_set_drvdata(cb_dev, iommu_dev);
>> +
>> +	drm_dbg_driver(&qdev->drm_dev, "CB device setup complete - SID: %u\n", sid);
>> +
>> +	return 0;
>> +}
>> +
>>  int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>>  {
>>  	struct device *cb_dev;
>> +	int ret;
>>  	u32 sid = 0;
>>  	char name[64];
>>  	struct qda_cb_dev *entry;
>> @@ -30,6 +61,13 @@ int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>>  		return PTR_ERR(cb_dev);
>>  	}
>>  
>> +	ret = qda_cb_setup_device(qdev, cb_dev, sid);
>> +	if (ret) {
>> +		drm_err(&qdev->drm_dev, "CB device setup failed: %d\n", ret);
>> +		device_unregister(cb_dev);
>> +		return ret;
>> +	}
>> +
>>  	entry = kzalloc_obj(*entry);
>>  	if (!entry) {
>>  		device_unregister(cb_dev);
>> @@ -80,6 +118,7 @@ int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
>>  void qda_destroy_cb_device(struct device *cb_dev)
>>  {
>>  	struct iommu_group *group;
>> +	struct qda_iommu_device *iommu_dev;
>>  
>>  	if (!cb_dev) {
>>  		pr_debug("qda: NULL CB device passed to destroy\n");
>> @@ -88,6 +127,14 @@ void qda_destroy_cb_device(struct device *cb_dev)
>>  
>>  	dev_dbg(cb_dev, "Destroying CB device %s\n", dev_name(cb_dev));
>>  
>> +	iommu_dev = dev_get_drvdata(cb_dev);
>> +	if (iommu_dev && iommu_dev->qdev && iommu_dev->qdev->iommu_mgr) {
>> +		dev_dbg(cb_dev, "Unregistering IOMMU device for %s\n",
>> +			dev_name(cb_dev));
>> +		qda_memory_manager_unregister_device(iommu_dev->qdev->iommu_mgr,
>> +						     iommu_dev);
>> +	}
>> +
>>  	group = iommu_group_get(cb_dev);
>>  	if (group) {
>>  		dev_dbg(cb_dev, "Removing %s from IOMMU group\n", dev_name(cb_dev));
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 6c20d6a2fc47..0ad5d9873d7e 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -57,6 +57,40 @@ struct qda_dev *qda_alloc_device(struct device *dev)
>>  	return qdev;
>>  }
>>  
>> +static void cleanup_memory_manager(struct qda_dev *qdev)
> 
> Prefixes...
ack>
>> +{
>> +	if (qdev->iommu_mgr) {
>> +		qda_memory_manager_exit(qdev->iommu_mgr);
>> +		kfree(qdev->iommu_mgr);
>> +		qdev->iommu_mgr = NULL;
>> +	}
>> +}
>> +
>> +static int init_memory_manager(struct qda_dev *qdev)
>> +{
>> +	qdev->iommu_mgr = kzalloc_obj(*qdev->iommu_mgr);
>> +	if (!qdev->iommu_mgr)
>> +		return -ENOMEM;
>> +
>> +	return qda_memory_manager_init(qdev->iommu_mgr);
>> +}
>> +
>> +void qda_deinit_device(struct qda_dev *qdev)
>> +{
>> +	cleanup_memory_manager(qdev);
> 
> Ugh, inline all your one-line wrappers.
ack>
>> +}
>> +
>> +int qda_init_device(struct qda_dev *qdev)
>> +{
>> +	int ret;
>> +
>> +	ret = init_memory_manager(qdev);
>> +	if (ret)
>> +		drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>>  void qda_unregister_device(struct qda_dev *qdev)
>>  {
>>  	drm_dev_unregister(&qdev->drm_dev);
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index 2715f378775d..eb089e586b17 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -13,6 +13,7 @@
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>> +#include "qda_memory_manager.h"
>>  
>>  /* Driver identification */
>>  #define QDA_DRIVER_NAME "qda"
>> @@ -40,6 +41,8 @@ struct qda_dev {
>>  	struct device *dev;
>>  	/** @cb_devs: Compute context-bank (CB) child devices */
>>  	struct list_head cb_devs;
>> +	/** @iommu_mgr: IOMMU/memory manager instance */
>> +	struct qda_memory_manager *iommu_mgr;
>>  	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
>>  	const char *dsp_name;
>>  };
>> @@ -59,6 +62,8 @@ static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
>>  struct qda_dev *qda_alloc_device(struct device *dev);
>>  
>>  /* Core device lifecycle */
>> +int qda_init_device(struct qda_dev *qdev);
>> +void qda_deinit_device(struct qda_dev *qdev);
>>  int qda_register_device(struct qda_dev *qdev);
>>  void qda_unregister_device(struct qda_dev *qdev);
>>  
>> diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
>> new file mode 100644
>> index 000000000000..00a9c0ae4224
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_memory_manager.c
>> @@ -0,0 +1,111 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +
>> +#include <linux/refcount.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/xarray.h>
>> +#include <drm/drm_file.h>
>> +#include "qda_drv.h"
>> +#include "qda_memory_manager.h"
>> +
>> +static void cleanup_all_memory_devices(struct qda_memory_manager *mem_mgr)
>> +{
>> +	unsigned long index;
>> +	void *entry;
>> +
>> +	pr_debug("qda: Starting cleanup of all memory devices\n");
> 
> pr_debug is a third way to debug. Stop it, please.
ack>
>> +
>> +	xa_for_each(&mem_mgr->device_xa, index, entry) {
>> +		struct qda_iommu_device *iommu_dev = entry;
>> +
>> +		pr_debug("qda: Cleaning up device id=%lu\n", index);
>> +
>> +		xa_erase(&mem_mgr->device_xa, index);
>> +		kfree(iommu_dev);
>> +	}
>> +
>> +	pr_debug("qda: Completed cleanup of all memory devices\n");
>> +}
>> +
> 

