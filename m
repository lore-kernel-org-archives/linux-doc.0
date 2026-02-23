Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8678D34DB4E
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886957; cv=none; b=ltz9DJGtb/s1mQFf76tAjgkhOqAxJqal3oMiz0NnQ9jTOtKEpAbrkNP8BjFk/NTdWkNxkftLQCMxY8MUN6zCADuRMbflhtooGtJtAzG8tyf30Xh3oBGuqX1tbCT7kJj0BXZ4EI4tvQp4zxfD8QJGjeO1o8ZceaJv4x81DexLIGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886957; c=relaxed/simple;
	bh=qTfiJlcUd6QRBY8+V5oGTw8m06Stk+1c+h2gpzIEzrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6tsiGW0X6DqdwRod8fkoxw3jvq4hYIYSQ0KFKxZwn9JphFgKes3GStSQGTANHejlK/b3qeOCOAhte/Kdr4sAOp/U3XYAJuE9wmcpDn4zOMbojXhmN1PK7SAjCbqirPDpOI27soYdYhiI65MWOEyOPYB+woDpNICw2z566AhNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgYaXKe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L20lS6Hz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgYaXKe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L20lS6Hz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NH1Aro110480
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IxyS7IiUwnZk4M8j2FTACcTO
	tmYuJKogn0322cRLchI=; b=jgYaXKe10ei+VDIUlMgJn/SRuxKYMLLJ1Di2YX+t
	9A6aHUl10WOftpULKAemW2iVpnmTkQ1cfUZ2PcmezxdBD3LZuGLnSHIaRYWyhiPg
	oAZmP2884fWE8AuFgScfFKLzKWYuD41FtJonDi7eYJ7Z4BJZUjLotVeI5Ng9epzt
	PuX5ZsT0W8oBtSqxKwhgnnoGH3hUicFk93ZVMsBSFwHqi+apPEXbPzSBiCP+vlKu
	PME6V/b7h2MvEKFuUCTcuf7bml1Qh3vcynTvhKVssxhVjGTKXY/fbT1MfjqfcBtI
	xSm/NCR3THrDIi83cfrr3/2qPzc+nwJEElJwRWmTAWWQEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx08yms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:49:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so3386539785a.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 14:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886955; x=1772491755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IxyS7IiUwnZk4M8j2FTACcTOtmYuJKogn0322cRLchI=;
        b=L20lS6HzNd/OQrB3W6KCCK8knogilbDPnBd0boIixfv81JvLU1ZdUzcBVUa1WTvaR9
         gIr7cgQkeO7jRI0rPjvBKRVXeAN0VAxCR08ep2mI5aEjHvQknSLLvGgt+QFY4/UEfIsI
         T2Tnibojd+u0M4vjzurHdlXo0n9p0pAlgZDvB3jhnkIEwNDQHOTbhBA1nN9/LWgzzIuV
         LF+8cyEcu68R55qYEN8uovjR5b5wSx3wThhQ8RHegfisFxuzQKz/4HuxfQ2RvZDWdiQG
         XfQYQJkbCSGmGondrpr7TspJoOausdUlT/sECfNDtTpaYtja8Q6zPPnVcBjiaJihqzrL
         gwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886955; x=1772491755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxyS7IiUwnZk4M8j2FTACcTOtmYuJKogn0322cRLchI=;
        b=cc3vt2NNP8CheYwNOp/6Tf1sH+OHZHAVC7ku6g97VWMPUpvyI6VRbzp6Itm+/iF04m
         yBz2x1/TiBXZ4lGVKu8drCABq68AJA9lQN9jqNq4TvGPrqu8Ljy9RP2f20GJuqGcE/VQ
         B0fGhixPbjCZjrGUU5QJErgbq665v4/HEAo6wlj6/qSWFHvS7vkYD20b4j84qb4RiUsD
         w70MtZVmVYh335s/Bh+N6WmVzhfKLof0pG1+mHHawhSckHtCxFqUxjxCynmHt3spFKTy
         hEa6SlwUCJYSvG/ecVrKbXbVKOytwO1nAlLWPOnO3DwvmijGcS9fUFPvzcruZs14x51M
         BPjg==
