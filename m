Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139D2D46A1
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046993; cv=none; b=XhjdISaTlgUJGVQMfBVdLhPqbJ32R9DKeP4qbrw5TVrKig9vGwCZ8wwmg3TYNjO6p4xyocqZ0pL+FQ+q1PfbEEP/CXCcc1Hw5Wfl15JF4ZH2Nh7F+KZeArIjJfghCpk3wKFoShS46LQsryO1gDLL1PmNvB+2hZqtXzEgB0fgh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046993; c=relaxed/simple;
	bh=JKDW/3JaTVDQQN1HGh2Kx50563O3XSftBtp3y9MuSmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EezBOSV8qs1eqqJ3/AcOAdO8X4N53yMBTrhizpYe/4dDT4oCnWQ4AbmLlfqdoQrxp78JtGWVf7n1xc/CwQXdnpmupyqKRQl3dOjfdle8uRU+soRPaxEp202OwctMHkoRtc4VPoxls/oU8rZFMc1X1BrSBzQ9UHw9EIiZNgFqW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBIuGH+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=judDxENA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBIuGH+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="judDxENA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3Rix1512069
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=; b=NBIuGH+qsITYkPXs
	Lof0N/6lSzDAv7Bpsm1A94Chi6YXXVYgoHooLmZ82JXaMITNohWCFCF5VA++xnoN
	yFJorSI5utmoSnY1IhQPWMnBVJp91XxB28WwAFzWVEGN3qSiQZCVtHkO5nZsRo2c
	JpJvOGSulZmLVv3Ty54oc1DNU2nIwPiaHIsLPqsoM1WW3qQCi34G+Bvjexxh6JlM
	uafSnrGYntn6CiqjATlu+MZVNOrBjrL6486X76+gARLA1z3DqX0pMoQtPXmQWMhN
	YH7S0MKzRKnXfjyz3xCY97lqnaDBIvi8uc5BjAJfkuSc/hfMmthY1ejzMJHJ1Gi+
	Zxh29A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf1hsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:16:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so26896eec.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046989; x=1772651789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=;
        b=judDxENASDtWRPk1RjrdYNQmPdZ6zl83fwVveVZG/dekj2O7E+UmeJxAc9KwrzCx1x
         UI53kcbj5D+4B0ZmOJL+9zZBnX2ZsobAF+q8LwXic8yJCDRIXeUvFDBctogM6jwNs2Zj
         tGh5FNh00YR0/xrs1yrFIQvplo2/3kQO3382RiNuT4O8gQwHaeaBc8KGnjGqWK8kO/u+
         XKgw3Ghj97pFsZu1zBhqBD5D9kj5qr+KJZqGs2iXLhUkBBVhlawPb4cC6adQfPvkX5x3
         cwuB5mOKK7aZOE4sCNiFHhHYaI9q/xJCmCP9zGXboccwuwtmkj3p1apDnL2H3Nir7GLP
         qF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046989; x=1772651789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=;
        b=k2cZy24lcsEC+dhFaNXcOXy0f1xT0McONT8KC8KalwZHWh1RNDwFwdw3Sm1O5/QfoS
         nOOnQgyqjkLGBbTIC1EoOHvbkdl7uBwXScMiqYVTF1e/EPNWcR5+OcQEPKuUBQEVaCv2
         AmWDRFjA65ClwUcZIakoY1+EH1Bkv0bKv/WACnaHbVwW28cut1y5eLhZokgbLhDaRIOv
         8SNnMA2QGmAwHGtxhfxGoy1f1ifJrfVIJkTEBs8+RXWKxcH9aIN863GH5AlHhQ7TsWMP
         jDWJCZCFz18+FP2dOiOyGSM08XJuSDRzWbN/18FYbbB3Wmgi8DCFnvNzLujOFRXjz576
         vj3g==
X-Forwarded-Encrypted: i=1; AJvYcCWlYIUPa6n7qxqoWjBj9ovq5Pe0JzqmKO7LIcs927hfifEPWKl1JPnA1KJ3edqgh++4kEaNntxk8qM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWN6w50422FGXix8LlKHUATyD28rVJFhEBlabPQPVcKvf+Neko
	x3oMFKwe4Pi1cgtVhYztkll8Qtp+7LU7CDDqRDCTAn2maRC2XcVwFBQdwAvY0kUCXVxzSmrFxa3
	dKWALUZcWJtwOTybrIa09D9SSGiFA+jk6ZyfClkU/A0r4oaiV/GRLg0BcL6Owp5A=
X-Gm-Gg: ATEYQzyOOFUReClWpi5wzs3Zefdbv3qfAuCIcUG+KVyuzb4UoM5Yfgz4Qd2H7d4lt/i
	t4r64jN77a+f4urT73+alxd2aOZOjw8+v9iy850mHYiDvFiBdNgOoKp/3lKj/mLd/hxO2shm1+d
	Jsyr1zhHCOE+PeLjQr6Ip/ZrjwT868Y9lmyMbVnjpUbG/kwcKO4e7H3Cina3qUcqZYKDx0bSIKd
	RMKAXnqK9g2s8pYtC1ChGQAirk7xKjIrPHaJlEWJkxZIYWHXm2SoSlU0RKrsD5zJORbpAieCu4d
	/sxZ7uQ6Ky2j/8H3zcQ84vO85XTXtL2gCFarXDyEd8yQ6FdlSJ3VxefAwrhXV0Xqb9Kukcs29yV
	omggDxMcnNuE99fWdTosc5QRdTIXnZic2VlotpPwTzfLZSHcNhuF7lAw=
