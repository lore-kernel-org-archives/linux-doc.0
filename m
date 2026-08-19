Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427B334EEE5
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153390; cv=pass; b=RS9r4XMDsNw3lKC3ZtvMgMOKnAQeRNwshC/4HPkJxTMWQNV7Da1P3c+urgcBCf2zk8PGgpB9zHVsnNdJ6voqnmqpAZ9KxrNwPdk5C4+ItM15ipy5PT3SOluhp4/LhH1PzUB96c00LDQKl++e5ONOf8YIDmBgO3FWWvN/45QMrQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153390; c=relaxed/simple;
	bh=zgrW+FnTM1DV6L5kMs4FP8rCOUdtYt8xe+26qvHuZGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD9gKYC+GbBxYJflinFLNx1FZz3t04fOlZATtBi/OD/4qK8bk7QRP4QrGH2ragBzqabKek7iZSQd06qT48a+/fFcyiAYF7vQNsx9QPGmb9S1OolMYirLceyHfYasTFxAzMxjsxmyLovuDYzbBglwCxJYfkSD14oKf3N4a48KIeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqtYERns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRDpa+E3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqtYERns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRDpa+E3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbWWR1620528
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 15:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=; b=eq
	tYERnsZTS3kFgGZ+V6OYIfQSuwal+Wyf6alsTQxpOdLChbPicqOUuXLXL9yBVLVI
	DpPL8hQD+TSwk0o8IG05G4gjVuVAj19T/RyMlhPzZbqqBkVYB8y5x0mvZZim1dON
	idZbReCveIfOKPoQSCJrzVNApr4H2re1dYjZjPK6cXbayggYeOpiBcniVOe8aStj
	ldhZb7RZiklrnboO0MquBUxcpdDAnR3aFOnL/HzIXssMdY8hn9AkeH6xDVR4tofX
	rYW5hyrLveNflJWVikkwx62Dd90MdJmAlFQG53w/5Rw6/T5k++Ln0+TyhdZxnNsM
	JzA/VA+0/v6s5OPvt43w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e83ra76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 15:29:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73986bb438eso1010212137.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 08:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787153387; cv=none;
        d=google.com; s=arc-20260327;
        b=DoFn2zoFyLa7HF6uIfTQqNziuA1o3BtW+eNA+z7PDlo/Q4mdnLJcGXv3+mN3YWOxE6
         70tcPznLx5/KkoejeWeqbIIDpwpBO1sqrWAYFSzKELNQzliHmf/XeKFIb5b+M/7Lm6Cr
         G1ONPO1NiqLCvV/pYMBUEz7kI7JhlN8aYLJvVNvxs5XdWJfvJqVExEB/Srv0kQG/xfoM
         2EKi3Dq+oon/yNBHUER28kKWXJVGvhSP73JUTBmFkUBc9EZyQvd95+NIkwJ4TYajzyvB
         NyEysr5U/X4PcU37KEahrEUENVQtcubdvEAq5Xanhn8YuiahvpEkO6ANIsgxjVRy7e9D
         k+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        fh=QWioIFrvxWhzxRZprjATEfIJYrHBptL1v4o0s63pxYA=;
        b=FknzM+c5VcqLsu1sgtHz9eH3b7DxqL7KdIKs4jYsEhjGUmPP1EwIXKkIlMuWPEQy+G
         H+tuh8DfD73R7XHe3CXJbGTfo20qWnNRNDq4SLWNKIiHaxKbWsd6pB34tlK6QCM0aT6d
         mYWtYCNknebrlYpZZCY5x68DmE2+sbNS39s7QAj7oJ7qnLdTSjLS9D2nReCflRS/F13r
         tPxZqfW8O9vEhcA2Kk+GccKX62dz+mrZS5lHNHoGauyuXqbopdHwNNLcMqoVlF2VFmBm
         OL12+k4tmk5TjlfEOGLP8qVDkXUn7XvuGApsDXD72Yfnm+rk7VhDaqi2HYXN8RiKf1CL
         A0cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787153387; x=1787758187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        b=aRDpa+E35H1M4pAwV8eaAvpkBwx/FAiGTA+QFGu6QXSjQTQL/DJd/eEgaQwFcVFVKG
         AMs4Clb2SqspAoUqu8ZnuszkdrJn5ZP45KU3blnJ1veIqrmxPVmVDqbYVJAoQoossAp2
         t0WB8+N8uL2CFjnqhlu2EBxuKLAPptWym7NVS+I+cGk6ql/gwsqqKSE5E6neDamMZUe+
         c1aDjGCPfB8ZJv3oL/3P567/nbAjeWGCRZdK/AMr0owS5YdY1SJS2YsHoZqU+m0FdYuC
         IqwoLD8mh8/TPPaN/h1ipAlsymU6svhXO0Vjo7KVaAL/c6zhmcgljEUiGqlSBlTpC3Nf
         3Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153387; x=1787758187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        b=Yt1IC2FMPvuaCoU6eLE0Z/0SXcqsaKIsmpTP6FSEsxAqoNARARvSLqSJzluZTG3n2m
         ZgKuEhCH/dHqF/tzStVEkBd921In3kDgPWDlQy/sU+eIXUOXlNWStj9ndIbmGc9MZ1wz
         GO3huIX915GvtsQIhIfjozoR6zTkPUs4AveceKoHJJINdDaL764VuCzOG9ptrUfRhYH/
         aQWH46Vb+CpF3nqDda/XhQngi96CnHAJ0/3+SX7auC/VK/7xyWOe6tHEgZVfPGvB2+G+
         RY1xYQQH+TRasAnCYxn3ITrMsxasXNrctaKqfGSiMujmyowjoX0VMH0S5D9dd37kaf9y
         suNg==
