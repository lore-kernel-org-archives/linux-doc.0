Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356244;
	b=2YhTiaqPk4rqZU+9b4Lew7EXfTgI2878QA5vueXZrD8Lrt0mkVClz5ghu6RBVEykhx9J
	 dJ9gDddonnKH8PuTMJHc9JW2P7zzm0PcJezcMgY36gP+1gYzv/zk40CcpvGwZcHgW8gku
	 kwOKgX4W/5vx5up+vzeEQK6C4+/nkVKDOVI9Dsmv5FkEKtPBqmVdH9j1Dvig00Js3lEKp
	 +YONfy1ptum1PtwA8JY7+mptxWOGtcJObkTZMSJF/IJCpqBc0soVPlP3VPdWTy7+pPcLf
	 aKGf7l2wT6xC6NqtlRWw1ubn8dbQEt4V2tSXRV+gHPLEVOfKy7DI06HuMw+EAN8r+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
	b=nDtuvB7Wx1LoK+z0yrPiEBiNE9xvD7FBS+rjni72aTltUE4nTQkiW9YnTVL5ANuxQ2VM
	 1QOFONSstdoTAIXmQUyLNn3yimGvZ5b3hQ3SroVE6vzLPOrdeEw3HBPIb9t4BxSilr+Ov
	 B5mnRWQpe5ZOXpqNb0WpFLW/Ys6jLQh7/rXFt2hkOSBmR4Pr6C6+lrQsstm/Jw1sBX29v
	 kmUOv1qLTfv2vK63jRpWya+Q7W/cxPj7WH+SVpfd/7i99tTmtO5/pZSEzMnmIWSgFqFmV
	 3BqbrrG2pXFALodyPoCQ/1CRvSE41dfA5DD+PuXiIehQTXO4f0AvAxh6eLk+SFz7yRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1jWdHr6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IfKcJwZ2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD03606A31C
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1jWdHr6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IfKcJwZ2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML8Ce153505
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=; b=P1jWdHr6o70PdxdE
	ca3zbWHpNS/Q01CDJVg19jkHrl++unZ1XbyzY7IsBwRaRE98NN5l57+rfglCjeUs
	EUzFmvU2dHipnb51F/07MnWsrAT3JLLqaS70e8R8bqSzycczc6dy6CqnrEuVAqKu
	nq1TCW6iE1eq39FbMLvDxji8cx0sV2H9n5TQFTz3+z3CtTKIidu2Xia/1LsqCJM7
	bugsPotgrISQsh1mLnoqZhzMQfmCRbwrprnHgHYj1gFH5lV4pvfT9BHZ1yvwCE4a
	r2Ya+sB5losn1NopcXYulLCciEAn065bS/RRGx7WTUiJF4I/T8Cz69InGfJ4ZM+8
	6daWUw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84bxhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:17:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so3983025eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794356240; x=1794961040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
        b=IfKcJwZ23KCmVgfWqjInA/YlX9jyme5yUyzl51RliJC9RALv2izz6/I8YPlGOrDSdN
         CYSG8BKDuaX/HCLYwyLioiAroFk37HD9sGPYtU3gVaZVMhAX0kGxQeDfVraS/lHpR66c
         qGpbh2UDA9eOJies0Uvn8oDHhWTNpq0cRo7sDWqPcvA32wFtY+KVVMQG2+ZALdR+OBDx
         CQB1QDfkBUklbYXddFVeNrC4OECHgb1ln9cfNGug9KmIo+r82bip7arXeT5ASi1J4I6N
         6zyPTstWdvw5/mMJnastI1bPcgSbbT6+vzH3zzB6qlggHwg+ho5NkcSUZhn3Wl85xxFP
         yIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356240; x=1794961040;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
        b=m/qlvz11ZSbI4d2S0NGpW0gsIQFgWBJxhOxhAiPLxYwHQPvA1rGl7FfKe3PdCEgqjy
         Qcns0LeXbusMV2fb4hrIVnSZWnd5ZIwR29FHBOFAg8BWWvEJuUzAAcBmA6e+bdr4B2I7
         u98EcyYeKldsj8T3sr1ycHdY+l1gmdNyov8TTSc+Zr8e6iXRb6LfIt6rVnaWGwbQhhvk
         NptxwtcGifES7cFdhIzxyEbOlj9KYpkF9sm98byDHaLjoYFWNTxMe3jEL8ZNnT93LJeh
         6BRpLeYKL48fWiE0hkFcc+WdbU1CHtnXdvOIMsGgNrTZuBmfyU762PigwtSCmFCL/9/3
         zE4Q==
