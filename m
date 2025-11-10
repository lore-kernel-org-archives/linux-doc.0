Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792B3242D60
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762811777; cv=none; b=PVkvFHqNf+g4gyGG7dD9ZmsXzSxuaZLo5Dc6ofZC7yOESXaUf8EzrpE2GObXZOgj4pxxpQfggtOR5Y+54OPRsSxzx/TmmHq1uWv3dEgNOalW5Vtis6L2R6362TYNTQ0VBRQj+uUckRDKPNJFFX7sQbqRCdg8q+ORFJVcwD3tw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762811777; c=relaxed/simple;
	bh=+gLMHZJ1MVCJEZNzctPQIZyLyMOD5NMDBOGpVXPW/bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0HMfrngwOZV2bbanDOgmpuB8d5Xlpbo2uPHqlYXoVBH4KR4YcYOVp7K5g2LSh1JnopGKV6RzIFTLBo0AR5L21hWnJnJEWekznOb+A6BSPp0k5P/VOFwsu//IfmhJTbjB8QLk/Ax2+KbO0v/nB/K2zMs4IPSDSYJmxsDSbNIzhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSyFxxxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hWjXIBTM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSyFxxxQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hWjXIBTM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFQ9oo4071541
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 21:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVzpJnOu8qlzWxb31lw2UdzGclobAcdGiMa8rZnaHHQ=; b=FSyFxxxQfo5UZvu+
	O7AxvEKICwnx1g/06XMJyfT8LqJLC7nDuBBmgBmd1K+aebpnihAAWy3wm37VVvcY
	2Y08fPZUA7OKLnkD5SjX9VZ60Y5Ip4Yhdvv5XXqpBgs10FmLgkzST6GgoUMUZLkC
	GDqNI9nCv6+7skSt7xA9MlZvdusz29Q/gxvHXJFs83107wUt/egJ1o0mHZJvTyhn
	jWp4nIiegh+yU1gGm5LMHOumIublRcA2dP7zvsXAYzJ3dKZoJ5EdgwUPujG0cvAy
	wv4Q+3PCfoFeoGJQsAxJcvI0Eao0zMh1epnC6FiEvI67LLbp1wpKVW6/nonunMeJ
	sOmOJw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgs4wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 21:56:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297b35951b7so59375965ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 13:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762811773; x=1763416573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HVzpJnOu8qlzWxb31lw2UdzGclobAcdGiMa8rZnaHHQ=;
        b=hWjXIBTMiHoaDUvTmwQdG3DYRXZJSfJLf4/4hBYPXPBFJeIKnRXaM7vT+4LaNEfoWT
         lagriod2aOSqXm6DJrF4HBiH8hTwZb0cTF274C3KKHs1NA5mo6U+ypuWOYhv/Uup153e
         515IIqxxdSz+MKs+nFu+DBU9LzOMK96DZBWfApfQrAItk/lC3swl4b5XaCxC53sTg5+F
         O7ix7AQjdEWOaYSDBwCD/JM2fLr168eiJTJZFpkmujYnjH8b4/PUQ+r1FE2AIXdPeQ+F
         k2CiTxnuCdG+/Gm+ujaOICCOilUrVlmuXamWoO6W8ZrLzTLvMtIyuu2BqUgP6YJDWak8
         v0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762811773; x=1763416573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVzpJnOu8qlzWxb31lw2UdzGclobAcdGiMa8rZnaHHQ=;
        b=q5v9+Dqnoh88JOSJt1Kx8UJ6nM4aFxbpJ6DflXo0RgkOxVhLbdLNIvG2i+/9biwiCo
         biVBmyYInKJknSdf3RVUvAM7Cv610le/G6MWt+CEHIga7FOTJGoxHjuAgSamJru7uxPj
         mFm9VmwUFSW3W6akB5JXk8s+feEzDr131w1EMkJp+JbBTRTz4KnFaK0n+kdPtUfBu++e
         CnM22y2e7xRMIF3pdmZteLLQMu5l8wN2db8Ha92vMVmowdgdsTdpT7uum9RLBtbXLv4y
         ONTLGqOosCny2C/l4VHE3vDAwUqUfTJh/9oucV0VDmqnbcwWH67L0pYuf31mxQfMFtgq
         Fi7w==
