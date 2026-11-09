Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268645;
	b=Nf/+keHdNUK9+XkPnCz3A8OCXB7Owl4W3kij+/NJySrlYB42/FaKoP02rYziFTacn0kT
	 /wH3QsmqUMzzpDhDhJ1lWKdtq5MG/qzUEhJ3mHpU+CtTdL3eU4HgOd/4VYC8ruBkg7XYK
	 2SmQwdpMnmntOR2pjMlafjd1Ti7KbxTL1zqJWa/482exp9Ys9QkfPYlvDgAmnmXFE8Rsk
	 n054McFIQdPkiuvn2xaRQuUq98f7MKaO77t9+EmdJld4ZiYaHYXB2lAFlQW18tMqU9nGN
	 I14H1bVE4d55d7RA4xRKcjc8obzRd8nvtML8k90HL25tBLdBoOUpke2EAB4vfiDAloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
	b=O2sqZ/Tdc+YVbaU+wQo65ugFFnj0VUj00yoZXgS5laPSOOS0DBa8dNg+EWG1PY/uuY2e
	 X/1H6YioXTqDe137btI+EdfGjcHO2v0v+kJl3hO/iwrQIBGeNGauzI/rB/lixF5Nmv/gu
	 P4Dfidaici1lVZj1+PWFoix6sS1oVOCY9XpPxTxgqxRehQAE58Wtvz2+ezZ4PnJGS13qL
	 HD/5CudsRftZLDebeHexLynTJuuw+p9xal1QRfXhdA4RKMZ/BWpiWxlYxCu9qoXcK6K+8
	 mo2jYptFvKuAQn418tSmlSz2vWRIXLZ6EJdCuIx4WNZlEvTRxE3scywR51FlIUBAmCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P7df/oHK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gVv1/uPl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17F06071819
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17F06071819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P7df/oHK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVv1/uPl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAPq41401226
	for <linux-doc@vger.kernel.org>; Mon, 9 Nov 2026 23:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=; b=P7df/oHKtu/L6AL9
	oqYI7wHDYo8ud+Jllx28MBig/s6ZgrSXgSZD/FmgLmOSw5KhdD0OIUqoIHDM3uhE
	GX4utPRN8O+heRLZjQvIie38noeZiaKYJM2rNyww0+N7G9FxR2/0uxvIbYHjSTP6
	lkHtRnEJdrfspa4LbZoWMf2Y5rIOSc2paYFC4vVRQGNJn0cxWNfvI9SmfEixSX0c
	HH7pwFMAze9twemWpnh7rHEe5nxk/O8tSMu9L8qDMpYnXTsET+ldsCQ1d0mknyMH
	kKoK3cS+h8m8jc8CGvh2/lh9LO2Yfq/NQ5ukTOXIXU9HrKzcNagmnCTiUd8YxLZa
	/MbDwQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2m23r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 23:57:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so259476eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794268642; x=1794873442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
        b=gVv1/uPlgCLww/HUdkfYCw4cN6zYD+rQ4YDn/MY//8kQPqwadDyGeFNuprOMHq6GSS
         LxEvlSpLLCJMgXiJJMKaMBXgW5OLUZHUOWsYRljWN0125SoO8R6uDjs1GjEmKPjn2II5
         ogV2D/awHsx86yay6dQ5CBlWq12WlpAdImjeI7FzWaCB20x3Wvjk9sr3WNf0XVZvRcyF
         biUPB/FsdQ+yZDQ7Z0/4dSnvae5NrRPDlv1LPYNJJMJBw0TI9DmMdkUd6x20T2nVLfer
         R2thru6i8VbcpZ2NWWUDC67i0QBz+dqpWGtQ0U9JnnNHDIGJoPidYZEInUdsFaYsouH/
         tW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268642; x=1794873442;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
        b=Bu4+v3QUiaJuXjktM+COF/lSXwrHAblZ0Y+uvxZSfY7Yt/xBAGryfTT7XBinNtsfM7
         6aaa4I1wTE3JkrO9Kq3Yu2paHgvY50jzPTkWS+RzsENC1rIto5es5XoGa3SY+fXY5jKB
         pidWivekzyCEa/AlhRKCLLJQL7ppieU9TRNqFqC1rvs1EtLsekmEf1d07tDpyis+B1pT
         lGXZfQtFihIAVHgFkfca23W4tjTo0RNHrUjW91oWnlPiX5DSp2XxGExCxoyJEqtnjsOj
         PwrBfl+qwKk8q+rJr1GY1s+EQiKN3KyL0itkFq4KpFwi2q6DNhQIAT9ARoKowbV5wjl2
         WUxw==
