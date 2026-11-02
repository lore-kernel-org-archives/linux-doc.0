Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611477;
	b=EZ0mqKQRD1FY3xgH+7pfpfzpxxuUxWLD0aOHaxswKjs/9OdYoJntvrHE809wdvbxail3
	 hB6fK4yyjhL4XdovGzaGSrVikd7Lo4jzYn5473m0MFxLv2eIHeOKHrLuQFBxY4TnS0H2B
	 4Sz3Kg6JzbpW1GKQWpBnK7Hejn82rWyB10q8nEwLd6BASCRmSnJTfhjsHAobO/T1B3MPf
	 jRKWDc8MuLXMFTvK3rzDx42IO3xUC38ok0Ix/IR2DtcC3SLlhXc3KhnjmSRi3AI7ktooi
	 dVmR+VomCGnZ2JWcfZipdweWRmdiXDlJsthomuftuOSFxBwIkX9UA3HkURKQsLPwcXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
	b=2Zr3Voe422aByXc4uFpt2wfIvyBVioyjK+LFmlnwFc+rIBij38Ll6V2fxSu2BbGqIPJG
	 BqYm9+RbT+SQG7x+asdlNjlRmdTi4NbkfiLweWN2DKxJ9S6ILoj3LzkTIi0MIAolJXGHA
	 /WbMKoLDHg8OV8iCCbZzfhBK/UX+wRuewgTstOUYYQOEaBnuZIsS1q82ul+fx5Xg+Qqv2
	 Ua/YDVG4bdQ/KVAPZ0KLLVj9h2Z2VI6tH7GCDTqmzd/4RErLpCy692MMyy7mw2NRq8snv
	 z+9Pe18betObLAV0t/THmNEQPzj1Yw0B8tUPgnNxOcAEhvLuLrvWFhbmLGWhYhIFH3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwR+e+7p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aFh/5kLw";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B16C606A327
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 09:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B16C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwR+e+7p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFh/5kLw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AHli2880729
	for <linux-doc@vger.kernel.org>; Mon, 2 Nov 2026 09:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=; b=QwR+e+7pNnqvm16o
	xEiVCtCF7c1/iJDndPTeiQi4VFPw/s6aibuTC7Vx9FO1PE9BxwiNf5nnCnTZvjsl
	pyIZOZ7iGinxTSqlNirbD+G+Vg08qlK8cD5yjy9vRa/w8dz5QRfroOpP7LqCokib
	8YhQ7mJ0wNeMCUCCtN98RnCUEC4k8h4vZ0EGp4uFnevCr7aZ4iOeu8Q5acrOmdEv
	8jUOtedsRYDHuL7+AsAVPMPtkqukPc7oW971eYTzHn2gxcyjvjjY3jGA7bwzX4Rp
	gdHluJtV+8mFEqru3oSaRe17fZ9bm9RZ3N0t+sCHL/EmLO0uUqJTBBs+qJNf0pVL
	zvMdZg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg3xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 09:24:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c6ea5aa1fso7637366d6.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611476; x=1794216276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
        b=aFh/5kLwNa4EtB72Qra1xHJWWv8hZw3J0SgrDnDqUbbsYw0F9ir8BJ/p2lISBKItY6
         lMKemnDnLhSCjA0twVfBVwX98B4Exv8EX2ns6zmSZarnVQQPWHXnZNuJBbB35kI2TruF
         zH2aYbCyiULwzmgXddVtU7zKiJdqXNNcqjLLpCrNjUS8Z2mNVwFSBCrkXVM/T920b3uk
         mcbiU9RE3UukrWzzUZIIrkz9nV1Yq7/JUyNOggxRHviOMxykrC6+syzflHDi3Egz2Mdx
         zZF2EUIVgD05bgpFrU+1ZkzZKKHuAuYkTLCox6JP084Fa1c8KzmxkTkHpIGEz976X2sl
         wGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611476; x=1794216276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Ud+27iM3GCSKJyViO9ZnK+ZXsfw9IiRfqvlCm4Yzp4=;
        b=2hDf2apfN3QEXNLXHcHy1zgESyd7cfPqZHQQ3AQsDkZgPOHxqOiTgrP1Y3IeKb5tB4
         mvA3sYPA7ofuyS808nLLwlFw8/B9qWPX/3DDaMGSNQx1OBqqtpBINkpRca7xaAVdK9Xn
         E/ZfxIIEH133bz4fCzPbh3n4TGatijDaI7Fw9gVcA/1h9sar9kW4JMyQNDmWJIFBGvc4
         SkcdUFJ9yOoNbR6M8YJ8CxVzJkmQmys4d6auBTgv3JVeMhfFsexV7Ztu78JXSuIcRhXA
         NfNfJFwLeTBpb74Fa9wqnvns2EAi2Xq0mmFI1/vyzosX1AYP+Hk7TL5hbQqpisL3XK+K
         MomQ==
