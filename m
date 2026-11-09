Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267147;
	b=cynIbSjMJvn3T0SD6Oh4yWwlVtJqdjrH4YPnCXu/vd21tDB7dMcy7wrfOF7JaE7AbCYZ
	 sO4kTcRbUFJGmtqMIFb4UcLgXEHugHk278T7VcEptNw/0kmrF5GW4GrtGwEOTzjj6ot+c
	 saeab/ZxC8XiVhGLcsfzdaW6ANrMHlOFz4PWu7SPT9S0/6R7AVT026SrNJgrJXkxc8/O5
	 DXsSg0OC4TbF9zAEbWqRPRHzyfPwsEVAtAlAe9ZmDbW4jIi52doXCYLMmOmb6SFmFVwFZ
	 SAyelHKPPmI1Yphi2l59r1nd9VSDzJ8w96W9sMEWDhnaaofOq3g7P23cFb/uHdcQ/tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1fBV4tYJmq1KIzyuY/a5VANM8OjZ60olLbMUrJpNOos=;
	b=dI9xA2o4Ps+jXTxqvV4eczt15uAs2uEuFfVvU9qu6e1Od7tAHEdI19kBrF5ynYS/4W08
	 dDptGtJW1mGZUcaI9Gdf3Asuuo4SZL8CA+fnpdEgVb0LUmDHYgu+7Xvu+ELiWnGAj4dfG
	 UDBAdCHgEL+WsRnZsgQkwtUz3dfh+njwkJb+jMJuUlGdCmPnZgzffWF8+4hfrx25ama7q
	 HAS/bPzvdUl2RWYxWUXa/g/VdzaMBLYyTntvb/sLeICL/hjYUigBTvpceC53hHJh4YPrB
	 o7kmujFcWf4nlENPCG4GOz2mQgmUlXkzTB1Jv0p9m6feey/i+4lHyCEMowCbgI3NTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GbgGYTH5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KjXvBqlM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E2606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GbgGYTH5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KjXvBqlM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9L9vlV1392240
	for <linux-doc@vger.kernel.org>; Mon, 9 Nov 2026 23:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fBV4tYJmq1KIzyuY/a5VANM8OjZ60olLbMUrJpNOos=; b=GbgGYTH5qec+7D9z
	8jTfKLEQjBtHjSaXMBbQK8ICyVwaRQdUCIX/5T6Bz+2eV0h6vaGdeR/V5hyusUWf
	v2OfKOaaqLdKg52vryVeJwSCZ/TyrN859h3Vhs8veO4QYuysQO1eeoVt/vzL6qei
	IAbMq+drFtXxKCO3VOIOmTWo7GPQsGFEtc+h5vX1rgkednHByPqX4a/INqb7eQe5
	trYg9BBnge/tU4yvEFTRQq75G9bnNDORNYPBEZPX6VSwsCh/WP2AQThmFTDrJiBO
	P8JwwSRNPUyzeUaqKbBCE7cBiOCZyaSQYKOQeHFD6X8jSJ5w10OYyLN2xth/0eQE
	pSQwVg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5tmft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 23:32:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso2848942eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794267145; x=1794871945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1fBV4tYJmq1KIzyuY/a5VANM8OjZ60olLbMUrJpNOos=;
        b=KjXvBqlMKeCQj/Dr7GgwTD+A7US8LCe8x+0rz2IZBm2sV7oi2IaNoZ4YJN39X/E5Cs
         cVjIwV7a1n1miXSRrAN4aha25mnaztJ3Wv1XLAm0M8bJ0AIKlmP5jJsQa5nFzyYe4f/P
         q1pBfbIaEQKLb7k3azhDfGBg1Jh7+QWgu79wHKBVHTN+5GeBYG8UH2wjUemxu8tyid5q
         QT2zyYUJ6KgkkhzFlHTPQ1WHgoLf/8A4Yis2/0N2Ec0MEbapWiuSP5fr1cO7PlkfaoHU
         JmcMMfjewa0Dphwg6GBHTfdnAcEcjCROWF91dm8Th70j6tWgDahmqYTZK47HNb/6Pc+9
         ruXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267145; x=1794871945;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fBV4tYJmq1KIzyuY/a5VANM8OjZ60olLbMUrJpNOos=;
        b=d7esCUm/i9/w2dPs010MkBvyql4Mmy3ypjzDHIlvCR+JIfMOkw1HkcGk7GWD0LpdSq
         xWIhyp7YEIvz2srQh/BNq4B0A2DBe4pjuHmAbljvfkpPr8TUfKa3KlzJ0Qud0VTbBV9r
         MX8o4s6aZ95H8Odj+f8bN3TsnAhfr48HQDWpxKcpD3rrwxMLYfGmCb6QdJEBtGzpPilA
         5oNkU0q8cGivPDSv7+C6ta73RTRdOg2Qf1GZ9kTZHQAjNeR2tjnQ/FKQ9h410GINhA18
         FIqcma2efY7ikfhYbCU4psSfmlnf4Fqj3Ydse1RQHc7fQKpW1iHpNqdGpds50pOFbe8W
         9CZw==
