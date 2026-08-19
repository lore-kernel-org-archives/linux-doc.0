Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5423B8950
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154530; cv=pass; b=myp3kzmQkemL6GrGI9HG8Q/R3EBonrwvsK5HgxvFogPcU4J0kAIS85N48L5N8CFtad90LC39apPOEwjYE4OzEodwXb0HWjbUloM39/hPZRj1BCaQGEQnHxrpWrb/g3Z5Zlt7oHmuVbVkoxfK8pMoxATdW3jLmmIobX7DJev2X/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154530; c=relaxed/simple;
	bh=1xcLzj0C3qzK2ZAmV+j0EOQhBmW7Epm9ml6TC3TBUl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx6dYcqs2R59mard+auYdXHT1B8/shfzSma1J82QUhJkQ1JSJeMBhwPdaDfFVdVnjTSHufm2MTtyOTOgLvXPcatqo3j7tLoHJEZN8q3rxR63dRQvo4z8vqEnsxZvPgVGyPKsIvzM8TictTc7mw5/7M+aMInDjAKpl7ArTZQYxyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJF/eCs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjAMhjah; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJF/eCs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjAMhjah"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2E2E190707
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 15:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=9LwX2wymuNWHp2N3uz9gd+qk90vslZI2iYUW0/6tKgc=; b=RJ
	F/eCs1iKDPKXfdB5ApsmYoJxm/g60Lf9+5/Gjz+wuCzKhgMfVMVe+Cxjk44biNnM
	KdOz4rmYUDmfbVAHeZJskobZsbGPgl6nNtQMPyhL//HGHIxSJEakCRGmZzVWADrY
	ocNcZa3xFT9BaD4aDGfQYcmQHGnOmjxBOFtDaqwG8hJpO3himuIfvbZNfwwoJZsN
	lguO3NPX151/ns4boGy4hZ6cvPJ/63CcCujJAxiLVaz96j256GYBgIrVBfP+kOcQ
	tM1exHWwVoEgkcTjXMDOuuKnmmNnVFPnLYiSUxIXM4lKgusXPi6cmY87/YcaRbmJ
	jgu1IevwRlk9XbJDTqMA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc082v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 15:48:47 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a3da2369aaso942086eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 08:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154527; cv=none;
        d=google.com; s=arc-20260327;
        b=N/yT15/03TPuUSN38Vn6MJ8W3Mlw8ru/zNv9sVdo+PXI/FsLFXBwIpq5WpTCTvjzuB
         x0800Lm1qYH8gv1TNBzW27CBULWazTa1EHFYhq7/KEJsXCukk7g8NAnEr9t6lwYCdLvV
         B70FxsHxSWPSJ28G4G6HDqlcgDjSfVc2R7ZtqFofm0gEdVJtxRkdqfzNtdD8ItQYjgI4
         foSMCxZ1EGnUd4i9QO+SS0rQxVMGIBj+S24RooyUWyURlvdOD505j3ebp0Q6laUR2D8K
         eXPmbZnaoloOa/KZE/2Nlf0btuceHXug+YT2zAZdbdI3/HSwfBtaQNebsj9k9GZz1UZP
         uoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=9LwX2wymuNWHp2N3uz9gd+qk90vslZI2iYUW0/6tKgc=;
        fh=kOJucfuxan+TNI+yL+9qrkV2YapAvGkF0ZLdCEb+0q4=;
        b=M6RdV2IuugLDoUyBG/hhVNEH7vkhk2SmksbcVaLytZQMcqTG5pNco/77gPGTtAEeRe
         9ams4tkZsmp4mWus7A3aU2kndm7IobAaCW68j0uwbVzM9C3/GfFd0twKSLKMGMHHDxK9
         ursvDsM+j69Vq3B3AE86mH3Pnw6WW+9BPjtD8GB1N01WvWIc3olIgSnSQiLmwTzoLHFC
         QN3SsnRrGOWwTVdh4qKqzj78r8tVS1dMh7xlt6+R/0YXQ0ZZNAWLEJQ3NpYd9RBjLj8u
         twQS71gjo/qW0UqYTNNzdlVeHcEJoUJYZmWfg8c4CU/n9Wq5aSce8SlG0FKsIlF2eS7U
         du5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787154527; x=1787759327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9LwX2wymuNWHp2N3uz9gd+qk90vslZI2iYUW0/6tKgc=;
        b=RjAMhjah/1CZqyS0xffh4JI29n7KUPtFn1IVhGPvP2YgnbQrCObkVkF5X9kMUnlFqI
         mmyM50YvpdFqucg4x9hbNcEHDDquT9C8F/Z636ePheEP5gHuTA5+qERMGkjLRieMG3Qx
         ns/ALLJCAAqQcJTRmx6ZYnhRfYiTI1xvNiU2WXdKF6+/xbg6c9oKOXXP99aseuQjMCqq
         QPNyjlQxOOwJRX1tTavz1el2Tprs9XpN71gXcjclYG5YaztmE+KI6FMxfxLn0rEocm3U
         Ug6PwGR8Clq4AkTd41gaEaGRaoODK0OtF0pPc4RfsCyZPqm6s+tJWt3GRinL7mrqmlFx
         xnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154527; x=1787759327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LwX2wymuNWHp2N3uz9gd+qk90vslZI2iYUW0/6tKgc=;
        b=PEt0JGnHRZ85mpJAGt4BwH55KnkAfgu9LxVqDRl8D6nZ0jAEUNRhr4yV94ODdTmsTP
         di3AmMm46tL1LS2/PX8wE1WC0igw8K5hbgF44LAu27V7v1c+Kbk/xzIp38BG5b6Le1jr
         BEZeb94uRpyQvFkqgSU4pdT1FkuZV9bRmKoGZ7JWqDMm5M45xQ0H4e8ulxIYhLJWR0/q
         hlm9ZA8tY6iVPWFtUeWWYfn/Y01ZSkQpSRyNNYXnUPEruRzO3XDPvpSIdizYrhK7dn6L
         j/TptWtXTQ9Te3k87zgvwW+HEO+8QBw2rMp4L9B7EXSO7I0J+L+hFTvLGzIeNjNBx72k
         rkZw==
