Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118762F6183
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594221; cv=none; b=ulgz+s3IBCRbBxLZGX2G1OE2co9qOaw+2VssHrS/cJ1+EYnnE4e/J2+mGUjCXV2XvXsYY/iZeaUub5j/kRb3VsFP86WjFfnI9OiFRqScuWbpiOz87wZnCtx6TKluUdN52OlMVErW/44VJkJXPVyAvEdPTBzuDqPyvOwi4NH1uRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594221; c=relaxed/simple;
	bh=mQiRzhVPiTBI5fhfG5QlYmYGwxQKVPYJzIQfa/KT8TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch6I0J+avuhYeOfrOefdhCX3HIbHqMUnN/PFUsBOBHyB2z9fjzBVwh361+RVNmloCWENVDi00dcu66qHSTYTEHH67ruUGPxlTG2shq8z1D93B5Pizkr2ah+N6aqMWqKMVEPvBvTXjXNROILnAAtJFX3y0UZWXG+wOdgZtS47JiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDGZCW8g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnCZuVdV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDGZCW8g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnCZuVdV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1AxRUq349136
	for <linux-doc@vger.kernel.org>; Mon, 1 Dec 2025 13:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ctg+o1lzozlYykOwrPvWfRQts5DzAQREjfwDpCaJEFg=; b=KDGZCW8gOwA5z+dU
	7p+aW47KzL7MlgizscFE3966je9YM+dpKsgar8MEH4sqByEgwL1+J9jrLXceq7eq
	TJyhdYKf6ye20fCWdgnOBcNlFGwctx3HiccJhjUkRyJt+KIm0lCS7wAIvbHeP6bh
	/Pa7jVeOs06DEfVzCkrsO13MIyQFBguVgVdkliy/098XcPRVkPHHAYxFmE/B6GVM
	t13lR+epDg0uX8tjgzql64RjdN73HxOp8jPvCw4sa1f9pM3hytFoT5xKqAHdLfGQ
	bTasuVEGwpElWGthBheU5BKFllo6tc1TJmeflm2de/0jH1KQQvlO1Sx/9h5qYmlb
	BBOhCg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9re0aaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 13:03:36 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-640e5edbce4so710502d50.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764594216; x=1765199016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ctg+o1lzozlYykOwrPvWfRQts5DzAQREjfwDpCaJEFg=;
        b=bnCZuVdVtyAj7uSPNiP1p5+YTo75ZMfeGGDSosvpGjZSmpR3ZYRb8RKhkv3NGWA+n2
         xE5QEjTrmQAIm8hZY4cGvQHdP82ocAq1g0XHWo9OKw9im8OA/Wn585+0js3981/XfFuM
         tUrT0aGRLYkgJ+cxvemkCp+r+NKo4PC6lMsCzY+wtmpTHjyUBylxCB9VhZmD5HElgxfL
         uILgdI9ILmGwRUQRVk0tH1dQvFk/bwEtOj4oy4Ao9D74/4mWJfF04xO9eLvLpW6jxLwu
         hjNq0ZikDETUD9XXbvt6RQ1SjQBJq4ApPzJ4RgF6WXqZEQdw+elpQljF2Jyru4WikMP6
         Fo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594216; x=1765199016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ctg+o1lzozlYykOwrPvWfRQts5DzAQREjfwDpCaJEFg=;
        b=MECw1aB44vLd3xKN94Lj+gQ1xKjAnlei3m3c3sPTKxl5qcggUJLEw5sdvfEyh7rGBF
         PfPql++Vz3W0E3Q0oGb47PcxVv7uzcPA7KOZy8Tkl06oVBpbX3s73gqHqfLVw2o7oD2G
         mbOT96mnlztb46AGXQKW4tAIWeKXn4gk7hJF9WeSFQgLcXtZgiw8jiwPyYbmDCM/bi1X
         fQsKFHcZqYfnYlxTw1yIpelrtKCZIRNm6I6P1W6WA6pVIYgVcBOSc21IvvM3m8a6Uu2d
         iqu0Y6a6jHTyhnOix7McMPXQ2ibmdeq18pXxkNtabdrJkpcWp8Zs3v2Y4Nyv0l4NZh6L
         JLhw==
X-Forwarded-Encrypted: i=1; AJvYcCVrl3hTdgNLmNJDWo/21XYs3UZTEQkUPoO73OYVW0Va0GM27TiOqnQOCFOaqKCqGg2Mu3w1tBikNnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGll1n8VDrVOTlUCskxjw2Mpxp7kNpzybGyAPq7T35ButiBzY
	08+PK/F12RRFtEy1BGUi3Y9cZZff01AwfDfLeRiozM7ipQKL12XDORRYNk4ulpEjOwFAbP2Up9K
	Q/25MAYIJgID5vF1kLkoRIF8XngGOkIbqJ5UaFLlRkq4bD/ObH2TudkI0cGRJHCw=
