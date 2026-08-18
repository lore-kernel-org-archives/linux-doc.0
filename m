Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F0A27FD74
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032457; cv=none; b=qGRX8Q7TIjU0TmwB5S91rOtzQ9nhJYq/hQNrqnQzEqAZPIL+KARFHGSSCPekY7kYql6k/F+SX+pF+pbiaQOKBAGarGkB9bFD/oZ6KT8EZ1EqXQTE7hdYhWhu4ROtecJX5KrDhUch7hCc/C1x88zoBLUR4bguzGAJDrReCfWI+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032457; c=relaxed/simple;
	bh=GosCLyy1/VLuOxPlTGn0Ls10HQdPNBqTDEuKCEOC9lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UoN1TcpGIgMDj3TA8MpMVIZ//mhAcMkFaY5bxohgIa/h43QrBKG0nce1mdfygCzqL7T1mtIBmW71INJLCzHh/Zel69/ki61qFsUX1jn9FOCEpkkCp+kfQbkZoY8xEaX+qsEuKYrx933N5nVDwZA6gbA0wKdPM9Tb+dRwli+CTf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrbmFUAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btr4bPQT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrbmFUAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btr4bPQT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I52GAC3464543
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=; b=nrbmFUAASt8pesrB
	u6WXz3wMqamtjyeAym9VEQ30v6hrhOpqNHLRXUYW1z69xos7AnS5/aaIr4VCSczG
	2hUyBz7eu41USoVjZRxHSV1xEdUrpHXsUMerp0kOsHW3MKOd8F7PuiLIRmdfdFMF
	tEzdmZDbZOx/GPAPsRbBnqRa+7Ju90vC2pfkQfnj76wXlM+/ZF4vXSCDIcFsbfVu
	ruQQdsAJ8IFCQ5EA450ikk6EUspdIKiobXhzSvQCBGFerd0bZfdwoHz4Hb6k+3mK
	2JmbjRf6C8qC9vAorkSv/A42ODwkMaZRZWjXqkTjUwHinLZysyNdsyl0lxFjjXSi
	MwL3vQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611ayqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:54:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso7435044a12.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 22:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787032454; x=1787637254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=;
        b=btr4bPQTW7WbWGuVR+uOoJLisz1ii7/DxIOSeHNWtvPVUAp57ce717PTTnvDn5nBUn
         yXdmEe0aaSo5l4VTuHqT2rDLlAa7kh6iHKk+ZpsJiiM2iCAEc6VYIj+7UDClJjm798QC
         NzR5jaaFqTkYP4X1VDHWQpyEz1ygLr4Utp+6Kui1CuU9QkJx+1cQPM1dh9S41L+t6UwI
         hAtH/jwRMAERtKIb/LCV0yQ7tQ2pHbHgtmiSm6L8jkGVyfLy1vOvoBSd00kfE/xqiy8B
         zxphmQzYC4DkLFtxuzKqp55lydUybkLJF2soGjuQ1YXAQ4nX6qTn6caw6HXRQNeDSIY/
         gltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032454; x=1787637254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=;
        b=RbFGnNlEVg/P3yWgEkNBfK9mu+ginMNhv3tJsd5iXddjeDPq783V4Fj91i19h4pKSj
         dJ5EYYLtYWxf8EYUGiUD/MtuKlkI5WGXLrShNuRv8O6w7egSXiHn5ptrioCau/RsGC2h
         v3tM6E7JRE+IDvxWsFLu4C/4GZPxLFsMm29+7d1ErNUyB2orYnZ1BFYnBLx0laHVYQ+a
         /xPb6FMQjfRDJZMomGOJrQ2lVCPbMtB7gdb5EknR949m409h9CuO6WgmlXAYvARLuw1C
         lH2U7H+HqOGh42XKQ3iyMfd249R5cSEOUYotiNvbzIfBNLO8Vcxv4IWMXmfT9EBmaH+H
         kjBw==
X-Forwarded-Encrypted: i=1; AHgh+RqhmX/whIGXEqKDVaWnj81ZoKZbxgImrPnBo03UB093K9fV3M62YQyex2D8dl3UH+/UMbzmK2pBCuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaoVVSX3oDnZV9ptVEHh/EJxAkt+TAN86AQuXCpFXJy11lr43q
	GLSHaxykDsG9McTKtZpgd8rKX2UddK1aGVjS+ZJGPNJ/s88KjXF5n+8dvQwslEmp3XgT1fnKBHT
	vHCASnuB3uKQRn7Meb82ha5PBAgZ4Ge6tLQdsfdggeouQRpkb9AIgzZ4y+fOWhAQ=
