Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349019;
	b=CVJvd8WHstYr9sJWQtfNpPPRkPGL97jVW7A9RpIlByLeCk64TnECSXSOC15n7/pq9UXM
	 ODFjqLHkl6eyWAjr6k2zFRbvpZ9op7tpqHB97keQXXQgQ9rT6cKCdMaUyUIfOL3DivHbQ
	 8FZfjLySd5+IsQWid9IzTgtx+VJW9lecyNbkLA+EcQvfHy2titcALl5DFyjv0Y0ixBHB3
	 iJBuNixVdqApI2L1deYDv90iVoKA1NIiyT25EowKR8ySYEJEXdvvJjG1Y87Rq57kX3a8z
	 1xq8sJpMYKPaNZKA48kdBrNzsZbMIQdAGBQzVQoKAz1RJ9klUNb32tDDkdZGyAM8rXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=;
	b=oEZV8/xF+NpUEuYqw6BhDxmYy6BI0M8ZJ2QR509iufo7hDwUiOrSAB1fFD+K8kupjYNi
	 PxsIPCJizsrnZZowB6fT6RobPSBLj78kHp93bIYNJpPapgzKa24ETuHql0LBMLHffbdef
	 mhxGgY/tf/aC0D7Ru/MmpJbzBhM50vAfClerhcYXIGKAz0FX+071518+HoEB1eOiwGsIC
	 FV0hCC/eQI6XwY4OENXPCBSbG0LEriMG7qTFfLNKsT1g4XtKxm8Kq/XYtbEJBShwPuSPL
	 vC4vGmL3AmckxVt2TtJ3X+/V+ri2gNChkpLWMq2DBEWxE94R2S/tyIYt5G6QjTPPAMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nx/d+cZC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORr0YSav;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A80C606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A80C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx/d+cZC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORr0YSav
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAJIFmC728291
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=; b=nx/d+cZCnnl/B+9q
	V54paZksVqJtSnFLKo4838giNrvuCpWcwAmzEZ80aIGmS8kg3Dai9eZK2iG9Pbp1
	QNG7JAmSsLF3RDVrBWG5Ua+9VdeZNrF5Wce5zBre7pT9pkzkNuDau2lC23hvQQVh
	1kXPtf6xc9MIMXBYZsE3e8dIfg2/R7mSa2WNeWnns7cgBEc8aZaAubuhoaAR7ACJ
	ytlxPs2EpzTu6oOr4PL5YGcJxIeFlXSxKVPVQO16zM3vfG1ykCQx8N5J7BVCZB0t
	b47mNg2GpgIimO/GwcMiL4pOuN2VKLeq/P6Dx+N6j9ZmrLLf/EJ9zXLPGauTVs3O
	3MgAsQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva09p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:16:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so2229759a91.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 14:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794349016; x=1794953816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=;
        b=ORr0YSavgXHZEA1KhkDFmcOUtc6MXJV/SmoRIoae5ZRjrHidDH26Yn250P8+9FhW7Z
         ZEHbBxlHdODATrH2n+mVjwU4ENEBOuvd0+NwUAS/++imG00wr1WJeaeRuzUtuWLSHvo7
         IMZVUnzMb+PHKRGpDPD8CdNLWMR3VwAHshebDHKHOATJnGbw5pYRL8OMITstyMj21AVP
         yMCilfa90Yfoi3XalbDyvJ5oj4wG81fXrmJRW8WSbIAxwrn0FNeabXcm1b1q470nECAX
         8edclmY6kqXluZoh/fdZBHeh1tMX6YCljojmXRpVwjJQNrc+dxCFyJvb3SN/ER+SE6VH
         tGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349016; x=1794953816;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=;
        b=oxpeI1D/m/fpXdb2L1QA/v4ubm6saytV0SWr2A8UdmQ+Tdpf9XiZtfoEfxYqxt2iRU
         9S6EJbYwT5iR+csInlqcLBYZ/SAfVaX2Mf5m3WI5OlIKdEOSkwh88MzGupj+nGr52wgr
         4bVaT9TzvkRuFRYcPVIKEvvDOU000/iEpV9YIuNebMeodJhq3U7Mn9NErW0QZYOzxfG1
         P3P1N919U4NYaDtF8ybubCk09eEQRytcIHBjGz9SbLytmfcNhqxzV+0neHsEy1zgBglh
         kw/Vh+jqdZFsmAMBL69K1nysgF+UjrAqAAMUvk6a556gp1xGET3I9m6Pi/dbHXLKYLbN
         Gg1g==
