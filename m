Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277622;
	b=xb5YtNulMPZOYHN7yHR7v4gcaywGgVBQN+oq5r/lOqLBSWJKmy6/tKQHlvSzsEku6s/u
	 VsQY1wN2FMPQYE6BuSag8r5iYhTVy1OVhnBBqUQn8Qx+1bnhGVba1ej9DWIn92Nu4sAre
	 6EIbzvzH8WxbeTiEEeTpNgUvfWb2sa/rmt3Z9CgenySJbDO92AWKP1Q+sFqiRbfgWBIG/
	 PUnwLvYCPVQ1yCmBfICM9yPLv07+qkfc+JFjcP3HFEgq5oy/LCpeiNF47dJhI1JKLUOv8
	 TTd+KnWvezksbr8EvWt746SjQyUuxhkNXeWS4o+WmdOhHBjQOyQrZKGAJI3OzNjN5rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
	b=V3USgQDSYPEkiVzEs6r2W+CeMRbnphfCDsfC4urreH+a81OvNmxSJl6QmSh3DNHlKU3d
	 9iOcuqP6r2tdVVVwnpgOPi4n+N0zu4b68nK9o44sarcVfCO6N40EujLQGOp3Wt7MZ9nVe
	 ws5cPdT5r1johf3GZGN/KfFphD84AEkvfBDhGbz8O/jQthQyC9+vLV1fVi6Yb1rn5oFHg
	 45UuVDSGhiZzifUSuC+dF3epvqpkcEotVOklD+p0DdTlGW/hif5zXC1JjT8r5o//D6fFc
	 4Cbek5vYl0T6ERabPN3qa76CYBhgCkP2ONlc8mSupT6eL+ieB8vEYf8N7ce8sHeJfuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9EMFaMW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeAFw7uL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A17606A321
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A17606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9EMFaMW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeAFw7uL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j2Cj2474570
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=; b=I9EMFaMWNtXPYRVj
	L2ts+ZenQ+6nxmUJleNtxEjnkHz3rezskY13a1f6Ez+LRG/wi4LpA+bZj24W8Fwo
	1ijJPzgdw38fMJ1QWN3QIxzttF7uPkpeSW+/SRSD6ncdocrklwIhvPQX7FWz7kyC
	w4Jky8HN+OLUKq4ylqg8FrN0MEGZI6u9FuTXt5Cz4tTulb3IFLKZnZeIxNdQrpJU
	RnhfKxU5N/Bk+uZl8OxuB0dOc2cceLkzXktKRvwKv/iylCDprODwPPWP5QsOtfEM
	/kNYe8W57yTImchU58JQdpk3MHzm5zvkgrDHSQr7IuebKMbqfFU/SeRnfi92IlBl
	GW/ksQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg17yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:27:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1959879eec.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794277619; x=1794882419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
        b=jeAFw7uLdCxOnVuJR0L6VFhV2e7MM1ia3jxHJXv3/GO92zyHW1d10+G9gjO0De61oJ
         tY2rEny4IbWXmsuZwb7+tO54JQrKe96LVvWi8vRtyuZTO6+Qmq41S6VOxgXFejyQBHGf
         K/9bPmOgSpOBUghNaXWLxek0LNk6HHM0kSjRF9gTP8hE8mk375NECgKpZXdX8cXahMLx
         d2H62h+ZE2INiz+sgDpRoNnFpSR7YdthVmVyF1rgsPeNm9TT5Acu/qCz009MayFkAwMA
         QN4SB8mOuzuK7Fw6J7FTElWBBxStkMmDHJtDmZC8CYULTiMV/Kwjj+3DWk/g5hNvHuyv
         aVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277619; x=1794882419;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
        b=dMcNWrwAUNMuYzCpIyPKJFtN3dQ+tL4nCRappLNsE8ppCX4N5bm8KgWhbZXIdBjF60
         d2lHb9bYW6Amh3Plo8I9fVWENKmM06uBNQ3EJdzN7qLucq3QDQPu6rSxBo4RB4U+MB7t
         O7biPIWwvdVlKYHDup1UiZmkNjw9h+Of6NNSpmMDyhLgeHqH2S88lOY5jTPHHOZ6p/PB
         OSmGoN7dpbC3NYlM6I0QHreR5aR46sYFBGOkYmpCBkcCuVaKjcn8T2RJjSR7G/LEDfJx
         zO795rCvfC0BxcSFmb427GV4DM8lgOlV9xXJveZdFEIUVQDDYPInq9FBVTzCmeSdrGk2
         H8tw==
