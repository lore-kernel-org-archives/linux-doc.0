Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261704;
	b=s/kgEuVc0CLCnZ6Lrqr2x9MBmCkGYVSuLXyZGC1uuAfuIxyUk8hyDzT7vu7IEhD5bIln
	 aZCdiDtnZqn9w9Q8X7C+KZnGG92rL+JnoQK3t27wrB/FWvSgvypl12cIOp92/cmj27NLl
	 FRS6fExC5VopaWMMWxDOpzCUezSZg8uyV+ArBl1id9v8s3CSySYs58xZ3ZonIKyRnjdsK
	 2KvN9kUMaQHodIEoamaSwWlHy2oC9L7NaRHRNlvgmVeXozT0eL+IqmJ/A9oOD48zbP4fj
	 zKy2lQLvBS8yr8yzs2LTMaTKXmuShzl6UYwue7QLaKbkCAxCHpAywWmc97dWvDnDObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=;
	b=nXYqvBc1WOBzfBOOvu9Kx7cCAvjWWSzTLMBcXkOxU5Un9jydO0v0KsAEuW6cSjEV7WDC
	 Gu99k3oraERqS+1IvaJtd6s6AUAcF8TBT4YIRY1tRbyCwERqv/bK6zp9m9lz3e9Aq+64c
	 UAWdY/Qh2rcbTunJmmA95KUU9+AokdUf4dAoTRNpRiTOSAaH50Yirjm3MZaVNkWysjhpC
	 Cwgd80SMS5wXy95aZzZeMFIXn+CnBv50r532W8LRbnjymSH+JeMsvPxl8Rj9aqiJZoeF+
	 OR/EAYhBTOur5YeKj1c43fH2dX+P/13q3wcyy6A8wnFc/WefTpEYrl1wswNLdRr1lnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e7I9DGRY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="h8rrC24/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE27606A325
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 22:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE27606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e7I9DGRY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h8rrC24/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9L9vtK2018024
	for <linux-doc@vger.kernel.org>; Mon, 9 Nov 2026 22:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=; b=e7I9DGRYOGMiGoH/
	9ZoE29LUbkorsFvZdOvL+TFcpTgfHORVobuEWk8PJboxsm+F8FvRZETRWPJ4cbVK
	GUVRv75INA5Iaq/X7r1Xzf6dJRWOo9+iBHur3dSZZas9h9UER+SReUXSWZ8Hr78q
	KtOSrqyXX4pK8SeVyCc81nDoW1zf29dGDIVRLQuGotPphEf3EEPxLOyA5S+3HUyn
	M12UZx7KDkpAErIIRLsrsH2ntnuxiEAE9bKaiy0HqEeM+ncFOy7/UQhSmviQJCeO
	PysqGDgM7FymmEUVNObbm2pGUmVg5WrmxiYG/aMpAQGJec6AE8vg+3c+e0Gwq3P8
	ZjaCig==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg0ejd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 22:01:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3227823eec.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261702; x=1794866502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=;
        b=h8rrC24/Jk3XFZ9fnclCxBB80fVCabImtkDuqauSxM1hUhaAA9eHf41EPZaZLieNYv
         ew25GWNCuyynoO/JurLVxPESl+zOyx+1S+UoyYGcx4pbY6yHLhHVNRM3YyJvEQR8X5E3
         bDZRebq0OGsL8np4uJ+XuFifrCgPflSd06X6ok5yGCv8FJ0r60w2jLy9l0r4ujiye6si
         w6YstoZ9WH5u9WVd0aaNm1SprrLgFhdLkTj+xLIWc+zYmdPgP4UIbXqlvc+nhJLo58si
         bSmeyAN97qFxdWb+e7DzS7an+DADr6FG2Yn6r0IvntaMPIFwTSId8/6thCFzwGeWBn0r
         caGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261702; x=1794866502;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=;
        b=oU6nMLXHGYAEhGbkv0L5Y1y5W/awhC1QlnKeK2lTLqcNtHMa4un1sVOueOeDO1pG6z
         Le9E1dr5+8/pJXD/V7iwn+g/OwyBOMZQMbgOjjg1ipoJwmUsHuUPPiaBp3E9KGskp/6D
         UWXwHn/peomo2shAAlIazLg4RYK7WURl0j+fCiviZb2JcAkKs7A9hzK5/OKDZlyFs3k4
         FW7zL31B1UJbHZFN79tcC13yEK6spOf4WzYihTCun7p/h9Cmwidj+KYpVkal3M7yRVWv
         IeKTIE3zNNwFdLjPRVYdLo1mrl4IjGswdwK3DbjXeqrX9lPgk0wlnuw9iQk0yYzlQTxx
         +4bA==
