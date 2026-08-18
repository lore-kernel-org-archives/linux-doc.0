Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B8381EB9
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 03:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024999; cv=none; b=f14j8B6KQ9OxEgYf6QSTlXLAVDvxtuPbqWUdZe41gbK727PsN/kHewNaoPAx/zq09v8dis6khLckPCGxUtPyPx/4kDCaEKvvDQNqAdA5KnCgazzDPO51ld9BO8JJWXI9Hp6GKKA3eBZZocMldsVhUIsVBDcOK8wT1lsRGnqvdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024999; c=relaxed/simple;
	bh=q3ya2SblFC86iZpNdDmbejj6B4Zp4Ad+lutz+pAZX8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuDJIV/tnPGLkMRmnaylgiuWTiLCBWY/EVhEQ7dLmDtXX4aipQXPC93ozckDp1XJTc9e2qO75kaPp53jhgPpjW49w2ir0AKLPv4U4bWNDiajQoJa2MFyWwtfl25wXYZ2BwpFXAuxRk8qtiMsMZ/h0+UgmnxBW4r710IVRUfW+dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmoUky8+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqgRbJVX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmoUky8+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqgRbJVX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I28SUs2884748
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 03:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cSsOQKdmDY+6H5Rq7yKqDY43
	lcWOkS/eE/giYEixucg=; b=VmoUky8+H+tjDDwaT3tM/4TVnvJkBfcAcpBpHare
	Tf7ZwlFpTALetiJ+Fvm0LbqbSRc/dZGRFfa8pytEQjoefL37MLLuERLHkEkAUiZu
	Sosalko1f1YAkl7/boT/E1TtemNYToayV0JhE4ZrXJdehbCVBfX38x66O6lpEn6Q
	a0a4W8cNuILfixuWvnT0a+fTX3Vp8HRfQzW3s/hv0DlBr0Mm9piiL5Egb+ZdMJ2e
	jiuRWF7y/EE5Gz97gPBHwxkVD4Rjycs+S+VeZcMpgB1WRsziKUe0s1XmcyloOdiQ
	VP9hSUNqfVcT32jHu4iQNKS6CjrBKG0ukVV+i1sdfVUs4Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebprcq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 03:49:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so56997021cf.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 20:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787024996; x=1787629796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cSsOQKdmDY+6H5Rq7yKqDY43lcWOkS/eE/giYEixucg=;
        b=TqgRbJVXwhZT1Ci0ifCPRokw5pyyKzrtw8D5a8X3C4zz3uBgllJWMA+fukz/fPSKFI
         JC5sRIiUbk1AALMBiD7kZhr6HG7y/X31h6ygACYKDk7XSe65li4gOKgwOcbPRaO6N2+Z
         P1qn+dWGJ5FzxKAfCysAmzCUItIVATJEVs9RQdGCkfqHN0elw/25AghZ3zcMLyzAq4W8
         jIW3qkEfjhHrSeerNfTpfu8Omr2HpUatxcr/4G+L/3A9WZIPxzQcQX14H/tUn4+qnE/Q
         4xMM3pCqhycqtbTCtgzcHKS+wayzF5O6NMro0eSkWxlKQlyOBcilvt38i7/aYGQCQ5s3
         XCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024996; x=1787629796;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSsOQKdmDY+6H5Rq7yKqDY43lcWOkS/eE/giYEixucg=;
        b=hWSRmEOAsNi7j2YzotRN+QtAJPyOwVO+ebGDqgkZd0aUoo/JTFEWSvuJ+4HR6DgMGi
         1+cdCB7P6qoPh71JAn/8bOJK/JkoZfDtPJ08pEo0iF5nTxiQzGOR92ivUPGq/RwwGijI
         E30MEYHkwTZXqvkzTDhzFqOL+BC5Z/AXDg5vyzWV0eaUmby3Jzr5wKKT4D6rGuBBZShV
         1t4jrn67WLTgsbXpSwkHiMws7x2HvgyvJkAsj7nhwAtuUisW/CLTe7QNUPQtWgp2IwDk
         FJmq/GVevjxO69hD47T9rU7CkIlhG8D5eTyx2shm6qtm9L8jCcbN3d3Yvi22uSoGiWPe
         uc3w==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Slo2KY2YXE+Clpz5Qf9mSiKBaX5DS+Nv6RBUqyR4Gq3gSfVmmoKp8Bx62+q0JqMP+S4ws4xGGeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjG7jR8Aa8NyzOB5dM/Dx/j3gZxVqqIVDsSEyKgTeGjgcVguZW
	uZCYtNLMUi9f8VPdKhSRZvSoxjxCCVViZBN+Ub9xlMXaC/tFP7LVdkV00JDnAAeVxjQmTPUfP2m
	JMLJg5NUJf/NAOOf05QRAnvbfDvINOiILxdrDC3fSpLAb1x06medEww9+KnUqA1g=
