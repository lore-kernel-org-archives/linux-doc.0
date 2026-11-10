Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335663;
	b=w0VVL+NPmmiMGyRnQywHsJOSJgmBvOfqhYMyiU9H9S9nA9N4M2BQrNCPzDQ/R4S4/2b6
	 6eG3hLLrhkSpsF+4ZY6+tFFtQ6wzEIX3WRGAJSpQYdqgNIaKdN0M7dW3yNib7sXocy86h
	 e/zQ0pXv7HDvU3DxyMglDSI7JPJ/P0dXrzrJnfSCrH1oKn2TU6XLndVv17qxvx4zvm+Sw
	 OYjRKAg5HQpaMiILSdjnFuMdlGkf3pZVUS+JDPxQjnfNLKcFzdjRo1w7fdQ5NVIcT5iLO
	 J4oBV2+01/5OVA9t+VtKgbFcSWOPVr/ZASJ8A3/MKfVG1a04UV6kR/hqlYnWBfnU4OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
	b=3whUs6RAWH3F32t6cgxeHGGFp3pubTkrl29WVNmOivy3ihfR1nJKuMQu8YKmROYQwVa7
	 /llAadZbMRTltePF8cFvXnuHSvPd2/H8iTnQHosUJaJfrpjBn/S3f0w4UXtMX7tw1KLO1
	 JbbkAwWAMGfGu7jPVchK0kO06jN1knEPXXdWff+VV8AuHFUyVctb9ZUxl1QwebDp9+nc1
	 lVigQJGNujDwi+A2dJWEghMmZ+DvucCRGOKspyZ9Aw6o11eAsg+/EuSWia4J2VRrF6r9R
	 O5R8WJcDcLjeWXCadll/sQNOTt9xHoy/g7Ls9a1QbdwwDNb0D8BnuHeGGHR7QAH5nXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaJ7MQkV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8rvSV4t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D35606A325
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D35606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaJ7MQkV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8rvSV4t
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF08rC3376618
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=; b=SaJ7MQkVqcEov/Zp
	G6DNO3M5WaRiQEC2W9C8uSRw8U7nBHky9LwKAIU+gO97H5lyVLGNYcciTkXSPaJl
	bw+jay9tS9q3KPO0pMduEhONBECQDouysnAtsX47aDH1aqTkMMpRe7GDzzqTcfBk
	K2JRFIbkGZk1LTqFyGiedJOKy5CedEtaHKH/CvhUbomoePhT26Za/Oy6S5Pv2A/7
	gsm157jneUh2GCVmKUfk1bvMRBbBOpt+Fk+wMTtZ/chSQbNhYmDxSdIhXsVcLtfp
	oeF1h9KrcqRZ+Ie4BJL1a3P1vdci9K6N9LVFk6ZNWAS7Rrn/JwsNrbeosStDljke
	4kRmkw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84aqnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:34:20 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so397371c88.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 10:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794335660; x=1794940460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
        b=a8rvSV4tBwKLolZanP3Dh+QzmIa0ZyNF5Vjng9T8BHdkIjCWmxasc3ikOp+3NwabS8
         KMVM3VKXOoQ0n560ktwPcFh069yIUEqn6JSOUsFvvCAaU9do3GX1zfj1SCIgz0aPAsdk
         nTcuVnxt/Dfe7DMXqBj9HqyQc70DqU2MsLpt+xjMxAX0g5KVpNEA5G7FKxlsQEPb1ajm
         RT2efSSwUTjY/tihXTbppcDOa49Vfhtibw/hy4W1RB7XLdzbxjmFpwd60XK4p4Jl0sH7
         wsV6mBlXy1JD7aEjsyO8TZoR+Y2d/F29IHBWxNHVUZ0/HXLfHz3sasMhuQo/BDAjQWtL
         Hf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335660; x=1794940460;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
        b=fphkrYiJHTnSevwV9omJvEkWhIPc2a13Sr+T16hoeGMaqIiGf8pYKsb8D7lrZ6veAR
         vlqFykEhkKK5jodLn0073udbF5TXqO3Ox2gDtdPrg8KeQvUi1kywcySzrYASgXBp484Q
         UPAB3sHsd9na8RIF6lAZUFne3SrfZ2KuH4bsJCq0kJXNH33rls57dM8HL9wAz6D7P10K
         5IXuszcihnWERp7Gy/IWVb/9Fqd5F99VdtvmnH0kxYIygIM069UiL+tLmZ+xBFlfSVwW
         9YK3VdRi+ewP4mTnHq9QLHinZLOLjz9K9YGOQU2k2YY/NFivUyBBQG06m14ErtRw+jCp
         N34g==
X-Forwarded-Encrypted: i=1; AL+hErHil1k94XAIbxA8NQhnCLpJ5yISOjzDCIR6RPm9tBk02QpBs/UxWI997WNyVepbpCayvxWXPBR9jzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o0P8ST1EKa4t9xS2UxGCfuuuNzCjXUtbvBNkPNZ/hZbL8KL2q
	b4w2uFWuKtIJADTMaasZVHD9cWEBwKRT2J4NuueM9Jh2p9itcmsnp2SfMpxoiu10Av7+BX5d0dl
	Z6VAseABE8LmO1804O5WMIwNbL01Lr23k9wwRKSIrmdBcW4rN3GOU4+RZw/XxQpir7W1yG+8=
