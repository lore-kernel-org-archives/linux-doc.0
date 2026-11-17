Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931400;
	b=09SI25RfXLuVz6HTLHhi2LMGOXb7vNY0tM3n3dXIdkNmH7E99Es45ltWrtCRLvFNq+ci
	 dNey7gac+F1zUAk6UEAlC9Oo6F86tA9YJx7I6HvJLpeHJsRgdTvwEoTWpik/CIuT9/MlB
	 SBb661Rpj1+DtbIrbE2aj5w0mWxMTcBAw2fhij3//rBWsMqnwDBj+vEkmAQTIkTYhDBIA
	 /y91kZntt6hXfVICMlxUPANRW1NFGku1Q7/Yiiu6ujoAzItb8go//2RWe8bWKIzpsAHfV
	 kJhmF0FFloEy9mM3tG1SzU2my1DWDTFYzFBRhAqTOA2akph50gxGz2prwN+IvzpQchw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K44g9D+a319XGB4PD7ytYAYG94h2IajymOEoYGpnvQY=;
	b=WDUDs1GylXZm01ar2pTKDdq5mKWGZTkYpoXho0PF4bC83aTGt8UCVnUUQmvlEcr1kcXW
	 vSV7mhakzta6MiRtHcdDespXB/B+4+O77r9G6P9xNUympgKSnSeu92j0SAtP4FzYZtAA6
	 cFse/f/aw+2ZY9s+rDsJTUEFmq0VF3w7WmGb0rfnU9ZxtZpe8LQKqLbfGT5fhR3yGX4AO
	 1Xv5CMaqlz90PYWJ7FFmbPS9CrKCJxBXq/vweL8n9VvlkclvjIoIEPGTAQ3Sr4hGh9LOo
	 SKW3ik2Y04h5xL/cj8VYmv1B/n69oxo4gpLh+eRVPGHnn0wln0W1PyZAcZMzetThuMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DjH7rE7r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ciYjquy3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19514606A32F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 16:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19514606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DjH7rE7r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ciYjquy3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQpaW1663297
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 16:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K44g9D+a319XGB4PD7ytYAYG94h2IajymOEoYGpnvQY=; b=DjH7rE7rXPUt1HX/
	wnWqhTKgUG6zzAcP2cdBB7rOkK0/+hINtf+imirMNoaJtRDUnJ6GJb7GyFaOpjIO
	DR+JPWNr/nHrNC8SnvdajhhbziVtD9nfokhUnKeKZ9Pm1LN4OVc+GAm2ejBf0BrK
	G/KE3JbWvMOWvCtl4BJrotWwIw7RRQCqd8RUY3cQ2ak0kTF/07bgIpx+yTqlXtyC
	ZLCXpZP/09lMbCe5ZBtHOgfzf1eeYWqfJXAtktIOGUaVa4wj9hlUpi4sPRFsj5Vl
	tTsiOUuNbGvZnZqnlL0NZtgOauxcjfa8LEYVvD83+GRsYMf0S+N4STCQB6yuRuUQ
	o+xvvg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc9u7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 16:03:18 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so1375079241.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794931393; x=1795536193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K44g9D+a319XGB4PD7ytYAYG94h2IajymOEoYGpnvQY=;
        b=ciYjquy3mKYpLBVYOeTMAYxKZKY6SRXCfL/ZSMmqwB7SPFgttRv3pq9U7tXw+tc5Er
         IZRye7Ac27Iymk8RRwprZq3ML4zcbdlBHgXDlqKURd3F3APYAGHTqsstP+U+qFHLFtK3
         wWPk/Kh3/6tbc/mQNNmdyOedmc7lbjJ45dGtVxiDZTltfw2tAEnEKIBt9TQGfMM+75Uo
         rYMkgeYAgWCBEWRStnRbB5fCp6WfywXdGHxPdhIr70vVblZ/G0zjL61XA92zb/so+INV
         yLMELCp4OGyEZx84qoG0VnQcrJs4ag1ZqNmngV6P7o9oVg70AACd3hi77HSY8w0eojp3
         ySGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931393; x=1795536193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K44g9D+a319XGB4PD7ytYAYG94h2IajymOEoYGpnvQY=;
        b=AaWLJSmuw+HVuw1dPGUggHL/s86ztnOD8AubZ/5LCVPao0iZwjo38uCbhk7w9UuGa4
         scvTZFFdmdD0gUqC+K5xs3JaL9VLBXkRIPlaBlHXUYBwwlHn1QFEFUwkaiHjBEL/ffQF
         Ft5GX1iG1NBVpEgNmK0HIMe9WBjpGyx7yHKCTsyVmZ8e1Y1/feXSzVu7LpgkhlxcTlnO
         NxmqBV78GXY/n95jBCnfFooWWUmPN7QQCNRzidy0IQ5ufiIWRhmvVDk9u6x+LUJYwb9x
         zsy+C/udVNJtkOlKm2HqJ2I0YlIozfcz85m+/tN8uaXF3JUw898iiVmXx6nnTnw4/AZU
         u8VQ==
X-Forwarded-Encrypted: i=1; AL+hErE0HfgDvH4oOmq0SqnaDdBDyt58HTJsOzhtcE8qw9Gq5SsyPsPVErwtxFiGue6aH4z5XQmHWixjydk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GkdA/WeAuOFMpg52EVx55eQSIr6xD8PFj4CZgriYu1R6tjTXu
	xBNnElx8LiumoyOTYrK1c/KAWMC1vXmIWNRjUR0AKdDSihs7x7N5ADkYUFnToFVo3UUQ+jJbaBn
	i4oq4FzpPM/AVSvdCvHyDAdTMHD1EWyjaGuUXbVvzVtBsqDpNSw9DT+DRD8Df23c=
