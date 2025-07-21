Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AB72E0409
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113150; cv=none; b=HORI7rEb412YWIRYf5OWXxwpQqvc0rnLtR4wVuBDoIMdTXbhDh8coQc8cgpGAQ+paow40/zU6ZuS9UW8+FM1UIarR/vXm75zdIZVm+I4Ou1at5aQqDXkfPv6HLUtHUbOl/12QpU5JMKsLRJ9RIZE6LgfR832oTMNidmalklpXAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113150; c=relaxed/simple;
	bh=leVOEdV367Mi9TWGngaof+vtaEnm91vrpv2xXkFmOo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXYzie1jIthbCTiA+v6iDvQKPgMxvZ7BxnoY7dctFr1UjaQ0pYCwWhvHRK9Y4lYe3m0+W3eC+wgjOlrH0P98fJ0lyV4cp66zMaqTK6yiIlE0uYCe+rM3mzIDoPs8uzxlDPk6ugw+i/6oSrlzSLZLZRpj9AdrhgjOeyAyVP3erMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMR0HOfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMR0HOfN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LA8OZ4015833
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 15:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=; b=UMR0HOfNvnMdl+Uc
	aUIUBqSvnw1RGmMDEBnY1JMRFTTxP2Z9qQLJyzDWK4t5Kh5ui6nVH9DZ9+SpWFQy
	r/S6xJKg1zJX7bCyCDTK68JxtdLP5pDkuNlvassiqkz5i5Nt/8Yc0dv1uFajWqjQ
	A5BPK6oCteGYiU0ELJO+agf/aE7m+aOB8xUnfDwZtpujON3yWq1Q+NeLtIS6uqwj
	7h0o2bzvXjRqlxMI3pNeEq9zFbI88TD0eAAfuAaKlZ5czEO7YvlIC182a/mdDfo1
	8+FNROe3LNH4TYC6m4vakJgFruUpowdEe/tghuEB8pSuz8IvFtywIuaKQvjsBUFS
	RUxaPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451dwvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 15:52:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235c897d378so41673065ad.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 08:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113146; x=1753717946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=;
        b=OmWONmk/4hXxCLbWcl8HYZbW6bBq4yXTfFqcoRAYPaQg9zvtUHA1/8ZinhSWjntxoV
         VXTic1G9yJuk3bynggqmoYa7+NSdeGVdWXwF/Xt4yhSPT6ikqRECB3XuVAjrYET9ZM71
         a/CQw2HROJIQ1bbn5XncIQCOI/915xpriLfz/aN2l60XLrbU71q7eu+/rbBb85RZkVZQ
         Oz53fMnn6UQXtm/28FTanpKx96OnT+5XS3jYyDY7z0IV9/9jzdU34vpx/1/h4om+01Rm
         SieESOKH184BpbivwhpyU0LmeDhonT2pbqqcl+FhF5uSUvsPzAjxKAyXevuO4+nVzpWD
         dOkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX07EwpqgkQ66EsK/QS4ojZBvgQLZV2c1CFPad9/yY0jGHF0XhLy2zygh9NzTgAV0bfRJWzM3B6XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfogCVw2OxpO+JdchwzvrjTmEQDux9B6sg2FxCojJAt++1vIsG
	egDKMdstGwO9rUCyY/tphLwZQAHDUC95zYJlMITh/hJdsQqJehcTvDSNLpAwqkf8mhB85UiCOVm
	LPFdTaGuQgPlnjpt5vftDLrQJz4VuMBob2+1KvIWlLOQokynI0QZNJc4b0CE+b+c=
