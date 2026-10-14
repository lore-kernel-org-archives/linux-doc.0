Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C65049CF27
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963849; cv=none; b=eAdgvhaguv+WKJDlOH0iQc0SYgzdsPDR2HxbcNecVXt7QGRXFEGYKXTA5cJC9OE9jMV7wGs8mz0oLDkmSnLPlbsXusTy9QgeFO4nSXYyWJ5nsu/VDa7MNo93CJrHQjGzm8p3j59ns9yCYt4Nsb9giAr/epLqQzpe7OnKyMZo1po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963849; c=relaxed/simple;
	bh=R3DH/W8/F1I1fomUgkc5UfikhrAkhPlZqLDVrdjbMIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbTjMmG4X5x6mhR689r/QNrCwqw0W6EBz+BB2H17IGuuo1ErYGacoMljVG2qqj8OjPZHd8lixGF7kn2NmmiGHyCBa0V1BjEws5AKAO+xZwxSWSunguPzzRkGjUstjZKlbL8UJGkr4QG/zMhp/24KwlSfR0OY2KB+8TTplaCCR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lhcs8SBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7oDsdnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lhcs8SBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7oDsdnA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2MXO13000893
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 07:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=; b=Lhcs8SBC/Z8xXDm8
	wb0Mku3t1BE/Vmb+aq3adm51ngjgKzsIBNnwfILHQkXdYMwiBV6198agU4EhpK2c
	LGbJPafhSczm4HnJp+jHGC8Jhm7ZDsOVyHSqBHszolA1I+eFSZyJ1YbzeLHUq6lJ
	3L7ouQuBy3UOp7wSfXRGkQuY7DL4o61npICoB3p4V8zhc9dcqYZK0e9Xu7imZQO6
	tmF6unthzf+Cgarn90hAQPsg0ef8Ej2zGk2gmZXbwuOUullkdG2o9PWi1/sQJMo5
	y6Uhj4pSKPukdsFyCbq7XaFjq5U1K1IHSZZ4e8O4n/SkJVh3cu4vBTop7Fy7UE8E
	1iq2dQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbettpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 07:43:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88629a452e0so1207778b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 00:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791963835; x=1792568635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=;
        b=P7oDsdnA1vpe8FiGcIotHirs9bnzJhQrwZpt6ApfNHSIiHwSHye/U5KVIcRDDwN1Pp
         yLDZhe1S5+5/Vx3yxE80YtCo2cWmFncKsavHgdJv2v93FjdTQRlVMWkQJ9Z6VFD0LWEn
         ENzGc0aePHXVer1N56LEZyWdBAeaDdRPG3OuFs/AVc0QBWYHdpF/SW7Zfzmmn83ST5v1
         TZL2/64L6Vb76W70lzzdzUApUCg0tYXAldr4N9N3/APVd46UGl6RX0Qyq8ijijspN3wF
         nkShJH0S4SPEG4/Qbg4ev06rDS+3NmiVe9Dmr3OX9zHnb8HUR7qSebBh/reI5DCHc7lW
         ZBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963835; x=1792568635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=;
        b=1/XgxdChp4drb5WLclglSZnfPLxRSUnO7tbfnAurRMe6iztJce1uXFzQlceIz/Pt7T
         blI8u3qu7BQcuwaJcLiW0UpnNnaCHLg5b5LInCxZtagcDgZu+hbSy0JpCs60H5c9kJDh
         5zCwKI4H2/JoPQ6ynPZpKrGXhx8VSDntdaPueaClIquzZKnJrMKZFqY+smOkA90TYEKh
         Nr4eQ1YyFXyn7XpcqxACyMjy2IbTYnRq+S+FNcQ1WTnW6o72VBHS2SxCa4Z5pIZTcsIB
         A3Ik9NZbcUCnEHSpGg+Kh2+X3Mi64fkHbkTW1mVCPgvmPCJM3rrsn++WBz0kD+hj+EaB
         2lMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGCS2dYznnRBqtDZwpEJkChNoMSE1uGaX29sKAswalQ9ia6NOjPc2QjAp8NH26oad9bunANT+h6f0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQN3j8uotBaIlfrv86RMuicD4umLfP65rRxrHeqfxNd/8yvFqq
	wSlbl7rumxi4tcLbVWmVn0+mrY78T4wSP4QHR9Yx7G2DRgqcjCZu9c9fkXL01Qblon0WqglvN1t
	D8trVldV8Vs6WrRyBSRqYi2fD73hYJyqI8IzqMopYH6mtR2dz0uAoWu6ryqWk6Bo=
X-Gm-Gg: AYBFou3ONLy/iQN5OmkLOE/xBWvKSIxPy6NdTqlb2tyIhPkrGhTX7I48YcXZEUGf/Ux
	KTICnzjdnfWQUwTXGR+Ndn2ke8KPHNY8fVbUrFGLER5l1YgAJbtjKvLNUuSAsosWGLJPLYehvZ7
	wmPM0BL7QSszbu0d20MtF6hYVH4mWd2I0o4STtosSUBFmFpsFLDV16n4VU0cAav+rWinkq1OSaw
	qRfgtcMi20RyyPUeNHq1Yrwszz78bXifrGJ+LO2f6bkHzDKWQiPggMaE9mFpYBVMxgo4RfBXQVe
	OZBWjTVzwl92L7PyN/MSzo+SkOAnHHEkosj142p0thqDnzBvIVbhZkDoWHlnbiS18ATzlvXB4yV
	7wEDdefHeHamvoyrNnFjx2Jmi2tDQhbiDZWboz+MQkDJjIN0FEMJHFo64yNAOJL+1Jg==
