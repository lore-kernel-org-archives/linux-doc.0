Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A391EB5B
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752858581; cv=none; b=oV4qWP1y0IricsZXdO4ei75IbhwwE29v80ui8R/ngHbVrwYzksyJRS7eVQQ3FZ1706mR4Qxc+AH8eLXEnmo8ywKv7hrd2C9pVbhU8Ql2W4pP+j16WTxWtUn4m+ot1mK/UucrZTTiz9pO60ZW7RXmZ5Om2DasPNAE+GINyYkgwP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752858581; c=relaxed/simple;
	bh=7jRgCSNtMJ+4XBY+7GdkIf+b0OTtc3sZXlxYI5FwFc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efZJ0r5h0GT7PtQo8ciIPd5i97dgi583qp4h3fl+4qYRH0szmHIh74Ibv4jFUBeJuFYN2F+G52G8eMPtLiDTUEfvT07FIKwQ/pnyTUMCf++UkHMuhdzj454NXAjNLCtX3X78emnGTB0X4srsXMUvTueb9Cbdf0XivWqKVjHp1dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhVQL7bg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhVQL7bg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG6Ylj032365
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=; b=BhVQL7bg08dH1Lyy
	sCNahyhXgLOooPUk6k8lhKr8X6uJk+1Pa2UywOtv1yU1ysnUtDgNZt4yqdpLZuE+
	K0tv2dxCzW6dvx8A4AAJj193IuREjeMHuDLlmtdnunNxuIVo2SkVCir+j0RyVX/M
	DYLgDAHww3n9z70tbq466VWkBPIVGCMhK+FGx8MfhiEBU9WEbLjFPgNtruQac7W4
	H0ncRaq33YzE0XB6rSNXGqFRZcmgcu5MhyjlXY0V7iyZJUiP7XPWZL0Oj9dh/qRa
	WzKiISQhUKpSQuddWBkeXHQ2hpidzoxFHYU6x5T5fvEiwFh+6mY2YvQkzlkNqfQh
	hbR8bA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug38chrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:09:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce66d7cso34302955ad.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 10:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858578; x=1753463378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=;
        b=UuLKx9n+jS0lSUtemoysAKKGky5Rq2ewVb4ccUm3Ykj3PpwuMn+mVlF1lhsencVE1W
         AYxc7fqnq56dzUYVucnoFZEi00QR8beQIS3JIAoraPGE1pKm7lop+IdOhRguGxNuXXw3
         fsR+GlT1239TNkh+UkC5vl3YRl0UFFS5JvRjm0Hk1QwYRLDT3d4ronT8lpcCdM7v2qgo
         za3bTsiWFzYrH1iaPI6cSOuhxMt0N+0veSf4d7S+Mgbnt5ObH036grD45rTxY5Yep5zQ
         hJ8RrttzIuYli9BER9iSNrzXcn+Y+2bwlWY/DUDBR5COYhweV+c1t7TJxLVki3KPYMb9
         SYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1dnwUR82g91T/MgoePYAnnmKd2YOz8wHC7jgLksJDBC0aZTP3ij4Qz42FXa5+Kb1rt7V6dzY9r4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgjEElMLdYn89qy2TjsBidoU0hVZEmoE7CV1yRloY8N1wWip+
	WZ5yr0PEdSOhfGJo9xR8oGZjpQ+NJeH5pwMG/RR2/JeWBv37RVIkY6UwnR08V/9N3TieVyHI2Yp
	mmACopCj2PiOSdMLhzlmTeu+1sEN7Cm0r5IcowRiI3P86dLaqRXHVcGaUpuJ/RFk=
X-Gm-Gg: ASbGnctQ/YYImaPdjzbfv/NEwobef/sXqMcIQwIjdmqc13pwOqZ6Ox7H94ODx6ViEAk
	slYoR3Sm9IzCRJTKs4PFd6JEq6FHWLp+pnvCaThYPgI3T/noxPMlAns4HupLo3ivra4a+l6sWnO
	8+jXJaSYFSF2C/ytIR1QB/wwi/8glkEnVyfptYBunLophQsBHMbn6PJ3kc7IKmYOjq6qoZtlC1f
	gOXE6tyt+iYQVSB5aD5l4FfKHG9HnJITyYvdNTvW7nTSyrduWIQ0qfJQlFt3YsgnL244XN4vfxP
	3xCREjzG06ULvSIwjgzX1x8IGtC+crmq/xVGPoYMxOcZzqha2wu5WONPm9DP2gFLViNbL9QuNIg
	FCkZS/TLELTd8Ag==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23e25693727mr159582665ad.4.1752858577936;
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETvEp5rZykda6Fkwq9ZXpRv9woHFJ3xh4GKGF4HzLDjXZN+/v8QGQrNtiX8DgvikLdgkWCIA==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23e25693727mr159582215ad.4.1752858577500;
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60ec88sm16079385ad.65.2025.07.18.10.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
Message-ID: <b7653a05-f747-4764-9c33-793346cae223@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:09:33 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] accel/rocket: Add registers header
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-1-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-1-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNSBTYWx0ZWRfX9UT4Z/0LQZed
 8L6jehRJ8dGxBvjpVAppPzkrXIQoks4r14tps/p4ztMVSfwJK/gteUMl8JZqjOdbq3G88L0wvws
 qeSPMnRCUrYMckY459oTRXjf11JEtkwv+Uke4ovl6yvn0S/FogUVZeWbE8ScwBnyJxwrWyFbDv/
 8/2b06kQXTmJuQ8GvWImNyhL5b5rRCXSmJy8xU/J2lEyML7wWQw4AQZ2TJO+N107ntl+X3ZLylj
 MoEM/b6WTUbSmnfKXWeejv3QjCaIVSiSRlaM8shu+P9zg0RZQaOXjmfCEycUfRyuR9A7BJ3jqfb
 rC2joEmBG723Nbji9toVe42bWffU5DeKqV+fpnb14ZI9R3F0hjuyquJw4iEVJXXdWTBA8kwaXi9
 i5Fa15IthC91vCjShQbkWSQPAIgIZ/1kCjPmmhGb15MJ4IAo5Vi2nJc/ZowXtNfuOesRzeMy
X-Proofpoint-GUID: DemJ_UVd5Jx8zWTSIXNrv_1s_4EmVSpY
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687a7fd3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=DISFzqtZAAAA:8
 a=EUspDBNiAAAA:8 a=4Ppn7do-3_l0xiadvqUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: DemJ_UVd5Jx8zWTSIXNrv_1s_4EmVSpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=876 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180135

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> A XML file was generated with the data from the TRM, and then this
> header was generated from it.
> 
> The canonical location for the XML file is the Mesa3D repository.
> 
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> 
> v8:
> - Remove full MIT license blob, to match other files with the same
>    licensing arrangement in the kernel
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Structure of the file and markings look sane. I'm not familiar with the 
hardware specifics, so the autogenerated content is a bit over my head, 
but I guess for something so large using automated generation should 
minimize errors.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
