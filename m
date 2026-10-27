Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105966;
	b=zCsVoBhuH26B10JDUCknN7KeJYUIQBq2L5IT9nb4hJdg/WlosUk/hFS97G2PxAibSBxS
	 qb69BMns3YoVYoR7ZA/wYlp7clAdSAKYOuZR/aOioO7AS5VWRZRumia2DyPEw8+EivCBT
	 XJz9oi9ad5rpy41SUP9TK2pq4tLdl4uQHjn6II2kgRZB1EufD41pLL28cPm25dU1uGeJz
	 F8O8L6HjrmqirzDK1Ospt/x/LqtyU2dGB2tNCFE+znBx5q5z2aMsxR+bFSztatB3XSqyj
	 +qdh7prsCuc5FBxqZgPZYDHpzR7YUrBXPVh2ujA0VFn83RVcjj6pW8Q5+1zC5CvFVRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vsl0HVbEuoM51i6BhyxMfLu4Q1ZoOEb60y6FW9JjSq4=;
	b=e30BSKYi03Na8/1cYZ33mW9es/F7u7fwZm0zumr9LvBim8OOIRsA6dFCXxy6fASvVyGu
	 eChmDTMmOqy3rQqEvIzqfxjZdcO8AnENbxlpuP4fNneLCoTWx7lKSA48LKBAvYwOnklqm
	 oy9+cEuRoq8D0ZPPAU9dTLQU734YfFeSAvz587a2VZSVx4W32TVm6X8Ym9FUChkzvqqPa
	 +6SeLxYlpZPwY4QYDpsBH9KcMwQULfQJDZFvQGceMGWZ6SnAOe7vS003IZP7+cHY/fVwp
	 soSKn6fAbPFV4s1oKtqUxJdQvIxCfvGlsCt+/wEeX1LLKOfBkYBzZapBHaWu2uLKu5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IruyvjM5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJhqJsrX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40DB606A322
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 12:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40DB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IruyvjM5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJhqJsrX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe8Sb3026348
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 12:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vsl0HVbEuoM51i6BhyxMfLu4Q1ZoOEb60y6FW9JjSq4=; b=IruyvjM5/aLrDMuW
	5KVWVW2tcpRSZCiH34BEt6jagRX0sat0rKmCzk1TcpRNrs2ziG3qQoYIw9VRDHnC
	bUEWdoXMy/GEel6T+h5B6nByfFUxDVQkunbk4aXPuP2A/MsZlyHb7EmrytuOBbbe
	Y2LofxqRFRaa35TUaPPeQoY2ZKZthfjJb0uwn90uV2NO9GLEM0kV8SDeMeblyfXi
	Wim4p14h+k1+jc5sgM6BJcTCfPQ6xl8os4N1nll6kIOrKWAKFpM7jbBDSh6kZudN
	o7H0yuNneG5mFCmSsIWRl2ryA94CFTQ7l0AOTQ5lLWKcL4Q9zctu0oWBR9XFmfME
	9x7eTw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91aj1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 12:59:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4390146c88.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105964; x=1793710764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vsl0HVbEuoM51i6BhyxMfLu4Q1ZoOEb60y6FW9JjSq4=;
        b=JJhqJsrX2oU34E6gMKvvyqkngUtNRYqLbqXehgsB3krNFSc75OR3zjMQss5LPn9Vyv
         PS3/Qd18V/urRs/kZJcAfTK8bXfH8YjC43tEj4Nj7xHenV3+K/lACUpCsoOo0Laiafg8
         p+IpS8Ka7mu7PjVWvfgoKqUTZu3mS+7iT7U9rXuIEhNUkvWFRVzOWzy8UPNoL/Yyaxmv
         AyXc4fnQIM+IEW2X+r9NqWCdsUVAeJntop89Xebr3HIJyIAmJXY862tEhkuFa0324Bzi
         tP6yU8z13DliSaKhud/3lXVRHLIpCGuh+lG8GZ1GuDSdZYL/RkvFW0OWmOAJGu026jfR
         ya3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105964; x=1793710764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vsl0HVbEuoM51i6BhyxMfLu4Q1ZoOEb60y6FW9JjSq4=;
        b=O4xNL9UD5rOrEa+N/s3RHRiny62b9hkrLRnwa77gQNLQ5bHyW0ZB+1t/I0zB45s1jA
         JzF3gp+LhsbSW6mD3zXi50Wf0LaggirVcSFLCBQNmof46R9b2wVaHoY6Lr3xa9QjUdWB
         QVPY3rnaX4O75tmcH8isUdpr7CWqlYYfT2tpFKaY2EOxmY3H3S2t1xhdaEvGJQyKVckE
         PIBP+TwnQ4ODVBnN2jVSNKNrtlWg0wjRqLSD9D9haCDrNyGnqbehGZLpeTCtEmuHBDCl
         T9wCB0dXJnH0S5zDSviQ/J4+kh6y4VfsdUQ27wj24aS+fQRunE5/gd7Uf3fD8dqBM1AK
         09Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxAGWn1DLdZ0nbOe1QZLs+xZNN6hRKi3AoIUH9vrbFrHy/5ZDDiGlm4ZgG1NB0qFToeHyvue57a+Aw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJPKp+tu9LmIE1CUEnXVE/3r9Jfz4onj1Ixw5luoDImlyOm0xK
	QpqwyYEeDIu+ORWSK8751ABb4+YWEHXiX6nPneu7ItXbcY+zxYBfQev4QHGNgmOC6K1ggdC61Ev
	fsm9I9HtZYzOQRSmg2sf9XZz+Leg2ByjEvjJmXZMVQ5L2hd6qzrGzp7edWSIRdpw=