X-Received: by 2002:a05:6a00:414f:b0:87d:e8a0:2389 with SMTP id d2e1a72fcca58-897c6a2ed8emr11225888b3a.21.1791963835185;
        Wed, 14 Oct 2026 00:43:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:414f:b0:87d:e8a0:2389 with SMTP id d2e1a72fcca58-897c6a2ed8emr11225878b3a.21.1791963834667;
        Wed, 14 Oct 2026 00:43:54 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm756056b3a.43.2026.10.14.00.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:43:53 -0700 (PDT)
Message-ID: <43e6dcb5-9735-4e1a-87fd-506ee431fa2c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:43:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com, horms@kernel.org,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com
References: <20261011-qcom_ipq5424_ppe-v2-3-8c7b057e2c43@oss.qualcomm.com>
 <179181021174.434549.3754588049756407155@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <179181021174.434549.3754588049756407155@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: stPsLK_KTU8u6s30XmfleyjTeRkgokWy
X-Proofpoint-GUID: stPsLK_KTU8u6s30XmfleyjTeRkgokWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfXxdAQ2b5x8zCF
 xA7t6TaFT7t39/dbjGY3T7zikuhguBtRVOgC9IobXYdNp6U6pdPhBXg3n+Ayj+Rx3+s9GG6qvXn
 sBYuIsWub9tHZFy7bPY6GI+sfPUTCShGoMxcOZo2tiSWD0uwMKwUrGFNfGRoHB4FGkboXvLh7hu
 ZsdTkcHT476YZ5pOpDZPKeZkbuktml7y4f7197bPicms08SMuaIAIENQ9ZSHKn5qk7DwDPnk73T
 ntyvY4fNZ10BjSwraK8evUW4l4dJbmtfPB16GWvDwR1aslCZf2Vj1cCkznYLWlwEYpNVrzX1k6M
 r1RoQqV2ZHeVbmd+eElZAKHSrtP6exafJczcXBZey5ottFqPmOZ4SGoWLvYErR3JRrTCWKslpj0
 8prQglZ+3qJboO6bWLMqMO0baBWoRqLBn9dt9Eln4qxDFVlYycNmv5yX5D9mil0CkRITSLIfd9F
 t1tgvkO+JQ4lCY72v+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfX8khkwxdH8z6h
 fgMAvoc61hBkZmMLwrWrIgrBxtSfPGL1WSMXsSj39OstCzqdUYWy4S2fRgaS9k49SPJ7WrwVlQA
 zzy9LDiHK4TvK2q/T4okIB8C4W4ZZ8A=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf32bb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EH141z8j1nZSuVZU4S0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140030



On 10/12/2026 9:03 PM, netdev-bot+sashiko@kernel.org wrote:
>> @@ -182,7 +179,7 @@ properties:
>>  
>>    ethernet-ports:
>>      patternProperties:
>> -      "^ethernet-port@[1-6]+$":
>> +      "^ethernet-port@[0-9a-f]+$":
>>          type: object
>>          unevaluatedProperties: false
>>          $ref: ethernet-switch-port.yaml#
> [Severity: High]
> 
> The commit message says:
> 
>   Also match all Ethernet port nodes, so that ports out of the supported
>   range are rejected by the reg limits instead of being left unchecked.
> 
> Does this pattern match all the port nodes the schema accepts? The
> referenced ethernet-switch.yaml accepts both spellings for the container
> and for its children:
> 
> Documentation/devicetree/bindings/net/ethernet-switch.yaml:
> patternProperties:
>   '^(ethernet-)?ports$':
>     type: object
>     unevaluatedProperties: false
>     ...
>     patternProperties:
>       '^(ethernet-)?port@[0-9a-f]+$':
>         type: object
>         description: Ethernet switch ports
> ...
> oneOf:
>   - required:
>       - ports
>   - required:
>       - ethernet-ports
> 
> Take a qcom,ipq5424-ppe node with this child:
> 
>   ethernet-ports {
>       port@5 {
>           reg = <5>;
>       };
>   };
> 
> The port@5 child seems to match only the generic "type: object" pattern
> in ethernet-switch.yaml. That means it counts as evaluated and passes
> unevaluatedProperties: false.
> 
> None of the PPE port checks would run on it:
> - the reg minimum and maximum
> - the IPQ5424 "maximum: 3" limit
> - the required clocks and resets
> - the ethernet-switch-port.yaml reference
> 
> A "ports { port@N { ... }; };" container would skip all of the PPE port
> checks in the same way.
> 
> The new IPQ5424 conditional in allOf uses the same
> "^ethernet-port@[0-9a-f]+$" pattern, and only under ethernet-ports, so it
> has the same gap. Later patches in the series don't seem to change these
> patterns.
> 
> Could both this pattern and the IPQ5424 conditional use
> '^(ethernet-)?ports$' and '^(ethernet-)?port@[0-9a-f]+$', as qca8k.yaml,
> mt7530.yaml and lan966x-switch.yaml do?
> 
> [ ... ]

The PPE ports are Ethernet ports, so this binding uses only the
"ethernet-ports" / "ethernet-port@N" names, as required in the earlier
review of this binding. The PPE port checks, including the IPQ5424
"maximum: 3" limit, are meant for these nodes.
