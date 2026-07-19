Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B6B1DC985
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784427060; cv=none; b=T9Xy7onY3nSljVHI56KVqX2pqyjFBx48YLxdJmfg9+nC8bt/tVuYqCmxkvL3usRQeP93otmu27nVsknHldxE6Lafs/JI9MrEK+3tpP7lHIcUUffhgwU4BxjV/urBIR3Xjt1MZxwg4ZLe2R4Omvga8E6ba0vUO8u/mMXYT/lPDmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784427060; c=relaxed/simple;
	bh=R6/eBx0dOExr5javRdf2etaJDNgbRZVlAciWScYcY5U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aUo/cFjeC4P6BSO/RHhgYpfBaRdkJF7IYvS+zMIBCM0GknoIbol7tM6I+6xqmGhWvCRGwudFgP38Sx/T2JDvRoa5g4J3QvSY/rrqbWpnFr4jBU3RBCfFJqPL2T0P8YLBFA6I3eJoLvRXt2Lkg8FZ3GlWsozKNIPUDW2KJWBU/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxnocBu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZncXMs+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxnocBu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZncXMs+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66J22WFR3424833
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/nji6/9dRFy5m349usk56mPECY63Tbm+yUPmWxeKoJ4=; b=WxnocBu1lJ30V/DM
	J1JEwupYUox5MGNYUofBjb7Xa+s28TFdBk42yd6RVxYEyRSGasE3tmwQs/WgnlvP
	0nz/+Ad7ayx9xxgK/IwMIi+3FPtJdGD5RkBq95SFCM07qZni4ip87dA5YYlkqkzY
	TRkqYqHl3gWLLN9aYGiR8iLTRiDuBFDDx6ICV5fDHMpr01NjAdR0T9AiQ+txwF17
	oHHL8FmyC/Wufp79KZAzxb7DkBtV9Z+n/X05dNfMp7hjtuAOhaoag6vKJGcBbORY
	WOe5Gx/wWYZ40xamKPX+v5fCJYy+K7ODJ+wW0LzhgLWmSxHBJ0nf6DevCCcX6pFe
	PtwaaA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aaswy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:10:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso15213108a91.0
        for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 19:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784427057; x=1785031857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/nji6/9dRFy5m349usk56mPECY63Tbm+yUPmWxeKoJ4=;
        b=IZncXMs+XhaHb1n04/CFGsapePIvZNDs1J9ITyjoVQmqs2C/TdayRDBypVmqV5MNrj
         c4l5qshVXrO0ZbtJuLY6hiuxa9GsqXGErQIUyg9PvNADKQExg/5hiSjgwvPHD9BPNs4G
         XOCem0nm/gZzjdCz4h/EOGEDqb0FOJXpiPXgtobBNOMdZPPYWTjJQIIV95GL5C7zehv4
         G4u+gQ/aBOOo6/sS2ar/ifpuktiOBZh48xpLCCOnjLAE54+NaUpvp6rLzgBCJc01i8sy
         J1xomFjbQkvlu0WQeZ5qbiXAie05AnsjbE6irP57OjtDEYr4HBTBh5SZZoH5MGqDSMMt
         B1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784427057; x=1785031857;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nji6/9dRFy5m349usk56mPECY63Tbm+yUPmWxeKoJ4=;
        b=fkvxdGb32vio/SYLqGjGsT/ThEznyiu52ZDB/QQeFG3P1JnlW4AEf325zUEWnVVECs
         XTVpZcQRtOV4wifODsp980+wzhsVQ0WKX2ooz2tpMivhqpyJj4Qogaw5uORslJ3Z9cRV
         Jsu8r9W3Ulki9xHkGUB3LcfBzuYPBcmj7Ldvy1J8NxSfiq9yKtQa6JbMzUoiCtDTtYYg
         ubBqaqMOz9yAXtFpJG5Q072YBFeCM5z+TUsz0OPJW8ol7KCV6Kr3fjCuwc0RHV6Efm1B
         OAUrhdjeeoUvRnb2P5Exz4aJV/5u8TROK6acTl8pqEJGkUskTdsg/+yy86ZtjX9+QC0e
         3lZg==
