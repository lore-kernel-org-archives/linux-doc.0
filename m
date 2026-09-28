Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59D486E7D
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601359; cv=pass; b=CdzG7z0F4Moqgyn6Pl5ltDsgPVOxkdEvcIc5xaxlse1JY20X2SvxtKOhMrcjJeVoENEzLfaLp1adgiNTmM9jUydtOSIZrLmYCCFUy1on97xkfBowcV2npmikjW7qUEBJ7w0jyNjpOfr0C45h/OxYnwHHPGN/4ifUs/qN4goCYNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601359; c=relaxed/simple;
	bh=RYNnodyGj2H4ZDL9Nl1Q9njPA0WoMAdmfxHZpNUl6v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQhCzY2KLjhtsXDQpVxUTs/Duj8uDqqdbVSqFHRZgmD6rJL53E1v6znodRpEnjOE3blxESHoXQK7sTJbEkCNKCoJSy3jbxPkc4/gA1Xs5JGb+1+2V2A9XzfGhRz2sLNaOtVWU6Oeu1tAW4LxC7lFDr22KRc0gyJmiL61QfISWlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbTp5OQb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwzB9ILM; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbTp5OQb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwzB9ILM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAGk51189488
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 13:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4n5cIJubYf0152q28FSh/pocYyVNa6tYRLNKG8jP7g=; b=XbTp5OQbKoXax8+1
	TbIP6VO4B0jP0m6BbYqkq48DBQBCjunQwA6pGwmTeLGH3Pj60TPsImezhof+zWfP
	/VsPH0cVPoEpWhcrK/R/cua0TmwJSNVSqdoLdRc9fT/IYhO8+Axt+7I3xeWol4Vo
	Prvzc+SSKnJbGNEhsJ80lxMyvdWfVFdsoRsuERJK74v5SBssh+8Y3dY4iM/7l7qt
	RQMd9Qxn1s3dM4O3zogtAR6OMsdrAXLGptIQRf4vquBT+ArIR/beCvPD2CAwuAqB
	8VRHA3ERN4sJCNat4XEmOZt2LcuL4da+zOZhjjzWeX2TfFjVMnlEUA3EZ4jcVCg5
	MAXutQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc0u80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 13:15:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-877ef1457aeso2334759b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 06:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601356; cv=none;
        d=google.com; s=arc-20260327;
        b=WNex/p8Pmf3/Me4zjU819K5ElgTxMfXsfTFFRMXso7JHo6fIZ6mzf+vvyAFET/n7KV
         iGSejEzRqenNKWeGijdBu0zl+44ntx2GUprI1YQxsNdPNsegmHQ/XPTtu038JqXtJv5a
         +3m8n+ZWkaXaO4bZMLTpdXWrpaGck+aUNNkIfuBS3sA/BGotfEzF4G37w61SAlPiMzcT
         kKvYF6MKsqq+hOXGGA/NidDfTXhxPfECpBZI9f0t1q4rdlKFQvqth1BJEIfXAY4BJmLZ
         fzl13t9N39di7Aqald0MOi1GIv/w7xC0pXKQ0dDsVQGb8eOkkDTaTfWjm9bWncDN22rx
         M/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N4n5cIJubYf0152q28FSh/pocYyVNa6tYRLNKG8jP7g=;
        fh=Orx0h18nNOZDCn5k8QcI6FnNZq7CCjSOjHhBlDtJiiw=;
        b=CB2g1alxlt55t3tokgzH+JspCcvyC9amuWTu7rIroabwaulpBtqn2Gf0ao31lK7dnK
         cJCRZCNvxmxe8LKKj8iaHit0jdk6IIQ61BEjMNEasr0MzfpSm/zo+7SBvtYtzp0jwiYr
         xUn1N6LbNClnYD14TLBRepqGPV7cWxeRe3uG1HAeQt1TMr2fVJjfeLQnOG83lQOd+rp7
         8S6Z54BpgCHLHKcGkCdxG4FgqT17RWyiq/KItq/bop/B6BvgME+ayKdVvIkAXN2ECVt9
         ty3iJG9xMa6dcm15EZf4GRwTLPSkpbWkSWS11m96/ZQ2EAkxyzekj0tt5VUbhb+KBab8
         ajPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790601356; x=1791206156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4n5cIJubYf0152q28FSh/pocYyVNa6tYRLNKG8jP7g=;
        b=gwzB9ILMfzSoSOjJ08ZBSTSncUQt3BtTIaRrl/xccPwhqlQX/pL4mRumhw3OgDWNUu
         jgUe9C0AzrmJ8ECkiY3CJ4WENXiF+dJl4Ft0I+8445W9FQ5Y3KtcPbn2+C6q2zWhPw9D
         w8N1Lgon2n0jYOpWBLnPl2x5QlVKCPN2XS4bkKH8uTkke212+rKSGdfDvOAd/WrP0V0h
         D3faRoS8Zt+13pwONGvEvt4oBDMf3pO+Uldl01Q4MPJKLL7NYRVWZoREztcPgZXvRuN2
         surG55g0NDD35nEyR9Pxd4vixuxHPkpndfQHLD/j1qPY4RNoBg22b58R4rvA6JJJ4rtf
         aqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601356; x=1791206156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4n5cIJubYf0152q28FSh/pocYyVNa6tYRLNKG8jP7g=;
        b=nAInaNtlgVCBXgFU7waaEevMcju1bVOW1MgUPy9nJ+O8AldkNNFaHkBwkxQOJuumBM
         aiksVF4Ezd/YkNgRz1Iy8CsSKKiMfYzKF/ginvJr1q7bubXLSmtdXokbxdrkldHbItNj
         dBwZMElSq4zP1ybw+dT2Ezm0w0DGVYbFktWRwvTp+wwuc94YYNZhej+Uk+AI3MNg4KNl
         USga5Z6uuskP6sKwupRJTv9MoVBceVjU5JX5OAT83x45RSzKzf/TPDxZWvw4Hi32iMa1
         PtREPVxBvUtoyFSWNUsP2qsiVms3elYR27txXCtXvxww7w+EuwqabgK/kMVXSS//HEuf
         9eLg==