X-Gm-Gg: AR+sD12eo4EPql06Yk2SDZ68yGOM2sfRxaaIgYWrZhoKAH4XZSienYOStsXwvxem8iB
	n4+GtadlglwKnd2odpk2xJ5goatYLke7bA9ZXW+3afvy6pufonbLj0Ju0ko+La779mKu7Mxv4B1
	1OipqgXqNfNuh/gcW1easq8eQ85ydFtExTSmq2+fkG58bNnhn8ISL9fX4Sc/KLh6Nex7qVWbTnR
	EfMAFPokaugGvbOX5sZvv3Vv5TCIiYNyq9gtANajGuJxqBm4l6TGvIn4CJlUZ0QtRK/CggbtIaR
	rrk2wwlLD1Ylmgl5YAsKKMHnIO5T+ZjdrDhMn2q1XhE2Ogdfg6gRnyYu2MG1c20VVBbluvBpDe3
	+ibO0YPftcdpa2f0dusIjTZEQ1O3NGeKViU11MrL9c93ZyLZ74LAERJDuN+gg2LkSk0GE2ojc3p
	i/SlV/UBqmFVBe
X-Received: by 2002:ac8:7e91:0:b0:51b:f217:539f with SMTP id d75a77b69052e-52d85354a61mr315349581cf.17.1787024996080;
        Mon, 17 Aug 2026 20:49:56 -0700 (PDT)
X-Received: by 2002:ac8:7e91:0:b0:51b:f217:539f with SMTP id d75a77b69052e-52d85354a61mr315349131cf.17.1787024995589;
        Mon, 17 Aug 2026 20:49:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa875bsm875722e87.32.2026.08.17.20.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:49:54 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:49:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 10/15] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
Message-ID: <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
X-Proofpoint-GUID: bcCVsggf7LdvmIrwaTNCP7rrPXSZdx1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNSBTYWx0ZWRfX7NwlLQwxCX89
 grHAraiBO+38vfyR8RL55o7mPp9MCR1V1MVteHwDivLOXVp6s7c26d0WHey+b1Bj2kbipxJUEcx
 sRX0P0ZoBQv4KEni95of/ZgK/8p+AjaIuysAJMQsjApwdIrdHjYG1Bu1VwUBO2Pi+HV8fs/v0x6
 7jO0uhIQ8tMejklokfF1XB2oDZIA0SSSGELuE0RaUy4u5kDl0RJlPjrsHKwpVVvlAcp20UwCq3v
 7SICNjmClcqtNdFraMgF/MB0vvQ22sRj7WrtEIbUyh7uogRvEjwt0R8sGR6g4QW5DBbZFKun70h
 tmuEEkJMxxqkSfs5mXbXonITBdWMzELBcSxcWnQXZY2RjLroBc/+/AFw4RaYch2O3xGzXnLypOW
 JQLTjh6QtFkQm9leEV00mlxIPzMsEiHMKbqyI41VAovn2i4IxusMg6St3C38TLBdgQiREHelRBr
 QPazdGxUoXmXdW5ldQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNSBTYWx0ZWRfX/m0FVwsTMLkm
 0OcCRDGgw3vsOlyb0DyBrn5kfEwuRhM7ckXiTfWqoMeCKhUU++AY8MXzY7Vs7aOq4LGdRCYr7vA
 slSs0a0Nz/387nNNpTuosrLqL12yH0g=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a83d664 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eI_CTGzUyT5ilQvOjN4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bcCVsggf7LdvmIrwaTNCP7rrPXSZdx1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180025

On Mon, Aug 17, 2026 at 10:17:45AM +0530, Ekansh Gupta wrote:
> Expose two new DRM IOCTLs that allow user-space to allocate DMA-backed
> GEM buffer objects and retrieve their mmap offsets.
> 
> DRM_IOCTL_QDA_GEM_CREATE (drm_qda_gem_create)
>   Allocates a DMA-coherent GEM buffer of the requested size. The
>   memory manager assigns an IOMMU context bank to the calling process
>   on first use and performs the DMA allocation against that bank.
>   Returns a GEM handle that identifies the buffer for subsequent
>   operations.
> 
> DRM_IOCTL_QDA_GEM_MMAP_OFFSET (drm_qda_gem_mmap_offset)
>   Returns the mmap offset for an existing GEM handle. The offset can
>   be passed directly to mmap() to map the buffer into user-space.
>   Imported DMA-BUF objects are rejected by drm_gem_dumb_map_offset().
> 
> DRIVER_GEM is added to driver_features now that GEM IOCTLs are
> present.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c   |  4 +++-
>  drivers/accel/qda/qda_ioctl.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_ioctl.h |  2 ++
>  include/uapi/drm/qda_accel.h  | 36 +++++++++++++++++++++++++++++++
>  4 files changed, 91 insertions(+), 1 deletion(-)
> 

The patch LGTM. THe commit messages needs a rewrite

-- 
With best wishes
Dmitry
