Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24BD5472B
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784426859; cv=none; b=AZz2EfqJaGIClnszYlEt8bF2+CVKrRsD6LJ8+S7sCkwIgLsjnKcjdQBrf1ziIXkrBpwwgb5U5VBU9MODzCrZV28/UBESUb687I9vXS/b9WG3F4rD2PNdBYg4zNvTZ/nX0swdAwt4dgYv/Lhf4Mn5LOomHrkFlUc6pyT/ioEsufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784426859; c=relaxed/simple;
	bh=0U5P265APA9y42OE48PXJRVs+DVukO5q8VN35MNnDus=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZmNjegjqpTaOAEGfDH1lPGbIaBslrk/u5i6fIBYoH2Gdj6ahVOcgJHWYfQ58ZtLnE3lLxIRjDnMo95MNGpn751ChppgPXevsrrZx2IeW7XN96ZFhSm6CXRQDiRtYk43Z3zoIgxLfkWWIRRsVH20Q7Y9U5zz2HFcLh2wEvtc+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inbb7BZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOXuJk3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inbb7BZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOXuJk3Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66J22LU72310204
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bij0tRK5KgUgPL1VneMcyKdlpgkQ1t1V4gnjIpr3G9s=; b=inbb7BZ94Y8yja+z
	5N4QJkhLH4yo/P2TXNa0Hz8VPLBE/0RaFG8qa4X/0rB9RUlglayZJmrQEstzsswY
	/b305XSVWcwVwKwwHzaMPz+9Djf27r7i95ToKjFSRphNqYrWOfQWYxUredWUn9Q+
	Gt+K3rwXIBrt1/pYo98Nhw2kopSrIikHPCAqBTfEW0j85rYj+UzDg81oUksOv1c9
	FtXL0J2cJsXtkF4Gncm1gny+Y6wKWnGIaQvlWYMsBcwN1mpCbIiuWUyrtBohYBEq
	NF0YblUiPGlvR89hSLYhTQa0XaHk1oJs5N91KMUqvqOA7OpGd/iwQ/Q878pZ8ld3
	m7fr9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04rvdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:07:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso6654786b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 19:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784426856; x=1785031656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bij0tRK5KgUgPL1VneMcyKdlpgkQ1t1V4gnjIpr3G9s=;
        b=WOXuJk3QkrPHYVC3Fm+rWBwF747FBG2Qvas5v1G5iP4lPR58FfBPbHCuX4yLx8R0gp
         wUJTHD37Eq1rFQ7qot9+DPgPxKUt2VtjR+BfOdWhc4MtGhHI1jBnU55nvfMaGuVlvIUP
         Dt2cX8t6ZStCOwfrnN6MUmiYlRp2OJy2eA+u/koN4J1n0WSITGFFl0J+9BvCPpKHJXoR
         WxZ9smHPnUgRcYz51oC7nUQEFs5t3Spe8OtLqoBJx1WYgPt4WSY9JhQaKm2dO6HU/kmA
         CfrG7nr9CdaeLvX1Il1zdcjOTDklxJHsOOPGh5u/MRWUc1kvSKSVBcn8yJdOff7r0EME
         wGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784426856; x=1785031656;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bij0tRK5KgUgPL1VneMcyKdlpgkQ1t1V4gnjIpr3G9s=;
        b=XwcRsgpLVasPfMQX2klriJ/DLP6ibkQU0eloSPQh42dC0gZq1thjzH5YTWx79Q4aMr
         wIJ3Kh0t4+W66Figcr22Ph61PXuXyjRvE8J5TXcQM2sGTQRi2t9MKmyB9tnQpih387Uo
         AGOJos+5wVyUM4M4B0xFp99A8iB457/aWA5M3jL8hjlsBqGZu4qfuVobdBwS8pDbWe0Q
         +hUDFXf9azb8rcxl1siFSaSxlXHSyD61LRRuxrKs/weTSSr7UXN9akft4mx5Kcr+Fx0I
         gwPwZNrXC8mPPfy5i0u2d9D5aHEyuKCEFoaJQVuLD5jyL6RFOuePWHdqoJm7H5TJObO+
         dPbA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7FBHKTwcaWrhXJsc3Ylm5NMXZaPs6uF+nVHgy/x++7ivrj4qZQuosLK+5XYwEWrUkyWELkdYe6UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlCbinYnXvS5VZp1b1lA9+kgxgfh6Isov/H25I2EQURmve5R9L
	IeP+mV8el2vosFHryDbLC4tLi86QbTZhB1+iDapltvDbpv8A1qoIqtn2u+WZPtE3FAE3ArW1yW8
	3KAf3ffTmz4DuTDm1EMuzpmlb1YMRw9jGJV7im0CmQJB2nT5uc9j7h23+KZi/u6k=
