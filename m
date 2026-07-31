Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D887744606C
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521363; cv=none; b=Rk9ll9ZS9/ay7vGZtkM0OJM0vTUf8t0M1lT2IQ3beV6ibFp0wZ+xVuYE/CI9Zsk6uI5fAZqMraZ2SJ9zExUuwsWaejycyFdXKYU8CuNhLlEyoyIUnD8ZVPOG0vbhvOJAN0a6Hq1gbxMBpdfIANJvXMPCrtPf/vlR09hWT6ys89Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521363; c=relaxed/simple;
	bh=v8/ZUm4ukvjja6zhmdBPRnI8b2VSscGWWFRNveMjLUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7AKH2xyGPtLEGoO3GBGZVufpZzmerfws94C1Xw6Z50wrOGtNZpeFCylQpGLIGFFmZ9C06rW0uVpdPJqOYtSgHv1Pc8TvKMiEylghd5mj3uC1/taGVWtk6yZAd1SJGWlnbwqAhhYfWSzMnh9g2+9XkTgy+wAqtnBpNCO5bc49L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cx2rykXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF7Qc5xH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cx2rykXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF7Qc5xH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFORVa215427
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 18:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ar+ZIfFn71fVOlogmTWVxCY4mj0bEutG584kMHVtKtI=; b=Cx2rykXsABEKH0aA
	C1JNfSYNqCxiAVa2nUlv6o4pFc/nbKMXXCiVMo4NojTAKMDbyHynnEXUzzQHf8+B
	JxYXPfLBuXifmvwzczGderrQndxCuD+ctZ/cGBB+mUeC3TN1yorATRIwEDQU/V72
	5nINQ6V340ClgM7FCtT6WjHd5qr0FiP7Dd0Eh/vARuNr230Sgb7dfQMk6mHmYDGV
	TIsYZnsAT+WkE8l6aELMMTryO0TVjhljQPfRP+rCyBFsq3SQvumRZf+J1GYa0ch4
	IOQdZFfReln6EYIgLkrPlmCh/glUs3+PA98uOHrpFmALL9uNgFFyDdQkdOXhm0mO
	bgIoTQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujusnwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 18:09:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848662cd2a1so1623410b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785521359; x=1786126159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar+ZIfFn71fVOlogmTWVxCY4mj0bEutG584kMHVtKtI=;
        b=gF7Qc5xHEJDc3T+bwS6jteizEL2z3iCOdmU5ySs21bnasXXmynU+WshcGyc2yUM8v0
         4n2HxMyqrhJKLuBj6ZIetpWOLQToTQ6GJXZOr3ALrsEQcdS6qmPslR8f/tNulj1C3cjq
         oRjl0M478xONREfDITY02pgsus0ATUqfnhUSYCmBzlJHulkYpnD2pE1xC/gkI/ZsuElV
         0gmJvjuuz2f71g6RAHN7XDKAWzUvtoa5ZEiHYmrvtHaz2yrTiIg+ghBLr3Dn0+CLTQzN
         PmU9QLfi8M1MZVvWkXgkVv/rGF4kAOoAmIMjxPVLq6d+ITwuDqOVz/ITvwuG3rmS4KtY
         pPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521359; x=1786126159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ar+ZIfFn71fVOlogmTWVxCY4mj0bEutG584kMHVtKtI=;
        b=UjL1sm4ZnjkyGVyrz+0TqCKZmrrwItiiWkPbI5kxcnnHAbut/oMNfjhMvd+kiCS+Dr
         uqZn7SnNRaU8UrrP1N20poNJY0DolleOjKF3Hnu0fjLmksQxQYnkLqcNRnHPXJSRJtdG
         mWD5/dlz2RDRsnOnNLB7Wfkv+Y90DNe79+df1L24+UobLS0BwMS8zN5ap+0Vc383ewp1
         hOcLnkQ+lyrWRkUmU2HWnqv/41MigUg08XnmRmkfX2K/maW7jJWaIGhbJ3phS0OKUu8b
         wZ7G2NpFX1Ue4r6voaLD2X/P4+dqt8SJVH9V/+YjMoC+PkD31s2bcddVm7wgJ2eesPdS
         dThg==
X-Forwarded-Encrypted: i=1; AHgh+Roj9ivxBsj2ROYNwxXrG9bZ5uZigl/3M+RN6LTWTo/g/1IlWq12dQTq0eK3Pkoze3uUZ7ppwm1kr0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhrV1QOso1i/I8mMAD0sjLmUrEMFwlH9ER26Ek57a8FyH4bXco
	yIto6BAugsOh2DjEeN9BY+eD+wY3MHm6ypQtA+NhdU8uL/C1a09qTDQJw/q90gWhKah3ygH5ypL
	aCNfDMYfutbtfsGUFkfmy4yLuPKaHz+RRhdCSAGmtatpcbakuuHva4tN7o8ea+eY=
X-Gm-Gg: AR+sD107P64er1wvBxKArXSpM0JToJOnZ5wugEC8y6X1D9McENDKOwJ42mgX5qbI8Jd
	KSlbKqL7VC64FJFGNAMma/60B8ctyXBkN0xn15exAFgIlYVH0WaykmT0CM/uD/sTJqxht2wwa5O
	bsJQvoBUR0giqRjjP0qpsdrYywlV4P67mODoCGdE/Ci5y0Q2Ue0XLI2zsCWZSW8f4EzBM2wfnTV
	82TIgoejnxTjpnvOt+o1mhQtij4gJxo+/AIpHoIt/ZSc1e2WFXlvt6iILLhLYV7v7dlg6KsFivp
	cKmugg+mBL+fu3BMkivVbdkwG/EJZDc+e1Gb/fZua4FcsTYkltEkAQeaa1lOSUYD8k3TyBdtGdw
	pzwfkkBE6BZrRpnYhSH3sjw5nhtS6TVeRv6egWPwdtQ92Kt0UfH0uf8svb4s5
