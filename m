Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04661397924
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150979; cv=pass; b=H2OOAzreqn6wMXJN/lLWg38tnTr3BE9+k0XdQKYnSfmek73ZIptusBaeqz+lgyYxy11l7Zj6VFD4ZIuZC/HM8DBJOk21ZgWU9Ly0mUQPX5pvO8Pi7ntf5Vfhfxb9zSF/NVgS/Gpl0P+nt5jFsSbEOPa1pEcU9pF5BfILp9BE800=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150979; c=relaxed/simple;
	bh=9wVhSx3PVShqBVKKwgYE6zUrTe2YMfHR4S+tqrdXOCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlQKxrRvhV58FIQ+Xj+suBvDV7c3qEa1wigUbre1itVlSqWBKxzjbAe/TH/LSRGkMOLYuR8cRI78sKrtAAGncr6FbdEroCyv86GHaxnH4r44UVCuqu4eLnYBH3lI61sZq7VqXFgEUAM+H3WFkj7vX7L/km1711oA4jQNIgjzfxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLme8JwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrMk0H3s; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLme8JwQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrMk0H3s"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbpB43550233
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4rNpIpy4LtbyQ9Xtow0eilFdW8OjcFy/oDCBHiNow/s=; b=eL
	me8JwQK0gnd4E0UZMMlGf35BN58ld0D1S5FR4/hiSNXSXIxD29uqf2vrpsBHXPjx
	d9PATSuywKmGTK0IssoLyQ3nYDj52e+ZKi4vMX5YCORIKrn1TBdkjENHaxy4I9Tf
	EhQRPwdOujFdQJfuOIq9ktzzprkpUeWv5BnWKOtOp0qFSIsIi/9Y0PmGTqk4JrpO
	nhu6BwMo5nJPbzvlRvoNnPEOjerlIY8yXhVvvN3gEqVRxGpSCl6vToiotnzH9P32
	FnOi/m8QA5a7QSwo+jCuLakY1PKPY0T4EjhdsQksMMIpPQysdOh6nsgGFr9hEiYy
	9QCjJF2anT+fFc8qCrEg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbue4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:49:36 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6ae35c7b9a9so578925eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787150976; cv=none;
        d=google.com; s=arc-20260327;
        b=G3uH6hEOvE7VlduIGbZe6dbWVFen6gSKVUvXcAdPaM5loW+1JRkbdX40UIRo1bgLQe
         UXWW5GYPdt81pIrRk+YluPTE5roKCWSiJ2EdXDIc1YlDMOUxNmQXygoC9E0bIWEu1ZIx
         FP9xQGp+oiSM6tgVsrQp1SF26ruNSnH8mpoPJbemGnfETsbg7hunzC4hs5j3I5uHaXWM
         hUPezbumgfZfC4UMNiGNYeL7htfPcqX9sS6ZNnN+GpYLwn1MtYf1Ypm2cMDt8Fwbo+48
         JNTQcwAGr0K0GPcKHO005aEV4gEh1eXpEP1229wjrLSV+QrIqAKfAWeK2/GJTFb4bhv6
         guzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4rNpIpy4LtbyQ9Xtow0eilFdW8OjcFy/oDCBHiNow/s=;
        fh=LTVYkhiTFMLubrjqZsNlcrWb6ngC9T0Wj1wUMY6wgK0=;
        b=BgsYco+tOKi3roN7IBPEY6jgw5MZIF6ic2uiupepzMDUjX9RtouoeMdffYkYL7+2Gr
         oBpuPxhv6U/evgOXicaDsvDCtzZF9HGZkkamcVUaznFZmqMZWnfc6TgdpH0XKipE6T3d
         hCXteKXRq0JjgH8dYdkx59Z3JGiyZIa02kGuWwvtKvptQ4UtcbbmH5E/rIPvp7z/7BKB
         jiWT8bQnWZm8FAcQdxLJoaMQY25oneOUu8oAX4bg1CESvp1IBaGn68bgDshyMEwoMSUj
         4V3aNqV6Vdkdi0B5YgepUF6EhdpmgusHViAQtT0kO9rISRPArlXeejaEpMBp/4qrzVy7
         vhdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150976; x=1787755776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4rNpIpy4LtbyQ9Xtow0eilFdW8OjcFy/oDCBHiNow/s=;
        b=UrMk0H3sbnZy0RhM2hZxtn+WMG9+lYsEt0YAi7yv8uYW7fo826HAgoiOKL/nAxAeef
         lGjBgqWzVkoaK0zk0COmItVtBFD9cO5VUz3BNH+l7RNV3XPG5RwlE4q2wh1FwyVg+7dh
         ExrVxQm4sJFN2aNbJOiddAI28qx0AJXUnCbJjBlUOGGRhNOwcKEx76p5nCSPGU8B4mwn
         cM2qpRE7KQBPhyojg1HoKCKoNiK75PJ1VXNU09kVNf38/qwObo7kZGj5Bd+DVpaxMZ4F
         ya7PwXdxV9PEe/5mQErwc+Asb0jpktkYfr3n/aX19f0bjy25jjI2MP4ocDKD5shoSaaU
         jZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150976; x=1787755776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rNpIpy4LtbyQ9Xtow0eilFdW8OjcFy/oDCBHiNow/s=;
        b=TgC0jP0K/Ofci5xAY3mS9KQr9d/V6YvY9T21qMleups/yZk6Tz1LEiVH2WnrZkftEm
         1yyc4Y2Cy0ifV0y3CAS2RMnk0PDj5QtG2E5ZoZiY7TmGbM+MW3vAjgIFGyn3CZCliEdy
         K0yA2CVORZT73Zjw4rQoMth4waiC/TY2h4moLSf7YYwiYodH3OqgsLbNmmqF/O0CWx0e
         xq41v+TruUaz28zAj47A5FjJkQDCtAI4x7l0YmqANfN1BWg1avMLsR2qKrufSrqgO8iO
         KwOUBw79UbSGWvJhIzJq0lWkcpoRcmPz9wmkhBTtDrTzeGI9/ue4d2kNORu4UyUFGcap
         MWxg==
