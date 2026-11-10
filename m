Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350835;
	b=RZOUES+JNFqYP9ZA7mETArfA9VfWBh4aup8qmewoLlRZTFBctlP2OsLJf86Q/5AlnDbu
	 EiOQ8YiuPt1Tyj2j4Nm0BJRgLEKBlK3KgSJ76F6EJ7pzBZlavOnD9rs5d76dHDmizBKfq
	 iSrC2whNljgRS1bYnpE1Kbs9Kj2H72Hnl/RxazkB9/4kv4NSZx248Sg6IZV7LoUFtS7XG
	 2IXJwMGPrni8fT0aYqclT6lhA6KrEXzsIDOPPD4AnKYM/0Ox3/4bpRBrmnP1Q0Ahg8sds
	 OFtqD1kvMSqovOEsjWp61PwqElneHBWA8/q7/HokYLwNb1joho7Cx/NeKuShHfbnfHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
	b=AIZ+3Rx6mB519KScc9NAmGWoEdFow8GA6Z/ntBGOBlDNni9XDHBDKs+237d4dP5TJG8N
	 SZTnA2m/zw9T26taNETORhlKxUFb7gkex9wFIhoXV3gHR6AtrhXwVnk66ZwZRtKTiIMXj
	 cWcjY1eBck8HYSmRFLpQsED8Slw8KSeMVIa+Q/O6tIqIt8T3A3yNE+AsrVHZ/uwZulKQR
	 Z38jCbSRopkNywVswrXpN4A+3fJL7UU/7yk7JuAnCiq1pz75/2MoYj9RfDP6pVgG9O/Nj
	 d8JlUjFGwwc5wpTRa5zl9NHE3mjxhj+fn6hPMlW8k1dk4MVA1klf4w1UzLNj5fBkBIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G312ZYHh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzQQBjM1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA92606A330
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA92606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G312ZYHh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzQQBjM1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKpM13592331
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=; b=G312ZYHhWJ4RA8TO
	ubEW2+HPOqqU/suRUSiYvGRhEfntYedSdH5+UJsj8eLDQE6J05QChMWhdxfOFUdx
	t+DBWN2mcezGVO9FPgjtPClqb3K5tDg8yQGdbbIT1c/qX6jfVMbtV/JFJJzbbJhm
	5GYQ7pMJJXXJf4uEFkfeVFHvsawvDkuLAQp3h/52waU09fb6+8qSB16W+oLk5j3g
	m5TJ9Pd3przbuBfHtdmIU9bLqB+Wt4wWOEDNch6vxRzFEbwmTaoaBBi25HQ2OmGo
	54Vd955tycZQfSgarFEjIV72YP/cwlczbFZjRApG/qFJUbyjUK8g7Wgcok7c5yl9
	bTkPnw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5hcbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:47:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so1947632eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 14:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794350833; x=1794955633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
        b=DzQQBjM1q7kWmLebokVMHwKDR274PgLwA/CubPlmbhj3PbeM4xu/fs7J6oAB1gQj19
         +vfmZ6vvkAPui8n/fMzwerjxCR2BVPc+TXh3nc7X31vZ34jaSH5uy3z+B+f6RUQ3zLqd
         S4EZRPkoPVQ/iVLid8+XL46VP4OBGZ0Wfdgeny4GuJsZUP1BdHHlQoJ95110dB3TGucg
         qlooT4KZyAkqpc6vTxD2CDLMb8gIVyJouRHC1LrmBQ6kbDKWXgoFXwoya/v75hRFm3pV
         5NDZgC5l5Yw+GgqcWD9Pe3QmXfETHYbQ65/VRjgn+Ciqc7FwqzyuTuNVWgSCjF+M/VKb
         F3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350833; x=1794955633;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
        b=ovDMC7e6KYJ6f2tgO2HurR58Cx9hC++TAS5ljQg+Y2FNyJFX8RxPueHkXD3kBr0mPG
         qVW2n/Yae877jzzmzqwJz4tjVsIJWxCh8IynGqH61Rkd84Eim1cIrpkRHLA8Fu2D64sP
         yJKFP26NT/A7qGueafRUR2WEdKhpfZDQuV4Qhr6Kj6ih8MPFCp2HbCaUjN8TJkKMJH0l
         htzuVa1hBX+A61wQpcZ5PI8Oo28ZckSZqKa9L6vzbkfEigmx/7HgbcaRObrxAAyBYUR7
         7wNMM2kzosoH/DazKaTpBpl9r+RrpvqIG6T8RrdRtRCJ2tJIW3Ce+oudpvlEFaAwXiOY
         5JNw==
X-Forwarded-Encrypted: i=1; AL+hErEq4QOybWEvlilcxqada6A0TlLSfam00Fgrbjb8uufgifGPaH3IVyPOss1MLn2/cEUiJYbr+Hnf4PU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lb6BL+JKl896wDJSD5OAAyJ+Vqv2ycBDI7dY8PwISTsn731vt
	FPHTcF9+MgBynFkmKPTiuAmW7bSvZlW/0I4rEUyh03/Lf+dfft4kKupz7DV+RRHXuZ603nbP60r
	DJKF19BKmTKPn1pPtRR8Gc0c7jfEZ7e+CSYgX5GJkhMWb7Y4SSj+ZUEhWdRsPT4w=
