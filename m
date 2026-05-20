Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1E73EA955
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287223; cv=none; b=ixL5RSZHje6AaeelGOd/DO/JVTETSsWTdlweJb086dbp182evD1VtVMqJmRj5ejZtyq6e88I+5QLWb6BmAM2QtLXuzfLQ+zXAfBGgZFfkvYu85Kjysqn6fXnmGx8LQVW0xj6zDmoVHASwgN0oTpcuWXK3zUf2N03QuQ/fbumB8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287223; c=relaxed/simple;
	bh=7Fb6Kp1p4YOXa1aH0+dExY2guUhnXJEbIbCjPr/eSkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0+TpUskBMU+rAhqHztU3NhBgEcYbFYKsM7gQKe+F1xAgUyBdKyy5bJ6zyOmmMvLxMauT5sNj3670sy9TgcA8nk/RKkNWrgB2fOwwrXg6YVVnKbutAfl0X/jFAcrlYEEvDhWH1it2oLnc/dZOnCu2asGI7HKMhEvgJB0TFymx/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH4BkxUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/HJlqu3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH4BkxUo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/HJlqu3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lfHN266960
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UVWE9cDv8dNKqJnEWb+COja9
	5369BrxIeUqGSeAbb1c=; b=nH4BkxUogTtNIAEqilLYHObEFJgMG/D/I6AWiKcL
	gT9NyuhjEGPJjace/hLozjlYcZwbwfFRV91CP0BVqIhyrSuMqAPCIZbA8DN4DmFf
	hPCU2ZDE10kkQJphfYXUm2hHwGa0fgb01ylh3m5ByFd7fO3pbFGfwg78Ei/yjEPx
	bEy7uXL7yQ4/2MmkCCp9OZCLGZw87F4k1zqBS7hN6HbS4XmsbpRN3vEAxPERoMfh
	kyFhQpagYlYoilMeAjBUkXjdv1eabc16L2No76klbeHFWzEMgpHjLZS52rLeiT3E
	83xZGGdUeH7D6rq+10rqZtA2QQj2bvO/QF2MgSdMzvgCqA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxs08s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:26:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575590529a0so10985739e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287219; x=1779892019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UVWE9cDv8dNKqJnEWb+COja95369BrxIeUqGSeAbb1c=;
        b=b/HJlqu3HYdcsEpF0htHl04r4/Q5p4PzqQpc45o30Q7wKz0tdlo0QC2J3UpRdDne02
         5lA7vgnLjAB2UbHkfrvig2C/xTUpeI+4VT0FtKw9OM6fj8KHKHyQOhpnqVWFPzYxK6gU
         6it1zmEhA6NJY+CSFrNUD3lqNEb2MOdJN18B0Yw+B4hHTAyhwsIiyPmbd/MBouWhKWk2
         pa8fImoDisVeWKqvvZH1G1V/bHdgFNzCiZEi/fipMGon7ljqJlSihoxRI9TUxKVW6R2/
         l0QMirOtJIBEE07aPqx+ow+mx71Rt4v3bVzxtCN2DVSLE5KWN6ESRP4WXHgujGQdR3Hy
         eOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287219; x=1779892019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVWE9cDv8dNKqJnEWb+COja95369BrxIeUqGSeAbb1c=;
        b=rM/pFKZ+Yhbs3911WkWbDZff1QjFrVmhY5oYrJrK0awqEHtQexU37MlJPLjJoJgGEB
         KNIVdhN2wIDLhoEp3GNAW4wyICHGsR8wOTFFRpzlNMHKfRNynN+aWUrMCRsP1F8GTjvR
         9bvav/GWmjYofd2tN5lqNuUcZJN1k9vwJKtgLNP3bp9ZKjKe9aIUzGeU5QgPX7Na09mA
         zF76s3einnPdLOqr4GmWWwrNi/qWMb2R7W/6dpSByaZChtfk49Iq0y41eyu88sNlCvxx
         pI056IRZbJYoOHwhMtkPeOUfBUYmOOCulZ0YgP8ss0RvptJHLqiMaHbialJ5E5702/o/
         C3Yw==
