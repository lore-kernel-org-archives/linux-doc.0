Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8B035C6B3
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787029838; cv=none; b=mFbmX/2J6klpDmoandU0Mqp27w8wIxwvX4WrQ3FzR/9uRUa0g7PK4vhMNhAkTDjln32/dKYtL7tMH2/QXHrlEAfEK0PEUW9yNT3b0+rjfdJ4nx5z/NYt+hpnVI3Vf3y9veBC4N7ULA0VXRH+1+gcT41Ej2r0R5bva5PmcGEEPpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787029838; c=relaxed/simple;
	bh=FeAbcPh2BNksaU1ol+KzsK0r4wOWdTJppcdaT2TRPqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJQFSqOyGtt9Qn8Nyf9KhesXnvuWVp5NGNSnrnuGddUJEgeatHkMxaiE48qcCTbXo/Qdg9DVfSrvWxqID7F1cdXlnOChLKN83v84NoOlXfEO7qoiyDFGRaiGB5FGSfokIwn9uf5SsuGAWXN5Zz0ewNYgoIiNqWDQyrGGqjfcSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeBhHxQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWr7poZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeBhHxQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWr7poZJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3iZhu1172002
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=; b=KeBhHxQZWxpTR36D
	Psjvj/wq85jpkNoelRCr7GA7IQCCNbmQzbbatB7HF/+kMmEmIX47iSfKo78TrcSi
	zRz5ZSG449nqvSpSoNWzt68dQQgrrECiYvvocNwe0bQUC3g/OuRn/tEfNoxb24oC
	O9wbXTcyPL56yRHFNej8KVXdeaEMBbZEEIPNDfRrpfJcoG68OgijLhbpI6ejiKy9
	0/VB2vb/qCwEl8lPPqalgpvM78u5K5Sp+CNMHTxsKImtrqVSh44YqH9H+pABffO5
	hr6Tf/yxspMv8oPqYzuJdIWNp2SdtEDSQsiwbvkCPxvoGVfB+nOTF1tlZ9n7YP78
	D4B/iQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmrax8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:10:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e048a801dso5684740b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 22:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787029836; x=1787634636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=;
        b=LWr7poZJYk7Q0HTF5LwrWCT9KE4JuohiFX3PV+0O4QlVUd0fXDrxhbK9qUC7HsnJaf
         rNQ6/FfjGdng7iKIft9KFK12ZpAfHG7VeogePVdd5k2jeX8bY6RWpUdWocaW1rQ5NOhx
         99iAa6i0hHaiEY+krpniHI5EFQHpVETeZX5FI8xDeS2/vfddChZO67qTSCzgc8f5KOHD
         8rM662Fuh8v7cHO/p7py8HFJO3etIDGjYUYDEzc5M9Qtkj2opIZNy3EowEryaU1E8uZK
         7shtfAzhDB7RIFDlCqeFv1btfd4hM/u7fqWUlpYBQZxj7xPFIdJabOO0Y+5pWIN6rQRG
         ZvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029836; x=1787634636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=;
        b=s1Drh7QwFQueDtyjvUHN3JLkvuiuCGz8LLntexzH6L3FF4Rx2MloWa1ZnWaWC2hjrf
         4m3xKFOEYgibk1FGBOzmjdYfLBHQJVT2keYdi3FV0FU1nWRFHoGzen5jaVOD75FtBcYt
         lFW8r8l1an7Szv4dBZ2MxXfCpLu4DREoROjUz8oR8e0UF1r2dNnN/+/kT+tqLf+h+JDa
         GvxvDL8FS5e4q4LECBeNuFk/JpiypsawKEQpkSgM1Rz9iqvrEizvBMrCJsk8YcXJlDpL
         MxxWnFkTCrDy99usUqsdrOgqAKq0KmVwFscfDI6YJOlgcnjWpHwLD7plw3l9m9+5lGvC
         Vfvg==
X-Forwarded-Encrypted: i=1; AHgh+RqjQ5gsXCHbMQuOMQPJORyC4FK+O1Jq/k8acgAmhvwEIX3TGdCZzPt1r27kV5uSLJa/xnduOBcqu/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPAefLMv5sGhcZLgOk/IaAM6UTAQEDeNjAQfpO6bo/NIDUY2q
	SdNdjweeDVv+qMudfL8Jo01s41QWrJmVdpQR7Tc0fo+47OJ/xRDGPJTcJ/auMAQR9rn3kfBar8X
	K/7gjIN4wbrWILYhNj5CiiVugAnfAKE0WEc1/v3O7cYuXGl4QbN0lzEL69zgLpuk=