X-Forwarded-Encrypted: i=1; AL+hErGf6w6g/TXxFrzyV4UaM1pxlr9aUzNdJYMt68u/EcSeIt2h6745c7Q7DAjdruSL/4J6L75nwCybpLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l5a6kKUp8NxRaGCLJTis3too6hf1i8czxT+xNIeB+sLsADGKC
	jXNu5Yd7lStURIL4bDBOABlTS2Bx6nqMLgojAu+7/hMtbz1UhQK3FOVcTsVnRZf0XrmAzKEN4+l
	94MliuFtw8AuiI4gYxWEa+wSkzVDL0Uws4DB2IHp+KIsMZdAWCodFKGOJnVBzMgs=
X-Gm-Gg: AYBFou2ZT6EcAmBmC+hEb9yWH8urZaGpvPHXoBS9OahVFQuQxSt0bjZOF5sQqf2qhei
	SiGYz5EtMdtoCxhc/+tKH8etWUUQ2GVwz79s/lmJe09UklqlPqd1axQXS70GMrLg6P7P6vfdwkp
	mXMwHg/CRWfCPZpCOJaIgG5Cpnr/lNxvTyR9zL9iBwVyXoW4EX0MAtzoJSEiYeryyK5uGU0XjdJ
	r9VvDSPHUpY0vVoi3mZmBfLKzyTF0CindyCy5s21UX6Z5OzlOSKPYQNeA/r06CC/BZn00GSwpPn
	w5T96riqN3Mj7Q0QG1nRwIXrn6T89ahsSQLAtCcE1+n6x8zLFS8FYzpOrBKwkHRz7jjXFDTxxCS
	2b4cw72SDMW32RcgdSAWOyenhLv96Me+RcspTPcyY0rZO3Cc9RzwXs/US7BzluiBjlgFEEy79bY
	FuLDmZHBbavYfObI5Wd+3R4fhvx9A=
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr317140a91.40.1794349016237;
        Tue, 10 Nov 2026 14:16:56 -0800 (PST)
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr317114a91.40.1794349015717;
        Tue, 10 Nov 2026 14:16:55 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm18363973eec.18.2026.11.10.14.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:16:55 -0800 (PST)
Date: Tue, 10 Nov 2026 14:16:35 -0800
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
Subject: Re: [PATCH v15 20/35] firmware: arm_scmi: Add Telemetry
 notification support
Message-ID: <20261110141635.00005ca9@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-21-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-21-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af397d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=iaZMxDlvdvNhGf_iel8A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: zoS4p-cJ1AkztFzK6q0bXBOZdbjyXqX-
X-Proofpoint-GUID: zoS4p-cJ1AkztFzK6q0bXBOZdbjyXqX-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX1kLNNdXZN99t
 Pk7/4OjZTbg6NNMQ4qRgkpQ+q7vkW6breHhCMVRs+xg8Ijx4CRhfivEH/fK6bzFnMeZgZF6KOTb
 sIXTZoueqcx0eQlJKrKvpRl8cm2E+6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX1Hx9IWGyFL5M
 4mVRGFLFSF0ZsGzwWj5MLot8hY4j7aXgQJetEK748wBz0NmAf1rTHRHH5NYydhfjUKYKEOqqVeX
 ZLwHdd21qAsHvdkkdIzLlSvTmwMXV+15HX8xIb60quT7P1ncjyDy4YIp1cDkSa+1guJd+TlLK49
 IRYkezB/8aff2zcrSkbtcnTSDQS4qYvv/R7xUybJSwqfeD4fRYR8x099+4JOkYai7l2RioAGDuc
 vODd/mtiJEQezWpFjfIZwX8CQ8Hr9ErnqThmIv86UNqKeV8Kus65mzJO/O9zR5kz3e49Ln6Uwb0
 cXLsBZ0bjSPs2G+1u5qRIQqQGTLUnK6dxR5xHfz7g3yolmmzAds7C/kUfMSrUPeHcWLl5CKBhhm
 SlPWQZ9Jahd5ee17NPQr8LRs25PyFwvnVSlWkWSpO38IAa7yL2Av4VAoRcgxPPSfnsq33Ah+I1d
 gZmJsnDASuiy7GVvvtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100088

