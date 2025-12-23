Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736422F5474
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521156; cv=none; b=PXV9rM/8dRglpkBHkJInJ7i+bpzvT/NFzrnR05raCasJOAIrBxjiZBkZj4xu5aN5wgsLNcrzuZObJL7mUJczgdmq8Gu+RtvZSwFmgsOr8nZ6k0VYQbDh3kbNshNLGZTqpJD2pFeEGRFr+vRAbTp4OqGadr5DUQC899Da2CeW3Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521156; c=relaxed/simple;
	bh=0tWvGm9a/jJwLlMlmlo5I6A85J1pOmw7R9y5zokAghY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MI65Ob1HWa0uSxXN9ZCwd0eECGig19oZyq15luaNnMOfCAKpMTubBR+LYmpVL99olXHPvgAKsDPOuwAfGIUZDMcSoZyNt2UuiVmMiR+prZxcYAbz8w8jvyiRTFrIz1M+16ePlFBswxxsaR6gf/7F4yb+nSoc0n/iAAYJoCrQkFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH5U6aDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JU/ZGDj2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH5U6aDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JU/ZGDj2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNErvsV461408
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 20:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eIgzKOf9/0LdVfjpPX0seudW8Xpb3rqme7DrzIMe3ms=; b=dH5U6aDMsZUMFJ7Y
	qTgFwf9h3csRxhhw0gXpwmAjdJhZOCf27ShFfc2P28W812LAbuBmbGiVoKJM9uzO
	F3gYfBu4VyGTVaPDnL5wSDVaykMf/B/Gr4DLheaJBxY6/rBBi9wfUoDIVdGaEF71
	sha/R7ba1Opoy3THpTiQL7X3rWZbqlu4BdnxLvUNvRMQwTcR7FEPBs3aNhd5deiq
	Xs1CFp71PaNj/Jk8SMPyJpQlsBVa7AkxhFE0s88RyLcgMt6KZ6naah9lVe8joA+5
	VXbydWjBIZ+WxMbUz30a1Lup7PW4eqb8cYGoA0DilKn87m0/aTDS7u1c/dPrZHw0
	F4+SRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fs0q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 20:19:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaf9e48ecso139341531cf.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 12:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766521154; x=1767125954; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIgzKOf9/0LdVfjpPX0seudW8Xpb3rqme7DrzIMe3ms=;
        b=JU/ZGDj22W2A7upikw3f3lVo/6CKIvE7j0/LzPzhJAJ1Uqwn85/IXIQrxnw9ob0R+g
         KLhz4QsBfl9OVOaX5t8Fm9d1ZxVpi3hK5a/QEl2nK3Pk9hjGOQKgb45hEac225UbsUjT
         vVb1xI1s1V1qbgiIeoOXoodushAJvZqVLXo+Opoc/OL3pXmxCg3gURMqUk93I2zYOspa
         1Za6aXxpCT8BS23xYxHyQFmKvs6sc6GkWBM2BLpyfsOZDPuCsbVhxeSxnEsmnF4NGRsT
         z8pWAU5BsqF7m3ka9k/NZt//bUBcVIq2+saAzbNOGvVrzmo2LW2KtQlHDS6dnPZNk0T9
         tr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521154; x=1767125954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIgzKOf9/0LdVfjpPX0seudW8Xpb3rqme7DrzIMe3ms=;
        b=ZXRGX280o52uVmfWOf2UrJsexmvIMANCkLekhdelmFJz9hII/ATsy3L5hzWPMz00nd
         fq5kwTB4UgkbDLmf+TtVmSeDFZDCvRjSUTioeP7JbHpnAcs6agOYq3IyoJ+smVkDOaR1
         tLVGITQd1UbSa8+ZcYKmoF2N0lNS13gfYk74kEej2uA7PBtlokAQQQRxEtfOIePFnRME
         173HgObqpNgpimdofObrZRU2bjQ8xWHm9QcSsTY8f2u+LhJsLuHp/x1duqACbO+eYmiu
         +gzBpATfo809cv7Qv3RfkMyhUlhANWpEg29uMGwSRhCSbjvzemfkP3Clgyru5MgutDVV
         cfuw==
X-Forwarded-Encrypted: i=1; AJvYcCWb+GqjbHtHn6rJ9ryMwN5d6Kg9SNdQked7//4+nSTWXg5RmIQpx3Sf+7VL6sZ3eLeJZl2WpiNeDz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY8Ke31D0l4kGdNeNd4L20+co3l73jAcgtZYpwMskKst9n+F+R
	G0Gkt9IrtgQBlt0xwWFgavjwJ/YQOHLQEb/yYTA2ubXn1pYGom4nU+q00ARkneHzdd1TtZfd96v
	pH3yE1vsLNzqwA4CMK3qSGYoH6c1ysySYlGMjiMfl6vRTxqmYMDdLlfiqY5FbIic=
X-Gm-Gg: AY/fxX5G1clqM9haVlQlF395YgMmA6I7D5F4THV+5+4y5cv8X6KxqH+0uPKDYM8kAH+
	Ohl7vNdq+0B5Xn2np91lvUBNXm5tNenBASwEkpJCuO0CAj5rVo5eScYe2PC2RG5oM1hc9A6RQb5
	ZL2oZghycw0MJwmwThp/00+dYxqP1thdQIXYC+oOzg3oHVVbIwjE31etmNBVDOgu8NF/jOD63YG
	UguMadoszDCtwxGNZegDoL0TaQxySfVOMx/YDQ/mYJm/YDos/9QxK9X/zrIiIkUXGxba7yVK49C
	xjJwTAmtLHKCWCQp+bagHADqJKFXsPHQERVtW05zZPFBi42I5+wX4yUJsSn0UwsC4fyDoJYvKDK
	lepxCM2KJ6NRqdClT8M6NNqdrg5Mw6BgeMbQha/mHZ4wmop+1+bkwkzgLKfX3BaJg3DUK3ueW6e
	Sti0f1CQ94Wu8IaH5PEUbJGQ8=