X-Gm-Gg: AYBFou1zXLEtPTuVet63zs1vr0iKkQikQaRjupgc6fnoMaUiiwiys/E+78H5nWHEMdI
	y1ntM6CrHaJHDLC2vi3+Lz3rmFg1k611wOdKKst4HhNbwRmnFeVMFvjw0/hCw54Axl3ac6CS2H+
	df4MCS8BhxWmvnTLTjpypLvtcGTTWL/rmMKfaLn3HTivXihBbUjJQfAmS+f+Oj25REjaC2GzmYf
	kjdc/+hH3MWiIp5GAaKPsQg/rfSCQMf4GMJ9u9ZDOBA4fxZ7rcy3pp9WxJ/yGFkmAggH+ZmJYol
	3mR6s+3pRbOU2pqeqNK8u9Pk1GNRSaJnKejPLM4Ki7LlJ9ISnlIj5gfLLoy7VRvX2jzaPgAlQEV
	rZZpVur6Rxrx8k0K7pbxp68uHIl62UJinGIg77dhqs2OSLTsclqldsYkKwFccZ/ycJPgI2lesB8
	f2IZiUfHpwFDDy6nZ7H7Il3t87NIDwb8tsGzyU3A==
X-Received: by 2002:a67:e7cc:0:b0:7cc:33c9:b3d2 with SMTP id ada2fe7eead31-7d64d84039emr4314652137.25.1794931392798;
        Tue, 17 Nov 2026 08:03:12 -0800 (PST)
X-Received: by 2002:a67:e7cc:0:b0:7cc:33c9:b3d2 with SMTP id ada2fe7eead31-7d64d84039emr4314573137.25.1794931392102;
        Tue, 17 Nov 2026 08:03:12 -0800 (PST)
Received: from ?IPV6:2a0d:e487:16f:e583:d991:ba24:64f2:e39e? ([2a0d:e487:16f:e583:d991:ba24:64f2:e39e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm111459425e9.10.2026.11.17.08.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:03:10 -0800 (PST)
Message-ID: <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 17:03:05 +0100
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rafael@kernel.org, Len Brown <lenb@kernel.org>,
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
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
 <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
 <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX/Yp8L5cthIWT
 3uGbBE6ElRZRefBf3Qvkf36w6CqwTZ8uz5CbXabWi5nykO3lhPeJ8obdJ6vp2byq7JgG8TERIVu
 +doO0DoCDE3g/T/ffQp/Ex0fhHZRwlU=
X-Proofpoint-ORIG-GUID: WmS8dWONCYXz9MTyMRrCTHrPGVnOzPHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX7ZeTzRznXOCM
 N3lyje114Q1zu/WmSEEeTPXoGUeNh64HBxctAkLIQtn9KKd7IiDJtVozMr3qh2T8335bBg6OsWM
 j0BK8O/zkEYwYe8NPaU3R21faQLiK7YPHe4GBw+SsA/yRO5yBbDfefflZR+WbPseRQ6dKVdVDsa
 b6YEOSxPqc7O8u1bKt6iWimV8VzNX8A1Z7nTJigSi1UHVGxT/4Tf4vx1wB9LQ6R8w9OaEy/5SPG
 QtRIhhsXka/GS9aY4Aj9mmCaXjGm44/9gG8D46yC+tN3cs8ETOE2G5SH4DpiDkb4nYk26l0Xd9F
 PxSENfBd/3c7YFijuh4eXo+HLp6xyTzzW8kagL5fAl5yW5Pp3Pft6D7t5SR8WqxxzB7V8xmpyc9
 lsbIZpcqpFzoBGn+UTUtuOYs1oIZA854YDaIt0/kRAPlF20RPqihRSi2lAsdi6ThVDG6Mcs4rsi
 t+D82jfV0x6GVjcJyEA==
X-Proofpoint-GUID: WmS8dWONCYXz9MTyMRrCTHrPGVnOzPHn
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc7ac6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=XpNdnCcgRucV5c9rQ-UA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170063


Hi Geert,

On 11/17/26 12:48, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Sun, 25 Oct 2026 at 00:56, Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>> Platform profile providers already use device-based callbacks and do not
>> need ACPI types. The core is nevertheless confined to the ACPI build and
>> refuses to initialize when ACPI is disabled.
>>
>> Move the implementation to drivers/platform/profile and introduce the
>> firmware-independent PLATFORM_PROFILE symbol. Update all provider
>> selectors. Keep provider-specific ACPI dependencies and the
>> platform_profile module name.
>>
>> Isolate access to the legacy ACPI kobject in an optional compatibility
>> object linked into the same module. Retain the legacy ABI on active ACPI
>> systems, and initialize the class even when ACPI is absent or disabled.
>>
>> Use subsys_initcall_sync so the class is ready before built-in thermal
>> and CPUFreq providers, but after ACPI has initialized its compatibility
>> kobject.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Thanks for your patch, which is now commit 699041135f75b13a
> ("platform profile: Extract the core from ACPI") in pm/linux-next/
> 
>> --- a/drivers/platform/Kconfig
>> +++ b/drivers/platform/Kconfig
>> @@ -1,4 +1,20 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>> +config PLATFORM_PROFILE
>> +       tristate "Platform profile support"
> 
> I guess this can be invisible (perhaps "... if COMPILE_TEST"?), as
> you have updated all provider selectors?
> 
> If not, I guess this needs a "depend on X86 || COMPILE_TEST", so people
> configuring kernels for different architectures do not see this option?

The goal of this series is to make the platform profile firmware 
agnostic so it is available for all architectures