X-Forwarded-Encrypted: i=1; AHgh+RovhYkRf+JNjWk+oWy7g9tcOuU2kmsBOUX/OuTp3dlVO85EoK4fADVZS9lUWrRaAwe+/bGY8NfsGH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxE2Xxoii5LFNE1EjGwc/y3QxofcQs8sxsX20lx6QskBaT51m
	aKD8afQw+/qoTsBxErTR0ctMP65vCmsesO8KogZgOvvtkMkYckxwlwP7yx5n47OcPaWFZb83YXI
	PAG9NVx5V6FnvBkyu+W2UYB0gVF17IKLqjpoj5z0A83YKIXTRSMdKP2yMaC4gJjPCh3/JRswhzZ
	J18iNGLEkMW1rDJNQSO7JWDhMke24ccDF9XDg2xsPM3xE1wQ==
X-Gm-Gg: AR+sD105KVX2agAZ0wUg/duZ4Z3CTLkX7yZ2IsTucYBKFjUT1jNuGRzVnHG9OEe7AOQ
	NMFz3GezuoyxQcUwlGN10yg+de13YESgtZH2vthVl5X1HuMWnsC633FGvbphkBrKavunBUXP3cz
	a2RXJWY/POeZOTgI/RKcVENFkeCB3Y1+N7aQ4QyZhzxG/e7H2db8sr34+4
X-Received: by 2002:a05:6102:370f:b0:738:fd01:5b63 with SMTP id ada2fe7eead31-777f8f80ec7mr2127350137.4.1787153387336;
        Wed, 19 Aug 2026 08:29:47 -0700 (PDT)
X-Received: by 2002:a05:6808:1997:b0:495:eb86:6e8f with SMTP id
 5614622812f47-4b2bcaa116cmr4635236b6e.14.1787152998435; Wed, 19 Aug 2026
 08:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org> <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org> <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
In-Reply-To: <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 08:23:07 -0700
X-Gm-Features: AcwNN1WxA9fiQ0CGl4J8t7bFhD1MTRVpPgPEs_G6pBof5jMpK8zFCbjUKPrGqB0
Message-ID: <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfXwus22LuRb72Q
 i1ac9fwiqFhfL/4nW8jP0rMmJqFdkamQcj+pIANJZBg8eHwAtT+Um93v+tF3Lg/ri7bYvfX+iAR
 J/zxVsIOnGtxqTrhjjkssjomxv8DNWM=
