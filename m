Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007952;
	b=Yhl7fQEqCEOcZ43MfHiHwqjTrOmFeFMiLa7R5THib7h4dMTtD32EmTyv3mXKvYaAc+fT
	 xs57R+yuwvTb4y9tzVH6bbhqi2G3AmCQGE4crRNxvPdK5wRkurLnf1rJvmD8Bz3GyeMab
	 QuRJ4OCuzpcbhGu/O2htkLOSq6ff77u+nMUgQkmu/gUzgGgI+4MeJaCBP3hJLYN3yxpQZ
	 3BJVaPqg3AxTbnHbocOVr2TOZ2PlI7rReVvfRmHubsYwg1SNK24NxuSm7qqKg/4ZN7N7K
	 yhaDzg9vFkUKGDsCqdTOx/rv8zWDvj9llfajFpIFCkNtf+Tf6Tub0FsFMmMLYKNBTLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=;
	b=occhdijyUTDmkZTa+UB8Wc0rA5gpB48c5j60lShAn5cQfgsK73OGRiIue7r7ZOZK8AVX
	 ph5UK0lCO/I82vS6FkVzSnmvJ5JWXyu4n3s5h9UGza6i4y0XFeAKapGE2GFaTsnkpkfPQ
	 78/sYEnhV9uRa4AtWEVCBaFOIBMQgvBIO/Jozsg6qLPQzBUTjDhintvkr4HfpPYWY2Sd4
	 CcjL+2ROIVR0LQTE+0ycXTckvzzeEwo7MCxkghbJjfpDG3UV8/mJW2fFe7IswS3jyNRHg
	 buds7XGtO0cCdraaezXMDjjx597oG/eGKOEIQXkU7hf/G26PIeoQ55OpToWCVysQSPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a8cOFiNT;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1295606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 09:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1295606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a8cOFiNT
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1521187f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007950; x=1793612750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=;
        b=a8cOFiNTzODoESqu/FX14nDX71ki+Ovb0lGMc4rG5YGA9fH/QDDHfoWo1RO2CmbE8W
         J5fKFEWzSMwVDgDCO8tMN/Dx7KyN8mGNby7U+hXaT+LtLVXUBUlYh6J2asFA0GAu7OAQ
         uIFCj2tEtPNskelLAqpWqFipr27pHfvBILQgIrW2wF/PaLIybuXHDas4wHZofKaQc5vN
         xICU37igjo5OnzjevgRB6Fgy5PsrNVsGq6ubhh9QZ9qzK5RquJmkXipoyjIWWt63vGFX
         ueyXwDs3FLPC0EgQyHzcp3SwTM8L9WVrb9Tk5heX7QgYYd1vo7QQD9QE1TgrywCfn0n1
         wdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007950; x=1793612750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=;
        b=zZdluONhW0GY1RF5Kvge8viopIBamCH1ieYEpcAirrFhsLfcF4mX6rppEBu8HRx96s
         dclwbJ2QFiqwEpHEV3vUnuQ1jKtP5tVTCJDMTniTB8QUkJlqolBwcrDGyZqqHNgPYyr4
         j6vfp0vqs/J5h/yVbPTqpUsvZypU+rlJJ/diCBOmrlAwrimYbVC+PtPIs+0CH7M4xcm1
         1X0F6qlXxFV8UCSFUnGpEqlbjUI/HPze0s2nVWsj0mX/spTn36BvrX4lrW0fkCNgRxnc
         Je3aXc+P/FTXrLUgfFIZqDvlzh+lVR5qkZVLG5+ElmX8AxGzTNXFnaF2/2KK1csviisS
         VfBg==
X-Forwarded-Encrypted: i=1; AKwUvByWPrsEnExf3ocPvfhLGV4lVL94edpYy2d6qNnn5YrOpmiSMlqgdypEy8S+KeEfjgIR+h+iXeIO10s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDiv8Zf6AObEox18cF4j80WqGDpnfFTM929+79UIYqAVSSEOa4
	9wr2H0CJcj1jFZOIJAU6GmV393Q3jO6/c9d5HTNERwVWDB2St6+fezpGIxJdMff3D5s=
X-Gm-Gg: AYBFou3LzBiCyuGovULPLR3ppLkuQhJY8FDXW8qlF8pCczNQmgIvxTwnbvquU50/hL2
	HuZpWs5HwYHqOMTyoDaGNR++YIFfy5/UVy+mX7mltFt1Onxn0kPaqIa+Tbocjm1LfcG2PUHKkn9
	ExLFeFFhQwFQzXM/XbMsHr2eSmtVE4b8dRJp5SadtePl3btBUcCN+PX5gOuhKGHISD99YMaXdAo
	rSy4ry0dFF54tC5hnCT4oU3NYGFvgCDdAahn8uzmujTyR/P5Ltyt5I9Olmb03Qs60DcR4ltjhvp
	Oxs+k6e+yOWj1HQew4OXoccjMXFJhP5nYp1xFq5UnVZQDQDnp5H/lx7RDhdDRWpiw5xFt5Sksji
	iZ3MynSEiJCRhzifsQU7sRzkqaiVdJoESGpGf4rkNlpQj6bSuKg2Rhp9+ACbyHpPaWcC6dFp0hO
	fYtH+mbWVQ5/1wuu7qL9rwSYGeyfbtCTU3Bdm+fZZBIEb8suG4ZiG7UBx1KKApNMDLUAm31O1Im
	WE1cel50owGrV1IWon6PnNDrpYxQkWag9QGXm4hzFaTcf1rgpywW3nRtHv+Agw0v5w8HWoktBQo
	wFKr4w==
X-Received: by 2002:a05:6000:46c3:b0:48d:fed0:ccbd with SMTP id ffacd0b85a97d-48e3eb93719mr6507061f8f.34.1793007949962;
        Mon, 26 Oct 2026 02:45:49 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm15594852f8f.33.2026.10.26.02.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:45:49 -0700 (PDT)
Message-ID: <d3e80414-4f27-44de-b6fe-36d9a675e4d3@linaro.org>
Date: Mon, 26 Oct 2026 09:45:48 +0000
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
Subject: Re: [PATCH v4 4/7] coresight: syscfg: Remove unused
 CS_CFG_MATCH_INST_ANY
To: Amir Ayupov <aaupov@fb.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <52b3c337cbf4a8460e399b084c6f854eb3beee89.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <52b3c337cbf4a8460e399b084c6f854eb3beee89.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 05:48, Amir Ayupov wrote:
> CS_CFG_MATCH_INST_ANY has been defined since the system configuration was
> introduced but is not used by any configuration, feature or device.
> Remove it.
> 
> Suggested-by: Leo Yan <leo.yan@arm.com>
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   drivers/hwtracing/coresight/coresight-config.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index f04e73b91d9a6..220bc54f8e5e1 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -39,9 +39,6 @@
>    */
>   #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
>   
> -/* flags defining device instance matching - used in config match desc data. */
> -#define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> -
>   /*
>    * Limit number of presets in a configuration
>    * This is related to the number of bits (4) we use to select the preset on

Reviewed-by: James Clark <james.clark@linaro.org>

