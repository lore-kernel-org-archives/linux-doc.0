Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F224DFF9
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784426912; cv=none; b=ctdNJi1FfQn6fosxr9VdfDMCngSwXrDw119z8D5lTmhcn4OPgasLQ2Z8bUPJWGF/MB2uRlwQWIF72Vjp10/5E7r9W+rJULVqV8880fRo+7ZxcDkgDOovJKBnAeuaMZNwL/hBVGoRbX3Q04DJMqOe6w1SkCWI2vbRammQKtR5MMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784426912; c=relaxed/simple;
	bh=kdWlN1B24Q6VKMAxP6/Hwzp7Jv1wwzj1dE9wrvjjOD8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FpRPDQmRa++Q0mY+ydEfulFveLXQwHfUy4wHuaAc7886ZJYJdbGhFToe1+aKjYNZ9Q1KOKQQIvqdHOGaqFkyW6sFwVof4Nc3axcPlzhTY3vjf27a9yJ8Zoz7YjaF+oGCnXVB10lRdPMmPLou4TxPQbUx7pMxYy0P9Ug3Wm1OmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhSift6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SuEjmOXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhSift6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SuEjmOXP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66J21Wje2414217
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v5PtlqNjcSs4unf7+PEYRQ0YSF7XRPuFYxXj3KTAnZ0=; b=ZhSift6xgUHC7KZx
	6POYZfXPYCDWHVfR5I5bqKmGTZ7Sp1vH1V0WdO2tsDjR2eaLKLRFrVmi94hpLnYl
	vN4jv/gLRFLSsaC6Hi2he/HBDcCPA8AqqypafbXl2C2Kws0vADtYN5R/KXsqTX+N
	iQqZoh938sulWp7SelMon+w86ZZvg/xJKkVKdRvqSjoRUws1Uh8QUj/sxA+LsNVS
	+01EPbbMOkgW7s8E2RD2Xyv5Tm0l8OuCiluCgQ3xdsgxgQlEVeXOXEyOHxB5747A
	R9EXTr2k0Clh00WQUgablkXswALaKRZr2udoWCZVFnPH069w5yBGlXKiWsQzy5ZH
	vZZj+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnhypf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:08:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so119509505ad.2
        for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 19:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784426910; x=1785031710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v5PtlqNjcSs4unf7+PEYRQ0YSF7XRPuFYxXj3KTAnZ0=;
        b=SuEjmOXPL6t+jfwoX0OuVZZHXxyE5o3AnPb8HRiHhVwZLXCN6581LucCkDykrxp/Yc
         gnlax+gDwVkfZZqHZ2BOJ3nTPQDASrPSavSAqAJ98b+NR3X1dt8wI5IgH5LhOm6Kl+jV
         Y5WA31edUTSYtUoe9SkrZX1yxEU1w4ke2JPFlcCjibMDL/yMvbHf6ADOpNP2ratbqVzz
         UIsxkyz4pqh0h31yWnVoJ//Aefz3INWCAQ2Yjgne1WIKsPHYHpq2r+TmyM6E6qI858Of
         bAX/PIDNoapm1S3iqWJ0qDMFLzT4llKFg9IQfaIcy1ILEbgMVXTQ4/Pk/cHEQLQWyEDH
         8cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784426910; x=1785031710;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5PtlqNjcSs4unf7+PEYRQ0YSF7XRPuFYxXj3KTAnZ0=;
        b=Wj4sQLTQ2YHblhPYVvVAqyaTNM0HeYY0nmUEpYEwxFDyounu6BV5a0hpnv6DVdjF8O
         g8KoPPBycS/N2VrjK/nKCy6IN9nTkYisirdB1+T7b3FZ1/GYBPuNAyyGCCjYxmd8KOFx
         Bu7U8hEw9uz+EMlwSkYDWU8I6dqK7w3gr2HS8uvYaK0FHH18RfmxY2U8xcyS4cjNL8Xk
         dQUoUChhNlWN36M8+JrP2ZIjjQPoJYu944d45xGtwjBugCT6WHFLmIZcUrvO5xnJUadR
         SbG7rncigEscDauPoO8CqOFvK5IK3XO2pwrWhFMki98Zj2vC6CFTeV77ylt7tttmI6kj
         T8Pg==
X-Forwarded-Encrypted: i=1; AHgh+RozJK52TJ+YS4e+RqSe6PRmPny/Y3UjoQklVik4sPzv5bwJW8HSgTrscvQfnlVPOQ1qqo5ELRtQdj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0dvXUzouh01mUOIbDk/u7XxfsUvWewXVCscszlBp9OBwD2kF+
	RECRj0eNCVGPTyqNqm7hjwA9gj1aarCF/J2XbeQ3dQ6/ro9hdAUzG3bLgqPP+Ohobuzj3WDdd7H
	VtImI7nGd4EUcZEr0vuC7XsHZfw4kRFlfQFFAL1TbRy3TVixhsqrjfMxrRUi56sg=