X-Forwarded-Encrypted: i=1; AHgh+RqnfaRr5ayChlDAv3DuW9X8K3m5pKw8ewikxrkYkBSMpDqfpSPnTU8hYcrvmOqfOgJ97pPX5jGfkJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7CnhdbQTsTPM4X01MHQ3LTIsyOqQ6qTUtb7oEYezVmeLISmn
	QtiQIkzTHNfkLUIPNIYZGkUiYTQ/o8vnx3dojHWLePmyDMv4PzEkRQiffp0oXRC+RyMb61g3eRc
	p0Ey7bMKrXElYs95lArN+sy8J/wWuRmsnsKYvY4EXJ+hj/oZ1AVANJxdBwQX64O3qQCsn+nLrp1
	bQWkvtmuay9h31Ni+mEbcPWGIrnzDHELTCGvEp+g==
X-Gm-Gg: AR+sD12xoJwVth54HWkfkV5zbwxyyghD6qotv9ppZRq1bvyNOYOBs1gKJPQ9NpkmYgj
	MBMGrXUbDmNBUqA0L4BdlURTzKRyUCDPSbY4C1P985Y/bSt/mc7eNXKuBy2zcnGFDxdqwLK6NM2
	yW6MSyuVAf/3KcDk0twbDDvQxn93MqV8A5pTMz7Q5CMCzwrO0L5B2Tx82h
X-Received: by 2002:a4a:e917:0:b0:6a1:8c8c:abd7 with SMTP id 006d021491bc7-6b13c3a41cfmr4766411eaf.16.1787150976075;
        Wed, 19 Aug 2026 07:49:36 -0700 (PDT)
X-Received: by 2002:a4a:e917:0:b0:6a1:8c8c:abd7 with SMTP id
 006d021491bc7-6b13c3a41cfmr4766332eaf.16.1787150975455; Wed, 19 Aug 2026
 07:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org> <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