X-Forwarded-Encrypted: i=1; AJvYcCXrw06K0N9Sw1T5qkfa/V1EYuREUaGGTqIvOEPILpI5BWTzj7FlSprUsx6OIXsI+XCXyGQ5oM0xcgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDHc1vx76md/J+lKQFepLiC7rOupfkX0JXSI2wTsGLPeflYEl
	h0gpcaeT+8hRYqPVuSI2tLzjbRf1lWCiUylR/JpVy5Pdcbgkok6hdvw0uyodSLQdbS6mjhtvNG4
	qF3JLB7RIZgE9n/4RaFkpfRkhmPTnsczAgjQn8c819IVVuFN0MTLpR0YNrj1L9VE=
X-Gm-Gg: ASbGncvh1FkLqhschJXQNKHXK21OvcvGQXpgUiAlfvFxJBU54COo3vUpHaqO7fyo2TN
	lp8bVdu8BI5ec94/bkmeb8MAx6JU7s8Sr/L1zSed5ekTbWdDg2kxOwpSMm9VNvqli8rqY6mIK7A
	efV5++PX33jk2O0lADnVl+uNDT2EF32G2BhGJoZTtWytdQYc/kuhpNsqDHFGM001Sb98GOvcGxz
	tewhly4Ts/MZ/xr84ZmPf2zS4R8ETdQI6Ml7eCWlgoD2LNTM3vyaQdM+DbYlwzwnN9EfncUzJz0
	9TWHUAviuwGR1FEIiPxlUXzJiyjg4afAURRYxspUTnC/qNdpeVwKWgBJ2WvHEAC3jA/dnnSVRhu
	tcpj6NvEB1AJvFuAQ0owk8kXb36cbZT/NrU+zttiVdTQOI3XmKjoi
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id d9443c01a7336-297e540dbf8mr119018675ad.6.1762811773290;
        Mon, 10 Nov 2025 13:56:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJz1FxgkaYCgwsCACY9rd9PpdJD5YgwnReoVj/md8159Dmv3H/XV3LqN2vti//V++K3E5rsA==
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id d9443c01a7336-297e540dbf8mr119018315ad.6.1762811772804;
        Mon, 10 Nov 2025 13:56:12 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc866319sm12832672b3a.54.2025.11.10.13.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 13:56:12 -0800 (PST)
Message-ID: <e6c4eaf8-1484-41ab-a37b-047ef2484e30@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 14:56:10 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] accel/qaic documentation fixes
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE4NiBTYWx0ZWRfX2XikSkeYzysh
 fDAhrhrY3VK3/+YVZE/uzrmuTVuvE/zp5zUzFIRkeBdF7H6C+Lx8z/yFfgcc5gdQfo1Too7dShx
 KzniSbSnDOX5oxYcG18ia+DcBaYrSVul1BuUhYW1zrgDG/cmQCZBdFkhIPgAhRmMaPvdrqsq8N7
 QElw+rMvV25WQKokPdD4qDB8ReIdOB49o5AVbf9u3by0FaIVuNylLW7Q8EiKF/OJ2jjzi38AGuq
 CVIQe1nPnxFaqDaDZpi8FbB/Q6LVDjj8Lieo7JOiS1U6z1ujF1KbvHJRv/qkuEbMLya/vIcBndm
 R6W7tkefa9t1LIno5rNU9F2ej8AVD/UkKW/2Ghf50iYmTHNhoQ58gIgBxSRCa868gARdlwnk059
 Jd/Qvcwqku7rsMae2/rVYAqgzUHFnA==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=69125f7e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=wQdz1tM6fslYZEmrDPIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=MP9ZtiD8KjrkvI0BhSjB:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: WLBB0G_k3N8NXnTjG-hZGyoViIGRqNNt
X-Proofpoint-ORIG-GUID: WLBB0G_k3N8NXnTjG-hZGyoViIGRqNNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100186

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Hi,
> 
> Here are two documentation (indentation) fixes for accel/qaic as reported in
> linux-next ([1], [2]).
> 
> Enjoy!
> 
> [1]: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> [2]: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> 
> Bagas Sanjaya (2):
>    accel/qaic: Separate DBC_STATE_* definition list
>    accel/qaic: Format DBC states table in sysfs ABI documentation
> 
>   Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
>   Documentation/accel/qaic/aic100.rst        |  1 +
>   2 files changed, 11 insertions(+), 7 deletions(-)
> 
> 
> base-commit: a2b0c33e9423cd06133304e2f81c713849059b10

Pushed to drm-misc-next.

-Jeff
