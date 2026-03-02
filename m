Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080CA385500
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442532; cv=none; b=kHhPskjCTudPF83LF491Uc6pt/5IzBUv64VPXk609qL9KSMs2IG2/Z2UT/ga+d8tT7xBjG5gCq1RmKAINYILdANRxSMvlmHP2l2S0LXDSoRhCfU+7l5w6w0VOv8We3jDGnPnnqQISSXD7RE7aVGYB+Jr9JUFqdQbr52+PQUpSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442532; c=relaxed/simple;
	bh=m79/X+bzTpXZL9AiiyjJ6wo5Md/bncCfMY3V5a10w4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqIclxCxWaAwbatlTc5bG323lIOHqMlTsdEkJnj2eEslNWJg802acI8+Yrtk261oBkS6VGDGF4c6bDkcEoTjf9BNaZ6llK5b/05lSSsOBdFMP6+xUDCWBLcceFPupSshCgrGNeO96hMxEGmU9XWLpBneWruF9ZY02EBv9M38m9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ls3MwxnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mkd4unxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ls3MwxnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mkd4unxP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285baU662344
	for <linux-doc@vger.kernel.org>; Mon, 2 Mar 2026 09:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=; b=Ls3MwxnSvG7BIlnK
	IyfnLH5p9oe0dLepe1a+nqOGmpRu/4qG+sSO2gKmIHFKo06/ya1XPUOlwIW8eJLo
	2pI6ZrmU7TWboPLUzkOpLJrZS0MdecFq3rnqNKndUzd3HTHAzh2h05tEBXCHKNWw
	UUnXHYIFMOHVnoduZQXFCNyXoMdMckQOumOzGjKlJMap5hlsoeJjDo95nd5KKVrk
	MLS5arA2twyVRrIQrypnewUMTD/4e7RD6eerC/2c4QVVBBTiAfeeZg5qDvJoZUCv
	4ZHwYUF9OM8jLqjubqvJqSVdZEqjaym+yMXm0R4xenGrRwgqPN/2Bum3YHPUdqNR
	Hf4F2A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2r9m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 09:08:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8273e7824e4so3133870b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442530; x=1773047330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=;
        b=Mkd4unxPOyqBHWMy79B1bFczJ4g94wd4bZ805Y58UJagH/ftf+BtQ0tMR9P0e6b4Ps
         Kwc541sTqAV1dCgFYiPgDGy+YBqAertfgQxztwsIdoKHZMmaawC3qzTuDAOLSOktqtsd
         ibqdeRS4Bc+wd8/XIoZmLc8uSgBgBnh16FaMzQofaBRrEyEqDjykralKwgzOOSnut9RL
         sa9oegtpkbyCQL8/5fNKpxecVzdVYnAa/+UPpqbc3BhCcHR1B/s3pHcTN348V7gkx0Zz
         XCrHKNijkl2hsI4l9Vrhpl51qVd+qPKucLIjG5m1zwCekSyfAewDO0gUfXT99A0piTpu
         SSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442530; x=1773047330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=;
        b=MizFxVLA+Kq8YJQBe7TezcwpWsaxVTzI1RY0rMATbzmLw/Qe/ieQnYd16TuBTDX9ph
         kfefiFYicgf7JAe7WOLg5rK4kcMRe3PQbBUGwNYUrLEvuDvfwxe1fY9Eh6kuR+CIwIvg
         mYIY5D7Vl/6AsqWvuD6Dz20UwMx0GUvWl7wWOJIlvvTzM4qFaHP0HG1yMkFzZYK5kTuY
         pn18lX4w9yQciIROR84fvNGgZ/pp/VkwSYfBiYmUOVur8nGv3nXRvtubjwDYcc2eQejG
         pffXgYq/j/13ZFsZoIQPdbUOPlYVHf6lmV2+h28Bz2w+EsDi8HwAuMaP9JDwC1ktNrlz
         hh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQK11dLXI/K1KoXELiY0DAuTk7fJNapbxcTG+HbJXgRIoB/BaXzKMpt7+FVX3gY5ky83FsOKWfSAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyS4eYcb30k1HtKGRkME3+Yp7fk64j5qZUNoSCqz4NmPF9OCsO
	NLMKQEkYzrB65NZsJcyg8JHc6gJglXLxBcs5Oyz/Q9HK564kzPayQqNs2nXGUonuZtN1Ux4KXTB
	wuSjdqlplXz3sAVAU+qrXSvfCbK1opGuugkburPfzG8yyYgvqg2mYbyj+FUjF9xc=