X-Forwarded-Encrypted: i=1; AL+hErG9YXR11Gc5tZ3Jwg90UxBVD1jP6UMJYuBx8wWu4KK7l/4ClAeCnVjQMWeeXN+cvHxzSC+QRnCRIPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Kc56i0BfNXvZGaEHVqSrLXo7jn9hXXWYdbRpaqca8cOk6yyPx
	kwejp8N9sgslIYCtnN21zw4jM4aMkFEYaLiIxz4VPqw/OEbBtwDmkDxkl8WTG7+NvxaUoEiIWv9
	fyP+uJAjEqcDjOZud505rcaHUq1fDOrzPtyuY4GmTH5mxGynY72OaCEJeuAtCneKIY38bYTE=
X-Gm-Gg: AYBFou22Vq4hgs1HIIVM7leA3/ED/MHkJXoN8/L1dRmkz/xFUpfXHgT56NzeYG0o4md
	asnDgDSsEXPhbh8Gl8ae5q2nOtkCHTU9TmUFzscGcp5rk42zgaweLVyCCEj0LDM/PIwPS+TTD6U
	LHPr/MUyg+xqWmZuYcVj1eqJee1mBN/xOHzHmMfBaBFP2euI3oIQQv/U7TNY46WAbq0KouZho1u
	JdZeOMEb8ve0W8AocmFyydS/5f/mfBHFTysnwTzRO5CI7mYusM+nC8ZWiMpwKgPky5f7StcQBAj
	3+YIoq6plNvb5u+JMi7wNnBKIMMtyd1rKknE7qJZclaonx93vMy2uFa/c405FRSKgntWOIJ8iKE
	6Xuw15YrPJNYLwI65bLaP9EVMkdTvo39v379Vw7bGkm9LLf6/14d9ElrwZT+Hz5pGlLHjn21wih
	cwZKYZUQnUVoo+lZZHKUYS6I151Q==
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1153098eec.21.1794268641563;
        Mon, 09 Nov 2026 15:57:21 -0800 (PST)
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1153056eec.21.1794268640929;
        Mon, 09 Nov 2026 15:57:20 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm1608728eec.13.2026.11.09.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:20 -0800 (PST)
Date: Mon, 9 Nov 2026 15:57:09 -0800
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
Subject: Re: [PATCH v15 09/35] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261109155709.000059cb@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-10-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-10-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af25de3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=FN7pwp8LrHzWrJGgN4QA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA5NSBTYWx0ZWRfX9woaC/jSomhY
 cCPBohtw7pV3YHpn5Wa1MFsYh4CcFhh6bYn+wGeR1HHy7TgawsuO5v2vtTLKe133LWfAX27RZwZ
 G87o3QQ/IxsoQyFtHYkoMR+sOf2FWvhvuGV9wIPSpWnhY0CD34GR3ZsqUvNVLeOGxumdA7tfeNK
 RCPZbPsA/RYOXQqRaLc2ZMxiXTuJKSL7/+TYfIl2m4J/xCOAICs/BmKQxufa0TRFJeF3Gct/xwz
 eeyNyTNqu5WBqKRpXo30MOR/qacsKUAgZ2VrYRViXsSQY9sA51PMrxhBMlLQ7+OOv82sauSfU6K
 cr7FcA2LNrgqvU47y89aFU58pNMoW16OqTedIpKwETWA3kVMgy+M5mEBABl0+01PztTj2yeXWNN
 US6+lEscL/RwVF/OO3xG6JHmm2T4UMljehKjnEnp7BYfmVMGmg62zIvgtvsD4fxExk2x+USs14/
 EAQyTvbRtp4GTaDItMQ==
X-Proofpoint-GUID: -5IkLFe7C6fwY4rFJLpsIZXX0xFcpi_k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA5NSBTYWx0ZWRfXzIk9Bnj+rz6V
 xOPTjr5waZfGz/Cm9pi6MPdRxLQptE0MGA1j6MNGZq8uEd9Jj+PoY1NqZExf4Guupf/rYoo3Qfu
 7qWir6zxtV3texeSUJUb4cD6pHry+8M=
X-Proofpoint-ORIG-GUID: -5IkLFe7C6fwY4rFJLpsIZXX0xFcpi_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090095

On Mon,  9 Nov 2026 09:11:55 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor things inline.

Thanks,

Jonathan

> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index d1f1bde8a7cc..77daedddaab7 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -410,5 +410,6 @@ DECLARE_SCMI_REGISTER_UNREGISTER(sensors);
>  DECLARE_SCMI_REGISTER_UNREGISTER(voltage);
>  DECLARE_SCMI_REGISTER_UNREGISTER(system);
>  DECLARE_SCMI_REGISTER_UNREGISTER(powercap);
> +DECLARE_SCMI_REGISTER_UNREGISTER(telemetry);
>  
>  #endif /* _SCMI_PROTOCOLS_H */
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> new file mode 100644
> index 000000000000..23eaac485691
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Control and Management Interface (SCMI) Telemetry Protocol
> + *
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +
> +#include <linux/atomic.h>

I'm not immediately spotting this being used.  Perhaps take another
look at whether some of these should wait for later patches
where their usecases come in.

> +#include <linux/bitfield.h>
> +#include <linux/compiler_types.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/sprintf.h>
> +#include <linux/string.h>
> +#include <linux/uuid.h>
> +
> +#include "protocols.h"
> +#include "notify.h"
> +
> +/* Updated only after ALL the mandatory features for that version are merged */
> +#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
> +
> +#define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
> +
> +/* An enum listing the protocol specific commands definitions */
> +enum scmi_telemetry_protocol_cmd {
> +	TELEMETRY_LIST_SHMTI = 0x3,
> +	TELEMETRY_DE_DESCRIPTION = 0x4,
> +	TELEMETRY_LIST_UPDATE_INTERVALS = 0x5,
> +	TELEMETRY_DE_CONFIGURE = 0x6,
> +	TELEMETRY_DE_ENABLED_LIST = 0x7,
> +	TELEMETRY_CONFIG_SET = 0x8,
> +	TELEMETRY_READING_COMPLETE = TELEMETRY_CONFIG_SET,
> +	TELEMETRY_CONFIG_GET = 0x9,
> +	TELEMETRY_RESET = 0xA,
> +};
> +
> +struct scmi_msg_resp_telemetry_protocol_attributes {

I like clear names as much as anyone, but probably wouldn't lose much by
abbreviating a little?

struct scmi_msg_rsp_telemetry_prot_attr
perhaps?

> +	__le32 de_num;
> +	__le32 groups_num;
> +	__le32 de_implem_rev_dword[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +	__le32 attributes_1;
> +#define SUPPORTS_SINGLE_READ(x)		(le32_get_bits((x), BIT(31)))
> +#define SUPPORTS_CONTINUOS_UPDATE(x)	(le32_get_bits((x), BIT(30)))
> +#define SUPPORTS_PER_GROUP_CONFIG(x)	(le32_get_bits((x), BIT(18)))
> +#define SUPPORTS_RESET(x)		(le32_get_bits((x), BIT(17)))
> +#define SUPPORTS_FC(x)			(le32_get_bits((x), BIT(16)))

I guess a local style thing but my normal inclination would be not hide
what is going on here and instead define
	ATTRS1_SUPPORTS_FC BIT(16)
and use the le32_get_bits() inline.  These helpers have lost the connection
with attributes_1.  

> +	__le32 default_blk_ts_rate;
> +};
> +
> +struct telemetry_info {
> +	bool streaming_mode;
> +	unsigned int num_shmti;
> +	unsigned int num_des_tstamp;
> +	unsigned int default_blk_ts_rate;
> +	const struct scmi_protocol_handle *ph;
> +	struct scmi_telemetry_info info;
> +};
> +
> +static int
> +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> +{
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;

It feels like this is in the function scope rather than the if (!ret)
mostly because it has a really long type name. See above.

> +	const struct scmi_protocol_handle *ph = ti->ph;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;

I think this would ideally be in the if (!ret) as well which makes
more sense if the declaration is in there.

> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {

Maybe given long lines and indent, this is worth a helper function.

> +		__le32 attr = resp->attributes_1;
> +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +
> +		ti->info.base.num_des = le32_to_cpu(resp->de_num);
> +		ti->info.base.num_groups = le32_to_cpu(resp->groups_num);
> +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> +			de_impl_version[i] =
> +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));
> +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));

I think that mask belongs up with the structure definition as people will want
to check the whole thing in one place.


> +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 3f7cc35eb861..f076ce5601cf 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -2,17 +2,19 @@
>  /*
>   * SCMI Message Protocol driver header
>   *
> - * Copyright (C) 2018-2021 ARM Ltd.
> + * Copyright (C) 2018-2026 ARM Ltd.
>   */
>  
>  #ifndef _LINUX_SCMI_PROTOCOL_H
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>

Not seeing use of that in this patch within the header.
Perhaps it should be included in a later patch or in the c file?

>  #include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -828,6 +830,35 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +struct scmi_telemetry_base_info {
> +	unsigned int version;
> +	uuid_t primary_revision;
> +	unsigned int num_des;
> +	unsigned int num_groups;
> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuous_update_support;
> +	bool per_group_config_support;
> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +};

