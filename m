Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D636318151
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766504186; cv=none; b=IRdpVno4/gXKKFYc947A8ZI7ZrvWLjp0Lz2rnl0PTTnNI0TnNxVg4Rd/rj2K91FiO6GPhhtWhuLf17FVW0yRyfy8Q2nNqcqXMCKxMz18ahZpeXNblWPaGp6c9AaUwKg+vjdKKlKJ2FZGKYgx3huBu/BbGl7n2/bIB2GHKW/TkJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766504186; c=relaxed/simple;
	bh=DUY3S2HvLhtn5n0nigfdYGYRUjkoJxxGXH96U3VZDgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XSBvNNPKZo2eS3jDVVFBrITnMik8BwZrJJXwf0blmDh5AYcXd7SGsGVUO3y8rgXQwWPrWJceDf2gtQumJ8ocdBg8mz2IqvpX3p/AObMkntWMduEARMotfpZ7Mhw7hWrhi2YRywYAb/HiiLh20Ov37GGITgowufuVCLnaRtPYBu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WA+y+jVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdC5CzDW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WA+y+jVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdC5CzDW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBR86r700440
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 15:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIOcga8tvuCYdI0XxRB15D3t5J8mAK/U2/1owCkkFt0=; b=WA+y+jVcfROyiOFN
	DyMr5YMeUmVAFQLQ4pceMQsDTopTzp0Zyo+o9F/OwZH0vkA6I+MUtaw0We+H2R6H
	I3hoLqYBPYYPR/EdMnpJnpEsagYwA9qg99YIM4ll5rVKupbaBd2xo8VX8Qg40h+d
	1ghBZkDl+5o5XocYjeksLft6s0339kPhSyFpKUD3x5A8ppuhSSGBnkqEUfjMEc7e
	6dL7VdlfEzQibLwoNxuDUyan8Pt5hoIV8FiakEObXNxqTk+/c6IIjZO0j2L5QMz/
	+G8ea3q4QvHOJwPWAXLO80xd8oY59qYkhPVfypXLXxCFbe/+6E+fU4de0a337xn7
	4HEyYQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jrnvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 15:36:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so144135621cf.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 07:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766504183; x=1767108983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIOcga8tvuCYdI0XxRB15D3t5J8mAK/U2/1owCkkFt0=;
        b=KdC5CzDWN0dB3hYY98GFiLI2JGtmDtKrNTDSWKZ1Wb45fkbZ4FCvQ/ecsnQBUl4ep6
         sUvRhXJHx10at2esA9ESVom34lCYob0u+q0/aNqniF2mm82R/COfq7hWJDbTjkZpmB+N
         axu35IChCFshc0uuORhQYOTwsDwne9ELSGBNwG6sG4LGeLD33XwWJCKsLCpQPX9Wflm/
         b0AYdk8bqZut2mcSl1BNVsNlpYC594IIfzBToOuI34cjelbDWir3xSUfO8La3WuI1TVN
         dcTqLqqP9662u2SzRhs+KXD7bHKts/fDtZ0ud/33UXN1/EGzViOW/koyOmC50dFDtoik
         nnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766504183; x=1767108983;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIOcga8tvuCYdI0XxRB15D3t5J8mAK/U2/1owCkkFt0=;
        b=FzkS0ofkPWxV4vsNwgC26w5UIX3HSSy8iW3/IleHdKLr5/tFnZohbwiNRWoM2dTGhJ
         xuupcoIiUjUt4M528iDzFaa0AGErvbx1jJ+wtFi6B31jc7bE6OAiqRaCbQrYwsHI9seK
         mxQty7ueDPUVIOP8UgTG83/5VA9cvn7/KtkP2vw/yuxhiyCghJEb1GKoxIbMS7dB+eCY
         d2PYlXaKjc7BNnTdGOhByI/BARmck053rvCuW9IftX2Rg3T7ji0F4Kgr0TFfSDvUXGk8
         bUxAKYl/F+otsyWkJo0sEIzMcgHQOK3kuKTPtOCl9yFP4VXreRB0nXqq9Y6gcnyELnPe
         hkFg==
X-Forwarded-Encrypted: i=1; AJvYcCV91Ao1/ZSKFfJf59bV3YsJZMpFSBGaheacr7fV1Lc6tLLCnG3SINp3eurf02psYbi+GFpUEvWJNpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKk3r8peu1KXLDdKgZSFgvEpgCGm3tNiyW/yIp1CLCz/onrSmk
	bCBIzf3i78Dy8kDWMzExNFshwQC2yEFu3JZsU5WgMGMmxGWTKIqu22fnj4RbLBlKcznjvdHsA5r
	UDPnr4hmgQ8xIF0J+hT7D2jneftgSQ1dX+Hua43KQzKnMoNCj0V/1AslPm684TlY=
