Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F852765E2
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441017; cv=none; b=nwDhYwnPxrFIVvwe8j2cQK3lZo6986ytIibZHmuHF+7zntKfhBpDajUMzPB+12KEmkgdmmS/T3oYNe2ZhkHo0vfqYaGwkb1YoxcfoQd9IDlNMOcDmLJ+kIqo1JZhdxMpE0j1yhrzAdmtxAMs3OKZaRHcvRXUKLjFjfJVqwpYrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441017; c=relaxed/simple;
	bh=/xZ2osG6NIrmnyZ+TWhCavfR/+FAn/7RvAjDCbyOXRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuawwFCSSdWOxEqQQO5fJxkHmToHweo453s4UkRKxJDMUi0YIaFEaXL+WSq8F8MeT1Ci51FyetR+IZ8fva6q+VATRYxYWLS2tOzPp7XRNP6bMOhUEowgpDjxIhTbhEyqOlhn2Ezl9w+UTHrMyFXKHID/H96lYtdls1uSApSxZ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6FZQn/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQr73Kov; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6FZQn/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQr73Kov"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228HISN2456997
	for <linux-doc@vger.kernel.org>; Mon, 2 Mar 2026 08:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=; b=E6FZQn/V+eAhBHn0
	8tH6CLUWeLzRwHKNoHRBXFhESTg8oppg4/shnlBIJSpK+UUNYJAXzfZDV/Xew3cn
	gxxUjFZDbR2tQM7WKMRb0DQ5YsZ3IetF4VzbhlOYem8u3zzwysF/7B3IB19HrAPK
	ws+FiOiFDsF3Q4K/mpYNHAUf9JkNiPHXP10RACAUFmWye2LgYHeVX3Mh9FGZbirm
	TplyKHUGAQNGq1kLz6AXSsZlDeaY4QjdkdTLnyTxJmMydlc93l7LSXqvo22pHurH
	V54k0ahuW39O9Ba6kfFlEUEaoRsTlOo7SQD+XQZAKeOlFk6xUqJo0+N5OEtXWA0p
	1mENwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrvtxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 08:43:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae3badc00dso18761985ad.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 00:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772441015; x=1773045815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=;
        b=SQr73KovA7fHWoQANAgttk3PDCptr59qoNUu6qCfuHZNIIyWDWAmO2dLuD4UBNUMp9
         YgCQm0YLpHjA3ThD/gv3ZF8UOfe7i0hdHaGcZ7a8GYXdhOBZY8ETI/KPpOtPXckgMQnJ
         nuxXiZcl6G1XRaRQLV2TVIEp4b6MBnVwaqnqg3efXfhYvMtiB8XfaFBx4Spfl+erxfwd
         1DqqyKjq9G8wYHsI+tgfh3b72y3HVfb4EhyJayBecaaf+l7I5FhyC+LeiVnMhgIJmT0j
         Tbv75qJ3WOw5J0YNmskK3st4keUiEVVoj7iyijsoEuqsMVSULPMftOE6Sqc2Xc+vJSKR
         QYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441015; x=1773045815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=;
        b=YFqhCq5WVFVRo+A6if9e1XPDta8om74UUE0baIdOO5rV2bjRbf8E0VwcL+TchX5igW
         0Q7t9mX2mrgSFIaaWNWKr9W2joRAfg0QJ3Ra5KcB47kw8uQ89AgT/ktwJOMBT4PaBZvd
         Bj9FREgNBmRTCRMfU9V7fkFoSulqjbBoh4WH6RgzlG9pDM6p5JfG6z/tb2YKIZlheRt6
         iTVDCuyIFkSK8pdj1VOEJAzj1b0t84XMsh0P8HrbeV/gl+Rq3sQnh7+unXo78o8GoQqJ
         mjZT7669tHwfl3xcmEGKj54uKdFm0mUQq8YeUvFYEss93nryeO4FUzr9pcl47nl6sTb0
         3Pmw==
X-Forwarded-Encrypted: i=1; AJvYcCWMOm7V/FRrlj/3gFjflX+xOCrE6NRv6ejtvQZHqo9smIJKgJZmg67Hyp5twMlO5Hg/V8POvL7KEjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJXPyC2x2ZcPmjWIr9LAdKAOaZnf19jCICWIfdM10RQJcXtEvC
	YxnCzfrkWOO2j3HVpbbwGZhg/HWrR2l3fj48I4hxWK+gbB2e6sk2WrUne0obis4AvFi4jxPBdyT
	Smnmx2MXDqThzgYnupr1O7hSAKze5jt1usCz2ZERdBT5A5W1eQ+c1+0x2ZbLP8SU=
