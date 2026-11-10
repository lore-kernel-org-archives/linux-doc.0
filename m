Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276480;
	b=tXu+pLQdf4ZaN1vpYl93ypqa/oz/u0/1JYD2mJzp+I8NEYAGymmT8ZNdb0r362JT61B6
	 D0UHcBAhSYKIvqPWgjJg8CjuxIu6Bp1Kk8La5t7QwXxu9yYWTxWFoa0J8XhSpjw76SY9B
	 WnHMrW6KC4F1IcxNAwQ9ltM/t2t3bL5vhnLl9xhrQpACD9esq+MY5BJ33hSeHpqkaHjNU
	 A/6F0V7zOws/2h7BjsaNFn3PTWZGTDX5z0qMRtj+5hg6azAuNdcjvOXGiU2W4YvMlX2+l
	 IYcbiNfAX1lEHLS/MO3WHJGDOaNl6DAlV5GO/zd3NEd1ngojQC7ysHdjrKzXyGMvoAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=;
	b=LWztf6ddVVt9J+4S/u3Tbbv3i54bQA6hylzesLjUSoTOjSb1u3RmkS+rusK2qfNDIwqF
	 rxupBdD+TEmqxNQNDSeXyuWTlf9RBSBIBMp2Ob2LYOnRq9Fe+GzF0yiEOqWYVA7Pi0WzR
	 x0nSgzMRHF2r5PdEc+xpi0Gsbtd5+du5Z5q1HLJBR5+2vVtex2vc4/X3w97qewlZoti5N
	 YgXfXfg7P4FPq4m8Vd4CgXfjUBMgg1eHGtwv7+cj9DH2nifK+pNzZJEMmpxPiodNt62ZB
	 Dv0aeMQsuOGvszPBmtdwW8oSy+fXhDpKRswq2GILG90SosbzltuCuQa5wOVjFTD2nfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mm9NkHN6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLPLNYtj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AB1606A33C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AB1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mm9NkHN6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLPLNYtj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j7VH1853887
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=; b=Mm9NkHN6Zj756Mhy
	mSX1hHZcKC+vcG5YLjqGOa5t+mJxEXGCK2zfLfPBDmsxiQ/MehoccxiCria080oN
	bkYpObyiygb/TnV68u+OOYaB7iUT8Pw4YhuRBzmKlsr/f77wsfV1xLGoyuofOE1Q
	cvPjEyxsUZIk0sN75d/r/oeeFh6MjrQjf9VXbTId3lTOa7lnOdjJW1X4Szua5bfI
	fmI6n6BYE4hnUWF4ev35kGreXzpT0OOnI8Q7ei5nAdXJmd+h9Bzdl8Mq2QCnilyS
	zIOJL297SWPq0u7MMzRQCwqfnj+AmPyWPLa/f+nlKeJv1mGyhDIejbJtB2R/ahBZ
	NpRV3w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2metr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:07:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso813590eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794276477; x=1794881277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=;
        b=eLPLNYtjfhShMTjdtQSuobm+92iNjNjsMgpwcCQiWSavcphETKxVUYkLrUMVGHcCFT
         FhlZBH7wm8YaE/zrgBzRweWDXogYcRbLPHceaVDFR5yrBgo6wG8Rz4Xllyp4uNfk2Hqw
         0gpGtcUjDkWyg+FJ9Y0WvHKoQXqwzvQYsH/U/JLCAFG11m8htLTAD2NvswRs6qoRJW32
         z/JL2ZTTmsGA6T9s1lsJHLFuvxUh9GFIm6TWwmzSrbRW6MaJqmvLOPXn5Zaqcl1PpNf8
         wj+PX/VCs0GZicIp2nSCeEc8Fajo/KH7yjYUbczOJXR9O9hkNITlU0pukwt2FF8WxXrf
         dF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276477; x=1794881277;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=;
        b=iqet5p54VeOryuXogep1sfA+ViylOKAf+W71yEIKcH1Nwy0I9W48o9O8/ri3M6rOMC
         pULg5QHIuK18j/rPoMyR8JbEHhX2cnB/j3tWU/b2bXv7CtVoMuQ7ov78D5/8fLf4IzAY
         0HWVj+MMwIQV/j7WJ5B4AwS05QPyf3entO+fhytZCwuiAcntYKHqYV8CCEcM9FJM2g+A
         pe4JJmnCzCwZUd8EPCVB8kMQ07z3Cofl3XZKIFjwhTr+5BHOP3sKiu3AVRaByy5d7BTa
         sASp+ugXe3vqeTNrXBr05eHg8JDRRMaic58opge8b+fVibSjAo/vPQRnhqPxtbe5hPdG
         FEWQ==
