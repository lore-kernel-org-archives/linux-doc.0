Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D3258A
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622055; cv=none; b=SIwOUsGff8vtGu0y9SvNOXa/TYl6rplj1WlOuaHNgosgfnE66nImBCgVw3wS1L9ChcGUaDJviusrl2G3bP3hT/Fjf9d+kvalZNmvVVYEkjLxOaS1AGmwZBfGl0U+mDKHUwZrTkqRO0iILMJPdUivSRFbpNIMUFULPextjH0HJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622055; c=relaxed/simple;
	bh=eFE+NqKb4FGUzqVJCt/1VJwNtjUVrG/QUobe9Pt85YU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YE8dJ345N7KzKhr0g4Rk5o1PbRej2+x7K8eYnQr8HKhPFJ063/JsvRCcjQRULfVpG7PRNVpiZuPtGJx46QNP0RWi1xJfoXXI4L9my6zqzsynhJevFePJhsPaWiwjOeUv5VQEIZnudFh370r0dHAC0GpeSzpCuXcj2BWhpO/OW8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNjXMMHH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNjXMMHH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAWX3u008272
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=; b=mNjXMMHHA9/IsnPJ
	bLB6OGDnRHH6TsGyzMA9Y6YkKzuXxYzxYKwYBQX+y+WDSDMLnUbl3xlPyN9RKEFU
	VR3/076P8sMLc4qnBFFmc4zhLDyfAcT7Lbljewd8Rk48yxywVfXPLzNIH2pSUDeV
	FpSbfvepy+aBXNj6PUFKHihnQ8dK3XhbEU6CuA1z0EsuVpqK7yNpuQ4kySb2CHsp
	VDzwbNirXwHGIaLJfPCVsmK4kjj2HUigxBXP08htjUMTjgmKTfbGe5A9aAilBuOV
	Bc70kDQml7vGlIt3HFedEAWQGOLVSgL82pvT9rhxMt5NwjuYCgdvp5QjQ+fvWGFd
	tM5RYA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992uw68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:20:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742aa6581caso1781428b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 09:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622051; x=1749226851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=;
        b=s8kN3UXq+nYcO2mwNseK0+nknbKv95/yLgOPbmCg5mcBVpr+VniB74sVLGYaqfVYb1
         c9kUASwvVhHyeqRrurijBiv5fTjNQfy/IHq436e2qnkGkRqz+eNfbaLzFqV6r+LjMUpo
         28cT5t3PerTt2QgThDxi8MZnjt+/KNzKgAExvAC0bH5zE7/QiZhIVlhb/nNlyp6UpFMX
         0M5PVaUf8p8C5DYBOpUAnBob/JIiMB4SqtZODOsfNSaZd6oOjQPnqec9K+o+keFtI/AM
         qp1DtODdPtsiydiA+nr8gmb4O/4ONrMx/ql2kZoy4ZriYdPVQ8GIKb2R4dXc3ZDhzMW7
         FD+A==
X-Forwarded-Encrypted: i=1; AJvYcCVe7PnTJ803eL+XabnBe1BL2DMqhRC9cO5xO0c03Ov6Mjqqa8Wv3SU/UvC9m9LCZZ9irW3M5RsM+S8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsY85FXCvdPzNdKpjVwsVBMLTfzNOe5wHF+pPXa0h9R9tcF+oz
	u0BCCYELfA2Z8jf5OXV+L2Wx09D5ojHsfMUAiU/3Mz3FgdvfMdlzvv18ndztArq1y/dOUW5fqiy
	eV59k8mxnxnQ8dVqbkJjDSY8Qh1Z2nJid2TO5WlbOM98NjJVEQYamoQynNI2Z3S8=
