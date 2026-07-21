Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D03290B7
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613907; cv=none; b=uCkJoTkaKQwv9n/vCk1cVnlDwjdOPUNm/+uXhBlFF0HKluZDfu6dRcdMGrWreodoKZAfE2cU2ujzg8VN52OFJkaFibG2KcdftLPzAYVBvk8Km8ec4osUUkAiw8rAj9uuPTn3GoVKUbGSThXRObV/LcTqUgrSpMX/4uXvPSy/Rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613907; c=relaxed/simple;
	bh=rJCJHYF5qksfCFU8hXrYHh66ad33rs1xje6QIf+t5vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKfoKMU6C9AyvSDBvRtS9paBHrcaqR5sSpkLQvcs05/q0oy2awrWX+GropCHXJIsmRio+CRHbo6bS+eIaB4nbDF8L73lyD06YUkiCN5JdSJYiRdtYGOmndKzVA7Obuh5rl04GPmWJCWJ4LQtpY1UAV4/fAzjyaauLW12Ulopz54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hacbZj/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cvg3+pkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hacbZj/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cvg3+pkd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCRCt933215
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 06:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWd1oTmkq5zMhFDmPKRzG6HslTzweIEq0sjoAwJFuIc=; b=hacbZj/7A3DZPG75
	eJhIAAMbcSocbse+DwrjWiwhbvG5Gm7PYig15eLHdy2RvZypY+1GjF3rcFpKqZo5
	pM6FN1RJs9LNpzRrPDjWLFdkPWiVBHWVBp5MUvQWJtWnoDmPrNdCb51ZaNnmarrM
	nJOZdDZ0DxJXxne/n1XOszhI3ygdxw4BksJgdcl939aSfEoO6sUMZvwabM8SKrdI
	M/kq/TtEJKbsxHVWYWWQEWRMlFt6MuBvClKdT3YkmSypSAMXpthfWJLsjzaJ56Tx
	0eoGd3+uPJbXYyBQ75aypEiLxQKLc8yE/375sAT+ptES9fk97PpQmtRfQGwSmqD+
	FY0cQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5tkrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 06:05:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e606e8f3eso1568551585a.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 23:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784613904; x=1785218704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWd1oTmkq5zMhFDmPKRzG6HslTzweIEq0sjoAwJFuIc=;
        b=Cvg3+pkdBA38ebJbGirm3AEXopDxIKowsq8pmv6h9L1JiiIKPO6r5UlrRUoNcZ/zKv
         ib39la8U+KI+UnEzuO6Hxz0wbbEB/R8w5sMvX1xZ+FbbX8PCJyQfgVg5Vp/H4bApyQY6
         Moz1wkF7tX2OxKO9t1UjFtJhc351QrpscSjhqv2fKY/TCyuJICVaLJogc7GYdFB9lyNr
         Or710Tqtd2BTh4eGQLpPQyVmoS9iUM8q2729pjFMLYJKaP/miguVYubUTOjNUjgbDiJU
         OKmYl6voub1+ROZ2zjumHIndmJ2d6g8XUUhvpqRcFndAp/wPkoOLTzvjZw9lzRTqfP9f
         hzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784613904; x=1785218704;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWd1oTmkq5zMhFDmPKRzG6HslTzweIEq0sjoAwJFuIc=;
        b=q+48vxGn58doCnfd3uup/L3Fq3CKL8F3pqFqrouZaIaDK3WJdYjj28Wg6POGTcbMeg
         OTy7G8a5sUgJ7R+I3xVzr5bq/ktf+Gj9zpsM0Nw/ie/Y2wLdHwYrzEffki5qE8RwcNMC
         fVqXBdqima1CoHd4r8aJBkJdcAObgDJqOryN87MLpewvSpRubAf6rFZ4fRa+At/wEJCw
         jjLNCO1UYi7FdPTlyhppoJWRVNyD5m3VLOg9REcS5akopN3qNYiPFp94BUsKM+FM8eG3
         +RpOXcLMKKp7i5m0PkJw1g6jlk4pfW82jqWB2JvjIFMxT2z+NlcfKDLZngMfQuPoWcw5
         QfAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlBeZfpPCEqycKme3IN6YPbzFNZt/c7QnIbp/dnvCsL37/MRctQgV/dEzHNkLRhRXKLZPwUif6f9k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5urZJ7SESXl2aACbdlnX/i6VgzgHUthRTr2vdDsp7WEJcP5JJ
	2EgHCSUL41/5oP67SvaEgdX73R+oc9b5z2AyN7a7RaLJW0xB8TrVPLqQMaKMgGiTJf9505TumDH
	9Hs3BnbeQFUa7KuJLyWdvn+/yrZz6d3bOYSWp3CQj5By+lLGTg3r/1TXHUodC1lOm7bOhias=
X-Gm-Gg: AfdE7ck/zCEFiit99lOnITCEnKv00oVZtLhJhyVB8Fv1AdHU0Qc/AkIXJCFcwiq64My
	2XcqHiQ9GMb3DgLuLb+0NjoVKkVRWaiPeZqMgumCihv8D6RgwQysuePQgKx2NjtEVM2vh1exQNv
	jx01+YVVsaiFfiRtoGYr0X713U6TBWbQFnUAKVikg3pu/OukQADHiLaNnKR975mbCQDak6fqTse
	NQUbtoNSzNXwl3N/z1ndPkJhTyrt5wLMf2/A0eewANqrc0zjDw3cB7oEJ0seb/JYgP/cDhRRuK4
	xDNS/J/dNqi4Efeq8Nrr4eZP7P65nwWoMmwEPLCuIWQM3VJ+VDYVAKnKTncDmKS/4KGO6fASPLc
	en8iW6bEAT9pYYsPJw2ZKtxCt837YRw==
