Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2693436B079
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442779; cv=none; b=iaatQqf8EJ5y6HpJgiqdu750YoG0gjdko0eA9QmPOhqVjFNW8VXznx8bN8MQSnAlj0sbQts8NyEqPKrewX5IJNyF36yzZqE3UDikq0IDWgpfzQxtAIijTia/I5WPJ1eGm60tv0mXpmwlzFbhPbzxbvnZxnCVQAbe6X0FVFkwHio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442779; c=relaxed/simple;
	bh=upR9qprZzNZKObkJyZBXoQ2flW1n8CMNghZ1KRkdicA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fE6ag1ewYwpi6P1XTwjQAjD31WVIIxu0Lcn0JAU0likeglHvzARl/VPIiEBXTd7BB+QeeSr9iWqPxWKW+wovTZRsTJl82KBdrWGxAlyyBZv6yin7ZpeqQ0K5hyBWBv/WZUhE46+tgsG6Y+EnXQNLTVgyftXQDubtwlLHpoBjiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzf41Olr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHf8/NaK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzf41Olr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHf8/NaK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62281pIS2624089
	for <linux-doc@vger.kernel.org>; Mon, 2 Mar 2026 09:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=; b=fzf41OlrSKkpQ6wi
	cPQXO5M+H1/gKBOaYXUE9BMMfcSeGx6uEDuGZwsV6Lq/my7EBWG7XVuLcNdZVZOB
	tSNDpjP9FtPPM6iRJHZNHDS+OOflGy+z5cH3tFGhNqlwtxYdGJW5wbNWdZTgWQOk
	V1kdZnXxUtPv83ZpKQnB8FeCY9+wu6Mxz4I2dyAN6IX6diuuKNaFkAlazxJdsoaw
	gYzC3Kk1n4VHbhHDUmxRT4knmV/BOZd0Lbb80uMjPOqswfxyFGS+h51ftHuBN74E
	QHtVo1SnCm+zRdOYV2YUkcg2ExftgfTOXynvwoGd2evfkuzDo09ACqGAovNTqVLA
	fk8GnA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbatpj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 09:12:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598518beceso1232834a91.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442776; x=1773047576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=;
        b=CHf8/NaKFovT9gBAlTm/7OosaAD+pAzfCcd0C0WyU36RR6Uti4MKNwn6qPJ92AZWCh
         yHF5X+qPuYNfNGY2glA/0TWkZ37M9vU5T3fEil3CwLSF/iYZYSvo+ImRFaf6xZ/lAe9N
         J8S7V1xWbatndOE9o81v5hdIqWBEA+jSCMjO94X4GW4QReUJu4Z4ZSvCOPsGGK2TtG9+
         d8Zkkpi+bYSzI8C7TIKXR5U0UgijIg2+iSVerHrmM/rXUjH9k4Dq2nk+FuNmquvZxMPB
         Wx8sE17h1j1nR4HIAVMHLTv52oMfLvkH4frll31c90EypaNOjYpR3zWqRBGqnssSByNk
         zqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442776; x=1773047576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=;
        b=O3ATEpPhyWiLl3hWWd9M9ZlyWXo4S2+xl50J7CLSRvzHCearM3S5oWEeTWS2BAWxlC
         luMBCsGK9wzsXvNWICHUKenyQkd/YbWvyA7pz1Ib/NFSZMMarwrh27gnpnAKRkrQ8pIU
         WWjn+0k0VQ9j7FjheEe1FCKIN62K1T/kFg4K6n24JdNOu0acdmMZgmCMprzc299cS5EA
         +tvLzewu6ZMmatTgPZbrf5ysJUspDMktLzca+glNV/UxE2P1eYQkb1GcviFxyHJnfDcX
         qVvk8Qq/KRzzseuQQFVzM5CUb+bK3CV3q1MPdN/sJYNyscrSHXUSmokDXumFL0R+Mgp6
         mp3A==
X-Forwarded-Encrypted: i=1; AJvYcCUowtTQWkUIpUQw3oFzPx2nIv+Mo4nHfAKdY/jl7oUElFKb4GH++Boz8jr/+SCLyULa497EW64KzoM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4V/f5ZOpBEsooV7gU/RKTzy83RcGPVUOWSaHkbFc+sg+6CTJI
	VLNFlpgHOk/SxzGbiqd6lvs0eAwHcJXuw7UlWtAZAiWgdYBKFm0FjZEI0AVYnYmVDkWhrOulDaX
	SnGP4e89ztxDQ/7gA3HrYPqTctvtEDf2xfS4+0AcHau38rWxGvwVm87B4DhL9WrM=