X-Gm-Gg: AfdE7clirUekl4afVomclNl2uSElmLQspl+AqtpJZ304BN3mNKTAAL4TLFIHuenCS6A
	41qEAX3kwaje1+WsgMC3rftt7jUGXIlSck1zvgSSztoLlLxLDNBHDiQ9IWY6u0gHbowsX7NRQxa
	TrAMtMqHFzswW9hT5LDNnztp4PYkU78b/P9Qtq2vEi6v6pKLlMiVujw9wtw78zuVCGynpW3AiKC
	99xSomIPoZM3QgNx42nUVhHNU0JaJsKagGpxYimlHmfF3vYCzt/nAsso9SY9mNdqNQAv53i50xE
	MBE3bVCUCIAEFWiaxyZsn8vJOkYcEr4r0WlXFLxBnHXElqSLEpHCsVarsdekyNitCadqyz833TY
	FizLA32j29d/eHX3T
X-Received: by 2002:a05:6a00:228e:b0:848:47db:a0ac with SMTP id d2e1a72fcca58-84c292ab554mr8722157b3a.27.1784426855545;
        Sat, 18 Jul 2026 19:07:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:848:47db:a0ac with SMTP id d2e1a72fcca58-84c292ab554mr8722131b3a.27.1784426855066;
        Sat, 18 Jul 2026 19:07:35 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c30fb62fesm2946475b3a.29.2026.07.18.19.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:07:34 -0700 (PDT)
Date: Sun, 19 Jul 2026 03:07:29 +0100
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
Subject: Re: [PATCH v6 2/5] dt-bindings: iio: adc: microchip,mcp3564: Add
 spi-device-addr
Message-ID: <20260719030717.3ec27870@jic23-huawei>
In-Reply-To: <20260715-ad5529r-driver-v6-2-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
	<20260715-ad5529r-driver-v6-2-cfdf8b9f5ee3@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5c3168 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gAnH3GRIAAAA:8 a=WutwVF5OcC7bkNhAIqMA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfXy1bY2fdKjgIf
 VXz4OhRz6Cew6WdV70ybvwFceKhnhMBVqHX1yL2GrP65MSgepe7btQY4G0DgStGKCzSzcCSy+Qb
 prPGB/R9KxyE3MqHTGyV7guXi4G4gxdTPUqH/0bLIK86gRSUdoRZsbuwur0PSrOSOrQJXaCmbix
 oR+HOA4s/TBpPE9fbdF1VQZxUhs4FAubQERFG4sFoR6uAj5wTgm3ft6/biX3Y3IM8rMuk7cPj6x
 TUY8rAv7h82Jd7tTmXUdWA/lBuC0wQSXlpJueCxfVYIAQsVo0NIzoceX76c1S0KY3P51V230cXP
 DP26G2dq3+Q8KmLH4dN0hdQDfc9iXuUWLCb3MdxL2JDQNtotl4niBKnHpabbtSUSrpRoJZt8O+D
 xRuxFXhmWnwTaNb/ib4CZA9wf7QU4nyc0xR+drNDZoiS/y6jiWPI3a7Ph+TL2z+jdMpQoQjBsox
 2MmyJZaUpst6Rka55wA==
X-Proofpoint-ORIG-GUID: kiF2CuD1FWyDhIsw0aLHGF4FICjAMkfk
X-Proofpoint-GUID: kiF2CuD1FWyDhIsw0aLHGF4FICjAMkfk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfX/sTM/s3c0Rx2
 uE0tfcHS9PslxwwJ+4FWg2hF0dfHivPQVcsR2lg/DSBnwQt/aWTt1ayWUX89z/6/Z5FeijZ0XKv
 kv/gk16nr19MiuQGPJVJIIxYgK6dJTM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190017

On Wed, 15 Jul 2026 13:41:05 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add the generic spi-device-addr property to the binding and deprecate
> the existing vendor specific microchip,hw-device-address property.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

Maybe I'm reading the situation wrong but I was expecting to see
driver patches as well. Or is the now deprecated binding element
not actually used?

One other thing below.

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> index 675319276197..02bb198e9fa7 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> @@ -80,6 +80,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      minimum: 0
>      maximum: 3
> +    deprecated: true
>      description:
>        The address is set on a per-device basis by fuses in the factory,
>        configured on request. If not requested, the fuses are set for 0x1.
> @@ -91,6 +92,11 @@ properties:
>        clocking of the device address (BITS[7:6] - top two bits of COMMAND BYTE
>        which is first one on the wire).
>  
> +  spi-device-addr:
> +    maxItems: 1
> +    items:
> +      enum: [0, 1, 2, 3]
No default here, yet not required, so how do we know what the value is
if this property isn't there?
> +
>    "#io-channel-cells":
>      const: 1
>  
> @@ -123,7 +129,6 @@ dependencies:
>  required:
>    - compatible
>    - reg
> -  - microchip,hw-device-address
>    - spi-max-frequency
>  
>  allOf:
> @@ -159,7 +164,7 @@ examples:
>              spi-cpha;
>              spi-cpol;
>              spi-max-frequency = <10000000>;
> -            microchip,hw-device-address = <1>;
> +            spi-device-addr = <1>;
>  
>              #address-cells = <1>;
>              #size-cells = <0>;
> 

