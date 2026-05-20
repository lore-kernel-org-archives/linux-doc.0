Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A73E9C01
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287041; cv=none; b=OCzFh6Aqy8vBbUhmbwXZgwBTDcmlAEnBc5cmYdpDNHj2KqcJLKd9OTKMv+yoDK/sjJi7d/g/2fCkq0Efxat63iiOCl1439T759xZU2LjxcUZI3/uiULXO/EBVTRb03MpRwOBHCh8Oz8Kny1De3Ezym4ITxxVGhc4LEOiPAxSPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287041; c=relaxed/simple;
	bh=qmCaiUhsXRp1nBJFDpnj4/1kbPlAml3acNXDkbqeY8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzMIqu7KjRgXj4RRtUTZNMzHHaaKredml632vNtsCuS+Bw3ij9a8+SquiHJlexJe90FABsMu+vfuOHonyz69In/drZL3iSK15sL0ft6DGASw5Lr981xBnZRIMcvXzP8hxj8UtW3stN872G1mkhlWUJWILBB+BUQ7LOl7FY3wZGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgmR/z7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fdw3vrrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgmR/z7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fdw3vrrW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6SZU118976
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zZgC57Ii0BTYgfnbECyQYyWw
	TDZMq6Ouh/2/CXADmS0=; b=LgmR/z7dVuueTtWW/lppz/vir7A6gg1VwtnB751Y
	GfD0zhBwFbr1SUGpI/3RkOoQSNDjKHEQ3pfs9fLv9hJ9+iFv8/PQCxgjXhLDa7ow
	lnc/RkTazKRZcdyuyeb/WWhP3u/jY2H9j7snh6dhPT12XVJ4Rn5pMeTC7L/AjFd3
	lsj/FDUtPQtcDSqq0koLghczP3GbuwktTDPdgs0plONjD7a63QMxif7NKXB3KOKr
	eQw2ZRnKjJg0Co03zsPrJr9ol+oz+fRHK+OWA45z7y6t5Wpqog8+hqyjzZm3VeLX
	rgQpG76x9VGlTJgnpqpypUmdajaL0w4aNCEXQRmdFdOmNA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8824r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:23:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575231e4b89so4568747e0c.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287027; x=1779891827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZgC57Ii0BTYgfnbECyQYyWwTDZMq6Ouh/2/CXADmS0=;
        b=Fdw3vrrWwl/sccQjJcFUVeZBZdI8EJjrqKT6lhwDUumhgzFxV6uprVZNIeU6UmDn5P
         nOX9/JAOkuHCB9TqWyokpnEI43KXEeRVLp8+7mwWm120vlJaPy7SbjOeTPibON8JoiTP
         8zjaADQ8yec3kcGXF4aFYNodaHCESnEfyLacfC3rRV3j9tfmp+bKIuMbPLJyuR75Nozs
         JR/NzWlfkMKdwPtAs22fSuld9Ko8HVbHZLt1DC3rzQe5VgOfXYIHpC1E5fdXVqAT3dKe
         J8U7hUtLdI4yfR7Fb8ye4SBdHrpUTzxdyFYjsFZwg65yGTxGg8RnhMKP1RF1UawroYdP
         Kelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287027; x=1779891827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZgC57Ii0BTYgfnbECyQYyWwTDZMq6Ouh/2/CXADmS0=;
        b=sawGzQvNMnqcpXoXR9vQlpLj/cjcK5hlRlTHp4LYi//6NU5tE0k6WOXWYXEXSuwBzp
         vf57tx46A/EVLZMCqEklygMlvSx+SKDD5sBGVduyrFRdw3zLXGgArRkRxoM3jgcnBHn3
         ZJjVmwFZTljL7SYW4eWoNnR/cnZWd2pJg+OOA3ePEu7+6mlhBbcqbHjbpFExlW7/1p3Y
         ZgXpmHnIzlzXV1Ibx3vLSlAdAi90XswlRTvwq0C3D7ibaSjkcd/meArYxMBsF48M8nDJ
         hsIgG5ZkHX05DRHGeAYAwq+JqvaGiKySHKLx9P2ZcDzzxw8jpoNvMA7w927qmhbq1e1R
         oBqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YDsP0GGDqZZWZBqeqH/MFXAfZPQ6WurfwtXyMBZq2HEdrz7WOpTSi5WRhA06wx0P21A2NqRKl3Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxwfHq2XmBnPczObYNDMN9fFUPKb6KFWf3Q8a+lPauRzxOzNjp
	0NnCeJGUA7vGAvQwbMEYmQvTy2Vhvzjyr2aRDk1kRdYy8w82P2hYfoc/ZWYDNuaK2D6p4s9BRwm
	ilrb9/QCiucvRDNIbR9gaUtS4JHdChzDz+iIb97HcF+ZXsnH8TDp5FLwE/usrg9I=
