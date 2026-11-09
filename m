Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261445;
	b=B+yV31bSTN4DNRsy+9vclcMB/JRJVQvMFeZ8wBLO/glrywMJX/o2h7Udx7WvoZxO3fDA
	 7vifp0hTgDY0jHQU/2FfMMyCfyw8oreox9laUoLQvZ9hqNDrojSpKz+0xrW6eS8Rywyre
	 LK0ZMeHga/ca48q+WNkbR8ANgvJ9X9Rll04p2p1UBIr+y0a76qp91iLNhzg/+3vjX0tFo
	 olQeCWNPRY7ob7mqtx7Xxzyi6jEwDIXYXdRpTsFGlMRLLdaqvcyhb1lU+J2wTi6xb+LoO
	 M85AhYY7SEfjdQsjfet58Lpyhu4EUGW1URx3Nuc5LiKYcoO24ctwDLRdHRcm9eYxIrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
	b=HGovhFApmagQMoonQIHbnR56ToZ8n6CyRdDzvj35H598EOi9ytMLN2+hF+DJS6nCronk
	 zn9tz3kNDirjBnwK3goHt6Q4ES3oEvB8Xm8LPgWj/X6PdGX2nWq0uKEB7lpzp1B+NTFWE
	 OsUMoe/Iw4Szg9fII0gcCjOG0u0ED7U4jl7ad5KIG5pESuz4GNj8Jgq00gdGoiCDaj7ho
	 eRfKdVTJRzy23smYyh5dsbg2X4ZGHn8d1Ekvi5P1o6UBFNVCRwT7wSEnK2q0jmcO80OjP
	 kLFk+UwnxkbUHEfkE10+B4aFF0b0bXlrPF4EwnPIEG9xhR/XLab1sxaOQSa5MxzeslQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1VcI6mF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bROBw/Ff";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E966B606A325
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 21:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E966B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1VcI6mF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bROBw/Ff
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LEpoR317862
	for <linux-doc@vger.kernel.org>; Mon, 9 Nov 2026 21:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=; b=e1VcI6mF4e8vaywo
	BP2JNRCIqHssN0C8xO6Zctry3jEKmvteqTjRhEneMmvzz90PUDh0+aSacce9EAYb
	SBGo+9EwmJ8YIEDQGxJ3CE1I4ob3yG3mlEbFtk0ViV7XnQF4VHVoHxbK5t902JfG
	CZLg6z3J9gD3zgrCNMw5RQCM3rrHuyONQDtVSbxmfsSjBvoJZu3wi7H23A/8iiTr
	36EiWJ7SEqEcIJ3zXD2H/J2HIj84nVWDfhJoe/+7KxczykChI0kU176cMMYJMdNj
	kXFBVWZj4l0DCSZ7sxIthy9ceHbhEETDizISpnPuCTfZ6I3AHjKOcpQ9QwDIEtd1
	dV5NaA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkg585-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 21:57:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae17c536so1281967c88.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 13:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261443; x=1794866243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
        b=bROBw/FfMK8VwRDHkxTvvnAvfeP9mwtDx9xXEWSiFLlTEWtzxNqMGHzLWpgWnIlL66
         E1uZUpUcCcJ3tCs8thPWdQKL8DKCA3txpmnU0SXqHXZdxaNS7b7+dmtpaA7ggvas1Vni
         ezBRGqMCcDgfsSExFw/JkkQnBFJtymjyn+4AUlTYoIzScjeNmZDhisQBmV0Bmh13fyRo
         AUovlx3Hkrx2s2dXdU9TMHTT2nZF18tQ5kelA8RaMBqKAZfSEHAVzmqZvsPZ6ogK6iAh
         U8/33gjFY/uXcztsLEIQXx1KTdBJZht8SOt07EXLmnrJvtmUpM+KucNSMX3Nl9KX4EE7
         7YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261443; x=1794866243;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
        b=LyOTTQ3DP2vVQesOakj0c4yTUNTugAYAD3CkkkoAPmHj53nf9i0Kd8L/gLhhSo8inn
         m/4Zsl6B+BlsKV7fyygXSzbRk6kJJLQUUDEZoPR2EBykZWy0br/F4FldfnuQiNtYN7f0
         6p15Gm0n/uVx5H0DP1Ur/DsTfopnz5zXUyUDAPncp7M0QtXl7fVKVJ+xXP/6fA4DDd63
         wLXzWqDzlTx1udv+53NZv2rEEm3/fT+kWdFUt3wxRHq7OA+np0kd8+Wb6PDIa6CPU8qg
         1INH0eCS65wWJdidNH2PuD3mBfP5hjKkTLzfXtRRnA4t16yE3M28VlX6ebG08NVDLbbk
         GEbw==
X-Forwarded-Encrypted: i=1; AL+hErF/JfZN05uRS2SjpPW3CHWfhr5+dq+8csUch8XXSgOiiaKmlzTkZtn+PEMO5/adSmkZ6O52X2JOnSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0NUEoUnhg8Z7cTzadGH6E/uIYu0tDnBjWl0QK1UwRzeJecusC
	OpQXk8z+jdqLjhWze/HCeQvy8c0/p1qvf5g9/NF/SXumOLjlG4jFipJe5dH96qAnd0c/srkkjom
	6iIhsdX1b+UD2adAGGjjU+8anL23fWu6C2ltMd9960LalORJYURj+dj/bCRz4vqo=
