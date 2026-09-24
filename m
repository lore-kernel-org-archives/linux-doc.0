Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126338D404
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259227; cv=pass; b=neN0KHELLDdbt9C84Jtj58tD9JJM5xneEULEiOrY51Rx7Leq5YR3ECcLfMPo9nk3Gb727uzSLuGX4OJ+tw2ZQedTMxRDfCQivFC4hpM+c4YbC9Wm1U0N0KrTv0CHq8SEcJgPKLaK8FnNffS/vdE9y9HsgKJF0F8+sUVR4up9RAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259227; c=relaxed/simple;
	bh=TZk4Jmgk/VpnmPm93MEhhUcknbZQodVVcX6bnE4t8DA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G31DO0z2U4BiW7fwudx7IzKmIa/KRt8RpHTyGdAHNeS9honFKpqCI7tewLoTLerzmxTZ38NEqJIIHNG9Ze277qPdblZv3dxQYscBuo3VWNW+6CbS2REqThOh3SAY+GIcoBYUekWQUV5RUU0OGvbJ4/G1yt9Vr1bSkGGJ4PmRAPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hzm1PgZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gg0MYv3X; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hzm1PgZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gg0MYv3X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4eT21437096
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 14:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMXvHHJQ4qPRTxyYPNHNX4f3X9Wz6eUX2PD7XhGonoY=; b=Hzm1PgZUzUHKsajD
	PKol7gqODFTA9xR64oCo3cyrBuPhVdgwZReLp0WKEjP/8C55W0uXIUagnKAkWSzT
	VugqebCXeji+q/qabCvayQBkclI51keFHDFv1nElElxDsoj3l4/J+4j8DVXFkI3m
	U243E/yxVJ1wGzfTrI95d7GQ8hds5mJ6ul1on1sD58c2pyNtf42TT5Lidc7um99w
	EIFCzIAfSBzcLtBPpaGvTwsKMN8cPDqm7utoIImynIH+3OtpRnIK0O/bxosHvnrE
	q38jRvVBAL2biWqLve6Afm7o7vDzMdcPZ9+9ZYUUKCUNXdeay7q1ae5mFOgpII2R
	oMRQQQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7rxvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 14:13:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so3258851a91.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 07:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790259222; cv=none;
        d=google.com; s=arc-20260327;
        b=MXuehyxW8Pej/l+fiU4NdgmqpgmMnDPeeBInCRbf+sDeouASXjTEMGB5uv8BxoczZw
         CBg3KBTzJLu3V81snWEx+7rPEzVyUehZfaWDB9ads65TWFEG91sUvl2iWmc7JT1vcDMI
         tgsMSFhRd5mcgxbeAg3H3qUInVwIAncMbBIpCi9kD8+VBN92NZzoCNKaIfyqTNqdrCX5
         RjCkny9WDmq7+gmD/8+CLIHmTSxwg6kf47RJFfPya+ScfHjCfpuOjYqHbxHN++0ktl4m
         Kq51Ow+47NDa+iznjtX9/rIDGfHgojgbBQMTHP1dPJOAR2R21lNsiBvxFE4rnRpu6eO/
         ucbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oMXvHHJQ4qPRTxyYPNHNX4f3X9Wz6eUX2PD7XhGonoY=;
        fh=ngaUf8FF1VLndvnAhX3wknaafLSYt9Bhtk7HO2TFauU=;
        b=o1nL8rkPOJjC6vAOJjtBX12kpI2gX6HNgUpri3FhbJP85nn3hkOb1HABCLGqyxzVVl
         luZqiduxDJgegs8ZX0gQ2GDCDFRBY0ywbE6wflHXLwU7AhOY4GBtbwHh0rbysxJQ+JQi
         dG/yEIn/cufBQ0UbBYhsm2/M2+JU2c8W8BBMb0snLImnFvRp5r5sJkGNFFg7vZeCJl3e
         oq33TPkN1cCYEMA/VFBRbmj29cckrsz2g6y752oO63hrgTiKllU+aX72SRC/v4uSrE+L
         iFo3GFIZpz8x7LpcBzQMI+S50WSoYHQVgFXwDVs1dI+MQf7cKgpeuBHbmN9bsF0ivQcr
         190g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790259222; x=1790864022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oMXvHHJQ4qPRTxyYPNHNX4f3X9Wz6eUX2PD7XhGonoY=;
        b=Gg0MYv3XN9stA3bviMfI1XZLDFxBLIy2E+1HmzyMXqTdt51HHSJhItuqb+YxEszPDy
         Gthv+Ho9um2qQVWyRZ6n1STJPByDDLbbEHMiPQEp8H2CJNZTBH1EPuWwPHAlWRfg+CgP
         y4YCPl4rh0EBojsjnh2P9EjWFX0iv37oLNbw5E+xWn3xGKTVvy1HWHCnOqTCdP+yEt/o
         4TSI2qtUrvvb0uuhjzuEc+WPtKkPzuP7flFr87KfihYOh1VkBFa+FwkG+Oyeq/jOfjGL
         gnYppmJ17GCWGzmeN2oqjOb+k3eloVlTuTfNk69kzcBpVZNNVCjsLVPM6ZrPjmVvkgDi
         88DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259222; x=1790864022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMXvHHJQ4qPRTxyYPNHNX4f3X9Wz6eUX2PD7XhGonoY=;
        b=fwmYcR0xXqNZEn6BulxcgEdi58i5MhODXQ+L270B46CJvlxrKj7ElXxEvCnW0c1Fvf
         aM+eYsXkfMHtBJhw2aqs6ob2gFas9zT1djplCPmkrYauhdjRXpxZ0z+GROXt77AWYxpi
         KGtFv9gOIbqRtUt/pOOgmMrdCPwCY5R+XfKkLn0uxtO9tXKhfacU55I98xBThmkndZWe
         4AF7IZXow7nvcXTe5i9OenpfZGiV6Yp4vXPp0+vJnO8L5mrO4XdydFHJqZaHe7SBb9Vo
         UZPCyLXa4tyYCl3bNooF/TkWeT5q2siXbwK9LwhAWKQ4U2FcXhRGL5BAuICzNvlx1UxZ
         aeuA==