X-Gm-Gg: Acq92OE1i+2s46XqZTuVgaUatDGvXqGQ8zm/irg1YORT9dM4leWvWTZsV6Vc4HvAWUK
	Ci5QTmYkWolt5qQ+dASNKtKFX3+88kEZZ3i6+vovL8XjYEQ1c++PB9mjyUGPGPYMzU4SGOhUHqA
	neTNW6R6HSXj37B9W6bQK317XtAk7M0Z/NghekkB63ztwj6xWDNkTjJ6VjqCwu5dZ68eD8BRHe8
	/ePR5hAmyV4ypQv9U5h33zNvqW+KaY2xPgTHpoQn+vvSCouFov32iW5K3FKkC5XM3GWNrcT/wEa
	x/JwocdFNrZEYY35tCQolvXWcz7BZwfCNFlpup1h200QhfUdy5iopTw5QEymB9EOhlHeHd2A7fS
	2Uac7DYnR++PWCMBkccuHebvGnimlLsztDt0EPT0cdBIsXG7GReZj6/1rZxXWd9CxW1JFp27jpw
	SmzomEanhQCxe8qPs8UD+OM3bqBF3XmQoFHFw/Gwwv7KOHug==
X-Received: by 2002:a05:6122:920:b0:56e:f071:d4ef with SMTP id 71dfb90a1353d-5760c0347e0mr11445802e0c.8.1779287026854;
        Wed, 20 May 2026 07:23:46 -0700 (PDT)
X-Received: by 2002:a05:6122:920:b0:56e:f071:d4ef with SMTP id 71dfb90a1353d-5760c0347e0mr11445742e0c.8.1779287026305;
        Wed, 20 May 2026 07:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cf080sm4955924e87.74.2026.05.20.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:23:45 -0700 (PDT)
Date: Wed, 20 May 2026 17:23:43 +0300
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
Subject: Re: [PATCH 06/15] accel/qda: Create compute context bank devices on
 QDA compute bus
Message-ID: <f527lflctqyqjrotd2qerlx4oikg6st6u2seqsjw6u5krkqrab@uhw33gnkp5c7>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-6-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-6-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KYSDz9uFik1ypTEtNfzaYOzPklIkelpC
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dc3f3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=R2qd4bXIq2Q-l4e3V4sA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MCBTYWx0ZWRfX+DZ+Iz7y/a2+
 UTQrOOD9u3TTHpmId7uYBEp4+xr234rR1l9hf0fb97kD2An2sCQY/8hM0QBqGTz6CRQVUBchLPf
 o76wvYK+GqFaxaXDgPFY4op2l72GzC9HA31DKcet2/fZdJtFf2kyl/l0hg+cz2PT5ACGbqN497d
 LDyuxTnyt9tUxdhZG2tiFKllMVzQkiewQ6w4vPykFAiB3tO1YbofTDQciAnO0FKHJuF9i9BK8/j
 NF5Uezt+HUVUBUAMW9N8yvNBsZYUJRIfFhf6jEMYQo2bsZs6cw+Cq1srdLrZ5FO4PrfegP5XC3L
 zmhaz/J9NqMKS1l/XsIl2wnbaXfWo7fP4fwoFyn6Yp1UgAvKIadtDeZ/e3sE0qsk/EiguvJDqnU
 4nhgVobOwEKbqyH1sVYZaBLHCZvxgmALVVZ28z5SeGe/hcg8lNq9Fzf6UOzii2H92fU3EbgPmph
 1SvDgcnZhCSxWK/emCQ==
X-Proofpoint-GUID: KYSDz9uFik1ypTEtNfzaYOzPklIkelpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200140