X-Gm-Gg: AYBFou0Oegwxhdb21QlfaZ0lUL2fNDxyidrkpaFTWlDVvjTz8nzT/H0Bf76p7g1G5hb
	FUieB93iCjuJ1ZiM/1cfdzsgxGzibdssWGCS25lx+txHuXVgx8ZliyT8RC/PyI9TNmdL9rCZilG
	wHpm3PSlMa2SgX9JBoKNFM89krcoFRBAqtjGJcuyBblJ3oAIF20fzhlai/AdPpUoFPfRAYrXjXK
	0zWaaJ8bnrNfBACeJKAKTvWxb6Xrmyj0NsygMDGbcyzI5BWmE2pcp6cxkLMTeie+VmP++iigMO1
	W6dNk/cO9uAHox77MX1shsa+3/sV0qjgR/JTYlHz0xz786PjyhJsS9PAT4KWxPScvOMChEWWDk9
	sJhXoEAJcrqU+N9FcWTg8A+jB1K2y2OO53gSCduwyWYCKC80DdONykqmrMvg7c1VRTNevsfeIn6
	v05/QDlfb+bnQgUxHzyNBRJtezaQw=
X-Received: by 2002:a05:7022:1109:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b3b6054c1fmr4484100c88.8.1794335659299;
        Tue, 10 Nov 2026 10:34:19 -0800 (PST)
X-Received: by 2002:a05:7022:1109:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b3b6054c1fmr4484060c88.8.1794335658518;
        Tue, 10 Nov 2026 10:34:18 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm17591012c88.10.2026.11.10.10.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:34:18 -0800 (PST)
Date: Tue, 10 Nov 2026 10:33:56 -0800
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
Subject: Re: [PATCH v15 15/35] firmware: arm_scmi: Add Telemetry TDCF
 parsing for BLK_TS lines
Message-ID: <20261110103356.00003a29@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-16-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-16-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX5mHlI89ID1uq
 88ZC4NeFVtgOYOw3A1c9yuTBs68fILvei+ESQlCR1sQpR84GvIf4Ij/1qQhxaLeqqarXAn9WBEI
 oSsIPzDavlfPFQXZfKtkus/kooZ51rELnsuISjfaGAP+7wFnHgH3vdEjLvPUGTZ9E6zBa4TBC6I
 eWwNRIo+wn4HcZrxsnGVbeznhno/jCv/LYsMXiv241zdeCY9Z89DcP3wY6l7lEwaxQ1WeCliVp4
 jzjhtvQ+xB7vp3jldYEW68v+9gFPbF1N9xb6X47FC4kqPGZHUek8nIq3vOxAEAHo+DI14At0FND
 GpTtDuFQI4xbVLu/DOaioh7REu6pOM+22XKj318TjQGy2cDV/EnyP353Kv8QzGiLv6we8KslhDF
 yHhcLRnWONMC+64EOqMxl8dJ2bnJBYN2XMohnNN1F+2csMhCQLV53iyqOdVCeSgdyn9PIdkVIep
 gqI+xy9kDThfwiS419w==
X-Proofpoint-GUID: cMoRHun4L7UoqRcHfFFLYc3UuOUdQ7MH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfXxuP3YS3UTyjj
 gKBxYfRGVf3K+2fX1qRyCH1uYMrPRJ+9vGYu6112QMcifiokhpgnobjd3tvVE+D8WsZRFM3z+Pt
 DLKK/dQ6+u6TrjVMi0YuWcSEogfNIr4=
X-Proofpoint-ORIG-GUID: cMoRHun4L7UoqRcHfFFLYc3UuOUdQ7MH
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af363ac cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=JRCmi-Q6nD18N7oa2wEA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100073

On Mon,  9 Nov 2026 09:12:01 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to parse, track and link TDCF BLK_TS lines to the related
> discovered DataEvents.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor things inline.  + I think some of previous patch belongs
in here. Getting patch break up perfect is sometimes a pain, but it
really helps keep things logically together for reviewers and on
a massive set like this, anything that keeps the reviewers happy
is the way to go!

Jonathan

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 317 +++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 810195889484..e3fbcb1e6ea7 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c


> +
> +static inline void scmi_telemetry_line_free(struct telemetry_line *line)
> +{
> +	void *blob;
> +
> +	switch (line->type) {
> +	case TDCF_BLK_TS_LINE:
> +		blob = to_blkts(line);
> +		kfree(blob);
The local variable isn't adding much over

		kfree(to_blkts(line));

> +		break;
> +	default:
> +		WARN_ON(1);
> +		break;
> +	}
> +}