X-Forwarded-Encrypted: i=1; AKwUvByQ3cPKq1SzdyryOFnJD6YN/xJEW8EtanFtvnvzcoZZcc07i+cGDREcpLhlAd2eMgPl+3k7ZvVbVjs=@vger.kernel.org
X-Gm-Message-State: AFuF++kDS+S9S6Sc15boq5QrIC3zaVl7k/2LcYKl0n0gfTjTNifDkwq+
	0Pxh0ej8zQfdAjVjm5qpUmARgGh3NdZTOtWcr9ika1IV+p+/fNNYhqpGBoydTQFaxDn6bxaFOVV
	Pn7bGOHamRnOaDXZka1pfYJVWxaUOgVPy+5XbPhJxuYKSkqfscQ7pwxj9UqhjJf3RbwCc446z1W
	rUFNNF4QqXnVzGMgtyXtAAsEcrUnEsqhgg0ydf0w==
X-Gm-Gg: AYBFou2t/N0bDP8pvE/8KHaO/nq1seqSWwWNm8uAILUjjMSX2rR0xWVfCVpLU1pmoKk
	CVN+p5hxwgXzfdjNHx431KQ35+XnOz4bzwPDUW5vcZxYU+4QFjw+NsXHLwUVsCrZXC6VxOCSHsd
	oyRhcVgRK/jUevR87AhcG9tGdbnysvfMk3c5c+aoMBIE85VKutYR9ZtGS+lQ==
X-Received: by 2002:a05:6a00:2a0f:b0:874:705d:f640 with SMTP id d2e1a72fcca58-87e9b89660dmr9757099b3a.34.1790601355565;
        Mon, 28 Sep 2026 06:15:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a0f:b0:874:705d:f640 with SMTP id
 d2e1a72fcca58-87e9b89660dmr9757075b3a.34.1790601355104; Mon, 28 Sep 2026
 06:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923174711.1283986-1-briannorris@chromium.org>
 <20260923104031.v2.3.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
 <CAPx+jO_1qYnN37diVN1=PA0xGa0iSBfXD_uqgSdFpTn4t0zJiw@mail.gmail.com> <arVWVA3lks7SopQH@google.com>
In-Reply-To: <arVWVA3lks7SopQH@google.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:15:43 +0200
X-Gm-Features: AclHuK8aZhiycUM7FNAEkB4H-JU_VDrs399BqS11JuG1Exo3d6B2KC32ckC6HkA
Message-ID: <CAPx+jO_A684fd8SJML9NEmsGzNx2Ge3-mWyQcyjgGP2S5aX1jQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] PM: runtime: Misc improvements to runtime_pm.rst
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba688c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=cm27Pg_UAAAA:8 a=cMkGN2WWBoTvdrordToA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: EpQ9sF96kCYKgGd6-Mznny4a6H3DuVFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MiBTYWx0ZWRfXwHFQZt/eS5l7
 hqH2SEMKZpTFE7ejkRxq/xjJRFi+F2Dsfvl/Uup+QMRIqkKFEEQ6IViVurK5YI2GExtCjYjFF7n
 rkRzP//C79A0QLlrcmhNsNF4EyvHuvuDs94Dj1jEnucicgaxt8B+UtOTo5ic9jdyOq/eB2HxAeb
 IrLZk1QRsiMYxhY1nqmDd5t4HERMllLsNFcWqtzh/AR5xEknubiJq8jbhxh6QGGEuyob5Wb3KWv
 yAbwnOAcV1qpjcu54DpL4daBirSTcJCJSqC6vqe3zr52kSymr6sK4+JEr129nnRl0ERRMjsfLpz
 wT7PGmMT4HFQUyZHHxT1IU5Az0T3RxkMN8hCgbxtOHbsciWdTY+cyhS1n6Hof6dQ85cbxf0WSiG
 qq+SkJyAeEiVGTEpomLJart2eYsBCcYmhL5pDkwtVRzxoAWzqN+udFgr83PXep98PbZoiw2mryf
 Hck2UHljWa7nQPi5C4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MiBTYWx0ZWRfX1q4zIdv6qgs3
 90v2lSVvPow14o2pKD7lyAvAvn/GOdUR2F40eCIVu6Z0s8S30FAbMhXIeeHyyQKbju0mWUPVAMe
 sZv+zMqZNb53C7qB0i/RHFyfmDwbdhg=
