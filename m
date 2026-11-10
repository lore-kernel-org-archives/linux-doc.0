Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341256;
	b=vU3M37m/KB50r19pIEvt5ttm2oStnnjo0DbXcPf1ADSFcUtvdwU5krhJnXDMDuoTR0HU
	 MkCjLFQRl79R54nQwGS/WctSEyv71PBnp1usH95kgqxCDn5IB3uyl1i1tTj+LZNvY6jOE
	 7x1u1LOdRloEl++pkboC9zZUicSfxhGvC1p1kNowVXZUIEtGaKYmmWIDk/g1SKuX989Q4
	 QnexYm83eb2wU0O48L7Rd2CmRnVpPIotjMOajd/TRD6rA/gyjd+8lpyq5NnKM4SrZsXCh
	 hBrnCII7QVYDZuZLdDgHwAH9yHCoYnQl5LlqxcUqYCB4wqkyoYTJp20e7WYvBQZiRpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mPIzV8gKEEjQbLFg3pcsAJeVEQeLM6Xyl87XSN+E9gA=;
	b=Rq1jvJcMRlfDJcLwWSMXklRG0C6Q7UcL4PKa8QtwCIa9BBI0XujFYzcCemK+fY80jd3t
	 DlZR9yKqfcADbvf7P7rrsWaAACKajeiMCreAilJWJdS0q1Fwn/95u4q9xYZ06Ko08XVde
	 uFNMFSEwb6VC20Yb0SdOGWch0phE2zwSR793ngEtvcGe8zX2e1Ylhpqnw6Yrn5egSXTqX
	 qHTqc4kvXicH0H7pAsYW5DKWchex/JrihVcS2Vxt1TPCWoco/uE9S+HDSpT6XyB/iG6Qd
	 GO44X7m4v1RHYbgwQ3EZUtzsDM4lhtnbxr2DYUe6vH5hWxIla5EBg4uKxNc5qvzdBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IXgKbapi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5zfUlEJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3BF606A320
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 20:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IXgKbapi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5zfUlEJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIoYPh999878
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 20:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPIzV8gKEEjQbLFg3pcsAJeVEQeLM6Xyl87XSN+E9gA=; b=IXgKbapiZZ6s9GV3
	f+Bbv8kIcfs5lVMVFbopNN4iJDqT2XbREw6RDUpC1phcUUy2GkmU2OreXm1D/K61
	JaMPL5GiahOQ/0j5tGbdTHrnpuLowlvVBuL9l3daJA3qIq4IFTS+sLu2/c2TSjnr
	iygrfFCZBsIXPSBCVKrLH3orC6+A/Qra0/hzWN/RYd3uLu6uCCjA/kA+fgubIYRF
	E0WmPDJz8P3od9GbmUhjrFSGO8mzoD45TzN6RP5Q9Tnf0nSSuJJkDEKQ+szfoIkD
	FZ0rlrWxPAj1O/uCVDMqYL3t1ygtz2pZIgyOVGqkppjbteNkQvztmzriwWFwnEht
	Pj8CXQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwjp24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 20:07:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso4713156eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794341253; x=1794946053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mPIzV8gKEEjQbLFg3pcsAJeVEQeLM6Xyl87XSN+E9gA=;
        b=j5zfUlEJ2uyIHvT/o1lj8IlUwHjM2fGYJr+1wt2LsIGRvaMU+GBOE0XofVWc8/1JZ2
         hLFJvQzDCgEAPzAKW/fTs9cRbIkMWeTDkZV9AnL3Rd5YLxhgs0Bzv9lMBK7Bl+xRUdgd
         motPuy3+jJF5tnmZttXv0os1vuOc6wEsABP+8sP45IcU2YiyKj+kqmHv3GRTv99eSLJT
         n+8PfbVk99IxOnrouPmWpAA/XOpQMSOpfjCqB4nqjOGbKZkOzJnpQKPgNdf3afjJdZ8F
         E/Wtc2VosT48ozLvn8hMj6JNmrVP/ZiY/VyI2TJzRKJjaQ7YhOKdx5jTzy3fuVsCKYL1
         elZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341253; x=1794946053;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPIzV8gKEEjQbLFg3pcsAJeVEQeLM6Xyl87XSN+E9gA=;
        b=ESGkbFWMlLOLQCYP6zHu6M3BKeDJygaGCdUdA994YZ3TZOnjch2V/2FySzBMCSidus
         JI9ceWYoXXIXzVucRSsBWqyCNlbose0HVe3J2s2PlkTHEub2LQS2BjRJWnAzTA2yZbml
         YRRG6upC10OiYH69U5z5MTotEhPMVmRSnELJ7McFiOe5nlsOJnI6OU3xi1K0OEf5Gqyq
         cBXxEqJYlBMBGJA6ohw5iEDbZvb+V3p7dJ+naKRTYh0nAFlrJehkSa2MRWwOknaAVO3P
         cOw6j9ZjXfk4gUD53LlYKNG59CGwyGMZPHF86w8TeAyAI0MmjZdBTOZZWKy4F5qyE1nB
         DPqg==
