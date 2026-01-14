Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62223A1D14
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406701; cv=none; b=S2yJUuKN0OFfB1U2BV3PmqZddzQC5+qjqPN8K+KFFKmDH0nJ8ZlubfWdHKlOiS+YUfUaYGehtae6MKYDPuTqyrUPHpThNTHGPQMIHgXtU3OYt79xAny3iGuyiBevxS+hk8ESuHJg4rMzbM90ON6IvEl35F4S5I7gc6k6s1FduDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406701; c=relaxed/simple;
	bh=9H8wiyUnF4ylFKzCr5J4gfcYevv9VaRGGFZiwCFq/48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sz8OPzawuDsflhCxxBbcrutacdmUcnuUhWCB8nGv7gx9Z0nT0qzid5T1DTlyXx46oku7DqRAt54oB01aICNRom7Ss7OXZ8jOZY2BWm1ObuDgwj0xme0powx+afb/d83KBJcF9hd1BlR8Zo5I9eiNda94Cem1Q4M/08Xs90lCvy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvvyLSnt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyxXtpEu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvvyLSnt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyxXtpEu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDV1VP3550683
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+iaUhLfP280G9UZEsC2EmbnNHrNb/7z1dRVbvA0ugOA=; b=hvvyLSnt6H4DELQT
	0Rr6yKGo4pmwmJxgbgeWK41sEZa7zAG02d7bu9mLTzjjHRabPxb4DIw5+44KET7L
	TUXXGZ5LdM4MVTamDs84Qlk1gEuy0la4IaxtC/f7BRiGSfN7QvQ3UujqvzwvSPPk
	uT5SCGbOuyCJC28x7Trb1DmdSafN/5pfzWqiSHCqMgFxM241YaqaAxMfYbKSLP7D
	TcGi/s+Q63DzgGVAX5JI8vbQn+rq0t4BKLd5X9XyM6SNwEz81EvG7Ern4sSkmr0L
	Ek22DAKnXcgzmMqsm74/Yys6SD0iMJqS4O7P1TcPIZdwqdInlQ/AtWJtBHKEpIBn
	+zgXrg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jrhr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:04:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94128f1b13fso22708779241.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 08:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768406698; x=1769011498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+iaUhLfP280G9UZEsC2EmbnNHrNb/7z1dRVbvA0ugOA=;
        b=RyxXtpEuNO/NXgHFw2HMVQqxE1mgQPCCTRPHp0ZKXa+8s197veV+5UX8ApV9ekwCEo
         U4sez9FhmFOvk5HrAAcfW+NvBqnA75Sl7SxC3UHMyvyxvyhcCJy9XMCcy03g4YRWgmwP
         MEtwhQDhwG1NhDUS1EfUFirqZE9wASRjk4MaqpAOU+ERq6vAbUnkp7/T+Nnzy9LVHFl0
         qeqyYFCv95za3mSedwynqpySmku3+4QUWczkmO0EZ40le8ZvlXEw0JfnF1+f1teJV3XU
         NAQMEQRSIXqYiYqBs5lp+j7DTVMJC3G9qus+tvemQrI/hndYCg49qG+C0psa+ZA1Z2Kw
         fbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406698; x=1769011498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iaUhLfP280G9UZEsC2EmbnNHrNb/7z1dRVbvA0ugOA=;
        b=DyDmkyHUJIA9VZUXjkxfxfQMk1RSk6sCRigMiAbih436fMBE4xwnPTSDnochvU+zml
         ZF9Z2tqL9BCZJwn5vtYXZwSljnUTk5RNP5KwP9Web1hroJvyLWh/qKl32JnVxMN1jZEv
         LXD76ld/jjuv3eELXjAtEDRqQZHl1jTWFVjYD8jTJ+GADthDc67MEmR/z2UzeCP5iMV3
         0r5rnohV+SELxZrb4H53hvcoi4C74trTFJJOfZ6Kv8uqKI/oQP+tdvujOzG4PjuVsj4M
         KNs9v5i5qWZ87KsfNUGK6GCJkuprBtBgytsh2K6SdZRRK14MnWIeZNRJ6cAEo3icDFGh
         QmZw==