X-Gm-Gg: ASbGncuVnVzMh3YALQhmkH2Yx+iOHq735zG7lpakf2XBjy9YTwCrOII2925fPI/VfxK
	1WsyS0Pn3+rLTYiSEh6H9iNZlEggZ6npUinMb91Q7fuKeJbOaSsj8GJ/hgnqVDOsimEDs5zNdqp
	4hFsQ+jy351n+yhj0BjhXI+nkdjd08A+0LcsDKGr1UFqleRydq5j5DhkjdGu1ZXojoNV+K2SBgF
	uxCaiWFiPycYiBDeUQuc67FXJPGwoYsRAO1OG5QXPKtYjpnDAwTlrmw/KtfkWYfjmvNhMwUu9vn
	+4RAVPfek4lvPtvcuvxeUTHvI3ZkB9HPRRfQI/fh9cGVuo/LeZ+fCGRQcfhX/UeVnXxonbWs3wJ
	klR2OTnpmbzxkUQ==
X-Received: by 2002:a17:903:11c5:b0:23e:1b99:2a71 with SMTP id d9443c01a7336-23e24f59902mr290415565ad.39.1753113145677;
        Mon, 21 Jul 2025 08:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPCwCxq1QkhMyEoe34Z12143edz1TUZnWOSk/9IkmrEyBMoiqaPExRfBVgfEPrzhXVmpdjcQ==
X-Received: by 2002:a17:903:11c5:b0:23e:1b99:2a71 with SMTP id d9443c01a7336-23e24f59902mr290415145ad.39.1753113145178;
        Mon, 21 Jul 2025 08:52:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d2a8dsm60084815ad.165.2025.07.21.08.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:52:24 -0700 (PDT)
Message-ID: <7649e4ff-c712-4db4-8777-f96bc4de97c4@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 09:52:20 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
 <4109088.mvXUDI8C0e@diego>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <4109088.mvXUDI8C0e@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e623b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=eRn_eXbfG_JMZ2bVrUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: i_M1TJsOt4duMlqU-JiQ0Nr6ooI2bMdZ
X-Proofpoint-GUID: i_M1TJsOt4duMlqU-JiQ0Nr6ooI2bMdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0MSBTYWx0ZWRfX4MrqTxkiG1yA
 Cz3DTalrlGoYvqsDZVGYKdQG+YbmPCVVrUSYQaRBUB6TWWJloGa28nKMCaYBP4pBrooWrOzseIN
 4+0yPYVfTDGff7LkE4vF28sOgSjEJTHxPjS3Dnt6NpTXON9alFRj5YquZiy8VbM3f9wPxsRm/ws
 wX6ejz6IHbSPC4fQ9fkQ/x5Hvst435uro1X49AxDFx+Ozjbrd1qq3Vvkkq32CnZks0GnD9hsn6O
 yHnWpcVqCME6mkyonDIJKejz5YqVr3LK9nDiKFS1iYEZFk2I09Iyye2IVn6+hMMBb8x0GTP1sYC
 qHxXEN4P76uf8UZixHeicJrsHXlIaa3WaFdLhg54LNxgxDEUE/mntQUSkxIwFUcDpVtiR1NTDAh
 pAHNYvHysDKXFtfDiyphfLiqqTiT/AkRhrGr5mIZsn+eRDGKJ5MjzkQ8Q1Eth9TrFpxvaEJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210141

On 7/21/2025 9:24 AM, Heiko Stübner wrote:
> Hi Jeff,
> 
> Am Montag, 21. Juli 2025, 16:55:01 Mitteleuropäische Sommerzeit schrieb Jeff Hugo:
>> On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
>>> This series adds a new driver for the NPU that Rockchip includes in its
>>> newer SoCs, developed by them on the NVDLA base.
>>>
>>> In its current form, it supports the specific NPU in the RK3588 SoC.
>>>
>>> The userspace driver is part of Mesa and an initial draft can be found at:
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>>
>> This (and the userspace component) appear ready for merge from what I
>> can tell. Tomeu is still working on his drm-misc access so I've offered
>> to merge on his behalf. Planning on waiting until Friday for any final
>> feedback to come in before doing so.
> 
> sounds great.
> 
> Just to make sure, you're planning to merge patches 1-6 (driver + binding)
> into drm-misc and I'll pick up the "arm64: dts: " patches 7-10 afterwards?

That works for me. I'll plan on merging 1-6 and leaving 7-10 for you.

-Jeff