X-Forwarded-Encrypted: i=1; AL+hErHVkSE4l1L2xRxce75xvSOueXw6YbIpjGf4BxOkoqHmpCdOYJ236Gb82iEextGCPFjGq/vD+jHAoi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uwvkvKXL7zTjiLmN9fvAgm58Y2oalwJAwAuBrTdZi3DMaFhI7
	OvHY7oC5+1TJWBJd3issXRk5OUqdkdlMOhYj54Uin++LHeaIH8VvGjFURiWc8eq7hXzm3qqf5/5
	jEhNkvyIcvQ/GeTsXvRGILCVYiJGCIve16+2Mx/AGDPCT/JtI9DAt47Aqyt8QkkI=
X-Gm-Gg: AYBFou0OtnwBe3hPeKsdNC8sdKMvAt+R23a5tO/wXY2mfTyDqnpsSSlt4C753B1ZMvq
	S7o9vydXlk9VEnem7kQzmy/Pn4TIePXZTO3tsPD5DYDU6c5w3cY1DfrmgyNzkcFtiKtnA1db4em
	G+qm0ZeVfB0r0RF04qE90kSvywRouBjDNeYwN4X0p2ed/0BWZvgMBeIopfHuE1/xoOOsoj6Cfyu
	KTmD0mnWZo8ZzfWncR0YWBI7bH7O+ujYm/udt2EgkZRqeYeEiGsVA9T6Cz1/XOdIz2jGZxlsp1g
	df8sMw5NiIrVIXrYxFcMEX55Y737IhwOFyXn3ti2nKpon13VfLyckJ83TIU+ATFCSS9TYh9vdRf
	FcJiNWHciSeFvM26bI9BuzX9o2fg7rMoDaqG2LDDm9q0z29356dxngfFKnk+Zb5GROOumvJfcX0
	SGi8AxdBzuZ5gos8bzH8zc/0LPbaBV
X-Received: by 2002:a05:701b:4588:10b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b3b618d57cmr4809326c88.40.1794341253293;
        Tue, 10 Nov 2026 12:07:33 -0800 (PST)
X-Received: by 2002:a05:701b:4588:10b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b3b618d57cmr4809283c88.40.1794341252580;
        Tue, 10 Nov 2026 12:07:32 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm1260936eec.1.2026.11.10.12.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:07:32 -0800 (PST)
Date: Tue, 10 Nov 2026 12:07:08 -0800
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
Subject: Re: [PATCH v15 17/35] firmware: arm_scmi: Add Telemetry
 configuration operations
