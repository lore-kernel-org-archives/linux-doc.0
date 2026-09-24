Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750737D133
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258476; cv=pass; b=ERDyXKKiN46o2sVbsslWATOZVoRADS/3ggcxLEkMl5uNH+ChYeK4tKpHLRcSwv9AsxQyHELKu53dGyH442YhKdCmqFbARrl/hvIHMfOVVH9Wxlg1NsheQ/EMxXT7NoljqK+dOKwvA7kvbBlmqPNVhe4jPQ6vCW2w8YgHiVDWTtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258476; c=relaxed/simple;
	bh=I3C8+LJfgclA827uj4Soi1Cyi3ZxJhmbO0Ll3OMgiP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWMzAEoP69K4JTWoIuXUxe155NG8HdnPMw3pFGvOJ1gAbytesYMz2WdO7XG8PrYMNoBU8C9rEVRJQQEQFJfna0squDhcI8Wm174bH1YnutBa5XSMWduLP070gC3MrJtxCdZWSfNmG7Trh7XrMRD4eFANsR0Hq+gjH7r6/2/mVH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/qih16h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+GEsJXD; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/qih16h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+GEsJXD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC52fI2002546
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 14:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9BiUjTBG1aiuSWd/O3sMeTOxrUy8pb7N4MCcYUpZCs=; b=J/qih16hvmWr/aDJ
	iFkMZA8r4dRevB2A12ZnmJByLJBKINDtIxv4oWsM05cb/HhtslyZ5djQPl+XngT+
	nM1zH47Hu9OtCV6qNTU/eAzAB9Vr2MPqqqX/19Ec6/mwSfpC7c8EqHoWUCsglvsO
	GpPOgY2f7r0o2/uys27jhFEK19uzrFfLCm8Ri1exIBGPhdrrKbEF67+SK0kS5RMd
	OpRldW0hkaSOee9uuYohBdNW1FhUz8iuldXx45dQJO1+zIOUynCnpbZehbvMX98e
	odTZP0rfk5hymgd2T4PWuK2FY4SJePCYZMtMM1oyzI3sBiR9XFGHK12mjyi8Swfd
	o27FvQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrbvn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 14:01:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso1201678a12.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 07:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790258472; cv=none;
        d=google.com; s=arc-20260327;
        b=EkgxzSV31pIpMS8yF0YMGoDuianGHSxrNNjhuGAXB4go2JyzoP5OaVaztteHffTJqB
         6uAsw7EqmraHljWIMcmnGI4HBNWVvc3qq5HkNx/ekjEVys6XaXVblVpgeRhZF39SUbwp
         99I+8NGt3GfQmHkCmyGX0VBAuoqPNev0hnfWlDhYs3Az/FDsHlxr6mTkcJlMXVfSuiOL
         ivRiaYdfYK/hD5Ne6QJmuZ/2vEAbcXpPEPftMaNuq1OfQAELb1qh+EUisaWrMZv1ttiC
         AMyK/1aNtKsBwMKecWFVAJCzLV5opcC0w/Qn0s92Zzacp5IbQeFxxbqL0x2uESRKygsC
         qBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K9BiUjTBG1aiuSWd/O3sMeTOxrUy8pb7N4MCcYUpZCs=;
        fh=EuPQ7DE9eM0bQlOYdVIkK6qMPmkCmX8n/EPpnAomOVI=;
        b=Kl1bQjRTt+rwQrKwoRxM9nm9jbJwaQ5nloz7FXg4NjLcrC+MfDBIl+mDUrqgE09AFS
         muDBrT6fHFOPdGDmJWtT+h69GCrQXZ242f66Ps8CyjcXPB+J1gIq97Qjz41FXDeo4jWx
         snjsiuyyZRj0OKv37ibHFpNrUg9jCHxiUankMAQwbDAWGDi82HoOLKYYYfEd45xNbkIE
         kwx8Pd70RoZ8eiIg3gLBRs8hCsvNBGBij2pisHkaHLKSCFR+AyH4iep04bnolkjjWCWX
         Lb1Ph9gyw7Ofwy/lXF+3Am1AtsqGkFUbsYDnC1NZShOGHjkc+RgxHoswRDLMg2pMOrP4
         yktQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790258472; x=1790863272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9BiUjTBG1aiuSWd/O3sMeTOxrUy8pb7N4MCcYUpZCs=;
        b=K+GEsJXDfnXz7xu17h9nCACljjB+7WOrw90y6LrbUS12FTUp7ujDM1i/775n5Z5ie4
         OP0shQX9IFaxx8j2a8WV5kG6/mI6wyLhAfvb0VFp7f2L0QYECalG1AapIDxBzNaV3uSu
         6MX3DiFRDrZ/5BRHUuzcdVcV/RJwJvBsd+U+HPshIOmbu88IBWFd/DiiPytpuNwxPq/7
         y/eysp2CqCbvvh5X79Nr3fjeg9JBP3sbO0hHhzmUG1g37cyTtGMS6cJE2n8vjeZ0rTMn
         zbrdoKqlEPN8AmPirvRxjVHKSH5qT43aD0l7MxUM1H1SkfMbR4VoxwxHXue8btwoWo7L
         43ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258472; x=1790863272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9BiUjTBG1aiuSWd/O3sMeTOxrUy8pb7N4MCcYUpZCs=;
        b=esi4hzVjVqONl4ccNnXc3wybi3HEQbqNjP8X/j1unxljZSVEY1tcurdmp1Q5VN5J8c
         SRwOoDC2yp8nMGgmyrG8AzFCaiwxYLrAcEiRHIOvT7WYoinc7ZrYYOYNXjM4g5SCYayH
         fmrLYdtJG6VgudfrkHEJKSHR0JyNqP5v9PlyRdFFVfrUbG6dSoWXeEiv6rdRMvMHNY8r
         tPuYrpJJ2Xefu18DF/zBSe2yLWhsC9f2ljYQseU2VoXQXpyHgfw+HHOtK6RHySLARIFA
         qcJFckZ1MWY+wwjFaFPZWDmi8odDzTWWejdl5XhLjkuKELonF9aTnxn75SYvAN4aqQou
         05Aw==
