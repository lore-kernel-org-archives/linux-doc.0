Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90FA2BF3E2
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867022; cv=none; b=iPYVKSHINQgHZfUNbzl1lWvqxoStCfeeFUO59OjCnFolIY8LAxIioQwoWrEaR3V4nq1tUOJ3d4QbqFqlq3BVDdxu+/d+oALCtEQ97xPaZS2KvwWo9K7NGVF2wJ+6/UQ5SEgbm2lFsw581HpM9XvB8RNp/CllgkG2fNXNSgE0SIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867022; c=relaxed/simple;
	bh=K05rDR/kI8f6Lkx/1x5sjLiZhZshxFfSfklW9pxpF8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcxbsBeotGhYDtfY2ifH7OXudDWdZS3pAFYoLAMkr28Xs7caLQnm/KpdGsfo5kd4FrOwjg4ieItlEMrtaNN8dAr4KjxgH4d/sIllLkCD0WPbfnHVsfGK3adEMUQ88OSjngXB2vmKjVE8xx8MrQ33XE+o7inmM5uw/pt9KowHvj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=But72Gez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fX5Zc6r/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="But72Gez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fX5Zc6r/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ek9f7336060
	for <linux-doc@vger.kernel.org>; Sun, 7 Jun 2026 21:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b7j6fWH2ZTuBoYf3DikwUXDF
	crJUfkjfuq65I6UYILE=; b=But72Gezh3J8O2kC7pcCgCeUO5B83TzWPdicivQA
	g19bqR3eLMsg6WosHQ36cxQOtkV5o6n+puHlydTYJg9M+usFF2y/WDRnVMD/m5tC
	LI4wPKcHTMp5c+znAZb4hadOrDuF1f60I6rywu0fRAkeKosyfnwZd9Uxr9HHTDfW
	KwRXI8Xq1Xnr7nDD0TVtDmCQLFeb04rNMSgc4ZAwJ8OoalbIu330DN5gPgPmsbZa
	RSKO85OmfXjzkldAeL90tkekubBWeWcWRwQv6CEt6YLnpTotwTGNzIuU+MUT/vYP
	8eyF/eliV3HLq6qYlVZMJ2ptEHT30V8N/QOm0w4exF9mDw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvg8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 21:17:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59ece6adf0cso3168973e0c.3
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867020; x=1781471820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7j6fWH2ZTuBoYf3DikwUXDFcrJUfkjfuq65I6UYILE=;
        b=fX5Zc6r/Oh1mwVQawEJISygcP40wRFIw3XowHuTduIdxR1AMfR0yoInw7HOtvWNAEt
         UfvcE6rSmD7XFbXJJSAShi35ilY1MMAD9W3NlpVf7MoeKi4KMFDJcL1K8UqEKZteuSKy
         dRVnZHzlQAlT8QyJ3LwZSLJYryj8GCnR6UJAU3gQFDlQEudID5RjLABibXQ+YDGoOgHe
         9NDKccf42CBDSMDnD9cFbYSFROkuqNXiu1anGzDSZhmH2yB/Qvl2DloRoPiWOBDA2UH9
         oLWe2nbDmjFKQq4g0oWmK7RWLfXj/eNU6aV9NgHioJC7hKW+k034O+WChYP4k9W+KnA9
         N9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867020; x=1781471820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7j6fWH2ZTuBoYf3DikwUXDFcrJUfkjfuq65I6UYILE=;
        b=FL/GlHuebhJAqQqvxibPrBZazuVrTGMYjQ6pbLxZgaV+lGm9UcPr1ztaagdliXTy/y
         5K4dJFrmqqk37teq3hkF+1jSKJ0mPPAadZ3/DR/ZUhXbWynT67C5M76Pn9903tcZxBze
         kt/Sx8qVDsnq8lmIaZAsQ4iNyDFYbhi1fuJzFvb+S0R822WgG2meDiStbsN5IxspNNR0
         8uXA6E+3Gsm2/f85194ub/6GXvSZmQxG2gd3P2CXtGu0OZkEzqRghdPyDQeIN0oMfg15
         0z82nV2Z4K7+jTjdJqulFbCsL0Y9tj2CFnJ1HMMZF6SmJNDD8jbweQhPLm6Vn8S+5WSu
         EpaA==
X-Forwarded-Encrypted: i=1; AFNElJ9M/zkhwU7diK3TY90k/UGVj56TXxosXLwed1HawFmYD71KKBFRechn2yHglE9ytSN+UvBOsic/R4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWldX7F7Rfdit2CeKd8EIeg/5MKXsjvRPMpVg/yo+tzRyCiAC
	BpNxMf/PiAgX30HnsVpVATC+6928U1PpMw5ZZduSSawOZi7IMZkDzeMfspYh4yGL+4cSNo0dOw9
	p8sYA7zDf/m58Zc6l4+hLClFPNFJ93RHdovsL/tgAM9pkLSpthMAaliu6b1O4W8g=