X-Forwarded-Encrypted: i=1; AJvYcCUmNcRGf5uOqDZnXqfH3xmC5ANN+p8ke8Cce5wrrtoCfsYXEpiQ+DsHuw3OWgRaLYVH05Geh4uYsWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe48wsGg1lyrBMbLCGccXWR+EKvuj/mMOWdQjy+KvDDfAq+JZq
	QcB2WoQ0N0EsQTIZG1hgc+F/QcquW28xg3eMdP4VPqV3zTrZTXRFsJb+mNYfxf9f+iCGYkNnpWk
	laXKown2bKGNxcQdCafKS51Dj1yku3VJinssKHKkVexP2OCqfR97vJ8AMwJU+Lig=
X-Gm-Gg: AY/fxX4TozQXPmWBMujLy+cBb58wcnS3uqRlo1hJPgZ6oi9/kHp9DOgSZm6aNALrLjO
	DGufZGu0TBonirXAFmWHcSa0J6YHs9kXpAQKxgiWi02qD6jQmxfg6ojgpdFaVMUvyQtam6UHwFv
	Ahpd2yGc9uh1iRai5Sq/H+Zf6E9qpReQQq/8EfUeGP861wp01M+XA0Dp+1kTrElJqrtfzPOqYOP
	8Cxtuc/S2SYyuygyub/FJsOznpDqM6AbRlwbRTvIc8gd6AwQD8x1TCgNr7dJ41sJShHQyvMegMW
	I1m/wlyrTc9bPRyvjSIgPPlSeC2e+H52eNwy+b3IejSiPZ64KRXErU8vbtPuNVOL2QTgiIcKios
	JJA4bsxLeIw82O+eXJXsTAqIdHlV619EGEcgI90FBmUgCntvqlDyi2Fm9cr8+fhfPr30yCYQ/FM
	tLCAdfdZk4k1rZhL3fkZlZisA=
X-Received: by 2002:a05:6102:5691:b0:534:cfe0:f861 with SMTP id ada2fe7eead31-5f17f4dcb94mr1446241137.18.1768406696328;
        Wed, 14 Jan 2026 08:04:56 -0800 (PST)
X-Received: by 2002:a05:6102:5691:b0:534:cfe0:f861 with SMTP id ada2fe7eead31-5f17f4dcb94mr1446067137.18.1768406694401;
        Wed, 14 Jan 2026 08:04:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7c708fsm53807741fa.21.2026.01.14.08.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:04:53 -0800 (PST)
Date: Wed, 14 Jan 2026 18:04:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <bwhczqghukhoy2ktedizkexwhzdmirrxcucoewrc5dfe7ebvjk@554mr7q2urmr>
References: <CAMRc=MetbSuaU9VpK7CTio4kt-1pkwEFecARv7ROWDH_yq63OQ@mail.gmail.com>
 <aUF2gj_0svpygHmD@vaman>
 <CAMRc=McO-Fbb=O3VjFk5C14CD6oVA4UmLroN4_ddCVxtfxr03A@mail.gmail.com>
 <aUpyrIvu_kG7DtQm@vaman>
 <CAMRc=Md6ucK-TAmtvWMmUGX1KuVE9Wj_z4i7_-Gc7YXP=Omtcw@mail.gmail.com>
 <aVZh3hb32r1oVcwG@vaman>
 <CAMRc=MePAVMZPju6rZsyQMir4CkQi+FEqbC++omQtVQC1rHBVg@mail.gmail.com>
 <aVf5WUe9cAXZHxPJ@vaman>
 <CAMRc=Mdaucen4=QACDAGMuwTR1L5224S0erfC0fA7yzVzMha_Q@mail.gmail.com>
 <aWBndOfbtweRr0uS@vaman>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWBndOfbtweRr0uS@vaman>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMyBTYWx0ZWRfX2k3zz6DdSoNS
 HDGMGdA5x7fhxamblJuO985flk4y3tZ8q3wijijlTU5rkO4kdvVUlbfPNWxHxbqJ34+M99osXhv
 pcDxa7TJK7ljVkEUuz9pOv+7r/o6XVDiW5wkGf0BvblxQB5NJmZ40iHaPAIcOV7RLh6fwbK5lWh
 BtpxyFdjI21noQehTONgTLRXJUDjI6PCqGNUKBmF7hVNm3Rq8J/GlTBuamQfUX23fbI1g03MHlT
 1rULt/6JyVuR6N+KgeThFcwFZqMyyHJMpo8pagv14Yb8py+hSp2SQtc2CatGfFZKJos9Ml/3kDE
 PjbY8VW8HwmvV+/JvNq5VyfXp/8+khR1YpxvZTuy6mv/UkeXI3R8S2GcayC7iQSS/dZSW4rNZYd
 qgOmEVmF0npHasd0mVK5rYBVbjz/xqKEF9wepg82Z3LHX2rpntBpovnVGdwzqZCgzBGJhlBuEVs
 NR1JAMSZDjOeubVxPxQ==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967beaa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=tFmwwPv8JJdzMd2mOjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Ky2Y_8P1Hc0vGtSubkqrawCYlEbkwM-o