X-Forwarded-Encrypted: i=1; AKwUvBw6Uh/y2hoL2F03+kVRbgR/qL4+VXX95mJqHzi80kBj+L6Z6MndOIVSAPDxD41P/cYsV9Ego/qnNtc=@vger.kernel.org
X-Gm-Message-State: AFuF++lTged+uV4I39qIgb8krXZP44VwYfnPtTVm6zuMUgi7s8pHRJyo
	7dFaQ+fJyF/LtA3EkDpfJ8BvrV/lRCqmgMG6Ze3OCebcMUxMecQA2fTZPiYZpsRDlY8Ez1Lx9PQ
	50GwlFHyKxZBmAtJzZj/OL5R+cVA+Ois9+c5opsTDRYSwhSC4N7/uLfu0u0CvJ8UdxLsf/zLaRt
	YSpMwkVnFBTVEXKvnuIcJcomfV9ozlDOl+nViIqw==
X-Gm-Gg: AYBFou0wZ9pRjeQonP6Qllf59knVR3bgAH2jae36MZ4zfOK10+a5oLbQbNDl4zUYN6o
	zi0ZfDyOJq+5P1rFx/wMeX1UADARofbZQe31m93tKSplmwB5ms8CU7g3X3QTVnUbd1BNtEcpV8H
	3yHoUJAOVVkwdbLvaSbjfwL8ENNWhIZFfvE0j2yJq6/PEndT1G/mtiEo9CtQ==
X-Received: by 2002:a05:6a21:9211:b0:3dd:a009:317f with SMTP id adf61e73a8af0-3de0e8cf50cmr2292864637.39.1790258472071;
        Thu, 24 Sep 2026 07:01:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:9211:b0:3dd:a009:317f with SMTP id
 adf61e73a8af0-3de0e8cf50cmr2292816637.39.1790258471383; Thu, 24 Sep 2026
 07:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923174711.1283986-1-briannorris@chromium.org> <20260923104031.v2.3.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
In-Reply-To: <20260923104031.v2.3.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 16:01:00 +0200
X-Gm-Features: AclHuK9_LJN_Pz_e_vxq4yQal5Z7fnTX7prwt3aNxfp-JOq6nVdTbmWlsg1EK9U
Message-ID: <CAPx+jO_1qYnN37diVN1=PA0xGa0iSBfXD_uqgSdFpTn4t0zJiw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] PM: runtime: Misc improvements to runtime_pm.rst
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX6tyKtHfd5LwD
 ORe2VPu2WU6zZ93TkWSJsoyNQB34lvKrFQbcl0ZP9dTMkc+PFAI9ydw6ji0un/srgoRCXzkdSd+
 4N4JscB/Mki4hNGBHXraEqm0txF3NR8eoNHfMsxKOfWlghQQ2Ro4t8PIf19IrPyNzQVprC4I9WT
 Iv5vmiWxIld1Y9bGcMCUrkXEZOXyBkK9JeooOJ4k4tzFde9HShjwDXcN402mkLp0BxmVXcE/Znw
 Rcu7v+f7o4zovo8vZzFDzcn01a0KuDk/73PRzrkq40sBMt+7waZgINSi1Vus9tU8m+x8augqQHr
 Y7GvEeGVHQnoneyWsVwdGyYK1JZ6MMrZRWM3tR6q/iOLC9CIXOIHnqp9TmPmfwEU/sb2PdgqRQg
 L6iCSyWe/1ZTDEyfH3HEd+Q+oLXclRHLmjF4R6HMCIltb8fsL517eTfBlcLl3DRYoSBvsfj1Z36
 6eEltLGH2vZLhmqoizw==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab52d29 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=cm27Pg_UAAAA:8 a=J8m5VRO1IUQSW3TZF-oA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfXwy8Ahq0y1Fjq
 sO9TFPdKj4Amr0lBZmmmupPzMxR5PEZllDzY1cgJQgwQaZWBySYB1zqfrUlSPalaHyyilG5lJVv
 jT1AqMwmWKF0pyPn1vUU827nR08yiAs=