X-Forwarded-Encrypted: i=1; AL+hErErfx2cHvJSU382B4dvAHP1Jc18oiuI9u27AY4ePUYfEv+pzzBglLmk4Q6MiEsW8S7xQ/BZjF1cAC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R/X9spJX4RdOOZhWYjRrRFPkZSO+cTZNvFuVR2Le2cHUrVaNU
	c5RpK7QCeXUVgRi+7r0y3PeXeEhQNhkgt8o9PIJDPkNQN8ph7SN85I5nsgDMp370rJsuHFQRtQi
	o9oKss9qqB2WDpqnk9w+ITnrKM0opUYT7FBlq3DO9ByJsYbsai1w81qHOAynML5Y=
X-Gm-Gg: AYBFou3lsNZIT9/l0tHj4/6RwznsVdN0jh6MZ2Pt2hkqq2/EOXkIF8WzHCaMM1Xfalg
	wm+zZcuM0SQCRns5/HM/R8Vy7Txq77jr6yvImRvfrRgJ5ZeRhTN8cr6y3Ew1hhUTC5IPY1XpCrA
	gefYB1GyQLFGM//5JYEKB5awhlAzkJPUCTQMSedYUp4ZeSzx+g1kd+qBftYt8GmIZP4LdM7dGZi
	zslPEjsU44O53AzatcJ1hGXthfDxPmeaRcKyvpeNDwkC3NSf3VmUJpoOg6OLVuG3vUuObdBx7yR
	oBckPB/gK+k+t/ai0RqQXtuXh9uwCOBId7H6foDWVkGjiqgSimpMrooA08jmT+CjYS+hTbMVp5L
	q6Nh2jUMDlj2A8RNmkEqa9BEM1y1hjT06ywgB86ynixtfWyvb/PTqcsNatOMas2y0jKMn3d0KsD
	FTne/7WoPiIwlKR6smv8CN2UnunA==
X-Received: by 2002:a05:693c:41cc:10b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3751ee7c792mr1574087eec.6.1794277619112;
        Mon, 09 Nov 2026 18:26:59 -0800 (PST)
X-Received: by 2002:a05:693c:41cc:10b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3751ee7c792mr1574034eec.6.1794277618398;
        Mon, 09 Nov 2026 18:26:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm2466798eec.8.2026.11.09.18.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:26:58 -0800 (PST)
Date: Mon, 9 Nov 2026 18:26:54 -0800
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
Subject: Re: [PATCH v15 13/35] firmware: arm_scmi: Add Telemetry SHMTI areas
 enumeration
Message-ID: <20261109182654.00003f6d@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-14-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-14-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwOSBTYWx0ZWRfX5yQyZDSkG8ME
 tQY/aS6re03OQPqHX7Pz1jjJ36I6NjRjOFVpE5w8FeSdRKtXUhp9ks7ZGz0Dkuwb/OtCjAn5MEg
 WQZiS9AsinbPxVopTbUNni9PD/5ogafrp8QeQqcf0PuUOp4RoP32Q+dxSIKU55NJj7xRNPN6Hk9
 VzGk2zuBvEFKfz+9v2MxPFH8vAtx2N6F0cNm2YaM40C30jApnzDMyI7hK44PtTz4cyq1gcKCb7y
 BNvFJJEM7bacnzqXtnTxbyo9sXjRTxs+3DWjLHofQZxcLjhOzAqkaHtLB/wmcwgADd+pHiU5Uzu
 qrg4wmcgT60lNhiB09IfKjeHdF+wg6nEAKwkt5qp9o0kGyqbHfx3ztdh7vOSYI+rudBtTNtgpbK
 HJq/sdshYDqnaKcDVL3oalAVI6a0Aw0pX3kqHHr7oLzfNZOn/qbos6LF05IC0xXdd5ZHwFo2ltA
 JT33VpeW/WkwV+V6fFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwOSBTYWx0ZWRfX1hpjknhd040E
 YHbVi77R7j+/yZKde4b0MYH9Obliban5ZJAxwpT0ZF+tNacOspXZiLskNTmp1PYwixkro8LcT2F
 NP/ZzrHeor2ylh53WyhZx0XzHFjSGKM=
