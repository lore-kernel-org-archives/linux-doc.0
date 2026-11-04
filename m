Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751650;
	b=sEXrcSFWF+EW1B/GKssQNvHLmVmQb070KGQT4ZyW9PbZxC+YQmAm2AZV7PTKGXWiC+3w
	 lPXh3MzEEPovZc3VhhR+BgYLuPCysU/OPkmCuZtDHzerLz8JOTJhjdNSZUB4l6LTy4tDp
	 uAW/HLYxY5mc1n/FwjBuNuG7X8OEYug0/cHMOEmMBhNqfQImJjMGJ3IeOEgMy6iDUKvEG
	 mYZXC0nlPCnY35DF5Ldpyp9iH+dw+2tM0p7BjVmd648v2wjrNaUu/Oo82V2iO3KpjtmPu
	 ddhTvqpUdUCyDijjOfbSjw6fS1Qq+lDRU27nfeFhRWX8LmkV33wRvwXL5sAZ1csL40A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OfnNX61NtQ31WOejDUqbkK4HwJYzLMGKN6Wyl9m2oIs=;
	b=GotmfAog8BGqcFBjjQFNRolRydGy9Cvhdnzv2E33udl4k3YowrcurtWoxtOOQT44utHX
	 bO+A74KWtPOYUvd70/h0unDMIVzFPGVAHFmZO0D+02JAjBmHBJk6d4Ugv1rJ812U8EabR
	 T9HHE8IK9Vz6BKbetCmCR521G7M+x9BQZ4QGooppg4guXyc3ZP116+u5mzsJn5v+wHxgi
	 /HBBaoW9RK6Wjg4cxq2U5Jri2lMfnZaGASihAD+O3bxik2AioAkPYq3O74+aQLLMvegZv
	 9SulVWlyRJs6zcNQdZRJGNm13hsF8bdBn8/Wzsjc9qmnXSCay2yItdE7ytYJsak8Sfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O9aA2zlY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y7G/sx/h";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5209606A328
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 00:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5209606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O9aA2zlY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y7G/sx/h
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKshC415299
	for <linux-doc@vger.kernel.org>; Wed, 4 Nov 2026 00:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfnNX61NtQ31WOejDUqbkK4HwJYzLMGKN6Wyl9m2oIs=; b=O9aA2zlY2c8+9sxr
	hXQL4F6wd2IkKQ+VwK7lMQzQ46GiOvIpxp91H2p0JDnpQL8YFnWTpiDbyrffdXu7
	ypY463gCS0OkSDzuxQzxK/Fbbir96u+n7p0fYBJeRuc9C875OBzhe9jDYuN2NPjL
	kvpKI4W6w90/l1N8jpg98FvxduvmBFocU8BHFyTU0S89lQLzNwifnlKqgytRaF6h
	mIYsWzV32M5cjjVSu7FDv46pqfrwr8BKkbkjOeqD7M8Vvy2X4rdwzkuJrz6tPmTT
	+4mKx6bfXbBsk9xVem0omadSRCKRthgz4+7mXvn7GJecdizYtWODemcR+ODHZpA3
	ou5kgw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp9qgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 00:20:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so213149a91.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 16:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793751648; x=1794356448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OfnNX61NtQ31WOejDUqbkK4HwJYzLMGKN6Wyl9m2oIs=;
        b=Y7G/sx/hkyqa7plfa6wvCEbOgFJjXACTY/Q9dWAqr4XFbRQqx4RKWhNoHxtlKW6u0o
         ICRvbwMs6+XRgTMt8A8Ix5IPX5DKYBkDRLlhJO7d2/gKO2yMnRlcXLS7fDjIto9osA93
         eDhOgPR3fVpF3/J1yTwph/607e2A1Q5Gfh/1dVJSBMKm5OCMLc+zowF66ekVuXcvk3jr
         ARYpzIFR1okZb7AF8AEfazXOtF1S24DUhbO3s9jlyliLGtj0MlPObTgwzeJfByU0ye+P
         XQ6iNYOfXQCMNLnXlT34cIKG0dO+OUM+DbWUDDwpjx5LKpzLojgNYDoXT1ysnRkKtmI2
         rKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751648; x=1794356448;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfnNX61NtQ31WOejDUqbkK4HwJYzLMGKN6Wyl9m2oIs=;
        b=TCI2n/WLaVhDhJe4TSc/T6JWoXcpHIRvn7uQU1EhHnSh1lFbRK29ZgYjum5HtVThEk
         RrSrJ5LMv44tpxlK+McVk12oWkMbEHpC4PWkzw8QKBydBilWqLoP5Qyt41eHjlUwDRL5
         go7RomkNA8Sc3ubUdR5jp8cpyji53m70yod3cvmnWamGTicb4vqFDVTPJ5h3mak36ivR
         dRs68up0a3fx9p1HxfH3Yc/+zWQRNNmPbaLXfgLmftWvNj2rN2fpRVKHgT1Gwxk2BX5F
         jqj7nHBX9rmkbn6MOzAk+5Z13v7ASsT8sd/BBB41PhgRNqWfhO9bD0fv+5x2/VJZx+6M
         m7zg==