X-Forwarded-Encrypted: i=1; AHgh+RptYaY07jVWBcUCoHY79cNMwui45yzM6SkGduv6lpHfSi/6AXGJNx47ogIo2pon92p5iR7PULqz2tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKsRbXglxQ595zDT0kFNfyvx0I5jGqq1dUD6N2Pzo9gPYTSPFl
	qepyZ0XR3TDsZcge8h6MYOD5XW2JEi7w82rq5j2YzsrLutbxPR8QIJO2EPevZbrsMeUExBarIKg
	i/gfOsb2mgRASe1tSbVuDtyQLnw9RF0o4hdyZe+mY3d2ZmoFCdY9lnxzMNSeTJVQ=
X-Gm-Gg: AfdE7cmRgEmroqdmsHo9NGJIKy9nq7mlYLyM92+8YAtLS11nOaweMBnxWbGQ3ii5OY9
	vD6VtQCTKYGa0xhZj+FtVPlgM/8s6tCu1F/C/4bOZlFqWFf3fKJEvcG4+bV+Jr6fcBI2MPMavs+
	O/xE/NavdDPxXw5k5+G7WgEffAcedIKY1fObnpJiL4uP1vqO4Z5qhB7+vJLwn1uDlqOCOdLogiT
	qc2FypLw7OocBWjMq4GOTiRIniYcsQgPzIhpKGuQUkXI3mcK1B5uhim58zmKgHfm64FnoiENE6m
	qstiN+NfOhLfmtK0WyI6DaD+E5gtKAMENpKgvG7N1E7zDfkjpyrMbnwRsRmxbZSRVyqtPAxWNHe
	8iOL0NY2z7ZzAXqeT
X-Received: by 2002:a17:90b:3942:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38e4b59469cmr9276550a91.30.1784427057540;
        Sat, 18 Jul 2026 19:10:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3942:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38e4b59469cmr9276526a91.30.1784427057091;
        Sat, 18 Jul 2026 19:10:57 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a100753sm5454606a91.13.2026.07.18.19.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:10:56 -0700 (PDT)
Date: Sun, 19 Jul 2026 03:10:50 +0100
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
Subject: Re: [PATCH v6 1/5] spi: dt-bindings: Add spi-device-addr peripheral
 property
Message-ID: <20260719031038.4cbb21db@jic23-huawei>
In-Reply-To: <20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
	<20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ECrCvRyiHuqEetf29S1VEZUBEEqlLrXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfXwCVzFJ4VZavg
 TxEYsaPpyDQHsqqV8g4n0qD3U4/XMruyJdqiR8bsmBLPy5r7WocPTgXkEP2Z374NqCWpdQ581jh
 FSWqVD1uAIeWrMAqb5bEI0yA3q5pKdI=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5c3232 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gAnH3GRIAAAA:8 a=9c9bR3m6y8SIrhsu7zEA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ECrCvRyiHuqEetf29S1VEZUBEEqlLrXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfXx9Qlgp8b+M1J
 vIsNZ/pZAlNwTz4dO/EXDiaCJ35PXTVt4A5rQ20ZKbTo1YW2frqINklHUSaYFft1VgxxkZmjFfd
 uKgEWbfO0ht0fJSFpu3xyqE+7nGz3aCCXTt+iK0fVW4qw7vQuajsb9ESdNobyMshd88xnt/CoJL
 Ex14ErVkyNDQ4RcW8gXe7/N1LQMW1uTSEbNx+w/lu2qDZUANgoXXkFXZsALWn0v9x8qeLVKAmEB
 T7IzDnZ99q9YJCuC0JyM3wf+J3eJyUD6sd/8krw68+bIVDT96HTR1GsTZZX4D9Zvk5rQZowG3AG
 r41WyfEpjNzf1pgcQ1T+5mFyX/aSGfZsv6DlXiuP2z2XADdKK4zpkoqDpu1hff7bgSihZARMo+Y
 tKgZ88XwcF6HQfNm5DISQTwza69WJor7CvU/Oy4q/QjbNao3k9wjyj9rLYzN1VeLS03Ptkskp/c
 S/Dkae0ds2B3gKHOu+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190017

On Wed, 15 Jul 2026 13:41:04 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Some SPI devices support sharing a single chip select across multiple
> physical chips by encoding a device address in the SPI frame itself.
> Add the generic spi-device-addr property for describing these hardware
> addresses. The property is placed on the SPI peripheral node and may
> contain multiple addresses.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 880a9f624566..135657582131 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -142,6 +142,11 @@ properties:
>      minItems: 2
>      maxItems: 4
>  
> +  spi-device-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Device address used when multiple peripherals share a single chip select.

This needs to also explain why it is an array.

> +
>    st,spi-midi-ns:
>      deprecated: true
>      description: |
> 

