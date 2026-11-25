Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597664;
	b=bwUXPQppVITHQeIqbjIi2rlYmMTxgTbV2VfxrE4qAb5nFu1DwpdKt7+fnORsZRYaa5hH
	 igQcJm9bamo6YlrJuwItaWAf4ocCcTMSN0s7K7jqrfzEBP+S4Sft2nZ61DlgEVBHOv4y7
	 eaheW4r/bjSbBrqBHrzhzBP9vRJcMFQjYhX5MQ+hlcXozjXod6r0MsvFDBccEFo/QPfAo
	 lQnjFzN2p3y21nh5PSBtV6Iv2lyVo0yzqZstJO0qUOIPhLCTrQboW0VXQKDI9ybtKn617
	 +E/jU9S8vcFZ6s9R+9QbSnVR7S+T6V2Y6GcQnINDqzVT11CHLpTdlPm0Pbf4DEjNY9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
	b=sGtVuJS7NYQTHH8w0PscPExzKF2tvIO4PGcM+2XS1RYYwJzegvplhwaxyxcchN3vqm/T
	 LMSjZvzhyA5MYwBDI2gHAAZgngwibs14L46tuy/HvPv10lamY7LBZ23LOmvFJyKCu0XZS
	 d7SlVeVwwtq6fRroo713aGE+3D5xscZ6J+wyH/KJJB+NFVa/EOB19BAUoJv5yWtoVle+B
	 3eWETY7ihSOcxsBiu9jrJHMlmb7AImN1Zg3vqBY+IeF4m9LrUDQXBPYVWrxPxh7cgZLss
	 33bMyRJoks6C+EWhu2N5mlsWYK4jTIOqbH6XkK7MlxZSNx+6retOrCL5k9b69CQlUqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVD3cgM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsFTBxK+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF4606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 09:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CF4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVD3cgM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsFTBxK+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Tso2629342
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 09:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=; b=fNVD3cgM34B4gPxT
	E1UqbEwqyXMf9dZr+DGGozrZkWlcFONDD6cGM2JkGYqO9/bN3M64ZdxQ0+BARvyj
	XoczQLcRZRSqn+nGcdiYOg/KuvnLOs/A5sYUb5EN1z7a510KT60lCbOn7GoXZcTM
	TaNhZuaFdGpMdGaAXxaCim3lSN79hRU2/5mecKERJQ6sCXxl1ROK55hVV2D+g2ca
	qIQ/nu6tJB2cDnftA/Soz6CN4mibqYo27PkPA0wjIv1AjWioQwjQrjfMzunBsTlm
	nSnrfn2azHJTxjYXLnhEbnacrUKG41A0lu9e/jLl/Lm0m/Tb9I5vEK9//y48285x
	IVAu6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydb9wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 09:07:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so7631448a91.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597662; x=1796202462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
        b=MsFTBxK+83n2e4QMK2DxegXkTEhwoWNmHziRSIbPClvRYZBQRt7LTJXpncT15ykS7h
         boW2Rbr1M5ym0W3/LLMUJW4Nhr2LnJ61hXRQgnRq2wUYgH/kifxjulkgAWSdSiGugHmv
         zxSxI8QahQQ2IK1G0BLNFZn+dV/OsDjfW+UaIoC5hz4CqChiA/MAwha6KBBo0KY/Y6Rp
         EDfSD+YecsdgjFFsxpEnCofJLw1Yjk4EWOF4Wnm/1aVryCyH2PJesOTlG1Hj+w/Jh5p+
         RQXOZL35kb64lDMIbfyfDWZsjBvntp2t10z5IkFNMOuevcmr84tESXeAhlF56VUUKrmG
         k06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597663; x=1796202463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
        b=Md0RO/9JbbvFqxVBrOzjg+Gd42Kqh/qW9PwQYPHHg6bY/vuKk+97WXdJ/NaMQmyPgi
         aOo096R14c42a8WkQvr6jyRU+wH6XHtcGIg1pzrqDg/RvCC5tIUP23ou7fD7aw4rDQrD
         /qPrsfpOAh+KOB1c4FHfanHuA2dSKd5lRpItoPiWSzpA7WPOp5TflfC5k6H6pmY6LD/S
         uVVbYIa6fc9MCyFqbsRReh98Z6S5mSHRdtUEyvutkvUmXqcxSvSwLldUU7PcW+0cPBqz
         NQubT/OUzWtKeSuRDMmWiWMwHxYTubySm/BjIFA2EGMKpqPEM1NvU8BleAUcXeO1rdFH
         MBWw==
X-Forwarded-Encrypted: i=1; AL+hErHaRxfjEvIUuqWeZLL+Nzm0kivn1FlR6DYeK/Xb7AUjpSveE3NznenA4Nc7Sst0hwAmvzJMNoOiziI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OerDtj2+XJflqSvZn+RRU+qEwf6+ckJWUAHoGDifIqTvDUeDf
	x18eGcGxN9yOFtdo04VSFuQcODvd3BEkeE6G05wOuITbfkLUG/U3diK19N8avZMHOFILp1o54mh
	kjeiLzMGsB+QdUqFuloC7Qp/Rpgk+ZJ5K15t/iNym5IOhbbsucGJmBPHAR9Tnm0A=
