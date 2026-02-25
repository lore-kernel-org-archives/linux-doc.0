Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792DC3ED12F
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046605; cv=none; b=Knpg+VkT3vUBkbCGxA35S4QMcepmaken1ObRLNbDxVomzBbJ9zUcSsf5/LDpglcg/LL9s5WoXda4wgrv7jzSSsKhowd/5Bus8092EO6/NrBIxwp6EPuOzrPwAakevEhnyLPe8vOeSkhDyppu11EvTBiQtRkgU2YnggeCUZGOhfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046605; c=relaxed/simple;
	bh=CzfU35N3pjq6xy3wil9kM7JXhYOUU0JGjdRVEwu0+gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBvMWJCBVpPV8NKb8PaYwIEVTD/hph7aQMDS2vu8pUiMz1IumToaaOPwlmMH0ka66ZknnsbYwBRQ4hl2ysjtoD0H2IJAiZYw1JmikhA15K8jrV4t6xVzFyEzZyILM1mhK/hdPz20GIme0glgdwK4EuVpngSJG9Lfywtf0MJV2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deEDZpuC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjSDXKqH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deEDZpuC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjSDXKqH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHZm7K1024949
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pZEpDcrfMrqqrHue5nZhulZF
	qXVRR9YBcn3GTIB6GfE=; b=deEDZpuCFaGh0XyjzUZOyK0hDDEqcK6/Q8xviVo8
	f4DzXIpDz6jIg0dOrqEWjiyZRnsRXjZahXaUHgSjcY4hE+0TuOxFb3cIpjlhiWXO
	EMqG//Dmp5K8OiZY04WhLhOxkBHvE5subNv+ebJkQ1fm1PFylogeaaJpjQ/IUbwg
	bmDwBPPzBsfJPH+EXvISMBJQv+U2mQTGNNREV6xK5QiIvITBGx5ahrnC2lj4Ggvf
	kAUHDy6kIjJGD4ae1n9TSz7sNZ16SM27+PDkJmbSnmvPa49Gfc/WVHke683i7+A9
	ULivLKJqK5NlQTiFt9Gbj2lWTyCDeteu1eDJedoBVLLxFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57u21e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:09:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3fae6f60so564732285a.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 11:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046597; x=1772651397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZEpDcrfMrqqrHue5nZhulZFqXVRR9YBcn3GTIB6GfE=;
        b=IjSDXKqH9ea9aDhAJFpCrrYPsckPwLkbe1fnvK/3jzNEypZtpEZlfWL7kUoZswmhOQ
         mmgAr+swlCmrCPARCZIYbiwWyvFhS2ChEO5jEqPOeyYGHcCQNdG2bRHJL1m2hUJjy4ap
         X2SDzWd39aARN1yW82gZyroltjbARLkBr4lmBSP4Yx1G9ehqqY9sbZq+nj0szF2eOAJn
         eh5TBf5Or4bDUDDrvUHIHIaKwsutaL4AahcGImLOEmYFyTVK/sphd6hxqKx2u9v8hCHn
         u6rxuCRZeB/Cr9vEl4IBh61yq89S3ADJAk4Xzwrn1VLgV8nd4qQNEPdogr4eKpfY2N+Y
         Guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046597; x=1772651397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZEpDcrfMrqqrHue5nZhulZFqXVRR9YBcn3GTIB6GfE=;
        b=l7uV4l0ltYl1tWLhcm6x2JXJjvC/+s/qVWu1a4mXINhfEJsbUi8ugWFBtnO0qOnJn3
         Bg1PP6dVMpeoIr2g0ZVz9n6SiP8J4bXhPcW9iVRfcTjTRh7xrj/bIyaJsPqXvSF2KdyI
         crfNIFoCjA/4aH39FtjWHeFwJJWAqAAoXjsf7ufMJ2iIsyphdAILNzdgKXYLOcfqU3uO
         fkTKDnxT0OVei8i3vLREUggBUYYKt6hBZm4Q5/PnR7Hly/8qXImQVuCuhY5mXun5Gm+e
         96bjgi2/NK94mKo7E46wBvX37i3KqgLWVx7uC8DqmGhEyPSgszT6oivvizP6u4W7A+z5
         MlPw==
X-Forwarded-Encrypted: i=1; AJvYcCW9BjNkcvsDY4BC6rbSGQbdvO1tlA/D8yJQ2YAAFxH9/xN3HagktyHb8Y7Bjv3waQvT2d3cr7kDN8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNdQgHeAS82p3vQ/XO4clGTqvAKY+46JSO3iuJeevEWmpq53rI
	cxkkwqoa+C/Qx97Me6wTtwQZWxqPQwW9x0ffwLMvaNUvkLEQXAvuqXFKusygSWxlyhaILFwufvm
	TvBX/oVIVRHhaBx8shzR0SJozd5VDOTU/wzTSjd2zhXnrEpbpEHqSClROzf9h6rs=