X-Gm-Gg: AR+sD13fMfVhvZoURwjDPrOOIyUBFFRddS9P5dMp/rLaSMc1AQgf3B0yfLSC+vN1XO6
	jJ84IShaS3Lzv5YZbi8IwMzibVXLJy3gDYgDNfrnPL7ylq0KH9LsQjK/cXV3P0RMg4FZSQy8+Q2
	z7kyT1oMa674GKDqiVErJpwRH3uBmkOrVRHJxL2V9r6THLeU7mItfiiYI6uBU6fEjqWVBHoJc4K
	ZtxtFVESMOLvv7BrMyK0+QydvlMpfCGIKJflSudGMlkZJqAFrFIkJzLg1F+HJuR10lb5MrE0NAN
	YsIydZXRICz1yO0uSNANoKHqWyZu9l9/wjJbje9Ihg2Lq0qWl5Nh161nS8WlKepAQ29yYp3zT4X
	9ohvShCl1xgdSUlCpM+S5pfkWk65R+w==
X-Received: by 2002:a05:6a00:188b:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fddfe099cmr29499654b3a.13.1787029836084;
        Mon, 17 Aug 2026 22:10:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:188b:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fddfe099cmr29499576b3a.13.1787029835654;
        Mon, 17 Aug 2026 22:10:35 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6ff2232sm1015652b3a.52.2026.08.17.22.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:10:35 -0700 (PDT)
Message-ID: <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:40:25 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
 <20260817134416.GA1415075@ziepe.ca>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260817134416.GA1415075@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfX+1PmygGGTYpC
 Doigeh9u7+QnwZ1+l9kBf5B7/jF6817wT5rt19Z0vXpiKbEcQBkrh0QNWKXqZ8wSHfoHk6z9h0z
 ktnAbIyi6l1RoiJ07fuDqNVoRR0qBj3biIwScFqy1OZjr98nBZ+wujVEyM6b4mCLe2AshHzaTgt
 zMR+Qq9tEztVZnm0WozLCQEw8AGLKaK8pGBuSMh/jgDjZkXerJ69ffP76pKgnKPMuLHQUQCRp53
 hKnKUNzEDMR+pXlkjLeI/Ga/Hc27ZIxMyn4rNnAKffCVkbl1WAxYHXTRr55/4BwIFzAFaSxSgPi
 Uy8/rCX3aGjKcIE7tecVfk6mrX4ff0C5AyMllTe1aLArYfIfoCrkNooqmzNFVPpUkp0JCocgBUb
 d5ert/vyuAPXuKG7jXca0/fuzfR06prySGPRDRFj0+DEMnrU5k+XDJwSMrdzrmlyFX/28/5DvW1
 4/EWXwJl3SrSTc3HkuA==
X-Proofpoint-GUID: W7l_3WDOkmIQQ70GKBnoLYCrvrwJ9LHU
X-Proofpoint-ORIG-GUID: W7l_3WDOkmIQQ70GKBnoLYCrvrwJ9LHU
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a83e94c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=UlZBYPnkdO8YS_jrOJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfX4mSGcRG4l65I
 u7gEHbD23UDocAH3YAi0t89qNBmqI6fek0fQ7OJyCzkrfXtkrAtCwcP90LwMizRZpcHB+kCtnry
 yrLPEV4X0VjpCBh7W70oA4RvZsziM5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180036

On 17-08-2026 19:14, Jason Gunthorpe wrote:
> On Mon, Aug 17, 2026 at 10:17:40AM +0530, Ekansh Gupta wrote:
>> Register the QDA compute context bank bus (qda-compute-cb) with the
>> IOMMU subsystem by adding it to the iommu_buses[] array.
>>
>> The QDA driver creates synthetic devices on this bus to represent
>> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
>> so that the DSP memory manager can enforce per-session address space
>> isolation. Without this registration, the IOMMU subsystem does not
>> probe CB devices for IOMMU groups and of_dma_configure() in the bus
>> dma_configure callback has no IOMMU domain to attach to.
> 
> I didn't notice a clear explanation of the proposed DT schema for this
The context banks are described in DT as child nodes of the fastrpc
RPMsg endpoint with compatible "qcom,fastrpc-compute-cb" and a `reg`
property for the stream ID, this is the existing binding in
Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml. QDA reuses
this schema unchanged.
> 
> But it looks awfully similar to the other driver that was creating a
> kernel synthetic bus for actual real HW, that wasn't well liked.
> 
> What is this for? Why can't you have a normal DT binding for the
> iommu with normal devices?
The CB child nodes are not separate addressable hardware — they are SMMU
stream-ID assignments described as sub-resources of the parent DSP
interface. Using platform devices for them was explicitly rejected by
Greg KH [1] and subsequently using a generic shared bus in drivers/base/
was also rejected [2]. Greg's conclusion was that each driver needing
this pattern should have its own custom bus type.

That is exactly what QDA does: the qda-compute-cb bus is a per-driver
bus type with a dma_configure callback, following the same pattern as
the existing host1x_context_device_bus_type that has been in the
iommu_buses[] array since 2021. The bus creates devices synchronously in
probe, calls of_dma_configure() via its bus callback so the IOMMU
subsystem probes them normally, and tears them down on remove.

[1] https://lore.kernel.org/all/2025062434-reviving-grumble-1e53@gregkh/
[2] https://lore.kernel.org/all/2026042442-luxurious-antonym-f20c@gregkh/

//Ekansh>
> Jason