X-Forwarded-Encrypted: i=1; AJvYcCX8bS3jginvZSzsmyQiIdnpBE/Hg5dh/9f70WW3oToBffliQDB6sR3w1xPsYrXU655C1FXDq36VBqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm86+dQyexf6S0wgHDsECdCBl6g2F4UaRjOxRked8/21hh3ccX
	lRTKmi4GhD9abFCF0037p6CMgTxO7GpTKD+VBe9fCvSBscPPKlMEo+AfnSLa+hXqW3dV9t5pZKi
	N5q4xHCUxWAdHy6ZdEGK7h8mG+fODKoHEgAGKz+jB3OVEEjZQPjmVbDrjN5KkSdo=
X-Gm-Gg: AZuq6aJh7P6UmzrWDBJ79ibTqCMi4ZG06S7XyOew+HLi9R9d6M4ctaskNaVdi+n3bJT
	P7I0MYS/XZtVBDw/CuOKNbRWlnGlauPfDFMtkloWSN/DmkCDrUOq5cVsw7PerEoK2TuwhY0+EAf
	WKdZyHX/TQxAmvhzuC/XmcDXsYzQyv7hTyEJBpUNF9ts2JW+bVjsOAvXJkEx7KjNIktWYfSzpr9
	Eij/5ZRJXGAY77KO5WSlFc2xWcM0CEezf6Dm5xOXPFKVzH6jYAAEnWJ/8w8H9SZlCEgMMxwD4HN
	vV4g9SGP+ln7JKEus+9CdDLvBxV//IdFkwlevWAXbVeZh7z91G510Jl4fx6Hbh4V6kKiA/GtOI6
	jLcV6Zd0Co7unoZJo3Dgv1meEb/5aCDKNSVGexRYLoZLTcPaVBaJi6b6DCZ6f6a5n15EFL/Qy8w
	qDloPnPeU3vj30rF7CqETLSgAx/+sg0WsxiQA=
X-Received: by 2002:a05:620a:1921:b0:8c7:f62:21c7 with SMTP id af79cd13be357-8cb8c9ebdc6mr1299798785a.20.1771886954698;
        Mon, 23 Feb 2026 14:49:14 -0800 (PST)
X-Received: by 2002:a05:620a:1921:b0:8c7:f62:21c7 with SMTP id af79cd13be357-8cb8c9ebdc6mr1299793585a.20.1771886954113;
        Mon, 23 Feb 2026 14:49:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45c38sm1807487e87.73.2026.02.23.14.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:49:13 -0800 (PST)
Date: Tue, 24 Feb 2026 00:49:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 05/18] accel/qda: Create compute CB devices on QDA
 compute bus
Message-ID: <x3s26yr7oy2dokp4plsp67yndr7o4ps6nuj7i4zjze77ifljux@ap537se6npfg>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7H8A0lNXdcs6vZ1Uvto6p9DSRC7vc1iG
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699cd96b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Cz5CYKkr5BOHp3dh53AA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7H8A0lNXdcs6vZ1Uvto6p9DSRC7vc1iG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5OSBTYWx0ZWRfXzrYHfBE5v9eH
 bUhEK9EWdZoDyGjW0lz018PM6DU5tdhqvW/gxyNcyMTOgo5H9+Rkr6ajjWoYPzLVHBE/eDcpD9e
 iKKDiae7nmQIPGDCcsskgpo6vuD38zF21oyqkpExxbwd6sOoyIs9R88yT4m2Gs1fvXX6l1lUUzU
 XM8mSFQBoD+VwsIIBiR6Ueca3On4D+qbikOWRUAJLjePdG8+XHr4uOhC8xXqqJrCdJAojq6PwN8
 JiYCuJFV05llf7pn7Uj2mQPTqGo3Z9iVNc/5+VXr3RdogHjYzNkyb36gnPLn+KwtdJAwudvFKvA
 FdezkiEr/IgphFEQy51x4eoBnrtVBYcXbaVgSstwJtXK6oc/h+ma12wlqZdXYeEcQ093Q441Nj9
 uUo5Knt5j8/R18DozE/82XiGd9B06EvgDg4zCPKXK+KM+xU0+cKXMRytSnvvfEjR52dxqNtn1mR
 3eonxqUjq464g54sY2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230199