X-Gm-Gg: ASbGncu0TyOjUVrpSkNMtGAPic4RCMRjDzJi4c/TcSeQqemFAm3iYT9BTP8NGcK7ies
	0Hs50o3j2xsXbHUJjpDnLEueSm+yjsQLKjDs0HC+eTaUwGxdutC6z7B/vvqcNktZZiK1wIOGjjD
	6W7+DDrX3OlX/AYz6Z4b6LhbZ/bo+IdZRB4UX/M1H56tvXgFms3mVwghN6IO/gsCNfYBmlBruMf
	NsHsbZLjaHMzB9IoYaGLDtsh0xhBP18t/B2VdlqCgrF4ZZw3U0SxQUhmL0i3LgJ84uXWivmybbh
	Dgl0aJj0jnkvg9oGZz9htdmFKJYGppzi7uVHzr6CXUNvCV4WhBpVgrVw+QruTg==
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr2995554b3a.23.1748622050772;
        Fri, 30 May 2025 09:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3KvuYJT4qbQ5u5CbTu0XT/yKXicfsd+dn08wq+4nYHqmMZGv9KAdolvB8TbaAHA/+TUu3/A==
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr2995515b3a.23.1748622050335;
        Fri, 30 May 2025 09:20:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd2c86sm3325986b3a.144.2025.05.30.09.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:20:49 -0700 (PDT)
Message-ID: <463162bb-5e2d-4768-8811-ede7b2063c85@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:20:47 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] accel/rocket: Add a new driver for Rockchip's
 NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-5-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-5-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NCBTYWx0ZWRfX8g2kWIiHidJz
 FsGxRIywWlTgE7ZE/HqmnXinrjH4380YMHSttDWgV0zfwW7p7Ga0BoCA9jdOT2NG0iuHtpgfYL5
 AUAnbEOF95+B3I3kY21fdCqxvvEDSRsggUx7FJQfIgq9KA/pSkNIq7u4p9e+J+iED2MWW/ZZm3a
 Qrkgw8n8d7JKWc9yzCt/pwJlKjWBSltzD1tOGKeF/f/xhGX9pOdI1GvB6FFkWgzx5mZRmj09BgT
 cK44kL128+pNmDVz+16woAqVqOjDt0YD+ux9JIZz9wrn+b+Q9HBmrB1PRILi7b9BNfQux0xWW6d
 V5rYItK1Cvcb5hm+0tXAD14OPAX4GWR3XvsgquZ6m+62DkdgO63/DiseTylr2zAJ31qmZDmt3nH
 k0vPaNhhQGJ7XT9tyHhlcbH/go/ur2ZSXGvyBTHhRqGibG/QOEv7USoVATbWJNrAAjRk+8fy
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6839dae3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DISFzqtZAAAA:8 a=HlDAqVJfg7-00m_e3XEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-GUID: DkN2NJ2ivqtCJwHOOSojrRS7kiS_V4hd
X-Proofpoint-ORIG-GUID: DkN2NJ2ivqtCJwHOOSojrRS7kiS_V4hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=997 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300144

On 5/20/2025 4:26 AM, Tomeu Vizoso wrote:
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..55f4da252cfbd1f102c56e5009472deff59aaaec
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_DEVICE_H__
> +#define __ROCKET_DEVICE_H__
> +
> +#include <drm/drm_device.h>
> +#include <linux/clk.h>
> +
> +#include "rocket_core.h"
> +
> +struct rocket_device {
> +	struct drm_device ddev;
> +
> +	struct clk_bulk_data clks[2];
> +
> +	struct rocket_core *cores;
> +	unsigned int num_cores;
> +};
> +
> +int rocket_device_init(struct rocket_device *rdev);
> +void rocket_device_fini(struct rocket_device *rdev);
> +
> +#define to_rocket_device(drm_dev) \
> +	((struct rocket_device *)container_of(drm_dev, struct rocket_device, ddev))

Include container_of.h?

> +static int rocket_drm_bind(struct device *dev)
> +{
> +	struct device_node *core_node;
> +	struct rocket_device *rdev;
> +	struct drm_device *ddev;
> +	unsigned int num_cores = 1;
> +	int err;
> +
> +	rdev = devm_drm_dev_alloc(dev, &rocket_drm_driver, struct rocket_device, ddev);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	ddev = &rdev->ddev;
> +	dev_set_drvdata(dev, rdev);
> +
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
> +		if (of_device_is_available(core_node))
> +			num_cores++;
> +
> +	rdev->cores = devm_kmalloc_array(dev, num_cores, sizeof(*rdev->cores),
> +					 GFP_KERNEL | __GFP_ZERO);

devm_kcalloc will handle the ZERO flag for you.


