Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25810224240
	for <linux-doc@vger.kernel.org>; Thu,  1 May 2025 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094302; cv=none; b=OgJddxfpwrOvC6dT6fVlTutfWX0Dm6Dcuae3OdOpvz95K8XSpM1IkBJdIfd4H7WiVk9Qp2D7pno56vKtY1yXo1WRPiP3VZlE9VxWH3cOuUtUFKX7hQDSeChL6TrST57+znrHsXcGEggSGbcFp/lDnYUJE5BvTu+Q4u3L6dbDR9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094302; c=relaxed/simple;
	bh=xro0tw1q2l1svsBFyYtiwJ9jWM6cwC+eR/qw3KWcmWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=aiosXQzRVsfsRqAGizpR95srvchIusbll3xVJhm5stHZm1hrpyQ3SAx9xF1UAcqKsibi/qM1m+J9JK/xx2A9rj63V50lMCwrWALNCna5z4eVGQXqC/rPXkskDkDaPBIZQoyeNOT67Y5vCyOGMutdlQ5lFvRW8FF6dlFf94Euw/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q27+VsQc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q27+VsQc"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so506642f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746094298; x=1746699098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9V+xJJn9UsK/pVyATCRXO2AUd9gyP/u93ItX0cM/Mvo=;
        b=Q27+VsQc+9PJRKnnPVC0W3gcp0SyfzHc47bfH/NyYLSDPKEA9QtISPHS/C8KTFt2gt
         578/rq7KroLDFKDbYduS6U/09eSoG7DRB2crkXzIJQQgHNg903DyxCCC9yAc3/6Yl3L9
         71ptoQBz1k5opPRXaQ4FszN1MX7Z8rUt72iZlWiYXmQKfkgoA1D9vXVffHNEYd3e1Ner
         fq4/O5rhwdY+uj3+CiUOVGN65hA9Wam7jnK3ePw2PimeJQeMMlClICEtZI65PACKcgT0
         GABKLIHh8CxRIoGtUyThjeYAwTizTwLH5/JzLjON9Vs/Ht5oK9ZQBM2o+iu9MaEX8ARC
         aIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746094298; x=1746699098;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9V+xJJn9UsK/pVyATCRXO2AUd9gyP/u93ItX0cM/Mvo=;
        b=LgndzgFk4y1ta8BLNdwmgdiQx5W1DyCmoDAXu4Ym9xaGVc497fXYkroCLHA2Nl7vvV
         WdPQNNr+6uG44i8NaV19OW9S7K0kmUunsCyRZ836wF+F1kQ/jHfuSxDZst66rZI0cwp/
         fbVsOx46vlkUrD6uvexUHooUbp4FF3hHo/w6/T4jyW9eEJsolWyE5sqIj/kEKGuGEGxu
         3cTfugE6wwLICChBwJ8XEPeGazjzztYP65uXTg/2ynUGljgDtl6yTQfV2//l4yPb/doL
         yIZaq0N8QOTEPLbAWFzz9ozCO0/Wny4VdZOG36EAJWlUI/lULQgIooEzb61g9VzAobgP
         JXYA==
X-Forwarded-Encrypted: i=1; AJvYcCUQRET/0HZOsHJAIy9B1YDn4aylcdXOaHwjkuLtbW6fBcD6cJpgzFocNKwA75VOcMuxdT3db4AL3sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzorYmHf4WoG2Xolh/mnmzCZC+WjS4SrnfwnWZTdK/tYVOlA346
	A6+qlTRYuvdfEWX7QHIcu9IpQ00vuicvYJAFUxaALSBB8XU/RtQmzKHfDM2L1Fw=
X-Gm-Gg: ASbGncvTDOyKO0DlJz47aA8LwXD2oGkxZfejOum3+99eeJ8DvnqGtmfbcP1AYsDdcRs
	tQU1vpWNXLTwEhGBfyu3BOafxYG4n2WVea6XXqNI4lhIW/YDpiuOFaPrxlohhY00t7u5lD1S2nD
	cRDI0d8zq/ThZzdeyGj2EOR4IfxAhBOb9SBUZDCl+sMlijz9czSvFWCCpo0kSOlTNR06K3FzVNR
	4rYx2pYRaxrOBToq56ZZAH0woOWgXtHgjvfEokLX4xRRgfzZVN6G3xtAFK02qW8+JFyY9TxuIn7
	e9JL8DUctXTLWJJuaP6J21QYqTCEecTVD6z6yPhpUDI=
X-Google-Smtp-Source: AGHT+IGdqR8qzjYLlpQD4/uFhernwMAGhF3KyzSPj/rMCAGy6rGk1PYMRuH4BRffLmFXhwB8a2kWkQ==
X-Received: by 2002:a05:6000:2203:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-3a09417d67dmr1700384f8f.53.1746094298398;
        Thu, 01 May 2025 03:11:38 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4b968sm440260f8f.45.2025.05.01.03.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:11:37 -0700 (PDT)
Message-ID: <2ef27237-e5b4-4c9c-9810-9d1800d96596@linaro.org>
Date: Thu, 1 May 2025 11:11:35 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Arm CoreSight: Support AUX pause and resume
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Mike Leach <mike.leach@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/04/2025 7:07 pm, Leo Yan wrote:
> This series is to enable AUX pause and resume on Arm CoreSight.
> 
> The first patch extracts the trace unit controlling operations to two
> functions.  These two functions will be used by AUX pause and resume.
> 
> Patches 02 and 03 change the ETMv4 driver to prepare callback functions
> for AUX pause and resume.
> 
> Patch 04 changes the ETM perf layer to support AUX pause and resume in a
> perf session.  The patch 05 re-enables sinks after buffer update, based
> on it, the patch 06 updates buffer on AUX pause occasion, which can
> mitigate the trace data lose issue.
> 
> Patch 07 documents the AUX pause usages with Arm CoreSight.
> 
> This patch set has been verified on the Hikey960 board.
> 
> It is suggested to disable CPUIdle (add `nohlt` option in Linux command
> line) when verifying this series.  ETM and funnel drivers are found
> issues during CPU suspend and resume which will be addressed separately.
> 
> Changes from v3:
> - Re-enabled sink in buffer update callbacks (Suzuki).
> 
> Changes from v2:
> - Rebased on CoreSight next branch.
> - Dropped the uAPI 'update_buf_on_pause' and updated document
>    respectively (Suzuki).
> - Renamed ETM callbacks to .pause_perf() and .resume_perf() (Suzuki).
> - Minor improvement for error handling in the AUX resume flow.
> 
> Changes from v1:
> - Added validation function pointers in pause and resume APIs (Mike).
> 
> 
> Leo Yan (7):
>    coresight: etm4x: Extract the trace unit controlling
>    coresight: Introduce pause and resume APIs for source
>    coresight: etm4x: Hook pause and resume callbacks
>    coresight: perf: Support AUX trace pause and resume
>    coresight: tmc: Re-enable sink after buffer update
>    coresight: perf: Update buffer on AUX pause
>    Documentation: coresight: Document AUX pause and resume
> 
>   Documentation/trace/coresight/coresight-perf.rst   |  31 +++++++++
>   drivers/hwtracing/coresight/coresight-core.c       |  22 +++++++
>   drivers/hwtracing/coresight/coresight-etm-perf.c   |  84 +++++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 143 +++++++++++++++++++++++++++++------------
>   drivers/hwtracing/coresight/coresight-etm4x.h      |   2 +
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-etf.c    |   9 +++
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  10 +++
>   include/linux/coresight.h                          |   4 ++
>   9 files changed, 265 insertions(+), 42 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>