X-Proofpoint-GUID: RfMs5FIy8u0ImyVgewxtJFaFLR8b9w9x
X-Proofpoint-ORIG-GUID: RfMs5FIy8u0ImyVgewxtJFaFLR8b9w9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240057

On Wed, Sep 23, 2026 at 7:47=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> There are several small errors and omissions, as well as new updates
> (pm_runtime_resume_and_get(), devm_pm_runtime_enable()) we should
> incorporate.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> (no changes since v1)
>
>  Documentation/power/runtime_pm.rst | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/run=
time_pm.rst
> index 39fdeeda7a1e..352cdaf0650d 100644
> --- a/Documentation/power/runtime_pm.rst
> +++ b/Documentation/power/runtime_pm.rst
> @@ -238,6 +238,9 @@ It is safe to execute the following helper functions =
from interrupt context:
>  - pm_runtime_set_active()
>  - pm_runtime_set_suspended()
>  - pm_runtime_suspended()
> +- pm_runtime_active()
> +- pm_runtime_status_suspended()
> +- pm_runtime_enabled()
>  - pm_runtime_mark_last_busy()
>  - pm_runtime_autosuspend_expiration()
>
> @@ -249,6 +252,7 @@ functions may also be used in interrupt context:
>  - pm_runtime_autosuspend()
>  - pm_runtime_resume()
>  - pm_runtime_get_sync()
> +- pm_runtime_resume_and_get()
>  - pm_runtime_put_sync()
>  - pm_runtime_put_sync_suspend()
>  - pm_runtime_put_sync_autosuspend()
> @@ -258,7 +262,7 @@ functions may also be used in interrupt context:
>
>  Initially, the runtime PM is disabled for all devices, which means that =
the
>  majority of the runtime PM helper functions described in Section 4 will =
return
> --EAGAIN until pm_runtime_enable() is called for the device.
> +-EACCES until pm_runtime_enable() is called for the device.
>
>  In addition to that, the initial runtime PM status of all devices is
>  'suspended', but it need not reflect the actual physical state of the de=
vice.
> @@ -287,7 +291,7 @@ enabled earlier by calling pm_runtime_enable().
>
>  Note, if the device may execute pm_runtime calls during the probe (such =
as
>  if it is registered with a subsystem that may call back in) then the
> -pm_runtime_get_sync() call paired with a pm_runtime_put() call will be
> +pm_runtime_resume_and_get() call paired with a pm_runtime_put() call wil=
l be
>  appropriate to ensure that the device is not put back to sleep during th=
e
>  probe. This can happen with systems such as the network device layer.
>
> @@ -315,7 +319,10 @@ removal of their drivers.
>
>  Drivers in ->remove() callback should undo the runtime PM changes done
>  in ->probe(). Usually this means calling pm_runtime_disable(),
> -pm_runtime_dont_use_autosuspend() etc.
> +pm_runtime_dont_use_autosuspend() etc. Alternatively, drivers can use
> +devm_pm_runtime_enable() during probe, which automatically takes care of
> +calling pm_runtime_disable() and pm_runtime_dont_use_autosuspend() upon =
driver
> +detachment.

As I have stated in earlier discussions at LKML, the
devm_pm_runtime_enable() API is not entirely easy to use correctly by
drivers. It means that pm_runtime_disable() gets called at some point
*after* the ->remove() callback has been invoked, which can cause
problems, unless the driver's ->remove() callback has managed things
correctly.

My point is, the above makes it sounds like it's easy to switch to the
devm managed version, while it certainly isn't that straight forward.
Not sure what that means for the documentation though. :-)

[...]

Kind regards
Uffe
