Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E4A330B07
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099400; cv=none; b=BRyeJfL5J46mz9vVlKS5Y8hJFlGh9C4heL2QOsZ40jynCkvQghwFUQDd8X1W+XDYxxYKNOI8oH4ex+lFl2lX6PgtoZcQyVYsmZtT5A7YcgBbrVEb/3okIeENYHvC3tt5QXuskpW+GTa1CCtxi4erC72+t7lfD5jQGupxCHUGIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099400; c=relaxed/simple;
	bh=aC5z06FWk+pyXDTL9LfFjgrA0ok5zpMZ4Ub/i5Y7SA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ejff7GttSEPVzD2rCEv/P837VmNQnkJ1+CQlnnrS1nHb0NDpHsux66OIk3Sc8j7PwFlhTSulj+dLCWtMRtI9qfG3ZZe72rIPYzPEkAvHCsnv//fp6cgQexkYQfF7xpP0xFkfE9hLk8WbN1fz43iH/8tzHTS4rY8QExUcuMdHHZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NH0vkbzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMtCNRS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NH0vkbzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMtCNRS6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5e6Kr2847489
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIVWjciyt7GX3njw61ulzwpsLrA89pbtfyZ61onL89Q=; b=NH0vkbzTYC5Uuo2u
	y5zzjCIlsElJyMtagkkfFWN57ReuRy/2LMP2+LKSUd3DLPTvaQiyj8BEbwB5SRsL
	54AiScKCue6R8tViG2OthFafrMgsKlX6i/y61A+EH0dyofaz+nBd0SiZ3VC54qws
	Efh5LHVnOdgByLBWPhTzON8c85RYH2AbDtwEH9rXw2nKLDB5PJ6Wvcahqln3m8ib
	HmRFix17W/KUKuc6ZRDOJyUFLWfjzSqc0i6Dn9u0no9aNepYf1tGhOn60VFqZdlp
	O7gbVoRuTwaTmHooBP4q1gYrFjxT5yNTWO7Ss8nG3iBtKluvc82ONSzOoxSKNzWB
	sG1OUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7wuut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:16:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5163ade1583so44375661cf.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099397; x=1779704197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIVWjciyt7GX3njw61ulzwpsLrA89pbtfyZ61onL89Q=;
        b=JMtCNRS69sZqHxGw9yizwYDxt+NArxJ5Wxf9xDW+wGVPCOFRNPT/P5S1g8yizgog8H
         48yqboazTEvAx7Oj2ni0sB+zv+u7e9v2CIw4pmmzpxWH1Ys9M8iS+sfqI0iJaHrYBTci
         IfBgnHC6TzVEwTyHvsQrkBJ08Ghw1ba9cSFb/yPgyXOKTmazwJ7Kj7m5uyOgBMe79NZ/
         Jq4Sd36iMbn3NrHgfpzgMbFB/zp9OsDv2GTbOSHyQnbDG87OFGyaRKRlgn8n6/fS3v3E
         HNVeY1EN8+93Vs3mzpiuN/cWdYmprlRDww+74oANTdthGMREATpEj+DgtkbD2PWPiYKC
         EeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099397; x=1779704197;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIVWjciyt7GX3njw61ulzwpsLrA89pbtfyZ61onL89Q=;
        b=C5LvLM/3yr6SfSJwRCxymtEkpgs1osHVu/gygGFHs5yIFA0nS2Z/jpcncqzbb0Un7R
         o0zGqvSk53IB80icDcBMCiiBT1vnuJtRHaRgaqNxbSWlwOehtcechZQENEhXm17PjXEg
         JwSg6xm68jz+xh0GWEostYfKJiza2XgfBDX7nU6Dj7XsYwqmn0xKWPGf5FdLK6RCh+2T
         Hh/lFbhQy65nGQCB+ZjJ6bmE2NDiho1mGyhmp16jvBAPXXy25ZoABstuLg+QR6RoDUPn
         bkuhwHim6AcYkLgcimHoSGhkpSR9ddK7VbvVe3Yw2P+/y2oEDXOSB3jEE3Sv3Cp0B3mz
         /INw==
X-Forwarded-Encrypted: i=1; AFNElJ9DDrnBtgIYxdA++RP4/5MUzeWzNq5zcdp9iTJISw5kf7qUkLW6q9x/szwqOdonIiJ7AWfo2U0+tG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4mJFgCRtKD5CvnjR4llvrY3w3TZ/ji5Z4AyglLhH+hHVbdGvO
	UZIQ3jEbtxUd04ZG22tT9vXZbWFc+DBdVKkOJcKFzFjEo86jESfbsyS7cjh6VB8M+mq9Ei130KV
	IWAFaULB61mPWFjFZJwXc9GxN9HXU0f+tKmcthZNZzT+3MG8JdAn3RPqdRIgMJQ4=
X-Gm-Gg: Acq92OEFrUxxxDk+PvqjazX1OltJUJ7Ucq40R+iYuywuTFbEJg48qBa/omg5dzA94IU
	Ice9hYVDIbpQcCtt6i/O/4IBx0S+U5gS+Rk4noJDc9kb8YEYv0QNQYGxaJnAsqcFKbg3ulvJCX2
	KB3fj5cGqfP0DzAQE/fpZkXChCLGL+2Pd3Tx/G4vCNAgUA/2zwLx/2MWJQhaPlfXVgcmMPtByCP
	Iz92v4lPCFHh5Hq0JwDngT0Fp9PoD63zfpS0fRDf3xXPjBAUJ/Ku50sg378lMgE9FdswpPadoPu
	xhDMdM0HCIhZcJStnQV092Q8fAj/VuidRdnGNZ/ixtZmy/9qe+bi/0kveDoYdELmD/eNgkrwcs8
	gNE0rIi9c7LHo45lrbIuQwlQG5kVQ6xGR6/38xQ9Srt5iUQOq
