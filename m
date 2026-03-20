Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E50235F19C
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000080; cv=none; b=TxSe82DbczS3M1mu6xWlaoTUo0KrSj7ZNtwEX3V99gX4F9qz4aHICOU4Y2gIpXCcOhAjbnl97Buia6hTnHcn2gDtohJWbVyU84WtEBlVNC96wVOHFgkPvLSfAkza/IiSa32GC8YC74/MjrKu0DV63yeFsPihlFCY+E/UtKJb6go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000080; c=relaxed/simple;
	bh=UnrE1EYl2UhzK3q0AG8c7jKtom/DRBJh4SsDJNISEvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY0GIPnebPXeodduqJ613L/V04Iv/lvteCYxYzulxICaKkcCtjlIx747DD60wkFZ8HuLr9AkRnlcBXcBuLWvIBhOwC1hemPMn0D0i5eCpt4q9qd8LJ4YYmbdrCPazgOcpmCcRMlc14VtZUTg1SJ9cpJQ7qcibxiGeJMGyDZhFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRQjYG3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqvT1G+6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRQjYG3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqvT1G+6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2Xi8N3557540
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 09:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gN+RusSI22KRsuRRKGocsyZ7gd4d20kVuf92TgQBQfw=; b=MRQjYG3thjoLXucI
	6oVn0rgT4rq1Gyw0InqZjbm3xUNT50fNg2IdXUGtkdXO9ByEreMWu3D/jOpCORg8
	bNpKSBWM6v1GMJohSznhRyOcCKXAQTm/5SxDGN5hzha0NWcelx9AYssbnjNSTHD2
	NT0mAWIiuvbMhTPCcu5GrHGO1nZ/eXtGsVU5l5HKKYoRB1p47m60xi7PaGdJmlQx
	mlzXHOkavHOLwEGHKXCvjrweONZ6mvhZ23O3e8oneMbJmcK++cAn6qKb4ayXfsyN
	a09hQeytnUHqe0fQU5526VJlH3ROLTtlehMHSnJi+cUDhvn+rcEc8W2FqGVPUw1i
	6fn8yw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0r1gsry7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 09:47:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso126017681cf.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774000078; x=1774604878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gN+RusSI22KRsuRRKGocsyZ7gd4d20kVuf92TgQBQfw=;
        b=TqvT1G+60lwcyTWqpmL+Uba9Hx3RpjQ/YMzmMPVOuaKz+hBGl9b/hfOSeqU1AGyfbK
         n1L7IVkc+fJNqn/3vIgZdWxJbkEIMGXhbRRmvC0LW2rRPrJPwaeQRVculEfz/yd3WMiZ
         qz7XGHFBjFa1CnZbqy4Y7nnO8nkxmIgax2V4hss2uaoM/A0yJ2MP8PlZa0RLwK6OTrAG
         gM1evUYRCjVd5ysvtNY6Um3Er8UbL1CouPL5KBGuQyax9p45nMONX7ZIXboWKx3Afevn
         ue59piZU3lul3tzgLq+vHs9jqAVS1ivmWjNsvb1h0M5n1DRsB9UakNTvxSC300smquLm
         ipQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000078; x=1774604878;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN+RusSI22KRsuRRKGocsyZ7gd4d20kVuf92TgQBQfw=;
        b=p0nW3FrDwweGXyIF5yzriEM0lcWI144mLQyzcZGZcn/nHH6Qz1gRXdBnO65kM7qJ4T
         FDXy0dRNTNvVxuH/LsIbBTQPHsgleWJg4Hzw2X++DeXY82E0+4JX+4Bg6O1fi6Rbduuz
         BoIx46KwJzPCFW0WLbNn8mkLS0VjAuYbMc3xxbvaU2uIH0/onJf2b4AjRtYFKLaEWTW8
         ne0I/dNqdD12H/BDQX2njOARWwvqgAe9J6ZV5ET/s/ZAzgsWh6oVIBjulyYA+6eti8Er
         1zY9hUv2vTePrFdwoKkEFCNUa5VTFpiA4Jmx6qknj/Wkl6BxePbIQdGDsGW4QIVVivFO
         DZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiNidG4tah09uBrwo+OWun0hchbpXcJABU5Omaw54U3EyUDmYMf8sTY2OdPYMAGYkCaz9srC6jn+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyTZLCFHwkWHdRQJ0aUTV03cqUzP8basATvjb4aueoa9jE/IZk
	V4B5342FhJZonOHCqFgdY8y0c0EF5IFtrwGwURmrZq3Arbz5q24TzUuRRzPoNonOTNvuJ/cAPvd
	4g/4p1xhOVQwgKiC5yHhiTez9PLwJ3DR3P8epR2HaF2ke4wReMfkxSD+UKblbDPk=