X-Gm-Gg: ASbGncstgAdVRvAPS5kJxR/YsiSUTcXAO4YJFM+7NWNu5IEuqEdwG9J+9N4jxcu4uJo
	p8s/cfp2oRW3SEJdZcImCs6lOl5jVUz85YFRWkqz/yJ8NmvgW3KIYCZKx+rXPzb52wymYj62Sww
	wW2W1p1blnoWFopwydTx12CHyMo6oGbrIwsP6tPt9rDG1dtf+Mbi9lDyxFcLHSOezPKBIYpTe7Q
	jhxZJwhxOs5doSUKzYe/dENYVb2juZ+zeGeNHj55C4ETfMpAi8yZT7ZG0UeFLkK4cCxUEu2oM2M
	Cf1iNH0fAbSDDcRdVP7/kP6FcSMCWOhkA8MfvggpsyBUp5DsPQSHYYIoCISBsHM5uFZOsCP/vkx
	nUVBvW3PEVmW4zpldUBRdwREtMy3OM0Hwv+Dx3brxnza+M9fy8diTXiSrmFXvDyIAuPc=
X-Received: by 2002:a05:690e:154d:10b0:640:d0e9:1d7f with SMTP id 956f58d0204a3-64302b44480mr18940981d50.3.1764594215445;
        Mon, 01 Dec 2025 05:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqMXMDUrIWgkKWxZqcL0dH0seGl1iVMJGPq0rXLF1jLMt1txAJQwrRO9ii3mNBnFaFb49pNg==
X-Received: by 2002:a05:690e:154d:10b0:640:d0e9:1d7f with SMTP id 956f58d0204a3-64302b44480mr18940933d50.3.1764594214730;
        Mon, 01 Dec 2025 05:03:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062709sm12436798a12.35.2025.12.01.05.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:03:33 -0800 (PST)
Message-ID: <c15e156f-fd11-4d38-98c0-f89b78044407@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:03:31 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/11] crypto: qce - Add support for BAM locking
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-10-9a5f72b89722@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-10-9a5f72b89722@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNiBTYWx0ZWRfXwam+Ujjoiw83
 QnLche2+xNvurHrWLDYmYxtArdYSshLdHrkOVYKtI89nSaACCu9v92MZorw9uImSFqdQ2AddTbn
 55vi98bdwUXPGm/+ZBa/2wqXKmTHodWZzncl2Ohv3wsjpb17DZUqOqyWsrgr7h7VlnCase1junJ
 aVLrI3GMTKVgrD5e7C/Kcm/V2aYEDWw5ueCszDANFa+FH8/F7K0U524D+1OBbsBo6wSsdGH/p9r
 C3sIhxY6f1dWszgOcE2t3u0MaUM+LXOkqkMGi7oNASwPYUcOQpX9Oiv3wNOSxy5P215alZI7mHR
 q8nJqiNCV9wQeQNHougreviTq8G3z+TBTprsy+to0kEZnDSxnNSI2MzzFaa8f7u78VNJhopKNrw
 ko7KqtDJ4/VG7dLkYEt/hVdpowSvtg==
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=692d9228 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=SbnQZzZDCDfwX-qd_CgA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yc7dXXIoVxGktw4vfy_9rT3OYB_EKrWV
X-Proofpoint-GUID: yc7dXXIoVxGktw4vfy_9rT3OYB_EKrWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010106

On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Implement the infrastructure for using the new DMA controller lock/unlock
> feature of the BAM driver. No functional change for now.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/crypto/qce/common.c | 18 ++++++++++++++++++
>  drivers/crypto/qce/dma.c    | 39 ++++++++++++++++++++++++++++++++++-----
>  drivers/crypto/qce/dma.h    |  4 ++++
>  3 files changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
> index 04253a8d33409a2a51db527435d09ae85a7880af..74756c222fed6d0298eb6c957ed15b8b7083b72f 100644
> --- a/drivers/crypto/qce/common.c
> +++ b/drivers/crypto/qce/common.c
> @@ -593,3 +593,21 @@ void qce_get_version(struct qce_device *qce, u32 *major, u32 *minor, u32 *step)
>  	*minor = (val & CORE_MINOR_REV_MASK) >> CORE_MINOR_REV_SHIFT;
>  	*step = (val & CORE_STEP_REV_MASK) >> CORE_STEP_REV_SHIFT;
>  }
> +
> +int qce_bam_lock(struct qce_device *qce)
> +{
> +	qce_clear_bam_transaction(qce);
> +	/* Dummy write to acquire the lock on the BAM pipe. */
> +	qce_write(qce, REG_AUTH_SEG_CFG, 0);

This works because qce_bam_lock() isn't used in a place where the state
of this register matters which isn't obvious.. but I'm not sure there's
a much better one to use in its place

Wonder if we could use the VERSION one (base+0x0) - although it's supposed
to be read-only, but at the same time I don't think that matters much for
the BAM engine

Konrad
