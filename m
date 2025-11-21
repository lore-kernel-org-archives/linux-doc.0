Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3D2DCF41
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 16:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743002; cv=none; b=Gq8mihsYSIFnk3BcV0YiybP/cKytIOP5Fxh91QvwsEvjTl91E5sUv5hZZ8e7jrVahDVen4DewCqR8PDMvkZvn5qZdJy2dV9tRKx76JX3G6Udes9ECTjLkQ9r3kkyXa/XUvs9rjE638ZUr8SCtm5ZbhsGunYL4NKVRWclyaLHdkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743002; c=relaxed/simple;
	bh=xNQBqnvu+0MUnNk6sF3xOnsFzNEOi9Wsx1a4dtAR39k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UP2m/++vgd+6njrHdmZX68oQvStysI0lrbhqf26zwAnxaKWW5D7W0gwwAk+Cq6PTzhq//EaRaBYdzkpF6Svw8YmDEJaBUEPC6AdTOx5Ycv1zhsOS/iB213nbOWji+4YwnroXnFj9JAd9/1J4ruBdE23exDa0CTWGTPBOydqduwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/zNhRLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9HtnvMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/zNhRLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9HtnvMQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALC062u2840650
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 16:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JD4jFhWXyLLDBpYCZCxZUQgr/T0XXsd5FRIjJIAawbQ=; b=n/zNhRLPmbviiAKA
	Ut6EJ6KN88rpdNKYf8NDeLiTWO8gwLq1ZLTAPROppwGrHIIZwMtT4qA68XZH5C7c
	i+nsDKIslGDKrGPD+xQj7RpCh2VrLDvKfyJMMfVuHlEMygSKvVNGT6adwr3L3SZb
	mKA4wf4S/siLVmUQqvS+7qlSpH6PkOOOqzEr6rddcBC57QHrRNoW0A/KyN99hD3C
	jlZDEXqkgrOq2kp+Vv5WKgGGz9ih6Cj+L3aDRtwGApnYP0Ajgt6/U3VHIS2W/78G
	SZPCAdM+G7kQzz7PCA/cZefc7mq8HiBCmP1ssLXHaRxfNBS58ZBWUjSyJFD2MDtM
	oivwtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvj7y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 16:36:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e9b2608dso230125385a.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 08:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763742998; x=1764347798; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JD4jFhWXyLLDBpYCZCxZUQgr/T0XXsd5FRIjJIAawbQ=;
        b=K9HtnvMQsYjF413YYLYrF75K0WyMJB3VRfK7v/JJXlK4ubd+K9ECzV+YdGamze4onF
         hm9v9OFexapGJNAqRFJuXoYnkJ8q4S1DHW1iO7VTcnda8jC+RJMR/zmJanLSZtza7mUF
         5PFVtgb/BjaNJUCYxypddmx5FJI8XrRi27Rd2KVlmNE+8rtDlUH+ssH2N5TzGPWoVqg3
         yv7rR2VBiFjsG3usMKy+atKMs6dwjrEyPXWGcK6RaT6IRLKa3QdOabakPnFbnbPjCOaH
         J+W0ZEebK5xrtEP/NvNe7X68qfCNHurK71gPh7Tc2aRRHn9hKdNcI4e6vv3MIhqJqPqp
         3rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763742998; x=1764347798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JD4jFhWXyLLDBpYCZCxZUQgr/T0XXsd5FRIjJIAawbQ=;
        b=An7N/WXH+sThPWSQ6owDKvANPqFrrfiXBtu4I8kpWcYRf6dgo1C3fDPWXlcN2kykYS
         XZVRLTSxKLjPyaYCxI2QIVYcwtTJP+C+qaUmm0LpBzKtb1byZD2qRr1sQDn7FvfVJ7wx
         qOYsUzRlrHWflf+vf64MNVkO83vvsq//lHnNZLvOyIoMr3nAWwDHqNAHhXXN5JM6VoV5
         MdsL20BwCLaVAA+QSOpv3cP4mS4xNcW1H2I+0ek1ZLsPSuNmAJiFAsXYlVDQzKmSxvGg
         xh6Ha9wOiPGHbDx+mq8kTny/THcaSLqaYuij91EnM2f3M9gR6GwwyrbViBgPV16F27KC
         x58g==
