Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890282BE7DB
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493157; cv=none; b=RwhogEVYFYx3vWSNyW4QlWLHyuMpGHbfNRKJicndfBmH2WjW6o8VH+lN9M058r9fIFlSjDpqGk37adZCnJdfrzuKaPJNIdaX3JClIY5ZgZ0y7ThME45vsK5QkfKzaHxc8p7RM3BxZvVyzo4HUj92hFmVXRprxYnwfOo0TYB+6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493157; c=relaxed/simple;
	bh=qKuP1aYXbsLJv6x6e4VAWHfEB3D/VfGQIgMjqDkaRw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHGCbC4rrCO0w30Sar4gWKijvwNyCowJdrmcDumRSuFhEQB9y+TIfXMqvfKcSOXZtt6vIQxPew6xjZs2+1Mnnffy5EpSV4d0Iq4+9+cEJqNVh41kQVJWnSw53AhL2Cq9U/Fgcjta5hZJA4yvwdlkE3hlUCv+p8s3HtvDO5c4baE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODNZo4nN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3kEI0a2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODNZo4nN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3kEI0a2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CVOxk380788
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 13:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UhFwddlTFY09oF6cy7oYeNVke04XX3DNuQUC89hSDWQ=; b=ODNZo4nNljDaEEsi
	1dIvaUauNqUhkE5Fr31T394FGhgER/rCJQmyJBP1E+y1HnlSMLtKzu4uVtE+5e0A
	GTGjk5Z3FWKAq11NdlAKHmno2R+/mnw0barEmTPEZ/d4dKsWpSz2iBND3GpY/8q1
	+W/x/yk7omU/OqmyDBntXvKs4JPTMJcN6AVR/o08V4KgVkKl49lO5ce0uauypmdi
	aNiimcbLZTdoJBZAlKgUtz4Rp4CX6PtW00AFT/5gRhHhRobXcLfGEDIU1ZFdKfpI
	lXu8ClEOdxoMM0Jr+LoK89idmcGNfciwX+l9ud9ovRuYF4ZptNkozDdSMIi2tYLm
	0lTb5g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhsnkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:25:54 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a2afc494efso4408122e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780493154; x=1781097954; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UhFwddlTFY09oF6cy7oYeNVke04XX3DNuQUC89hSDWQ=;
        b=A3kEI0a2V8nsl2ArM71DR50lH3kwKeT0LHZFFOWa/5mcjWJjVrsdLofbJavji0VzJy
         nKkyjiNbAl60yO5u/4bCFGdV27bv3IrSH0OMlR/KfT1YQza8V5ocGKIUWbGeU7JLRsUE
         7awiyU/akUHzqGxgk+SjkSeJwq7/xuMVMUE9u3rhkPoOn2Mx06VznSL3bWGq1oEjXRJD
         AIWq5eZVv4qfW9T1cBdT5McCaTtpbM+cuxiQTficnIJ6crrVR0zsmOJooaoF/HQrvidp
         AxKL9uccj3sR/aHS3hENw2Kwu3rDUBlTRKBte3jk1WJvGmF2VmfigelFismRnSUnVgz9
         oA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780493154; x=1781097954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhFwddlTFY09oF6cy7oYeNVke04XX3DNuQUC89hSDWQ=;
        b=mkryzNZQZwmvwMwbsAKJ+gQF1RUxGXRNQ+vYQYfOWkjoRSMVr60F/ZkcEibJi6jHge
         CkhOUEKwdjPHNHBgmg8a2KiE1y/4UYgvt4MMQfZolCVVFcl5fkcwydYiTPWtm2teZfZ3
         xp/4meYd1SgPDD7QfifMdhgQsnacY416bhDFl1yMzYdWXJ8Al4p9AxSwzm13nO6c9wdw
         Zv6zpO4zZt9/1xFBN2/QMpfSVDTkwPAKeIsPYES58NlkWb+h3PLKNxB859MMD83q4Ubq
         BQfIXLk2JS4Yk0UnaNjCWO12oqgt3XBdElHDE+DgNP15D1GvrRE+iikDOLTgb5oIlVnE
         5gGA==
X-Forwarded-Encrypted: i=1; AFNElJ8DAGsbXctEoinn4zl/sdnVp1DCr/IDjW9c/uKY56pQo3shjLPMBvCd+bTB8J/BX6h2ZhEXawO/IgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcJDWS9qOAlJp0Y4T5LH/OaG/iodYMlWFc/uXc1JQREF5I6/NH
	C2iXqQbgkiDEJw4djQqbgDTbXLhUZJIrQX127NIYj5ZpX8y2rmr6EmR3tuVnqEhQoazr+vpYE6r
	yuxOG7l8q/Yf8hAaOSBFCbpdXTj9OU/hOClMNx9CadDEXKDslt5Js8mB0X4UqKaU=
X-Gm-Gg: Acq92OEzCAUbgLhYPewjvu8rUU9T31jA+MIZfgYdEIE5z5lgGcwh0z2LPOGUzRv7pFg
	65KqWZm9G7m+ERA5UyV3TWQrM9dqPPC3wWJ9/CAp8KJ1vVX/yrhRwh87P0IKRIlS0lpwq9aceS5
	QOuGePuzM/WXJXWy9Dz+SWiVgSltRDa+EOg+WWVXBO52WxlPmO4MBOSXKhLwOvMCazvyQyS1jj9
	93GYy3oEU3vgp0lKqyyEkPo1x2hOngVkATnxkpZVNDYK8E2hWzMX4jHUV3onXehxaxXyahX/+L5
	E7nWRM8QIDqMZ87aCXp3aD2LiZaM1sNHCI98HpdLFDi2MvVn2Wu8s+TUshkwF7ymQ2Qbv8xS1uP
	+efy3sKcgyINg1vgfrevWPMPo2uOAkCPb7Vya2DzXHZbcY08NPnsP1EwzT26FELutP84/6K5Qzt
	51RxceYk4/Wf46QUIXfk+Ay88St10Sp4Z6hb6BGh4qv3q0IA==