X-Forwarded-Encrypted: i=1; AHgh+Roc+INP2hGgBebRHdRB5fLTZJUUe7YTmCH44OH3Te8aXLEpHeDnPtufaUmejD/Qg/InI+bIE279bsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs66Z7C1W0P3tTLo4WFmeO1ACpfA6btkWU7iuEFLSO174QSSG7
	sD5hoCilz0UybOhwse3NW4WnUj6ckiX+utBwqf9eHTh+x9YHfkKtVjZj5dLyIVg8u5S57G1Uj4H
	CZG0s28qSC3+ccDeHcNrsfYhqUHQDunTHMMEbwG4D/j65RwsnIbJ8CvP+BFNksuEusjALXZwy4q
	gliVb9+p50BOtmqS0nCFRVfLx3euy9bfKvwH8aoQ==
X-Gm-Gg: AR+sD11oPbd8fvV9dHk4q4DZA4rRRj+xcZg9ap4zZeTjMXbcXKTTiErRyRCo2XUOw5M
	R4e+l8cHzWS5vikY3FLt+mQy0K3WVPLVJHLepqWePQBV7mc7ulLULD4xKEJGgN5r+/tVsMMwaxa
	dV6vqYHGyV97xawpoBTnM1pJQ2kyPiwMeaRYz/DjXkJK5cGCSdg6usWL0g
X-Received: by 2002:a05:6820:1792:b0:6ae:8ee4:e01f with SMTP id 006d021491bc7-6b13c2d221bmr5523538eaf.4.1787154527096;
        Wed, 19 Aug 2026 08:48:47 -0700 (PDT)
X-Received: by 2002:a05:6820:1792:b0:6ae:8ee4:e01f with SMTP id
 006d021491bc7-6b13c2d221bmr5523471eaf.4.1787154526670; Wed, 19 Aug 2026
 08:48:46 -0700 (PDT)
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
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org> <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
In-Reply-To: <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 08:48:35 -0700
X-Gm-Features: AcwNN1Uf01RBOSSs1eSJ6ShN0aw0OhP8jKQH--o7bN6dJI2taQ6GEVNP3fqxrcY
Message-ID: <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
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
X-Proofpoint-GUID: OOUEZRmlY6kQqv9UUDDAdrEQdjf4kW6t
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMyBTYWx0ZWRfX4UVzdsJrH9x0
 HkxpcoI5aBkFH8BNwP9vVXn4fiEsRKaQkiwQFf+g2hgjHXJMrzZf6gQuyPnnKJnvBtMFEnePslZ
 fIyAYJb7voVQV+zOcYXBnCzkEJi5q4U=