X-Forwarded-Encrypted: i=1; AL+hErGw0tuS+2bejCkUyiB/hnbROrJ/0XY80UBDE6vwtJllyZNUyTBUyWiBoLndmU6mdhNmOthyfzMnok4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X/JmYsAZ5g5VA0HlzBSoK3kFfdkmh1sOpNuCeErIMi4MaCir9
	2PY5K/9ZNco9RfQI3VtYVnfP2BcrLrP8T2Ca1G68IJLslyyMRA5hV+AhUxxHGf7+8jCjUTsbdC3
	w2UT2YG6G5JB7LXC+8bHauKzD5BBH/vbpLbqf2W6mPoJNi2P/BvkMeddTlxNYEFyInJij77M=
X-Gm-Gg: AYBFou2kI5fFfBoxq8xNDaE4txONBYBjeRXzTf1VP+WhrFcDKCzd+/cyzvXyo6nzCMc
	3ga9GTlzbKsUDOCoXXDhMmvnoAPY5wImf9++s7B2mmepybRJJYZQ2JcLbOfE02/OeDPR6OeHqin
	22C+M+H4L1Qeo+PMfJUaubi43baSz67bf/4tIA4xZ+S9dtqVKD2R4Od1ufa8RUIJCnPwA1NHUf7
	MnwwbMl9YPgMxoZM21h8vtAvTeP9hhe+8rIpS53hB3LF+qs7yYRrKifDPkKPs1lXOZKdB6Wsz1s
	bhv3V5f2TjvP2rl4ZTzVIORs1ofsVllNdSUKfET9FLTqmpaDba1r5dinSfQqnk52GeR+TQ47Jx5
	w52aTvrjyV1FPlie3luh8vlcgikQMCCWMnzVJEaYs5nwg8DgkvfEjunlcTm+eu2YWBEvRpbvGLE
	trcSk8+CK5HIJ/voUY62qMoK9Zlw==
X-Received: by 2002:a05:7300:7c08:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37520716615mr1447564eec.25.1794267144578;
        Mon, 09 Nov 2026 15:32:24 -0800 (PST)
X-Received: by 2002:a05:7300:7c08:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37520716615mr1447515eec.25.1794267143894;
        Mon, 09 Nov 2026 15:32:23 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm1656415eec.25.2026.11.09.15.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:32:18 -0800 (PST)
Date: Mon, 9 Nov 2026 15:32:09 -0800
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
Subject: Re: [PATCH v15 06/35] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20261109153209.00005a57@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-7-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-7-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA5MyBTYWx0ZWRfX2h7E0RVM65k2
 Qfc31QIaBj/7mAANpNDj7Wqhev7uGwCNCujdbPwFeteCJl1SetqCk+8Hd86jvhus0o+rYBYqU32
 bFB+wH9DFNQv5j2Ax/6VPGlRXyKpEUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA5MyBTYWx0ZWRfX+wZWtbo4GnO3
 UZDQkeMy58PAseiQUHAioNvFrFaG6yCnDTOIPxomkRftbkQ/xicbuhPRd1RDNBHeqXbiu6BUSNF
 tsJk7Bkz5beYGSkUm6VcV5WdbHKLxPxRuH/9/JCBERTjCrZ20ZQ0iPLQotpY2bWgsz0H0UnxBhK
 wm72qOmDS7pIfGv+7hdnBl4pw3jbGGNpuKhWh/zI+pWxGfkTYAHRHL41hIxXDstUeuKzB3MV+Y4
 EJe/LVAKBN6A+BHNpgE8U2bVrD8DqLxHXKQVyqSdre4lbUjfnNWPZ+UVWbi9hwN/OXSDihVxe7l
 gu3dERHmW7c7UU2xl0s7z1zr57U1/+J6FUqeVOZjiwRUNf1tqGpxv4ZoslFpl9qaHOFWSo/so1Q
 skhhineskcsCUbZ9DSHT8tU9clgvFuRmJQ08HpKIJww6eASd5WcWK8fG8rfOu+zJgQZQ4Y2HHwX
 f67CKEVhwdLv+CXJDCw==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af25809 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=8YIwcjLEM84VViRI9y0A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: _9RdklzUraduMbHaLb5aOn_Nb5ROIMac