X-Forwarded-Encrypted: i=1; AL+hErH7ME13nKggZcQ8sxw6pEuI6iUq6GtTq6qqSX1CPtuq1v1xZjOs4sdNTm4ZU10GXH/SI5/aCYG0VK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gu2SmU/d2PQ8ADVkZ1bUCCNhGEWatTcNQZ5AFHQi4YO15ARt4
	6A2kuA/Kunz+Cxm27hAFxx6J9gRNMIFsKjPbZVawKrZN9j8SM5RzOssinTEMqdf3QKbAmdr/Abw
	rZ/govisXvqLLi5KmddsvKkCbzMWG+GcU1zRmF/sDlgXq6sf5ROasVOfhWZOfy4A=
X-Gm-Gg: AYBFou2+XCMy2Ao3uI9ZDmz0IUCHTczwi4DsBTdUaBGtBfWlBK0pNccKovv13GyXreE
	mO3+PCbHSW3dTM1ksRLLd+WXD145Wsa1wWjIJzC4h/2IrPYABLkE1uIw/D0KJlpjbzQ8BSqoYfz
	bl+cVeMI/R42hUFdmOiCKszl6s+veeqna7nfxeW4yVVVYpcchcndf/tjErq5DCm7Y2SwoaRD1AQ
	gUzXnKrzzLJvE/455t9gG1S0QMwp+7uaFqlBIRwlaRErI2Sk9t4JARe/+XQ/XyF/sVnwuMPjVgU
	RB0Ujhs4yVmLJSYz8boxpiRE4uXzmWo7sB3zp/ymaSI0csMaAWRbYPT9H+6foVZAKKq03gM3zhn
	TmHvjTS3brLlbRdXMIlWqoPa29aPP+BLQNVOy6Jb9o9KdTPFJPvnKjYPr24sM0gRx/Osi7fq9sE
	zm6SqLYTHQUxSO0Ax0+jcSOhrGBA==
X-Received: by 2002:a05:701a:844d:20b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b3b5fa29b1mr1724887c88.1.1794276477139;
        Mon, 09 Nov 2026 18:07:57 -0800 (PST)
X-Received: by 2002:a05:701a:844d:20b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b3b5fa29b1mr1724846c88.1.1794276476426;
        Mon, 09 Nov 2026 18:07:56 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm3158465c88.4.2026.11.09.18.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:07:56 -0800 (PST)
Date: Mon, 9 Nov 2026 18:07:50 -0800
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
Subject: Re: [PATCH v15 12/35] firmware: arm_scmi: Add Telemetry update
 intervals enumeration
Message-ID: <20261109180750.0000150a@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-13-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-13-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af27c7e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=M8WuIlgHp6E56V_sPrAA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwOCBTYWx0ZWRfX+G8mdJSeMZdR
 rifx5cZnsxl5ee9iDmo7z9tqdMW295wVJc104EyIubuEpodOx3NiuyO+o7DB7y4ieuEb++McV/D
 vUcpTYj52HsfExwqHDT2cYxiDc3M+53XOLA+WILywq94VQH0hrbWUxfVCw0/5Q8bqmgU+W6tVBd
 wcCROB8RnpK4bhsIQLev5hTUM51wF/jkf31XKfvcqPKWZiaHbWsMeDF8m9OvOHxCBpjN1324THC
 L3KyNDkWJMXsggJh5IXbqbO9WV45CgGsMSmK+oe1nApVKmIIrKZjHAGdqaDR20RKrc+ZJIEIcnZ
 FicsE29mQ/z/cvyj7Jrd26JPOLNXkjkJM5snK/pS9/OF5PR+BP5Y3675daALFUwvakpaCKOIW1x
 s/cG/lvflXl3xRQeUa3IfD50lbHzDO7rTFBSZQbrjh42PKRX2f36ZDa5r/xbGPstPIWDQJ84WRV
 fOLYKWkQfSeEdVYqJLQ==
X-Proofpoint-GUID: 7DR6X8ziknIjWxyGOcSE7kiyCccmeoqA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwOCBTYWx0ZWRfXzXrqamrTdpWG
 pUFcRfYCRFmhqsDGygxIVQCRBa70ppQDuJOOmymIkONtGCOkqAbC0BABD6OTezRdG46wYUqZXgd
 BcKPLpTeX58j7C7VDWZcUMvNmx+TQ+4=
X-Proofpoint-ORIG-GUID: 7DR6X8ziknIjWxyGOcSE7kiyCccmeoqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100008