Message-ID: <20261110120708.000059b4@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-18-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-18-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: mYtdgnl9v4vpYNhyIluMyKg5EB4HmQxk
X-Proofpoint-ORIG-GUID: mYtdgnl9v4vpYNhyIluMyKg5EB4HmQxk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4MCBTYWx0ZWRfX1954nFz/j4cP
 8TM4PNN2aRBONKujYVLNyoBYapUUH7G96a5nQOjqRB9gMs3AoFzjyfUVZC9UCufbaVDp6Ncd68S
 ZyHwPfM9z/iJjOiZ1Zr6fGlUipRwmVs=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af37986 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=C_PHm6f9Ewz0PqJoia8A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4MCBTYWx0ZWRfX7KgXwmClC+Ml
 1lT+gUiVY90l6ovcgFeN6ieVPMOOlCK8EWdf7HvdE8dweGMi4ktK0zCZSZf4ei89nX27GZFB9ct
 VpwXpEUOMNnCjQ/zJqgf42WBS/MH3P6NwLjUo70qh0e7/r4egEoQvdHCExJ7KEfkoCqEGRiiDwd
 vc6VM8qayzSEIaJWOD/cO7pH+REVpOOSlpCvq3vj7JhPQ/I+dNq6CVHde/hoZQNFZY3i2NIimby
 gzdv6sdE0GqbXkKM4LvN1+Jal/xb29+qVHyD+BD8sxTGKFFAeko3u9MmZQFCzfob2en8rRWMpM0
 IOH9BdxGb07EldYJ4GBDP4n7AulEwWlc9+9LDihnpnDMfA2hpobuH51cTdl7YUREJWpJYlQvp/n
 hg+83OifBWft5mwDTxgIZldyExzbvOn/xiX+CMwWk94toI4ty25BCL4MGL2WzmmFLxlO9p8YewQ
 CSZhTKEVV6JVR2MNMZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100080

On Mon,  9 Nov 2026 09:12:03 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for basic Telemetry configuration operations to selectively
> enable or disable DataEvents monitoring.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
Various comments inline.  Includes a suggestion that some
__iomem pointer specific overflow checkers might make for
neater code here and in earlier patches.

> +
> +struct scmi_msg_telemetry_config_set {
> +	__le32 group_identifier;
> +	__le32 control;
> +#define TELEMETRY_ENABLE		(BIT(0))
> +#define TELEMETRY_MODE			GENMASK(4, 1)
> +#define TELEMETRY_MODE_SET(x)		(FIELD_PREP(TELEMETRY_MODE, (x)))
> +#define	TLM_ONDEMAND			(0)
> +#define	TLM_NOTIFS			(1)
> +#define	TLM_SINGLE			(2)
> +#define TELEMETRY_MODE_ONDEMAND		TELEMETRY_MODE_SET(TLM_ONDEMAND)
> +#define TELEMETRY_MODE_NOTIFS		TELEMETRY_MODE_SET(TLM_NOTIFS)
> +#define TELEMETRY_MODE_SINGLE		TELEMETRY_MODE_SET(TLM_SINGLE)

I'd just put the FIELD_PREP inline. It is self explanatory on only a char or
two longer..

> +
> +#define TLM_ORPHANS			(0)
> +#define TLM_GROUP			(1)
> +#define TLM_ALL				(2)
> +#define TELEMETRY_SET_SELECTOR(x)	(FIELD_PREP(GENMASK(8, 5), (x)))
> +#define	TELEMETRY_SET_SELECTOR_ORPHANS	TELEMETRY_SET_SELECTOR(TLM_ORPHANS)
> +#define	TELEMETRY_SET_SELECTOR_GROUP	TELEMETRY_SET_SELECTOR(TLM_GROUP)
> +#define	TELEMETRY_SET_SELECTOR_ALL	TELEMETRY_SET_SELECTOR(TLM_ALL)
> +	__le32 sampling_rate;
> +};



