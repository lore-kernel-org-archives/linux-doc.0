Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB55F377EBA
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603719; cv=none; b=NS1ajyFwKunjdkadvRAq5HoAZsCdogoUqHt/3M7ZVBFdw8n9A93+TVwnxfjSBo3xYcMUfVgOwbYHxYdASn1EtCqWeXwvM04DgTEn1+pZ2TOS3t1/pr11Lrts9/M3W9WcLjIPFYNOSX5fHSRzKEvl35yAvMvIfLFCJwiUc8oj9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603719; c=relaxed/simple;
	bh=nbT5dzntacKFRQSPqk1p9+anOK/Ykfp9XH6Z31bA46Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hy9SueC52zyo4JhgUzMpvrT0GXhU2r3fIlcjMC32pfn3cGvcieB9lWpHtPDgp3hZGOJ+1q6Ms03kHWbF8pcmE9i8CiLAxAIAoNBTEdk+ypRlc8KKmES7HXJDL43o5G8rX0RTZdO9q7eecdErCxxzBRG9NGEpTqEAb3zHQflU4cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBqX2cXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWAZNghB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBqX2cXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWAZNghB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJGqPp2724688
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 20:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=; b=QBqX2cXECxUzM1XJ
	WfAsxafAL+U8LEeWZY7aYFIKxDLTk4DcUmrnCyCoW58Pz5k3D3UlMkYAC0j67KJl
	7zPXbCweJtUkOaNOLlz0oVTXYJYkl+R7RMjJUJaO0gEtBVh7TauGUrG4XKUX/pTd
	7ShltVXv6/Yl1zUW+XyYWKRnIFE13cCXgbWIpYjE2U0ANx+SoM5cmX5LvEvjY8Sm
	XoCni4S81gqE10Sn2LpzgTRyGQSKeNoOxwqQt86klnZbOSg5WFLnGvFMiytKiszQ
	cmid8zGuAZu8JXpZSJVt1TiEyaw+JIPEwRHQirkaqr5HMBc9j5WIDA7A5uhQABIg
	v6RQrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf37yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 20:35:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5779486a12.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787603711; x=1788208511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=;
        b=IWAZNghBJuGwbwfhWUmiw22uakA6zMAVQIAFR8JnZZv/soqp06aWEgBNtgo3dGwDIe
         gBCZS7AqSq8cvDG+kvPgz4l8DLh4gFmFh/4Ig2wPPMJqNxdB+TM6AHeoM230UkLvW9BQ
         0u/WhU4WJdOOs73ZeYWiRoAvOApRRBcDkco0IQqg2sEiEhzueChXvVs302/FNFwpn2Qp
         u+6LEm7exrotzaNAd02Mo71Bd3xNE4zwYpwYCtGjLPsOUaanJ7wjx2T+0ylAFG7En1m3
         Jb0Kj5DX9YdSg04WVAHNloHWVRqu8/D0Iy7XhOct+UmaYR6ycU6IKtEHAz01HKKpvy3R
         RZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603711; x=1788208511;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=;
        b=XFXMJ8HsicnCtwSOTvZSiOBvK7uRe1HNvIuE78QIT1ZHCGmofd8znYIL194yO9jWnw
         rCKEAo9+g00CKVB+zyrIVKafxBL0UrETUriaLl0KpUEcNwbk6lyRpILOKRoZP+I7DdKM
         5xIHisaAv86r+ZcaH7REHLJRf1oqQvkPJBG5JXTKaHnZeS1CxtrpYtsLJHMndBLWuVXR
         0r5n4lzFOXNr3yJ49bsDNOtyQR0dMkgwkYzZa37vU9GJtwioGdddmY+Yw3KvnQGrAYCV
         HGrC7qM1usYe3ELak/hHjKMlvK5q9IAhc78/H86KKd6WXcQxQ5OIKe8Oe70aJXHX7xzE
         UdZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZNn8f+tAsdPHiMrUQGDBu9koqqaQERwc5R9TssyhefiDjjy59g1eAlksTh6On6AgkzsnyTEOmBFY=@vger.kernel.org
