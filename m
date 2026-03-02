Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1738A73E
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442434; cv=none; b=b7RdeA2CXJ8MssSi5b5iamQDPlD826b5ny2Nw8RcmBwEi9SOPVs0l+kS/D/gRTlzo0N77kVwTCg6StUqumFHCMaA0THiuRF/aGNawyKWd7Kgl1x+QnEyOEE9FLbgo9LzVF3seL7e1juUGDJhT2XpoMW4fLVDo3T0IJdNhPm1JOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442434; c=relaxed/simple;
	bh=3DYGcwhIywuMuVcxgzn8mDrQQkH6d0xAwzusa7ndpj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mjt3PxADjyILAZwF2P1UGV1Heotebvpyleth7WBBBbyB9DQG7HzeASqfyxIlQmakb834b1KeutzwURh9tMS+ONfvl0WgsKKrAHKAUCQ71O2FaTn2XQsOt7kzE4aFyyi9KNtvkoCWDGhqDSCa7ZRgwyHA9VadyqP75RfUUOc7l90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxEzbdGC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2ODREPI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxEzbdGC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2ODREPI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228HAw0352152
	for <linux-doc@vger.kernel.org>; Mon, 2 Mar 2026 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=; b=KxEzbdGCs4hAdRn4
	vsYCcuDDN+XEaSmt5f3FIsF1ze23z72sfGKzX+E92H/HfsKiVVmq/fDrNZZ03m0s
	x8JmTmx60LFfn7HIQ5BxWKFfp3cYkt1aE/B5hfHfFF3eIPQVtMV/uN9Sejb55VV8
	2JYNilAlhSQHpf8WrYvjxrhsYehGM3CQdd/QbHNDMe482Btm2Uz+Uxm2EbenrDgi
	ngK93U9CD2xEggZoMGI9bD4i9FSYZHe2Uqbxok9z4zKS0vKCBqXBFZXnMnoS2z1j
	A8fQNOLa5d92YUwXaADpaAOnk5QDWtx96q2gHnq52vUcKlAnLz8kwAL9phBi4JJz
	05OKyQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw649myn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 09:07:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so23077543a91.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 01:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442431; x=1773047231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=;
        b=D2ODREPIo6qKqFkMeSU/Akf2zUta1zaAol2n06vUx7ere+I5T51OeytI2wab+wTcs0
         wFolGR5eTtDY3hfCSQlZUVjgE/lGjdnn72AGTjdsFVXRimoLiz22pIu+y/aujWOZ+XM/
         98QvphuHJc3EyGsE0r00XX/WCWugjrKzw/TV20WFCiIygc+kOcnUHGV/NePWFI73WM4W
         habx5exFmUkCeJkpgRN3Vs6nQITouflQVsfvGwDOyfgcnjbHmpaoSCgtytwvKujP0jHt
         DDKSzmH4/7rPpXKSo6UsDkcgZQfRdnWEse/GTHBvqeJJdAKV0bBRzVrTbJdn+vGUmpjl
         dbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442431; x=1773047231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=;
        b=VLQ7NXD1X6QTiAlPk4ItXLb9bPTOgmmoGrrV7I0JGADKReyJ4kzkgMgnOuUdW488q9
         8dTMxSuAYfKShyTmLO1w9tyUi6UxSoePuuOYXktRcBwQeXb1kq/cY57V80JMvap1KCAm
         YfGbD6bYymhxt2hglP1a5KzVz0vQwrHRy1vFtC7SSC3jADVKpM4y1m7IOh0tSjOsY++C
         AZQePFNYuCLmbS33jslvcBkx3BrfgiB/pXuU3NRZZQaeINHSj9OaVsXotuXv9mHZs4Zc
         We52VV1atOVcgTwt47cXgg2jMXmihnSAeN/Kjvu4nvw2tbAoBCf5eVXvT31uPDm0q+Z3
         T3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX3UHPzYzbigDD5wsTRehBv3V9q9b8DqTk86ntiDjnZrK6TilnebqyDe5/mMFMsbswinrvsIcmQ+y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YydB9B+X236oE82QDNSPg9aUdyx/5R1R/skTeTF+LBZPg2kJQYE
	yTEk3P7+s6CmsNM4dkXy/CNyDMu8oublkWw8jfPCV5Ocmm89iauJO+KgpImFwQWHbZ5DXJ9Tg+/
	nAsar6IxnLF+Y2T7bBM1jOGQmGGrhmvdmJFY8x4gdEY31rDyJXmurV2I0/jKAWqA=
