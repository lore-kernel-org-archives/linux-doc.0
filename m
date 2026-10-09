Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4393A5431
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517371; cv=none; b=DXAm0jG+M+4miTfbA6Bqvgu7NvRe0EkxvbJJjZnwcweZyhoY9oDLrkkSCmfcWhM2YsilypRxE9Df6Hs7Pq7OdZA7dFbqJPeVrPzyagdw3uWNjaB6Opqbo3MC5oHulZZqpxo5+bVKKyf2EGk178QIOs/pBJmAeXwTYSRCHU6ef78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517371; c=relaxed/simple;
	bh=oMmbNnz932x0fDcbEC3ogsWJcritc4/OIAiDDCwdyVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqAtUja+O8bkfXgioUBAJIOUh+gdgOEKtmJCt6oeSeH3GQyTM83Q/mB1OVo/1sinoMgI41Ns8hhUEZ8rc+FXg798jQOZMfEjC6YdPrsjN9JFf+nXJqz8h+fUaCHpnyyLB8Roy6OzoHCc0FTXbkmL1o69irN/ih1RTJVlaoNxCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5KBbTJR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AotsR3ZT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5KBbTJR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AotsR3ZT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HlEY250766
	for <linux-doc@vger.kernel.org>; Fri, 9 Oct 2026 03:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=; b=E5KBbTJRdB/IPv5L
	HPEJG1sGFDtiA8Ok8DX7DysczMA7y/EvzCmu9GobIIJShNphngiMCcgHBCMvSxCQ
	zI8UET9o3q9qLtpnwJvBrP30Oa5eE7zZIDmOtPYUM30HMOvCZ87eWWkAzfnm/H1p
	Pta8NHDJFoVR51mIbqn1fl2e2FN6dRoRO0CENgkTqyJwSw2Qlt+E+GsYAHoMT7RC
	O+9n/DzRb1Pp0bEJVwdgbaFQLeYoWp2jWpfN6ltAVQH+TN4rfoHv4gcuWHzsqb0n
	5EcWPKSwqV1TwdxcmAGuMws4LLoQ4PQmUjeAkogsMkOBz843AqH6qPsQh1iS4UOM
	KTtcWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqsu48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 03:42:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so1792503a91.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 20:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791517362; x=1792122162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=;
        b=AotsR3ZTYTRX9x9rHbxLJ88Pny98XfK1xn8jCOCzEhL1PrZ7b0tPv/5V7mVQUij+rZ
         cfhIIWW3V3cY9aKqgdDWPsNNmcKDd/MDHoZme9GJVftG3/Uz47NnX9wcaz0tRuvi0PeP
         z8TOhzpvygCyrAqurA4ErN55eaafoawgswNUSm1aOTBD5PIVYfRmfFQyM5625DY1DmgS
         KBFWB+kxJ7JI9dZDfdw2gvyDPJkFij+ojVkjCz/rrjgwp7sJa7fGfvIpGh7Yo+Qplayc
         mQxec3Unq2wqTQ8FVzRuEzs8WSRLKL/H48nHe2HnGRYfbmRRJaIz3THWHBPMxHxpjSoM
         ZWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791517362; x=1792122162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1z7NeV5zzw+Qh/Xy7bTSMaYqP4hRm0zEwpbgCNxVr4=;
        b=plV0YW904mzMVnRGhfTfdksiBXrIzjA6J9OQ0GlkDzaQhzqhChIKx5SK3bLRH0jGcY
         MkqbFmia2+rQXpPw+CdztAYw/dXrkfgM7VpequTAssKN2UokF0f6q2HyWjn473Y4s3FQ
         yqkGmZ0VeDkYrJMcmMM+mmFn+mou7b66pFsJcpqKKLoRx+cH9axJVa+ua0p1WFwZW5dR
         5UJYHQnjwrS5D5f3qZHL1bEQ+uhgR851ZfPrd6qO1TmieifYacH2OzQjerl7d5oyo+Oz
         av8XCR6dp+Jmkpm7gHobr3oaCAgpjVbHjVxsiQqmp7siPV1LOtCwXuqg/Jh+9r5HSyaU
         D6IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAc4cSmx8UAUZ5sfxdVdR0Sy3fKQmWJeRYRcMHxaa22GkKgGfgVkzBmfko79NRTmiQvwuixc7GE/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg2NyvkuBU/sgOc97+ZHWL/xQZr0vxPpL7JJYZUo+2FBCdaihc
	G8iLkyDBRD0l7Al9qJqNeU+RPbDrX2zgp7XEYK/LPBJdnO03B2vTqJxNTJt/lfQhXjKukO9eDxE
	rc566G34r9R9qX9jwViETFJIQpUwm/asowG0IsMnNs0NYooskQxsE3UfoijyKEhs=