X-Forwarded-Encrypted: i=1; AJvYcCVC98Oy2fUEU1T6ollzKnLbirqH20oMS3EBAwc+24Y/kme7t3/lZnTnIOn2cL1m9es6Sfq7cpsxcps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBASy12UjLWHCBZ3A7o5o+0Z1Jl/0cfvbcFmoR21hilf3dElJf
	BNJAF82fpl3gkQEii4lkZ6UnjxeocJGaXnVIj6ttSOjVKuVDt6ENpcMZYkX7sjCG756RAHz81pb
	s2sGqiy7xmwxsJCv9IShatDwV7eI4zHMWs4foI0YUzghmG4QOqdwKS6QSaxkV0WLun7elC8Q=
X-Gm-Gg: ASbGncvY4oGY9O8PRd/1+Fig/JzEiBqFTFSoXWEVwQVRxYA3BpH4OvrZHEGr7CrCeTW
	X8WBb1v4CCEqEqMAVss1jBo/62BikzbdPNQKLLqorwVBTcPzujwTpgbpBqNdAErhSivnZNRj3kO
	qb1VB1kWFANv45eRHxqqqNRiBLRpKMC+kb379h4jx/wtrwEAZyg54HBBCZM2qWjwy7lyDvgFlw6
	gLW9rCgo5xb2S9hEC89YnS56O4TrcoK9TQWE5oLGzLEesTNTEe76qbU0j8OTlCkdK+m44hCRSOb
	CUU6Mnab8BHh+qRjd9nlS3g1bqixv4wVXXxgA1t4VQKWxqhwpx96tInH/fGtk5U7ASTexdyD/4c
	sX/GQVb1A1pI/QyBWhq/Mz6NzqboBD0cllzvMA4MklK9CBObMYgH/wikZajcv5AE9zx5+7A960a
	mFIMlQzKjuZqdG6KMEH5kJG+4=
X-Received: by 2002:a05:620a:4105:b0:8b2:f182:6941 with SMTP id af79cd13be357-8b33d4b4eb3mr319636685a.57.1763742998041;
        Fri, 21 Nov 2025 08:36:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV9VMUaLUgGpRR8Et8FctlBaNa652I931Y33f0xIG58Plx+ufRw2glHwAYqSnaXE5Azeu/cw==
X-Received: by 2002:a05:620a:4105:b0:8b2:f182:6941 with SMTP id af79cd13be357-8b33d4b4eb3mr319628985a.57.1763742997449;
        Fri, 21 Nov 2025 08:36:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5e07sm1733223e87.83.2025.11.21.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:36:36 -0800 (PST)
Date: Fri, 21 Nov 2025 18:36:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v8 01/11] dmaengine: Add DMA_PREP_LOCK/DMA_PREP_UNLOCK
 flags
Message-ID: <whxi2ikode53vrxqpanryw74zd7oovfielgdvhpkka5zy76g75@dxreidnb77y5>
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
 <20251106-qcom-qce-cmd-descr-v8-1-ecddca23ca26@linaro.org>
 <xozu7tlourkzuclx7brdgzzwomulrbznmejx5d4lr6dksasctd@zngg5ptmedej>
 <CAMRc=MdC7haZ9fkCNGKoGb-8R5iB0P2UA5+Fap8Svjq-WdE-=w@mail.gmail.com>
 <m4puer7jzmicbjrz54yx3fsrlakz7nwkuhbyfedqwco2udcivp@ctlklvrk3ixg>
 <CAMRc=MfkVoRGFLSp6gy0aWe_3iA2G5v0U7yvgwLp5JFjmqkzsw@mail.gmail.com>
 <66nhvrt4krn7lvmsrqoc5quygh7ckc36fax3fgol2feymqfbdp@lqlfye47cs2p>
 <CAMRc=McYTdgoAR8AOz-n5JEroyndML1ZQvW=oxiheye3WQmvRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McYTdgoAR8AOz-n5JEroyndML1ZQvW=oxiheye3WQmvRw@mail.gmail.com>