X-Gm-Gg: AYBFou1c7o6zmmvtyKLuYomnqWyfDhxiGLzuTt4xFiNeGbxtieOsNCn9ItJQ1Ra/qxL
	W4JJW3LC14VFhVIA+bHkTpKFj9yau+MAvZhxyqyx9/fX9uIwt266zNH882yJpcH3dj2rkQ0l9AB
	UBVEJRfjTA7i8aEa9eVr9gHie5LwU/WBJQGaVRxlkmYxHZGDIKIlq0O1YyZoRinwH2sBkAPCh4d
	Pvaaa3YGvmFiAtxl/Kd244l8rIU0UPdSBct4QUVXK7VMQ2AvTWeRQygUUUm/6uEdGH4eAwi0CXn
	YoaWJYJO+4701xKSf1qlnObT1wuwaeFM0bRXDuGfKwSQu6BYAfm5gkWv8a6zchudxAMd+NrcNSA
	WzpkvPhIuK+w5yzBAQKikLrDEX1pb1Reh5tI+pPY0tDUE1YMGmi1iLpYbo98kmJXxuxr7YmAeli
	XEt87fRdt2WLSK7hWZPuLDzcstTKw=
X-Received: by 2002:a05:7022:170a:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b3b6037813mr817974c88.14.1794261442620;
        Mon, 09 Nov 2026 13:57:22 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b3b6037813mr817919c88.14.1794261442019;
        Mon, 09 Nov 2026 13:57:22 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm2048895eec.23.2026.11.09.13.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:57:21 -0800 (PST)
Date: Mon, 9 Nov 2026 13:57:13 -0800
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
Subject: Re: [PATCH v15 01/35] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <20261109135713.000049d6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-2-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-2-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: UYR1bYKu42FAiBLmZr75nno9KQ5kBEum
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX4wl4/hZzHoHt
 nh/lb/Rj79z7UoqbBpq0/F8n3kra16BX3lfsO/Stgki9/ScGA4XTwDrPfTfVtKkdrIUSBxYTxY7
 LPJpXB+oHefkByMrc662sCvwtFiAIi4=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af241c3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=TxbN916H7FYpum8SNwIA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: UYR1bYKu42FAiBLmZr75nno9KQ5kBEum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX5PMQCCNrApxY
 Dyw1CcwOGb7H5z/wYf8/rXGAYb7XEgbJD3CBV3B2UYBDOwxJulHZE8+HanGPVgLbLsCT32OUIei
 mvcE5+HHvpGWQGh7QQlEitWCsPlAb5dg5NrpcdzOSFPOkY2rfHO+pHYIILUQ5wti2GkV2C8325b
 IT1PZd8OvonAra2+sgMsMbqQiTkwTdLComdg8JWj5bZeTjOvEpVxUbJBCRRR87wyWA0XHc88WjY
 FqZc0puqhMccEetrqhhgsGrqrUlnYmcjYHlcMfaL9gg9T1w671XuUcEqcMWu+Jk5KuE63yCoW6Z
 j9QsFsrTPdVEkJdYoAcvoIrdRtFMBX5b5whMnPhW5Fj5LHuc4qGYa+1EM53IdAj90OQwscuVZvV
 R480I9i5mrHYQH4rvObt7vx+AtI2aknpcpsL2TbbLF94XOeuWg72jZsLA+qYKPXUoRxvl9OWzRU
 YaH5nQp4fu1Toj9WD3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090087

On Mon,  9 Nov 2026 09:11:47 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add checks in the core multi-part iterators support to detect generally
> malformed and incosistent multi-part replies.

Spell check patch descriptions.  inconsistent.

Otherwise seems fine but I'm too lazy to check all existing protocols for
that minimum size!

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/driver.c    | 10 ++++++++++
>  drivers/firmware/arm_scmi/protocols.h |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 05092301db29..55d9cc487916 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1873,11 +1873,21 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  		if (ret)
>  			return ret;
>  
> +		if (i->t->rx.len < SCMI_MULTIPART_REPLY_MIN_SZ) {
> +			dev_err(ph->dev, "Invalid multi-part reply.\n");
> +			return -EINVAL;
> +		}
> +
>  		st->rx_len = i->t->rx.len;
>  		ret = iops->update_state(st, i->resp, i->priv);
>  		if (ret)
>  			return ret;
>  
> +		if (!st->num_returned && st->num_remaining) {
> +			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
> +			return -EINVAL;
> +		}
> +
>  		if (st->num_returned > st->max_resources - st->desc_index) {
>  			dev_err(ph->dev,
>  				"No. of resources can't exceed %d\n",
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index 8583159059e6..b295006ef1fd 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -33,6 +33,12 @@
>  
>  #define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
>  
> +/*
> + * Common minimum size currently required by all the existing standard and
> + * vendor protocols.
> + */
> +#define SCMI_MULTIPART_REPLY_MIN_SZ	(sizeof(u32))
> +
>  enum scmi_common_cmd {
>  	PROTOCOL_VERSION = 0x0,
>  	PROTOCOL_ATTRIBUTES = 0x1,