X-Forwarded-Encrypted: i=1; AKwUvBzQ2vfZmhQbFO8YW2u5jzUIYU2wLWlBtFg4lleE+Y4t9V9Cdcir5T9C/YBukGZbLivPr7OHS3v4yeg=@vger.kernel.org
X-Gm-Message-State: AFuF++nDOZEzLxek17Rneik0yApOIwAQ+l9YhxS/X4qPtQE3iWMMt1WU
	IsdrOYuyVRjLWEAW9/vnr29F0N+zMFRaqIYkgqSVp00qTUizJp5Azr7gHyunh9YSTepfp6Ojo7H
	at3JZDyZZnQUgNVOPrcVRNYBxl5XxkJilH1m/4zRl1mTexTD1BbNbKM3LpiD2vjEcKMW4nk2GQP
	sx+x+OWsb1HTRa4Df1BNRiFBI9+LJ/aB1z8vL9PQ==
X-Gm-Gg: AYBFou1UHMTvESf4MpxLIerIqyHOXk/wIxE1A2Yd7PP+rR/1Y/nhwnKHRApDB9ADzif
	OnBrKcCncCWlXENoe+LHIVREwKppEQoH6j4iWJgPfIsJ8pvpCFNh4Uybp0Qn39O+4laYbRLofsw
	IgoHe0LE2S0Sf+kZnU1vuute73lmA7mCSZNhqjHV39vBJXyPFc2ECh0sL/yQ==
X-Received: by 2002:a17:90b:2b46:b0:39e:6c69:9b94 with SMTP id 98e67ed59e1d1-3a09924dbc9mr2318892a91.57.1790259221731;
        Thu, 24 Sep 2026 07:13:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2b46:b0:39e:6c69:9b94 with SMTP id
 98e67ed59e1d1-3a09924dbc9mr2318859a91.57.1790259221076; Thu, 24 Sep 2026
 07:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923174711.1283986-1-briannorris@chromium.org> <20260923104031.v2.8.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
In-Reply-To: <20260923104031.v2.8.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 16:13:30 +0200
X-Gm-Features: AclHuK-tonoW4ObXIcyadoslI1M0Aw12A9Em35d3sj-cyYhDBVuUQ6rDDffvSOw
Message-ID: <CAPx+jO843h9bOeWNATHm8D2afbniQsX7WECJzCxmfi9ZcH9+5w@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] PM: runtime: Add Example Driver Patterns section
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Kwibo7C-cU03w5qUIojp8kTEtSc_8PQI
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab53016 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=cm27Pg_UAAAA:8 a=qxAFjvzqHY3AwNVhwX4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1OCBTYWx0ZWRfXy6Icn6odPRfO
 GxEfR/BIKYLuMs0cA6EYDwxluNCS+I4LMe7/g3wT4BQRT2yxjaWeWGdOjMfkefDNucLAlOJ4aJZ
 daJ0PJb0qnQDtOTKZokEnUKlr5P6hkb8c3c4n0cMNEqw47YrqiPj7othW8/LgAu3G3A0qZrYijr
 p/sLo1lwomXmNrNn2osPrExo3zDiUwEKpqYqE+wZ8T2dZaSlYMn4Rmf+Dgzu8JwaB/ee5/bxRO4
 i4D1mLyd/UQwsiwyylPBQwAENm+1UgkRS2umyQAeUD56gWhnooAAzRDDP+idyGTXhYcUQRvPxr8
 XlMBN1kEZg+HTpYxUxz6i443mLI5VP4m2lNAGFXj10lQNjmbDfCWTciy/cls2/QBwpk8KSRY/Ae
 O5rs056+hN15dZP78kAcrP5Ij3/QFq3NM4qM31nkVWapYfsJg6HM/ALPDlO+teLMgZvi/pLNMYV
 DxUEPui7nPDfKZxF+gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1OCBTYWx0ZWRfX/bRHIILk0TeH
 7kB2uclRtJ2Pc9EE3dBDQrXljKT5gD3AtsfLNz9fL1iEQjGJOsSfF6eR0Gtgennu3KN7G598ac0
 CShPWV73HJQPIS4305SAAyv++K4h37c=