X-Forwarded-Encrypted: i=1; AFNElJ/gSvyjYv2UQKxfUkPexScOoyoce6IH8z1ZCj1qqILRkRROPCl69iBqBf4ST+tuBtN73k0oR/oWG+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6EBa8TP9xG2MoliGiq3fLcsVMGwVJscIlr9EIxVpfkD2dL52N
	212abeNhAqIgA+tw7Yqq2gJs9SrpNjYuLJ73UOaKfchWKsN/rvz+6SlEL/S0bYs+f8/s+vNY5y9
	sM1f+Kn76+lOtZelUrP9l4eCQJELtPVSYJvxt++/MA6cRjkasuIcBN0MUjLOyTQk=
X-Gm-Gg: Acq92OGCZEnGNVKlwH7YhOb3CbiitnW6QQ0k7R3HMoAUOiWH+5zwP8ZvzkkNdh9XzzO
	Tt56ySJh34vuvd/DO9L3zvAcn9v6rjPSOiLkt8pc819pGtxUa1lb6BkwGkvNWjUW4GezeAmq7aP
	eqHl+0fiC9AsrML6tq6M0qjefB0BBY/F7mwWce4VlKp+mL6RjLw9TcWC8MXQYXKnRmOASCU9dpN
	z2jqFSLVOrdE4tK0/8LYvXum5GaZBoE1WiEipsCEzDQXCWnEEtWy6wXim6R+/4ASRu4VTZ1625n
	6kl5hpUl8K/OnJsb1GrGpS3N6otN1ZlwqOf3LFoO4dE+E9RkI59/7SKuQp8ijMIK5/aO4mjRQ4D
	nv15VYwZDFO792P7dSDwWNWSLU1lpnFYr7/TPrg8RvPlI7ufTdo0DH9kH3Wv04IdC1glQlYlvGf
	xbSd0psHvGPKExyRcgOCo2ghX3mpND3X4KJeY=
X-Received: by 2002:a05:6122:4d0d:b0:56e:e80c:bb25 with SMTP id 71dfb90a1353d-5760c0a673cmr14617893e0c.13.1779287219063;
        Wed, 20 May 2026 07:26:59 -0700 (PDT)
X-Received: by 2002:a05:6122:4d0d:b0:56e:e80c:bb25 with SMTP id 71dfb90a1353d-5760c0a673cmr14617821e0c.13.1779287218313;
        Wed, 20 May 2026 07:26:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5a28sm4950743e87.61.2026.05.20.07.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:26:57 -0700 (PDT)
Date: Wed, 20 May 2026 17:26:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 07/15] accel/qda: Add memory manager for CB devices
Message-ID: <sbktzorprxvo5625zkqwjgsaj723xtbsgzyypbnbgdbbxdgnnh@do5rprsx4oxr>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-GUID: 96cDTEERyD74epbhQ87py2O4KuvYRMbT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MSBTYWx0ZWRfXziiPB84AOUWX
 J40E3v6Kgv6A1NFMbueFHXu/uOJNE/krXxhy1bhRNmNPqnv6ATXnWGPX1fenjCJ2/i9Fpidu5bj
 /AbV0UwCLAPbVBNkaiMgWL7VAR9B0eSK5Xlys2+elq87+yx7BSoAMLyXYygCZm7GAQYMJU63Urn
 gCG8XQzN8nDQAGPawfSfI1LUt1LoUpNkVra0MzgzydtHuA7pHxUpQzr7gmzR8IwZxt6H9uFhYH/
 vfdj0ahXTv7LUYZ0piDDpYXAlppNPkt6cbPbQqDExDko44PtEu5zKa0Hw0ADtOOZlaqCmNTBYeC
 Umlfl8UlhF616x9kf+3zem+NvROZrdgakzQ7rAuxbNr575uyOpKShYLKsNGvBzpuMcFUOEqlACm
 DGdkahTF0GaqAyx/LZH2Za6P2PclLAvPeqUub54ANOUIK8ZMlE4p5e7Q2l3PtS/aOa0ZsMYvQ3z
 ek1UcYbaM/BH45VRYAw==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dc4b3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=U7MGAyCTa2LO6tN26UQA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 96cDTEERyD74epbhQ87py2O4KuvYRMbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200141