X-Gm-Gg: AYBFou1QCkw44GtPfkjvMPHyJ4Qk5ctqyDezGI6HPFhwAnn8XKfvl3aTGommSTr4scG
	q+1FZn4tS84tVu4G6SaaoGFa8L+RWsu9Y4DCXQHsz5ZdktF99VYqvy9WWTyNrkfeVO9907A3+fI
	QNKAlESHqskRr8whmmG/u8gJVo1Yi2Kk/wO9Oge9T/9BAk8UffnisOGzMe46Q9DUyGuJ9ZAk0dB
	un8QNuKCtVzrMUtV8cC+jWUYLZoiuJItfsK52+9i3dYqy8TDXqmQ6tp52sG4mP3CTWZQFGTxl93
	TNtjeJm7S++XmDQbj8HldHiLQIcwswP/Mwzd1C6p73/Kwrl2imwtOeqQIOwGV9aR+AB/q/SnVSc
	tCUzqjHYKdExGTyWS7Fie
X-Received: by 2002:a17:90b:2d82:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3ab3acdc391mr403471a91.38.1791517362055;
        Thu, 08 Oct 2026 20:42:42 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3ab3acdc391mr403427a91.38.1791517360547;
        Thu, 08 Oct 2026 20:42:40 -0700 (PDT)
Received: from [10.92.18.229] ([114.94.8.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm1351959a91.7.2026.10.08.20.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 20:42:40 -0700 (PDT)
Message-ID: <4272947d-a9df-4cf2-b890-c2b2392800e5@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:42:33 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/11] net: ethernet: qualcomm: ppe: Add support
 for IPQ5424 SoC
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <179147126645.2527009.13829110581548714861@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <179147126645.2527009.13829110581548714861@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNCBTYWx0ZWRfX9q/h25O9tlnd
 1qpbdhMnLujpiNYBOnfuXzP2imPFBrXzpXRfR21mTZ4SKvMGBj5Ev7p1pfAxKbxshSJGHwL2BgB
 RsJgMjrO88KrHHVvMMTVIU+6RAAtDxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNCBTYWx0ZWRfX1YNec3LjEr3n
 WokquesnNQ2GMIYS7wq5qxvw7GJVLSX+b9esB/GSVpEfhHxDiPgLcNC5dFEmof+a1OCK6SfYbjH
 sJZuNDRYWO5IlpKtIWCDCHggRE2Mcc7IKpz1rpwLudaupgmBvZ1a7DkqteLGii3aVomGDhHw1Pj
 /THucU6PnTlJ8JgzSZpmd2fXoc9783t+9zB2w9YP/R+usoLMLWkzGsZvR6Q/9Pjf4pLYJwNY/J0
 7YSOsBy4gCXqOEUsDu82Kru/kveX7jIuteV4TEES5I4ztVCahIrCDX5FYf3fWPiKmH7TeIEnhdP
 n0/L9ifLXTDRpfWQKJA1hNltZLlCe3F7Lf3z10+bbHFcMMUnK5m7IDxZyQ565Zwzq3yldirrNPC
 +JBprWFA6AzbkJelL6I1wrANHlc8L20JwkPT3dDD2QuV0RS6Z+OPVuRHu2XuFBtRb5gP/jKlxZp
 MlYL7V/1HkXnEx4o+CQ==
X-Proofpoint-GUID: 1bqpZwmP4Oo3FnkHUKs2CT8D2Y5bIRzJ
X-Proofpoint-ORIG-GUID: 1bqpZwmP4Oo3FnkHUKs2CT8D2Y5bIRzJ
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac862b3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=+dQloWKbpC4JZN4npCJT8A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=wfrYX8O7EWgUh0Dss7UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090014



On 10/8/2026 10:54 PM, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Both issues are theoretical. Neither was hit in production or reported
by users.

Patch 1 (dt-bindings: Split EDMA reset into sys and apb): [found by
manual code inspection while developing the IPQ524 PPE driver]. EDMA
driver is not upstream yet, and no in-tree device tree uses the
ethernet-dma node, so the issue cannot be triggered today.

Patch 2 (ppe: Fix multicast queue config table index): found by the code
inspection. It was not seen as a crash or an error message; [the
multicast queue thresholds are left unconfigured without any visible
failure].

The series was tested on the Qualcomm IPQ9574 RDP433 and IPQ5424 RDP466
boards.
