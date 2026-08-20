Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67A4445AD8
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231165; cv=none; b=qf4BfpbMFI4WogFEIBHzg3nv6E3pAf2s8bCpFuI6vv5U4LDKx1RfgFAcvYHmcJxEVCZlEzTy4tNQTZlY7JWhlK3a1qHlu2mSEx7/HI1u+T6TBUzCzGrwbyKjtBcO+6TtSFzmYfppbM0K3Ab2BWebKBs0IzfeXtTkCj5FTg83odU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231165; c=relaxed/simple;
	bh=/MvLGjCq9P+3TJQdi9yv+SMKwpIqRwp5tDl+T95B12k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lF0pnj5H75167IpaSUK87vrsTmpIXbLIwZ8Xq7WUGB1y1rnsm5RSlRaiRUE9iryxgPIhaDMv1HKCyD0ScMp4B1uCwaL9QqmCpubQuLre3F/dkHkZJeTXYpsjjI+Hpf/hLMH+Jbl4jqcp5tQrstGYNu3r7iXCS2jQxWGAfA/ZiJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwaV4z2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVKOMRdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwaV4z2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVKOMRdd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LCjV2753042
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 13:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=; b=jwaV4z2TzGHiIR6o
	jRjasUFvEdE3hZE4YOADkjaSjyq+fcG4SjuMiuZVqbaXpQo4fXaIGY24SYwIat5Y
	xEHhlCuMnmrr/SJYHxUbGJ+FCUVgQRxIlibWMy7b/sBOaiRz0+BwV58KjdvUWos0
	MymhkSBlK9tfmtpyUhUVKJsUFs7C/x9lF8qpNUMfawb2xETI4YbvdSb/Fm3cQMvp
	wpXyQIuiglhtbRGv11uPR8LPyT8bF0b6C169b+Ox9GnAJLwwDeqD8AZtXLm3YYqq
	gt/e/bKxwCGZ8iFBBe16qImQzjIyszZalA0J2/MKSZVYh0FOA7HSdLy82KtShU+Q
	AQ3oYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49997c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 13:06:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso2168884a91.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787231159; x=1787835959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=;
        b=kVKOMRdd78nLxwu4IeGKctaQ+4txEocIZ0x6iAsBNJIr/cVVVd1eZua2NMHDr4v2Lk
         S60xwPXBn/PqSctuiZNHNdcxlS43FvhHaSz+IvkACMlBNzjKQvxY/XrJtd0IlPRJbTSF
         pMnrDSQ3B0tS2FTcjbS6dJ85kp0CmK/F5yuQMkNy79YEyaN0WoTCd6BqYrmTbS53r7Kh
         itppL8DG9fCKjrYrQrOl3LJo9gSws1NYkqgYLUAJq//Ir3LPa202NAajI5K39tFPjC51
         yx25dslNrfQMXT9x7msJE0IzlYI8BKMtlldH5FHQs5wdaDvDI3wrHliEAsHEJKuoknpE
         Om+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231159; x=1787835959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=;
        b=WKV65etqO7W1PeS36OsOfUADWpQtPOzXYBYuCWyphaiaXQLc7f0jnEv4DZKnc4yRaj
         PtrCQzgIHuixRLhciyD13ArSeyrb6gRFpH4WiPYdPbR6Ld18ZtmqkGBKACN0CttxsLbV
         5y8XasFfM2/oHlMSbU/YPa24TbDSwYNs4mVScZGac4FZ8i90ZL7L4DR/+axViU0DddOn
         wz4fLOogXW3cQe7xqyZxEal3CIjaO4VRkQV7eIEWsZ9Zalyk4/WIYNwNb5eq22Z73Ir1
         g0P7O2N6cPNEa3cS7W5VRNoWZd/j7uKW3ZLG5xwyrq4mYIbvjPlXmu26v/+bwx5uX5Od
         4RJA==
X-Forwarded-Encrypted: i=1; AHgh+RqfseKkntvSOdd+IakrRAVldto9vZliLdG7KZhQ36h2RKMKGih6vUnMQJTkbFs4AOapwbyx2u0qP8s=@vger.kernel.org
X-Gm-Message-State: AFuF++n2VyBtqMll33WzIKcJgPCkVDdXjZSIiaS3bJpHZSFqDTY+svqK
	2pjnsizS36zQ6Thf74zy5wKXHh14Ogkmef+18oaJYaZUlHmzJNDZk5gO54pCHtAMjDzw4VoHsyj
	lZ/sxC5vvAtkO8OOgpGXMIZFiyBD1xVM6wdrGPt+70hy/7BSaloZeif+hAPmPJdA=
X-Gm-Gg: AR+sD10BuSRsByzg0lzTkm5Yjb4mCqwl5OdAq9YRqfjdHNMsnQkuUm0lVtgzHc7iBuX
	tRo9IZQL6f1UrvEK+guc/yDCvFIrQNflrkGeiUAcImcWR0LIIQXgYIVq8sGE7hc3B9FXpAO0Nft
	sglQRiHTAMoqc8Qam0ref+HnzU8QF6YqJKoZkKD0KrErB+Sakf5ogbMNefer/cuBa2vubZjuZ7G
	XF/fUdXSuJyEW1FiW0CgHO09yU/okz0UYMwnm3zLygo9WgpgYVtc5I2mcNfMLtENGZLV4PU3Bis
	1Wo/qH/91FsH+/vBM8iNfmgRFVi/t7ZkpFRifg5/6fPiPdcMMFx8GyKe4Zcf8fKU5fe07BXxLaK
	N5AesVnckDxINYh8+D8A/tsfZfsWN5w==