X-Gm-Gg: AYBFou1xJrPgkY40KF7fvKcxDVadIqpK+PSwdpzo49a588IL2UAsdXZx4VxsD8cHpsM
	1eK4stl3X0D8cV6w9f+oK/NPkkfNZuPsDt7vi76dPHtEAPokAtVhvLo2NkACiPIq7HmQaIV/oMS
	qPRPoK/1Xt3s/n8HF1BrhcxZGxq8LKjIp83hhkEeUw/nKiN767oYrhKuFF9ZjLggQoERUJV3cbC
	r1mkh4Sq6VeQIYkpatnX1f83V4pn2LhdLiNG9l4lAhJgWCTWuLNsPU/NNUoAMEVb3B752oYgdgl
	8iVOuKCWlC/hK7ve0lr7ttXXFK0WqzABkzKL7m3GgEx8VcSadVc9JTZ+joEVufF/n41/cQhMMwD
	ZF65q4y+jHfVD/lzFVTcFVf/WsswQynkQwgio7jCEo+SoHXQ72KdjN9/JM1+8ayIUQlAnILzDRO
	VeMPjYZZfsKDDlmGHyDFiwFrSg9IY=
X-Received: by 2002:a05:7300:cb13:b0:376:7cda:a103 with SMTP id 5a478bee46e88-37686d30378mr1356772eec.32.1794350832671;
        Tue, 10 Nov 2026 14:47:12 -0800 (PST)
X-Received: by 2002:a05:7300:cb13:b0:376:7cda:a103 with SMTP id 5a478bee46e88-37686d30378mr1356702eec.32.1794350832037;
        Tue, 10 Nov 2026 14:47:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm9820360eec.5.2026.11.10.14.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:47:11 -0800 (PST)
Date: Tue, 10 Nov 2026 14:46:35 -0800
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
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <20261110144635.00005964@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-24-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-24-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfXzeFc/UWSX5LO
 LqI5Q7xRpMYI7LVmRNjw+Qq6W0lMvLn1cYoYR4wwK7G85vO/G88WK7ayDCzZ8fwS47e4yMPqAU1
 ju61nHHp0/Ct384fiOKEmW1WLzQdiRKDv+dACNG8ZdhYqMDCRjqsBnyVlDoiS++bxjArz5WGRvr
 dB3y5EkTW0NTtFfVbPACIZnmzrBsZreW/MlsVaNSxh5b916z43rak8fGOojme4wPqwcFo6/ITpu
 Rl2qDPzzB+pfx4lyXclwNVSa4/srlKeJSL1LZ1o3u2yDHN/AuhCT7gPEVlSbqxx9CIZXYi8usTk
 DY1VRUwrPeyu/T9TpbFq/LebIj2kAcC9gvvcrubVVg1COWEKTSl25GV6mE+a7ZPrLEkutGI8zWv
 o3bDBhO8MhyXzzTh/13n4nbM3u2L/2G6s3Flsg4/g3oa2wWqwSUNZYMagUEib5cIwPX0OqXdkHS
 EwaSvMY1ILcNto3MD8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfX+y+FPkqJO3uc
 xzwWAUxNYNuSWzQ9Gm8SClGIA2PevqcMgow5M4Mz8xhP2jT5lx+1vVrjqVaIjbYyvzQqZRUpi1q
 vbQpioxb9gNwtk+W0jMkxkGsJBx9wRQ=
X-Proofpoint-ORIG-GUID: TIHJsxNbfpAHYyRIwSQzSDoo9OX39DU9
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af39ef1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=C8gR6w-PNCreNn7I4OwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: TIHJsxNbfpAHYyRIwSQzSDoo9OX39DU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100090

On Mon,  9 Nov 2026 09:12:09 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a per-instance generation counter to track configuration changes which
> uses the common telemetry events framework.
Why?  What's the usecase for this?
Needs some more information or I'd leave it for now.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - do NOT reset generation on RESET
> v12 --> v13
>  - update generation counter on do_xfer succcess even if failing to process
>    response since the change hass been applied: this avoids state misalignment
> v11 -->v12
>  - reviewed generation counter update logic
> v6 --> v7
>  - use new Generic event mechanism based on EventFD instead of WaitQ
> v5 --> v6
>  - add relese semantic to the atomic set of the generation counter
>  - use new eventfd_ctx common event logic
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 46 ++++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |  6 ++--
>  2 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index ba17204bbfc4..c21700bd1b43 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index af882c1e4ea4..585eb3a4684e 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h

>  struct scmi_telemetry_de_sample {
> @@ -1003,7 +1005,7 @@ struct scmi_telemetry_de_sample {
>  };
>  
>  enum scmi_telemetry_event {
> -	SCMI_TLM_EVT_DUMMY,
> +	SCMI_TLM_EVT_GENERATION,
>  	SCMI_TLM_EVT_MAX,
>  };
>  
> @@ -1030,11 +1032,11 @@ enum scmi_telemetry_event {
>   *		    the ones belonging to a specific group when provided.
>   *		    This causes an immediate update platform-side of all the
>   *		    enabled DEs.
> - * @reset: reset configuration and telemetry data.
>   * @event_subscribe: subscribe to the specified event @type using the provided
>   *		     @eventfd_ctx.
>   * @event_unsubscribe: unsubscribe to the specified event @type the previously
>   *		       registered @eventfd_ctx.
> + * @reset: reset configuration and telemetry data.

Unrelated change.  Belongs in previous patch.

>   */
>  struct scmi_telemetry_proto_ops {
>  	const struct scmi_telemetry_info *(*info_get)

