Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816F340280
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887043; cv=none; b=PMDeZmcHF7AUgoVD68i2+T1oBJTmTR1rWrOeCmDadtLVVS5a2b34D7roDZcuhewpFaF2179aaXAAu9KPn8EMJKi0DQSugEGVLCTCPeYYtkHN7mpYF/YRTjWKVDjE7m0e0G95KSOCkNWoJVHgWWeS1QpPxEHDklYmgk4uu+mpAxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887043; c=relaxed/simple;
	bh=ESozs9CA7nx8WRP63rzwxXm2lTOPC3wduzBK1YIpQFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgBIpY03DgSd1p1j1fepLWm3B4boAwSdFE2ZyF2dLb5bTbPYkUbwy/+noKPVJqJTU0nOnz32uFe+uVit+JGCFvwbZjLqJGNqlZaWKzbKk5mUs7Vmp83fbXTSI9Q4e8f7Pi8GzCL/gBr6qobICSv+3N66L3+KHCthaMP/hBPNwsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/oPrwQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/se3+T+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/oPrwQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/se3+T+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRHuf1640561
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TLrQewx1LWqE8yixuzB68j48
	P2XGnr1QqREmwV+PFsM=; b=T/oPrwQFOqKER80CI6r0E2nLqTAVQ/gXyaoUHDvd
	DPxVH12jR7atAn68LTSq15qRt7dkY6jRAzq/rrxed5/Gcw1sK+TtmRO/vnj2AO1Y
	xoqaS0/yoNBwrHUjfwIrTqNFXrjhrkyFpWGWg7WYaNsb9T5fioDexRWDtIxzXTqF
	EZ+rppWzrS+K9kNb00k5qQqGnYw8f0BIaSnmaqcdx6cnjRdHQFf88BgtXJHpx9e3
	LXY678B3Ug6dvUpwDSxZ7fwyAzZJpjvHF1syPYrjQ9ObhDMF9+2eWlFBekhhgQOp
	5NwSYgb/iJW0wOQ82ywZrqWpbAC5ezx2HFMZA9+728XKTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8s2k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:50:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so5966497085a.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 14:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771887041; x=1772491841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TLrQewx1LWqE8yixuzB68j48P2XGnr1QqREmwV+PFsM=;
        b=D/se3+T+pG0/bWctDY2uG5rk7mjI4p4y3udvY3qdHhV/oK8YYjvLz2vxNW0IL2Xu3k
         t1LJYCKfwna7gYxOGwrgyEI2axQGBJsuAEYilCXXg2NXp76fOhZzx613TI763moKwzpT
         ulzbdtt5EY+DgfDfbok++8ISfnKeOMGobfJzOVCTR1AseOIqhwVSHIwzlDZmoQwoza0B
         I9KRSd9Orkf8XT6X9c6QAltPOXnTwSug5lbSqlKF2DamIotSZLpyHDc56haR7CegjzQx
         EXEa/sdbCp87Yd05xzjZdoIuTKFu4QRW4USCigFfLq7Fg9/S7+wY4KtQJD0L220imHLo
         57tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771887041; x=1772491841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLrQewx1LWqE8yixuzB68j48P2XGnr1QqREmwV+PFsM=;
        b=caYIY1ax07QQcq8PcK7ZLpApuo1MIAqd+kuNt84oC7phiXPF3i+lZjZ2VSp0zywWE6
         0tk4VzfNyQE/GKwlJ0wtUiPJrJKfaFb2l1V1Bx93xVo6znp5dkDTzLsRfirpCJ+rBq+2
         ii3zcAK0O77ecrohQj/nIAdknqAcFYXUTjCbZMmfD1pnyD4eijJKZZA3W58ExLeMKy5a
         746/lLf3OjlVAznB2vr4hwtlOotdM/bsAZT93p+BpjmfsC3q5ZQDcFH2ijbZnkoM+Uf8
         ogcuX5qV1aZb4t/XPP56inKd6SNbnrTahErW/YcHM9KohfHEDZhEEHSSm3g5Gf3pYqP7
         7A7A==
X-Forwarded-Encrypted: i=1; AJvYcCXMRTY76mlQGY9Ynxkt/7IHM5Mzg7Mr9dBuvxo7EMKWP/J2UylYJQMmJ8WV2qzmiHBetm4urIPQ/cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjQcB2zK0E/PQpo77Xz40wj4j0vHzS5BMav8igw0nGX9Laj5uK
	2kmOvwtV4Bv2YITmBhkXXI7TIRCx4KzxyS5eLReRxkrckcn9KNHo8CPWsgG2ImgPo/I6eYpg7Tp
	zJ7F75mrPvfqzljDulipKVq8KxoVFUHTAlAx9SwXCHqOh8dFSD4xtwWdZVfNwKJc=