X-Forwarded-Encrypted: i=1; AKwUvBznKqjODtxLQth7SaRIQLoJZ8VFxCjjC+F5XwkMDzIvlz0SwzsQL9VwN3qN5XkAbvb38MVmdg1ySjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0YtQ9dAcGB0RR6r3xsceKygYbd0pm5Yj70hexsIAhGGZwgkwH
	cAftEqIqjX/aigbpYnrd+btd0zcdgavZZsi471WW3X/9A/6Iy6YeuM3rpHk2Au9A6WQskxZD4iE
	bbAjSQx/r1439NKhUwQRk0Fb/GDRcd3Vv+d9jWuREztP0W7fllTR2vgAAjmWTwc8=
X-Gm-Gg: AYBFou3y8WrOyjbRlTEAKw2m28Pfzu4jjL5MM1vaw4HBjfIbtKbiAoLFxfmTCus4Oa0
	qUlxBnU74tHjRLHsakxGQ5J6MXcOq0tvdSvUWCYampHYkAhoBliVSAR9bZibr5Pa3YxMKM/J5Or
	wrDnKaKMjjXzzRLWO2PPxJz0FyffSQ8sRgC4KdOdDr28lpzsgNJRc3ugz6CvVCGYspX0PxvvsMu
	/0IM31W9osH8OiRc0gflx6RdINt8avD+RT26C8aNAr1CqLhgrGiH0FewBu+q84H05CT45mpNOCP
	HF4wqCm8peU0Dcn/nuMbhd9qkW3VoeJSac8bUCjxoamcznUfAUGMXk0lx1SpPCSo3yLkJ0syFEd
	CFW/KANkb2RYqGRjO1t+9u+1NPZI2I8FeYrJBDv3tOSYXgppvlIJ/qYY9VchDE9zqhriEJkg=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1543681085a.2.1793611475366;
        Mon, 02 Nov 2026 01:24:35 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1543676085a.2.1793611474893;
        Mon, 02 Nov 2026 01:24:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a91csm358465966b.61.2026.11.02.01.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:24:33 -0800 (PST)
Message-ID: <ab231636-67a3-4d00-84b5-1d7671d96120@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:24:29 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/25] accel/qda: Add remote memory mapping to the DSP
 address space
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-17-88f2f24a5f0b@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-v4-v4-17-88f2f24a5f0b@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae856d4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2m-AKP9SCvF1DGFPBvkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: KQGFoWBW_G5ve3R0x9-cVBBIC1GOFvwX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX7GfC1Uy6xzVR
 ZwhOY2dMgWEV1oJsq3Ho9yv7rDQhaaTFAjQ5OoBe9yfDmj8J+XS3JThqAW51HG3fYoa0JepersS
 R7AlyEOfRHA9WSchnWqzd/jGR0MdPnQ=
X-Proofpoint-ORIG-GUID: KQGFoWBW_G5ve3R0x9-cVBBIC1GOFvwX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfXykuzm257RJKD
 VYfC9aHxvrww1fQCuQ25Eg706l7K3dVvgcxOxZonpuHqXmXLNcvWEmoNxa1XLp9RQMib+X8ZOio
 Il7j8FFo2t7ND0lXTupNiaFnNkmqX2AD4/0aElrmLHx3j0KnRboOlM8FV0sHc0zNY1/dwFJJ/W6
 EJVG2RR08oXFK1qUuxCu8oH+ZSOaZLBaOQhcavXNzV5Ju5xzTXfGOWEAdpRKsXOrNv0CkjN2ZlE
 cGpWTJCIaLs1g8I2CDIQKs57wN3zUiHy2hijNcpovCQCPxhnAu2nSREKZTKuszU2YXLhm1qPnru
 JlexJXRiFqlQvhYLc9qwWJh9yoalF2rP+7TQ12NUMZxqYk/ojClOIX5G2fuQCuGHEZ5JIYpOooQ
 UpR6sLjyUpOtZMXKcLGPhi8Uc6OPDi3UT86d2Ap1ex6I20UdsvtZ0b4S849ZMPeudnTJCLi7CaQ
 mUhUkwf4Q49C8eN9aFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020037

On 11/1/26 11:21 PM, Ekansh Gupta wrote:
> From: Ekansh Gupta <ekangupt@qti.qualcomm.com>
> 
> The DSP can only touch memory it has been told about, so user space
> needs a way to make a buffer visible to it ahead of time rather than
> only per call.

[...]

> +struct qda_fastrpc_mem_map_req_msg {
> +	/** @remote_session_id: Session the mapping belongs to */
> +	s32 remote_session_id;
> +	/** @handle: Identifier the DSP tracks the buffer by */
> +	s32 handle;
> +	/** @offset: Offset within the buffer */
> +	s32 offset;

I think this should be 64b too.
> +	/** @flags: Mapping flags (cache attributes, permissions) */
> +	u32 flags;
> +	/** @vaddrin: Address the DSP should map the buffer at, if it can */
> +	u64 vaddrin;
> +	/** @num: Size of the physical page descriptor in bytes */
> +	s32 num;
> +	/** @data_len: Length of additional inline data */
> +	s32 data_len;

And same here (and in the corresponding uapi struct)

Konrad