X-Proofpoint-GUID: B9woq8tT0aQxRIJEAgjcyCOEVSu-hA6S
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af280f4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=UCLCd_48klQTlnfJctoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: B9woq8tT0aQxRIJEAgjcyCOEVSu-hA6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100009

On Mon,  9 Nov 2026 09:11:59 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add Telemetry support to enumerate SHMTI areas.

I'd be tempted to leave the local data structures like snaps to
be introduced only when code actually uses them.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - fix prologue/epilogue endianity fields
>  - rework SHMTI initialization and allocation
>  - add snapshot suppport data structures
>  - added alignment checks on SHMTII length size
>  - fixed error string formatting
>  - warn if less than expected SHMTIs are enumerated
>  - improve memory area sanity checks
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the
>    SHMTI areas enumeration routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 312 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  59 +++++
>  2 files changed, 371 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index e57534c93b26..d9f1a3e3468e 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -16,6 +16,7 @@
>  #include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/sprintf.h>
>  #include <linux/string.h>

> +struct scmi_msg_resp_telemetry_shmti_list {
> +	__le32 num_shmti;

Add a comment that this is not actually the number of shmti. 
Not confusing spec name at all.   Maybe just put a pair of
extraction macros right after it like you've had for
some of the other similar cases and that will act as documentation
that not all is what it seems.

> +	struct scmi_shmti_desc desc[];
> +};
> +
>  struct de_desc_fastchannel {
>  	__le32 addr_low;
>  	__le32 addr_high;
> @@ -107,6 +121,72 @@ struct scmi_msg_resp_telemetry_update_intervals {
>  	__le32 intervals[];
>  };
>  
> +/* TDCF */
> +
> +#define _I(__a)		(ioread32((void __iomem *)(__a)))

Is that really worth doing?  I think I'd rather see some long lines
with that expanded out.

> +
> +struct prlg {
> +	__le32 sign_start;
> +#define SIGNATURE_START	0x5442474E	/* TBGN */
> +	__le32 match_start;
> +	__le32 num_qwords;
> +	__le32 hdr_meta_1;
> +#define TDCF_REVISION_GET(x)	(le32_get_bits((x)->hdr_meta_1, GENMASK(7, 0)))

Outer brackets needed?

> +};
> +
> +struct eplg {
> +	__le32 match_end;
> +	__le32 sign_end;
> +#define SIGNATURE_END	0x54454E44	/* TEND */
> +};
> +
> +#define TDCF_EPLG_SZ	(sizeof(struct eplg))
> +
> +struct tdcf {
> +	struct prlg prlg;
> +	unsigned char payld[];
> +};
> +
> +#define SHMTI_MIN_SIZE	(sizeof(struct tdcf) + TDCF_EPLG_SZ)
> +/* An arbitrary upper bound to avoid crazy allocations driven by buggy FW */
> +#define SHMTI_MAX_SIZE	SZ_64K
> +
> +#define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
> +#define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))


>  	/* Mutex to protect access to @free_des */
> @@ -878,6 +960,211 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
>  					ti->info.intervals);
>  }
>  
> +static int iter_shmti_update_state(struct scmi_iterator_state *st,
> +				   const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +
> +	st->num_returned = le32_get_bits(r->num_shmti, GENMASK(15, 0));
> +	st->num_remaining = le32_get_bits(r->num_shmti, GENMASK(31, 16));
I'd move those two into defines above, just to document that num_shmti is more
complex than it seems at first glance. Also for general consistency.
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	return 0;
> +}