X-Proofpoint-ORIG-GUID: EpQ9sF96kCYKgGd6-Mznny4a6H3DuVFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280052

On Thu, Sep 24, 2026 at 6:56=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> On Thu, Sep 24, 2026 at 04:01:00PM +0200, Ulf Hansson wrote:
> > On Wed, Sep 23, 2026 at 7:47=E2=80=AFPM Brian Norris <briannorris@chrom=
ium.org> wrote:
> > > diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power=
/runtime_pm.rst
> > > index 39fdeeda7a1e..352cdaf0650d 100644
> > > --- a/Documentation/power/runtime_pm.rst
> > > +++ b/Documentation/power/runtime_pm.rst
>
> > > @@ -315,7 +319,10 @@ removal of their drivers.
> > >
> > >  Drivers in ->remove() callback should undo the runtime PM changes do=
ne
> > >  in ->probe(). Usually this means calling pm_runtime_disable(),
> > > -pm_runtime_dont_use_autosuspend() etc.
> > > +pm_runtime_dont_use_autosuspend() etc. Alternatively, drivers can us=
e
> > > +devm_pm_runtime_enable() during probe, which automatically takes car=
e of
> > > +calling pm_runtime_disable() and pm_runtime_dont_use_autosuspend() u=
pon driver
> > > +detachment.
> >
> > As I have stated in earlier discussions at LKML, the
> > devm_pm_runtime_enable() API is not entirely easy to use correctly by
> > drivers. It means that pm_runtime_disable() gets called at some point
> > *after* the ->remove() callback has been invoked, which can cause
> > problems, unless the driver's ->remove() callback has managed things
> > correctly.
>
> Yeah. And I think it's rare for drivers to have done a thorough job. A
> rare exception: I found commit 2d90ecdfa326 ("ASoC: rockchip: i2s: Use
> managed hclk and runtime PM cleanup") an interesting outlier -- it adds
> an additional devres teardown to power things off afterward.
>
> OTOH, between v1 and v2, I chose to tweak one of the Examples to avoid
> devm, precisely because it was committing (or hinting at) these kinds of
> mistakes.
>
> > My point is, the above makes it sounds like it's easy to switch to the
> > devm managed version, while it certainly isn't that straight forward.
>
> Right, I said as much in the cover letter too:
>
> (possible future work)
> <quote>
>  * Adjust the way devm_pm_runtime_enable() works, specifically for
>    remove()/teardown. Currently, this is very hard to use correctly --
>    some common driver patterns may assume that a device will tear down
>    while RPM_SUSPENDED; but that's not actually guaranteed. Notably,
>    this makes some of the "Examples" section fairly tricky/subtle.
> </quote>

I think having some examples that *don't* use devm_pm_runtime_enable()
would make better sense, as it would show what is needed to take care
of things correctly.

Stating that there is devm_pm_runtime_enable() available would of
course be fine too, but in that context, I think we should point out
that the user really needs to address the ordering problems that get
introduced when using it.

>
> Would this be a good moment to pass this possibility by you? What if we
> taught the teardown to force a device back to RPM_SUSPENDED? Something
> like:
>
>     static void pm_runtime_disable_action(void *data)
>     {
>             pm_runtime_dont_use_autosuspend(data);
>             pm_runtime_disable(data);
>
>             // New code:
>             if (pm_runtime_status_suspended(data)) {
>                     int (*callback)(struct device *);
>                     int ret;
>
>                     callback =3D GET_CALLBACK(data, runtime_suspend);
>                     ret =3D callback ? callback(data) : 0;
>                     if (ret)
>                             return;
>
>                     pm_runtime_set_suspended(data);
>             }
>     }

pm_runtime_reinit() is already taking care of some of the above.

Moreover, we have pm_runtime_force_suspend(), which may fit well for
some cases, but not for all.

>
> > Not sure what that means for the documentation though. :-)
>
> Well, I don't feel like the part you quoted is a problem. IMO, it's
> totally fair to mention relevant APIs even if they're hard to use --
> there is no part of the runtime PM that is easy to use!

Right.

>
> But I'm definitely trying to make things easier too. Ideally, we can do
> something like the above to make it easier to use. But if we
> can't...well, I guess I can try to document pitfalls better -- possibly
> in the Examples section, or maybe an extra note in the above quoted
> area.
>
> Thanks for looking,
> Brian

Np, I will try to help the best I can. I certainly appreciate the work
you are doing here!

Kind regards
Uffe
