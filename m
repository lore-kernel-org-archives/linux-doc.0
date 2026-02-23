Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F9F37BE64
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886511; cv=none; b=rrhPju5zseFTijCS7LsgDHFYwk+Az189Gbmlf1KhnUY0qTTt+QoJLp26KIRlE2xS7iC8x8Pr8fR3/VFBZ9xl7v3+BPBXEkIIk13tAxIpK2WD5b2dLkho/APV12KC8DXQteig3FcJgmb3PaC+XC6RtBlJXBEcgv1C+XmRMl+bvdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886511; c=relaxed/simple;
	bh=PDnJPTRLUiPMHSkXqn9tuBvAQ1ylJXUzFUE4GbH7Hqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R319xcOTGTW9mClkvouqyr671N1ITUt3S51vTD5sZGtGkZhe+GeqM1G97agV8k3GH839p8JhVK2h8yvmawYIykz06bWJq2n+ym2x/f+c/gcbSf9ubpuUTBFT7O96OFUPYXlcX7fdWt8Q0OGmFFR+cOaXFakjWNw6qzAc5I481eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqxJBeZr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7u8ZpNA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqxJBeZr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7u8ZpNA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGvfKp3478855
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AyHH7QcVrx7/d/Pc5HmpEFyc
	TB7iy4eLl8RPthi6BKQ=; b=UqxJBeZrdU/+HWoz57Jsz5OGQVVAWwhBjkkReBnM
	znYBmNaTaRZGpuZhz7FyFz+WMKoWazbntOR+ec/5k/EJVTBMqgTMcgo7rFv0h8Iw
	XdOhutI9faQnvYCkm6mP+1Kd6PUqlMPkM8s8XwwBmRVS4g5u5yQUOdKMmQtYMgzi
	ZFyxbQT2h5UlRY/O5RUWPPxnMKT7wj4bAzCzT5ovcR01y2uay4wfuENWyM56LLaB
	HewbVsGgnFFTIQHaCasjtePqb0Ad+WJthHI8w3QeISWAww3VujFiKji1G4ot6uw0
	1yteuL+sy6paHYOY5NXaN6D4btbz4lVrj3tv6Ix0oKOFsA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9ryar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:41:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506a936d7afso584664041cf.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 14:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886509; x=1772491309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AyHH7QcVrx7/d/Pc5HmpEFycTB7iy4eLl8RPthi6BKQ=;
        b=L7u8ZpNAsKVx+4aEQh/qmM4mheUmua/6k0naFFdOUtEA6ft7uC3tw7L1nD2lbegEPY
         ZA4f/HY9aRj3+xcfB0UR21LMmm/F1XB1GQmBykHnKSJi5UMX3HhwPuYpljTT+xHZkzAz
         u+gy8ftM30nh5eQtcvZfN3l7e6s3w2O3Tez9N6n2t2LPwkaTN2vmTuUmS9kpCvpsL2zJ
         xyID/4KPdHyQXzLRHZGclZBKRlMDqJdgqV1PXXlXr5PFmfMjOZlypJDCEVB94NodrUCl
         aAtX3TcAopRc81fnGZBCdWbKQJuTNJXDpkNJQBdqkSyLs3jwfhB1YVMece+n7tgWQSAh
         5Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886509; x=1772491309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyHH7QcVrx7/d/Pc5HmpEFycTB7iy4eLl8RPthi6BKQ=;
        b=MDDfZZ3o/aeNRU8ZBiH3mLrJ+ZgNqPf3UE16V7K8E9uXRGYYvZ+MOnh9RnTSUwKZRK
         dA3yvZy/HB1DdTK1IdtnDgeXuisXxkgi4mluXsYoD6Ahr56anUbOxLwhWjfhox4x/OEz
         pW5bwTcfpV57wRC5l8iMZTA3SlTc14FfNScpgXzGbvDVqRd4CR8kAY1LmzrzS8ptY937
         jRc+Cc3hpalK+lLDEgz/xN5xgMuXNNDxpWQfQ2jHF0wYklaFX6fRh85sacqt0FrPaMU0
         OaviTtVqU4IJwwG1gzRRPWTMyiH2BwBVdyhwjyAVlSJWIirXVe5zpUrNonAbUiHz1asa
         SR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHmWh3161AlM6uUub46rAirKRGlW9xnZJKHotES5ENk5QsUFM9T2xTepDIlLM+O6aJsFr2CP4Ba3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJ9e+Pgomz7J+lPNDIuHcFQuJZCZmbKbDfLWEDk1IGu55cNBM
	pCr/MMAY20BHVbl2/jVBtjh3FIT1jppJXwSiQpSLOGBFAz06z+MRsyxpZ0yKlDak/fc96WRLyV+
	Hu7ERMkL8Ttcx4eSDKjWmShEwxk04ohWJ8hdgm67LUULwRphEjkBiv+Jlr/BCzXE=