X-Received: by 2002:a05:7301:434b:b0:2ba:990a:4829 with SMTP id 5a478bee46e88-2bd7bd112fcmr7841926eec.30.1772046989281;
        Wed, 25 Feb 2026 11:16:29 -0800 (PST)
X-Received: by 2002:a05:7301:434b:b0:2ba:990a:4829 with SMTP id 5a478bee46e88-2bd7bd112fcmr7841890eec.30.1772046988649;
        Wed, 25 Feb 2026 11:16:28 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8304sm9699189eec.17.2026.02.25.11.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 11:16:28 -0800 (PST)
Message-ID: <4e4b50fe-1091-451e-b854-f7b061ebd88d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:16:26 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Bjorn Andersson <andersson@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
 <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
 <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V1p27rsS2zH40OF68eTSbde-7Ykvf98y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfXwddvCYO89u/w
 Z28dped8CnGiWA/sEg3F4+Ihvbbc4LtNe7WeMnsCD030nI1Cwp10WR9B6LF+Tl6dz/k0ZAfO/Lm
 cE1uubuhAZ/Wsxgf/3Dj6uXjKq+bOw7YYXngsk9Gzf6AdsUT0QD/CCLmRJi/6VChaxC4MAZ3aSU
 O5l2Wjd0Eat/Dsl+SLDqqCFm0qclhC9Xo1KoIYQrc19myV3zmti9Dl0kJnlsby7LYt+IDq79l+o
 3F34i6GuH7IEo8CS0qsN09DTpqlS+w/00nH91Ly5xkpJxdER1MfxKCQRDHJItSxDE17qNshB5oK
 sxHbuEukjG/a5H37wFjuTZrPmY5MKI7vLCSIxARw/dftkW/VvVqEyp5OftPScZuWZxAABNxlaZn
 a70or3quuZSv7NP8fsI1pN3TBv92yXg83KVYSsFqca2RFYFgsqQ+zrpA3Zug13HtxTgWrj91spx
 FH/mL70hiOrFLD3HkHQ==
X-Proofpoint-GUID: V1p27rsS2zH40OF68eTSbde-7Ykvf98y
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699f4a8e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Vs6AG_5Z_IHWLNxo5LUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250180

On 2/25/2026 7:12 AM, Bjorn Andersson wrote:
> On Wed, Feb 25, 2026 at 07:47:08PM +0530, Ekansh Gupta wrote:
>>
>>
>> On 2/24/2026 9:03 AM, Trilok Soni wrote:
>>> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>>>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
>>>> integrated in the DRM accel subsystem.
>>>>
>>>> The new docs introduce QDA as a DRM/accel-based implementation of
>>>> Hexagon DSP offload that is intended as a modern alternative to the
>>>> legacy FastRPC driver in drivers/misc. The text describes the driver
>>>> motivation, high-level architecture and interaction with IOMMU context
>>>> banks, GEM-based buffer management and the RPMsg transport.
>>>>
>>>> The user-space facing section documents the main QDA IOCTLs used to
>>>> establish DSP sessions, manage GEM buffer objects and invoke remote
>>>> procedures using the FastRPC protocol, along with a typical lifecycle
>>>> example for applications.
>>>>
>>>> Finally, the driver is wired into the Compute Accelerators
>>>> documentation index under Documentation/accel, and a brief debugging
>>>> section shows how to enable dynamic debug for the QDA implementation.
>>> So existing applications written over character device UAPI needs to be
>>> rewritten over new UAPI and it will be broken once this driver gets
>>> merged? Are we going to keep both the drivers in the Linux kernel
>>> and not deprecate the /char device one? 
>>>
>>> Is Qualcomm going to provide the wrapper library in the userspace
>>> so that existing applications by our customers and developers
>>> keep working w/ the newer kernel if the char interface based
>>> driver gets deprecated? It is not clear from your text above. 
>> Thanks for raising this, Trilok.
>>
>> This is one of the open items that I have. I'm not exactly sure what would be the
>> acceptable way for this. 
>>
>> As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
>> without modification.
>>
>> I was thinking in the same lines as you have mentioned and  having some shim/compat
>> driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
>> character devices and route the calls to QDA. The compat driver could be built via Kconfig.
>>
> 
> This is a fundamental requirement, you need to address this in order for
> this to move forward.
> 
> Which makes me wonder if it would be possible to reach an accel driver
> through incremental transition of the current driver, instead of just
> dropping in a few thousand lines of new code/design.
> 
>> However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
>> before, so I would want guidance from maintainers on whether this is an acceptable
>> model or not.
>>
>> Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
>> unchanged in terms of definitions and expectation. The same project can be build for both
>> FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
>> not face any problem if the libs is built with proper configure options.
>>
> 
> You're assuming that the kernel and userspace are a unified piece of
> software, they are not. It must be possible for me to install a new
> kernel package without having to replace the userspace libraries.

Thank you Bjorn for providing the inputs. 

I also foresee that we will be stop adding (or already happened) new features
into the existing fastrpc driver, so calling the new driver as an alternative
is in oversold category.

You are pretty much began the deprecating the existing fastrpc driver, so let's
just mention it if that is the case and provide migration/shim path so that
existing binaries doesn't break.

---Trilok Soni

