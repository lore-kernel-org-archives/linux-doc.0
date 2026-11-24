Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563991;
	b=x8sIazw7k3/DKs92kL1TS4kO77O/IYWHSNe+lhh2TA0/8QqBwry5mFC+D69RaXyZYuIM
	 /R8ihG3KO7ms6SUQIHceSvrb77t2RVCMoFfa0HqmKNaHcP2Tx54UYqwe37GQ6OWHGsGiv
	 EWNIidYWvOMLquoMGa2dVxD+kXdN9mhakcjgmDyJKXkZ1fhrXZUjfkhgMNKbSFYsZRqCa
	 Ufr0xylyqRL87ZxRlfUzSN1XkgZSjz+lkzySI4PEoAMMnI4u/8CkPSSD4RWqBcuVCbS73
	 1w5yVlaQZwfkhEkVY1HURZ80jbX0op/oNfqTdNrPA8kas1kerivNgVIVlUy7yEgtZHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
	b=Un/DwiY6eflyPoayNLf9H9zZwDZWh8FAq3IthBshA+Jui/KqAPggWdgsAdtvz/7yHBXY
	 ooASCcarviJEFk2NFvUhM+TRdDRywhARCXe/IoDBfacVmiDsh7DlnFdU/0FKPJz5mR6u0
	 /RpPQOP0XxCabvp3IT0xW3YoGdU+D7ON7KDT627bKpUhPGXXZqJ8r4jCXPQ/J2VsrhSpE
	 zfGEAIpqHgkP2lQqZd6cdE4+ynBI4k1S2lAyOJDMZKT4w9vXTYnLIY7KDvtDxwEIOqVS1
	 QcT7IDx/UHTgqwOSe9nOxdXdxuqmWu/b/nHruAJqMmCHCTkAlKr/1tXgXqb6SvQGXyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMs8C6eq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172E606A321
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A172E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMs8C6eq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMaf8m2830277
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=; b=CUa2qDGttwLbSHCe
	3/pC86Ngts4KXgnbkhsDq/KclOuhAVRzaTqbMXG/Vg+On3NjvZqF1nm5/iSTOcm+
	tpP1nId2DuTIHQU4UbYXU4F4YToDCFwCAiTfAxw4r3S8BWbq7x7gxJpMCzan36d/
	v3Nmwt9JgL01GAFGwrpi53seHnHUhefzuDFplx2m8PSUAhWWcjIswqyk1+Bsasti
	W/+b53ygej1z4kJetQ9I/1B77I7q2JnCJKo+uFqRtwzjR1HHlABiLkYkPAMS45J+
	8dRr/QwxDemzJRrsJpMpS6TOhglWR4ggdG2gHR95jFd5toa9OogBGhjQ/LZyG877
	N8z3HA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxka1mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:46:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so3944566eec.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563989; x=1796168789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=dMs8C6eqRPCtEBWcVED492Bexr9FYlS+abGyMDHGZoVtgWNStmm/juYzjc+0h5DBEj
         GHr1ozSZinhyv/jn8z23lnp9z5ExnZ8yG1fmE2ZC5c4NQtZchsfqGw5oYyX8OLCLWMhu
         ghxhguOShbUXMsdtzChNhJ2HGNensBOVYcCv0fw7fZeEiULXcVZwSyrp+OhKx3NIS0rS
         pZnI841DTJK0ptnA7JCM+yKq/FoyWkVkMCCBPLsU9jwxy99GTUmZz1SGR4wT9zTcUj1Y
         5wa+V/BJrVH8AOAEp9vJn/I/fowKmiIc+LL+me9krhALTcyWX9ss6eV7GFIhLEIUKREE
         5Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563989; x=1796168789;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=oTS0UUy4juc6u7kv5/jpdUndWqRCu44yQCNp7DFFFEPAl8BMYw82gtNsBuvI7Jmhpr
         goqxpVLMWBGZ/zUgYQznrXfxPk0heAv2u7INVX3ku+tO+XejNcXc/dEWDXOGQUMCZUzv
         KOTgZGIAo6dvech2by1FdQ/6Ox0Ibzpl31ZHR9VTX+KJ2yv0egk5QqQIgLcfRos3SkxD
         qMCoXlxb0sDFUFXfqPnnBFprAKmVwwj3cP2SNa/PnCInOFPWy6n49iDDSY3sIuc9W8ED
         GUQZR2MeSAy4DankvtzjTaAHZtsPmq6FCwsX6ieQ0SPdVT9//HT+cColLMhndYDZOvf6
         Yl8g==