X-Received: by 2002:a05:622a:c85:b0:519:e020:6087 with SMTP id d75a77b69052e-5213c013438mr166392701cf.11.1784613904456;
        Mon, 20 Jul 2026 23:05:04 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:519:e020:6087 with SMTP id d75a77b69052e-5213c013438mr166392401cf.11.1784613903854;
        Mon, 20 Jul 2026 23:05:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e0fcdbsm288078675e9.2.2026.07.20.23.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 23:05:03 -0700 (PDT)
Message-ID: <bd1971cb-1c32-4b89-8678-6828214b12a7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 08:05:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF maintainer
 profile document
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
References: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAL_JsqKkxVTVE=o-uar=JEVvqw9NhBAQcBrJ0ukf+RBXCwFZJA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqKkxVTVE=o-uar=JEVvqw9NhBAQcBrJ0ukf+RBXCwFZJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BJwoImoinpA-jmUNpxZNlWRejsjCKm02
X-Proofpoint-ORIG-GUID: BJwoImoinpA-jmUNpxZNlWRejsjCKm02
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f0c11 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bwanYSbnS09AELdfzVIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2MSBTYWx0ZWRfXwu4ep6+Jl0k4
 5EkTVKQzfhJShtaEPvJuPc9GsgGkyVBQ1oka4/rhSzBw1gDomebFhYRPe38vpFujeqKqpBbOjiC
 gsl9mosq7Ilbs7CKSF+teH+++MUB134=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2MSBTYWx0ZWRfXzI64hOefWfXx
 dusNsyurK9c866LnnFHAPno8oc0pKpU3XolfMs7Nu8jV3qu2zOENpcrxOjsQJ2LkuQUOOn6aLej
 MFbcBII1boVll44SyNCIh/+iShIvpQele9bu46Fv7qTrF3AhZ+MtaBTwvvDZxKjPNksBnk3r04c
 J7K+4gpafBBnSToXPZ8paaG/jLula4HHQibsns8BcRPOyrKAxG6k/IYDJrMp28i1MzXhBStBkdg
 z4keLYg3HU7rVvS3exnT8wbRh4yhhM74qXMDozp8bk3dVs00rffHx5KM6M+A4w8CL7JTuaKbLku
 fZL5fMLFGOpeXE4+ADAVI1NxQrDqRu9fr1cRW6CYGD1cxVwhtutoK1xgnnJbNI/9hTVLFrnVn9Q
 OnJ34OnIJKMViktDp16nhlcaXxH8v/1Eysa/lRAUuG2/8TIxF4qH7cMaIr+dmdGetJnj3/7zbIw
 v09RcusleCt9bDlFxRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210061

On 20/07/2026 22:12, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 1:40 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> Document how Devicetree and Open Firmware maintainers handle their
>> subsystem, especially focusing on two caveats:
>>
>> Devicetree subsystem handles patches with a minor difference comparing
>> to other subsystems: while DT maintainers pick up OF code, they only
>> provide review of DT bindings without applying these.
>>
>> All three DT bindings maintainers rely currently on Patchwork and due to
>> enormous amount of emails per day, regardless how much DT maintainers
>> try, they cannot read all the emails.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Saravana Kannan <saravanak@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> I expect patch to be picked up by Rob, after review.
>>
>> Changes in v3:
>> 1. Add also F: entry
>>
>> Changes in v2:
>> 1. Correct typos and trailing white spaces.
>> 2. Fix order of P: after C: in maintainers.
>> ---
>>  .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
>>  MAINTAINERS                                   |  3 +
>>  2 files changed, 73 insertions(+)
>>  create mode 100644 Documentation/process/maintainer-devicetree.rst
>>
>> diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentation/process/maintainer-devicetree.rst
>> new file mode 100644
>> index 000000000000..d8ffe752bf5d
>> --- /dev/null
>> +++ b/Documentation/process/maintainer-devicetree.rst
>> @@ -0,0 +1,70 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +======================================
>> +Devicetree and Open Firmware Subsystem
>> +======================================
>> +
>> +Other Process Documents
>> +-----------------------
>> +
>> +Please see the documents in Documentation/devicetree/bindings/ for information
>> +on how to write proper Devicetree bindings and how to submit patches.
>> +
>> +Patch Review and Handling
>> +-------------------------
>> +
>> +Patches handled by Devicetree maintainers are processed differently depending
>> +on the patch type:
>> +
>> +1. Core OF driver code, e.g. drivers/of/:
>> +   patches are reviewed and applied by DT maintainers.
>> +
>> +2. Devicetree bindings:
>> +   patches are reviewed by DT maintainers but, except in certain cases, should
>> +   be applied by subsystem maintainers.  See also *For kernel maintainers* in
>> +   Documentation/devicetree/bindings/submitting-patches.rst.
> 
> I would reword:
> 
> patches are reviewed by DT maintainers, but should be applied by
> subsystem maintainers except in certain cases.
> 
>> +
>> +3. DTS and drivers:
>> +   DT maintainers might provide comments, but review is generally not expected.
> 
> For DTS, we expect to pass schema checks or at least not add new warnings.
> 
> I can address these 2 when applying.
> 

I'll make a v4, no problem.

Best regards,
Krzysztof