X-Gm-Gg: ATEYQzwFuV1rNH/erMIiDQoZLNw5pyjEIeELvxfW1vZQFcetwTv9OUmfkpV7s7BlfhT
	XiTdKIPtdMio2kXmFQjaiKMcD2cxwjivtzccbnf+YPJKg6jnR9gpsR6pssMC9ZEFw9keWs9kuYe
	e1R3o5aX16WRzaEmaIBP9rRtFP32bgsCD2NYyNE3wPyc6DQKzbIQV/IQ5RTlgcXek2gOBsV42Yd
	Og1mw/rCzq+CXQ/PBZ1DKPzSHy97Efw0bJ6NsrI+No5dNqDATP0yWcX/4i0TKCBU8gqbmjHHd7m
	5U1sa68xvWL9zxcXl2g9hkyBrniz0VY8cMJicRhAiI4uCaRsVqlDnhMaYeR+ut+R3MOxptIISdE
	LtBxrFnHKk9vBWVxpyq2B2GdJ8xVAcaLKW3YTKiuYMMynrO/M
X-Received: by 2002:a05:622a:652:b0:509:1795:a7db with SMTP id d75a77b69052e-50b373963bcmr32909671cf.6.1774000077658;
        Fri, 20 Mar 2026 02:47:57 -0700 (PDT)
X-Received: by 2002:a05:622a:652:b0:509:1795:a7db with SMTP id d75a77b69052e-50b373963bcmr32909281cf.6.1774000077148;
        Fri, 20 Mar 2026 02:47:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487003ec0d5sm10935365e9.1.2026.03.20.02.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:47:55 -0700 (PDT)
Message-ID: <aab4d11a-9e46-4c6a-9e7f-cb598195b693@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 10:47:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] LICENSES: Explicitly allow SPDX-FileCopyrightText
To: Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20260301143322.92894-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260301143322.92894-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA3NSBTYWx0ZWRfX7zPIBR1RXBAX
 DGJ0hNJN9haGsut85Q1Ea1e27zHlf+WN0aFHpi2GGwRD4ajfbRzlB6MnkNd/dG5U2LPJSORoHel
 2XZJ+t5eMtwBntdzPBNsWdQbUkAAnA1h/xSi3oEldsNyMPwFcLmcEh5ACTtwy9MwV3RtaOh1Kb8
 S7tRYfrjdjYxjTOLavrTp7EqbH6a4gbXY7TBZ3OwZSzRPVoM8Kbn0tzIbJMV6bQjTFnnO75CgdJ
 8SnfNkTwVvwWJm/0GQIYIc+aJaeGP4GZXGk0eeXq8cIoERHqxGw/W3ZeAlD6FbLmdrlSP9VpoDv
 sgiyoSjbZLErgJyrYIoNa0GueN9QhaMzJ3S8cMlORsNX5Z3yb4j8kHQI6KqRMa1KUAaOXl2Awl+
 Gvn1n1C7pXgunUfZZVrdLyJ0ate7v3862ltnf+cew9swkLXbaKCP1egFngMjFrXeOqCHnCkkt1w
 ku8oL1HhqlrCuOJFpug==
X-Proofpoint-GUID: Ki1QMySFzbyZlByotJEstbvLMsDpROkj
X-Proofpoint-ORIG-GUID: Ki1QMySFzbyZlByotJEstbvLMsDpROkj
X-Authority-Analysis: v=2.4 cv=Y/D1cxeN c=1 sm=1 tr=0 ts=69bd17ce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P1BnusSwAAAA:8 a=ag1SF4gXAAAA:8 a=IJv9LcIfAAAA:8 a=EUspDBNiAAAA:8
 a=bFRN6MMRp203k8b-qj4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=D0XLA9XvdZm18NrgonBM:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200075

On 01/03/2026 15:33, Krzysztof Kozlowski wrote:
> Sources already have SPDX-FileCopyrightText (~40 instances) and more
> appear on the mailing list, so document that it is allowed.  On the
> other hand SPDX defines several other tags like SPDX-FileType, so add
> checkpatch rule to narrow desired tags only to two of them - license and
> copyright.  That way no new tags would sneak in to the kernel unnoticed.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Joe Perches <joe@perches.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> 
> Other way would be to remove SPDX-FileCopyrightText from existing files
> and disallow this, but one way or another we should be explicit about
> it.  Otherwise people will be sending more of these and each maintainer
> would need to make their own call.

Hey folks, any further comments here?

Is there a preference that this tag should be instead removed from the
kernel and checkpatch should not allow it?

Honestly, I don't care about the way but I do care of having it
defined/codified.

Best regards,
Krzysztof
