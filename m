Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2829008F
	for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753876633; cv=none; b=btqHXVpNJZ51WbLqXeFL3cYU/EQ34PblApMpDPweCZK4bjyoBObz2nTq/cGYVNO9KrE0yKy1pW44g9l5cZ8M81zJMf+YD70rLHpGvWIznAnmFk/OwrMnQPdzHA+ocKq2mDZ72PTISa3ODGCvD8G9C3nIP3UreOrjnsvHf45wcHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753876633; c=relaxed/simple;
	bh=+eRDzekTqZXJk8PBWToJk0rTOuC+gK36unHXlpT7R3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDEE3V0ob3A5dLi78BezwGqf/yKf188qy9nAEiqUmoi4V/x9bq1shw8sxW+5n4gPV7cQdMzT8xcwT0c+3OQvqp1tTt03SXsC9WiSn5J6KaD1iJXq1IYF2b4jptFzn+pBpr9+1xcZ+OlrKmfEHXtylCml4nA3PsGWPMvrBO/NsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mx2is+/0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mx2is+/0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U66V6t004997
	for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 11:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIcjeDS7h8ogUXxvg4ORZjBG3hxtqpSdWr0+tiwbntc=; b=mx2is+/0fcYAIXjS
	K6AjbVbXpF6WdJTnlXVg0K1oy6kkvtcj869yStnAx3zvac/0hyyPFlQgrq346N5U
	JRkVtHpyrS8xU4HXYEWrv9qJxutLAjQpGJZi/qLiP3sFF9VmvXXgYHe5PgEtNHBs
	dws3DB49dUks3+pH2uAc/ssZxy+hdxKDV+MjPb84BgB2FoXjXeKrLzc5uiu21qDL
	cAwulemQGW7FQl5txt667736cbyWU5QNiKpUWq3hJvYfi3SBQDidee8YHINbis/q
	WKrlyGog8ZA00f2T+1ruOcORKbSfupyl0vx+LtH7pnCX/Xv3ijooEl/kf1z0dgHy
	ZNH9kw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu3yfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 11:57:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e48325048aso50614485a.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 04:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753876628; x=1754481428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIcjeDS7h8ogUXxvg4ORZjBG3hxtqpSdWr0+tiwbntc=;
        b=pogSJNSOOy682mubqIFKjsx+cieCWJERRRPobCIIiEZiCjjHMkQDlPL/Lx8wrKydlx
         ehoSMlPreb5ihc0iOhJRQ2onVrmW8SKgme8mJ43zjBmetBsq8nyGX+K1lBATO5/XJId+
         TczrueuIJmMeuMlFt3xIO6uDrojPRb2beNfIxS7GBpoZbb+mP6z9fiPLJaJsMHBMgmJT
         t/qYn3Nyc1avENXAGfm9TJ07CNhW31Ig1rAkH2lC/CCFPGtDjHwMqOKjfdxKcW/zr7zr
         rI5+jNFa4PbU+K6RSctlM1eZ56ifnoMXnbDoPH5UhT6uWQT3roJrYwT5nonGaGkfd+tz
         EwYg==
X-Forwarded-Encrypted: i=1; AJvYcCVykpAGeLu9amTr45cxUNUsfzrHzj2XCnNP5LQMvBolRg7JaJn4bOhzn/EJtAh+TxG4hCC5i04bH6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0tz42NSlq+XQwAVhggsP3X02t19hYboka0p/yrUiNqWg4D4uK
	huq+XeI+xNlARBJfqJXBk9fPzF40J87ps85rzwPToqRy9ZUXvRq1s1Z87CziaXfYQXDwpIwg9CP
	AUb8LWvXot+YJV0cGMyoRPlD989e86Rmp83Z7iBXnAJaIB7RG5u55kjynvG/TcPE=
X-Gm-Gg: ASbGnctMHr4PKdFEFaf0U2thh9UXxc/U7DJOOvM5tvxDKvX18RAaihrlfSihTgtWjoZ
	48q/ZdASrepl9nEjPaJ16HfJuDmOg6zFDWSmCuem41bXFAvMGL83TOnJy3f71jfIDmzBXDLBbVL
	eoPrNcklPfrkA7RL9NYLC9Vut2zkA0Dz02RYCQLqp4wHu8proLXLw+gdS94G3FcLl9L3tTjBA44
	gir6nywtYSj2OiMO4ZlrCvC35qWs0v4EaZYbrhe9iu7CgWWfboVS1OZQK+UHz8ksabVD3wdNDsZ
	IQf/26TdiW+Dpehd1jVbpm6jB3uVmObK94CNmYpA/PzVcAYSFiAugrcFbdCe5AdR8df8mMQG6BF
	EAYPHlv7v+xOjLlh/PQ==