On Tue, May 19, 2026 at 11:45:56AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce the CB (compute context bank) device management layer for the
> QDA driver. Each DSP domain node in the device tree may contain child
> nodes with compatible "qcom,fastrpc-compute-cb", each representing one
> IOMMU context bank. The driver enumerates those child nodes during
> RPMsg probe and creates a corresponding device on the qda-compute-cb
> bus for each one.
> 
> The CB devices are created via create_qda_cb_device(), which registers
> them on the qda-compute-cb bus so that the IOMMU subsystem assigns each
> device its own IOMMU domain, enabling per-session address space
> isolation for DSP buffer mapping.
> 
> The new qda_cb.c file provides two functions:
> 
>   qda_create_cb_device()
>     Reads the "reg" property from the DT child node to obtain the
>     stream ID, constructs a unique device name of the form
>     "qda-cb-<dsp>-<sid>", and registers the device on the compute bus.
>     A qda_cb_dev entry is allocated and appended to qdev->cb_devs so
>     that the list can be walked during teardown.
> 
>   qda_destroy_cb_device()
>     Removes the device from its IOMMU group before calling
>     device_unregister(), ensuring the IOMMU domain is released cleanly.
> 
> CB devices are populated before the DRM device is registered and
> destroyed before it is unplugged, so no DRM operation can race with
> CB teardown. On probe failure after population, qda_cb_unpopulate()
> is called to clean up any CBs that were successfully created before
> the error.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile    |  1 +
>  drivers/accel/qda/qda_cb.c    | 99 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_cb.h    | 32 ++++++++++++++
>  drivers/accel/qda/qda_drv.c   |  1 +
>  drivers/accel/qda/qda_drv.h   |  3 ++
>  drivers/accel/qda/qda_rpmsg.c | 12 +++++-
>  6 files changed, 147 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 424176f652a5..143c9e4e789e 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -6,6 +6,7 @@
>  obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  
>  qda-y := \
> +	qda_cb.o \
>  	qda_drv.o \
>  	qda_rpmsg.o
>  
> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
> new file mode 100644
> index 000000000000..77caf8438c67
> --- /dev/null
> +++ b/drivers/accel/qda/qda_cb.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/dma-mapping.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/iommu.h>
> +#include <linux/qda_compute_bus.h>
> +#include <linux/slab.h>
> +#include <drm/drm_print.h>
> +#include "qda_drv.h"
> +#include "qda_cb.h"
> +
> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
> +{
> +	struct device *cb_dev;
> +	u32 sid = 0;
> +	char name[64];
> +	struct qda_cb_dev *entry;
> +
> +	drm_dbg_driver(&qdev->drm_dev, "Creating CB device for node: %s\n", cb_node->name);
> +
> +	of_property_read_u32(cb_node, "reg", &sid);
> +
> +	snprintf(name, sizeof(name), "qda-cb-%s-%u", qdev->dsp_name, sid);
> +
> +	cb_dev = create_qda_cb_device(qdev->dev, name, DMA_BIT_MASK(32), cb_node);

Wrong prefix. Pass the name format and the params to this function. Use
kasprintf in it.

> +	if (IS_ERR(cb_dev)) {
> +		drm_err(&qdev->drm_dev, "Failed to create CB device for SID %u: %ld\n",
> +			sid, PTR_ERR(cb_dev));
> +		return PTR_ERR(cb_dev);
> +	}
> +
> +	entry = kzalloc_obj(*entry);
> +	if (!entry) {
> +		device_unregister(cb_dev);
> +		return -ENOMEM;
> +	}
> +
> +	entry->dev = cb_dev;
> +	list_add_tail(&entry->node, &qdev->cb_devs);
> +
> +	drm_dbg_driver(&qdev->drm_dev, "Successfully created CB device for SID %u\n", sid);
> +	return 0;
> +}
> +
> +void qda_cb_unpopulate(struct qda_dev *qdev)
> +{
> +	struct qda_cb_dev *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
> +		list_del(&entry->node);
> +		qda_destroy_cb_device(entry->dev);
> +		kfree(entry);
> +	}
> +}
> +
> +int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
> +{
> +	struct device_node *child;
> +	int count = 0, success = 0;
> +
> +	for_each_child_of_node(parent_node, child) {
> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb")) {
> +			count++;
> +			if (qda_create_cb_device(qdev, child) == 0) {
> +				success++;
> +				dev_dbg(qdev->dev, "Created CB device for node: %s\n",
> +					child->name);

Stop counting successes.

> +			} else {
> +				dev_err(qdev->dev, "Failed to create CB device for: %s\n",
> +					child->name);

Unwind, return error.

> +			}
> +		}
> +	}
> +	if (count == 0)
> +		return 0;
> +	return success > 0 ? 0 : -ENODEV;
> +}
> +
> +void qda_destroy_cb_device(struct device *cb_dev)
> +{
> +	struct iommu_group *group;
> +
> +	if (!cb_dev) {

How can it be?

> +		pr_debug("qda: NULL CB device passed to destroy\n");
> +		return;
> +	}
> +
> +	dev_dbg(cb_dev, "Destroying CB device %s\n", dev_name(cb_dev));
> +
> +	group = iommu_group_get(cb_dev);
> +	if (group) {
> +		dev_dbg(cb_dev, "Removing %s from IOMMU group\n", dev_name(cb_dev));

Be uniform. It's either drm_dbg_foo() or dev_dbg() all over the place.
Don't mix them.

> +		iommu_group_remove_device(cb_dev);
> +		iommu_group_put(group);
> +	}
> +
> +	device_unregister(cb_dev);
> +}
> @@ -59,9 +61,17 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>  	}
>  	qdev->dsp_name = label;
>  
> +	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
> +	if (ret) {
> +		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = qda_register_device(qdev);
> -	if (ret)
> +	if (ret) {
> +		qda_cb_unpopulate(qdev);
>  		return ret;

Unwinding registration?

> +	}
>  
>  	drm_info(&qdev->drm_dev, "QDA RPMsg probe complete for %s\n", qdev->dsp_name);
>  	return 0;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
