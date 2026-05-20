Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63203EBF13
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286798; cv=none; b=QkoFHL5TLj334M7knhMtBaH5JTqQO2SMmJmlTLqge0T8J/NuE7yAqQI9PLrBwtBv6xbtTENopXA1jNZVuGm7JypjlslVmA4X5uv54DxfxG3y0Ff2olENK527w4MawIClAZuw5DPGKkkvZ4tn7OQOnIGfmmX5BhZ+kLRbdsb/VQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286798; c=relaxed/simple;
	bh=rCPGrnr1hJQU0fy5uz67DYTNGl7r43EjAnLT/MB66jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQMaGf1pbHAgT5M0BAdcqIXhIW61GFrz+TfhSl9Nkq17WEKqt+CAhiXLD8QqdaWaW0wR6GqaNiO6xYB14mQ6B0bLRk9EVgvJfNVJ597PMtxGYvECJNaJqLoNyuLgUnDw5G2FyyNzg7Xst4SVMJQFKg14wPIRpOuB9Z2yp4icX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgWvSvcc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qvq9h2D3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgWvSvcc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qvq9h2D3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuVPK3680313
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6tCnNFj4WCxpcwrHOfsYOWMW
	qwLTQRnnuiD3kfu4AiI=; b=UgWvSvccqLfXw468Tkb1E8z6KQ+1FXfgivcyie7X
	7mRZ4oCLQU1RX9AnUfRXMQrsZMMMiDgAVw1X6NOgmCry+U0AELq6l19HEamwzETn
	3gg5F6tydxeCV6hvpsj/COwqFRUSJoCNzxQgEaaPqYVTCLq71D0ajGtpX+OeeqOq
	HhG74oxpccO/ary6rB+UwoAHJ1Pv9dIY4ZuX+tp8HMgDtY3Uw6TQ0jS5nB2TzzkG
	CKUC9UbymTzuzqxqNWBHg38Fqm4K0lK+Im7H2LDH7Kr2h8eGe17dYPmROTcR/1AI
	lE7cFSgZTKqxEMB5bh3X9ggyJsBA9U7rpLT+t2G5L3890g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j02vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:19:54 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-57563cc7576so4105102e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286793; x=1779891593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6tCnNFj4WCxpcwrHOfsYOWMWqwLTQRnnuiD3kfu4AiI=;
        b=Qvq9h2D3vGrNzzwZc1PBQ1QUm4iEDv8HSR0lO7UVIkVDm+WGzF2acDUk7mbOA6nbNQ
         OucXiE8yEUMCR6ljsgKBEVyJ65hRbpRlMKejLNsBeIy96AL/Pv6rEsGREEhC3N4GVF4A
         afplZKqST7FqTfa8a5nsb2dSEgWP5QzRqcwwSfa8L8evfcz0huOc4+ivrmEybbLD89M3
         fO5d7lPHALy4nxqTJnvjmJXITmfboDmK+ZuA2qvNVXzgrN1oz2ahd6DHLZEWHGvcRD0J
         Su21SII4+qxCOUzoW2/TnjOZfKqe39Qo3fJ9fRedprmcgvfYgoYgxFLaTX7RN6uM7Wg9
         tsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286793; x=1779891593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tCnNFj4WCxpcwrHOfsYOWMWqwLTQRnnuiD3kfu4AiI=;
        b=SDw4dG7BYGRkLNlkEZajF9XL81/kD9JYlTxGamB2YTw/vSjPh5O/3Hp4zMKzBpb4mq
         tvMDf1A5WB3AfbQj/dBQFy6S5l4U9WjDoh+MU85FcrZWpVz3/WA6NXGrtFvO9gfMlzy0
         s4i3/yTieRxd0xrRTRj8E5z4eKXHI61jcSY/pJ+doBv7wUVQhWy6M5lk7YZj73P47wG3
         +30TDndQsWjawBAEWZYoATDaOoLqCFaT8H7xdWglUwYBNf5OyC25IN+NWVsZ6byUjf9q
         clCWY0oxfZJ1e1qUgZVCOVM+zAds55yYVWeXLqP8+sPBPI6g98CdriyG8GbZIckES3pD
         +h3w==