X-Forwarded-Encrypted: i=1; AL+hErGLD48g7i7wUcO/m0ZWUbJS9X69Y35iCmU35lhdQwZdQXmxHEUhPQHFC74pMDGefJ7Yii1ElOx/7XI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZxKE1P+XW8DFnbABilVUsnSHjrFQ/taFoeFhpy2o55fcdsL2I
	/nYr82oU8sbbXbdPEUn7nnADxvJ2gdtM2ncL/RlcqIP1Za0B2J0pRwx5Y2h8eUxQBCS91HgFwgE
	H3KgHapxpwZOEC8kas9QjcDgf7+KemP673fJkkPgjxxBZA0NOEj99UtjomO5XN6g=
X-Gm-Gg: AYBFou1H81CJLhulokiiBYNVkswQCKsdV9qtkmO/ynkUSI10Aa396PDcy+76s/rJia8
	Q6pGZA3ViCImewJ8tLvamTn9CDIdIX1nGyIdkVC/So6wYZicSBbxoJakRiUM1h7oZUQlpf9qCc3
	aCsmXLS/eOnQMKoD9V8U6zP8QrfHKxZ7d8I/sns4G9nVm5oc3YF7MUt235Z4qwwkjoLqIUlB2St
	3L9Se/f5+wsQVUSrIaEkgC0qp70Buu+8NaKLgU/3kTgoc4Naog3xkcpzkMJhg97ibQkVzK2Z2jX
	1SPxaAM1IIMBs9Se8xQIFvU7IoNFlqpgIJtGZJNP3JbP+fkVoHa+A3wzsaQLbbHyb9YaxA+3guu
	/mCQlQ3ods+jNN8E4HYf+Fh4y2NoPftP6T0DxOwyTWGbtC5VhJvq1c0om0InrCBDEns2ND7wsGd
	xYX/pTUFgCVYAWJXwGPeJcvJdStQ==
X-Received: by 2002:a05:693c:6007:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3751c82f248mr762508eec.5.1794261701752;
        Mon, 09 Nov 2026 14:01:41 -0800 (PST)
X-Received: by 2002:a05:693c:6007:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3751c82f248mr762424eec.5.1794261700734;
        Mon, 09 Nov 2026 14:01:40 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm1118577eec.3.2026.11.09.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:01:40 -0800 (PST)
Date: Mon, 9 Nov 2026 14:01:29 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 03/35] firmware: arm_scmi: Introduce a dedicated
 SCMI Errors header
Message-ID: <20261109140129.00004b4f@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-4-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-4-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfXzYrPtf3EoC4Y
 W7vG8MMQgLhURc1xICa/lVNK1OFRCQmKyyVXMH+w7XBQMvWOW9hAtiNy4bCyBjoZpPP9nDHkKmd
 0Z0Z/CMjcnmTqXsEEaTWbZfbGM4TiZn/mr+e9m8d7Xkc1eHFfrQDTsunkYRYILqBUA40JPWvPjq
 GL24lwwtbffnGDVfu4Fd+VavMvwqeci+X5ykh5kQ+6uI0+2kmQHxtZGCz6DicCkCBZJy6ZjNmJ9
 iOOW/NQltYA4loN9D08cVxiGiac9x43MiLsIFJmMtXkDlZ/iBmMy5ncoRtmNYKi7lQMxvy5pxey
 Wvi0m2JyUb0VRxipF6YdsEpqgC+yP4DMigkIlI68rgok5O662OM+9euOtOG5DlcDdSWRYBJEAUj
 asvhNMquDQpTb/cv0X4rnTupq4de4kxGk/b1/tUckVZb2nlrCQbZn89jdc/aAtjQJUYP13GXdRy
 cJcRbWTge9blUhsUs2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfXzGP2yxK7UKjK
 sanJIh/uR4qAlSoidfweCbBHF1quqD15qqLpZEb5y6+0hgmtL3EHcfk8RYatzRLuVI7GpUvjee0
 JWktJUUthkhvFJ1zqX5dM1eaQR0QW/Q=
X-Proofpoint-GUID: 2dlb37NQBS9RUmsLCjmcFb_w1F4NGZhC
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af242c7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=1uBkIsMKrF2EJPe0UmoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 2dlb37NQBS9RUmsLCjmcFb_w1F4NGZhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090087

On Mon,  9 Nov 2026 09:11:49 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a new dedicated header and move all of the errors definitions and
> mapping helpers into it and out of common.h so that SCMI errors definitions
> alone can be easily included in protocol files without all of the unrelated
> additional stuff contained in common.h

In ideal world I'd move first and add the new codes later.
(so swap this and previous patch).

Trivial thing but reduce the patch size a tiny bit!