On Mon,  9 Nov 2026 09:12:06 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for notifications to Telemetry protocol and register an
> internal notifier during protocol initialization: any DE value received
> inside a notification payload will be cached for future user consumption.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Trivial things inline.

>  drivers/firmware/arm_scmi/telemetry.c | 184 +++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |   9 ++
>  2 files changed, 190 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index ebad4ec2afda..918067e225d5 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

>  static struct scmi_telemetry_res_info *
>  __scmi_telemetry_resources_get(struct telemetry_info *ti);
>  
> @@ -3831,9 +3843,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  	while (next < num_dwords) {
>  		struct payload *payld = (struct payload *)&dwords[next];
>  		struct scmi_telemetry_de_sample sample = {};
> +		u32 de_id, meta = le32_to_cpu(payld->meta);
>  		struct scmi_telemetry_de *de;
>  		struct telemetry_de *tde;
> -		u32 de_id, meta = le32_to_cpu(payld->meta);
>  		unsigned int wlen;
>  
>  		wlen = LINE_LENGTH_WORDS_RAW(meta);
> @@ -3874,7 +3886,6 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  		}
>  
>  		tde->cached_msg = cacheable;
> -

If you want this, figure out which patch to push it back to.

>  		sample.val = LINE_DATA_GET_RAW(&payld->tsl);
>  		sample.tstamp = HAS_LINE_EXT_RAW(meta) &&
>  			LINE_TS_VALID_RAW(meta) ? LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
> @@ -3882,6 +3893,10 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  		/* Update the cache holding the TDE mutex */
>  		scmi_telemetry_tde_cache_update(tde, &sample, NULL);
>  
> +		/* Link notifications to Primary UUID */
> +		if (cacheable)
> +			scmi_telemetry_uuid_link(tde, ti->primary_uuid);
> +
>  		trace_scmi_tlm_collect(sample.tstamp, de->info->id, sample.val,
>  				       "MESSAGE");
>  	}
> @@ -4062,6 +4077,148 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.reset = scmi_telemetry_reset,
>  };


> +
> +static int scmi_telemetry_notifier(struct notifier_block *nb,
> +				   unsigned long event, void *data)
> +{
> +	struct scmi_telemetry_update_report *er = data;
> +	struct telemetry_info *ti = telemetry_nb_to_info(nb);
> +
> +	/*
> +	 * PARTIAL_ERRORs are reported as -EBADMSG and related lines,
> +	 * marked as DATA_INVALID, will be properly skipped by
> +	 * scmi_telemetry_msg_payld_process.

Doesn't matter much given it will still be 3 lines, but inconsistent short wrap.

> +	 */
> +	if (er->status && er->status != -EBADMSG) {
> +		trace_scmi_tlm_access(0, "BAD_NOTIF_MSG", 0, 0);
> +		return NOTIFY_DONE;

>  /**
>   * scmi_telemetry_resources_alloc  - Resources allocation
>   * @ti: A reference to the telemetry info descriptor for this instance
> @@ -4488,7 +4645,27 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
>  
>  	ti->info.base.version = ph->version;
>  
> -	return ph->set_priv(ph, ti);
> +	ret = ph->set_priv(ph, ti);
> +	if (ret)
> +		return ret;

Can drive this change back to original introduction to avoid a bit of churn.

> +
> +	/*
> +	 * Register a notifier anyway straight upon protocol initialization
> +	 * since there could be some DEs that are ONLY reported by notifications
> +	 * even though the chosen collection method was SHMTI/FCs.
> +	 */
> +	if (ti->info.continuous_update_support) {
> +		ti->telemetry_nb.notifier_call = &scmi_telemetry_notifier;
> +		ret = ph->instance_notifier_register(ph, SCMI_EVENT_TELEMETRY_UPDATE,
> +						     NULL, &ti->telemetry_nb);
> +		if (ret) {
> +			dev_err(ph->dev,
> +				"Could NOT register Telemetry notifier\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
>  }

>  struct scmi_power_state_changed_report {
> @@ -1342,4 +1343,12 @@ struct scmi_powercap_meas_changed_report {
>  	unsigned int	domain_id;
>  	unsigned int	power;
>  };
> +
> +struct scmi_telemetry_update_report {
> +	ktime_t		timestamp;
> +	unsigned int	agent_id;
> +	int		status;
> +	unsigned int	num_dwords;
> +	unsigned int	dwords[];

__counted_by?

> +};
>  #endif /* _LINUX_SCMI_PROTOCOL_H */