X-Forwarded-Encrypted: i=1; AKwUvBw8mH877DvMWPXZ3VfM6zoo0iO0r7iNX8MZY4xYynCfCnje6USUpVlJXL6LvZm4z+DF5Klsr9AbRwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YsGKL471hxjcq4snmmkXEUsH80fbqOmF6Ja82C6J0CSz7yug8
	9NYxwyNHwkE0Ldq66+mEdA1zFUg+5uf55uf2MWmVCOghl1mPXYih6Sml2ZepJwHxQxDmAIhAqs9
	JXuutCOp0pbjp5JFKa00UrXUTMgL0OYA/NRxq7lN+ZXcBIW2A9418LZYiv7085G8=
X-Gm-Gg: AYBFou221htGV9llGep0nLO3GT77HAXD/4wST1ymJAKAAiU/qPDSVJ5A+OW3BdzuP4s
	ZeowB9kFLgmECKIQkhuGrPVO1o9ODF37WKfytgd5HlehenjM6srIiJhe+r9l825kPDi5PPJxbfn
	mFrIXihCuYIOgznv9yPm87j0dfSqVxAEUObG7cA8WrjOLYC4aUALJ4kDJcQ7BPLeGlJtBLDXKhh
	zjBBCR2UqnommjY5QlFr15qy5WOqWdu/XhTy/+qkiw5dNv1jpVf7Fl52oja6ok78yw/eVhR5RIr
	PtqOMlvHsbRwKH7s8cnN95t6BljtmrRbdamhDVV294IGIRWkKAcmmFWBYvdz8+JnMUE2HUv0+FU
	Q+XGdZ1rfuTSatyh+5e17z9XoNFXZ3DKNm9+wP6LRFh3//A4tonlxYyr9xASGKPHtEA==
X-Received: by 2002:a17:90b:4c12:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3ae8986e3bamr13180550a91.62.1793751647538;
        Tue, 03 Nov 2026 16:20:47 -0800 (PST)
X-Received: by 2002:a17:90b:4c12:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3ae8986e3bamr13180527a91.62.1793751647042;
        Tue, 03 Nov 2026 16:20:47 -0800 (PST)
Received: from jic23-hlaptop ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094453532sm1090412a91.3.2026.11.03.16.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:20:46 -0800 (PST)
Date: Wed, 4 Nov 2026 00:20:42 +0000
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@analog.com,
        devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Olivier Moysan
 <olivier.moysan@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>,
        Michael
 Hennerich <Michael.Hennerich@analog.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 01/10] iio: frequency: ad9910: powerdown fix