Other than that, seems like there are enough of these
for a separate header to perhaps make sense.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h | 43 +----------------------
>  drivers/firmware/arm_scmi/errors.h | 56 ++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 42 deletions(-)
>  create mode 100644 drivers/firmware/arm_scmi/errors.h
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index e3390686fc58..cdd6f887fae7 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -26,6 +26,7 @@
>  
>  #include <linux/unaligned.h>
>  
> +#include "errors.h"
>  #include "protocols.h"
>  #include "notify.h"
>  
> @@ -37,48 +38,6 @@
>  
>  #define SCMI_TRANSPORT_DEVNAME_PREFIX	"__scmi_transport_device"
>  
> -enum scmi_error_codes {
> -	SCMI_SUCCESS = 0,	/* Success */
> -	SCMI_ERR_SUPPORT = -1,	/* Not supported */
> -	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
> -	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
> -	SCMI_ERR_ENTRY = -4,	/* Not found */
> -	SCMI_ERR_RANGE = -5,	/* Value out of range */
> -	SCMI_ERR_BUSY = -6,	/* Device busy */
> -	SCMI_ERR_COMMS = -7,	/* Communication Error */
> -	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> -	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> -	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> -	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> -	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> -};
> -
> -static const int scmi_linux_errmap[] = {
> -	/* better than switch case as long as return value is continuous */
> -	0,			/* SCMI_SUCCESS */
> -	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
> -	-EINVAL,		/* SCMI_ERR_PARAM */
> -	-EACCES,		/* SCMI_ERR_ACCESS */
> -	-ENOENT,		/* SCMI_ERR_ENTRY */
> -	-ERANGE,		/* SCMI_ERR_RANGE */
> -	-EBUSY,			/* SCMI_ERR_BUSY */
> -	-ECOMM,			/* SCMI_ERR_COMMS */
> -	-EIO,			/* SCMI_ERR_GENERIC */
> -	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> -	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> -	-EBUSY,			/* SCMI_ERR_IN_USE */
> -	-EBADMSG,		/* SCMI_ERR_PARTIAL */
> -};
> -
> -static inline int scmi_to_linux_errno(int errno)
> -{
> -	int err_idx = -errno;
> -
> -	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
> -		return scmi_linux_errmap[err_idx];
> -	return -EIO;
> -}
> -
>  #define MSG_ID_MASK		GENMASK(7, 0)
>  #define MSG_XTRACT_ID(hdr)	FIELD_GET(MSG_ID_MASK, (hdr))
>  #define MSG_TYPE_MASK		GENMASK(9, 8)
> diff --git a/drivers/firmware/arm_scmi/errors.h b/drivers/firmware/arm_scmi/errors.h
> new file mode 100644
> index 000000000000..707761cd8d34
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/errors.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * System Control and Management Interface (SCMI) Message Protocol
> + * header containing SCMI errors definitions and Linux mapping.
> + *
> + * Copyright (C) 2018-2026 ARM Ltd.
> + */
> +#ifndef _SCMI_ERRORS_H
> +#define _SCMI_ERRORS_H
> +
> +#include <linux/errno.h>
> +#include <linux/array_size.h>
> +
> +enum scmi_error_codes {
> +	SCMI_SUCCESS = 0,	/* Success */
> +	SCMI_ERR_SUPPORT = -1,	/* Not supported */
> +	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
> +	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
> +	SCMI_ERR_ENTRY = -4,	/* Not found */
> +	SCMI_ERR_RANGE = -5,	/* Value out of range */
> +	SCMI_ERR_BUSY = -6,	/* Device busy */
> +	SCMI_ERR_COMMS = -7,	/* Communication Error */
> +	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> +	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> +	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> +	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> +	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> +};
> +
> +static const int scmi_linux_errmap[] = {
> +	/* better than switch case as long as return value is continuous */
> +	0,			/* SCMI_SUCCESS */
> +	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
> +	-EINVAL,		/* SCMI_ERR_PARAM */
> +	-EACCES,		/* SCMI_ERR_ACCESS */
> +	-ENOENT,		/* SCMI_ERR_ENTRY */
> +	-ERANGE,		/* SCMI_ERR_RANGE */
> +	-EBUSY,			/* SCMI_ERR_BUSY */
> +	-ECOMM,			/* SCMI_ERR_COMMS */
> +	-EIO,			/* SCMI_ERR_GENERIC */
> +	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> +	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> +	-EBUSY,			/* SCMI_ERR_IN_USE */
> +	-EBADMSG,		/* SCMI_ERR_PARTIAL */
> +};
> +
> +static inline int scmi_to_linux_errno(int errno)
> +{
> +	int err_idx = -errno;
> +
> +	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
> +		return scmi_linux_errmap[err_idx];
> +	return -EIO;
> +}
> +
> +#endif /* _SCMI_ERRORS_H */