X-Gm-Gg: AZuq6aJcyetqCcII8VuxnmIu5m7MhxrCo7gnJdqhGPDV61pL7Yub54jvIO82PutCaNf
	WGek5kSQObfyJbQzKIXgL/KkTE2ak/SrHBIgVScBStg0ZT+MQHGkhmGmjd2NH3o7XL0VKUN6em/
	Jgjovz/PdWFuF4sJXEmCsQ5Xr8Tmm0PkzFeDIpgf9SMh/ZJtsLxIKHwtR7ZOjK3p3CuomGsexah
	DbwkcR5D3L6sH2TxMj+s8qX0AFxcfyHlK9iaBWIcTsFgUP8SSK5mp9kWzg9OkFBHrVHPqusvSeu
	IgzRr8mqgsuOXHZ7tX2QQ0G/tAU7uBug+X5m6RSUa+rH/tp2soYvGaJykNFwBrQU4WvH0YztLjc
	1CXNcM7scf9qmuB46qr5F+1ZrO6RtlvMOh+swOsnF1zxKGNgBcTrPQjnPuEVGjCJiZOIt9wtU/Q
	hy3gCYrNVgzs6q7pNypJpeIfx8KUQUG+BgLDg=
X-Received: by 2002:a05:620a:4506:b0:8cb:df8:e86a with SMTP id af79cd13be357-8cb7bfc8d11mr1987075385a.28.1771887040682;
        Mon, 23 Feb 2026 14:50:40 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:8cb:df8:e86a with SMTP id af79cd13be357-8cb7bfc8d11mr1987071185a.28.1771887040143;
        Mon, 23 Feb 2026 14:50:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45a64sm1809193e87.67.2026.02.23.14.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:50:39 -0800 (PST)
Date: Tue, 24 Feb 2026 00:50:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
Message-ID: <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Rg7LuipjwgY263Vnl27lf14dJq4QJ2qp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5OSBTYWx0ZWRfX8l4YY2XP/vbi
 tNsQX/TAyv0HswjbJUGSsOSWZx5CHiivDNUmIg0SmDq8MxKOKadv8EO05TUEEfMmby+BYvscp/7
 MrQZyO9ev9yhHkxbN2gjeH5+Uk4iJRBc9/uRjPxyLD5ReT3YV5dTqZSaqh952HB9m4CkXulNsXo
 MAE3fbUp0jD1H2+SSA99Fqs0JEJXiqB1gz29tO1I3LFJDzNzezttiMf6MdaEtZt6O2TCPSIx17O
 ba+CjV+w5XBbLZ1qQVhUCfZWdKj1Zxgph++o3Eys0nB5b8fhmX/VJEFJp0k/sqrWlMbiGq1v1Nh
 YMA/ZW78hPZSp9y7R5irlgh5hTW9F7FHA63FuP7sFnq7afcNxXUhdaY7+7a5jSNz0GtzdIh/sV0
 fa9QKijYbeRfR7kk3L6iQWnFzzFXae/fVyGvU91sM2ffdoFLb5WRBwOg6o0mqF6GzcGijiZVv/5
 nqhZ81V+zoBSEWctWRw==
X-Proofpoint-GUID: Rg7LuipjwgY263Vnl27lf14dJq4QJ2qp
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699cd9c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6noqdOoYruC88qHUYLQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230199

On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
> Introduce a per-device memory manager for the QDA driver that tracks
> IOMMU-capable compute context-bank (CB) devices. Each CB device is
> represented by a qda_iommu_device and registered with a central
> qda_memory_manager instance owned by qda_dev.
> 
> The memory manager maintains an xarray of devices and assigns a
> unique ID to each CB. It also provides basic lifetime management

Sounds like IDR.

> and a workqueue for deferred device removal. qda_cb_setup_device()

What is deferred device removal? Why do you need it?

> now allocates a qda_iommu_device for each CB and registers it with
> the memory manager after DMA configuration succeeds.
> 
> qda_init_device() is extended to allocate and initialize the memory
> manager, while qda_deinit_device() will tear it down in later
> patches. This prepares the QDA driver for fine-grained memory and
> IOMMU domain management tied to individual CB devices.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  drivers/accel/qda/qda_cb.c             |  32 +++++++
>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
>  drivers/accel/qda/qda_drv.h            |   3 +
>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
>  6 files changed, 335 insertions(+)
> 

-- 
With best wishes
Dmitry