X-Gm-Gg: AYBFou2iuH186XffxU35ROneXvNcJcdnvailPJLgfS55qREFTKUC8vABA6HA2k1Nq/V
	zSRHZwZuyIFUGNkQLfsRN2DLwTTJbQ9rgaxXZTgpFf9CS4mz32u0wmrusPsTWWiFtYRhf3PDbjV
	UzFJ9CFTPoFy67qsWPGSV6o7PPDGOlV+TMVXur8E+OhlD53qzFRb7+dgGS0PVYuXxRHPJRmPTXp
	6gwzpO5OiN+I93xVSf7plDsZc5CzupQUdpbYPp9+2dX1hzswC+9gIc47XRKulSgPfv+y69YBX2F
	fmG4P1RxRjCJOHKTaRChIoQBfV5y/ZL8D/7lfK5OkSmvZeGdTPxE9vScAWk2faMibH3wbWcBYZz
	xtqieVn4fNbvgVmHmhA1ECOE9MtXy
X-Received: by 2002:a05:701b:204e:20b0:183:bebb:e93b with SMTP id a92af1059eb24-199292f43eamr13457146c88.6.1793105963988;
        Tue, 27 Oct 2026 05:59:23 -0700 (PDT)
X-Received: by 2002:a05:701b:204e:20b0:183:bebb:e93b with SMTP id a92af1059eb24-199292f43eamr13457100c88.6.1793105963185;
        Tue, 27 Oct 2026 05:59:23 -0700 (PDT)
Received: from [10.218.49.202] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm70037137c88.17.2026.10.27.05.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:59:22 -0700 (PDT)
Message-ID: <991e6b64-8741-4669-9bbf-e31eed788f42@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:29:13 +0530
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
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
 <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
 <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
 <e7788a12-3cad-4bd4-9f79-82cd118e0049@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e7788a12-3cad-4bd4-9f79-82cd118e0049@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FUOIqGTyKUtRQwv9kLx3dyOqMAaVqBNM