X-Gm-Gg: ATEYQzz4HnFDyarIYtSTpUMvdhFAaVVN68FRxAPngNFz4YJDILiN/VFEAMoiGN8W02S
	QdhJ5XtSF8AaPt5VOXxE9nfE8XLt92WKFot92u5cWJALHkf5OfbBCJ6dpDLPYQnencCHPxxqv1t
	elauHRjC71sBLVAmbwfMoh/woVlFodimpInVKWsi3oqhwZpINiaa10XSJPfmBQ68RCNiTdvyXC2
	T7lqfR8+T9gz5qRek2W4MEurCb8AD4Ex6KsHwpSX4eVqmoDLKyOymsSUMlwNZA3sdXYTfCcSufT
	KP+vUFvMpgxEmhoCSYi3GLLWzmOgQdHeyKqcsX4eSxytrzDVZjPvj3ln1rycVdnCBeL9kwV6Gu5
	aVD9UlnXlU6U4aWi2HZjJMJl4w8KHpNkSNGav7FIkEnYEzNGgjw==
X-Received: by 2002:a17:90b:2507:b0:359:8230:abcc with SMTP id 98e67ed59e1d1-3598230ace5mr3362776a91.8.1772442431307;
        Mon, 02 Mar 2026 01:07:11 -0800 (PST)
X-Received: by 2002:a17:90b:2507:b0:359:8230:abcc with SMTP id 98e67ed59e1d1-3598230ace5mr3362753a91.8.1772442430727;
        Mon, 02 Mar 2026 01:07:10 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593ddd737fsm17419480a91.13.2026.03.02.01.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:07:10 -0800 (PST)
Message-ID: <741c681d-b496-4dff-be2b-06dbe13acb21@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:37:02 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
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
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
 <mkrwav44qxt66ojxvs2mh5jsjqirrm4sk653uglha3cjefevk6@fobon6vj7fhr>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <mkrwav44qxt66ojxvs2mh5jsjqirrm4sk653uglha3cjefevk6@fobon6vj7fhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IJZnaibjrW08lEVjmKQNCeo9kMH5uTzL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX3aY46CNKeqpp
 Swp6DzC9Rf6mujSuS4su78r/Eg5z4UpCsb+JCFBd/d41DeUn3m1HCUUMCd5YF4nfTbgjaxErBCf
 iDCF3MLGJ+BZih+tpVbAmTqPKHVi677H9OqsmOUFygeDD8Sl6Ma+nalE1it3g5by3jWzBbACRbx
 iPQkW8zjZmH8s8x5ABW0OVL87i+UnUvuGLj7c/A/C0w/gzyV2FEm6wYhVluz9rPZcA0M5BYfwu+
 83yH7vKmi2U0es9DKxX1Bwj89dFn9qdQcon4iDSKZrOASfzdHsg5p2X9emj8DcYzCfb1AfEo93s
 0fVVLjSSGvejzsm6yRBmwis2Tn21zztTNoI45FoGufQlhWNQH4l1HWkbMMhf8q2Sn/Vn4jQ0AWn
 Nx+tEscdfdvvcq/LwAvM7mUXLhqMleYC3cY+bvCYi7fps7J+X6Gjc5kzFbswMQSBFox34WUgAhU
 nk63CU9ornt2hjrcCpg==
X-Proofpoint-ORIG-GUID: IJZnaibjrW08lEVjmKQNCeo9kMH5uTzL
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a55340 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AnjHHbesreVsCw1LpdIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020078



