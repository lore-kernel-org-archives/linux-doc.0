Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C571F1537
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034983; cv=pass; b=ojpSuGkf6leRRL3+ZDO2Ub45v1L5e9QKcrtBfHWR09uAH9GKOjcpOExvpaKpCGBLt9BOs73vrLKJpONft+RlqEvgQ3PuQa0q5aLYPtS2gnD/Ni5k8gQBvj92ISoDXmqFG0Hod+YC4//fOFIugKt4jXatOlxlQSqx3BRqKLfg14g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034983; c=relaxed/simple;
	bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5E+NepYULisSrXdEOmN9DQ5dzhiR/BdO8O1ZOiIegladsO7xeN7r5FbpBqw/hFQSt5HqzJIkV/QxoFUnzFT5+bO7uZKNcK9pWJDD9vA5abSHi7jwS3UygyToyXSeF6XUZoB4V0wltT/AKoJOogxiRd6Qx3IR8Vne0HkR0n/4LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeDP1noV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cioL0yS+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeDP1noV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cioL0yS+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNoqJ376976
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=; b=jeDP1noVY97TJJm4
	cIhajSXeAsAmHOxUZ5w+rrnFsmDqOKfN4qv1NciKwvl0a9vv59ESqt6/YuJgOXKd
	2U4f3xsKnro776B5eQXUkzzonn9zUj4EjUY0CcmNrVrEgX1hsU92QRCgcXc88Zk4
	AtF76m99A0GiWR0qvmuA/OQHihEj2e1+CtLRE0wEH12PxEsaH+fBoJe1xohiHUcX
	R229DzrrEXb5VIR1CijlNq+5VjsfmV0mgJza7rCEwLCI9oqIAHjuyOO3YurOejU1
	OXk05tjGT7idOG9xzgxgye2BrDtcmOkjjdNsDeOVdRx43SKY0RtvrJ1yvDvre5qj
	UD2uKw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4af2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:16:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso67578686d6.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 06:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034980; cv=none;
        d=google.com; s=arc-20260327;
        b=nSzc272T1GxE418rymD+IiQhFh62k+0O8xZVs9jhvdGiQMIVO7OAzIK8gL3nTIrMav
         fegvdZwK7CGJ7mII8EULiivkfWnJqYHy7q3aU/GK5oRnwHiyMHKYT27YZZMBMF0Xr4iN
         N5RJC1EUL5QRlwE/mR4Mna4R4HLW3Fn0ncg3lmJLmhCh8P6hKtLBeBQ0QIAWTdBg+ulM
         /wdbzr59+QGyN0xmX4ZIzf+QXkkuWxAyYWJNPcsd5xXjOXKt6JhMGwsYn5TcSGJ/PMLb
         TyAr5/XQQVwAL6RztEORExuGGvnw7aa7N9z01JlUZn0a/vzLKrDvPHnOfIXwNr9Vmp61
         KaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        fh=Sec/hEDCvVe6mvRffCxClT4BWwyIgHlwACxfLVs1cdA=;
        b=TRqCyRBMmiQTeboTqMcAQ/+ccdEoFvj5tR6we05eOmGp/4gK8dQurGsEZopY+8tuwd
         5DIcont67/vNem7dHEblbRQ1tABG8+dC2krO5mIptQVz6WZKRNu9flCkhbhkg6ms2uGw
         vHsmptOdb4YO6vWjorqkSz5jyn6dW462szlzEjAjuqhoVvyx+cu68/4IcOWLotYg/CWz
         pwFQOY7fEimNZT+tZtjJe9kBWs1aFJlSkYIoGEuokomtLRWxDj1x/S7vRhP8BomBVBnv
         5432gwf5XWxzCDWts2bsuETW02J6+ENenNZcNqXA2avDy+1QZKTwj0+NlVd2/3UTobuq
         97rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034980; x=1784639780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=cioL0yS+m7iQ+Un4y9KPRfCvUwbZxC0xQRu+SZmRcgaQHlaMpOuyJETcrk+xsCydJS
         rx/JXZ0vlPSJ46zxZ/moLbkLzEFFO0TXJ979XZx4o6mPym2i9kzroOI5kygxFEe6Bi5R
         LgVxo61fu3nXasj+kizAbtRICOyjFgRCjtp6XrZ7uzeP0UIS813j7bgUxON3fRhe9zGY
         e7doqxvCPS1+FdTC+4IGTzIMO34POO2/rH3keQo332wYpg9bskUCjm7FIcDtJLzWa07O
         /D1x4xq5YKRCc7P8jD/k0p8unDHZTD20lZwtiaqEydbmFKT/XzVNkmPqitS0BB28LQTQ
         x6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034980; x=1784639780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=ZYfmA7SHMfEU/d0yb72WGsX3Cq2n8wQ7v4E9P/RnsoPesewRPzixvC2xOLdDOqurzx
         +Yhe+jziWJxOsfnQUCH2IPf6aln/l/EW3dZdL/JwQ+tPTfu9NLnk4ZWChIyGfg7LaOSH
         On8xuWvw/beyH6iBaMvLTragzhOebXethR7oKINFrnm8PpI0e7RWQSZ5Aa6SLz3RmUuL
         GCvCQxUIQ3KSg2ExnOIgK6aITs7jlPgsn2G1n/WDP8yzB9exYcA2wU2CrgH0cpd+oCZD
         nsJVCMJ2UUasDDr2S62EUKDRYHYnNa1CtIGhyv41gRoCYxspx1WPkeny5Uqi4GyByIUi
         k35w==
