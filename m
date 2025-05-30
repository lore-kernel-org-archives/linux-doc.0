Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E37080C
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622834; cv=none; b=P4zLJVAmLdS6VDrmfYI1yYfmONQ0sLFsMioSxgA3KIqtZmTFjFabYxFhWvf4fF7xs7LRvlWVASIiWbo5UrVscDFj9jum9sSyoNDN3LbQH42Gk/KvNj0jIPCDIEr7LdXHuk+KtQdf66mUZVZHZejAw89ExWEPb3uNNPaT3Pm9B0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622834; c=relaxed/simple;
	bh=/bLJrvclZOkbWx6KYa3dHosgr8pdwwAJZTB1U1woF5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYwEpZvTaHKBwVlogayz43m0rTwW5VNRb21+W7MAqxlaHNyh4E7fKZzbsBwmFuRtWLRV1bkuAJoC0fuGh5oQekaYPdeA7ihPvAQztMcyLVVsT3n/MpXND6vfzSWj6yCjrB74eyqOmrBCtlIsnjfnzQZ1I4tswgl58Wd6Gr+7/kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcweAjVD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcweAjVD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBnWKr016093
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=; b=dcweAjVDE/LjqPwp
	oTZoLRzOpQtI1JYDCMartltY2c5NB7YMlo/dTDRPndvS7pd9PPQfhgSBch3PEh4H
	oc5W8IPBmxXc8y9f0eJegWB4pykMBiCEZN8j+v7aGdrixd7VyGS2/kjhy0zo0QqA
	XUgfiq0u1OrBVtwV/38j7YZVZ/qTbTyZsx+lQ9ewM1baMS0WsetNFx0znDmQ5qfz
	BRdtzazkc4/gCaP/Gb9+EA695ygVe/1eKNTHi32s/wCYmY4odDJHX8u9qVCsOZJk
	9jXkDDFD0qe9Gq1ZUFCJmTcOm/GSbItFs5zFtondN5eTlNacUbBVYKOzoLNvsXQH
	LTVIag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4yruw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:33:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742aa6581caso1792855b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 09:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622822; x=1749227622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=;
        b=pXPMEVTcCB3meAJ9OJV6Ykuo33aAlNdr7vVR2mfJcDczEh9nvTdmCQVbjbzuc4/i5/
         8YEdT4TlLpHHDoxE/Z/9D2vZ1bCKUIr6rPV8myc9xOlclQ0kWB+lTIQlzRpC1auSBKg4
         y4WzahC/CSWPOCrdRBkNIw9a1Qx0eutQ/P3U42k0OQPulZD+MkjMD6lxHb1VsO4zJGhM
         u+IjPFaBOrfyT9ksyyFEW2VjG52Voez2yUZXU3HMgLfulKzyVqd4LIQC+FnfXFrUYgAW
         NUN081B38lEa7GRiU3WCJfNz1GAVXtpeQImzz/L8Z5JDJcEgg6bcNfx16wNsd8ZNCNxD
         UB3A==
X-Forwarded-Encrypted: i=1; AJvYcCX4VKhgL44ueWGNRxzlNBaMxHVEWFzWPJ6xNkTyReOAnCK/kDMb9lLyolkrtJVuuGmm4BD9ropj0yY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5RWz8cq6TVaBknmk9533dq/FGYPdshdvvkVpfzYLBtisJozV
	OlXdDh1QqD94Dp31qxvn9bM5/V9zXxKK5vHE+FJlC4p6TtKqLoSWWhSJ1K7WBXiOJ4504vVI5Qe
	CKAj/24GZDhizZrJQVen1L61D2W0FI+yCu1moP3nc0P2TcdWR1E4/rIHs1/Upje4=