On Mon,  9 Nov 2026 09:11:58 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to enumerate available Telemetry update intervals.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - removed unused dev reference in interval parsing
>  - added missing initialization of intrvs->grp_id
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the
>    update_intervals enumeration routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 198 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  21 +++
>  2 files changed, 219 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 9944506652f5..e57534c93b26 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -92,6 +92,21 @@ struct scmi_msg_resp_telemetry_de_description {
>  	struct scmi_de_desc desc[];
>  };
>  
> +struct scmi_msg_telemetry_update_intervals {
> +	__le32 index;
> +	__le32 group_identifier;
> +#define	ALL_DES_NO_GROUP	0x0
> +#define SPECIFIC_GROUP_DES	0x1
> +#define ALL_DES_ANY_GROUP	0x2

For previous defines like this they have followed the value they are in.
So I think these belong after flags.  (That fits with common practice for
this sort of thing which is why I looked).

> +	__le32 flags;
> +};
> +
> +struct scmi_msg_resp_telemetry_update_intervals {
> +	__le32 flags;
> +#define INTERVALS_DISCRETE(x)	(le32_get_bits((x), BIT(12)) == 0)
> +	__le32 intervals[];
> +};
> +
>  #define IS_TDE_TSTAMP_TYPE(__t, __ttype)	((__t)->ts_type == (__ttype))
>  #define IS_TDE_TS_NONE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_NONE))
>  #define IS_TDE_TS_LINE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_LINE))
> @@ -693,6 +708,176 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
>  	return scmi_telemetry_de_groups_init(ti);
>  }
>  
> +struct scmi_tlm_ivl_priv {
> +	struct scmi_telemetry_intervals **intrvs;
> +	unsigned int grp_id;
> +	unsigned int flags;

Given these are fixed size, maybe u32 for each of them just to
make sure that matches up.

> +};
> +
> +static void iter_intervals_prepare_message(void *message,
> +					   unsigned int desc_index,
> +					   const void *priv)
> +{
> +	struct scmi_msg_telemetry_update_intervals *msg = message;
> +	const struct scmi_tlm_ivl_priv *p = priv;
> +
> +	msg->index = cpu_to_le32(desc_index);
> +	msg->group_identifier = cpu_to_le32(p->grp_id);
> +	msg->flags = cpu_to_le32(FIELD_PREP(GENMASK(3, 0), p->flags));

Need the mask?  It's valid but I'd expect the protection on sanity
to be at the point of p->flags being written rather than here.

> +}
> +
> +static int iter_intervals_update_state(struct scmi_iterator_state *st,
> +				       const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
> +
> +	st->num_returned = le32_get_bits(r->flags, GENMASK(11, 0));
> +	st->num_remaining = le32_get_bits(r->flags, GENMASK(31, 16));
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->intervals[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	/*
> +	 * total intervals is not declared previously anywhere so we
> +	 * assume it's returned+remaining on first call.
> +	 */
> +	if (!st->max_resources) {
> +		struct scmi_tlm_ivl_priv *p = priv;
> +		struct scmi_telemetry_intervals *intrvs;
> +		bool discrete;
> +		int inum;
> +
> +		discrete = INTERVALS_DISCRETE(r->flags);
> +		/* Check consistency on first call */
> +		if (!discrete && (st->num_returned != 3 || st->num_remaining != 0))
> +			return -EINVAL;
> +
> +		inum = st->num_returned + st->num_remaining;
> +		intrvs = kzalloc_flex(*intrvs, update_intervals, inum);
> +		if (!intrvs)
> +			return -ENOMEM;
> +
> +		intrvs->num_intervals = inum;
> +		intrvs->discrete = discrete;
> +		intrvs->grp_id = p->grp_id;
> +		st->max_resources = intrvs->num_intervals;
> +
> +		*p->intrvs = intrvs;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +iter_intervals_process_response(const struct scmi_protocol_handle *ph,
> +				const void *response,
> +				struct scmi_iterator_state *st, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
> +	struct scmi_tlm_ivl_priv *p = priv;
> +	struct scmi_telemetry_intervals *intrvs = *p->intrvs;
> +	unsigned int idx = st->loop_idx;
> +
> +	intrvs->update_intervals[st->desc_index + idx] =
> +		le32_to_cpu(r->intervals[idx]);

I'd go a bit long and put that on one line.

> +
> +	return 0;
> +}

> +static int
> +scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
> +{
> +	unsigned int flags;
> +	int ret;
> +
> +	flags = !ti->info.per_group_config_support ?
> +		ALL_DES_ANY_GROUP : ALL_DES_NO_GROUP;

Why not flip the condition and reverse the values?
This thing is weird enough I'd add a comment or rename them
to be more helpful. ALL_DES_THAT_HAVE_NO_GROUP for example.


> +
> +	ret = scmi_tlm_enumerate_update_intervals(ti, &ti->info.intervals,
> +						  SCMI_TLM_GRP_INVALID, flags);
> +	if (ret)
> +		return ret;
> +
> +	/* A copy for UAPI access... */
> +	ti->info.base.num_intervals = ti->info.intervals->num_intervals;
> +
> +	/* Delegate freeing of allocated intervals to unbind time */
> +	return devm_add_action_or_reset(ti->ph->dev,
> +					scmi_telemetry_intervals_free,
> +					ti->info.intervals);
> +}

>  /**