X-Gm-Gg: AfdE7ckFtWwi7dLrMfMnHCuzlesrPXttSWZgFLQ7mwR0jEjK2xrwWNs3vFvM3cjvQrG
	TSs1AbihqkzqgKkaeh/1GyoHCDmu45p0PIn2FhoA68bVPe8ShDFIglrE0C5D4Q0f7fr2NcFJISk
	LROpazvtHFKulyt9fqWTURm9T9xjX4PWzmWV5VVZkhwXM3Cf3z90nU5dc6cSDeot7KOoMc0vHL/
	7vD7VBeh3wsTaUDGLggoKURDbsOP2xaH2N3WZTdXAYJ1VhcXs9zQhvDlJcQRf+BsG+WkAOseuKc
	eOr0xVwKNzl4RUzSx6vwjub8d8GlcYhv8UBJ/iaHrtwd3XFgdzEERsCA5hG7AZd/B8Ap7muXPcS
	SOKoJb+lyt7BgJ29u
X-Received: by 2002:a17:902:dacb:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2cf348abd80mr100376865ad.16.1784426909973;
        Sat, 18 Jul 2026 19:08:29 -0700 (PDT)
X-Received: by 2002:a17:902:dacb:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2cf348abd80mr100376485ad.16.1784426909491;
        Sat, 18 Jul 2026 19:08:29 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3474100fsm34318815ad.66.2026.07.18.19.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:08:28 -0700 (PDT)
Date: Sun, 19 Jul 2026 03:08:23 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        "David Lechner" <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
 <p.zabel@pengutronix.de>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marius
 Cristea <marius.cristea@microchip.com>,
        "Marcus Folkesson"
 <marcus.folkesson@gmail.com>,
        Kent Gustavsson <kent@minoris.se>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Janani Sunil
 <jan.sun97@gmail.com>,
        <linux-spi@vger.kernel.org>, Kent Gustavsson
 <nedo80@gmail.com>
Subject: Re: [PATCH v6 3/5] dt-bindings: iio: adc: microchip,mcp3911: Add
 spi-device-addr
Message-ID: <20260719030810.13a090e1@jic23-huawei>
In-Reply-To: <20260715-ad5529r-driver-v6-3-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
	<20260715-ad5529r-driver-v6-3-cfdf8b9f5ee3@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfXwP2iV8mfJCFq
 tYFTcXk8XswDDrcgeo6y1n0E2ERRORuqQ+IsEBfwUATSCDq0rucj4fBRk3c82z/qyGsiI2y+36L
 hFVZsMgEoXaBBJzM87LFpH1QQllBi0zuIBte1FmAn876hqWd4bageB8JoQDTFvq1kTFhRrDK0ne
 JQ9Rd1svPZ2Dj/88fAmJ0O5NMElYYBmDZ68NORu4csZCRrD2wccSTpnxhz/6S4R7XrUOJPxfHFL
 TgJpzSIKagNi4UGFu9VHK/LvOuqC4qBFSbizZsdRWpS9IhQmNQaNo4ab2jEeZas17x8L2RCB0fh
 iIVdlto3jhsDZu7lGo5RH22OMcGVkWL2Wcao7+CFDoeJ/qFcRVhkKi2Oa5+cU5B7B2tNnyZt7B/
 iJAUN/8n2jp8bjlcM3F0YOhgq67oxKeJn8AeVfkkQWEcZziNl9vDZrxfxTI5S4X9Cbr/kCjTUqB
 H8c6DsTDWHNUOh+2ZpQ==
X-Proofpoint-ORIG-GUID: 2mMtlcmxcx9YUngwMaQELKR9HDVsqziw
X-Proofpoint-GUID: 2mMtlcmxcx9YUngwMaQELKR9HDVsqziw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfXwecprsxXKPTh
 HilLzU1L6GRXJWnIAEb9SehoBz6nJuMDuPikDDexAzSouqISQWjGYUsfykN1blF+qocO0k5AfuP
 W4D/fXPozJ036qbLSsJfBUHnaLTerFE=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5c319e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gAnH3GRIAAAA:8 a=279Z2W4kbCX7q3JdIJsA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190017

On Wed, 15 Jul 2026 13:41:06 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add the generic spi-device-addr property to the binding and deprecate
> the existing vendor specific microchip,device-addr property
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> index 3a69ec60edb9..4a60df06bd35 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> @@ -57,6 +57,12 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1, 2, 3]
>      default: 0
> +    deprecated: true
> +
> +  spi-device-addr:
> +    maxItems: 1
> +    items:
> +      enum: [0, 1, 2, 3]
Needs to carry the default as the old binding did.

>  
>    vref-supply:
>      description: |
> @@ -86,7 +92,7 @@ examples:
>          interrupts = <15 2>;
>          reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>          spi-max-frequency = <20000000>;
> -        microchip,device-addr = <0>;
> +        spi-device-addr = <0>;
>          vref-supply = <&vref_reg>;
>          clocks = <&xtal>;
>        };
> 

