Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B601A9B3D
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041314; cv=none; b=d4tSZg8J7gpPWovQjdgXmqPa+MyYwCtFK9Md/lc3GzarsW9NOZk8DckFJ5ZFJuXrMkr0OkjLWwp7u1qsalTkmJrreKOerVQUnLBOK7PVlPQRr/Tcn6ungLf88uVS4izLYOT7zfzxkk6mhOJNZ8dl7+aiB+ZsSwS9xTyam45WnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041314; c=relaxed/simple;
	bh=30vgKdy5n94b1DNeLRG5PLw2PPMa/I/W7Pqq9Wsa51w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KL1+1E6rS200xAmrDMAWpJsgbNxZTWWHi8VHZLjeiB8HZDr8l/2zxIjo/TKFcgeIZgq1fIDcG3zY/ZUDROROH3bD3sayYWVgRu7CsCNtKANVbIqozMHrbgFDlR0Bj8uXhd6iJaUad+v2qBkB4zVx0Mm0zMnwPkSsCbo3a6DCdbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBC50qEi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBC50qEi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBVp8m015157
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 16:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8S/q69+hMXzlKm1t8hoFvS7fzscnXnzVXeG/Aysk4A=; b=TBC50qEikpNwSDDm
	cBrC48K85w4D7KXqQRgKZsP8yS5P+ij4btN1s5LjIA7iIGixJK+TmreJKYmAeXaG
	IGi7CrpzqKey8wweQalmj7GB7Ht6M4qMPx0CGiWFfhz7LHJmV1NqfDlk6zgIz5p+
	y+ZxXn68Pr02GC/PyLKaEcw7c7b7jYByvSzfB+b1rZvOb509kss3Kmv0KExAzFUV
	mhLa8JgaZ/e/zP957DD9sHeIeehrDk+Xz1a9Z1McSVT6e3FYCFPRroe4QpBu15Xr
	mOWCIbSF7mKXCUWjcIu6iUxA6l9MwPyx00idDae+RTMuTHjODgkZFwTUINcg4Y2M
	9mN1tQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn17vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 16:21:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d440beeb17so19681485a.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 09:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041311; x=1751646111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8S/q69+hMXzlKm1t8hoFvS7fzscnXnzVXeG/Aysk4A=;
        b=kAstD5tnYwQm1hEvEtUIqqAxqp1yybXY+D+4J8RQ2SoX8b7iO6jZwsXa22nk0TiRs8
         5tuTvg2PJ2Xc3Y+mBM3jhDuBfH4JQrlE8rdSPgruCxXuf1RR0x6zqdEgzvcfdgWthgPX
         uY6sHqYCGu4I4xMLXoUpYWNjI0M06fsDnWsHo+MbISEq0au3FnoF+ocY1C9vOZaK0tJN
         q62J0QatFoy47kd/Xg9twJ8DUW0kLV/nMoXB48HUp/RQXjw4bu36KPprn7aIgi7shAi1
         WPYG1u6aRu5eSsykiY6CjJeBdpvx47nJc598wAKWkkMsIYzeiZdQWSrlmjWlMctYW0Hi
         BSDA==
X-Forwarded-Encrypted: i=1; AJvYcCVVevjG7KQS5rzZvA7kQmowSUZFW+qAvOUDcPwhmzQXiFTGnfg8rd3Yg5I42bXjW/PWOLC3WxxQk2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrNd61QVcb1Vs6/TJZ9rRoYKQtubN+yPIRVC7U7icJ92oopmYP
	7H3hzjqq/OWCK20fiZyJ4OcKSLIgvfMaNRuNqMr/r5tqdKQ8EJwXlEydnEsXfq2Y6z3PjT9lgqG
	NJMIOq6CB0U8cnLCzD5IvJT7hUCj419mgBFq0ZptYPhYTwy3KtsC8QIKUp7upBuM=