X-Gm-Gg: AZFdTZdfYjy9UaeDdQ2Ym9MccrVPUmOeMoxVEUR9OVjlOSdMRCKk+x6ie4Yr3i8QUsE
	9oD8qgA+2SBRr8XiLPLIws2DhfXJAqjtpX7U1O3oiTdObuLQ7PRYVtsASOps3Y7e6Lg0h7KrdzM
	6bm2A7TJE3GrLw5sAg+vXrETT9gmH9odPS41fmlmLWvrlpG8ExyWBS798ROh9RM11+Lg6HmzxD1
	Ac6KbGw88Ut64nHSlqqj48fk5JcieByrVU3CyRvun49eJzAqci37eVOGYWhYGXZ+ymf72Tplkjz
	khzOt0rfr6pi6lTeYa0YniMyvUTdv8Oyj1Ap2KOm/x2BWzef13wY2M9vP2oEMDGUV88Rq2IoZoS
	Mel6ZkKwjdV0OK0yY56kDhMy4xLafKbA/9AAjW93ykGD1ITEctJfExzEYTACj+EcsEQ+JZSFsLA
	82
X-Received: by 2002:a17:90b:4d89:b0:3b4:3c33:3e5d with SMTP id 98e67ed59e1d1-3b43c334caemr8256634a91.67.1795597662532;
        Wed, 25 Nov 2026 01:07:42 -0800 (PST)
X-Received: by 2002:a17:90b:4d89:b0:3b4:3c33:3e5d with SMTP id 98e67ed59e1d1-3b43c334caemr8256260a91.67.1795597651179;
        Wed, 25 Nov 2026 01:07:31 -0800 (PST)
Received: from [192.168.1.12] ([223.230.5.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm25769550a91.7.2026.11.25.01.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:07:30 -0800 (PST)
Message-ID: <42920cf2-1587-47a9-a53d-d604bfb22b76@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:37:19 +0530
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
Subject: Re: [PATCH v4 23/25] accel/qda: Add DSP capability query
To: Arnd Bergmann <arnd@arndb.de>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
        Jason Gunthorpe <jgg@ziepe.ca>
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
 <20261102-v4-v4-23-88f2f24a5f0b@qti.qualcomm.com>
 <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX7+waG2x2/xjt
 EKLAv/1kNGWCMXmxntq3RFx6///8vB+OCnLnN1L8PHcoorPm2Kq88B8mD0Kt+oxU4IOcjJfijbo
 S20fS2V6WEZVGd2WkIWmRwnYVvGH2qc=
X-Proofpoint-ORIG-GUID: CvPs2aGQ0drst9muvGFT2Rq_gKYxGQhE
X-Proofpoint-GUID: CvPs2aGQ0drst9muvGFT2Rq_gKYxGQhE
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06a55f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=7CQlB+x2kvO/AZ184d7fkw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Uvs7DDoz1aZytBm4-AQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX2Uau+3Ahdyew
 HDR7NuYniFTGO3dkv0d/y4HLCMhDHn+dJ0wR6D5Dov7OWFbw9Wg3ed+7eUV2yHRbYzLuBGXImdL
 b4Ec2c0H9nBct2yNnggJRRQFw5Z6Hi4PQupYJRb4bhL/9hpMDoVx38/4xhFDNj9zhbtVrtY7Kt9
 V3XTpGSwFYGPAdaA0jwtiLn6J0jTwB8blvsLViPVD9KDFNJAkI69elVdsjpCydmYd6+v5lNsbgm
 /ej8PuTimr7+B9kDkgrIpRHs9iLnd/X3qB/iL1zawTaYrqU6TERKlqIcDFPOAXPIK5RqG2O/0wr
 n7mXQAiZEUoro17mJR12e5pGIWce2hWt4c4R+fNsIeYwE44SvgyGSq+B9TPBr0U4NoVRyt6FQCE
 orLC9mtQiJpRx2qoKdQ5s4/vKE7WYNnWiCE1IKSTYoefjienjpLWwlWS1wR9ipRzQE5ZnRLrVAc
 vO1NgwCh5skGGP7sONQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On 02-11-2026 14:16, Arnd Bergmann wrote:
> On Sun, Nov 1, 2026, at 23:21, Ekansh Gupta wrote:
> 
>>   *
>>   * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
>> - * based on @query_type.
>> + * based on @query_type. @dsp_name and @cap share storage, as only one query
>> + * is made per call.
>>   */
>>  struct drm_qda_query {
>>  	__u32 query_type;
>> -	__u8 dsp_name[16];
>> +	union {
>> +		__u8 dsp_name[16];
>> +		struct {
>> +			__u32 attribute_id;
>> +			__u32 capability;
>> +		} cap;
>> +	};
>>  };
> 
> I think it would be better to make this separate ioctl commands
> instead of a multiplexer for each thing you query. ioctl numbers
> are cheap, but complexity is not.
> 
>     Arnd
Apologies for the delay in responding.

I'd prefer to keep a single query ioctl, and likewise a single
SET_OPTION ioctl, for these reasons:

1. Precedent:
A selector-based query ioctl is the established DRM/accel pattern, e.g.
DRM_IOCTL_AMDGPU_INFO, DRM_IOCTL_AMDXDNA_GET_INFO,
DRM_IOCTL_IVPU_GET_PARAM and DRM_IOCTL_PANFROST_GET_PARAM.

2. Extensibility:
More queries and options are expected. With one ioctl, each is just a
new selector value. Separate ioctls would mean a new ioctl number, uapi
struct and shim mapping for every small addition.

3. Safe evolution:
Unknown selectors return -EINVAL, so userspace can detect an older
kernel and fall back. I'll also keep the struct size fixed (padded
union) so adding a type never changes the ABI.

To address the complexity concern, v5 will document each query type's
payload in the uapi header, and fields unused by a type must be zero.

Thanks,
Ekansh