X-Gm-Gg: ATEYQzyFh/YVY/LYgHkvxjM0BRezpfpZ9eHRHc6m8qmpYpENE+Mi/ZPgWhvZcVIBuqE
	iWqM32wqqfIApD+v/a5UsmKZq4HIEUKd21Q89gmsYBpzMyDk0Zaytdj6+UDzPeStJQwLtLLZqHz
	mEk8itEQH71fszP+a7sm1aQjki4wV5FtF6rfoZIgbUiahdr/uhJlVQJpXoQfZFebh8THronTKHT
	Dv7z2KSQsXFCFn0y5hA0ZbYG0XDWr91PbVaVfmhcK9kC8ssC9rtU8gD71CooGSn5w2YvUF/69VO
	F2YBEOwiheQCXueNiKyI7RAwPUYZ9seNu/9E1Lu/g3d8wqiryjljBOfqaAEAYBIKLOHYv7nP4im
	OtbbT509jxQUprfN40JR7P2a9zoXOcpnoSPnuzEmZtXhbm0tUOA==
X-Received: by 2002:a05:6a00:22d2:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-8274d93af23mr10971001b3a.13.1772442529577;
        Mon, 02 Mar 2026 01:08:49 -0800 (PST)
X-Received: by 2002:a05:6a00:22d2:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-8274d93af23mr10970955b3a.13.1772442529070;
        Mon, 02 Mar 2026 01:08:49 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff1c9esm13696576b3a.32.2026.03.02.01.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:08:48 -0800 (PST)
Message-ID: <a46bd6ea-ec33-431a-bcc2-1ade0b40c5ce@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:38:41 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
 <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SyOES2eAZAfh44wXMC7SP6oUmK5qbOBZ
X-Proofpoint-ORIG-GUID: SyOES2eAZAfh44wXMC7SP6oUmK5qbOBZ
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a553a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ukUgU1k7PXLouMuqi7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX9x/e+yNZlAUQ
 2HZxXgEUmbo7nKJz8TwpRm8W1zGtnTILmopHqbTpgw5khVRVX042zP/KO4CcmfruuVuVCZFyTse
 mZCUw8yf+SjUUuM58up928CvpB3qPuRpK27tccp5bKFzJ5GQcRZZrhabwOkizPMkg6OpE3kWwME
 0mnBeXuvYhCLKA9xOFlgAInEALY0tmy2VGzj35GSO0xPHyY7Zwph7nZQGNU6GK8bGUfdSp4rI6h
 uVDeb+uYFGrLa7eCKTOo5Uxp8waj5q/aKjiwfY42GEMywPqhEAvEItlOBMqWVUWtkwwk8qTUc+h
 PcTA9uLj78IqIKfKJaoLZaaUHPbU259pkMQa9AU3gEK3jGnbsi+07mWQ/LKmha8jIjHx1zI4fmG
 D72BFduQC2sU5igIAmkT5ws/jjVB2Hy1GI1+1+2149CHPRAreH83V6gaRXfDA/U7ZEe+1/jlyfr
 7mgcWpRoPWaOMLWD9CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020078



On 2/24/2026 2:35 PM, Christian König wrote:
> On 2/23/26 20:09, Ekansh Gupta wrote:
> ...
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +       struct drm_qda_gem_mmap_offset *args = data;
>> +       struct drm_gem_object *gem_obj;
>> +       int ret;
>> +
>> +       gem_obj = qda_gem_lookup_object(file_priv, args->handle);
>> +       if (IS_ERR(gem_obj))
>> +               return PTR_ERR(gem_obj);
>> +
>> +       ret = drm_gem_create_mmap_offset(gem_obj);
>> +       if (ret == 0)
>> +               args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +
>> +       drm_gem_object_put(gem_obj);
>> +       return ret;
> You should probably use drm_gem_dumb_map_offset() instead of open coding this.
>
> Otherwise you allow mmap() of imported objects which is not allowed at all.
Thanks for pointing this, Christian. I'll read more about this and fix as per your suggestion.
>
> Regards,
> Christian.