> +
> +static struct payload __iomem *
> +scmi_telemetry_blkts_payld_locate(struct device *dev,
> +				  struct telemetry_shmti *shmti, u32 *bts_offs,
> +				  struct payload __iomem *payld, u32 de_id)
> +{
> +	struct payload __iomem *bts_payld = NULL;
> +
> +	if (!bts_offs)
> +		return IOMEM_ERR_PTR(-EINVAL);
> +
> +	if (*bts_offs &&
> +	    check_add_overflow((__force unsigned long)shmti->base, *bts_offs,
> +			       (__force unsigned long *)&bts_payld))

This code has quit a lot of checks on pointer overflow and many need
some ugly casts. Maybe we can have some local helpers for this?

bool check_add_overflow_iomemptr(void __iomem* start, size_t off, void __iomem **out)
{
	unsigned long _start, _out;
	bool overflow;

	_start = (__force unsigned long)start;
	overflow = check_add_overflow(_start, off, &_out);
	*out = (__force void __iomem *)_out;

	return overflow;
}

or something like that?

> +		return IOMEM_ERR_PTR(-EPROTO);
> +
> +	/* Check SHMTI overflow on returned offset */
> +	if (bts_payld) {
> +		if (scmi_telemetry_shmti_overflow(shmti, bts_payld)) {
> +			trace_scmi_tlm_access(de_id, "SHMTI_OVERFLOW", 0, 0);
> +			return IOMEM_ERR_PTR(-EINVAL);
> +		}
> +	} else {
> +		dev_warn_once(dev, "Received BLK_TS with zero offset.\n");
> +		trace_scmi_tlm_access(de_id, "BLKTS_WITH_ZERO_OFFSET", 0, 0);
> +
> +		/*
> +		 * Find the BLK_TS immediately preceding this DE payld by
> +		 * scanning.
> +		 */
> +		bts_payld = scmi_telemetry_nearest_line_by_type(shmti, payld,
> +								TDCF_BLK_TS_LINE);
> +		if (WARN_ON(!bts_payld))
> +			return IOMEM_ERR_PTR(-EPROTO);
> +
> +		/* Calculate offset of found blkts */
> +		*bts_offs = (void __iomem *)bts_payld - shmti->base;
> +	}
> +
> +	return bts_payld;
> +}

