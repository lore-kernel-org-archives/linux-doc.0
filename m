Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158AB2E7631
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433777; cv=none; b=ain8MeGf9KOZOZoNI5T+uaJnwhrhjSyrNBt1uBgV32Hj3UAQiDBNUW1lU0bLEBLJfcJMEdCrgwn0G9Gpsu9s68oxrp6l6l10V3hmlYE+h2oxgbJPbMf4ySlXD3PMNxpEbAGhDs/VJfUjrpIL+5cw38xOzmJpKsehwJ1oDHJ+lIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433777; c=relaxed/simple;
	bh=4kdH9JwWn5BUz8jMj6r/TaxLP/NSVJU/tJpy1sBaGwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMh0eYGO1wKxSHIeK/FcM+XY+U+4Ah5z5G/uV7jpwWH+U0hhIU+d7wOuLR6xaCtwXnt1I58rXF5S/B5ojCmJlhHmux6lhw/hU7MGjYbe3h/IZjKjaAvbxICqj570dMOdaxyLf36HJAVBkBtmzxtLpq1KPhLZRQkojMVmp8mexM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQW0d/3+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQW0d/3+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Jw3018120
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBRR5H2TkKxKF7H4pKihb9Oc+NcrIbt0tfqa5n/nEGc=; b=QQW0d/3+8jWCiqK9
	aXFu4NReDnyno1hQnDd9X1Jx11vJXCyQNNBumCgDiKLY0VZq6lJdEpMTmqI6cQRM
	uU/vTq3EwIHSOWzJj//TDDADPs5EtVlvLL7uyRRYkmvRv9hDI4qf2QyanIPc+S3p
	PP+n9huZ3z6atcPsfZS7gpelklaTApv4fjkZf4OKKEyE9j5k8GsSndCw0R9fcPOG
	Lgdam1Fl81MDIF3bSFYnnJIjdk5b4Oux7IVOvSEhUnjcSgZNygKhi0jhyGokAsxW
	Re/i48Izy0xnUje6crVmv+HE5mSiJdwZqZFpTD+WpOR06Q7qOmS8bm9kgr0xsER/
	ZSUiCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferywfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85e23ce41bdso291744485a.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 02:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760433773; x=1761038573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBRR5H2TkKxKF7H4pKihb9Oc+NcrIbt0tfqa5n/nEGc=;
        b=v05lNxNIK8cAWxnToabJ7VV7y4pum6k72lbQnZyiLIDEOWEzAKgGCg35943Pz0CS0E
         4iPnNU2gTMW5qp248eK/2rrilxBxqjlBFjcQ7LpYVwcYVHx/1ykW5PuaWlg+P+w8NAmP
         TSIQ/Jd7S4IEP91osxcmowgUahKkfPatVHCgd8+2N+MhUzYyiBQbjF2b8eFiDGm8DlDo
         55R3HsadvuFmgLQWBmZS/9b/o1BhaoO+X1n2leWXAxKGIxpWBObC/Q38NxzkUvJ1NIdK
         Z5f07NSB0AI98oDT6QJmGx+/2QNHopnwIJYaykAWYOyM/1PMw1Dq4/a5weicd17PDb2G
         RDqg==
X-Forwarded-Encrypted: i=1; AJvYcCX4uBFYk+7S1CEOAUbbNuDVXsab0a1xtFH9MDvgHtmnMI6ZCyFt0fEFY91zLMog5k3beDyvJLE29IM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyoh4CYhgJ0wvp/p/5hjdmKGlu6RXASdmyO4K/iSSPbr0jO1CA
	h6FtyP7+hNSLz/LNx0zpDBK8UHF8zjEiKSbBIrNUD38dYlaVp68pko/t5F0piDKCuGk2XTYUKHr
	Z0M/giaf2WHUPIsAiattwL1ycjI6EqPbR/CaF/gRLjmntNl3EiiZdQgTk89zu42o=
X-Gm-Gg: ASbGncs9nWHa3pXvHMmtzC9tIy5q8u4a2S9fiQ98cJA4zk148CUIR2gMKFOoFMiszGO
	0pN2ORr/f63YVFiDPJPEsnkGqMbyu0FC1vdgJtsp0B/ZsYTC8ByTd4WWXGg97Q6GBICK3ozypHf
	FeyyROrdxRLEL09EqaRWTyKe34Cmdqh2eX9a0t7TcIES+YW9u1RD6Q25FI/V37hxqjn2V8Rd+xl
	8bAjLXXTRMoJyDB2Bal1rYcKgbDOCgu33Xch/KCxw97ot0F4vDv7k7ykxx83Qput6s8geanMq6S
	tAZs7wQzntCPx1mIyCwrHgz2XYsGyB4UVuyUhKskGyYU8khWPvH4akspibpz8xqacVGAg3T6Vty
	i1PxH6NXKgigeIjTFV9TnjQ==
X-Received: by 2002:a05:620a:bca:b0:862:dc6c:e7f3 with SMTP id af79cd13be357-88352e8e8eamr2066567385a.5.1760433773137;
        Tue, 14 Oct 2025 02:22:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6lBPtCjgj5B0ks8xM4dqV/qBR4R1q23vBYNJs1dE8aUXN8FmTT9yYWz5xoRUNmm6qC74jzw==
X-Received: by 2002:a05:620a:bca:b0:862:dc6c:e7f3 with SMTP id af79cd13be357-88352e8e8eamr2066565785a.5.1760433772666;
        Tue, 14 Oct 2025 02:22:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm1127034066b.23.2025.10.14.02.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:22:51 -0700 (PDT)
Message-ID: <87650853-3b4e-4a05-b3f3-4fcb8820ea9f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: sdm845-oneplus: Correct gpio
 used for slider
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Gergo Koteles <soyer@irl.hu>
References: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
 <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee166e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=b_3gLtI3ev4ASzC4froA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _kF3XuCcBdgg6mqbVo4uCpCyMiX1LFSS
X-Proofpoint-ORIG-GUID: _kF3XuCcBdgg6mqbVo4uCpCyMiX1LFSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9CYDgzGHARrm
 Qy3X+Kuj1/dgie/GcKPI7QWJrzn2qyWPy4zfIRCsGwxgYFoSNH9qh7Zg1ru987aZRxN2CUwAPfi
 CULp1giVUI0vIU3jg4f/24ZloN1Ie36dpdBV7Ow9PQgrjgOw0Xtl+ArwQryrUySHoH9iXGuD4/t
 9t4EwPAsGHf5dZOaUQ4rM9DUYHaKxX+STgR4cyKyQvvA8eVoxjv1xT/iwMeS96uayrBb5ApiMko
 uoV7LRJEFM7hnDwQgLrgpJhATfYHUuhQ8nnhkd/uYBy6lf4GZTi/1+ioQWD2DoO2671q2/HZicH
 xBOkVRIe9nUkQ5FzHDh8cbJTnkgRyvvIonJ97SpdtdgaBakCVKTThyyNtJuxcKogiZVl4YYiTLs
 HCUdHvsPH7di+yGaT4Q3h/eIyBTXww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/14/25 11:20 AM, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> The previous GPIO numbers were wrong. Update them to the correct
> ones and fix the label.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