X-Received: by 2002:a05:622a:144e:b0:509:f36:496d with SMTP id d75a77b69052e-5165a0d0932mr215105071cf.33.1779099396956;
        Mon, 18 May 2026 03:16:36 -0700 (PDT)
X-Received: by 2002:a05:622a:144e:b0:509:f36:496d with SMTP id d75a77b69052e-5165a0d0932mr215104671cf.33.1779099396492;
        Mon, 18 May 2026 03:16:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm103474895e9.7.2026.05.18.03.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:16:35 -0700 (PDT)
Message-ID: <0363e0a9-e645-4fec-86a1-dc847bbf14c4@oss.qualcomm.com>
Date: Mon, 18 May 2026 12:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: Clarify that in English
 "reviewer" is a person
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>
References: <20260516123846.63413-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ce1e5e9b-83d0-4971-aee3-dc5a8f85ce22@kernel.org>
 <1d350564-0127-48c1-8988-54245fdb9b23@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <1d350564-0127-48c1-8988-54245fdb9b23@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5OSBTYWx0ZWRfX2+noTpJMrga9
 jxHHZYaR90QvxwY9PWhtdk1gkJuMkINvxB+OdLzm7pftmLTz5tR+mnHO0yhhGAYS0+3o7HWCZh4
 Znf0LfNuley3ut5v1bHCi4ndGlUsu64vpFJ8JezlO5eVFFuGv3WeQKB4mJcKJCzfS6sHmpzBsei
 aaFgNwyt0BMk1fAsV9mdVNGQok69J+cURObvasIzixCaye4tPi7uUy01G9/T5SvhYJhy0XgL3vq
 dCc5q1umdT4ME9k29grL0jgVC3umMFPyXwpRtdP06NJgJ859Kn3EDN7LXTerm3zOc0BNV/7VYWF
 MwI6q7bXFUAEXPehkdi2D0xIzwu265rDnwO7exU+2hG+MX5Pd1VnGKgV3fBcdpkjhWtyMgUaaLB
 vhP0EDEXQWZgvNZIT9PVu8AjoY+Hr6pmAjDtI/i6qoB6+u9sWg11NXHG1wSOGcgm7tWUZ8Y1Gtg
 U7wJf4yDPo7/NeBMBBA==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0ae705 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1Qhj-OTkAAAA:8 a=ag1SF4gXAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8
 a=EUspDBNiAAAA:8 a=3Q_fXuLkU7711zDDGqUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: s9XACoRi1K33hn7knNU9R5x4sTKBIUC_
X-Proofpoint-GUID: s9XACoRi1K33hn7knNU9R5x4sTKBIUC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180099

On 18/05/2026 10:31, David Hildenbrand (Arm) wrote:
> On 5/16/26 16:39, Vlastimil Babka (SUSE) wrote:
>> On 5/16/26 14:38, Krzysztof Kozlowski wrote:
>>> Common understanding of word "Reviewer" is: a person performing a review
>>> work [1]. Tools are not persons, thus cannot be reviewers in this term.
>>> Also tools cannot make statements ("A Reviewed-by tag is a statement of
>>> opinion"), since making a statement needs some sort of conscious mind.
>>>
>>> Our docs already clearly mark that "Reviewed-by" must come from a
>>> person:
>>>
>>>  - "By offering my Reviewed-by: tag, I state that:"
>>>
>>>    Usage of first person "I" and word "state"
>>>
>>>  - "A Reviewed-by tag is *a statement of opinion* that the patch is an
>>>     appropriate modification of the kernel without any remaining serious"
>>>
>>>    Only a person can make a statement of opinion.
>>>
>>>  - "Any interested reviewer (who has done the work) can offer a
>>>    Reviewed-by"
>>>
>>>    A person can offer a tag thus above does not grant the tool
>>>    permission to offer a tag.
>>>
>>> However this is not enough and apparently English is not that precise,
>>> so let's clarify that only a person can state the "Reviewer's statement
>>> of oversight".
>>>
>>> Link: https://en.wiktionary.org/wiki/reviewer [1]
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Vlastimil Babka <vbabka@kernel.org>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@kernel.org>
>>> Cc: Linus Torvalds <torvalds@linux-foundation.org>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> I agree with the intent that the tag is for people (whether they use a tool
>> or not to help them). We also don't put "Tested-by: kernel test robot" or
>> syzkaller on every commit that they test and find no bugs. Review is also
>> not just about absence of bugs, but agreeing with the larger design and
>> whether the change makes sense to do in the first place.
> 
> I'd assume that SOB/RB/ACK would all be real persons, not tools.
> 
> For SOB we term it as "known identity". I'd assume that a tool is not an
> identity ...
> 
> So maybe we should also talk about "know identity" here?

I think this - s/person/known identity/ - is a good idea. We should not
have aliases and anonymous reviews because these are not accountable.

I got few acks already and I plan to retain them in v2, so please let me
know if you disagree with keeping Ack/Reviewed-by while replacing this
to known identity.



Best regards,
Krzysztof
