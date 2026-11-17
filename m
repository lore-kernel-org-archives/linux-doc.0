Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950827;
	b=Uy+mPcaNudl/O0Vsu26E6dxPG2Y2Fv+vryV4L7Xc4hoRuBvicF1U3H6yaxYJsgtzQiSC
	 JKLVYaV247pk9Uv9nNm7GIFQHIXvYae34WtaVWlbUU0NvUXY7HLk3tmq9gA/OXr0Vurij
	 L8nRH9DREjoJNJgTTBhUDxLCnAIfrngb/TWgAW7lCe4W2I5opnrLQgVUfO/mDsmDaNF6C
	 GRR3ZKkI55toJr6nJGC7O6LzN371W2j/yjCciRvHusKl90Gp8kgE3z48oLxXNR/ddhoL5
	 ET7hseMRYwJXtDjUEiLAJEs3lnRptyllVq368zkkEN3WxNorAqjqEUd5/d8Y+B+MnRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kye5UCFhAlBn+MOXhNz9A2crB6ZLISzlyY8FztGTBT4=;
	b=ai+IHfx+tD5mfmIqUP/4NTUbrigju4bEvYo5t+rn+ItWlPB1Nga0WS5BIlNfQvzne66N
	 wuyrGgv4qsWCkef9F/zEjrBSO+AiLuKBX9U5MxpVk8j+68iln+zqdPGuPyvx7KJQwIcPv
	 27ODg3FpPR+tnzS6UeteNCii5xFF/wnpDbxFT85pP1oOrFmmqdulTiPGzRedSXzjKZSCl
	 AFT6uXJiGuFgysLgv9GZ/1I/MPhIW2gCrFv+uPqfdqh5k2iC4u1cs9g1qyUw0bKDSCLN9
	 ETgW/A2TOzoE/G3pduqBL0Kv/s3GN4bs1xo6sSe+qJD2z3it8t01yj73/FYyD1mQhMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mzqgtgXh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2SqIZqa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D43606A333
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 21:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D43606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mzqgtgXh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2SqIZqa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHKf3UL1847057
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 21:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kye5UCFhAlBn+MOXhNz9A2crB6ZLISzlyY8FztGTBT4=; b=mzqgtgXh+8LtF9DP
	EF0D5lQ3qW7+qC4zKERMkCrEqQKmpFz7ZEkgFGX0pLrxYz4k5h5anxYY9Onv61IE
	O1yMYDU1dsuOf8EYLIbQOULw30htv2ksBapiCniOlj94uWXKiuCASqeiFc+S0iB0
	FAB8aEH4H6t2nYg4QMG8Bo/mkt4Q66kEFW5/u+ZpWXvwAWMdE3clhQCYU30/v4go
	qWBbGFQcMMSxgnA21BKrCrfv+0MDmRyi2mwGpho99EsGgOkEKCcdOPyHMK+jYRJi
	zYnTb/YGV4smLo2nlgjPYYC7vdMeSlwbTR8GaxBQxN9ub4NiPvdpCVgD6qCSoMz4
	e3ngwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t1k53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 21:27:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so45347885a.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 13:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794950824; x=1795555624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kye5UCFhAlBn+MOXhNz9A2crB6ZLISzlyY8FztGTBT4=;
        b=J2SqIZqaDeC6AS3p0N7vX/KfVgChE0ItzAJ6PoExFwQl1Qrp+HrvNsWdTyIsiZrtJZ
         W2XfoMS4ZfLAHbYDlWefQo4lwBxvnrCVoZzbGVUKdBNQypwW8ThQaCfefONvIYbRa1vv
         /2rclYNMkEHZDeSxqNlD2p6mSCApkqp2cuNT/OJRj9pHfdv7ad2M6Q7ssRDRj7vh4bR3
         vfcrENJ8MhOrC+heQt01SCxj8C64uENH2LGh/96NtyRprE4/klNqpqAxHW2Rv7K/Cffr
         siFOl7UBOE+2CKJcXoSCkNRkUDYoMfA6idGQaEWBI9b3F2h6G5QQqsdSiZKAolxgB8Rg
         pNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950824; x=1795555624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kye5UCFhAlBn+MOXhNz9A2crB6ZLISzlyY8FztGTBT4=;
        b=vEMYDeZB+VO4l6LQoMrGdUtLiSzz2JRa0/sBhSHEE6UrHUAjA/2FnNHxe4a/C3qbE9
         2yuZ98M2TGZL94PcdnFkWEUoE7mq+4UTZP8xyapE7YQw7PSexf4Euta7UXyuhoJPKgsW
         kkKywStVk98Ho5fh9LOBmk1ZwEJIEVK5F02MI8jRCna3YrmyD5ISW38OMx4brP/obYjP
         f31ugKj+hXt8HT4c6WncHSYjH1I72HRp0IoM3n/YCPzhMgtxQ6lwNxN0KatzUN0M5kVe
         ujr4YMvHkiIDoo0YzJPZRoA18b5L4FPbnfMZoMS6+L+mc5mKvIWcjvaTbKs8Aw5HkVZb
         pmkA==
X-Forwarded-Encrypted: i=1; AL+hErGkPDvM5OyA532yaA7E0X8s3FZKba9bD6rwp5J16SNNPI66x9Q6UKW9x6bzsGfDoiR/vH6WK1aCrPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KTYact8AicXJ6bpX6+H2JHjcoS+y7ew4DgHNb4N2H2zUdyppp
	WfIeHY2sIxnpiFZUUtMvEKXWmPcak6jhEIKNeM05lYkDBABH9QhJ4aIQGVXxcGWsg41qStdorgr
	CxNLwSTHmDJu7GZLe2yYGteK25IOJ8dSkhBal7kFucBgcJiWJfg4YapwpqTPciEE=