X-Gm-Gg: ASbGncvEX/h7ZCtubREvLhKOsSNN1CEM9ZfVe8pn0P73k7YoHV5SFJw4AlyqdY59vnt
	8ZKK0g2AgA/9TmmmOPngCdsuxD25IfMInjs3E7VCGPIe2rzR+Dp1IeOdHEhTs1Srqp2xQ0goQX/
	5n/JbVVQSHPrNHhs2AyZV99SN1VipHYMsntQgyY9gZYs6aexBL2Lj/XrfNNve/hg0IM6Yh0GiIL
	9zGGU0n+BtrLLPuOLs8zjqUV6cAzGk8KTlekt7Imxub7M+rQg8pFeC3+scBSiuv0cXnDhv/CXUi
	S8/mYfsXU8NVh4/sx6bbPYyblsmZtQjOqkwPWREzrLRA6+BOwwCVQTGjRpMAzQ==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr3832890b3a.2.1748622822627;
        Fri, 30 May 2025 09:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqNwQxZU0xTr2WITGJuLCEWHrD4jd+DcWqKzqx8uZbn4MTH/bomjNfm/KY2N3fVJbrV50ng==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr3832859b3a.2.1748622822240;
        Fri, 30 May 2025 09:33:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab820sm3347905b3a.60.2025.05.30.09.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:33:41 -0700 (PDT)
Message-ID: <34a9bf5e-34f1-46ee-bebb-96bca551768c@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:33:39 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] accel/rocket: Add job submission IOCTL
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
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfX65IStvdm5FFG
 wkr9V/XYx1P5RS/wfaC9sH/+xjkG5wxVg12SeHpgWQPGaHOqqWKVI4853IxSTsehrOS90azqN08
 /HthFKO0QaDBb/3o+thrWag1DX6NYM7XsAxLPuWUBvywkX9IUJ+WApl8kV9SB893c6ZaAFdjSzn
 UbsllaIYByvwNMxaddg1wbYdNm3fKmoA3e1tJ8+FuaRVuTvCvPwXCPMzqYEAjdRd+i9nxf8fjaz
 TJ3N+p31o/NO5gFPjPOYN5I9v36OAtRur7xCEERuzI+89sIJ87IbHVdgsqeyzQcm+RxUb/p+k/4
 n4nCYzCsUvI9euMY5hJhdgH2mIL//1l/PbobHGYZjeVnTYmjuNBS2Y+peKkAMEni9EPtMmeYPth
 Zceo8IBTEKn47deS2B+NwL38ljrnarpuGk2NOf2HUngbLx8nckFfmcvL+HrdEYDwI6GdC451
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839ddf0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=YifSY7n-Kb6RBMa0OVQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: LCwfuaTf31cu_WOuZEseFFkpHTaf-MJ1
X-Proofpoint-ORIG-GUID: LCwfuaTf31cu_WOuZEseFFkpHTaf-MJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=924 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300147

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> -	version = rocket_pc_read(core, VERSION);
> -	version += rocket_pc_read(core, VERSION_NUM) & 0xffff;
> +	version = rocket_pc_readl(core, VERSION);
> +	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;

This seems weird.  Feels like an eariler patch introduced a "bug" and 
you are fixing it here.  If so, then shouldn't the origional patch be 
updated?

> +static int
> +rocket_copy_tasks(struct drm_device *dev,
> +		  struct drm_file *file_priv,
> +		  struct drm_rocket_job *job,
> +		  struct rocket_job *rjob)
> +{
> +	struct drm_rocket_task *tasks;
> +	int ret = 0;
> +	int i;
> +
> +	rjob->task_count = job->task_count;
> +
> +	if (!rjob->task_count)
> +		return 0;
> +
> +	tasks = kvmalloc_array(rjob->task_count, sizeof(*tasks), GFP_KERNEL);
> +	if (!tasks) {
> +		ret = -ENOMEM;
> +		drm_dbg(dev, "Failed to allocate incoming tasks\n");
> +		goto fail;
> +	}
> +
> +	if (copy_from_user(tasks,
> +			   (void __user *)(uintptr_t)job->tasks,

u64_to_user_ptr() ?

Same thing down in rocket_ioctl_submit_job()