X-Proofpoint-ORIG-GUID: Ky2Y_8P1Hc0vGtSubkqrawCYlEbkwM-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140133

On Fri, Jan 09, 2026 at 07:57:00AM +0530, Vinod Koul wrote:
> On 02-01-26, 18:14, Bartosz Golaszewski wrote:
> > On Fri, Jan 2, 2026 at 5:59 PM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 02-01-26, 10:26, Bartosz Golaszewski wrote:
> > > > On Thu, Jan 1, 2026 at 1:00 PM Vinod Koul <vkoul@kernel.org> wrote:
> > > > >
> > > > > > >
> > > > > > > > It will perform register I/O with DMA using the BAM locking mechanism
> > > > > > > > for synchronization. Currently linux doesn't use BAM locking and is
> > > > > > > > using CPU for register I/O so trying to access locked registers will
> > > > > > > > result in external abort. I'm trying to make the QCE driver use DMA
> > > > > > > > for register I/O AND use BAM locking. To that end: we need to pass
> > > > > > > > information about wanting the command descriptor to contain the
> > > > > > > > LOCK/UNLOCK flag (this is what we set here in the hardware descriptor)
> > > > > > > > from the QCE driver to the BAM driver. I initially used a global flag.
> > > > > > > > Dmitry said it's too Qualcomm-specific and to use metadata instead.
> > > > > > > > This is what I did in this version.
> > > > > > >
> > > > > > > Okay, how will client figure out should it set the lock or not? What are
> > > > > > > the conditions where the lock is set or not set by client..?
> > > > > > >
> > > > > >
> > > > > > I'm not sure what you refer to as "client". The user of the BAM engine
> > > > > > - the crypto driver? If so - we convert it to always lock/unlock
> > > > > > assuming the TA *may* use it and it's better to be safe. Other users
> > > > > > are not affected.
> > > > >
> > > > > Client are users of dmaengine. So how does the crypto driver figure out
> > > > > when to lock/unlock. Why not do this always...?
> > > > >
> > > >
> > > > It *does* do it always. We assume the TA may be doing it so the crypto
> > > > driver is converted to *always* perform register I/O with DMA *and* to
> > > > always lock the BAM for each transaction later in the series. This is
> > > > why Dmitry inquired whether all the HW with upstream support actually
> > > > supports the lock semantics.
> > >
> > > Okay then why do we need an API?
> > >
> > > Just lock it always and set the bits in the dma driver
> > >
> > 
> > We need an API because we send a locking descriptor, then a regular
> > descriptor (or descriptors) for the actual transaction(s) and then an
> > unlocking descriptor. It's a thing the user of the DMA engine needs to
> > decide on, not the DMA engine itself.
> 
> I think downstream sends lock descriptor always. What is the harm in
> doing that every time if we go down that path?
> Reg Dmitry question above, this is dma hw capability, how will client
> know if it has to lock on older rev of hardware or not...?

We can identify that on the calling side, but I doubt we'd need it: The
lock semantics was absent on APQ8064 / MSM8960 / IPQ8064 and it seems to
be present for all devices afterwards.

Frankly speaking, I think this is the best API we can get. It is
definitely much better than the original proposal.

> 
> > Also: only the crypto engine needs it for now, not all the other users
> > of the BAM engine.
> 
> But they might eventually right?

-- 
With best wishes
Dmitry