On 2/24/2026 4:09 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:05AM +0530, Ekansh Gupta wrote:
>> Add two GEM-related IOCTLs for the QDA accelerator driver and hook
>> them into the DRM accel driver. DRM_IOCTL_QDA_GEM_CREATE allocates
>> a DMA-backed GEM buffer object via qda_gem_create_object() and
>> returns a GEM handle to userspace, while
>> DRM_IOCTL_QDA_GEM_MMAP_OFFSET returns a valid mmap offset for a
>> given GEM handle using drm_gem_create_mmap_offset() and the
>> vma_node in the GEM object.
>>
>> The QDA driver is updated to advertise DRIVER_GEM in its
>> driver_features, and the new IOCTLs are wired through the QDA
>> GEM and memory-manager backend. These IOCTLs allow userspace to
>> allocate buffers and map them into its address space as a first
>> step toward full compute buffer management and integration with
>> DSP workloads.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c   |  5 ++++-
>>  drivers/accel/qda/qda_gem.h   | 30 ++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.c | 35 +++++++++++++++++++++++++++++++++++
>>  include/uapi/drm/qda_accel.h  | 36 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 105 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 19798359b14e..0dd0e2bb2c0f 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/qda_accel.h>
>>  
>>  #include "qda_drv.h"
>> +#include "qda_gem.h"
>>  #include "qda_ioctl.h"
>>  #include "qda_rpmsg.h"
>>  
>> @@ -154,10 +155,12 @@ DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>>  static const struct drm_ioctl_desc qda_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>>  };
>>  
>>  static struct drm_driver qda_drm_driver = {
>> -	.driver_features = DRIVER_COMPUTE_ACCEL,
>> +	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
>>  	.fops			= &qda_accel_fops,
>>  	.open			= qda_open,
>>  	.postclose		= qda_postclose,
>> diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
>> index caae9cda5363..cbd5d0a58fa4 100644
>> --- a/drivers/accel/qda/qda_gem.h
>> +++ b/drivers/accel/qda/qda_gem.h
>> @@ -47,6 +47,36 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
>>  void qda_gem_free_object(struct drm_gem_object *gem_obj);
>>  int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struct *vma);
>>  
>> +/*
>> + * GEM IOCTL handlers
>> + */
>> +
>> +/**
>> + * qda_ioctl_gem_create - Create a GEM buffer object
>> + * @dev: DRM device structure
>> + * @data: User-space data containing buffer creation parameters
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler creates a new GEM buffer object with the specified
>> + * size and returns a handle to the created buffer.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>> +/**
>> + * qda_ioctl_gem_mmap_offset - Get mmap offset for a GEM buffer object
>> + * @dev: DRM device structure
>> + * @data: User-space data containing buffer handle and offset result
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler retrieves the mmap offset for a GEM buffer object,
>> + * which can be used to map the buffer into user-space memory.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>>  /*
>>   * Helper functions for GEM object allocation and cleanup
>>   * These are used internally and by the PRIME import code
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> index 9fa73ec2dfce..ef3c9c691cb7 100644
>> --- a/drivers/accel/qda/qda_ioctl.c
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -43,3 +43,38 @@ int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_pr
>>  
>>  	return 0;
>>  }
>> +
>> +int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct drm_qda_gem_create *args = data;
>> +	struct drm_gem_object *gem_obj;
>> +	struct qda_drm_priv *drm_priv;
>> +
>> +	drm_priv = get_drm_priv_from_device(dev);
>> +	if (!drm_priv || !drm_priv->iommu_mgr)
>> +		return -EINVAL;
>> +
>> +	gem_obj = qda_gem_create_object(dev, drm_priv->iommu_mgr, args->size, file_priv);
>> +	if (IS_ERR(gem_obj))
>> +		return PTR_ERR(gem_obj);
>> +
>> +	return qda_gem_create_handle(file_priv, gem_obj, &args->handle);
>> +}
>> +
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct drm_qda_gem_mmap_offset *args = data;
>> +	struct drm_gem_object *gem_obj;
>> +	int ret;
>> +
>> +	gem_obj = qda_gem_lookup_object(file_priv, args->handle);
>> +	if (IS_ERR(gem_obj))
>> +		return PTR_ERR(gem_obj);
>> +
>> +	ret = drm_gem_create_mmap_offset(gem_obj);
>> +	if (ret == 0)
>> +		args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +
>> +	drm_gem_object_put(gem_obj);
>> +	return ret;
>> +}
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> index 0aad791c4832..ed24a7f5637e 100644
>> --- a/include/uapi/drm/qda_accel.h
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -19,6 +19,8 @@ extern "C" {
>>   * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>>   */
>>  #define DRM_QDA_QUERY	0x00
>> +#define DRM_QDA_GEM_CREATE		0x01
>> +#define DRM_QDA_GEM_MMAP_OFFSET	0x02
>>  /*
>>   * QDA IOCTL definitions
>>   *
>> @@ -27,6 +29,10 @@ extern "C" {
>>   * data structure and direction (read/write) for each IOCTL.
>>   */
>>  #define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
>> +#define DRM_IOCTL_QDA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_CREATE, \
>> +						 struct drm_qda_gem_create)
>> +#define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
>> +						 struct drm_qda_gem_mmap_offset)
>>  
>>  /**
>>   * struct drm_qda_query - Device information query structure
>> @@ -40,6 +46,36 @@ struct drm_qda_query {
>>  	__u8 dsp_name[16];
>>  };
>>  
>> +/**
>> + * struct drm_qda_gem_create - GEM buffer object creation parameters
>> + * @size: Size of the GEM object to create in bytes (input)
>> + * @handle: Allocated GEM handle (output)
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_GEM_CREATE to allocate
>> + * a new GEM buffer object.
>> + */
>> +struct drm_qda_gem_create {
>> +	__u32 handle;
>> +	__u32 pad;
>> +	__u64 size;
> If you put size before handle, you would not need padding.
ack
>
>> +};
>> +
>> +/**
>> + * struct drm_qda_gem_mmap_offset - GEM object mmap offset query
>> + * @handle: GEM handle (input)
>> + * @pad: Padding for 64-bit alignment
>> + * @offset: mmap offset for the GEM object (output)
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_GEM_MMAP_OFFSET to retrieve
>> + * the mmap offset that can be used with mmap() to map the GEM object into
>> + * user space.
>> + */
>> +struct drm_qda_gem_mmap_offset {
>> +	__u32 handle;
>> +	__u32 pad;
>> +	__u64 offset;
> I'm really not a fan of the pad field in the middle of the structure.
ack
>
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>>
>> -- 
>> 2.34.1
>>