In-Reply-To: <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 07:49:24 -0700
X-Gm-Features: AcwNN1V5bfW_enn3TfGcE4UwPNlg1kyolZJsLpJh8D-Byx5y30oNV1d5dKRlS_Q
Message-ID: <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85c280 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MVsHzMdaoZhIBd0MKPEA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNSBTYWx0ZWRfX33hnTURu5v3Z
 uflOssMDZK0vOVI+9hmnCp6OfYwv8WoiJZdWb4qCnDnTX1uXNP+WMmLoEg5/hEuWpsWX3zGYF5s
 jQTerwneY93cBNwgo0wbAQo0iH8NRnGpP3y8mQDAmacIjGJbcdTodmLXCqkfUUeqsmnzJc3DRGu
 jsDEf3H6LimqeJ16wVn17zDgKs7S2Agbb5JW5CWWWLs04KqyYZf6nrxkhF/4kq5lz8egu2fkXjm
 TcsexpnGOlL8MiRGZ8jAVk6Gy9YBg++MLOD0wXxD05QELiw0IfQKCVQ6i+QnMGFOnyrPEBiFcNk
 HIyPvLwOhpNWKAWK6M2Gj4Qu6CQzhxAqXjEdyVkLYsNdwrU4u3wHto2PzoqzKdFwtCCFT3TRiVa
 tu0kVPU2LqsynVWHHcujHbSB1qMPSJVWDqMSMN2BLPr2ytdfCPWRw4g3AirnazGWptCsAHnrXQ7
 7FYbIAN7AmvMWe6cPrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNSBTYWx0ZWRfX0QXKmLXlVzEQ
 rq/DzrjPEqQcwl6xlfnF4nsMwnp7KgIlpUmnDSAplVQc9dVT6KQK+EXyqBbCwRC9kVK+1lFZmKv
 p9FRUmZyk6HU1ewN/+L/u3U+9F5X6Fw=
X-Proofpoint-GUID: HDHuXjTwHtIXqPEjAJNQqGy-Q6VnWXnv
X-Proofpoint-ORIG-GUID: HDHuXjTwHtIXqPEjAJNQqGy-Q6VnWXnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190115

On Wed, Aug 19, 2026 at 7:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 16:38, Rob Clark wrote:
> > On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/08/2026 15:26, Ekansh Gupta wrote:
> >>> On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>>>> This patch series introduces the Qualcomm DSP Accelerator (QDA) dri=
ver,
> >>>>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provid=
es a
> >>>>> standardized interface for offloading computational tasks to DSPs f=
ound
> >>>>> on Qualcomm SoCs, supporting all DSP domains.
> >>>>>
> >>>>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>>>> subsystem. It uses the same device-tree node structure as the exist=
ing
> >>>>> fastrpc driver in drivers/misc/. The approach for binding the QDA d=
river
> >>>>> to device-tree nodes while coexisting with the fastrpc driver is an=
 open
> >>>>> item described below.
> >>>>
> >>>> No. Grow/replace/improve existing driver instead of coming with a du=
plicate.
> >>>>
> >>>> That's a standard upstream requirement, basically given on every
> >>>> upstreaming guide.
> >>>>
> >>>> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!".
> >>> Posted discussion threads here[1]. Would seek comments from Dmitry,
> >>> Srini as well.
> >>>
> >>> [1]
> >>> https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@oss.=
qualcomm.com/
> >>
> >> The rest of the comments is still valid even if you did not acknowledg=
e
> >> them.
> >>
> >> Anyway, regarding above - again, watch the talk from Greg.
> >>
> >> You have ONE driver. Not two.
> >
> > Long term, moving to the common driver framework (which did not exist
> > when fastrpc was first created) seems like a good thing.  But does
> > that not allow for some transition period?  How can we get from here
> > to there without otherwise breaking userspace?  Is there some other
> > precedent elsewhere in other driver subsystems?
>
> Yes, Iris and Venus where we agreed for an exception (two drivers) as
> long as new driver supports old hardware / features.
>
> This is not the case here, right?
>
> >
> > I suppose drm exposing legacy fbdev on top of drm drivers is _sort of_
> > a precedent if you squint a bit?  I'm not really familiar enough to
> > say if that would be reasonable/possible in this case.
>
> Growing old driver does not look complicated itself. The only a bit
> tricky thing is to present somehow exclusive interface to user-space,
> like usage of one disables the second etc. Depending on actual
> differences in that interface.
>
> But having a duplicated driver is a clear no go and it is well known
> upstream requirement. Nothing new here.

Would it be acceptable as a first step to, by default (ie. when no
cmdline override/etc) for the new driver to bind to new compatibles
and the existing driver to old?  Ie. have both drivers but only one
binds on a given platform?

BR,
-R