X-Gm-Gg: Acq92OEIAJXBTLLQ719ewfPcmlGPK3x/n8+LRt4L7xNKWD+djvCFJn27NuwcT838lWR
	XhxHfVriY47mdfw9IOhTseS0HZaz+YeqRranGCbIXed0Bi+zZp7RDYzwZCeiBuy+kFttWe/2ziH
	q/Ezq4MEs624E8qX9qEy9hn7WqsrIqbFEhaLWB7MuFJW8UcRce17FvTnx8rTwxtFCgtLIMSzcuo
	dxBFzgKAyv2Kq3yvAeZSll9EAgK1fkrX6KziYf4c5cTra6j+Gzdz50CMvCuO5rV96JGbwgCeGlE
	eERf5KrYS+uZno9GhQ26Ml5GPix8AxyW8XyW4wm8u0g9L1k1C2zr1EdIkS/833uBNGEadcnQtfr
	Zv8mmDe5lUPc3L5Qr/iVLzQMO4yH+0oR6CWitTY7ju1xNNEc/7EOg5gBWBX8Opg4o2qCgJ5Jfrz
	6rH31oyM/bZi22TooyandEzIathkg48dv7WWYM/erJ5kM4TQ==
X-Received: by 2002:a05:6102:4191:b0:634:a573:c097 with SMTP id ada2fe7eead31-6fef36392d5mr4964748137.13.1780867020067;
        Sun, 07 Jun 2026 14:17:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4191:b0:634:a573:c097 with SMTP id ada2fe7eead31-6fef36392d5mr4964739137.13.1780867019635;
        Sun, 07 Jun 2026 14:16:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9040fesm3273761e87.31.2026.06.07.14.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:16:58 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:16:56 +0300
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
Subject: Re: [PATCH 13/15] accel/qda: Add DSP process creation and release
Message-ID: <5gz4m3mfsnlwmyfiqtl34rgt7krgo546l6kslux2ibyinep3td@zs7xjxrk557o>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-13-b2d984c297f8@oss.qualcomm.com>
 <w44qzw2ryg7bpbte3hegopmtkfjd2gby532rdjarm4i3tylpv2@2rmruincfdgc>
 <568987b0-6f54-4b51-b1c0-416435e3f564@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568987b0-6f54-4b51-b1c0-416435e3f564@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25dfcd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=DtFIhfJECZ_mmoY6xYkA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: fh4H2k_Du7kV0yUoD1yg4qWnPJWBvp6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNCBTYWx0ZWRfX56lwx3KLcNJp
 ii09wH5EHNur9YOqMIf+i8Ox8j7aNf0uXNb8iSsL5tG/8a/6VHA62eztwWhoIDCDGjDcvJhKycc
 heSWHmfTAnQVh5773nNQcc0jnPfPF+7/OLFVpvvPqpxNO4fsfAjRHrtJPP8tBWtUjDBztWZOXvi
 4EPqY23JeuVzSw7FVBJ7NIVzbgr1PsccGQABNxOE9twiQsLBuG26OC9mccMYTzP++QIUIJcNSey
 CwVJKgTBPeGNF9SBrxMYKZVspIeGJHyiNyF/hOWeoQ+8asri1E286euenG+wkNtnpdp8BJQLMTN
 qt3DylfeLmwUtH4Zz7CGK5TaqRpeNwIszbFZKAMNLuIEUyZKhuwl5/zCviYdc5qD9kEJrcI1uSl
 D4CoGK+KgYSHMd4oa06yRSfRnHZSPiTKFKtI6tgUq5QBsOMjaghUJOCdZKvLY28hQcX/n2kzwlQ
 D7UNk9YjGpJwSPZbNIg==
X-Proofpoint-ORIG-GUID: fh4H2k_Du7kV0yUoD1yg4qWnPJWBvp6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070214

On Thu, Jun 04, 2026 at 10:47:13AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:30, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:46:03AM +0530, Ekansh Gupta via B4 Relay wrote:
> >>  
> >> +/**
> >> + * qda_ioctl_init_create() - Create a DSP process
> >> + * @dev: DRM device structure
> >> + * @data: User-space data (struct drm_qda_init_create)
> >> + * @file_priv: DRM file private data
> >> + *
> >> + * Return: 0 on success, negative error code on failure
> >> + */
> >> +int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
> >> +{
> >> +	return fastrpc_invoke(FASTRPC_RMID_INIT_CREATE, dev, data, file_priv);
> > 
> > Where is INIT_CREATE_ATTR, which you described earlier?
> INIT_CREATE_ATTR is used while `sc` creation so the DSP considers the
> request is coming with some attributes, the ioctl functions are going to
> be the same in both the cases, so keeping it unchanged and the decision
> is taken while `sc` is getting created.>

Ack, I missed it earlier.


-- 
With best wishes
Dmitry