X-Received: by 2002:a05:6a21:50e:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c92a89be2cmr694535637.36.1785521359399;
        Fri, 31 Jul 2026 11:09:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:50e:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c92a89be2cmr694494637.36.1785521358950;
        Fri, 31 Jul 2026 11:09:18 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e29a126sm8699946eec.31.2026.07.31.11.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 11:09:18 -0700 (PDT)
Message-ID: <fc83bfa2-8f29-4295-b8e6-47edcb6e354e@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:09:17 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: warn about possible missing gitignore
 coverage in selftests
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Cihan Karadag <cihan.cihan@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260728052442.626076-1-cihan.cihan@gmail.com>
 <20260728073143.0e665e36@kernel.org>
 <CA+JfJhbda3VbLcAO9KEPgJVH-3WwVvJjdgh0MQUH=Fhnsp28iw@mail.gmail.com>
 <6e7009f3-ed2f-4a84-868b-661b5ac7ab8f@kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <6e7009f3-ed2f-4a84-868b-661b5ac7ab8f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6ce4d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Bs_rlm9j55hZLUUMUG4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: IZDWwxUFuLQkxFO3rOp3MfZANX0KsuCm
X-Proofpoint-GUID: IZDWwxUFuLQkxFO3rOp3MfZANX0KsuCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfXxgOWN+Kj/z1i
 0cL4IclA9i7LNiguzf9KJlM2N229Unpji1XlAz5AzuzYZN//94R56gMHGHaR92SWsJqU+b6+agH
 o5ZqmaJUX7m5xPuqIIz1YwiJTH8xFv3WItROfWljEuSPn4yuKXgYGFNqX5uzFhNlZoHi9y8bozM
 F0ceexSb0xCWUNemBre9J4MUbpI+n0h3LdMP6ryBvPGEhlxBhlLBx65qtAqS58+NE0/DaO6Pa9G
 rqazLa416p7NRZaC5Dot/DkKMuAU5XC5kT4nWh88UIL+tbxrjVRzNSRrgJWwG3SyaJwPUjZVB4q
 Iz18ecnAXXktq30QY6S4TsCoorBdm5BpBWJOLUdE1MfW4AMeJ4Be4W7vrZbLlsJMIcvmrgenPC2
 flNDCMldn5U+jG8VYOKGP1G9RX4im0iws+hvMed1NvV4NsNWB61+ONB+jW3n+JL0pyQ+DH4kQFi
 dPttrnlizhAkTfGikUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfXwW6k7qIrWaOt
 lUsl6aJXd1YUuO5mNU5nspGxjqoostym23GGGJRnT9Hz3bLvhfiziCC+a6pMixTWkY/5Y2Uxc6M
 32asI/2GPSClq7F/zeTxkxOE17VnN7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310139

On 7/30/2026 11:26 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 10:01, Cihan Karadag wrote:
>> On Tue, Jul 28, 2026 at 8:31 AM Jakub Kicinski <kuba@kernel.org> wrote:
>>>
>>> On Mon, 27 Jul 2026 23:24:41 -0600 Cihan Karadag wrote:
>>>> Per selftests documentation [1], every generated test binary must be
>>>> added to gitignore to prevent leaving untracked files in the kernel
>>>> tree.
>>>>
>>>> This is an easy mistake to make when adding a new test. In fact, a
>>>> search of selftests history turns up dozens of standalone follow-up
>>>> patches with titles like "add missing gitignore for <binary>", each
>>>> needed only because the original patch adding a new test
>>>> didn't also update gitignore.
>>>>
>>>> Add a SELFTESTS_GITIGNORE check that warns about gitignore coverage
>>>> whenever a patch adds a new file under tools/testing/selftests/, the
>>>> same way FILE_PATH_CHANGES warns about MAINTAINERS on any added,
>>>> moved, or deleted file.
>>>
>>> What percentage of changes to selftests from last 2 releases will
>>> false-positive trigger this? Would be good to know, checkpatch has
>>> a tendency of generating false positives which is quite counter
>>> productive.
>>
>> It will trigger whenever a new file is added to selftests, which has
>> a chance of introducing a test artifact into the tree. I checked the
>> last 20 commits touching selftests and only 6 of them were new file
>> additions, so this warning would have fired 6 times. Actually, one of
>> those 6 had a missing gitignore entry that this check is supposed to
>> warn about (fuse_acl_cache_test, 9acb102522b9).
>>
>> Comparing to other WARNINGs that checkpatch generates, such as
>> FILE_PATH_CHANGES which has existed since 2014, this seems like a
>> reasonable and already accepted way for checkpatch to operate.
>>
>> For comparison, I checked the last 20 commits that triggered
>> FILE_PATH_CHANGES in the tree, and none of them actually needed a
>> MAINTAINERS update.
> 
> FILE_PATH_CHANGES causes many false-positives, honestly for my work of
> getting 100-200 commits per release it was screaming like 20% of time
> and never had it right. All of its reports are false positives to me.
> 
> And I saw many times people do weird commits and weird MAINTAINERS
> updates, just because checkpatch asked them.
> 
> So your argument of "reasonable and already accepted way for checkpatch
> to operate" is simply wrong. Don't add more poor tests jut because we
> have one which is IMO terrible.

Concur.
In my tooling I always set:
--ignore COMMIT_LOG_LONG_LINE,FILE_PATH_CHANGES

/jeff