X-Gm-Gg: ATEYQzwBs7f772SZ6wsPrZBMRbcrJY/6S+30Q/KWNgabakXvLjPY/ALbmeiTnyj184l
	/QQ7PLblrlV33WNKxvwO0rFsN7xHDVjBBKYmDft5ai++/0OY7POHO/LYSLFbyRYrZoYar7saw2T
	vtW1FRLf1835pudv3PU0tqo9plEcB8XMFoUZUpc5RN5WWbbOiZpS7QV+0O6XVjNRah1WUIyqNDG
	ipmB5tkmXBT9pNA1I/ayRfhXZ+YSVZcUHSHcYnuHXPjvVDOfGdINQYrh8LtxlnkavQEY4U5aBR6
	OCGfwgl6NaLapkN+LEieqdp34K316KgD4mYErZ20oI3Y5JXqg3Afikma3GB+yq3NpZwGd6xZSTf
	wcGdAQ9CIfdWL+Q4GY6v4u1150eNWCVgEKroLZ7C6CPrukta1aQ==
X-Received: by 2002:a17:903:2352:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2ae4a4e1f37mr39248015ad.25.1772441015356;
        Mon, 02 Mar 2026 00:43:35 -0800 (PST)
X-Received: by 2002:a17:903:2352:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2ae4a4e1f37mr39247665ad.25.1772441014848;
        Mon, 02 Mar 2026 00:43:34 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5276097asm23725485ad.34.2026.03.02.00.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:43:34 -0800 (PST)
Message-ID: <9eb6d9a3-268b-4dee-9fab-ec59322e8a3b@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:13:26 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <cac08f2f-73b0-4629-898a-1e24840910fd@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cac08f2f-73b0-4629-898a-1e24840910fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NiBTYWx0ZWRfX7eqnqA4SUGRx
 +xbYeG6Uh9tncU+mp6wh4xZfdlJSuUpJwIBEYTijOB1VMXQtx8jWxHE8VeJ9cjvsCAB6laBsSME
 sEDDiax5q59ZivczImDBLzLjtEywDJZD8upzZbA8SGhZzRvllUH338S2RbL7s3hMK2FFoKPzfDH
 QtRoksqVEnesL/WZc/aamSFM5w0rhvTzACNIKsKUrkTNPEu97KmRt+v2n14ca/GneB3tYaz9nUQ
 NKL92qWl3YmD1svYUSbYqWas8DOnZfeR4MmZq3L0ofDpzTCQADUwE7xEVTwUXoqc0t9XleZ5bIn
 m9cbexaoT0yVbhYhc7BEihH67/LluQp75jFszegT0GAd84OXUrGpDPAQH29XivhRj/FtpBHojPI
 Th1JpiGMmqmnVsIPODUWWX9LGC1tTOyi5qbnoRc13o5i5iRZcuMrZANBuxJbNHfb/JsnrLMBTw2
 CDOKajMji8rO87BDs7w==
X-Proofpoint-GUID: l-ZIM8vkIHKLy5inF_IQF3xS9Mqn6WQr
X-Proofpoint-ORIG-GUID: l-ZIM8vkIHKLy5inF_IQF3xS9Mqn6WQr
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a54db8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=AnEmtbbmQWdTvrL9bUcA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020076



On 2/24/2026 9:09 AM, Trilok Soni wrote:
> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>> * Userspace Interface: While the driver provides a new DRM-based UAPI,
>>   the underlying FastRPC protocol and DSP firmware interface remain
>>   compatible. This ensures that DSP firmware and libraries continue to
>>   work without modification.
>
> This is not very clear and it is not explained properly in the 1st patch
> where you document this driver. It doesn't talk about how older
> UAPI based application will still work without any change
> or recompilation. I prefer the same old binary to work w/ the new
> DRM based interface without any changes (I don't know how that will be possible)
> OR if recompilation + linking is needed then you need to provide the wrapper library.
I'll add more details for this based on the discussion for compat driver.
>
> ---Trilok Soni