X-Gm-Message-State: AFuF++klOUo/WffoRsyYRGLOB5gh9NRZaoHUVANGxGOTe5GsXKCYRnee
	DY3cYaQ9aUywyG522oFGY3C3kij7O9qwfGGCc+qyuib4Yhk8IPDZK2dGJmFEBoE+60IwZlA2QK8
	PgqlQt85WjiHy4z7eB0W/gpqEDfUA32k8eReYOTx5Bhnu4fngEPGP1gM1Q9UrW2Y=
X-Gm-Gg: AR+sD11LSvUZy3jCLvrADyP5C6DkRfR6Ymmw2ZYCPChtWUvOjt3HdLNWBZG5LdWrUqu
	kvlkEZa3C/8KazpTWnKKe6Avobt71S8Iza6L9L1AoBPmCjopu5S5d93SDFO5yYqnGJvKfPdyH2v
	pS7u7O7M53KDiIRey8zBWx2BHvvNrZc0nrkOMNsKGMiN1LLdPWmJ1UXB6Mm5voRbevXnBDK4g2N
	q2aQMrOlPsRFQHeNuArHI8ALsCDHG5E0gd8VDp+Rx/2YURDyhRnhesJe0OTEy4UEa6BxtUTUHGm
	l1wnhpbRKJ94R88fxk5XYfd9CTWsBw0FuZlIW6JXqu26VjhNofK+vGOlehwlrdcQ6X7AQKVQx/4
	6gZQnyWTuOMi1ztSUK+6xUSgo4A==
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr44771640637.18.1787603711136;
        Mon, 24 Aug 2026 13:35:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr44771557637.18.1787603710735;
        Mon, 24 Aug 2026 13:35:10 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418600535csm25139612c88.0.2026.08.24.13.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:35:10 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:35:06 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v10 03/24] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20260824133506.000053ed@oss.qualcomm.com>
In-Reply-To: <20260815232604.3730754-4-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
	<20260815232604.3730754-4-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3MyBTYWx0ZWRfX63gwBwRJQssg
 +azQHwHwQtrnXw5myL7M6nTotA/wsPeF3s/s5DCueBT+gRlCYBwYU/R9BmZgIt52PswI8YwrKLn
 aMDWtfWP58vG9Y+MceH6qtXcgbPgWQ8=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8cab00 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=aGd6ziPyllhe5ofM85oA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 9PMS-pTD04osnzG4PjP0GjddMewPHBrf
X-Proofpoint-GUID: 9PMS-pTD04osnzG4PjP0GjddMewPHBrf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3MyBTYWx0ZWRfXzXlLMCvjhotw
 GgOpoUuQaIQDu51Jcq7ISi9ZUEEZfCUk6eyIgwA++rtArQv9uFWIrXIBIZ/YVHImDg0i3U8Ymi7
 7yEcUy/AYSpH2N9WaB3D0FqDIsnAY2Ko9G97tWinszzp/qZP5F3erdvXRjWDeyzzPFBTx49mycm
 1SjkPII7RbRjp0OTdKhsBa8cjfmAX5M4OwvoTYZruFqE/qdOtciaTXSQabmHEc/C1ZgY9KgNPYk
 F9VbVRXA2absmb54xiU5ysjN/q5xK5qbevGApDFGtVqaCDnYOCQX6YncDGxNFmmGide5mML9/0m
 lgX2KwMuajoDF/xa9vUjxQqmIhR8wREaquljXYODF02KLPqZhGbWvlFGXY5PolaZKvN8elu2B13
 Jv04ClClamr+q3PHH5p7nrFmlvbh29RcKkRRh6Q59cUUtgxgQidUZK6P2Jki3x3SQm+v9ao02AE
 d7/HeNIEPBgd+OMXiMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240173

On Sun, 16 Aug 2026 00:25:43 +0100
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
I skipped a few versions but what you have now looks good to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
