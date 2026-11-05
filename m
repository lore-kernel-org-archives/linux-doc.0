Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869925;
	b=a4PXK+codoY9F0u+JiwBhHPKVeB2uKuSwP0aDTXkqn5mqqT2bRrNA7ARaHEJr2VTr6QN
	 PD2OGPXEUtfEEslmaTI46yZJDou3VoWbRhgrzSv97FFaHfT+AfwEibeakkOWdX5HTUe0l
	 1addh7+JpmQNSxr2itYtpcEoLoYC8lesCC3n19y+9AHOCrDB/S0zMOd28fvHU6m+MAvp8
	 u4yNZABKGfpJEto3N6gqcSQfswEn3uV2825/RkIyxfj0N80l5UiFm48G6OO3ae3H7P33Y
	 KOGhOiYdmZgpc6wRfhrSKtz6c9ctqqG2R2lSUXNIk+4Z9WEn15Lg+X/w9oR6RC2/p0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
	b=2jRYpEFp2lGnt3xRA+lCGnIQOz5BpxU/zMIkPkX/XxzKz6emT5qhKbja1gjEC5d/HAJ1
	 5trJBQHe70cHZ9bROEyMkmiONhSKdBNFYP96FBRg311wtz031bJ3Q4culXX5Zr5EJoeHl
	 rJmcuEruJaxwZEIcvvwbGEUfoVZT08/VQ2rVwkT8LA8ZOHYwJ7Shw8CQ+WRXS9TcTrhEB
	 JuEzBx5YjcDg2Gasvj0I1FT7c7jtMnfCsTl9/kPJv6q2x4o3C/2hBQeSjmi8upBT9409z
	 daqriUvsptp+PI+m4qmpDrYAus3SC43eposNbWCRr2LOATsBbUXamZUjwKE76ajaPSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fIx4+4IT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKIRSO33;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D62606A32F
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 09:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D62606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fIx4+4IT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKIRSO33
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56Tt4K3073284
	for <linux-doc@vger.kernel.org>; Thu, 5 Nov 2026 09:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=; b=fIx4+4IT8vfCVOMS
	wFTAUxAFjntUZ4EDlNDMSJshBqljGvDk3Vykz10S0+BVAQ5BGSMkfGn4w18ThBTg
	rgf1RcNRTdwEAltLPGrE9N9Fspi0VOK7kwldm/Yrj73vzC02JqLHKEMlv0APM2Ew
	Rpq1uOmzssUc51/n4qJCQaB0PLYjRzrInzalDWMkmpUHkWTKJXgAXHfTBP+0g8Qv
	E0TvXYUSBtqTYvqeSCFa0Y8gjJnbSBmcgsp9cdklTFT6c2GWLbcMm5U+Ze5j+MOZ
	oMimtsYGO4czlaOjf38FyrFFtU3F34F24G2jRw4TV8FTIqFbGLio5X2+3I3c6KEK
	6JPzGA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8udk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 09:12:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990c957f129so394701241.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869923; x=1794474723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
        b=HKIRSO334idm03DlMkgz+K/rlJDZePElkq+FsBQLYlR/uS0omyX7ESW/+vHLbX8kod
         whwX9yHbRL60cW+nLGxoqRLQpSvgggheE9Rhh/HyX6rA/zjm3/UXjgcDvqehn/2Qr7DO
         9ujGbi8Pur+qP1Suvemkf7BbwmLyEB5YSs7OokixzmDPb+a6/u3Dg7QCp4uLcVJu0P8T
         +qXhdUdGZEZGuL3neADxiqMcxMjXh/iMo/l/Vu2P+6sHDLIMlyGjz3TooNxJ3a97dNqd
         rrUVdz6rK7yX7peblnhjY98OUtUH90V1S5xm+cjndUcd8x8yZFGtfocdDyYylTTVdNp6
         X+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869923; x=1794474723;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
        b=bXYVJA61+CSvaBiBC8JOMaSd2hdY4bAIo/6yl5FQugaRDzU+JOS0Xn9zddyGXGbCH0
         /Pwv+le3h34D4MNJkL7L3N/aMlmhSDMvwsPl299uPpB0k1ZMW07LRivk75GkMB+YmOsD
         XQR19nT+urBk6zzw8xGxrHE3qex+H/a11QqcG+TSZZcvMl441Cn97eBtCRvhPaz8V2cM
         h5gJsN1DRhZ4Xk/GgLMcLg5KnRYspZqtGJm87iBX0ghmgyI5exwHHvSsDxo8uKkxtYlx
         c/7Fd1vm20rt58Col26I68QP/9fHsGMlUvnkN350tKFFusF03yN2YiEqQa+5Ct1tYUo3
         ubLg==