X-Proofpoint-ORIG-GUID: Kwibo7C-cU03w5qUIojp8kTEtSc_8PQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240058

On Wed, Sep 23, 2026 at 7:48=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> The runtime PM API surface is pretty large, but there are a few common
> patterns that many drivers should follow. Add some illustrative
> examples, to help guide the most common audience for runtime PM docs --
> driver writers.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v2:
>  * Add appropriate teardown to "Probe with Hardware Powered Off"
>    Example, as the remove() + power-off behavior is subtle here, and
>    easy to get wrong
>
>  Documentation/power/runtime_pm.rst | 367 ++++++++++++++++++++++++++++-
>  1 file changed, 366 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/run=
time_pm.rst
> index 7bb64d793cdd..3a615d2de103 100644
> --- a/Documentation/power/runtime_pm.rst
> +++ b/Documentation/power/runtime_pm.rst
> @@ -641,7 +641,9 @@ The implementation is well suited for asynchronous us=
e in interrupt contexts.
>  However such use inevitably involves races, because the PM core can't
>  synchronize ->runtime_suspend() callbacks with the arrival of I/O reques=
ts.
>  This synchronization must be handled by the driver, using its private lo=
ck.
> -Here is a schematic pseudo-code example::
> +Here is a schematic pseudo-code example:
> +
> +.. code-block:: c
>
>         foo_read_or_write(struct foo_priv *foo, void *data)
>         {
> @@ -707,3 +709,366 @@ pm_runtime_autosuspend_expiration() from within the=
 ->runtime_suspend()
>  callback while holding its private lock.  If the function returns a nonz=
ero
>  value then the delay has not yet expired and the callback should return
>  -EAGAIN.
> +
> +.. _Section 10:
> +
> +10. Example Driver Patterns
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +The runtime PM API is large and complex, but most device drivers follow =
a small
> +set of canonical patterns when interacting with runtime PM. This section
> +illustrates standard patterns for device probing, performing I/O, and ha=
ndling
> +interrupts.
> +
> +Probe and Initialization
> +------------------------
> +
> +Basic Probe
> +~~~~~~~~~~~
> +
> +A driver that powers on its hardware during probe and does not use autos=
uspend
> +can initialize runtime PM using device-managed helpers:
> +
> +.. code-block:: c
> +
> +       static int foo_probe(struct platform_device *pdev)
> +       {
> +               struct device *dev =3D &pdev->dev;
> +               struct foo_priv *priv;
> +               int ret;
> +
> +               priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +               if (!priv)
> +                       return -ENOMEM;
> +
> +               /* Power on and initialize hardware registers... */
> +
> +               /*
> +                * The code above left hardware powered on and operationa=
l, so
> +                * tell the PM core that the device is active before enab=
ling
> +                * runtime PM.
> +                */
> +               pm_runtime_set_active(dev);
> +
> +               ret =3D devm_pm_runtime_enable(dev);
> +               if (ret)
> +                       return ret;
> +
> +               /*
> +                * Alternatively, the above two calls can be combined int=
o:
> +                * ret =3D devm_pm_runtime_set_active_enabled(dev);
> +                * if (ret)
> +                *     return ret;
> +                */
> +
> +               /*
> +                * Upon successful return from ->probe(), the driver core
> +                * automatically executes pm_request_idle(dev), allowing =
the
> +                * device to suspend asynchronously if its usage counter =
is zero.
> +                */
> +               return 0;

The above looks nice and simple, but what happens in the error path is
equally important.

In principle, nothing prevents the runtime PM callbacks to be invoked
until pm_runtime_disable() has been called at some point *after* the
probe callback has returned. This needs to be taken care of correctly.

Likewise, as it's great with an example for ->probe(), it would be
nice with a corresponding example for ->remove().

I will have to defer reviewing the remaining parts in the $subject
patch, a bit limited bandwidth at the moment.

[...]

Kind regards
Uffe