X-Forwarded-Encrypted: i=1; AFNElJ8HU3z6NRP1kPuuSNz/RAo3JB95XmEtcC6w8suhsAxyJlpVQw3lzgrMZlYrSGsYnk0dzZ9UI4qEhvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVG+5irM4hL3JV35UxWECQnmYt9BuD9MbLzaa+YoiW1maHgzH
	IzlNPiiQCrHUDW57n0s2AKSbjEHRHvWfNGRLgRdnH0mhcjdmLScvzVkOKEdA7HaGqGX1aUomGRl
	FsjJdp3f+0TPptTX2Pl220haSHw3SclmsDoftZLSyd7Lw+Roq81wYpV9TA0qj1n0=
X-Gm-Gg: Acq92OFyzJhszRudJ3f2KjpUIAeD8KKO8rtFnXAG/DOWQqDr6AWo9U54o/KmacpeFsO
	I8Uensf6X+S2/MmazJM6FRMuQQUXiA8Tw2qJVtJ0l7/RNvL5txtmHyZj+LaG/xorrIYOM/2Tm0o
	ACEUJUZ2pAwUbGWeDZk8djvoFIj7zJZPewYVnWpBD2/bHOSAdWW81qJ6lDK33Ehq8UDS4P8Ke6D
	vVnZGlWD8Yy+aTlv+gptYgb1IVF8N5drSx008AXyaiDD2R3Cqo24Fq71b9KQ35iS7+o5D+q9yi6
	MYV2Rb451TLQEUN3vSdJg/xRhyWBZjuYnhpQTrcUxUyh4AdXOqKl7+//VaZ/Fhswh1EoyM1oPbq
	hsbEkJQNrN/Sm1dKmZfyEPMNxwwakf7HbvuTqdmuadwQLlKVcFVzLPcJFYZWLzKlkN48YPVU/ii
	Zvt7HTVOjyovdgu0XsJ4FX6pDSOA59lRKsDiU=
X-Received: by 2002:a05:6122:828e:b0:577:559a:3ef8 with SMTP id 71dfb90a1353d-577559a4a34mr8499332e0c.11.1779286793217;
        Wed, 20 May 2026 07:19:53 -0700 (PDT)
X-Received: by 2002:a05:6122:828e:b0:577:559a:3ef8 with SMTP id 71dfb90a1353d-577559a4a34mr8499265e0c.11.1779286792601;
        Wed, 20 May 2026 07:19:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc12asm4981844e87.42.2026.05.20.07.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:19:51 -0700 (PDT)
Date: Wed, 20 May 2026 17:19:49 +0300
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
Subject: Re: [PATCH 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
Message-ID: <hhqbykyitoqjyekwn3tdv6ytzzg7hv27tqj5h26frxxoe2j3do@zzng2lmpfz2i>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-5-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-5-b2d984c297f8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0dc30a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lBWuVeWgvPZisQjhOOYA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: l8LbY5jE2WGUxwCX0NlkwbuANg9msxnn
X-Proofpoint-ORIG-GUID: l8LbY5jE2WGUxwCX0NlkwbuANg9msxnn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOSBTYWx0ZWRfX+2w+R6BgX+qr
 fw2D7HI8VxXoFQHOJkI3F4R3rQ4teNgg4sYMGoy/aR7IxEaLobBavqaWitNZnmovHps3MAGg5gC
 ZxFcg+i9/gWedOh2EeRtwE0+UY+aLNHESmDI3sc7aocPGBSfbpCP0PPuY5qXHYyGi7LFAPc0Scx
 D9MVhRZxbmp1kYSB+SLuTLblgEOY90dCiVrGW35jAYM5meW368XFc8QggwMEeLPtlUcwW6aM+uE
 mIVQVcoGpS+/n7qqHEYVPpNLmAKgIBYbKh1k6HyvOj+dNbH/0BcFRwsJDaYCwkPb3lSk9mmv0b4
 mknmUjKD0Ulr6jEty0cPebsBMnjT6xQIkyPT7apmuLiVddasPSXm6hfPyIgCy9OmmpxnjzxzCAV
 kF+O14t/tPcM67jxCPXGjwfhY/fTAjIa3jx1CxtvXH7GlQ14piEYW1Vcsernihhf1dukcMBZJEL
 4IlH8RPJXAj2Il1evmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200139

On Tue, May 19, 2026 at 11:45:55AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Register the QDA compute context bank bus (qda-compute-cb) with the
> IOMMU subsystem by adding it to the iommu_buses[] array.
> 
> The QDA driver creates synthetic devices on this bus to represent
> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
> so that the DSP memory manager can enforce per-session address space
> isolation. Without this registration, the IOMMU subsystem does not
> probe CB devices for IOMMU groups and of_dma_configure() in the bus
> dma_configure callback has no IOMMU domain to attach to.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