X-Proofpoint-GUID: E_H3MesaN6tM5_xZVCC-Ik4rsPOOzuye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyMyBTYWx0ZWRfX8dmsycb9/y33
 VQVPO4DQENTdKYywWcW8BQ0URIOAGbD71cFviC7/rkU2Ht+sFn0RsFSSHm963Tf41Qk/ybfISkq
 TFg8pDjcxJLUBdc2PA1OjAMntury7ocJwkIJfxZ/T3d3uUCpIbSpsGgtf+FEDxWwFQJihu0f5BN
 CQfk7HoIOeBWO7aLNTtcYNrCNEn3ylljxvuAlN/7qSQwnqwbRGTqt818OJZz5BUREa3wJzHHI7Z
 SIWPUcp/DY7oE++GdUHFFt+trrccCfWzpz2D9wDHhawlpIIitGsfefnh9h7lduZZFs5lS4hamBY
 hejRaMcL+cnWIt5ydBMn4RY5CyMNRxDtWx+VHJ2P8xpa/Q57ZTfiZlnpKy+lwrwpKAmRyzDzioU
 d2KAyJTG9NAMKFi4pJMGk6G1f9gHYA==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69209517 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Vbl7byxoQ4W2vBc4-5QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: E_H3MesaN6tM5_xZVCC-Ik4rsPOOzuye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210123

On Fri, Nov 21, 2025 at 03:35:50PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 13, 2025 at 9:12 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Nov 13, 2025 at 04:52:56PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Nov 13, 2025 at 1:28 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Thu, Nov 13, 2025 at 11:02:11AM +0100, Bartosz Golaszewski wrote:
> > > > > On Tue, Nov 11, 2025 at 1:30 PM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > >
> > > > > > On Thu, Nov 06, 2025 at 12:33:57PM +0100, Bartosz Golaszewski wrote:
> > > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > > >
> > > > > > > Some DMA engines may be accessed from linux and the TrustZone
> > > > > > > simultaneously. In order to allow synchronization, add lock and unlock
> > > > > > > flags for the command descriptor that allow the caller to request the
> > > > > > > controller to be locked for the duration of the transaction in an
> > > > > > > implementation-dependent way.
> > > > > >
> > > > > > What is the expected behaviour if Linux "locks" the engine and then TZ
> > > > > > tries to use it before Linux has a chance to unlock it.
> > > > > >
> > > > >
> > > > > Are you asking about the actual behavior on Qualcomm platforms or are
> > > > > you hinting that we should describe the behavior of the TZ in the docs
> > > > > here? Ideally TZ would use the same synchronization mechanism and not
> > > > > get in linux' way. On Qualcomm the BAM, once "locked" will not fetch
> > > > > the next descriptors on pipes other than the current one until
> > > > > unlocked so effectively DMA will just not complete on other pipes.
> > > > > These flags here however are more general so I'm not sure if we should
> > > > > describe any implementation-specific details.
> > > > >
> > > > > We can say: "The DMA controller will be locked for the duration of the
> > > > > current transaction and other users of the controller/TrustZone will
> > > > > not see their transactions complete before it is unlocked"?
> > > >
> > > > So, basically, we are providing a way to stall TZ's DMA transactions?
> > > > Doesn't sound good enough to me.
> > >
> > > Can you elaborate because I'm not sure if you're opposed to the idea
> > > itself or the explanation is not good enough?
> >
> > I find it a bit strange that the NS-OS (Linux) can cause side-effects to
> > the TZ. Please correct me if I'm wrong, but I assumed that TZ should be
> > able to function even when LInux is misbehaving.
> >
> 
> Ok, so the consensus after talking to Qualcomm crypto engineers - and
> I understand this is Qualcomm-specific but it should apply to any
> similar use-cases - is this:
> 
> If the TZ uses BAM locking and it locks the BAM and linux tries to
> write to the registers protected by this lock, we'll get an external
> abort. Making linux use it too addresses that potential problem.
> 
> Linux could potentially lock and never unlock the BAM but TZ could
> also just reset it. Also: linux could as well turn the entire device
> off. :)
> 
> For the Qualcomm use-case this is not an issue - it's about making TZ
> and linux work together. I suppose the same would apply to any other
> users.

Ack, thank you.

> 
> If that could be contained within the crypto driver, there would be no
> issue. It's just that in order to pass this bit to the DMA controller,
> we need a generic flag. If you have better suggestions, please let me
> know.
> 
> The flag has to be passed to the BAM driver at the time of calling of
> dmaengine_prep_slave_sg() and attrs seems to be the only way with the
> current interface. Off the top of my head: we could extend struct
> scatterlist to allow passing some arbitrary driver data but that
> doesn't sound like a good approach.

Can we use DMA metadata in order to pass the lock / unlock flags
instead? I might be missing something, but the LOCK / UNLOCK ops defined
in this patchset seem to be too usecase-specific. Using metadata seems
to allow for this kind of driver-specific sidechannel.

-- 
With best wishes
Dmitry