X-Gm-Gg: AY/fxX73BwmacRE28bNsxElAJhahkEodWCgeq276wMEcDDdbyaDun2F/Lxq5kE+kPUU
	yTooFSTnXH5RxeQBXOklYgFxM8bhXpZVng9acO7iKWg3pxcBCI5+0GBdf1C6WI4gVghGtdNnY2i
	iWgLmTwbTHpkIWyrJ1Pm6pf/KuzRi2eC0urKG11Fs3vawPM+VrIT4fKD6DDQevjEfzGZhUk+muC
	Y1D0fWBznknwShtU0ppv6R/F9/VMVSUUih9sdcfFJncr+HNgfx8q+FizYb7NW+oy6LpgMO7texd
	6Xa0fAtwUx4Gfy62nKgsb8ITPuHRp6BQPq8FIS5eCuMpAfLWpmdOYDUPqPQoWfBWaCC8ye0pEyl
	VRYp2h7/h+q3Oz09+po7H18pIzk6yZhZ71esGvsQr1N2tWG+kKDUwTfSeYtgWnNzXBWxqZ38A
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr187097961cf.47.1766504183103;
        Tue, 23 Dec 2025 07:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa0/vT1HdK2OeKDFzVcVkE4/C2AtPTPDM+HTiFFP6jGO71ylf18KEo/MBPNRWSVP7s3lEPag==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr187097391cf.47.1766504182508;
        Tue, 23 Dec 2025 07:36:22 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a604f5sm1460739266b.11.2025.12.23.07.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 07:36:22 -0800 (PST)
Message-ID: <cd06d5bc-ee77-4e04-ade6-6d650527378a@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:36:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
To: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <87ecolxlvk.fsf@trenco.lwn.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <87ecolxlvk.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyOSBTYWx0ZWRfXxvZMGjp+OOUp
 Cg0NtSCoPlpbIZlFW6w1jQMyQJguB6SqY8M8P/sXjeLlqra+2a4RXJKoT0q5bkzn1r+YELLyCOs
 Rn3reAJU03Wj0VB1L7QImMIlfkszUeugsBvZ1iO8azgADKiyYL7Dab/WlZW0RhDr190gH3PGzOF
 He6seDr3F4TB5BS5Rb992XB1EYTXrjDEAe0JQAPzDlkDBu99d4jidXmt+fveyqJTh0IJJF5YrLr
 sIueHhK+AWkd8u70hBOOMDGZY6a1rstwNmpD6i2Lm4przbLfSNLfztxKayRAO+MfyVfvCtZaTNS
 vSU7h4bhhE8UQtwxgQuOS0a4sNbyp9TsGKLieXExaJ/3+hVnrEkt7WgmImrA87FfWaP7Ce1EYKc
 Gw6W4Ol5qtYy6kgUAHppSfyBNptfK0IMJ/wI40+88C8o3uUOlV0Vy2ZAigbgSFTSMkfSxqMX1XN
 qUECHDrBrbypMNg15wg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694ab6f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NA6n-xKotOlSH5BGWq0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JvE4zPQmXDdUAlhh4GyQqEaCiNkHMv44
X-Proofpoint-ORIG-GUID: JvE4zPQmXDdUAlhh4GyQqEaCiNkHMv44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230129

On 23/12/2025 16:23, Jonathan Corbet wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
> 
>> It is already documented but people still send noticeable amount of
>> patches ignoring the rule - get_maintainers.pl does not work on
>> arm64/configs/defconfig or any other shared ARM defconfig.
>>
>> Be more explicit, that one must not rely on typical/simple approach
>> here for getting To/Cc list.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
>> ---
>>  Documentation/process/maintainer-soc.rst | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
>> index 3ba886f52a51..014c639022b2 100644
>> --- a/Documentation/process/maintainer-soc.rst
>> +++ b/Documentation/process/maintainer-soc.rst
>> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>>  
>>  All typical platform related patches should be sent via SoC submaintainers
>>  (platform-specific maintainers).  This includes also changes to per-platform or
>> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
>> -addresses in such case).
>> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
>> +correct addresses for the shared defconfig, so ignore its output and manually
>> +create CC-list based on MAINTAINERS file or use something like
>> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
>>  
> 
> Like Laurent, I don't see this as being effective.  Why is it that
> get_maintainer.pl fails here?  It seems far better to fix that, if at

Because there is no single maintainer for that file but around 60-80,
depending on the context (who owns the CONFIG symbol). We cannot print
all of them and finding actual owner is not a trivial.

> all possible, rather than expect random contributors to notice this text
> and work around the problem...?

Of course better to fix the tool. Problem is known for years (10? 15?).
Was it fixed? No, although in August finally Sebastian Reichel improved
it a bit (See 750b54513f69f1046895346ea97cc3d96584355e) but did not
solve it, because people do not run get_maintainers.pl correctly.

My template reply, so often pasted on mailing lists, always suggest to
use --no-git-fallback, but it's not the default. We could try to make it
default, but it won't solve the problem - output will be empty:

get_maintainer.pl -f --no-git-fallback arch/arm64/configs/defconfig





Best regards,
Krzysztof