X-Gm-Gg: AYBFou2+3AYkJ8yjGeIlpIsL0aux6Y6AuLxGMP/86RovXfmlILn2LnjW0fQB1a/uQx3
	cTEn+dJkjqN9Ln/ZubNupDY/buKxiXHq11VYPGmSxDH+5u+l9GLwWVR3t7OqrTkKgyUNHhuzRNs
	EEcWkmJQxgmbMFYkBVg+RWvsZq756qDXPt/rs17I2ujIqjeku4VlNaGXbv0lEns9+7M3CPPfAkT
	21JIxIoLzpRIXt6Omf7unazAJxn0yFPufbT/dtdi8J+b3oTQX83cPrehzNPQLe56gkYSEjDVmeS
	Q57Mha4XKNqYpki5WQ3pUPNiqQG7eNAq8iYZCIbGW84yNJ6vJXgR9OjLAIeAW6glyv/iWwzgiVW
	psMl9kqU416hOL9GGu3DncQno7Rs+KksoocllPrXlTiHmBYY6xB+lt2iSBDQU5N3bxGoDt3obWA
	F/emrJ/BfuwdCCXMxTjBgnL4RdWUxBZfekxNY=
X-Received: by 2002:a05:620a:8014:b0:949:78dc:f90c with SMTP id af79cd13be357-9499960aefamr136050485a.60.1794950824604;
        Tue, 17 Nov 2026 13:27:04 -0800 (PST)
X-Received: by 2002:a05:620a:8014:b0:949:78dc:f90c with SMTP id af79cd13be357-9499960aefamr136047485a.60.1794950824084;
        Tue, 17 Nov 2026 13:27:04 -0800 (PST)
Received: from ?IPV6:2a0d:e487:16f:e583:d876:5ec1:ccc:7949? ([2a0d:e487:16f:e583:d876:5ec1:ccc:7949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm104139015e9.1.2026.11.17.13.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:27:03 -0800 (PST)
Message-ID: <4f9abffd-1794-4564-a752-60f99ccccb4e@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:26:58 +0100
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
Subject: Re: [PATCH v3 1/4] platform profile: Extract the core from ACPI
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Len Brown <lenb@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Viresh Kumar
 <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)"
 <superm1@kernel.org>,
        linux-acpi@vger.kernel.org,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Linux PM mailing list <linux-pm@vger.kernel.org>,
        PDx86 <platform-driver-x86@vger.kernel.org>
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
 <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
 <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
 <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
 <CAMuHMdWfH+_4ijxko=LS_P6b1Y76WWDc8m4xL6qW1H+qKRQ98A@mail.gmail.com>
 <CAB9z6xC4c=o1DwVARBek7ozDxaCON9rpwTmJ810sDGyP0XYQDA@mail.gmail.com>
 <CAJZ5v0jg61_W6hgtMzKdMa+f27ApaNunnpkzM0MoYxN+aV-xog@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0jg61_W6hgtMzKdMa+f27ApaNunnpkzM0MoYxN+aV-xog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yIInwGRJsSQz5w3QJ9MiYa9PdNruyZTC
X-Proofpoint-GUID: yIInwGRJsSQz5w3QJ9MiYa9PdNruyZTC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4NSBTYWx0ZWRfX3A3+XbwGLy8K
 MDf9B7GzxM3D5iwQ1mRqU9FSYJ1nCse/Uh2zeU0HCDH1KO/pY35yNLrQOLPrZXhL0qE/qGJ/LTv
 sM16cckxA8PcWoDibBDK2GV4mIEpQOsFT1SQm/pgL/uF12qiN/hiFLuuPb6pexyx5d08Qavs6A3
 yEAzVkygEFHT55NN15iXAf72dUki2o8PVKSR4+O34fXlbHo0wPAJosOvEutJJrGQfoy/UTK1ol7
 F+EqLAJZgjBDCuP1UWrtXjesimf+XM/DWemE4JPd5YRy8ynMJPXu2RXtAdyBepR5vQwOvRXIotJ
 gyBeZWId0O+iYxpsWmKf5TLiDQ9ylxWys666ntWF4s0O8Psd0SBqody45Ek6q13R+ZXiuGo2SCo
 MkmNynraetk/nYOuJ1HjkIx6I8Ymo4SNfcEwbqTXo8WqF34Zsjqlrd/DrP3Uzope71F6SvpYjL9
 IAd2mzlI0ZlNlVzIhhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4NSBTYWx0ZWRfXyVYGs19kMk9x
 wz4DsmYut6GElxs8Qnf61eTeXGkFoAm6juQFSJi13ThU0/0zZUBJwgW7O5ALZnkPEd3sMSqzAaT
 kxRiyUg8uhlqZ3mhWtdnudWkAxhBQ90=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afcc6a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1nFPZZerRWjXyXi6724A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170085

On 11/17/26 21:22, Rafael J. Wysocki (Intel) wrote:
> On Tue, Nov 17, 2026 at 7:27 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:

[ ... ]

>>> Sure... Are there any users of it on these architectures?
>>
>>
>> ARM64 is about to (patches are cooked)
> 
> Geert has a point though.  There are arches that don't need to see this at all.
> 
> You can add ARM64 to the list while adding support for this to it.
> 
>> Others IDK
> 
> Well, exactly.

Ok, I will send a patch to depend on x86 and COMPILE_TESt