X-Proofpoint-GUID: _9RdklzUraduMbHaLb5aOn_Nb5ROIMac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090093

On Mon,  9 Nov 2026 09:11:52 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Protocol notifications are typically used by SCMI drivers to detect
> and react to particular conditions: this was the assumption and the classic
> usage scenario upon which the SCMI notification framework was built.
> 
> Some protocols like Telemetry, though, could be interested in enabling and
> registering for such notifications: in such a scenario each initialized
> protocol instance could want to register a common protocol notifier.
> 
> In order to reuse the existing SCMI Notifications machinery, allow
> protocols themselves to register for their own notifications and provide
> their own notifier callbacks.
> 
> Each protocol, at the end of its initialization phase, can now provide one
> unique per-protocol-instance notifier block, which will be registered, by
> the core SCMI stack, on the related notification chain: such notifier will
> be automatically removed during the protocol de-initialization phase.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi Cristian,

Perhaps it is more a reflection of Monday afternoon than anything
else, but this took a lot more work to understand than I'd expect
for something so conceptually simple.

The recursive nature of the unwind code seems overly complex
given it only ever recurses once (so the gain is minor).  To my eyes
that just makes it harder to reason about for minimal advantage
in amount of code.

A suggestion inline that perhaps a bit of refactoring will allow
a simpler linear flow.

> ---
> v13 --> v14
>  - reworked the helpers used to register protocol notifiers so as to
>    possibly worked during the protocol initialization phase when locks
>    are enabled
> v12 --> v13
>  - refactored a few IFs
> v10 -->v11
>  - added a few dev_dbg
> v8 --> v9
>  - Added membarrier comment
> v7 --> v8
>  - Reworked logic around protocol notifier registration to address
>    possible races as pointed out by Sashiko
>  - Reviewed commit message
> v5 -->v6
>  - move protocol notifier registration out of proto_init
> v2-->v3
>  - split out unrelated changes on event sizing
> v1-->v2
>  - Fixed multiline comment format
> ---
>  drivers/firmware/arm_scmi/common.h    |  24 ++++
>  drivers/firmware/arm_scmi/driver.c    | 115 +++++++++++++++----
>  drivers/firmware/arm_scmi/notify.c    | 154 ++++++++++++++++++++++++++
>  drivers/firmware/arm_scmi/protocols.h |  10 ++
>  4 files changed, 282 insertions(+), 21 deletions(-)