X-Forwarded-Encrypted: i=1; AHgh+RrV3Z5x0P4HRhZ+xG0lZ8/ijAXEHEt7+10hDHcnMwpcOyTHX0NEDmAQr29QBzES/ljTiZLadJV5pSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIQdjSDyoZk81fAcPz5tTcuyZjUIhQ21leIPZAy3rca9uoRQbd
	ZtRsRESUY+eR6abQqIKRQqe7gG9mcWHBv3XF+JYmG1vSWJu1F2g1z5KlnPKgnguqxftqQkOX5Hp
	jUrZefw1QNt7ZUz8vAOap6j6XIgLREC7x5NC56HGFU954qXTyeLKMc9/Pxzy8jR+Y0vZ2/m+A/R
	vGuifq0joUL1A/SGGlnYXtLWEENbpyN9l9K0Fegw==
X-Gm-Gg: AfdE7ckMmBbtCI4kgNHmCPOsZkgQAN2HXGMbxVHi1HfKtb7pM1/AskQxarr6paGIGYb
	SUhVUN2kFzOIZWYnXpBIQjLEDTUx7x8KoJEgNtcuoZsQGkqs3qK840zOYceo+l3rR3fNOzdLXuu
	O1qDZlInmRPyuhPbE+k806vw0laMCSX0Ypj9PUwwKxF3vGPxOFOPuHY/y8P/lqXA2H6WNc
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-90747d19fb5mr45880306d6.57.1784034979491;
        Tue, 14 Jul 2026 06:16:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id
 6a1803df08f44-90747d19fb5mr45879656d6.57.1784034978901; Tue, 14 Jul 2026
 06:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
In-Reply-To: <ak_Eu_eQKalPMwo-@pluto>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:16:07 +0200
X-Gm-Features: AUfX_mxKzpq6RPl9OYBnCrjfKgjOcnNPKcB_AjUZghzaf78uP1r8iO8ekjIwd1s
Message-ID: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
        Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        David Lechner <dlechner@baylibre.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        linux-arm-kernel@lists.infradead.org,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bbMRzckMqBn0MgoQFi0p44xaTiQhRiwt
X-Proofpoint-ORIG-GUID: bbMRzckMqBn0MgoQFi0p44xaTiQhRiwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfXzIOC8vpZ5uRI
 u9/clWGwu9jdXUb0yBcG58DhvXGsXC+pakilLeD+QQft9+t8DJTZOh5rByQJ94u1gJ+qtKNzOx3
 rrdzuIzXZh7GN39lOB7cmpt2+jpvdi0qpwb9M8q/JPDeF4DduWjWqxdVwcqGYh3vYptmIvFVT4z
 6pJyeu3/7jEgFNwaaVP01Loq+QSZflJM140O/aT3hO++HNN8SVYhwFPT5rVtetwRmlq2+9z3jKs
 IfvS3pTy7JaQPr1Xz320PTrWVD3zwz3S8YkAJbablJo+8a1i+D+JH21a76UVRj/NNLNvxF4KMjZ
 0Jln3mYRpmKy0Mci+LTmHHUTOKX+n+DfVE14P3OFutmxzLtKvtPEPxXstVAV7V5k/JRHi9Zjjfa
 26TiwfYaoTK7og57dkwddsW/jZD0YCdn9yBQxKoQ9ZH/i1uONDjoN8nIH8ur/fNJSvOk/ohEGGM
 aXQyzrF9S7DkXrHCcUA==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a5636a4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=7CQSdrXTAAAA:8 a=K75D1l0-MnsISjLg7T4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfXxpJfw2aSlllS
 cjHBU+lf012GplpUgfWo9uR4bbeQvBFExiy+t7nFVCaRx8Cw43/smE+gAWIT9VfA7RYotpc+2mB
 /pezR94N4uq8kJCSgwErQUSQ8WX8hSk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140138

On Thu, Jul 9, 2026 at 5:56=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk t=
o
> > SCMI server from different architectures than ARM that's why remove
> > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > rename folder to reflect it.
>
> While I understand dropping the dependency on ARM (I always wanted to do
> that and test if it worked at all on some otehr archs with QEMU), I am
> not sure about the whole renaming party ? why is needed just for
> cosmetic reasons ? it is at the end an arm originated protocol so I dont
> see it as a being wrong to be named as such even though used by other
> archs...I have not really strong opinion on this...

This is certainly not my call to make, but I have to admit that I
fully agree with the above.

Usually we don't rename files that indicate a legacy platform name,
just because a new company/platform wants to make use of it.

>
> ... my concern really is ... wont this full scale rename simply generate
> a lot of un-needed churn for future fixes and/or backporting ?

We have some git magic to overcome most of these problems, but it's
not always straightforward, I think.

>
> Thanks,
> Cristian

Kind regards
Uffe