Message-ID: <20261104002042.10064e8b@jic23-hlaptop>
In-Reply-To: <20261103-ad9910-backend-support-v3-1-0e9224ddf7b7@analog.com>
References: <20261103-ad9910-backend-support-v3-0-0e9224ddf7b7@analog.com>
	<20261103-ad9910-backend-support-v3-1-0e9224ddf7b7@analog.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMCBTYWx0ZWRfX8BtmrvMK+44b
 DL8zeCxa0/H4OUjiYz4if94fMDz/VPlrP8FGhvJJt8DKOYJ5WoyaSVh/zzGVqDqnsxbTql9oCSA
 8/BFq1gzUPJOcqfvCiKn3QP2ykRATl64roiPU0j9QT4m6Gw7BQrdlLLLr9uzlP0LaYTlFTWFQd8
 nOHQXTQZ5l3n3gXCn3PwU0FefQBrPRmrvvU2RmqBMjIelfvJIQKFY1VterfTzOpCf2LsENWmVGb
 Mu48o2sRI2pmvhNMyukQdg7hRGKub7oXvOch/J7OqK7BMcZuy+RvngnVOWCraDjeCMaesRVsccH
 IZWMDOoSn6XNkLgsl77xm9qqg2u8Y/d8j87+TgZAcdxIRt+UpOdX7+OewOZrk8NxV0mJhxFC3s0
 lGtjc8aY2DG1/ve/lOaTaC3cwcbVOLe33qSPoPKHC8kTypftiYVFUNcTN+zRESHRQLJ7Dvcpxxh
 Fej5Ij66Sb9DDJrNQgw==
X-Proofpoint-GUID: OsSA4F72E7KJ4Nfiu9ZgXlD7P2Knm9Ni
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea7a60 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=Pob1JPmMRzAnXopCxDUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMCBTYWx0ZWRfX8WbdLY/ba9Ms
 yca/xREAqgdNdT6sYDLWOSanVitD1jb3PHPONZ+TvC7FtWEyFWzeg2OBrY+8pttkwqn3QbtY/qy
 jAS7ob7y0mHwYkEIw8ONBSfPSprgvek=
X-Proofpoint-ORIG-GUID: OsSA4F72E7KJ4Nfiu9ZgXlD7P2Knm9Ni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040000

On Tue, 03 Nov 2026 11:52:57 -0300
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org=
> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
>=20
> Enable the software powerdown on all the applicable CFR1 register bits at
> once with an IO update.
>=20
> It turns out that DIGITAL and REFCLK_INPUT powerdown do need an IO update
> when enabling the powerdown, but that is not the case when powering it up
> again. It is an asymmetric behavior, which was observed while profiling
> power consumption in the lab.

Just to be absolutely sure I understand this right... The bug today
wastes power but otherwise doesn't break using the device?

I'm just trying to judge urgency of applying this. Is it fine
to go with the changes that follow later in the series or do
I need to rush it in, potentially delaying the rest.

Thanks

Jonathan

>=20
> Fixes: 22452fe6cd08 ("iio: frequency: ad9910: initial driver implementati=
on")
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  drivers/iio/frequency/ad9910.c | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 04a4e184b873..8bc24d0b7442 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
> @@ -621,26 +621,16 @@ static int ad9910_sw_powerdown_set(struct ad9910_st=
ate *st, bool enable)
>  	if (ad9910_sw_powerdown_get(st) =3D=3D enable)
>  		return 0;
> =20
> -	/*
> -	 * When powering down, the DAC and AUX_DAC (SW1) must be powered down
> -	 * first, as they require an I/O update to take effect. The opposite is
> -	 * true when powering up, the DAC and AUX_DAC must be powered up last,
> -	 * i.e., after the DIGITAL and REFCLK_INPUT (SW0) power up.
> -	 */
> -	if (enable) {
> -		ret =3D ad9910_reg32_update(st, AD9910_REG_CFR1,
> -					  AD9910_CFR1_SW1_POWER_DOWN_MSK,
> -					  AD9910_CFR1_SW1_POWER_DOWN_MSK,
> -					  true);
> -		if (ret)
> -			return ret;
> -
> +	if (enable)
>  		return ad9910_reg32_update(st, AD9910_REG_CFR1,
> -					   AD9910_CFR1_SW0_POWER_DOWN_MSK,
> -					   AD9910_CFR1_SW0_POWER_DOWN_MSK,
> -					   false);
> -	}
> +					   AD9910_CFR1_SW_POWER_DOWN_MSK,
> +					   AD9910_CFR1_SW_POWER_DOWN_MSK,
> +					   true);
> =20
> +	/*
> +	 * When powering up, the DIGITAL and REFCLK_INPUT (SW0) must be powered
> +	 * up first, as they do not require an I/O update to take effect.
> +	 */
>  	ret =3D ad9910_reg32_update(st, AD9910_REG_CFR1,
>  				  AD9910_CFR1_SW0_POWER_DOWN_MSK, 0, false);
>  	if (ret)
>=20