X-Forwarded-Encrypted: i=1; AL+hErHWr3nGOtc31EE2ayIM2PYR3YnBEvw3M2LJlXfftF0mypx8oc4FkNXrHDA7fxmEJNKgUyTRzSxgu2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z952o3tzUrIMzfGilFbNUGirRHCU7h0AblqU4Q7aSByPQvRC7Kn
	I6LwXcD5eVkNtBEWXtfJ+DqMJtOV1LTy2xXNyT3Nz3YroXcohEkoZ0WdC7n95bDrTNJWLpseQR7
	EyD/8AoQUARN9X7drrOiUiIppq1+G0+/9NFaS+CGgFks/DW9+HrKbdW3bKf6nbe8=
X-Gm-Gg: AZFdTZcvT6hk0+vIRxQUp0b4R/HhCNWjE90aMrapJ7I60Lp/1O29jKWEv/IjfEqbrvt
	EesTBSJ/2rCcPfcODay6VxEsYVE1sEXi5nXvqzqQusgzxdz5iNtH9WsrKGlhC3dXAcvfRlTa4Eu
	m6lOJunZt74IjOBzvzBpI+9P3ST6YqfiqEUZFwocRcWo5iyvsGVePlX8toRPvz3MBf04tmzQ5pa
	Vlfrf8jVl7ptLc6Va33ErNKsT4fMrjAUARiWr8M8pvt79ASSZG8FU7p1EoTFqFP9j6fZNkD8UIh
	JCbxdpv7SfRpse4iYfHesHRE6MMRnwBlLfER1nN8a0XzTHXTWmeugof1bnGp4mrLzpxOInvoxNa
	jllzUl/vswBnRCUu5gwD7/I3bHaHEBQ++L09y+zD5zVM4dHvgZdR8zWwgSXC90C5vtUxGJHHntR
	d0TLKprALjMf6HMo5NPHNFqpaHpFg7
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027359eec.29.1795563988959;
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027324eec.29.1795563988410;
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm57314365eec.10.2026.11.24.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Date: Tue, 24 Nov 2026 15:46:23 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com,
        "Rob
 Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v17 09/34] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <20261124154623.00000587@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-10-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-10-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX5yLbvhSRRa2l
 eS5H8mHEzWUGXeWyKEjZiSBQlxJKVSvJf4vu8W9NgOFD0HUB3Qox55anY5dLK/f1cZGFAElf0SY
 6mbajf/L2gYscX8HVyw0IUtZSTtXEB4t7kofcL6eb4YZGyps9kd+q767+05+f2z50nj2g5QIBjo
 4vYAGAeV/9dig3WpiQNKWDgEo8stufIjAHKSFAr98sEX+dFyw0XOPljd97ZQaP6WiPHXOUZC7ax
 V9WHC3ByvHA/6ukQckiAPnYDuBmmHd7Nl5pGT4yydk46DAKSeNuSQHNVGwqVe7fQjB+UO2y+gfG
 D31VZEXGoYVsQ2tWH+rA0wE7Fp5F6ffiJ7ZvpEG+Nbi5Cxha//NaBLPlzT8etfH4Zgdy4CCc6/s
 iXxabcUg/VTXf/nerzQ1ft7LUXX9vSSal2P+aWmI+rHinvo9rJdoZth2k5RoJQ/KSZ+pYtD4yy9
 dWN1o3dWRJxEs1vSQXw==
X-Proofpoint-GUID: W-CvawEWynrxHk5OkyiGnyOpMxxVF1PQ
X-Proofpoint-ORIG-GUID: W-CvawEWynrxHk5OkyiGnyOpMxxVF1PQ
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b0621d5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cq6dmUWW68VXehLBlYkA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfXwKqIgvNDV8Sc
 s2fAhZ3PDf7bD8lHeRaDD2Cd3No23zvxnezdcwi7ZsMVJTg/xeT0RsxmkJrMr34/zlhFL4Zpkf7
 A7NE6e4OOjRVv5foqQJDubcClmISXUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240093

On Tue, 24 Nov 2026 19:48:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
