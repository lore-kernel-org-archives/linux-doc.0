Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28C337754D
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 04:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772598135; cv=none; b=pjtMliGd4Kn7shaWPG0azGcQGFrvz8L8SihEAGBNqk0wxShAamY86jGDJbV0fodEUW6AqFPD7+G5yKzxRcS0gaPK91/YIHZf1HXDSZhJvJubrl8oCXMTKKm50EEYijoEtQ0H6Uu61uOKzeUAA+nWKmIFtfhSz7kB+06uqdnZw2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772598135; c=relaxed/simple;
	bh=vfZ4Fm1illYeYZxI8bJ8e1HWahncA/1F2Qj57ZqkvyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMjPqYC39dO28I9XtdwO/kptnDiFFeODZJZ6PLGsi/BOzCSeHhhGQH9rxjxJ5XMfNA7V7YctURv1Z3TXTzJ8KDh9bi9sPxibvWmhZeTAGr3Hn9lyg1XoVq//KVIvTLz0Rsxls0lyDM08UhpW+pIEzXOluatkuWZ+eTvbNBZF+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/Z5n66U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVwFXDr2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/Z5n66U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVwFXDr2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244IcL11274552
	for <linux-doc@vger.kernel.org>; Wed, 4 Mar 2026 04:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tlbeDGjUP0JSGoux2wklhzIf
	NMznEwVoyK8emBv6LqI=; b=c/Z5n66UUeyIGhW6V3AS80qPffCne7OeN24B8uqj
	dnBn9Vc/Kq1CVFKJFUDn9HSKvsrJUA+EOnZV179NYpUMjZECKSE8wvJzsJKVB7XH
	K4EPD3iBaCNSxGR9t/QtdYgR7U/L9GtcpsonFi0FGsWk9PYuirNMLIQXIM5Y2gv4
	PKJjYeF58AYRdVqSOSu5nbb2syGAGqCyLhceytWPICAby7BPXIN4ujlNNd994q4k
	4Iai0zouxtO767KHYoRxXctKM1sAoOyoKg8n7filX7iHVT3tKkCRTGFX72Eva6ka
	m5n++swUkhl0cSLxAYG6RIDoiNNZmkJ2PYJvof08wJHT9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu3tge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 04:22:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4b8e9112so545562785a.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 20:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772598132; x=1773202932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlbeDGjUP0JSGoux2wklhzIfNMznEwVoyK8emBv6LqI=;
        b=iVwFXDr28B+dHTgHu6ymmd1jkyis9H/i0a/+MV2C53gZGLKDhs72hcdTbFS2RACpXF
         UV3TnnfhAxQlYSA0usQu6Xc1oXA2M1rY5pmnBi44U2XZoFCzAoINhCJQD9ltvuVgInC+
         hVnvUZ0uhFzGfN+VTIoYc21HOHUIdf5oqbrkBGJUSmqz9ch2b4PR2Zfa40Jqovrao6aS
         9W0sOPns8Xd02gXUUwDSbRRViCzuyy3z04YYlm1cZuLGxXp2/LCYnsLuK5yaLW2l+FAs
         c6tgqal9ycCrn3ieBN2apsqO/PCSvU91P8H9SDHKYRqc/c58C+x7SqlJ1M+Hiv9kPPRX
         XsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772598132; x=1773202932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlbeDGjUP0JSGoux2wklhzIfNMznEwVoyK8emBv6LqI=;
        b=CLdJ7/+bXcrqYz9360u6s5yNWCSEWRZ+KRoqFQZWrgHopmhyQMlDclteMBvMM1lJCD
         knqbpaFta4PR040BgYfg51+UrrDxsevRRU8i8SI38AIizqh8QMOqtww6IWrh8sLdfXFS
         Og7G4UAytWi+/eqci+OpbjnSCZuvbx5lWiZspZvqi4aAoYZdv8ra8qK1p5wKHSJ7EGV/
         PlmdcrwMXnOiwUpBGZGrvpchJLMYWOrn7kjd8tmBhEGcSfXiHWPqtnF+yC3BVhR2DCS6
         GDrJQABZjZj4YV/CagZdp1jAypWAzG9F4Kdi6lI2ndeClCQOI+LcdHM9mLGB+gV/M4Z6
         5kzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXEqfokKniXdZ0dvjgbWZJVQ1VbNr/SlC1/7n3ReGZSfGSlcOfD/TZSehJmHvEdunGzkA02723q4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3aNpFSsjkfcTOwv+tvaTvm3Yo/z5hzt+7/lQXWPGLDUTDvUP
	fUEhA0wknleHcAxImgLspgIjWjIw//QzTKB4U6byuLODPnMPJ9Mm5JjZ1Xh1Em5tbtiI/vO/GGJ
	azVAm24pum9ylhgQAqgbDO6GwmU8Ra1taYVs2O5admh397tYnnaYAiY+qLPZqC/Q=