> +
> +static struct telemetry_block_ts *
> +scmi_telemetry_blkts_create(struct telemetry_shmti *shmti, unsigned long offset)
> +{
> +	struct telemetry_block_ts *bts;
> +	int ret;
> +
> +	bts = kzalloc_obj(*bts);

Use a __free() here and then no_free_ptr() on the return.

> +	if (!bts)
> +		return NULL;
> +
> +	ret = scmi_telemetry_line_init(shmti, &bts->line, offset, TDCF_BLK_TS_LINE);
> +	if (ret) {
> +		kfree(bts);
> +		return NULL;
> +	}
> +
> +	trace_scmi_tlm_collect(0, shmti->info.sid, offset, "SHMTI_NEW_BLKTS");
> +
> +	return bts;
> +}

> +
> +/**
> + * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
> + *
> + * @ti: A reference to the telemetry_info descriptor
> + * @bts_payld: TDCF payld line to process
> + * @snap: A reference to the working SHMTI snapshot that will be processed
> + * @active_bts: Input/output reference to keep track of the last blk_ts found
> + *
> + * Process a valid TDCF BLK_TS line and, after having looked up or created a
> + * blk_ts descriptor, update the related data and return it as the currently
> + * active blk_ts, given that it is effectively the last found during this
> + * scan.
> + */
> +static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
> +					    struct payload *bts_payld,
> +					    struct shmti_snap *snap,
> +					    struct telemetry_block_ts **active_bts)
> +{
> +	struct telemetry_block_ts *bts, *previous = *active_bts;
> +	struct telemetry_shmti *shmti = snap->shmti;
> +	u32 meta = PAYLD_META_RAW(bts_payld);
> +	unsigned long offset;
> +
> +	/* Check for spec compliance */
> +	if (BLK_TS_INVALID_RAW(meta)) {
> +		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, meta);
> +		return;
> +	}
> +
> +	offset = TDCF_OFFS(snap->base, bts_payld);
> +	/* A BLK_TS descriptor MUST be returned: it is found or it is created */
> +	bts = scmi_telemetry_blkts_get_or_create(shmti, offset);
> +	/*
> +	 * On error processing the new BLK_TS bailout taking care to clear
> +	 * the previous last active BLK_TS to avoid mistakenly binding to the
> +	 * next data lines.
> +	 */
> +	if (WARN_ON(!bts))
> +		goto out;
> +
> +	/* Update the descriptor with the lastest TS */
> +	scmi_telemetry_blkts_update_snap(ti, bts, bts_payld, snap->magic);
> +
> +out:
> +	/* Drop one refcount on the previous active since we found a new one */

I'd have this mention where the reference was taken as then it's clear why
it makes sense to drop one here. Something like
	/*
	 * Drop one refcount on previous active to match with the one take
	 * in creation as no longer need to keep it around for potential new
	 * users.
	 */

> +	if (previous)
> +		scmi_telemetry_line_put(&previous->line);
> +
> +	*active_bts = bts;
>  }
>  
>  static inline struct telemetry_de *
> @@ -1561,7 +1801,8 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
>  		*tstamp = 0;
>  		if (USE_BLK_TS_RAW(meta)) {
>  			/* Read out the actual BLK_TS */
> -			*tstamp = scmi_telemetry_blkts_read(magic, tde);
> +			*tstamp = scmi_telemetry_blkts_read(magic, tde,
> +							    bts_payld, snap);

Noted in review of previous patch that I'd just have all the parameters
back there rather than adding these two here.  It isn't consistent in that
some parameters were used and others not, as in that patch magic wasn't used
either!

>  		} else if (LINE_TS_VALID_RAW(meta)) {
>  			/*
>  			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that

> @@ -1906,6 +2187,15 @@ scmi_telemetry_shmti_refresh(struct telemetry_shmti *shmti, int *idx)
>  	return work;
>  }
>  
> +static inline void
> +scmi_telemetry_reset_active_lines(struct telemetry_block_ts **active_bts)
> +{
> +	if (*active_bts) {
> +		scmi_telemetry_line_put(&(*active_bts)->line);
> +		*active_bts = NULL;
> +	}
> +}
> +
>  /**
>   * scmi_telemetry_shmti_scan  - Full SHMTI scan
>   * @ti: A reference to the telemetry info descriptor
> @@ -1976,6 +2266,7 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
>  		qwords -= used_qwords;
>  	}
>  
> +	scmi_telemetry_reset_active_lines(&active_bts);

It's only resetting one.  Maybe reset_active_line?

>  	srcu_read_unlock(&shmti->srcu, idx);
>  
>  	if (ret)
> @@ -2120,6 +2411,22 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
>  	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
>  }
>  
> +static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
> +{
> +	for (int id = 0; id < ti->num_shmti; id++) {
> +		struct telemetry_shmti *shmti = &ti->shmti[id];
> +		struct telemetry_line *line;
> +		unsigned long idx;
> +
> +		guard(mutex)(&shmti->lines_mtx);
> +		/* Drop all remaining currently unbound lines and their containers */

I'd avoid the comment.  It's a _put so should be clear there may be references
held that keep it alive for now. The comment kind of invites questions about what
it means to drop unbound ones here, and what the lifetimes of others look like.

> +		xa_for_each(&shmti->xa_lines, idx, line)
> +			__scmi_telemetry_line_put(line);
> +
> +		xa_destroy(&shmti->xa_lines);
> +	}
> +}

