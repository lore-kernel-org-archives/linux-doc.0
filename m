Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C003C1414
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160636; cv=none; b=RMeANEpjmNW4HtzUtugYA86VRKLX1iHngyyZ7qI2h3c4+2SAqXkezOEaCyfFH0w5mHLnkA7i2sKWds29FsLUUsdItw59D0XfVxRp0L4tNR8lUOE8hkbjTBC4irc4Scm0UOyuY7xO8qDIvAbYxfBZL/9Tf+G/tousDFwvgWuRGnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160636; c=relaxed/simple;
	bh=4QU+j2opPqbRY6S9FdsfsGUfoFq89DJ57ft0XCMPXrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvmkZRwUVAHX/fiZijNMEb+H3G3GRr4+Z72cT/1ia94q3ARkUzDfKzhV3Wn77H+eGYhFRNTUv6iFvUjxk4q7/fd2yKQ+w2G5vBg7ZOSI5NWmdFLwO1FlDsGzQ7tS3iS+5wlqKtIloupULMA3/WAB3RgCLC8KtUPOyYnCGmbAf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUruiPe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0ESElkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUruiPe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0ESElkK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XPLE967332
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=; b=YUruiPe2yV8G8P68
	Vd3jixfI8MHnR+ZnVmulP5Q5N25mGGpJnQ+1U8QrIosZeRbZ+88VT3gJDgfvjmfU
	vEWG4mAtg7/AKF9JcnFXrznz4nnphK/5A1xW1VFnAvUzH4T005KuoJte/BtsIWh4
	Dwp1c94+VP+V63QkVWwgo+BFfUT0A+kYevqaBAxswQtsmWWgUBWK0ftbFL52ieY5
	lygOEGycTzqK6h856CNfTym6c1q3AoC+TnJSPdC6tthpTS/IpAKWkHlnHtRkPwtt
	itLcs8B84SGDFphn3FbBTiKoClVOQdUFJsOqDW/WBFnwTWBU7YlzuhVjDORiIf9c
	iaXFYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v2514-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:57:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso49374795ad.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160633; x=1776765433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=;
        b=j0ESElkK9Od1XkBlQmw7gsfB4WJ22+d/blmXtREM56TuUKETnzVvkRQKoT70eRMFvh
         Ctnb2nivSVCNjCeOKiKDDat75ZneU1JnqnLP/aUbcF/6HjGOZeh8qUaBuZM5WPqSMg22
         jPS5PsO2CxG3JpIHHFC/3KOlGpNPJGAv6D7n6Fvk070mNTtKCe+Ov5wNaLVl2VzmrpSK
         FKatOhV0kZfjsJ2gKQKtgq/pD4Nv946Ij++r2OrgXBkGC+JN2eU+qGyVedfXvM88+HEq
         W6elgdty+50+IBpSgSKLS6yyDHmxqWANguMcaYx9nurt32jN/EEJEdf+elOk4VsMkYCR
         TJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160633; x=1776765433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=;
        b=bg+scmJY6Ufl2HqbtduTyLOMw4nk5RznMR48ik8XFOeFBUAvNHPbK1vBiLd4klbUt6
         rgtwQ2cLWqDRvysNGqPHGAfiitgJVdcPbIgrD0tG0D9Ed5QhZ2wXy36AqwEIGI8XP6vG
         qKb2+fQ6F8JMerCcffW5zfi0wtA9Y+utcnBnNuam9JArQMLsrqzY0JQBvkLlyfqCqZxE
         dRX6CYblhy4ohpps7TXMayuL8zhrvkq/k8xXJ7MgJ+e326tiDuqHofd6paY77MzFRhm0
         q7eDioxNyvDPiE7+Ez95+E5B3+QWUdj63hkS5wG/+F+6aYGD/DaXvYw4oMc3esLlboY3
         DwgA==
X-Forwarded-Encrypted: i=1; AFNElJ/3lhXJDJfXPdMzCrYXSl0PE6U9EIzAPFTp7WxDdUlAWo3PJaG+uOh08fHluCphCKy4Vf4e/9Frk+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YybFTngXbMTCY1Sg+oN5TvDLlTMOWVYh3/YCdd1oPSFkMw1smjX
	XbVDnv0QYiiZqen1hKsehSkU2FcSsG7ZnaKVrGXd8hCMtKXnpbHHTFe42EM4WSKKr81KTpyO4wi
	xRhJqDf75FzcXE88xUFo7wKYkaKK07XH2+xU1pHqpFnJZZJ/vOwyxzU7/HzFm+KU=