On Tue, Feb 24, 2026 at 12:38:59AM +0530, Ekansh Gupta wrote:
> Add support for creating compute context-bank (CB) devices under
> the QDA compute bus based on child nodes of the FastRPC RPMsg
> device tree node. Each DT child with compatible
> "qcom,fastrpc-compute-cb" is turned into a QDA-owned struct
> device on qda_cb_bus_type.
> 
> A new qda_cb_dev structure and cb_devs list in qda_dev track these
> CB devices. qda_populate_child_devices() walks the DT children
> during QDA RPMsg probe, creates CB devices, configures their DMA
> and IOMMU settings using of_dma_configure(), and associates a SID
> from the "reg" property when present.
> 
> On RPMsg remove, qda_unpopulate_child_devices() tears down all CB
> devices, removing them from their IOMMU groups if present and
> unregistering the devices. This prepares the ground for using CB
> devices as IOMMU endpoints for DSP compute workloads in later
> patches.

Are we loosing the nsessions support?

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile    |   1 +
>  drivers/accel/qda/qda_cb.c    | 150 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_cb.h    |  26 ++++++++
>  drivers/accel/qda/qda_drv.h   |   3 +
>  drivers/accel/qda/qda_rpmsg.c |  40 +++++++++++
>  5 files changed, 220 insertions(+)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 242684ef1af7..4aded20b6bc2 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_drv.o \
>  	qda_rpmsg.o \
> +	qda_cb.o \
>  
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
> new file mode 100644
> index 000000000000..77a2d8cae076
> --- /dev/null
> +++ b/drivers/accel/qda/qda_cb.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/dma-mapping.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/iommu.h>
> +#include <linux/slab.h>
> +#include "qda_drv.h"
> +#include "qda_cb.h"
> +
> +static void qda_cb_dev_release(struct device *dev)
> +{
> +	kfree(dev);

Do you need to put the reference on the OF node?

> +}
> +
> +static int qda_configure_cb_iommu(struct device *cb_dev, struct device_node *cb_node)
> +{
> +	int ret;
> +
> +	qda_dbg(NULL, "Configuring DMA/IOMMU for CB device %s\n", dev_name(cb_dev));
> +
> +	/* Use of_dma_configure which handles both DMA and IOMMU configuration */
> +	ret = of_dma_configure(cb_dev, cb_node, true);
> +	if (ret) {
> +		qda_err(NULL, "of_dma_configure failed for %s: %d\n", dev_name(cb_dev), ret);
> +		return ret;
> +	}
> +
> +	qda_dbg(NULL, "DMA/IOMMU configured successfully for CB device %s\n", dev_name(cb_dev));
> +	return 0;
> +}
> +
> +static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev)
> +{
> +	int rc;
> +	u32 sid, pa_bits = 32;
> +
> +	qda_dbg(qdev, "Setting up CB device %s\n", dev_name(cb_dev));
> +
> +	if (of_property_read_u32(cb_dev->of_node, "reg", &sid)) {
> +		qda_dbg(qdev, "No 'reg' property found, defaulting SID to 0\n");
> +		sid = 0;

Don't do the job of the schema validator. Are there nodes without reg?
No.

> +	}
> +
> +	rc = dma_set_mask(cb_dev, DMA_BIT_MASK(pa_bits));
> +	if (rc) {
> +		qda_err(qdev, "%d bit DMA enable failed: %d\n", pa_bits, rc);
> +		return rc;
> +	}
> +
> +	qda_dbg(qdev, "CB device setup complete - SID: %u, PA bits: %u\n", sid, pa_bits);
> +
> +	return 0;
> +}
> +
> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
> +{
> +	struct device *cb_dev;
> +	int ret;
> +	u32 sid = 0;
> +	struct qda_cb_dev *entry;
> +
> +	qda_dbg(qdev, "Creating CB device for node: %s\n", cb_node->name);
> +
> +	of_property_read_u32(cb_node, "reg", &sid);
> +
> +	cb_dev = kzalloc_obj(*cb_dev, GFP_KERNEL);
> +	if (!cb_dev)
> +		return -ENOMEM;
> +
> +	device_initialize(cb_dev);
> +	cb_dev->parent = qdev->dev;
> +	cb_dev->bus = &qda_cb_bus_type; /* Use our custom bus type for IOMMU handling */
> +	cb_dev->release = qda_cb_dev_release;
> +	dev_set_name(cb_dev, "qda-cb-%s-%u", qdev->dsp_name, sid);
> +
> +	qda_dbg(qdev, "Initialized CB device: %s\n", dev_name(cb_dev));
> +
> +	cb_dev->of_node = of_node_get(cb_node);
> +
> +	cb_dev->dma_mask = &cb_dev->coherent_dma_mask;
> +	cb_dev->coherent_dma_mask = DMA_BIT_MASK(32);
> +
> +	dev_set_drvdata(cb_dev->parent, qdev);
> +
> +	ret = device_add(cb_dev);
> +	if (ret) {
> +		qda_err(qdev, "Failed to add CB device for SID %u: %d\n", sid, ret);
> +		goto cleanup_device_init;
> +	}
> +
> +	qda_dbg(qdev, "CB device added to system\n");
> +
> +	ret = qda_configure_cb_iommu(cb_dev, cb_node);
> +	if (ret) {
> +		qda_err(qdev, "IOMMU configuration failed: %d\n", ret);
> +		goto cleanup_device_add;
> +	}
> +
> +	ret = qda_cb_setup_device(qdev, cb_dev);
> +	if (ret) {
> +		qda_err(qdev, "CB device setup failed: %d\n", ret);
> +		goto cleanup_device_add;
> +	}
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry) {
> +		ret = -ENOMEM;
> +		goto cleanup_device_add;
> +	}
> +
> +	entry->dev = cb_dev;
> +	list_add_tail(&entry->node, &qdev->cb_devs);
> +
> +	qda_dbg(qdev, "Successfully created CB device for SID %u\n", sid);
> +	return 0;
> +
> +cleanup_device_add:
> +	device_del(cb_dev);
> +cleanup_device_init:
> +	of_node_put(cb_dev->of_node);
> +	put_device(cb_dev);
> +	return ret;
> +}
> +
> +void qda_destroy_cb_device(struct device *cb_dev)
> +{
> +	struct iommu_group *group;
> +
> +	if (!cb_dev) {
> +		qda_dbg(NULL, "NULL CB device passed to destroy\n");
> +		return;
> +	}
> +
> +	qda_dbg(NULL, "Destroying CB device %s\n", dev_name(cb_dev));
> +
> +	group = iommu_group_get(cb_dev);
> +	if (group) {
> +		qda_dbg(NULL, "Removing %s from IOMMU group\n", dev_name(cb_dev));
> +		iommu_group_remove_device(cb_dev);
> +		iommu_group_put(group);
> +	}
> +
> +	of_node_put(cb_dev->of_node);
> +	cb_dev->of_node = NULL;
> +	device_unregister(cb_dev);
> +
> +	qda_dbg(NULL, "CB device %s destroyed\n", dev_name(cb_dev));
> +}
> diff --git a/drivers/accel/qda/qda_cb.h b/drivers/accel/qda/qda_cb.h
> new file mode 100644
> index 000000000000..a4ae9fef142e
> --- /dev/null
> +++ b/drivers/accel/qda/qda_cb.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_CB_H__
> +#define __QDA_CB_H__
> +
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/list.h>
> +#include <linux/qda_compute_bus.h>
> +#include "qda_drv.h"
> +
> +struct qda_cb_dev {
> +	struct list_head node;
> +	struct device *dev;
> +};
> +
> +/*
> + * Compute bus (CB) device management
> + */
> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node);
> +void qda_destroy_cb_device(struct device *cb_dev);
> +
> +#endif /* __QDA_CB_H__ */
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index bec2d31ca1bb..eb732b7d8091 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -7,6 +7,7 @@
>  #define __QDA_DRV_H__
>  
>  #include <linux/device.h>
> +#include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/rpmsg.h>
>  #include <linux/xarray.h>
> @@ -26,6 +27,8 @@ struct qda_dev {
>  	atomic_t removing;
>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>  	char dsp_name[16];
> +	/* Compute context-bank (CB) child devices */
> +	struct list_head cb_devs;
>  };
>  
>  /**
> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
> index a8b24a99ca13..5a57384de6a2 100644
> --- a/drivers/accel/qda/qda_rpmsg.c
> +++ b/drivers/accel/qda/qda_rpmsg.c
> @@ -7,6 +7,7 @@
>  #include <linux/of_device.h>
>  #include "qda_drv.h"
>  #include "qda_rpmsg.h"
> +#include "qda_cb.h"
>  
>  static int qda_rpmsg_init(struct qda_dev *qdev)
>  {
> @@ -25,11 +26,42 @@ static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
>  
>  	qdev->dev = &rpdev->dev;
>  	qdev->rpdev = rpdev;
> +	INIT_LIST_HEAD(&qdev->cb_devs);
>  
>  	qda_dbg(qdev, "Allocated and initialized qda_dev\n");
>  	return qdev;
>  }
>  
> +static void qda_unpopulate_child_devices(struct qda_dev *qdev)
> +{
> +	struct qda_cb_dev *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
> +		list_del(&entry->node);
> +		qda_destroy_cb_device(entry->dev);
> +		kfree(entry);

Why can't you embed struct device into a structure together with the
list_node (and possibly some other data?)?

> +	}
> +}
> +
> +static int qda_populate_child_devices(struct qda_dev *qdev, struct device_node *parent_node)
> +{
> +	struct device_node *child;
> +	int count = 0, success = 0;
> +
> +	for_each_child_of_node(parent_node, child) {
> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb")) {
> +			count++;
> +			if (qda_create_cb_device(qdev, child) == 0) {
> +				success++;
> +				qda_dbg(qdev, "Created CB device for node: %s\n", child->name);
> +			} else {
> +				qda_err(qdev, "Failed to create CB device for: %s\n", child->name);

Don't loose the error code. Instead please return it to the caller.

> +			}
> +		}
> +	}
> +	return success > 0 ? 0 : (count > 0 ? -ENODEV : 0);
> +}
> +
>  static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
>  {
>  	/* Dummy function for rpmsg driver */
> @@ -48,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>  	qdev->rpdev = NULL;
>  	mutex_unlock(&qdev->lock);
>  
> +	qda_unpopulate_child_devices(qdev);
>  	qda_deinit_device(qdev);
>  
>  	qda_info(qdev, "RPMsg device removed\n");
> @@ -83,6 +116,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = qda_populate_child_devices(qdev, rpdev->dev.of_node);
> +	if (ret) {
> +		qda_err(qdev, "Failed to populate child devices: %d\n", ret);
> +		qda_deinit_device(qdev);
> +		return ret;
> +	}
> +
>  	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
>  	return 0;
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