X-Gm-Gg: ATEYQzx2vndvd64AdZyQcW0N4to8K1cza4bChvhrS7adLSRxPpW8tVfKtwdu7RlWdLM
	jTDRmZbVQ/YoZLtAsOyQaHYuWz4gRE0ouQmQw+FGLnlbPRa8RRAZj76eNbLcw0UgXqpzUduvdFn
	9Q3V797m23/uv1VxOz7fbxAhjt/RtH2Unl6ZFAdcs9tF2UD0m9UfOg38mk/7u3qCcFLLDV8fS2N
	ytuZL4u8QP39UCVCDA5EqpTU+7VmTS45ee9+CY6fhnzVtQfLvgiuttXzKgKW0HBIagXYXaYba2I
	T6bKa9iUdMT90+ZkA5kg01IUNQOa98pTtjUNLe1+De33ED3vUoka84Av7xw+wo4zonnro1II8vr
	CqjpKUJgC5L3LFu2BB987+a0XcD4zvcYJOXIhC9kViEd8KoRYkFEPOMOlDalYkuJo4TkXO4onKG
	Y1Flsgj+XuWo3PIzHBe5EoaTs4bMa56a+rpNY=
X-Received: by 2002:a05:620a:4609:b0:8c9:fc46:235c with SMTP id af79cd13be357-8cd5afc1082mr91775485a.71.1772598132171;
        Tue, 03 Mar 2026 20:22:12 -0800 (PST)
X-Received: by 2002:a05:620a:4609:b0:8c9:fc46:235c with SMTP id af79cd13be357-8cd5afc1082mr91772185a.71.1772598131614;
        Tue, 03 Mar 2026 20:22:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6e4c0csm227636e87.2.2026.03.03.20.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:22:10 -0800 (PST)
Date: Wed, 4 Mar 2026 06:22:08 +0200
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
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
Message-ID: <wubjsfz2ijtqvwwqc6y2bawinpdwvvke6vh4owytcxjdmbfjji@ybmz23zic5dn>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
 <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
 <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a7b374 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LbhuFg2odiTRP-zraWgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6HMUYRU7JPAVVNo91jN9m96B3k4KhpYs
X-Proofpoint-ORIG-GUID: 6HMUYRU7JPAVVNo91jN9m96B3k4KhpYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzMyBTYWx0ZWRfXx5CsjQHH+yug
 TwBT+qypRr+EB5jw1lbqisGvrHxsr8Gsy0N6mEj/zO9fiH3tKu8K1pxEJ5eS3znejoqFDpJXq0x
 4pqVPDGojWmjeFWObKsr99ig4AKnjPknalhfGjV2asrqMMeL4k35YfnD1/FmSBZ8dZ10oyGXHzz
 rDELMU9wfWX6vxOFlBcinaGWsXWgkkb3ZDITA5Qar1xfcybWsYRjZjEHusDo7yZQnYi1OH727ZF
 SNFzoRNMloJnDenF69yoiDb2AVQXRIMUxw+z4Y+UHl1uAG2LsgkEg3Ub10lAFpUfQQxPnHkOzqA
 JRcdjrxHBMjGZJoJHcdsgpPRWGThcXOSuS2ZAm3+tSKvggx82i7RwgleMLB3HChrAad3L7nJxLA
 pdIfckB2hN2kQ/NsF5bLvXx1mlvKgfem4vijqGKUcyO2rCx60dzDZLkqVjlKroMtvoN9Eetci2D
 UZHJ/XwkFJRW2n8/fNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040033

On Mon, Mar 02, 2026 at 01:45:09PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 4:20 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
> >> Introduce a per-device memory manager for the QDA driver that tracks
> >> IOMMU-capable compute context-bank (CB) devices. Each CB device is
> >> represented by a qda_iommu_device and registered with a central
> >> qda_memory_manager instance owned by qda_dev.
> >>
> >> The memory manager maintains an xarray of devices and assigns a
> >> unique ID to each CB. It also provides basic lifetime management
> > Sounds like IDR.
> I was planning to stick with xarray accross QDA as IDR gives checkpatch warnings.

Ack.

> >
> >> and a workqueue for deferred device removal. qda_cb_setup_device()
> > What is deferred device removal? Why do you need it?
> This is not needed, I was trying some experiment in my initial design(CB aggregation),
> but it's not needed now, I'll remove this.

Ack

> >
> >> now allocates a qda_iommu_device for each CB and registers it with
> >> the memory manager after DMA configuration succeeds.
> >>
> >> qda_init_device() is extended to allocate and initialize the memory
> >> manager, while qda_deinit_device() will tear it down in later
> >> patches. This prepares the QDA driver for fine-grained memory and
> >> IOMMU domain management tied to individual CB devices.
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile             |   1 +
> >>  drivers/accel/qda/qda_cb.c             |  32 +++++++
> >>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
> >>  drivers/accel/qda/qda_drv.h            |   3 +
> >>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
> >>  6 files changed, 335 insertions(+)
> >>
> 

-- 
With best wishes
Dmitry
