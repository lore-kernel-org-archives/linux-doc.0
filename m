Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC633009D8
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121648; cv=none; b=itTJHL6iUBXrrj0BTYapnFVJTmL9FquM8/LY+LRt6qcIQZnLTGEME4rcon9myAF2cIYxLrZ6jTQGYWAMvGflm6iK60axUxjYM5H8Pommo+5WIBMxselo+8o4RCSo4sYWjzUs+/xjA7Ld59SxamcwnjrOEcBgRN5sySxRvDKLX58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121648; c=relaxed/simple;
	bh=3WEil0ehY5vXWc5kCGbGh1iNwldSAw0zKkcaT1ugWPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHH5fFQ4mvSIPVln80jzegkUOveWqRDB4uhGN5MaN68F0v3hLBurJP1VbpFdo1Bwq6p0Ry0HYZiqdLbqSJYHAhqU78+Zo5vGi6aczVYL/T5Sxbrh3eMx+9mJcpYhQ/NnwGDL0rtNk3i/QM7hq2PWa0x++qI9rxIDdDu3cxUVzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCJShcCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCJShcCJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLosl027282
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PoxP7tG7pCID580yMt9K2LXcQBndbjiv/lE6hcV18C4=; b=LCJShcCJqrQ7J/v4
	GUKejkcaQxV4s9YPZgV8B6+bo/RivOwQyJyJEdjsoQF0qnCkgT7sy1D6zqHnV1vO
	s48+BESFy59JftqMeDl8n2SDCymjYh5aSnCrr1TbCWVG7Kb8IsVjxSZcByDlSHAN
	8IrmNbu000mwJy7GjCPp4kET5WaJXICZmjJntGnTE0eEMzog/jpTZ5T/46QLADsE
	i+pm0N50cbRTQcgWZjzDqVKjtbuQQq4wnqRI9wswOhQOehQ0zOZXm+n7HzJlHfhZ
	1MBWBsL0LP9EGj1Y6HMPq1rsJoFE8RUKzy8jCWnsHUV/YTgwCMYi2dS0hOqO/jCB
	TFDVQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjs6bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:47:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581953b8so2458065ad.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121644; x=1755726444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PoxP7tG7pCID580yMt9K2LXcQBndbjiv/lE6hcV18C4=;
        b=JjumSpRdbF6GrzHqutgXtlqnbOa02wiGiuhpz51Qgb5Z43tDuvNvmsI2NFxvDCjIyV
         2nWTpBBfThb6h3usY5rL/lHYCpCyX3n3x914hodek9oAsCMRWDUNDVHwCI/09vdwVkZB
         BaOW2cm6UEaudK58hK5kP/DQGNhs6avGR7r4fpwR4IbdTNbk6vOtc/rFY1Yw0Tt/zgR5
         wVDmgmu1L2F23sfxGzUIlolq0ASiUkhJLLPl7xLoyGPcxB5JSddcKGuaaBoV7a69PvRM
         FoS/BpzKoWBkgeC4BzeHQIqvlLQb9Kf0UJiczuIBV+lQYy5GSRzcYbJzzk0MLHriny3t
         Oc+w==
X-Forwarded-Encrypted: i=1; AJvYcCW+KLy0EbvV7IeAo3j6/VG9E4vSBsGIpI4yfrm/07sVR/n+KlQVCyVNdN34QRmGc8QyzFAteE2qlsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgI9Q1qh6tu5pqXXOCCrVXJYdaa9RdC8Gl6ydA3C+TxWoKhJRN
	oxXqY/rpOYBcx+bFNnKKEeTYsHwqgb/krsfWy57P2qcdxy04BBCQUM+VdAjcj1p4Uf3qHX6WXPZ
	+M0+cFrCoQvEITU02H9ew7iR07IyS9luJS1nUWexI+Xy7O8iD2mrTKCnW3LJ37w==
X-Gm-Gg: ASbGnct7mYckmizchJPTsrnNAQfr/ynz7l7RRt9XWlUdBZyQ9HVrBdGcfFwd86PQNvh
	xFxD5fVJsqmYyNtRrlhFuvjISbnmHKbWZ2jYmUIreSxUQmtivnEBwnLCDAhHfcR7TSKHM/s+x0y
	jV+RrOF8lYOnWzOOQIi9peE252xhWUB3utlh1hPBbupMkS6yyrmN21bFvYeOnoijxaw05/20JmW
	sHkTsHtqCvL2KN95XDYBZmNJoBv+6Rmza2G4F2dYcJcQa6hvUfG3e4baK2+F/DzH3Ef3BkXwpc+
	Ir0U/5xCTKOPswWcP7mLdAWgYy1eysT1GttnkATv3zH0I4wkE5XihEfsfTbHKJkooaWujBZC7QV
	FtMx1ynL1fYU2lKfRQA9Z/CtUj5mEl8qFZhlIRQ==
X-Received: by 2002:a17:902:d482:b0:242:9bc4:f1c8 with SMTP id d9443c01a7336-244586e1b69mr7940495ad.55.1755121644275;
        Wed, 13 Aug 2025 14:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgjyhLi16jIYpZ8EHZqnYQaA0dKD8mdlmwaED7WOs0d7tmfiyJiuh/7q2M1HKFCS2ese9Jpw==
X-Received: by 2002:a17:902:d482:b0:242:9bc4:f1c8 with SMTP id d9443c01a7336-244586e1b69mr7940215ad.55.1755121643848;
        Wed, 13 Aug 2025 14:47:23 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323257aa89esm1010760a91.23.2025.08.13.14.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:47:23 -0700 (PDT)
Message-ID: <0af9ac59-9b91-4a0b-92fb-b44e0e008431@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:47:14 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
 <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX+FBGIJ51oHlj
 n/wbyzupa8sWhq98xTRjUSGOsMlmOT6M/cpIxDOxzdKlGC2SUHNKQUgyHU05c6OMzL2D5misjNo
 dItryz5OH8LH33OPgu4WqAu0czBbScCl74kSZUG0OJ5W1vbiMUHjpOwqmFY7vEcuMRvw9nd8pTs
 vyzn12obmgJBcvMEnDROWRaOH0d/QjuOKDNiEUgZwO+7zhmxlmMYE3KZre+IY9sCrZE9Cn6s3nj
 i+u+fIxv6hwm7wTs4sS/yHJB2n9LBHa2mGE6F9dGQhHAd/wXx8T9N684QGGQQVxz+9oIP+0W8ng
 HqVtBfQCuzsXe3da7tYPgAVZwmofciKaYgciUSi41A4D1qK/dLuNBaObIYyphnV7s2N3tkyBZ9I
 lo6Uw69G
X-Proofpoint-GUID: pPA6CM8WYtWYysbRIssOhNrz7JES_e12
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689d07ed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dTt1GwfqUVNo7j6m3doA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pPA6CM8WYtWYysbRIssOhNrz7JES_e12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074



On 8/13/2025 8:06 PM, Konrad Dybcio wrote:
> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>> Anyone with access to contiguous physical memory should be able to
>> share memory with QTEE using shm_bridge.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
> 
> Hm, I thought the idea for the tzmem allocator was to abstract
> these operations to prevent users from shooting themselves in
> the foot, and this seems to be circumventing that..
> 

Yes and no. The TEE subsystem has its own memory management code, and
the qcomtee backed driver will utilize it. In other words, qcomtee will
manage its own memory, and tzmem will only be used for drivers that
communicate with QTEE without involving the TEE subsystem.

This aligns with future extensions for FFA memory sharing.

Regards,
Amir

> Konrad