X-Gm-Gg: ASbGncvnKR0UGKWLwdbD0ZjU8lY9BtoJxrkiVz8R7PyvFFI/IsFo9YwJR6pxOrcvvzt
	mWH2m7/chECf93MEdWbUZBXa3r9xVTC1vzV1bAidiEdhCcDqF1FrSPop/woGtVyOHJg0x9K3+gJ
	63rVucPUmNnshD3elbm0ntoC3o4N9wNdqerhkJMHnTrgWQWvzkuUJFiHTYQBjtel899WGe34NlR
	QPPGJM8+b7rxfREMLV4uOFjgt0bLTc9cZjzeGjNK5DDda/qJ3FaXXf0tweyPzEHSqxIU/ptINNs
	3o+XP/iWuwGyCwWegT29sZtpHJJGBj5NsO2jasjNWfEOs+GHDZjdISgxbL8Zn+hKuwMdGRSNB16
	JEds=
X-Received: by 2002:a05:620a:1925:b0:7d4:2901:2b3c with SMTP id af79cd13be357-7d4439b51a3mr212887385a.9.1751041310919;
        Fri, 27 Jun 2025 09:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1SPxuQsD4kZcYVOTyATUEwOXLUOsQYA3SYR1WoncAoVYNaaL5puLHJyjBBdfcBGSK7mKW7w==
X-Received: by 2002:a05:620a:1925:b0:7d4:2901:2b3c with SMTP id af79cd13be357-7d4439b51a3mr212884385a.9.1751041310357;
        Fri, 27 Jun 2025 09:21:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a016sm153479966b.57.2025.06.27.09.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:21:49 -0700 (PDT)
Message-ID: <4556893f-982b-435d-aed1-d661ee31f862@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:21:47 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250626-qcom_ipq_ppe-v5-3-95bdc6b8f6ff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d_AgjCAUbG0E2FMaTwMFNay88ZbikFdD
X-Proofpoint-ORIG-GUID: d_AgjCAUbG0E2FMaTwMFNay88ZbikFdD
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685ec520 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=JRFc35xCpNCPHeNcAxQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX2eVwgm9660nU
 dO14z5x2ahNiRlZp+g+mmhyNmGWo9jUFxZT9AZHDNOXHtoC8Dlvfpv3gNmbDAnp6c1tcBguSlf2
 3uXUf6ulkVVK0K2TRnd6VZmo1x7Nl6Xs2mRGD5SSxvIuXhETD6fOxZ9F8cujlBqaARoFlzBld51
 zEwL6tHYu6Okr4u+ri14jJYwAugS7huBLjI2I2qY2R9e8MagW0PqhIt8u6SFa1yyafv5/gztR4h
 kQoxLXe0x/UVxEEPUP2DZojJn9dGIUWKa+yaQsszM3DCmpgH6lQqQmD6qcjZ+763uQmbGwoUcOX
 ED+JgH4fN7wfVR6L6jTNKiE72z0vU+zcIWIoFav7jTgrimXGjulUtc08A9YdhURWbSJRxz/hwqy
 37/04Crum0KU/e/lY2uSmRSe56ZjK79QWo+0MzQe0XdU9nMHQ7UP6JBbUIxG1XOg/wWD4N6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270133

On 6/26/25 4:31 PM, Luo Jie wrote:
> The PPE (Packet Process Engine) hardware block is available on Qualcomm
> IPQ SoC that support PPE architecture, such as IPQ9574.
> 
> The PPE in IPQ9574 includes six integrated ethernet MAC for 6 PPE ports,
> buffer management, queue management and scheduler functions. The MACs
> can connect with the external PHY or switch devices using the UNIPHY PCS
> block available in the SoC.
> 
> The PPE also includes various packet processing offload capabilities
> such as L3 routing and L2 bridging, VLAN and tunnel processing offload.
> It also includes Ethernet DMA function for transferring packets between
> ARM cores and PPE ethernet ports.
> 
> This patch adds the base source files and Makefiles for the PPE driver
> such as platform driver registration, clock initialization, and PPE
> reset routines.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

[...]

> +static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
> +{
> +	unsigned long ppe_rate = ppe_dev->clk_rate;
> +	struct device *dev = ppe_dev->dev;
> +	struct reset_control *rstc;
> +	struct clk_bulk_data *clks;
> +	struct clk *clk;
> +	int ret, i;
> +
> +	for (i = 0; i < ppe_dev->num_icc_paths; i++) {
> +		ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
> +		ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
> +					       Bps_to_icc(ppe_rate);
> +		ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
> +						Bps_to_icc(ppe_rate);
> +	}

Can you not just set ppe_dev->icc_paths to ppe_icc_data?

Konrad