X-Proofpoint-GUID: FUOIqGTyKUtRQwv9kLx3dyOqMAaVqBNM
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0a02c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2QBr877Ud9-TTkl_dS0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXzkDJ+PgBvJud
 xFwEVG6MwO3+PdWxFUsi34AnWixgvb4ogCcVy5zzMIhFRsbRVm10RUuBdbx2UVIz4rMdICE83nW
 kvsDI6R+mOW0bU8y9fFJWqLc/g0GR0QFuf4QoGhGDtOuIx8t7RiHQtQ3PY7qZ+ErcBP0YPbr1X3
 TbnB8XfNlmzqUta0sym2bNsFakY+R1aVDlXJqZ/t8ZBqtkKlhRIGnLLiwuudSMDgve3AR47cP8x
 gbjun5nI4JWMiOFAkUQoN0A6z1s1UF5hK+ufabW9UwwtBZUgdSbbbty4t7blWicZ1LtQkcpynxY
 svLDhvs++vf6rTp7YQ+kdKVt5n749txJ60ByIckxNEnFxhAViD/w1tihrPgfsj7X6PtGr/dgd3y
 n2x+DB/f8WkR7LkCuPD5z0SPmPNbSMlXn9nxDlHYH5Bx1voQQ/LHVA0Lne6kviFPW/7EMruZ5CC
 3JDw+Gm4o6kUehJnLZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX32OW39DBfVzu
 EjcsD7XMDROPYfEIOwsUmH6gh/npovbEWYGJ/+k84O5kAR87N/IILPDSu+h9nymNIVTMe07FtXV
 nESPI46847zr3UicgMa02muZzl7iH8U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270051



On 10/26/2026 5:21 PM, Konrad Dybcio wrote:
> On 10/23/26 12:01 PM, Gaurav Kohli wrote:
>>
>>
>> On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
>>> On 10/2/26 12:46 PM, Gaurav Kohli wrote:
>>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>>
>>>> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>>>> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
>>>> trip points by hardware version; wire tsens up to feed it.
>>>
>>> [...]
>>>
>>>> +    /* Hardware-bin values for thermal-hw-bin matching in DT. */
>>>> +    const u32 hw_bin_std = 0x1;
>>>> +    const u32 hw_bin_elevated = 0x2;
>>>> +
>>>> +    /* Higher thermal profile identification for qcm6490/sc7280 bins. */
>>>> +    const u32 tsens_chip_id0 = 0x197;
>>>> +    const u32 tsens_chip_id1 = 0x198;
>>>> +    const u32 tsens_chip_id2 = 0x20e;
>>>> +    const u32 tsens_chip_id3 = 0x20f;
>>>> +    const u8 tsens_feat_id2 = 0x2;
>>>> +    const u8 tsens_feat_id3 = 0x3;
>>>> +    const u8 tsens_feat_id4 = 0x4;
>>>
>>> Isn't that (also) exposed over SMEM?
>>
>> Thanks Konrad, for review.
>>
>> SMEM has related socinfo data, but there is no exported helper for the
>> exact fields needed here, such as feat-id, which is also used as the bin
>> value.
> 
> Is that different to qcom_smem_get_feature_code()?

Thanks for review.
I am checking internally and will update with the exact difference from
feat-id. My understanding is that qcom_smem_get_feature_code() returns
the SMEM socinfo feature_code, while this code needs the QFPROM feat-id
field from the JTAG ID fuse word.

For this series, would prefer to keep the fuse-based path. The same
binding is also used by the generic i-temp fuse bit for Hamoa/future
targets, while the jtag-id/feat-id decoding remains only the
Kodiak/QCM6490-specific callback. Please let me know if you are fine 
with this approach.
> 
>> This jtag-id/feat-id decoding is Kodiak/QCM6490-specific, and the
>> thermal-bin mapping needs both values. Other/future targets are expected
>> to use only the generic i-temp fuse bit, like Hamoa.
> 
> So there are variants of kodiak that ""incorrectly"" set the feat_id?

No, Kodiak is not incorrectly setting it.

Kodiak/QCM6490 does not use the generic i-temp bit for this thermal
profile selection, it is using feat id only for high TJ profile. The 
i-temp path is for Hamoa/future targets where the thermal bin is exposed
as single bit.

> 
> Konrad