X-Proofpoint-GUID: SNdPmikTKcjKZe-HX8Bm11CpEM6sIEFo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfXyelHuQaK7RN9
 yiegmA8zjb0VnfIjML7W1eNqD04LL87P+ZJ8xMczhMtrPP2h0hOmE78mroJWIUPVgs9qgWHd+RO
 StN6X2co8Wtq+d0qWMYlysYsXfrGxecTJBnj3Nv8b/TEu6n/XwfYCkMa0iyg3oSt5w8gVPJeAch
 CRcsPbsQAl4mibSfbQxuquj6ZtTRfteZe99Oa9TNoEjuJgWJ5KYD0MafAtG+HA983j/6uHYVCaE
 qfstfWtviHsiUay+/MKBBM/PZPbscRH+L2b9qkG99yHQho9ouvcm3VDKo4VtWpWjAJL5ffAnozr
 EZI8aoXd0tLTaUAw6BASj0BfhaJzz/dznL8+nyjvwhv1qslZamv+dpLJRftl3BU5o0nwS9GUc+J
 WBIDnxB/dnt7Uv0FGetn35iqUjBmwBVf3IBiQEs5eJd4TwOKoEJkWrk1sRNhNCXsmgBfJ1QAA+P
 IJnRRbxovFP7C6rCtog==
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a85cbec cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2opUpfO7wUc-A3Q1rUYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: SNdPmikTKcjKZe-HX8Bm11CpEM6sIEFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

On Wed, Aug 19, 2026 at 7:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 16:49, Rob Clark wrote:
> > On Wed, Aug 19, 2026 at 7:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/08/2026 16:38, Rob Clark wrote:
> >>> On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 19/08/2026 15:26, Ekansh Gupta wrote:
> >>>>> On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >>>>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>>>>>> This patch series introduces the Qualcomm DSP Accelerator (QDA) d=
river,
> >>>>>>> a DRM-based accelerator driver for Qualcomm DSPs. The driver prov=
ides a
> >>>>>>> standardized interface for offloading computational tasks to DSPs=
 found
> >>>>>>> on Qualcomm SoCs, supporting all DSP domains.
> >>>>>>>
> >>>>>>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>>>>>> subsystem. It uses the same device-tree node structure as the exi=
sting
> >>>>>>> fastrpc driver in drivers/misc/. The approach for binding the QDA=
 driver
> >>>>>>> to device-tree nodes while coexisting with the fastrpc driver is =
an open
> >>>>>>> item described below.
> >>>>>>
> >>>>>> No. Grow/replace/improve existing driver instead of coming with a =
duplicate.
> >>>>>>
> >>>>>> That's a standard upstream requirement, basically given on every
> >>>>>> upstreaming guide.
> >>>>>>
> >>>>>> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!=
".
> >>>>> Posted discussion threads here[1]. Would seek comments from Dmitry,
> >>>>> Srini as well.
> >>>>>
> >>>>> [1]
> >>>>> https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@os=
s.qualcomm.com/
> >>>>
> >>>> The rest of the comments is still valid even if you did not acknowle=
dge
> >>>> them.
> >>>>
> >>>> Anyway, regarding above - again, watch the talk from Greg.
> >>>>
> >>>> You have ONE driver. Not two.
> >>>
> >>> Long term, moving to the common driver framework (which did not exist
> >>> when fastrpc was first created) seems like a good thing.  But does
> >>> that not allow for some transition period?  How can we get from here
> >>> to there without otherwise breaking userspace?  Is there some other
> >>> precedent elsewhere in other driver subsystems?
> >>
> >> Yes, Iris and Venus where we agreed for an exception (two drivers) as
> >> long as new driver supports old hardware / features.
> >>
> >> This is not the case here, right?
> >>
> >>>
> >>> I suppose drm exposing legacy fbdev on top of drm drivers is _sort of=
_
> >>> a precedent if you squint a bit?  I'm not really familiar enough to
> >>> say if that would be reasonable/possible in this case.
> >>
> >> Growing old driver does not look complicated itself. The only a bit
> >> tricky thing is to present somehow exclusive interface to user-space,
> >> like usage of one disables the second etc. Depending on actual
> >> differences in that interface.
> >>
> >> But having a duplicated driver is a clear no go and it is well known
> >> upstream requirement. Nothing new here.
> >
> > Would it be acceptable as a first step to, by default (ie. when no
> > cmdline override/etc) for the new driver to bind to new compatibles
>
> You have one compatible.
>
> > and the existing driver to old?  Ie. have both drivers but only one
> > binds on a given platform?
>
> I don't see how is it possible to write such DTS, because - repeating my
> question - how many hardware blocks is there? I believe only one per
> given DSP, so how could you have two device nodes?

Maybe I'm misunderstanding something here.. I don't see any new
bindings with this series so my assumption is that the bindings are
the same.  What I meant was something more like "qcom,glymur-fastrpc"
would bind to new driver but "qcom,fastrpc" (which seems to be what is
used on older platforms) would bind to the old driver.

So single dts node, but different compatible strings picking which
driver is used.

BR,
-R
