Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028337B406
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886434; cv=none; b=XVjMFLsbKz7WFpksho/qMYLAPN5NX43itrwlLBuYUOdXwEQQnkgboMY4GAytT7dA9GzjP9z7cSC2cuELHQNvjp5O08DVJ1V7HGMV/o41z8b1iWdD6qMu6HNAgtjOCP9PrfjtAsk4nWzRoOBlW44vlMczzjj6DgpfiD2CbLG+wXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886434; c=relaxed/simple;
	bh=Qih0QhTFQ3wj9ErAiKpynh4DfMe40Ro0OOLK8vFqRyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPQj3cBxduItmYC0ei2C4G6H1ZEVGcxO/rXhhkDKCeYCebJpuTgBnJpBEM4lfbti06ZhLXRHxCpG5eHGnePca+a709YG1xEU9F7azVjODZ4lIzHhszmgyWSjmbQGLe5qkudo0rTjUIo2Q+NOFjptKudGutOynFl4H5jtBFqn3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIL0pWDy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeZUCIWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIL0pWDy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeZUCIWP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NILQPq3732694
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u/ELNB5NNSNmVG1lAxOxXYaU
	P/G6z2rnLtuVVe2l8Dc=; b=CIL0pWDyAHnR5vXk18SDZA7lb6nyCoTjULcjQfez
	Fd8EZfTPq5EtM25/5Al218WuFiIs1Mds6C/q0/EfPi6fYF11Kjzwx6jCUAbIgDF3
	A1rfdspmIF8aTktTYjxCTIWXiOVT49AQe6OgVD/d7sqgV9sm429j8EW2IRKZz4jR
	fB5J9wnQcdSkjZaVqOSd5qSOwTco8FKnmcALeH23N4obi36U1A7KduH1zlGlZF0v
	fzA8y6OA1hpylxOWNBU4cB3CfpjfygvgTMTuSKgbyOZQlcaUIs+2f9R6JhJfZLxW
	zAHG0AR/GsaSlxM7FdpK2WFea2c5ABblEUPd36w12xuwXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7ta461-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:40:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a2eb984so2129727985a.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 14:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886432; x=1772491232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/ELNB5NNSNmVG1lAxOxXYaUP/G6z2rnLtuVVe2l8Dc=;
        b=CeZUCIWPMmAlhpCUskBgvU+kwNj/feFlvaF51td54eQCDLyAG6L/dttgbaLLUd1pZZ
         kxvM0alheeOP1+yVExr2IhnxGqw0y0/8v6uU4J+4uaasVb41KwpHkGSlkRJ4Qd8Ns1Ao
         8akajoXeRLjnGYmSdZCH7Y9IJUCQLWP63n8Uk/GQfnSZvIfSt9Gvc6XH1zGVdHdp3mPe
         qkjQRq4DEGJF8T5UeIjSlmNsbFUsUxRJeMkn9e9ztYZBi/YsnhRpgt+3bYnQifE3cDwf
         k4ntUrGNHPC0MBByk0wWecsPc0/j4015wvjcnhnyAdRkKYa0IByMPKcx77nFxvTJDxRA
         1VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886432; x=1772491232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/ELNB5NNSNmVG1lAxOxXYaUP/G6z2rnLtuVVe2l8Dc=;
        b=qSydP5iJNib0PU57wAFruqmufdq2OprkI7QaXHmpMxlkb/0nmnjv67yEgKv4GvUIuG
         RdFUcyB5YMnBmlJ73mglrwEGnIrMiCRAdLV3KpHgXjlzESJhx+lEOV2++eV++x3KLP6N
         7vAQ/a6sY73/iGrKP8+PNLj9n/NGNPLieAKw2c0P8AoXR06YUXMIuoeMAyHQVSDy/ePd
         eyJ9lwfU4GJvavxaT+4a6x1uKv27CvKd99rJatWtqDFktSc88wexC2fN1UEPoEqHj8CR
         xsjyNpm1PcpHiJyqf9VqXwY5RU7txSc50erQCABYepBgziHqSRMdTFQsl8eYm5awN+os
         fhfg==
X-Forwarded-Encrypted: i=1; AJvYcCXCC++CdiZmIXTEFqGUA0PfTOBiCZHwHSEQ8qJQBzHr/gu0EjqpaS/P1mHBDpyqNKfaXcn0T1UgxnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTirQ/sUkbj7pweZ+p4o+bg5saPXc8SMitiex4lbzfhngv7N/C
	5J0Rc3eXRmU2VwgjCeS4njgGIbUpzzBXLM1dIIg6BqnTuK1RfZw7nmoHY4KfVlzzQc41pWpHVcK
	Fca8Tzfl8XXICndLFdlaOfP/bvSFzJzF7cjeee41IMgTJgbta/46LN6Y+JkfwTMg=
