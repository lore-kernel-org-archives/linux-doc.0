Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D962FB99E
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755127237; cv=none; b=RgL9ILHcVrbs5R2lS1KrNrglQI32qmNPdTZzU9g7UvhzaVvm9e/1Y45uR2eVo0yYFuoMcm8svDjZvPY0bu+ytjYhvtPdaaKGbGuk0P1SQsGAVqtdJKtueKtbKuAX/rU1REi70zYuV4I7tyjRVzzD3rZFgr+F3gZ6emQyMkVe1kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755127237; c=relaxed/simple;
	bh=K41reef5ANbMRiF4uxfGDDzVnXCjuA+uPaSg4T4I0S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra64lvoprWvEocfn22hYI249GPdTeQEnkRxH72KBAQt2dfHuzfC69ANp8Ce7oPbCz38EFV3y8PpSFYxvm35Zd+leJZi9OJ7zb9sZL6vlC5xZhXhzcqNrrg3fubo2Xpl4DLDHl1cXcfpMP/nFP9C7/NnfMOLODWMPnAE2Y3avqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUr3CSHf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUr3CSHf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLvam021102
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqQ5LAlEsNqEJ+2SlpIbhfIckQ4duQR//L6MMCTIFNU=; b=ZUr3CSHfaxYU7N0J
	LwQg1xZ/rtIGFfgOgxl//7sS/0lm4Aj5yk7ZCp2DrOeQnltcqlalw/MjKgKXJmB+
	oR6whs/bwSNoSSjCUsRBmrqLCuyYyseg7WuKg2byxi3NUBFU4hAcB1Sdee3KVWPP
	crdL2t/xZelR9gxtErvlVatGaPVfFcMk+mzQujkhNYImlwRCBKmehZkMqLAxIAXM
	ApjsmvSP8+P/Lhv6k2mBaW7cR7600sun5hZnVYHOR82/Gm4jqyUqYAyyrV1fU002
	d28pwp6qqgU8yccOV33hbPzippgHDkbiotXdJ726hvXMeBz1QTAZ/E0N0QmBMdb2
	A5tNZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9swsdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:20:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b10a2d8423so1010831cf.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 16:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755127233; x=1755732033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqQ5LAlEsNqEJ+2SlpIbhfIckQ4duQR//L6MMCTIFNU=;
        b=eVr3rfej1C5q6UQH3f0LYqi5gcsy1sUzNc4KdbpaxeQ0846+ZKyYoVIOWJ8e95VcCI
         7yXTZjPBrLFM4BFVpR0e5W3qL4DAxs8n/d5qd7HhxecNI1z7IT6jw+4b4yqu48HVWHLc
         TpKiNMCZ9YXGbrZLAL8WfpRPqywkNeSikOAgfyupF8opn5vfZsNqQBkOSgAyloaeYYGd
         UnQZcC8K/vJYuo4Jozr5VBF3039nC/pcMIoAmo0l4kgJN49ap36l0VNvK5fdWXQljm88
         UOOAE+A1lL0xl8k58CabZOsKuapILlit1HOSHzRaxZnFifaUJ0uKSFbjJm7ZQFZLUojM
         n7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhJHj1s92R5ripLjOFBETDfMEHiTTig4DWCz7ejlXd8Sl9DYiUYQpGQsgxJYXvODMkq+ZxgM27KpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/LnkKxxOAfiqc4HaOEh1kMbH1y9eWLnUSVVar6IQPGeeYSJRO
	ZmzijgDQMWfUyE4uAJFr89XOVsiwCvHbGfpPMg4nDTGvQTKp7RxWPJOBcVhbeJolto4Gy2tdTyQ
	gS0usZ9QYaOcspNSvtaLFfbr69UW8thbNR7h2tKX54B0ppVoAuyyV8yV0N1xssvE=