> +
> +static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
> +				       const void *response,
> +				       struct scmi_iterator_state *st,
> +				       void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +	struct telemetry_info *ti = priv;
> +	struct telemetry_shmti *shmti;
> +	const struct scmi_shmti_desc *desc;
> +	void __iomem *addr;
> +	phys_addr_t phys_addr;
> +	size_t len;
> +	int ret;
> +
> +	desc = &r->desc[st->loop_idx];
> +	shmti = &ti->shmti[st->desc_index + st->loop_idx];
> +
> +	shmti->info.sid = le32_to_cpu(desc->id);
> +	shmti->flags = le32_to_cpu(desc->flags);
> +
> +	ret = scmi_telemetry_area_check(ph->dev, "SHMTI",
> +					le32_to_cpu(desc->addr_low),
> +					le32_to_cpu(desc->addr_high),

Same as before. I'd do the build of phys_addr and len outside the
call. Keep it to checking validity as it's name suggests.

> +					le32_to_cpu(desc->length),
> +					&phys_addr, &len);
> +	if (ret) {
> +		dev_err(ph->dev, "Malformed SHMTI ID:%u. Abort.\n",
> +			shmti->info.sid);
> +		return ret;
> +	}
> +
> +	if (len < SHMTI_MIN_SIZE || len > SHMTI_MAX_SIZE) {
> +		dev_err(ph->dev,
> +			FW_BUG "Invalid length for SHMTI ID:%u len:%zu. Abort.\n",
> +			shmti->info.sid, len);
> +		return -EINVAL;
> +	}
> +
> +	/* SHMTI base phys_addr SHOULD be 64bit aligned by the SCMI spec */
> +	if (!IS_ALIGNED(phys_addr, 8))
> +		dev_warn(ph->dev,
> +			 "SHMTI ID:%u is NOT 64bit aligned (paddr:0x%llX)\n",
> +			 shmti->info.sid, phys_addr);
> +
> +	addr = devm_ioremap(ph->dev, phys_addr, len);
> +	if (!addr)
> +		return -EADDRNOTAVAIL;
> +
> +	shmti->base = addr;
> +	shmti->info.len = len;
> +	shmti->info.phys = phys_addr;
> +	shmti->info.offset = shmti->info.phys & ~PAGE_MASK;
> +
> +	ret = scmi_telemetry_shmti_validate(ph->dev, shmti);
> +	if (ret)
> +		return ret;
> +
> +	ti->num_shmti++;
> +
> +	return 0;
> +}


> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index f38ca2f8099b..b7b8bd77b37d 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -830,6 +830,57 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  

> +
> +enum scmi_telemetry_compo_type {
> +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> +	SCMI_TLM_COMPO_TYPE_CPU,
> +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> +	SCMI_TLM_COMPO_TYPE_GPU,
> +	SCMI_TLM_COMPO_TYPE_NPU,
> +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_IPU,
> +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> +	SCMI_TLM_COMPO_TYPE_SOC,
> +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> +	SCMI_TLM_COMPO_TYPE_SMCU,
> +	SCMI_TLM_COMPO_TYPE_ACCEL,
> +	SCMI_TLM_COMPO_TYPE_BATTERY,
> +	SCMI_TLM_COMPO_TYPE_CHARGER,
> +	SCMI_TLM_COMPO_TYPE_PMIC,
> +	SCMI_TLM_COMPO_TYPE_BOARD,
> +	SCMI_TLM_COMPO_TYPE_MEMORY,
> +	SCMI_TLM_COMPO_TYPE_PERIPH,
> +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> +	SCMI_TLM_COMPO_TYPE_LID,
> +	SCMI_TLM_COMPO_TYPE_DISPLAY,

Die 0x1d is in the version I'm looking at. Perhaps a comment
for specific version of spec used.  I'd also
be tempted to assign every one of these as it makes
it easy to eyeball an particular one vs the spec.

> +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> +};