X-Gm-Gg: AeBDievV2RvhE0SIsASyWQ+X4c+fTWTifAoKrp+jc8y7nfCv8rDrFbQKvbHVKs4zwC/
	DgocTcvT6821l8zwLpQ20IYEZfqMhK3i4y6npda3Tw7ANsz1ITkNmhaVXl7A8K2nWbtOF/9eVYn
	KKKQPJAd+RQVJke2QkLb8mgypli6i77u0EmrTqFXE3SNXsm8/wArisBiQuEMK74RfAVOr+x5D7X
	cGyNo0S4yUVyeMivHH0OAelSo0N5kGaq4N6RKZHoVKRvobR5CAg/mudMqV3joStPb931J7lS8P3
	SYSpaZp2RI+oNvVkodJPtDwoxlPsKIB80FO0/rApnfWE3zp/Q+2I2mm7nhsPR51PFkeA71k+hkY
	ziBinM+ns8DqjCgGIa3AVz7XQEJWoWBK3PrSMQ5lbvEz1d8ecfzlCeg==
X-Received: by 2002:a17:902:6942:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2d5a9e7bemr117452255ad.41.1776160633564;
        Tue, 14 Apr 2026 02:57:13 -0700 (PDT)
X-Received: by 2002:a17:902:6942:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2d5a9e7bemr117452115ad.41.1776160633128;
        Tue, 14 Apr 2026 02:57:13 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dae27asm138487695ad.7.2026.04.14.02.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:57:12 -0700 (PDT)
Message-ID: <f9bfcf86-046e-45c2-a664-425db04521a7@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:27:08 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
 <yttrssaw4k2vx7r6l4vsb535qcrr4phsgj6qlnu2r764inai7o@d4qgr7uu5t2s>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <yttrssaw4k2vx7r6l4vsb535qcrr4phsgj6qlnu2r764inai7o@d4qgr7uu5t2s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX0/jKOwxiye2v
 cvu0onQgsMixLTmmKHha1WX3wu+/2aIsudpY2M5arkcAIapf8BdJhVQWVqU4PI2NHrSjXKPGadP
 zr9GmPA5iaW8hpjx+xkVZ6q1Mx6j9c5WVTQD/PpVYpYFSJHrB5wVN5wTjPj1ay20XigbTIj9tdL
 BsCj4MMfkz56pNSLvtqPDD6QwBTC4GN0xbhOC4mCcO1+LqbQ/vKhcW/TG1bBSaZsYi+CxD9hNDZ
 cZ7N8OCY3R1OX9Szx9sRVD5HJfZOo4hJwAMFUl+ueV1FoO8nfGfhH+R8HA+Jdnd0HOhG7oYQoVg
 PBkjKsofsHCVuuHQS95Ssom1rc+Svs7nk1VgaQy6j3u/IMXXHxg2mpzIen/bn7hIQqqm0EzPT9z
 BwH7h8zOVJC1Q1u7CKoEK5zn5V1s+YzZCZyT/La4V+cUbexUkDmD239qNzLwhsU29iaetRXJ4LT
 6h8tFrEcvRyX2knfB2g==
X-Proofpoint-ORIG-GUID: NyPWI88M5Dm_BMaEt1_w_0HBqfG_oQEC
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de0f7a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XMNYEwTNIfZjcZPMuGwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: NyPWI88M5Dm_BMaEt1_w_0HBqfG_oQEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092


On 4/13/2026 5:29 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:49PM +0530, Kishore Batta wrote:
>> Add ABI documentation for the DDR training data sysfs attribute exposed by
>> the sahara MHI driver.
>>
>> The documented sysfs node provides read-only access to the DDR training
>> data captured during sahara command mode and exposed via the MHI
>> controller device. This allows userspace to read the training data and
>> manage it as needed outside the kernel.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> Ah, this should be squashed with previous patch.
>
> - Mani
Sure. I will do it.
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> @@ -0,0 +1,19 @@
>> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
>> +
>> +Date:                   March 2026
>> +
>> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
>> +
>> +Description:            Contains the DDR training data for the Qualcomm device
>> +                        connected. MHI driver populates different controller
>> +                        nodes for each device. The DDR training data is exposed
>> +                        to userspace to read and save the training data file to
>> +                        the filesystem. In the subsequent boot up of the device,
>> +                        the training data is restored from host to device
>> +                        optimizing the boot up time of the device.
>> +
>> +Usage:                  Example for reading DDR training data:
>> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
>> +
>> +Permissions:            The file permissions are set to 0444 allowing read
>> +                        access.
>>
>> -- 
>> 2.34.1
>>