X-Gm-Gg: AZuq6aJVzCp9K31F3DgjKUNpMt7AEEjBSYHV2c0I1nizi/JNLI+qdqG9Embn0QsLFKo
	mOAiRaJZ/fW2Qd6iHHxfzpXWxxXQcPgP5YzaNb5EhnxIrtsubkNwKSiDo7eKa7Rkmtj9ugsl0/5
	jS7KlyCbWK043bTzg1zThYbcrjxoR6sK1t3n7OoLoe9YnOBeReTeA6c9cr9K3mZym8an1pvqxsJ
	Jv7yL11GUzXbdFeVdcaXPCr1MNJgs7VZfBb5c9DVpKp92Rv0YuQFCjUKs1Jxtnq0YXjtDA+zHMF
	8SnO32KQOfnVgjNd8YvPvcwvHJHLt8pMN1qXUh+QtUZ7ASFkz9sqzqBQl4V2/wmFLwJPTwIQXa5
	uz2KJOzEma36RjEgqALlfZS1DOGd5AFHFqIHTQujYhfinRwA7uDL4MEL1LIDJFq16tvPsGoYsTN
	ZQvrwbefK89KG361LKqmqx0rgRszpO/l4jcGg=
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cb8c9fd576mr1266006885a.25.1771886431284;
        Mon, 23 Feb 2026 14:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cb8c9fd576mr1266002285a.25.1771886430804;
        Mon, 23 Feb 2026 14:40:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm18140691fa.13.2026.02.23.14.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:40:28 -0800 (PST)
Date: Tue, 24 Feb 2026 00:40:25 +0200
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
Subject: Re: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
Message-ID: <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699cd760 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=gmMn6fPPSMme9wD3190A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: IDLwTV-zBsgvxhWrXVQArVK0QVxgJq5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX4sTw/2pvdQPy
 bnumW4lG+I3afrudDm5591VXmM1Nd+uK8duxAPg2OBBi/3XbLDpja2W5BLxY9/qoh0ETWJnMH6i
 WpsmvEPXCrXBTnZnwZJq65a2CB+Jtl5Ra6hoT558g6j8mbMAGDxQZWDa7A/w5tvQpR9PKCCEIfP
 z1LDqbrQL7XvWU18Ag2MJRoCSS1+UxrAMvGJ+sgq1fVYqXdrEbFgRERsvGfbvtMhW00VcdEQCjZ
 H0921gqYBoSbMD3ZZp7Pu+Z7HJhHbf3cZOXL9x2+CuhRjsCpftn5k6Ts++6VtDejnnHt2eUR9HQ
 O+7vIED/U09luMqZp+qI6eoRz/o9uogg+SqBcjYQDF1mln5Ap1Gl1soU6LH8cKZSKfFwM8f9bB1
 iHatmGJsXYpm5j/6aGarfe19P2WaHgwdv39D7C6HYaPkGp+iwPYR/Dtb1l9BJZIcZdqTTo/3RC1
 ffDn/Fyw8CCbpYAgE8w==
X-Proofpoint-ORIG-GUID: IDLwTV-zBsgvxhWrXVQArVK0QVxgJq5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230197

On Tue, Feb 24, 2026 at 12:39:12AM +0530, Ekansh Gupta wrote:
> Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
> driver. The entry lists the primary maintainer, the linux-arm-msm and
> dri-devel mailing lists, and covers all source files under
> drivers/accel/qda, Documentation/accel/qda and the UAPI header
> include/uapi/drm/qda_accel.h.
> 
> This ensures that patches to the QDA driver and its public API are
> tracked and routed to the appropriate reviewers as the driver is
> integrated into the DRM accel subsystem.

Please add it in the first patch.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71f76fddebbf..78b8b82a6370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21691,6 +21691,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>  F:	drivers/crypto/qce/
>  
> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	Documentation/accel/qda/
> +F:	drivers/accel/qda/
> +F:	include/uapi/drm/qda_accel.h
> +
>  QUALCOMM EMAC GIGABIT ETHERNET DRIVER
>  M:	Timur Tabi <timur@kernel.org>
>  L:	netdev@vger.kernel.org
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