>
> +
> +static int scmi_telemetry_group_state_set(const struct scmi_protocol_handle *ph,
> +					  const bool *enable, const bool *tstamp,
> +					  struct scmi_telemetry_group *grp)
> +{
> +	struct scmi_msg_resp_telemetry_de_configure *resp;
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_de_configure *msg;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	/* Stall concurrent configuration request */
> +	guard(mutex)(&ti->config_mtx);
> +
> +	if (!scmi_telemetry_remote_state_update_needed(ti, enable, &grp->enabled,
> +						       tstamp, &grp->tstamp_enabled,
> +						       true, grp))
> +		return 0;
> +
> +	ret = ph->xops->xfer_get_init(ph, TELEMETRY_DE_CONFIGURE,
> +				      sizeof(*msg), sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	scmi_telemetry_state_message_prepare(msg, grp->info->grp_id, true,
> +					     enable, &grp->enabled,
> +					     tstamp, &grp->tstamp_enabled);
> +	resp = t->rx.buf;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {

So this is doing the out of line good path just to keep the ability to use
guard. I'd be tempted to not use guard() or use a wrapper function
just for that.  guard() magic is lovely but only until it makes us
write harder to read code.  The challenge here is we can't easily
do __free magic for the xfer.

> +		/*
> +		 * Update cached state on command success anyway, despite any
> +		 * possible later response validation issue: once the command
> +		 * has succedeed keep our state in sync with HW.
> +		 */
> +		scmi_telemetry_state_cache_update(ti, enable, &grp->enabled,
> +						  tstamp, &grp->tstamp_enabled,
> +						  grp, NULL);
> +		ret = scmi_telemetry_group_state_set_resp_process(ti, grp, resp);
> +		if (ret)
> +			dev_err(ph->dev,
> +				"Could NOT process GROUP %u state response - ret:%d\n",
> +				grp->info->grp_id, ret);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int scmi_telemetry_state_get(const struct scmi_protocol_handle *ph,
> +				    const u32 *id, bool *enabled, bool *tstamp_enabled,
> +				    u32 *sid, u32 *offset, uuid_t  *uuid)

bonus space before *uuid.

> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_telemetry_de *de;
> +	struct telemetry_de *tde;
> +
> +	if (!enabled || !tstamp_enabled)
> +		return -EINVAL;
> +
> +	ti->res_get(ti);
> +	if (!id) {
> +		guard(mutex)(&ti->des_enabled_mtx);
> +		/* Returning the all_des_* state */
> +		*enabled =
> +			(atomic_read(&ti->des_enabled[ENA_STATE]) == ti->info.base.num_des);
> +		*tstamp_enabled =
> +			(atomic_read(&ti->des_enabled[ENA_TSTAMP]) == ti->num_des_tstamp);

Ah.  These are reference counters. I had misunderstood that earlier.

I'd add some docs for this function though as isn't immediately obvious what
should be returned if these don't match.

> +
> +		return 0;
> +	}
> +
> +	de = xa_load(&ti->xa_des, *id);
> +	if (!de)
> +		return -ENODEV;
> +
> +	tde = to_tde(de);
> +	guard(mutex)(&tde->mtx);
> +
> +	*enabled = de->enabled;
> +	*tstamp_enabled = de->tstamp_enabled;
> +
> +	scmi_telemetry_tde_location_update(tde, sid, offset, uuid);
> +
> +	return 0;
> +}
> +
> +static int scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
> +				    bool is_group, u32 id, const bool *enable,
> +				    const bool *tstamp, u32 *sid, u32 *offset,
> +				    uuid_t *uuid)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_telemetry_res_info *rinfo;
> +
> +	rinfo = ti->res_get(ti);
> +	if (!is_group) {
> +		struct scmi_telemetry_de *de;
> +
> +		de = xa_load(&ti->xa_des, id);
> +		if (!de)
> +			return -ENODEV;
> +
> +		/* Filter out unplausible timestamp requests */

Rather than error out if we get one? That sounds fragile.

> +		return scmi_telemetry_tde_state_set(ph, enable,
> +						    de->tstamp_support ? tstamp : NULL,
> +						    de, sid, offset, uuid);
> +	} else {
> +		struct scmi_telemetry_group *grp;
> +
> +		if (id >= rinfo->num_groups)
> +			return -EINVAL;
> +
> +		grp = &rinfo->grps[id];
> +		return scmi_telemetry_group_state_set(ph, enable, tstamp, grp);
> +	}
> +}
> +
> +static int
> +scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
> +				    unsigned int res_id, const bool *enable,
> +				    const unsigned int *update_interval_ms,
> +				    const enum scmi_telemetry_collection *mode)
> +{
> +	enum scmi_telemetry_collection *current_mode, next_mode;
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_config_set *msg;
> +	bool tlm_enable, *current_state, is_group;
> +	struct scmi_telemetry_res_info *rinfo;
> +	unsigned int *active_update_interval;
> +	struct scmi_xfer *t;
> +	__le32 interval;
> +	u32 control;
> +	int ret;
> +
> +	/* Stall concurrent configuration request */
> +	guard(mutex)(&ti->config_mtx);
> +
> +	if (mode && (*mode <= SCMI_TLM_SINGLE_READ) &&

This first line checks if mode is in range of allowed values. 
When would it not be?  Feels like a confusing thing to check here
as either of the next two conditions required it to be specific
values that meet that requirement. Was that meant to be an out
of range check?

> +	    ((*mode == SCMI_TLM_NOTIFICATION && !ti->info.continuous_update_support) ||
> +	     (*mode == SCMI_TLM_SINGLE_READ && !ti->info.single_read_support)))
> +		return -EINVAL;
> +
> +	is_group = res_id != SCMI_TLM_GRP_INVALID;
> +	if (is_group) {
> +		rinfo = ti->res_get(ti);
> +
> +		if (res_id >= rinfo->num_groups ||
> +		    !ti->info.per_group_config_support)
> +			return -EINVAL;
> +	}
> +
> +	if (!is_group) {

Maybe this makes sense in later patches, but for now, it looks like
you can just flip this condition and combine the else below iwth the
if (is_group) just above. That is...

	if (is_group) {
		rinfo = ti->res_get(ti);

		if (res_id >= rinfo->num_groups ||
		    !ti->info.per_group_config_support)
			return -EINVAL;

		active_update_interval = &rinfo->grps[res_id].active_update_interval;
		current_mode = &rinfo->grps[res_id].current_mode;
		current_state = &rinfo->grps[res_id].enabled;
	} else {
		active_update_interval = &ti->info.active_update_interval;
		current_mode = &ti->info.current_mode;
		current_state = &ti->info.enabled;
	}

> +		active_update_interval = &ti->info.active_update_interval;
> +		current_mode = &ti->info.current_mode;
> +		current_state = &ti->info.enabled;
> +	} else {
> +		active_update_interval =
> +			&rinfo->grps[res_id].active_update_interval;
> +		current_mode = &rinfo->grps[res_id].current_mode;
> +		current_state = &rinfo->grps[res_id].enabled;
> +	}
> +
> +	if (!enable && !update_interval_ms && (!mode || *mode == *current_mode))
> +		return 0;
> +
> +	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
> +				      sizeof(*msg), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	if (!update_interval_ms)

Flip logic then it's visually obvious that if you have it you
use the passed in active_interval_ms

> +		interval = cpu_to_le32(*active_update_interval);
> +	else
> +		interval = cpu_to_le32(*update_interval_ms);
> +
> +	tlm_enable = enable ? *enable : *current_state;
> +	next_mode = mode ? *mode : *current_mode;
> +
> +	msg = t->tx.buf;
> +	msg->group_identifier = cpu_to_le32(res_id);
> +	control = tlm_enable ? TELEMETRY_ENABLE : 0;
> +	control |= !is_group ? TELEMETRY_SET_SELECTOR_ALL : TELEMETRY_SET_SELECTOR_GROUP;
> +	control |= TELEMETRY_MODE_SET(next_mode);

	control = FIELD_PREP(TELEMETRY_ENABLE, tlm_emable ? 1 : 0) |
		  FIELD_PREP(TELEMETRY_SET_SELECTOR, TLM_SET_SELECTOR_ALL) |
		  FIELD_PREP(TELMETRY_MODE_SET, next_mode);

With adjusted defines is clearer to read than via the defines at the top of
file.  I'm never sure why people feel like wrappers around FIELD_PREP make
things more readable - I want to see that this is building a register value
and what goes in what named field.  The macros like TELEMETRY_SET_SELECTOR()
obscure that.

> +	msg->control = cpu_to_le32(control);
> +	msg->sampling_rate = interval;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
I'd do
	if (ret) {
		ph->xops->xfer_put(ph, t);
		return ret;
	}

Even though it duplicates that unwind, I think it is worth it
to avoid out of line good paths.  Or just don't use guard and use
a goto.



> +		*current_mode = next_mode;
> +		*current_state = tlm_enable;
> +		/*
> +		 * Enable streaming mode when notifications were explicitly
> +		 * requested as a global config, not on a group.
> +		 */
> +		if (!is_group)
> +			ti->streaming_mode = *current_mode == SCMI_TLM_NOTIFICATION;
> +		if (update_interval_ms)
> +			*active_update_interval = le32_to_cpu(interval);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 3973779c0aba..ce35734d2249 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -888,6 +888,12 @@ enum scmi_telemetry_compo_type {
>  #define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
>  	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
>  
> +enum scmi_telemetry_collection {
> +	SCMI_TLM_ONDEMAND,
> +	SCMI_TLM_NOTIFICATION,
> +	SCMI_TLM_SINGLE_READ,

Given these are called out a 0 1 2 in the spec I'd assign the
values to them just to make that association clear. 

> +};