X-Received: by 2002:a05:620a:424a:b0:7e6:28a9:db0d with SMTP id af79cd13be357-7e66ef809d0mr222333585a.1.1753876628432;
        Wed, 30 Jul 2025 04:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZwDA7UZeel7Rz4M2kn1nFFS9iWCkYbP4GPLBRHIUG1gQp3Hpc/hlmL7J3fAcf+IqUnB0SfA==
X-Received: by 2002:a05:620a:424a:b0:7e6:28a9:db0d with SMTP id af79cd13be357-7e66ef809d0mr222330685a.1.1753876627944;
        Wed, 30 Jul 2025 04:57:07 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63589cab0sm728955766b.38.2025.07.30.04.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 04:57:07 -0700 (PDT)
Message-ID: <4e9ec735-1278-4475-8898-1e12ccb94909@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 13:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-3-95bdc6b8f6ff@quicinc.com>
 <4556893f-982b-435d-aed1-d661ee31f862@oss.qualcomm.com>
 <e768d295-843c-431d-b439-e2ed07de638e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e768d295-843c-431d-b439-e2ed07de638e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Rr2SRz6vXdj_DzUcw1wvNgs_BQmDOKcO
X-Proofpoint-ORIG-GUID: Rr2SRz6vXdj_DzUcw1wvNgs_BQmDOKcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4NSBTYWx0ZWRfX3VqbsPcvopZX
 ZsVH/sq7kTVgM/8+845tBzcdEAbifByCbokMVdtqm6BQYdP3viq2kB9evAAfFCTVlorKVFuGS00
 6AUbsp+/SXElTiarRN6glTL2aou7FDvTmljfEvSRzLkOOE/U4OsilcszO1fAJspP064WKbHZPOo
 naY+iHJcQLsTmqAzaNieN1zxQRZ8uDpyVcA/EhxRF0pEMv+clUQ/ujqRRE5Lg3+CX6/7UZNHqAz
 ou81Y/C/8kGOzGDwo/3/5OTn/o+T2kDhcK0dqMnLsj9n2uTKdMPWetvFCn+yq4CKlt5RVJ97H8+
 7mPIbqpNY7dTAYV+Og8SMCW7juMIwIFxO5IewBCtOb2liMjiet1XETN1CsxLFulGuNP7md6f5bY
 lgimUHa+Aw8AE3v2Y2hwiJ7U1VBt9EhdKhpgiTcprjpaGuq87JLoJaj2Qhk3aEMEooUTOsIv
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688a0895 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=hn1M32U-3FIS6ASJhmIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300085

On 7/1/25 2:24 PM, Luo Jie wrote:
> 
> 
> On 6/28/2025 12:21 AM, Konrad Dybcio wrote:
>> On 6/26/25 4:31 PM, Luo Jie wrote:
>>> The PPE (Packet Process Engine) hardware block is available on Qualcomm
>>> IPQ SoC that support PPE architecture, such as IPQ9574.
>>>
>>> The PPE in IPQ9574 includes six integrated ethernet MAC for 6 PPE ports,
>>> buffer management, queue management and scheduler functions. The MACs
>>> can connect with the external PHY or switch devices using the UNIPHY PCS
>>> block available in the SoC.
>>>
>>> The PPE also includes various packet processing offload capabilities
>>> such as L3 routing and L2 bridging, VLAN and tunnel processing offload.
>>> It also includes Ethernet DMA function for transferring packets between
>>> ARM cores and PPE ethernet ports.
>>>
>>> This patch adds the base source files and Makefiles for the PPE driver
>>> such as platform driver registration, clock initialization, and PPE
>>> reset routines.
>>>
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
>>> +{
>>> +    unsigned long ppe_rate = ppe_dev->clk_rate;
>>> +    struct device *dev = ppe_dev->dev;
>>> +    struct reset_control *rstc;
>>> +    struct clk_bulk_data *clks;
>>> +    struct clk *clk;
>>> +    int ret, i;
>>> +
>>> +    for (i = 0; i < ppe_dev->num_icc_paths; i++) {
>>> +        ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
>>> +        ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
>>> +                           Bps_to_icc(ppe_rate);
>>> +        ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
>>> +                        Bps_to_icc(ppe_rate);
>>> +    }
>>
>> Can you not just set ppe_dev->icc_paths to ppe_icc_data?
>>
>> Konrad
> 
> The `avg_bw` and `peak_bw` for two of the PPE ICC clocks ('ppe' and
> 'ppe_cfg') vary across different SoCs and they need to be read from
> platform data. They are not pre-defined in `ppe_icc_data` array.
> Therefore, we use this format to assign `icc_paths`, allowing us to
> accommodate cases where `avg_bw` and `peak_bw` are not predefined.
> Hope this is fine. Thanks.

You're currently hardcoding the clock rate, which one of the comments
suggests is where the bw values come from. Is there a formula that we
could calculate the necessary bandwidth based on?

We could then clk_get_rate() and do it dynamically

Konrad
