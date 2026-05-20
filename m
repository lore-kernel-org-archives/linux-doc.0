Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E533EAC8B
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287263; cv=none; b=Lsa27KTyZ/RPsFqruHugN7LIIhSonD4Rtx+rX006obzbNJpcBebCxUM3eb9F86OXoh0K2+ntgOJtiVcW/FDRwybXqBNDknqLGu3KSFquFGw0tcRj/3ZRVWxQFJ8FCzcFL3RXRd0jtOddQ2BnGvpZt5jSXHjIB0Fevi1uFAbG0Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287263; c=relaxed/simple;
	bh=HhFXaI44qpPtebJLFLdgRIOE8w0ovcHLixgHIq3RmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIxEkSIavWoOt3QGGxlJ02ZoUiUvmxFtST3N8I94qRySUBakNylWP0wMCscgGRIMwIQEeSMAg4JITncekWfZC1+0EdhheMfMyC9cJNbSTQGAJ8LojXu0TF+BTGG8oX+Juu5DzTelV2GM0pvJepOmjx5rLLM/U+FCu64hGq2Nks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJVdwe0E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtzF8S2W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJVdwe0E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtzF8S2W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lhI0267052
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFchA/PJgMyqdqvbr5p+Cpu2
	tYJVf4uyCXjeVVObaow=; b=IJVdwe0E9ak1iNh8XXD9rrzKn/RUEyEFg+TihlY6
	0x0kfwSksu6HayCdXDFAChikwMgdL3e8wUM0Atzfurz76tMCVidK95iSWV6cIqnG
	6F/bwCjvcC9GKTkjGx6iT/jnpaBOnkX3OR+yjFiER1R9nnaDOOYPHV+Eo4FnKRCM
	4aks3xgT098xaEVWR9hTv8+pp3Xm1POqGlIIQ8IF58ELY+HjaVV5iwCdQpuDUxuO
	1k5mZhCdgWi22xllqgMo/UolX+X0od3iXAWDRogiJhUHqi8AKuFPBQCQOYsVH9aS
	7Bd83i0RH9+7HtQU/S3XzCkBxlHhTRRDVUUN3Nc8CUD3nQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxs0bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:27:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575507a346fso6735921e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287258; x=1779892058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFchA/PJgMyqdqvbr5p+Cpu2tYJVf4uyCXjeVVObaow=;
        b=NtzF8S2W3V54GlawetpHP0GQXyypyWTqCu7/UKtyx1OTuI4KTAva5SVAQunNxw1WbJ
         ntAGKnXH8nUAFxPcDfu99yaL3A0LO/lpPRE2xLZ+Vu2li6SQE3vySpnHSNHDxvc/5NJF
         EdzSR/7SN/jyat9/RUl0DJPw3ejd4Wj9uvSIupJHUSQRxoE6qiUuPKPy178GAFd/S3zY
         JsGRh6kJNHNBqqM4BeVrZBctY5CTn8tz3jwJkJ0yk4KNWr4vpsd5zQGarpetjnzD6ctn
         CdYex2jgcHU0U3ARqo6lKWt0WJsHr8geYKCYe7YKEsIW+wor+qnSkGFERQSkB6u1iSyr
         FKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287258; x=1779892058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFchA/PJgMyqdqvbr5p+Cpu2tYJVf4uyCXjeVVObaow=;
        b=U8FCDamXlimrWdVoRMDF4jTR905tUtRg3T7hLzzmRDxVC6LAMXMYFFLO+0ZI7xFxwO
         QSS4Q3pqnuLKnxAxGF+vRquEQdOFwLEHXnNP2Q3FoEfMeiJfTAUla5v6BvVt7lp78dDO
         lTEnsxZXh5aFuhVL8CF1x1wMCyxqwuMX3s3ldxh2WKlE+Loieuuq93aPD7qLyz9WDPMT
         cZf7N+v+C1p2DbqmBMSHPGvUByNvt/kYXx3oNzM1BkCiTPoWRtaaOC3G5/6GJYr/0Gb9
         w+ZA280ZA0pTYs3V5eEzI8bYYYxY9uPAjkbZnfZI6b68vXpT2qbBKAi/4paHuT2kzzhx
         vVXA==
X-Forwarded-Encrypted: i=1; AFNElJ+CokCZKtUM15cvrGBuBUIJ6y7iTaLVHmpEjkKdNRQoZFdDjLVAdGjjL5Gu0j+2o2f9WsVmBT1xOLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YznJHMVRsSdhl2L/dsWLDN6YXmIyUJbzEIGXmayHPfg9KUhN+fn
	E2KkF1Tkt1bkTr2wVO5UBWfTnep33DyjYMSZdbtYatd7MEZj3K52DknoHEpthfOxwMi2YZVkjhy
	wRbyp7loN5UNDklWw6cSMwtyB415mTUG1pr04vaMRC5NOKNauZBMrKPhbkvO8jOA=