On Tue, May 19, 2026 at 11:45:57AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce the QDA memory manager (qda_memory_manager) to track and
> manage the IOMMU devices that back each compute context bank (CB).
> 
> Each CB device registered on the qda-compute-cb bus is assigned a
> unique ID via an XArray and wrapped in a qda_iommu_device descriptor

Why do you need an XArray? The number of devices is (more or less)
fixed. You can use a normal array, allocated in the probe function after
counting OF children nodes.

> that records the device pointer and its stream ID. This registry
> allows the driver to look up the correct IOMMU domain for a given
> session when mapping DSP buffers.
> 
> The memory manager is initialised in qda_init_device() before CB
> devices are populated and torn down in qda_deinit_device() after they
> are destroyed, ensuring no dangling references remain in the XArray.
> 
> qda_cb.c is extended with qda_cb_setup_device(), which is called
> immediately after a CB device is registered on the bus. It allocates
> a qda_iommu_device, registers it with the memory manager, and stores
> it as the CB device's driver data so that qda_destroy_cb_device() can
> retrieve and unregister it during teardown.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  drivers/accel/qda/qda_cb.c             |  47 ++++++++++++++
>  drivers/accel/qda/qda_drv.c            |  34 ++++++++++
>  drivers/accel/qda/qda_drv.h            |   5 ++
>  drivers/accel/qda/qda_memory_manager.c | 111 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_memory_manager.h |  49 +++++++++++++++
>  drivers/accel/qda/qda_rpmsg.c          |   7 +++
>  7 files changed, 254 insertions(+)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 143c9e4e789e..701fad5ffb50 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_cb.o \
>  	qda_drv.o \
> +	qda_memory_manager.o \
>  	qda_rpmsg.o
>  
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
> index 77caf8438c67..6d540bb0ec7b 100644
> --- a/drivers/accel/qda/qda_cb.c
> +++ b/drivers/accel/qda/qda_cb.c
> @@ -8,11 +8,42 @@
>  #include <linux/slab.h>
>  #include <drm/drm_print.h>
>  #include "qda_drv.h"
> +#include "qda_memory_manager.h"
>  #include "qda_cb.h"
>  
> +static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev, u32 sid)
> +{
> +	struct qda_iommu_device *iommu_dev;
> +	int rc;
> +
> +	drm_dbg_driver(&qdev->drm_dev, "Setting up CB device %s\n", dev_name(cb_dev));
> +
> +	iommu_dev = kzalloc_obj(*iommu_dev);
> +	if (!iommu_dev)
> +		return -ENOMEM;
> +
> +	iommu_dev->dev = cb_dev;
> +	iommu_dev->qdev = qdev;
> +	iommu_dev->sid = sid;
> +
> +	rc = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
> +	if (rc) {
> +		drm_err(&qdev->drm_dev, "Failed to register IOMMU device: %d\n", rc);
> +		kfree(iommu_dev);
> +		return rc;
> +	}
> +
> +	dev_set_drvdata(cb_dev, iommu_dev);
> +
> +	drm_dbg_driver(&qdev->drm_dev, "CB device setup complete - SID: %u\n", sid);
> +
> +	return 0;
> +}
> +
>  int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>  {
>  	struct device *cb_dev;
> +	int ret;
>  	u32 sid = 0;
>  	char name[64];
>  	struct qda_cb_dev *entry;
> @@ -30,6 +61,13 @@ int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>  		return PTR_ERR(cb_dev);
>  	}
>  
> +	ret = qda_cb_setup_device(qdev, cb_dev, sid);
> +	if (ret) {
> +		drm_err(&qdev->drm_dev, "CB device setup failed: %d\n", ret);
> +		device_unregister(cb_dev);
> +		return ret;
> +	}
> +
>  	entry = kzalloc_obj(*entry);
>  	if (!entry) {
>  		device_unregister(cb_dev);
> @@ -80,6 +118,7 @@ int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
>  void qda_destroy_cb_device(struct device *cb_dev)
>  {
>  	struct iommu_group *group;
> +	struct qda_iommu_device *iommu_dev;
>  
>  	if (!cb_dev) {
>  		pr_debug("qda: NULL CB device passed to destroy\n");
> @@ -88,6 +127,14 @@ void qda_destroy_cb_device(struct device *cb_dev)
>  
>  	dev_dbg(cb_dev, "Destroying CB device %s\n", dev_name(cb_dev));
>  
> +	iommu_dev = dev_get_drvdata(cb_dev);
> +	if (iommu_dev && iommu_dev->qdev && iommu_dev->qdev->iommu_mgr) {
> +		dev_dbg(cb_dev, "Unregistering IOMMU device for %s\n",
> +			dev_name(cb_dev));
> +		qda_memory_manager_unregister_device(iommu_dev->qdev->iommu_mgr,
> +						     iommu_dev);
> +	}
> +
>  	group = iommu_group_get(cb_dev);
>  	if (group) {
>  		dev_dbg(cb_dev, "Removing %s from IOMMU group\n", dev_name(cb_dev));
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 6c20d6a2fc47..0ad5d9873d7e 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -57,6 +57,40 @@ struct qda_dev *qda_alloc_device(struct device *dev)
>  	return qdev;
>  }
>  
> +static void cleanup_memory_manager(struct qda_dev *qdev)

Prefixes...

> +{
> +	if (qdev->iommu_mgr) {
> +		qda_memory_manager_exit(qdev->iommu_mgr);
> +		kfree(qdev->iommu_mgr);
> +		qdev->iommu_mgr = NULL;
> +	}
> +}
> +
> +static int init_memory_manager(struct qda_dev *qdev)
> +{
> +	qdev->iommu_mgr = kzalloc_obj(*qdev->iommu_mgr);
> +	if (!qdev->iommu_mgr)
> +		return -ENOMEM;
> +
> +	return qda_memory_manager_init(qdev->iommu_mgr);
> +}
> +
> +void qda_deinit_device(struct qda_dev *qdev)
> +{
> +	cleanup_memory_manager(qdev);

Ugh, inline all your one-line wrappers.

> +}
> +
> +int qda_init_device(struct qda_dev *qdev)
> +{
> +	int ret;
> +
> +	ret = init_memory_manager(qdev);
> +	if (ret)
> +		drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
> +
> +	return ret;
> +}
> +
>  void qda_unregister_device(struct qda_dev *qdev)
>  {
>  	drm_dev_unregister(&qdev->drm_dev);
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index 2715f378775d..eb089e586b17 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -13,6 +13,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include "qda_memory_manager.h"
>  
>  /* Driver identification */
>  #define QDA_DRIVER_NAME "qda"
> @@ -40,6 +41,8 @@ struct qda_dev {
>  	struct device *dev;
>  	/** @cb_devs: Compute context-bank (CB) child devices */
>  	struct list_head cb_devs;
> +	/** @iommu_mgr: IOMMU/memory manager instance */
> +	struct qda_memory_manager *iommu_mgr;
>  	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
>  	const char *dsp_name;
>  };
> @@ -59,6 +62,8 @@ static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
>  struct qda_dev *qda_alloc_device(struct device *dev);
>  
>  /* Core device lifecycle */
> +int qda_init_device(struct qda_dev *qdev);
> +void qda_deinit_device(struct qda_dev *qdev);
>  int qda_register_device(struct qda_dev *qdev);
>  void qda_unregister_device(struct qda_dev *qdev);
>  
> diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
> new file mode 100644
> index 000000000000..00a9c0ae4224
> --- /dev/null
> +++ b/drivers/accel/qda/qda_memory_manager.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +
> +#include <linux/refcount.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/xarray.h>
> +#include <drm/drm_file.h>
> +#include "qda_drv.h"
> +#include "qda_memory_manager.h"
> +
> +static void cleanup_all_memory_devices(struct qda_memory_manager *mem_mgr)
> +{
> +	unsigned long index;
> +	void *entry;
> +
> +	pr_debug("qda: Starting cleanup of all memory devices\n");

pr_debug is a third way to debug. Stop it, please.

> +
> +	xa_for_each(&mem_mgr->device_xa, index, entry) {
> +		struct qda_iommu_device *iommu_dev = entry;
> +
> +		pr_debug("qda: Cleaning up device id=%lu\n", index);
> +
> +		xa_erase(&mem_mgr->device_xa, index);
> +		kfree(iommu_dev);
> +	}
> +
> +	pr_debug("qda: Completed cleanup of all memory devices\n");
> +}
> +

-- 
With best wishes
Dmitry