X-Gm-Gg: AZuq6aLEf3nMxQFbdl1pVyRkj/3RcdN/QwXrIU7tZDLG15kGEVaawSn9v2ke0HicmB8
	9y5lPLAxpp0yuN8uLyYmWg8ZFUV4FhQ+eDJlKLls5AV6lp0Ogqm47chGoLjTHvCyNrO/NCTRFm8
	k4rWVa6qbK+0efQRqfq1IQ9qGxKcABB7Ji0jEsLjpBV9EAd1SFcZXv16kkADQrhGv/uTS5X7gRJ
	g8umJq2dKMLGI5xEPITe7LTawmGiF+vb6CcWEG2yKClrvi4jzyXD9AM1929yHGxDsnjRVt3CFB8
	EmTSX+QxhrQARIjVqmUKWwO0qY1PKZCXZaeQG+OpASvv+4rj+Uxd/8xfFPeijI2ZR/YLBmlS+YM
	ZwVmNw2ddstKuv7+JSxK2qmdyl+OpssY/WVKERDPSOH+C7cvtXO25S4+Iod3TSTYxdaeffXR/5g
	ispKMayTpf4Gr1h/Bw2VH3tvB1Vp4dojIszl4=
X-Received: by 2002:a05:620a:440f:b0:8b2:d72d:e41c with SMTP id af79cd13be357-8cb8c9d2d25mr1211395285a.5.1771886508806;
        Mon, 23 Feb 2026 14:41:48 -0800 (PST)
X-Received: by 2002:a05:620a:440f:b0:8b2:d72d:e41c with SMTP id af79cd13be357-8cb8c9d2d25mr1211390585a.5.1771886508209;
        Mon, 23 Feb 2026 14:41:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4cbf5sm1818985e87.91.2026.02.23.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:41:47 -0800 (PST)
Date: Tue, 24 Feb 2026 00:41:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <x3ebegi74hx3a2okxnjipgsrgkbncmtwnusxtv7mc66nfih2qu@jdxc4ry2n2gb>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
 <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
 <oe4ho45dxtwjjjsqj6nd4op3gh7dz2pqwsuuhgqpdbf5hym645@smg3g4evqmge>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oe4ho45dxtwjjjsqj6nd4op3gh7dz2pqwsuuhgqpdbf5hym645@smg3g4evqmge>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699cd7ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=-Sm6rUxn0lnaPTpFYlgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX3Vba79XhZ0GG
 IczKeuUHsopaoagPIAZ0XD2PEKGFxrH6mi1t1G8zhPMODUlzh2laJ9zs1n0ctaJm1+/HSyQkqzQ
 /lK2SFR98uwoT9SFNn1yd6BlWKFSk1iQNWzHYZ/y5HcqUIoKG53r5hCVAb46VCJEs2yM4LRY9Ay
 hfWRxJCzvcbOKFB3BcWOsKuNTv7q/FoLmR8+NM9A4/IWsgiGtJN85Kvcx1qaikBXI789tonzryN
 GZ2ZDgH7HoK7+3g7CnxAM1Qg3b9qJvjlmkjX7eEOMn1a7e1gDq8IPTpRDyWCY8wdBEAMLzYe1Hi
 EDdlVMdVkKPjpECDrOvPVO4mCtviczefZfwwi8SLuC36thOQ2Z4qZ/QvnDH5tBKHXnl0y4WT99e
 CLMy5/n9Jm3+A6y4TozhDgGpGWt/CVNLiMryAT8uCtxziyTVfZwHFpObgM/+BieMwY60fDrMtyG
 oOyLQOg27MGTilFRlRA==
X-Proofpoint-ORIG-GUID: CZzM59I-ADKJYKKWzPjyJhU9LdU1ul4W
X-Proofpoint-GUID: CZzM59I-ADKJYKKWzPjyJhU9LdU1ul4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230197

On Mon, Feb 23, 2026 at 04:25:08PM -0600, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 12:12:32AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> > > On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> > > [..]
> > > > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> > > [..]
> > > > > +/* Error logging - always logs and tracks errors */
> > > > > +#define qda_err(qdev, fmt, ...) do { \
> > > > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > > > +	if (__dev) \
> > > > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > > > +	else \
> > > > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > > > 
> > > > What /why? You are under drm, so you can use drm_* helpers instead.
> > > > 
> > > 
> > > In particular, rather than rolling our own wrappers around standard
> > > functions, just use dev_err() whenever you have a struct device. And for
> > > something like fastrpc - life starts at some probe() and ends at some
> > > remove() so that should be always.
> > 
> > I'd say differently. For the DRM devices the life cycle is centered
> > around the DRM device (which can outlive platform device for multiple
> > reasons). So, please start by registering the DRM accel device and using
> > it for all the logging (and btw for private data management too).
> > 
> 
> There are no platform_devices here, but tomato tomato... What defines
> the life cycle of the DRM device then? Might it linger because clients
> are holding open handles to it?

Yes.

> 
> Note that the fastrpc service is coming and going, as the remoteproc
> starts and stops.

Even one more reason to use drm_device for life cycle management
instead of manually inventing the wheel.

> 
> Regards,
> Bjorn
> 
> > > 
> > > Regards,
> > > Bjorn
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