X-Forwarded-Encrypted: i=1; AKwUvBxkiJEF5JdDEmXiuUKBJ5YS9IddlhRwsc1xVlWFQiopwkjNkCYGuMaK0T18E7s90pv6ufM2WthIidU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MjenH1B6E/h7KwdmBNVObLPEOjOypIrh0+NL/JCFFpSo8F1bK
	MThytmwNStyhkoW9CWqf77icLEaqgcJe4oY/W+ZKlhkm10vd+68hOpj9KMZZxRC7eHGTtvtHiOO
	N+oihdgjO/eYaMz/MgmcYr+pqcSDMOwW2yB1mXgJozeKbRFET6WlcfeHu/gy5Nbo=
X-Gm-Gg: AYBFou31U19wZnNIHr5vLDZfdKQaCRp7xZVoh/ihpFZ43gJWpHZEV7eN9kYQzfYYqvY
	Gf0cCMv+zO1wTdnzxZie5Nwv1KnDsATUg72cGSIrhwGJXWxYQoOF8W9GLp+pK+CV14lZD8bfmkb
	HQmxKeIhFYfwIEflLn2MmPVSvH+P0AjEOLMeM2jVCFQvR9NP85RBiyqASUJoT2RkClONgF5hj+j
	q3DTqPFFoa0m9Y9dPBLwRI+mMYY/SUIngwqKoJ96QhLIyszt4tGvSBcBtgTaP3trY6mVDFnisQS
	1Wit2BoiMJLy+Ed8NGKQxGz4xxSngXkdcoidh5ufBh+rpmTZf0ac0hhv0xgCMULygYsdLTrARhK
	OMoSWGKqSZDQ5M3JrCHTw7vRjuIkAl6m6aMn8SmQqbnmYNezjH5+UD339HBE+LeaKwMMs1m04uA
	==
X-Received: by 2002:a05:6102:2c81:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d286744eddmr1262922137.3.1793869923369;
        Thu, 05 Nov 2026 01:12:03 -0800 (PST)
X-Received: by 2002:a05:6102:2c81:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d286744eddmr1262909137.3.1793869922991;
        Thu, 05 Nov 2026 01:12:02 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm8705164f8f.21.2026.11.05.01.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:12:02 -0800 (PST)
Message-ID: <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:12:00 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxHASG78dTviSz8@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfXxZZgrzAm0rap
 yfaNT7hToDB9tdxuKHKq9eMulumIxRAg/E0+qDb7kkYr5ePD7ksFCEISFtUe+BBg/GHU1m9FiQD
 HUivK95Vq+tsHnzjwssbhxES0g8gQceALzaNVDwy6aq7tm27bCecqaPbuBTYY+QTER2Nf1yf/Xu
 Lb+VFk1N9ueJrSG76l0bVaw2O93/GZlRiW4CEA/EYSetDTgqpHubXsIJiNSEUB5Aq4aKpsVN7nQ
 OXK+W4e0AH1yu24fwCkwmxpKkdi61sQCLmkq2wExS6IclsJ15E7dz8o7kZQUAXc3vUoM1tV9V45
 vmRsyfLU9OrS06AvMevGisq+bOzvfXNSuXo/8i6Wx0NWG6d1BSWXuDIY3CpfNzZmJBiOBUsVtwQ
 Lwo9bs+fwfi8ZEyqvibgFIyaxAjXX0aV8mEzzafy5/GT3Tkp0AUfIil+NXxl61nhHJzymwWvcSf
 Vk5BsITKF4TnZzY3vEA==
X-Proofpoint-ORIG-GUID: 3m69DRa2LbeMxOVo8teBlkFzJ4NUVK1W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX9BUejpxM3m46
 k5H+ltvTKs27pRsRz7eg9fZXSAk5/XFxBilAguevgZXgUvKkEl7oITiWtijmfOsGaQV5aWh8tYt
 wML0FdN6W/oxwZBW84M5IfkbyytTgqw=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec4864 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=AWKtBJF-UzVMBMTKnHQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 3m69DRa2LbeMxOVo8teBlkFzJ4NUVK1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050036

On 05/11/2026 10:06, Wolfram Sang wrote:
> 
>> Reviewed-by even with the "# subpart" still appears in person's credits
>> and reviewing entire patch of 700 lines of diff code (like Frank's SPI
>> patch) is not the same as 10 diff codes for one driver.
> 
> Yes, if you want to spoil that, you'd need to introduce
> 
> 	Partly-reviewed-by: ...
> 
> or something.

Ack is for that, no need for a new tag, quoting:

"Acked-by.... user may not have carried out a technical review of the
patch, yet they may be satisfied ..."

"Reviewed-by:, instead, indicates that *the patch* has been reviewed and
found acceptable according to the Reviewer's Statement:"

Note that there is little sense in reviewing - as in statement of
oversight credit review - pieces of patch in context I discuss here,
e.g. one big complex rework combined with updates of drivers. Who cares
about the drivers? The complex rework is important and should be
reviewed, but people skip bigger picture and put their stamp of approval.

Stamp of approval is Ack, no need to mix it with reviewer's statement of
oversight.

Best regards,
Krzysztof