X-Gm-Gg: ATEYQzzWw3C0m+wJwxhxm4Pz/cCRoKT6DEoUmRZEeuXre8WajuZHFKOocwR4DBiY1hU
	0LQgNhGIufgp3hsLrJxWZD4VsKdED1LToGCopZnjuqwTbE9vGwyWZ0jzQtANkAcT8ujegE5415P
	iWzwC/pWS0WTFf92Og6WmZreb+vtaiqad45jOK9df9lAFIRmpexwaKJwJug1Leum+IrwDSkLj+1
	NxZQOGIZ5KJgDtZOLCYZvfR7J78hKUhvp/SZfJd36VIxwEoTGN++SzNmacfqWRM9SufGuayVOGR
	dsWhRbFzyQJW+7gwrPF9AntGtf7YRQXYpJkmlXis4cjUjCqW0r1F0Yl639Dweb70UhMcipRsGzV
	nOTANw2wuUJ9XXNpPjTnAUMekjBPJQrvzksSS922t2Wmve9IvPEGTwK77jga7k96587rNDT9gj7
	HUFVXciuKdIth1QAfBxDdLG5O70DfJNw/BMzQ=
X-Received: by 2002:a05:620a:4451:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cbbf3658dfmr20930085a.10.1772046596988;
        Wed, 25 Feb 2026 11:09:56 -0800 (PST)
X-Received: by 2002:a05:620a:4451:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cbbf3658dfmr20924285a.10.1772046596434;
        Wed, 25 Feb 2026 11:09:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a1fcb1sm30525601fa.27.2026.02.25.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:09:55 -0800 (PST)
Date: Wed, 25 Feb 2026 21:09:53 +0200
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
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
Message-ID: <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
 <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
 <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699f4906 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=yBEyVpS31OZj4jLVKcoA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6es3o-CrciZedX7pwuyZlJyvuQE2g7fB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfX9HOT0brCHpLv
 Hjt6u0LnV4m5EBarGE1AmyC59yiQKHfxXTIscUwQkMBsRNVd5y/IuwcoVj6K+uDYVOtD1xzcLm+
 Mosy5r9pQInOLZOk32StNr5JQxguJzXKaPqI9oeZFpXnFXGK1K2TKIMV2348i9jjb1c8JLkzayd
 r8uO3xgfmMJPii+Yzp05b2R/+TRw+PtB9U37oPPqCSMCM2mGiODnqm3ZjH62QQh/zsthtpBaNyH
 DCoGASyHp6UGRvV5Y4nxnvmCnn6eYkjhfnnUHVErmHpb2rpe+9rMTmv4P5NGNAAXRGxnN1q1i7k
 t5tyofDCGGx0uKyRIe3Qd7YE1Y4V7Pv8rsuNJhxlLlv0/qCNt3gOAPd33z6eII1KqMlvEszN8j1
 dR9MXgg0bDRXoc9/hGSHWZaO1TfFOFGbdeJZdeI8Lef1c3XEeSW5ipOwnskihM6K14X3CtAYkIw
 FretraiH7Tv9VZhO4uQ==
X-Proofpoint-GUID: 6es3o-CrciZedX7pwuyZlJyvuQE2g7fB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180

On Wed, Feb 25, 2026 at 11:26:52PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 4:14 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
> >> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
> >> DSP accelerator (QDA) driver to represent DSP CB devices that require
> >> IOMMU configuration. This separates the CB bus from the QDA driver and
> >> allows QDA to remain a loadable module while the bus is always built-in.
> > Why? What is the actual problem that you are trying to solve?
> Bus needs to be built-in as it is being used by iommu driver. I'll add more details here.

It's an implementation detail. Start your commit message with the
description of the issue or a problem that you are solving.

> >
> >> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
> > Don't describe the patch contents. Please.
> Ack.
> >
> >> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
> >> updated to descend into the QDA directory for both built-in and module
> >> builds so that the CB bus is compiled into vmlinux while the driver
> >> remains modular.
> >>
> >> The CB bus is registered at postcore_initcall() time and is exposed to
> >> the IOMMU core through iommu_buses[] in the same way as the Tegra
> >> host1x context-bus. This enables later patches to create CB devices on
> >> this bus and obtain IOMMU domains for them.
> > Note, there is nothing QDA-specific in this patch. Please explain, why
> > the bus is QDA-specific? Can we generalize it?
> I needed a custom bus here to use for the compute cb devices for iommu
> configurations, I don't see any reason to keep it QDA-specific. The only requirement
> is that this should be enabled built in whenever QDA is enabled.

Why? FastRPC uses platform_bus. You need to explain, why it's not
correct.

> 
> But if I keep it generic, where should this be placed? Should it be accel(or drm?) specific?

drivers/base? Or drivers/iommu? That would totally depend on the issue
description. E.g. can we use the same code for host1x?


-- 
With best wishes
Dmitry