X-Gm-Gg: AR+sD12QyP/BjI712x5fkx9n369azuiLBOU5a8CzJ3J7JZ7c6ucU5LCDa6DVVDT6dtp
	Yom9iqYpDy8+LiPOnJ4yMQXNLFhtFviF/HO2NeDScNTEOrpGATgin1fkaaJY4TG3A5vPVJx7woJ
	MOiiLT5haBs0XrSLBUEF7L3sEdoSQhHYBJlnZzkNRgCXAW7XhaX2BlVJu4RoRPze1LHcgwwr5/g
	6LFE+qT+01HNCP8UmAE42PeQNdR7d7JYmN1Faif0d5WBGK6RmCn2fgLgM3F60O4bsnfuRaN8K5s
	0eDyIP33KS7wPz6iyYlYIashx5RldPwO/MDIwZ6ZPUSRc6k26c29/rHk6v1xXWfOTYANzTSF1ZI
	DyT2ZM6EztGBw/peSXWTEZ41HZd47Hw==
X-Received: by 2002:a05:6300:141:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cc71b19c7emr37663912637.16.1787032453945;
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
X-Received: by 2002:a05:6300:141:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cc71b19c7emr37663839637.16.1787032453547;
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13bf26a0esm1592712a12.8.2026.08.17.22.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
Message-ID: <376e0fa0-c863-45ae-a8f8-6d4b74ef0b8b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:24:03 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
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
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
 <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iCaID2Yu7wP1OvKhiOyhOtgHPb90JtNx
X-Proofpoint-ORIG-GUID: iCaID2Yu7wP1OvKhiOyhOtgHPb90JtNx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX8SHSF//pth05
 BY8tSYjUfeLzZqWZoD+QNtwuYeEoPinLQZMovgciNpL7jiq1n6gts86DDkIGm9FkL2wLq5VGRG5
 /sRg08/kl6nlLhVbOHf90NbJBYMrGAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX3TJKfreicVZo
 Lmc0xm4OTrUZscBGjozqOxOR1xv8pnQl03XiCSAEh4O1W+PlqbZABCiDPFHx2RG8vYmM1brCg3E
 GAvYEACx4kg//Fko2c2P4g8N1xLCyjvfi7hg1Dn7Pw23FGDlgL1ongf/5i823qlCMq9KNt1zhUi
 oXzMYsNB5y9bL9pwvMZh9APe4M7/73CVKQTovoFoIbui1XgF+ANBSzkZpVNKHDvEP+7sXloKpFa
 8mJB5f1IjMlhb4wR39SIi/AFnuBB4bvRIW01Xivppx8mM6GGFa88QflOj5ks4QST7uOUvP3b1mn
 mibXZ+DhDsVWYI1PsOJWGxyHvDqZM5llBWH6F+J/dWueBWvQwvwOeiXDyxw5Ag6ymRxECBXC+Ps
 eJitXiPFIXd9aIe0gWsAw2Gv+8csCQdtaHwbWsMAM8iXVGMUCnjuqXrd0OCktYT1fJWultt3sZc
 7UXnpLK1mP4/iCE9WpA==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83f386 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cA8Zc-eO91vsJqbwH70A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180042

On 18-08-2026 09:19, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:45AM +0530, Ekansh Gupta wrote:
>> Expose two new DRM IOCTLs that allow user-space to allocate DMA-backed
>> GEM buffer objects and retrieve their mmap offsets.
>>
>> DRM_IOCTL_QDA_GEM_CREATE (drm_qda_gem_create)
>>   Allocates a DMA-coherent GEM buffer of the requested size. The
>>   memory manager assigns an IOMMU context bank to the calling process
>>   on first use and performs the DMA allocation against that bank.
>>   Returns a GEM handle that identifies the buffer for subsequent
>>   operations.
>>
>> DRM_IOCTL_QDA_GEM_MMAP_OFFSET (drm_qda_gem_mmap_offset)
>>   Returns the mmap offset for an existing GEM handle. The offset can
>>   be passed directly to mmap() to map the buffer into user-space.
>>   Imported DMA-BUF objects are rejected by drm_gem_dumb_map_offset().
>>
>> DRIVER_GEM is added to driver_features now that GEM IOCTLs are
>> present.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c   |  4 +++-
>>  drivers/accel/qda/qda_ioctl.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h |  2 ++
>>  include/uapi/drm/qda_accel.h  | 36 +++++++++++++++++++++++++++++++
>>  4 files changed, 91 insertions(+), 1 deletion(-)
>>
> 
> The patch LGTM. THe commit messages needs a rewrite
will fix to commit message, thanks.>