X-Gm-Gg: ASbGncuVIaaLyuz4pN81ToqctroYYwXoeHhyB8/VDXG5UF5CVR68Fi3adm6PKFpMkmq
	K00PasR+nzHO7oRYgO4ZCYgxxh01kwbEkKAt8IodAQz7avD/zW/SroOENlV59L3gSFEFSgR1ujo
	fF7hNziF6rOA1stk8lOSlFiT/LodpDDpHPSse5mBDwTzflaTkfu1YnO1xw7r1HkAJtveU8PH6G3
	3nxo36yTClPpie1i+rwf/CH2YkB4UEElgcJZ1xue2qlnoS9NHXDj1A/kWf7Shpw/VADBq5DXaon
	l0E5dcA0jd/Z8vDz8Cfjo+RgF4imqBheovEKMuq/IsS/1T52rGW/kLQPuj5DgH2XQX7Jdw/jPUJ
	lFPq/VIJLwF9MRliwgA==
X-Received: by 2002:a05:622a:11c9:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4b0fc7bd280mr35472021cf.10.1755127232850;
        Wed, 13 Aug 2025 16:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEerwHUOumqAcf494bszPPlRc+za1y06J1v7a2/RnRceuUSxkyYhtRk1xeTG5320KKmAVxs7g==
X-Received: by 2002:a05:622a:11c9:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4b0fc7bd280mr35471561cf.10.1755127232170;
        Wed, 13 Aug 2025 16:20:32 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a9113e40sm22753076a12.57.2025.08.13.16.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:20:30 -0700 (PDT)
Message-ID: <8bcb37ed-2885-4f4d-abed-5dd5ec6a254c@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 01:20:27 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
 <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
 <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
 <87c884ed-0975-4ac2-a0fa-16e830a57c72@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <87c884ed-0975-4ac2-a0fa-16e830a57c72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d1dc2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=frUY0QHmMtcHLPOZDgsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DCTzzRIf5z_s5iIIqzynvWxxbqmdb4YZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX93B3ILM/NOOG
 nUU3RYPZpWCdt9R9BJMtMiqRhTKbV+gZneYor4sihAlYdd3xVDxXSyes4g7YEE4MHMvxnSqILo1
 yOeohZogQckcx7L3CEInkX17cJNEc8Sc/rcibtyU1KF7K4meciwwciyCeMcP00LAlBLme809aqt
 PqTfwceKIoLS89vxACLsD4ZF4CWnhL1sTvwPzHiadoGdD0/NDCJnUXeC+zwAWAXsqbZSWQJjBTN
 e3DsEGylMqGyoPP+z3zPxWsudrd5fWWR5//tpUrIUFMrj5nRSz1OyIPuMchEN5RAiMIjtMvKgix
 WdI7AOBfGVPTDOGP907Oi+L9V0CpchZ0iS4cmo2Qz58vet9591/zXNBqqD7ET7Z9VXJ8BqvDQRs
 mNv4qyJP
X-Proofpoint-GUID: DCTzzRIf5z_s5iIIqzynvWxxbqmdb4YZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On 8/14/25 1:19 AM, Amirreza Zarrabi wrote:
> 
> 
> On 8/14/2025 8:49 AM, Konrad Dybcio wrote:
>> On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
>>>
>>>
>>> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>>> Enable userspace to allocate shared memory with QTEE. Since
>>>>> QTEE handles shared memory as object, a wrapper is implemented
>>>>> to represent tee_shm as an object. The shared memory identifier,
>>>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>>>
>>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +/* Mapping information format as expected by QTEE. */
>>>>> +struct qcomtee_mapping_info {
>>>>> +	u64 paddr;
>>>>> +	u64 len;
>>>>> +	u32 perms;
>>>>> +} __packed;
>>>>
>>>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>>>> TZ will always be little-endian, regardless of the host OS
>>>>
>>>
>>> I'm not entirely sure how this point is relevant. As I understand it,
>>> the core that populates this struct is the same one that accesses it in TZ.
>>> Your argument would absolutely make sense if the host and TZ were operating
>>> on different cores with distinct architectures -- such as one being
>>> little-endian and the other big-endian, which is not the case.
>>
>> CONFIG_CPU_BIG_ENDIAN=y exists on arm64
>>
> 
> Or, you are saying we may have a configuration where host is big-endian
> but TZ is little-endian?

I was indeed about to say that.. I believe our tz is always little-endian
but you can run the HLOS of either endianness

Konrad