X-Gm-Gg: ATEYQzxzCpVsbLS1fxew4aXj+7sPpJvJI1QjcC0ng0TFqJJd2u1wNvQ+hYFV/gaTK5Z
	3/faSpBUoT952vV86Y+qTGjGsQI4e99PEqtw2UJhKVje1D/fyotSvfW0JCocA/zLMIjBe5o9CEf
	3RvBD0W5+mnO2Z52qI6HkSibIbDZIWKZvGHqP/aNRW/lB7cbCdVybweavkye4Aa21WNygI+XXYb
	V7AxFxCN6Ek7W5dqp+6b0ThiZFA+IkQERQYYFvZRIoy237U0CxgXfI9/l6QBIru9cEg0kGWdF9W
	ZxzGVfzR4zGrNC2SwPBXVQ+mvyCE4H/sVVr+gwNUMERAKjd7J3lWTufsZSUrjUSOsQ3yHXm2jup
	NLXFYxRIF2x+zGZlDhpmd4XsUJ4CEQ4SZ58SznEFAnXcLwZvgjA==
X-Received: by 2002:a17:902:d58b:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2ae56551006mr12820395ad.21.1772442776074;
        Mon, 02 Mar 2026 01:12:56 -0800 (PST)
X-Received: by 2002:a17:902:d58b:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2ae56551006mr12820065ad.21.1772442775550;
        Mon, 02 Mar 2026 01:12:55 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b0691sm178825005ad.11.2026.03.02.01.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:12:54 -0800 (PST)
Message-ID: <4abcb402-8d57-4bd3-ab8f-3a96c11b3410@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 16/18] accel/qda: Add FastRPC-based DSP memory mapping
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
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
 <20260224-qda-firstpost-v1-16-fe46a9c1a046@oss.qualcomm.com>
 <fd7a2ac7-796a-4cdb-a55f-91e42f08109c@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <fd7a2ac7-796a-4cdb-a55f-91e42f08109c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfXzLhGnYyLs2cP
 It9nOQky2RuEcybddYmdCU07bVxn4nJawli10lskbGeVA4RjmwHAczITQ7j6rnnct7EBkPYakiv
 fFNiZIp6A1jpa6BBztQ1m2sE5uPy33wtCKcrfq4rcF24sUv0z0Y06WPEzqgmfxoYt9XotvCvI/q
 BmoahQiGis0A1pKO7lVXg9olWTYfDPdkINruXPAWHMcMq13hVtI6OL/cf3RvgeS5uKDDInfiwv1
 l0i5kzFNw9cvGBv6ANVL0ouCM/sAvl10Hy/IQ6k6lhIlltrxTIS9TqPmQrhpYI44Jn8iUSFY1VI
 cHcHqYiCpSSysKpsIy9ci6r1AyVCZkSEolbyy3HKzHj3JgBSplwAzM4l1ZxoHv5OxFiX4ZBHvzY
 Ik7BxwgS5dLkvA9BbkXGqO1rOVonzlxZGg2UIo2cAstXpXrMu8RsoH/Nkm2my0iXMfgbxE/fwwZ
 fsbDvx9yPCiGDetAgYA==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a55499 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=A3mkvOHymaTnmgbQ1zAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: SEHcrHG938uxZWSsiZuG9_UXLVgptPHr
X-Proofpoint-GUID: SEHcrHG938uxZWSsiZuG9_UXLVgptPHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020078



On 2/26/2026 4:18 PM, Krzysztof Kozlowski wrote:
> On 23/02/2026 20:09, Ekansh Gupta wrote:
>> Add a DRM_QDA_MAP ioctl and supporting FastRPC plumbing to map GEM
>> backed buffers into the DSP virtual address space. The new
>> qda_mem_map UAPI structure allows userspace to request legacy MMAP
>> style mappings or handle-based MEM_MAP mappings with attributes, and
>> encodes flags, offsets and optional virtual address hints that are
>> forwarded to the DSP.
>>
>> On the FastRPC side new method identifiers FASTRPC_RMID_INIT_MMAP
>> and FASTRPC_RMID_INIT_MEM_MAP are introduced together with message
>> structures for map requests and responses. The fastrpc_prepare_args
>> path is extended to build the appropriate request headers, serialize
>> the physical page information derived from a GEM object into a
>> fastrpc_phy_page array and pack the arguments into the shared message
>> buffer used by the existing invoke infrastructure.
>>
>> The qda_ioctl_mmap() handler dispatches mapping requests based on the
>> qda_mem_map request type, reusing the generic fastrpc_invoke()
>> machinery and the RPMsg transport to communicate with the DSP. This
>> provides the foundation for explicit buffer mapping into the DSP
>> address space for subsequent FastRPC calls, aligned with the
>> traditional FastRPC user space model.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig    |   2 +
> Not relevan there. Don't stuff other subsystem code into your patches.
> Especially without any reasons (your commit msg must explain WHY you are
> doing things).
Please ignore this, it's a mistake pulled from my local test branch. I'm not going to add any
defconfig changes as part of this patch series.

Thanks for pointing this out.
>
>>  drivers/accel/qda/qda_drv.c     |   1 +
>>  drivers/accel/qda/qda_fastrpc.c | 217 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h |  64 ++++++++++++
>>  drivers/accel/qda/qda_ioctl.c   |  24 +++++
>>  drivers/accel/qda/qda_ioctl.h   |  13 +++
>>  include/uapi/drm/qda_accel.h    |  44 +++++++-
>>  7 files changed, 364 insertions(+), 1 deletion(-)
>>
>
>
> Best regards,
> Krzysztof