X-Received: by 2002:a05:622a:1e92:b0:4f3:5827:c96d with SMTP id d75a77b69052e-4f4abd6e4a0mr276312751cf.46.1766521153631;
        Tue, 23 Dec 2025 12:19:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcl9RSqnJs3QefI8fsp6BPzb0Y6m4txRl4jtUVNbizXURzVQP0QvckbZBcTYqh2ij8RcCSQQ==
X-Received: by 2002:a05:622a:1e92:b0:4f3:5827:c96d with SMTP id d75a77b69052e-4f4abd6e4a0mr276312351cf.46.1766521153052;
        Tue, 23 Dec 2025 12:19:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d12sm4389325e87.59.2025.12.23.12.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:19:11 -0800 (PST)
Date: Tue, 23 Dec 2025 22:19:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 03/11] dmaengine: qcom: bam_dma: implement support for
 BAM locking
Message-ID: <c2ctqk7z6n5mmrr2namz4psmpcohefyv6qu6gkycqykzgdpz2u@2qwils6lwwz4>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-3-9a5f72b89722@linaro.org>
 <aUFX14nz8cQj8EIb@vaman>
 <CAMRc=MetbSuaU9VpK7CTio4kt-1pkwEFecARv7ROWDH_yq63OQ@mail.gmail.com>
 <aUF2gj_0svpygHmD@vaman>
 <CAMRc=McO-Fbb=O3VjFk5C14CD6oVA4UmLroN4_ddCVxtfxr03A@mail.gmail.com>
 <aUpyrIvu_kG7DtQm@vaman>
 <CAMRc=Md6ucK-TAmtvWMmUGX1KuVE9Wj_z4i7_-Gc7YXP=Omtcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md6ucK-TAmtvWMmUGX1KuVE9Wj_z4i7_-Gc7YXP=Omtcw@mail.gmail.com>
X-Proofpoint-GUID: 36pyhPuBbvRJ3R_Y7ksOtQF2ma2sOnI5
X-Proofpoint-ORIG-GUID: 36pyhPuBbvRJ3R_Y7ksOtQF2ma2sOnI5
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694af942 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=5bpPOZmaz2kBxcsnHiUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2OSBTYWx0ZWRfX28ghH4Nj0r3j
 84J0MqWMI3hkSAYvI/KJ4XYyxy/FO2lnFf2BY9iPnTGDUl+KJs8YuHce8U1rdI3GlSuVHc90opr
 xr0wrhxxzxVwLM9wBFVFa5CnFZkx2VGJXudDBQ6oWWScaXEVYOsHOw7H+p+1QZt1xV8vtY7iD3r
 WltQCRi+XjBzDaVoeqDb/8Eps0Q2iImvTgheduA3XL7ULQ9XgRuxibI+tl/8zH9uOYVWnCAR4GY
 GERNWq7nylmPFdhqpAntNy8EyGWVaXV/v+RFJg6dYSdgVIZQ0aAv5d2zPLgy0ZYTQPZt2XMy9x0
 HBPWKPhpT+2rlvswYYDpHTB0o9EFB67yWsUYQLUXvZVGMhHjjwpP3/oRl6dypAL+Ufzau7Ytpci
 gtq4zukEE9K5qT2ku97BVnmmnm4uaRPBPI/xCqP5Yat9ouwgI4fi3Ka3ppjzrJ7MjeaBvk+J3ic
 bw+Trg8xfyYuceYQV5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230169

On Tue, Dec 23, 2025 at 01:35:30PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 23, 2025 at 11:45 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 17-12-25, 15:31, Bartosz Golaszewski wrote:
> > > On Tue, Dec 16, 2025 at 4:11 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > > >
> > > > I am trying to understand what the flag refers to and why do you need
> > > > this.. What is the problem that lock tries to solve
> > > >
> > >
> > > In the DRM use-case the TA will use the QCE simultaneously with linux.
> >
> > TA..?
> 
> Trusted Application, the one to which we offload the decryption of the
> stream. That's not really relevant though.
> 
> >
> > > It will perform register I/O with DMA using the BAM locking mechanism
> > > for synchronization. Currently linux doesn't use BAM locking and is
> > > using CPU for register I/O so trying to access locked registers will
> > > result in external abort. I'm trying to make the QCE driver use DMA
> > > for register I/O AND use BAM locking. To that end: we need to pass
> > > information about wanting the command descriptor to contain the
> > > LOCK/UNLOCK flag (this is what we set here in the hardware descriptor)
> > > from the QCE driver to the BAM driver. I initially used a global flag.
> > > Dmitry said it's too Qualcomm-specific and to use metadata instead.
> > > This is what I did in this version.
> >
> > Okay, how will client figure out should it set the lock or not? What are
> > the conditions where the lock is set or not set by client..?
> >
> 
> I'm not sure what you refer to as "client". The user of the BAM engine
> - the crypto driver? If so - we convert it to always lock/unlock
> assuming the TA *may* use it and it's better to be safe. Other users
> are not affected.

Just to confirm, we support QCE since IPQ4019 and MSM8996. Is lock
semantics supported on those platforms?

-- 
With best wishes
Dmitry