X-Forwarded-Encrypted: i=1; AL+hErEZ2KUhMfq2JnqokO9TsVN9VQr4RdWkk6bRLHErwFuAJMzdPWICG68PzUomJGx0VIt/og4E1OjLauA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xwOcImuYZiy/Gt9XwCzyq7W3PlEPib8R6fGVVcCWI0wXDoUNf
	KDwCaJFcInVmH4EkVpzaB5cscvqem4MNeRLE4WlWiHJAr8cq/iFRdAKIUIvYWl+FMmTVABbTj8x
	+FF3P+6hhFCRVp1JKefnSC5S71SBrbHo+3IXpfpbAT2W1BcrxhDyZDUgEYnUh1dI=
X-Gm-Gg: AYBFou0YU4CZefA4lpGmwRw5DnDLN0CacEqG+0nAThU0Tycv9P2bSWlcjDPY7AHSxSU
	TvtVf1LBf21y8YM6efYTX52rWuzaBNrEAqAQeBWioRb5k+4eBAySCJWNn+c+2R+194WWejdll9B
	aE9VbCaQiF1iitAv1IrximL0zhUc2FJbk3QyOk+j0WNseiEey+8LEGgP+Fq/PA9SFvgAWUb4e26
	w33U1DedxWgNvkMtlrXXpqEjcteMBDkyTLbGc8jxNt0Z/7r9fPs8FaHbylxW7iRy7diaZvZObS+
	8xWr5wD4bVCUdX2Yww2cVbVfUSuW4aJoqe3K9vguqp6oJWROvKlCEAiZcCoyFxvR94/83p5Z1QU
	rGck7IKIvsZwpNVzWLCUi6IYQyN3MW5Nd+JSfSAaZ5WGboMbq3O2rEqz/mmhYcpp4WNoz9xGCdS
	DrYESXI8t/7pZjwiBSaBRYo4IPZqjt
X-Received: by 2002:a05:7301:904:b0:375:c862:34e with SMTP id 5a478bee46e88-3768636dc95mr1339961eec.20.1794356240122;
        Tue, 10 Nov 2026 16:17:20 -0800 (PST)
X-Received: by 2002:a05:7301:904:b0:375:c862:34e with SMTP id 5a478bee46e88-3768636dc95mr1339925eec.20.1794356239547;
        Tue, 10 Nov 2026 16:17:19 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm19260603eec.29.2026.11.10.16.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:17:19 -0800 (PST)
Date: Tue, 10 Nov 2026 16:16:56 -0800
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
Subject: Re: [PATCH v15 35/35] [RFC] tools/testing/scmi: Add SCMI Telemetry
 testing tool
Message-ID: <20261110161656.00002a1c@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-36-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-36-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfXxJ7TCcildWGd
 zNCIBsXMxy3j36DSofDENcnBoGC6g6tJKxSP/527hjApcVMzYmuUcfD5Kvfp3RRHaGRcS67LC/6
 CYyoE0vVOLJfS+uDg2sWo4f8taTOb/+lQV9vllZhFRAq2ImE5S4IxZLQtC6IyQW22bURcxjJRbh
 wJUrJj4Q2yXol5Jeus8stjxrr5qpQBEJxwC1ltqLScOrM2cYteOPERosmMffIweiOwp9S3+A3ND
 PlqV4cpzd5c83v2IAWrWHJjSoSKhZMpzBKX1l4WCxARU4kZXKDqhhfzj/w+GVkPuUFcn3c2SghE
 4Eab2xDphL9AeWVOP2vq4ARrcnjBR04KXUhr5z02zxTZa6FKrI9M+ZL2RLEwSijvMnrE71SJNgP
 lIrnO6+6vGGzhJ6z1z8Dl3G14ubTXYq7TSPKPZM4L3SVshcFjQYomhTY8KLtxKTywk88HJ/roM9
 cuEVJ2aQ1wjO//wrRXA==
X-Proofpoint-GUID: qXS8B87EtWkAnmDAm978x_M7A8_jXxEk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX0Tg1kR52GmAZ
 GWDb/lFUs1VS3RQP3Nz22NsB9LbvbAm4QdsZxStCqGRvZSsNrjNYXUUc/EJBzk/3qVDr7CEf3Nn
 bW6IK9w94kBdSz9ptwbcXLPTWwEDurA=
X-Proofpoint-ORIG-GUID: qXS8B87EtWkAnmDAm978x_M7A8_jXxEk
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af3b411 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=Rq-k35hIRNRoFwHvQQQA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110000

On Mon,  9 Nov 2026 09:12:21 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a testing tool that exercises the SCMI ioctls UAPI interface: as of
> now the tool simply queries the initial state of the SCMI Telemetry
> subsystem, tries to enable all the existent Data Events and dumps all
> the Telemetry data.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Test tools need breaking up into bite sized patches too!
Perhaps a little easier to read than kernel code, but you aren't
generally going to get great review on a 2000 line ish single
patch.  I'd be tempted to do this a bit like we do PMUs vs perf.
Separate series, often posted before the driver merges but not
really considered for merge until afterwards.

Anyhow, enough telemetry for me for now so not going to review
this yet.

Jonathan