X-Received: by 2002:a17:90b:4d82:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39580ed143bmr23044542a91.3.1787231157807;
        Thu, 20 Aug 2026 06:05:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4d82:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39580ed143bmr23044231a91.3.1787231156489;
        Thu, 20 Aug 2026 06:05:56 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6574171a91.4.2026.08.20.06.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 06:05:49 -0700 (PDT)
Message-ID: <eb05740b-8683-41ea-83ec-8a4a484881e9@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:35:40 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] accel/qda: Add remote memory unmap from DSP
 address space
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-757ab8ed2f64@oss.qualcomm.com>
 <20260817-qda-v2-v2-15-757ab8ed2f64@oss.qualcomm.com>
 <6k6ogbosxx4z5bh7uriu4fnj24ycuakylq6g2gnuwsbckl2zww@e66jgj5xo52o>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <6k6ogbosxx4z5bh7uriu4fnj24ycuakylq6g2gnuwsbckl2zww@e66jgj5xo52o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NyBTYWx0ZWRfXxOUdwvILN9xn
 HOXkJJ5CUWJGOkNZ7y30Pe79sz1iF/k5YWt1zsgqjgVtfoLzx4Hz1vhXsB3jwGQq8vaxoPG9CFx
 y/EuVnPDtOaHnvlciLWkfsff+gfYBCk=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86fbb8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rYwYc2LNA-xZppdo0x8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: VU1aNSFyqlo5ImLHwXvnlavuyWq3YMiU
X-Proofpoint-GUID: VU1aNSFyqlo5ImLHwXvnlavuyWq3YMiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NyBTYWx0ZWRfX0ksrEsMsAf+o
 GIlOcp938lb01QLdjw1hqsX/DlSv0ObakxoauarA8px+qB1t9zEJa/xga9f50GXLqCvVmrOU7IT
 ahPhIUb/tdkNV6vfvFf7CN69Ryqc+ltSrCtDgpl5E+Pr6ww38QodeXeOefYm7ypeo9IDdQtI7R8
 NU01UKtkUHjCHQJnZCj+gALSO1FFpgJOR6ddLn5VKpLBd3x2r761w3SGaj2LkCGfK8uVFY3J6jP
 JqKblWePu4XVTxkKHdVO1519yzgQjtHqoh1FChDtT3+3zKEJjKbPCn+cFQje6TxU9TlJgjOjsZY
 RuUTbOUwvR2oJw05FY+HwtQa30s7HrPvR6BUVy29CjNKobeYRimHHgHRLA0HjmKc4JxZfXEO9Jz
 vfC1F+rFkHqP8l8Llb+DvUnk/IImQZ8I0shntopLQTUoJB58J35otF3QKa08Ftx1NRT5jDe/Lcx
 K1uAofWXxxeB504mLsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200097

On 17-08-2026 11:14, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:38:45AM +0530, Ekansh Gupta wrote:
>> Add DRM_IOCTL_QDA_REMOTE_MUNMAP, which removes a mapping previously
>> established with DRM_IOCTL_QDA_REMOTE_MAP from the DSP address space of
>> the calling process.
>>
>> Mirroring the map path, the DSP exposes two unmap operations, both
>> reachable through this IOCTL and selected by the request field of
>> struct drm_qda_mem_unmap:
>>
>>   QDA_REQUEST_MUNMAP unmaps a region by the DSP address that the
>>   corresponding map call returned. It uses the vaddrout and size fields.
>>
>>   QDA_REQUEST_MEM_UNMAP unmaps a region by buffer identity, using the
>>   GEM handle, the DSP virtual address and the size.
> 
> Why do we need two different operations? Can you just pass the GEM
> handle to the IOCTL?
QDA_REQUEST_MUNMAP (RMID 5): The DSP locates the mapping by the DSP
virtual address that was returned by the corresponding MMAP call. This
is the older protocol message that only needs {address, size} to
identify the region in the DSP's page table.

QDA_REQUEST_MEM_UNMAP (RMID 11): The DSP locates the mapping by its
internal handle association. This is the newer protocol message that is
not supported on older platforms.

> 
> Also, what happens if the buffer is still in use on the DSP side? Will
> the DSP crash? Will the whole board crash?
The access from DSP after unmap will trigger an SMMU context fault on
the context bank device. The fault does not bring down the board but
might trigger remoteproc to restart(I'm not exactly sure about the iommu
side handling of such faults).

Thanks for reviewing the patches.

//Ekansh

> 
> 
>>
>> Each request type has its own argument builder in qda_fastrpc.c,
>> documented with the packed argument layout the DSP expects. Unknown
>> request types are rejected with -EINVAL.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c     |   1 +
>>  drivers/accel/qda/qda_fastrpc.c | 119 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h |  34 ++++++++++++
>>  drivers/accel/qda/qda_ioctl.c   |  22 ++++++++
>>  drivers/accel/qda/qda_ioctl.h   |   1 +
>>  include/uapi/drm/qda_accel.h    |  39 ++++++++++++-
>>  6 files changed, 215 insertions(+), 1 deletion(-)
>>
>>
> 