>  static const struct scmi_xfer_ops xfer_ops = {
>  	.xfer_get_init = xfer_get_init,
>  	.reset_rx_to_maxsz = reset_rx_to_maxsz,
> @@ -2297,6 +2318,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  	pi->ph.hops = &helpers_ops;
>  	pi->ph.set_priv = scmi_set_protocol_priv;
>  	pi->ph.get_priv = scmi_get_protocol_priv;
> +	pi->ph.instance_notifier_register = scmi_register_instance_notifier;
>  	refcount_set(&pi->users, 1);
>  
>  	/*
> @@ -2358,12 +2380,12 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  static struct scmi_protocol_instance * __must_check
>  scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
>  {
> -	struct scmi_protocol_instance *pi;
>  	struct scmi_info *info = handle_to_scmi_info(handle);
> +	struct scmi_protocol_instance *pi;
>  
> -	mutex_lock(&info->protocols_mtx);
> -	pi = idr_find(&info->protocols, protocol_id);
> +	guard(mutex)(&info->protocols_mtx);
>  
> +	pi = idr_find(&info->protocols, protocol_id);
>  	if (pi) {
>  		refcount_inc(&pi->users);
		return pi;
	}

Then you can drop the else.

Maybe this gets more complex in later patches but looking
just at this, it seems worth doing that to reduce the indent
of what follows.


>  	} else {
> @@ -2371,16 +2393,44 @@ scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
>  
>  		/* Fails if protocol not registered on bus */
>  		proto = scmi_protocol_get(protocol_id, &info->version);
> -		if (proto)
> -			pi = scmi_alloc_init_protocol_instance(info, proto);
> -		else
> -			pi = ERR_PTR(-EPROBE_DEFER);
> +		if (!proto)
> +			return ERR_PTR(-EPROBE_DEFER);
> +
> +		pi = scmi_alloc_init_protocol_instance(info, proto);
> +		if (IS_ERR(pi))
> +			return pi;
> +
> +		/*
> +		 * A unique protocol notifier, when present, is registered
> +		 * after the protocol itself and all of its supported events
> +		 * have been successfully initialized.
> +		 */
> +		if (smp_load_acquire(&pi->pno.nb) &&
> +		    scmi_protocol_notifier_register(pi->handle, &pi->pno))
> +			dev_warn(handle->dev,
> +				 "Failed to register protocol [0x%X] notifier\n",
> +				 proto->id);
>  	}
> -	mutex_unlock(&info->protocols_mtx);
>  
>  	return pi;
>  }
>  
> +int scmi_protocol_acquire_unlocked(const struct scmi_handle *handle, u8 protocol_id)
> +{
> +	struct scmi_info *info = handle_to_scmi_info(handle);
> +	struct scmi_protocol_instance *pi;
> +
> +	lockdep_assert_held(&info->protocols_mtx);
> +
> +	pi = idr_find(&info->protocols, protocol_id);
> +	if (WARN_ON(!pi))
> +		return -ENODEV;
> +
> +	refcount_inc(&pi->users);
> +
> +	return 0;
> +}
> +
>  /**
>   * scmi_protocol_acquire  - Protocol acquire
>   * @handle: A reference to the SCMI platform instance.
> @@ -2396,23 +2446,32 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
>  	return PTR_ERR_OR_ZERO(scmi_get_protocol_instance(handle, protocol_id));
>  }
>  
> -/**
> - * scmi_protocol_release  - Protocol de-initialization helper.
> - * @handle: A reference to the SCMI platform instance.
> - * @protocol_id: The protocol being requested.
> - *
> - * Remove one user for the specified protocol and triggers de-initialization
> - * and resources de-allocation once the last user has gone.
> - */
> -void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
> +void scmi_protocol_release_unlocked(const struct scmi_handle *handle,
> +				    u8 protocol_id)
>  {
>  	struct scmi_info *info = handle_to_scmi_info(handle);
>  	struct scmi_protocol_instance *pi;
>  
> -	mutex_lock(&info->protocols_mtx);
> +	lockdep_assert_held(&info->protocols_mtx);
> +
>  	pi = idr_find(&info->protocols, protocol_id);
>  	if (WARN_ON(!pi))
> -		goto out;
> +		return;
> +
> +	/*
> +	 * If a protocol notifier was registered and this is the last instance
> +	 * releasing the protocol, un-register the notifier: note that the
> +	 * notifier itself counts as one user, as for any other regular notifier,
> +	 * so if a protocol notifier was registered and there are only 2 users
> +	 * active we can derive that this is the last protocol instance
> +	 * de-registering.
> +	 */
> +	if (scmi_protocol_notifier_registered(&pi->pno) &&
> +	    refcount_read(&pi->users) == 2 &&
> +	    scmi_protocol_notifier_unregister(pi->handle, &pi->pno))
> +		dev_err(handle->dev,
> +			"Failed to release protocol [0x%X] notifier\n",
> +			protocol_id);
>  
>  	if (refcount_dec_and_test(&pi->users)) {
>  		void *gid = pi->gid;
> @@ -2431,9 +2490,23 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
>  		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
>  			protocol_id);
>  	}
> +}

> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index fa2339209a69..6fe95a79465d 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -1061,6 +1061,44 @@ static int scmi_register_event_handler(struct scmi_notify_instance *ni,
>  	return ret;

> +
>  /**
>   * __scmi_event_handler_get_ops()  - Utility to get or create an event handler
>   * @ni: A reference to the notification instance to use
> @@ -1438,6 +1476,67 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
>  	return ret;
>  }
>  
> +/**
> + * scmi_protocol_notifier_register  - Register the protocol notifier
> + * @handle: The handle identifying the platform instance against which the
> + *	    callback is registered
> + * @pno: The protocol notifier descriptor
> + *
> + * A protocol can optionally register a single protocol notifier callback
> + * during its initialization phase: the notifier_block will be the registered
> + * using the usual common SCMI notification framework.
> + *
> + * This custom wrapper function is used to register such a notifier since, by
> + * construction, when a protocol notifier is registered:
> + *  - it is the first notifier to be registered
> + *  - the related protocol and its events have been already initialized so this
> + *    notifier will never need to transition from the pending events list
> + *
> + * Return: 0 on Success
> + */
> +int scmi_protocol_notifier_register(const struct scmi_handle *handle,
> +				    struct scmi_protocol_notifier *pno)
> +{
> +	struct scmi_event_handler *hndl;
> +	struct scmi_notify_instance *ni;
> +	u32 evt_key;
> +	int ret;
> +
> +	ni = scmi_notification_instance_data_get(handle);
> +	if (!ni)
> +		return -ENODEV;
> +
> +	/* Ensure registered was visible */
> +	if (smp_load_acquire(&pno->registered))
> +		return -EBUSY;
> +
> +	evt_key = MAKE_HASH_KEY(pno->proto_id, pno->evt_id,
> +				pno->src_id ? *pno->src_id : SRC_ID_MASK);
> +
> +	/* This protocol handler notifier cannot exist already at this point */
> +	hndl = scmi_create_registered_handler(ni, evt_key);
> +	if (IS_ERR(hndl))
> +		return PTR_ERR(hndl);
> +
> +	blocking_notifier_chain_register(&hndl->chain, pno->nb);
> +	ret = scmi_event_handler_enable_events(hndl);
> +	if (ret) {
> +		/* When enable fails throw the handler away */
> +		scmi_put_handler_unlocked(ni, hndl);
> +		/* Drop protocol refcount acquired after creation */
> +		scmi_protocol_release_unlocked(handle, pno->proto_id);
> +		return ret;
> +	}
> +
> +	/* Make sure registration is visible */
> +	smp_store_release(&pno->registered, true);
> +
> +	dev_dbg(handle->dev,
> +		"Registered SCMI protocol [0x%X] notifier\n", pno->proto_id);
> +
> +	return 0;
> +}
> +
>  /**
>   * scmi_notifier_unregister()  - Unregister a notifier_block for an event
>   * @handle: The handle identifying the platform instance against which the
> @@ -1495,6 +1594,61 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
>  	return 0;
>  }
>  
> +int scmi_protocol_notifier_unregister(const struct scmi_handle *handle,
> +				      struct scmi_protocol_notifier *pno)
> +{
> +	struct scmi_registered_event *r_evt;
> +	struct scmi_event_handler *hndl;

It is a little confusing to have handle and hndl.
Perhaps name this one ev_handler or something like that the
difference is more obvious?

> +	struct scmi_notify_instance *ni;
> +	u32 evt_key;
> +	bool freed;
> +
> +	ni = scmi_notification_instance_data_get(handle);
> +	if (!ni)
> +		return -ENODEV;
> +
> +	evt_key = MAKE_HASH_KEY(pno->proto_id, pno->evt_id,
> +				pno->src_id ? *pno->src_id : SRC_ID_MASK);
> +
> +	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
> +			      KEY_XTRACT_EVT_ID(evt_key));
> +
> +	if (WARN_ON(!r_evt))
> +		return -ENODEV;
> +
> +	/* Make sure de-registration is visible BEFORE calling unregister */
> +	smp_store_release(&pno->registered, false);
> +
> +	scoped_guard(mutex, &r_evt->proto->registered_mtx) {
> +		hndl = KEY_FIND(r_evt->proto->registered_events_handlers,
> +				hndl, evt_key);
> +		if (!hndl) {
> +			/* Visibly revert registered state on failure */
> +			smp_store_release(&pno->registered, true);

I assume any race in the window where it doesn't look registered doesn't
matter because there should be no path in which the key isn't found?
Perhaps add something to say that.

> +			return -ENOMEM;
> +		}
> +
> +		blocking_notifier_chain_unregister(&hndl->chain, pno->nb);
> +
> +		freed = scmi_put_handler_unlocked(ni, hndl);
> +		/* This must cause the handler to be freed at this point */
> +		WARN_ON(!freed);
> +	}
> +
> +	/*
> +	 * Releasing the protocol for this notifier only here AFTER unlocking
> +	 * registered_mtx, since releasing the protocol itself can trigger its
> +	 * de-initialization (ie. including r_evt and registered_mtx)
> +	 */
> +	if (freed)
> +		scmi_protocol_release_unlocked(handle, pno->proto_id);

This recursion makes this code hard to follow.  

I'm not 100% sure, but feels like you could add a tiny bit more code
into scm_protocol_release() to first check if there is a self registered
notifier and drop the recursive bit. 

Something like the following.

void scmi_protocol_do_release(struct scmi_info *info, struct scmi_protocol_instance *pi) 
{
	void *gid = pi->gid;

	if (pi->proto->events)
		scmi_deregister_protocol_events(handle, protocol_id);

	if (pi->proto->instance_deinit)
		pi->proto->instance_deinit(&pi->ph);

	idr_remove(&info->protocols, protocol_id);

	scmi_protocol_put(pi->proto);

	devres_release_group(handle->dev, gid);
	dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",	protocol_id);
}

int scmi_protocol_notifier_unregister(const struct scmi_handle *handle,
				      struct scmi_protocol_notifier *pno)
{
	struct scmi_registered_event *r_evt;
	struct scmi_event_handler *hndl;
	struct scmi_notify_instance *ni;
	u32 evt_key;
	bool freed;

	ni = scmi_notification_instance_data_get(handle);
	if (!ni)
		return -ENODEV;

	evt_key = MAKE_HASH_KEY(pno->proto_id, pno->evt_id,
				pno->src_id ? *pno->src_id : SRC_ID_MASK);

	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
			      KEY_XTRACT_EVT_ID(evt_key));

	if (WARN_ON(!r_evt))
		return -ENODEV;

	/* Make sure de-registration is visible BEFORE calling unregister */
	smp_store_release(&pno->registered, false);

	scoped_guard(mutex, &r_evt->proto->registered_mtx) {
		hndl = KEY_FIND(r_evt->proto->registered_events_handlers,
				hndl, evt_key);
		if (!hndl) {
			/* Visibly revert registered state on failure */
			smp_store_release(&pno->registered, true);
			return -ENOMEM;
		}

		blocking_notifier_chain_unregister(&hndl->chain, pno->nb);

		freed = scmi_put_handler_unlocked(ni, hndl);
		/* This must cause the handler to be freed at this point */
		WARN_ON(!freed);
	}

	/*
	 * Releasing the protocol for this notifier only here AFTER unlocking
	 * registered_mtx, since releasing the protocol itself can trigger its
	 * de-initialization (ie. including r_evt and registered_mtx)
	 */
//	if (freed)
//		scmi_protocol_release_unlocked(handle, pno->proto_id);

	dev_dbg(handle->dev,
		"Unregistered SCMI protocol [0x%X] notifier\n", pno->proto_id);

	return 0;
}

void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
{
	struct scmi_info *info = handle_to_scmi_info(handle);
	struct scmi_protocol_instance *pi;

	guard(mutex)(&info->protocols_mtx);
	pi = idr_find(&info->protocols, protocol_id);
 	if (WARN_ON(!pi))
		return;

	// Simple case, it was the last one - which inherently means no
	// self notifier bit.
 	if (refcount_dec_and_test(&pi->users)) {
		scmi_protocol_do_release(info, pi);
		return;
	}

	// The self notifier bit.
	if (scmi_protocol_notifier_registered(&pi->pno) &&
	    refcount_read(&pi->users) == 1 &&
	    refcount_dec_and_test(&pi->users)) {
	//last bit can be an unconditional dec.
		int ret = scmi_protocol_notifier_unregister(pi->handle,  &pi->pn);
		if (ret)
			dev_err();
		scmi_protocol_do_release(info, pi);
	}
}
		
> +
> +	dev_dbg(handle->dev,
> +		"Unregistered SCMI protocol [0x%X] notifier\n", pno->proto_id);
> +
> +	return 0;
> +}