X-Proofpoint-ORIG-GUID: OOUEZRmlY6kQqv9UUDDAdrEQdjf4kW6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMyBTYWx0ZWRfX7+1fCGcDUC9u
 yn2I09iLvf5B8H2FNw2g2gVmijcEsLsP9eXWUz3oca5KdlW3miKEW4gcdOdGe9s7Tc9wHUDkGOs
 e3bY9hE/9F5YLuUkBlMzejNeKlpYYmj9De/EbWsu0EELGpKU6C4MmM5F76bi0T+4VABV0/XHkrL
 B58DpDe0VFZRoIugXxFOhX9Oog2hmOfA7gKh4JyIZH4ILxOhMAqqkh7+fSpan+nAmd8mOV7z6Uk
 kxN/FpQYYM44RSwiVdSn50W5bD1ulNT5ohIGkGcXNxBCemCUXbNS0Hi+nJZyZGSb9MevJ+Ah2Sp
 YSeY8P6Y21XAv/MFRhhMiKGWbPB/uYH8UY5vyxz2zoDIX1xCO5r7EkTsokYBjujd7HvDLe2fZ3x
 41CU/A4OsN435AIEICag9QnSIiM0TAcE9yN98WdhBIQb2hzWf7enBWVBYgXmOg1KTAWNXUDw7/C
 zRN0+XG09UrJa55Ptng==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a85d05f cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=mAvluEFbtwFrZWikVwkA:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190123

On Wed, Aug 19, 2026 at 8:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 17:23, Rob Clark wrote:
> >>>>
> >>>> Growing old driver does not look complicated itself. The only a bit
> >>>> tricky thing is to present somehow exclusive interface to user-space=
,
> >>>> like usage of one disables the second etc. Depending on actual
> >>>> differences in that interface.
> >>>>
> >>>> But having a duplicated driver is a clear no go and it is well known
> >>>> upstream requirement. Nothing new here.
> >>>
> >>> Would it be acceptable as a first step to, by default (ie. when no
> >>> cmdline override/etc) for the new driver to bind to new compatibles
> >>
> >> You have one compatible.
> >>
> >>> and the existing driver to old?  Ie. have both drivers but only one
> >>> binds on a given platform?
> >>
> >> I don't see how is it possible to write such DTS, because - repeating =
my
> >> question - how many hardware blocks is there? I believe only one per
> >> given DSP, so how could you have two device nodes?
> >
> > Maybe I'm misunderstanding something here.. I don't see any new
> > bindings with this series so my assumption is that the bindings are
> > the same.  What I meant was something more like "qcom,glymur-fastrpc"
> > would bind to new driver but "qcom,fastrpc" (which seems to be what is
> > used on older platforms) would bind to the old driver.
> >
> > So single dts node, but different compatible strings picking which
> > driver is used.
>
> Glymur is already done, so imagining we talk about next/future SoC then
> we would be at point of duplicating drivers for the same hardware. So
> back to square one of my comments.

I just picked glymur as an example, because I needed to pick
_something_, and toplevel dts for devices available outside of qcom is
only just starting to land.  Maybe it wasn't the right example. Let's
just say "qcom,supercoolfuturething-fastrpc" instead.

I think my example otherwise still stands.

(In either case, kernel cmdline or similar override to get the new
driver instead of old would be a good idea.)

> The rule of usptream development is that we do not accept duplicated
> code, just because a vendor wants to write something new. This is
> basically the concept applied all over the drivers tree, where we pushed
> back against all sorts of duplications all over the vendors.
>
> What I miss in this thread is why would there be any exception here. We
> do not grant exceptions from standard practices on "I want" reasons.

I agree that we should not have duplicated drivers just for vendor
lolz.  But when it comes to adopting common frameworks and integrating
better into the ecosystem, this doesn't seem like something we should
actively discourage.  I don't think this is a case of vendor lolz, but
rather reacting to drm/accel emerging as the standard framework for
this sort of driver.

So how do we get from here to there?

BR,
-R