X-Received: by 2002:a05:6122:46a2:b0:59b:7fbd:39f8 with SMTP id 71dfb90a1353d-5a6e852c12bmr1998168e0c.10.1780493153881;
        Wed, 03 Jun 2026 06:25:53 -0700 (PDT)
X-Received: by 2002:a05:6122:46a2:b0:59b:7fbd:39f8 with SMTP id 71dfb90a1353d-5a6e852c12bmr1998093e0c.10.1780493153309;
        Wed, 03 Jun 2026 06:25:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990d37sm653480e87.70.2026.06.03.06.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:25:52 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:25:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 04/15] accel/qda: Add compute bus for QDA context banks
Message-ID: <t4dcxboazzy6mxtbcjntcccxl6gc5oxjaituzyoijy2i6wfq3n@hxcrglx7bftk>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-4-b2d984c297f8@oss.qualcomm.com>
 <gnlpw4ijwtjv43nhcv5iirhjnuc7dntx5vucdrhnxeyznyxa5x@t65o5owldu5s>
 <587b450c-c527-4c6a-b48b-8a7a266bd673@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <587b450c-c527-4c6a-b48b-8a7a266bd673@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfX2zJrBYhK9aTg
 R2jfE0uYCAIRa+fkkXh5OfZZEBC9be5IT+2ZzYRckt09xjwAhtI7fpchcojty6+UBkU7sc4ulUH
 Vv5kI260KUBCXvELUJrozw0wTpW/xisEW+DbJL9KMzTvs889cN7MOXB1F608oboUH8sP5zPJksB
 Y+yyF7BhPA2dRjTQq7X2NqRTufdFNqvEtVx03y3VGU7lCMg/hRVAzrOZ6dvLFVQnMB2h//1TnB7
 Ggs01xeVTL4wh6TBjSpS98fP3szKZPeEIFGJ/VsY2a5PHY5AFfal+7wDVVMzwiMN7qBC62H2FR+
 Tp4wcvXZDB44pCU/0r+gxpApBMt97EWNf12xxUtxUFD7yiujOpOvZ0FK4u4ml9mFYI2sYay97oc
 K3Vq489ezU49tfB1RCLMI/LA+5kodw0stEOZc5gMSQvwki3cID0X+Ex4qlmU2AXpLY0YFngqrhh
 NDnUssWMFwJ0gb4kKTw==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a202b62 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=w4rcs2q4Tst63B3XjnYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: dsHL9dgOrOc9I8Tzyat_jen8y3mifpHn
X-Proofpoint-ORIG-GUID: dsHL9dgOrOc9I8Tzyat_jen8y3mifpHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030127

On Wed, Jun 03, 2026 at 10:58:09AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:49, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:45:54AM +0530, Ekansh Gupta via B4 Relay wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> Introduce a custom virtual bus (qda-compute-cb) for managing IOMMU
> >> context bank (CB) devices used by the QDA driver.
> >>
> >> IOMMU context banks are synthetic constructs — they are not real
> >> platform devices and do not appear as children of a platform bus node
> >> in the device tree. Using a platform driver to represent them was
> >> therefore incorrect and introduced a probe-ordering race: device nodes
> >> were created before the RPMsg channel resources were fully initialized,
> >> and because probe runs asynchronously, user-space could open a CB
> >> device and attempt to start a session before the underlying transport
> >> was ready.
> >>
> >> The qda-compute-cb bus solves this by allowing the main QDA driver to
> >> create CB devices explicitly and under its own control, making their
> >> lifetime strictly subordinate to the parent qda_dev. The bus provides
> >> a dma_configure callback that calls of_dma_configure() so that each CB
> >> device gets its own IOMMU domain derived from its device-tree node,
> >> enabling per-session memory isolation.
> >>
> >> The bus type and the CB device constructor (create_qda_cb_device) are
> >> exported for use by the QDA memory manager.
> >>
> >> A hidden Kconfig symbol (DRM_ACCEL_QDA_COMPUTE_BUS) is introduced and
> >> automatically selected by DRM_ACCEL_QDA so that the bus initialisation
> >> runs via postcore_initcall before any QDA device probes.
> >>
> >> Assisted-by: Claude:claude-4-6-sonnet
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/Makefile              |  1 +
> >>  drivers/accel/qda/Kconfig           |  4 +++
> >>  drivers/accel/qda/Makefile          |  2 ++
> >>  drivers/accel/qda/qda_compute_bus.c | 68 +++++++++++++++++++++++++++++++++++++
> >>  include/linux/qda_compute_bus.h     | 32 +++++++++++++++++
> >>  5 files changed, 107 insertions(+)
> >>
> >> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> >> index 58c08dd5f389..9ed843cd293f 100644
> >> --- a/drivers/accel/Makefile
> >> +++ b/drivers/accel/Makefile
> >> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
> >>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
> >>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> >>  obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
> >> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
> > 
> > Ugh. The previous line should be enough (but don't trust me).
> I was seeing build failures if I don't add this. Took it as a reference
> from host1x driver and recent iris patch.>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