X-Gm-Gg: Acq92OEjrAWTJUM/1I8W5xo/g1pYPJRQRr09M3fwfPorcC2UlFJFYTLmMLKT+GxaAl9
	JMYxbyAdiIbHIqoiqht5QMCOXdPoMufDvohl/dwjludtxZeLCH6DT+bRFsdxn/fYrXGw/kQlfus
	/J2V3QsHngGJE+Oy7nE8/hXDM33+dd/XsNsXmns2iVi0SL32h35l0hiI9UHIkUN0IurYGpuxYIb
	OBXRMO8OqlqQXnCCYpRcpbzrjPGWNswUSkYiipTBlAX8FOhwCZMvRt52bRG2ufQmo+oCpCoMaV3
	xk0FkeoOPQM030fUq7MlPTi7AqD62Y/tuNmiPXVXE2eVqnvlDegSgrYthqTPWfBbsErZILK/7Co
	uZFZcsg3JQy7hL7EyMfNSbEsBW4zjjb8vNfuxsFLYQ1VdoFjM71UOnmQGOBBxEZ4GUFFHA1FBOw
	jPCBL6Vn4diunB0F7tUnjoHhggDwmZcXcXg3KtqvD+x7+OcA==
X-Received: by 2002:a05:6122:4b8c:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-5760bfb8ca9mr14235201e0c.3.1779287257977;
        Wed, 20 May 2026 07:27:37 -0700 (PDT)
X-Received: by 2002:a05:6122:4b8c:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-5760bfb8ca9mr14235127e0c.3.1779287257396;
        Wed, 20 May 2026 07:27:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc39fsm4991506e87.49.2026.05.20.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:27:36 -0700 (PDT)
Date: Wed, 20 May 2026 17:27:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 07/15] accel/qda: Add memory manager for CB devices
Message-ID: <a6n2qquynwzlquzqmnmjmkg6vkrldj42muuejwzln5wna2qmhi@ki2slzuyt5qw>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-GUID: 9Dv1rc2_urWQIo7xI4kdbfcemlBMc7qV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MSBTYWx0ZWRfX8mtJ/qpHoXtA
 a6ie9v8xI+PPAMMnfInTo5AkXgJON9E4foraMGOQKcVecPFLkXCLvGQkljl74C7VD9f+zW5aR9h
 l+9pvOqOfre2fDCHCN9kKIBYCdQwcL6FBYrGsGAbNDjxaq6+ngfnj4niqmZbWffbelgSWhIqZhN
 wQ2NMTkGHUGNZCkbYwlO8Kz+oQjKPxTfkKDlAj3i90HPvCl5kS/qiH6zssD+z1cF6EgGuSzxs+L
 n5D9KWIBBjNooN5WEJOhpk10MVzh/MNAOsmXAGbvs5UMuHxoKaK6+dmzLE2roL8pjRtPD363lse
 2X5wQBVCmAPayChdGn2JqSfavFbpMFZnPH/UXgdsNbicofS4FVHhuY0eFt2v4ll76HoxRDIh26m
 BOIXxPWf14UeDuvUnQ0583gwwoLpBt21jdFHQvZ4jgkccAYhSnbdkVKRT16krue39HVODpB3e3V
 QyAJXvi1c9bEfaCSxDg==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dc4da cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=o1-M_76Tnwwude6v8VIA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 9Dv1rc2_urWQIo7xI4kdbfcemlBMc7qV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200141

On Tue, May 19, 2026 at 11:45:57AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce the QDA memory manager (qda_memory_manager) to track and
> manage the IOMMU devices that back each compute context bank (CB).
> 
> Each CB device registered on the qda-compute-cb bus is assigned a
> unique ID via an XArray and wrapped in a qda_iommu_device descriptor
> that records the device pointer and its stream ID. This registry
> allows the driver to look up the correct IOMMU domain for a given
> session when mapping DSP buffers.
> 
> The memory manager is initialised in qda_init_device() before CB
> devices are populated and torn down in qda_deinit_device() after they
> are destroyed, ensuring no dangling references remain in the XArray.
> 
> qda_cb.c is extended with qda_cb_setup_device(), which is called
> immediately after a CB device is registered on the bus. It allocates
> a qda_iommu_device, registers it with the memory manager, and stores
> it as the CB device's driver data so that qda_destroy_cb_device() can
> retrieve and unregister it during teardown.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  drivers/accel/qda/qda_cb.c             |  47 ++++++++++++++
>  drivers/accel/qda/qda_drv.c            |  34 ++++++++++
>  drivers/accel/qda/qda_drv.h            |   5 ++
>  drivers/accel/qda/qda_memory_manager.c | 111 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_memory_manager.h |  49 +++++++++++++++
>  drivers/accel/qda/qda_rpmsg.c          |   7 +++
>  7 files changed, 254 insertions(+)
> 
> @@ -61,14 +62,20 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>  	}
>  	qdev->dsp_name = label;
>  
> +	ret = qda_init_device(qdev);
> +	if (ret)
> +		return ret;
> +
>  	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
>  	if (ret) {
>  		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
> +		qda_deinit_device(qdev);
>  		return ret;
>  	}
>  
>  	ret = qda_register_device(qdev);
>  	if (ret) {
> +		qda_deinit_device(qdev);
>  		qda_cb_unpopulate(qdev);

No, this is not how you unwind in the error case in the kernel. Follow
the established patterns.

>  		return ret;
>  	}
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
