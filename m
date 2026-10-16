Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B464CB8D7
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157446; cv=none; b=lcIADQPJ0Uh1ZDjw3ejJD4v29hl7+NKjBIHSnEWVWa5Kqfkm3VBt2XV+B17iEkZPEWaYvUSyJfUBhwyE5UmAWVg7YykW2VptTVtPzZ3JXic+yzI/VPrrM+ggJvSugGMCONdltHw+PQwjVgdmnKULeURgusqVJjxXH7CvQ+9hD4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157446; c=relaxed/simple;
	bh=FoawsJ+Jr3o0i73fWcswOJpI48/6PChdwPWdkyAtoTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVPYSgi/f//XI5sls7M6cPKya60LkBfo4xjEptL//oEXMHhjtYuS8Y4aVb2CFZWfIBGyaIDTg4Yn9lmLEobEIryYpmopKcznWY5fI076J/zOOW0LEyBgeLi7wGgo7jsYLjVNZcZSGWA3dF3E89qdq966T6L08WPx3MJNzNfdiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J/cb12th; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J/cb12th"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso60336285e9.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792157444; x=1792762244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apXFfUjY7v6M2DPDE8emOTN5c6EUenT2ynsNF+r1xeQ=;
        b=J/cb12thX+5oHEzUL3aO2VK7dxqRCIVELtelziHaEfcN9jfAtzvh29TlxqfHzvPKRz
         M8V1eVibvuMENSt6SviMq7hjOVP2O+CjbPMRiRNrmWWMgB33DcV9vidtHB5DyNeTfuBu
         qFTmRN3RZnWgaUss+vblqbNzO+MxPr7WVgTOdR7xz25Cav+JuzNmTwYd2jtROeSrzWhz
         PD53KTnLzGzUFWsz6AZoTPP1vJw0U4IKxiJ+6Fxsr8j/QmTg0mi4a6JnPQvYYiD243wu
         19yBEwZxlt143p8pnUm5woyElybgve25JW82VXxgqAwCa4KBEdiuFaAlorUFAEQAhEOq
         TfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157444; x=1792762244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apXFfUjY7v6M2DPDE8emOTN5c6EUenT2ynsNF+r1xeQ=;
        b=Hdj0U/IwwCvlaPwffC9WOIYowAxGjfDmWvwWNKnsxc5lHZSYAN2g6XixUwA0sa2j7Z
         ZSJwCTXPoUkHGsVhOZK3BgmyJ/aTHkZhdso0bqBZAqKqlVc5mqW9YGkcDOHZUsBOpvy3
         TL4pIK7cWW3ncgS0O8jajS82ykbNHKBvC6EFIRKMYuON6OZA/GtLlkqVHWyg+lOXHhXl
         LRjvNRQLPiGEVxRSnlRhWmrrs9PsgE8ndWg7vwPR7mIRTbwIhrbVp09Sp3HyMvDg92S9
         o72r1a41H0oqFV/DeSrcI96e6AosbPRPAu+qOVIZRQwUl+e62N5boL3Yv3Tvn+3ziXw1
         HsiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsV+ekP4PPfe+ZK9EElPhlt3d8br7OWn9m8MSwp4gWZHeFPB+ExjuMMAlTlSRlyraUWbtwELrID+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoYS6pceHFzNDNex13oMejBf4dOdNY4gHuAnPp9udaeXCLyZo0
	NL0IJ1VVx5r3UReX5Ekavq7+jXjKSMy2HEAjd0fuNReiwy/awdaFecMFdaRWgb+LLeU=
X-Gm-Gg: AYBFou1ah41Kj9E8AKIf1mJRP64JyG3DI4R9b6cTSUarN7exKfK4qS106rFt1cKwk5i
	3tJ2rbDDU4JUhHLqZy78OPua03UQurDS9GaoINd1+cGUhEFtmgjuZwAUCmQfcCg1WbCYWBmKUkJ
	YWp2hjHNR4S22azCD+LRo3JnlK1buqsv7XlAmHI547NgoWTIGezjCA9oIXEKsXxmXxnTzgseJs6
	MF/OaWW600Ev6Ny6T4BCVdWd1z3PE2oUwsipPEWiM9KwRVVbgNUYpXBsmroegbhsNTGpsc6Pn/q
	BXLWOgD790wKXINkTDlRbLEtBb839TdJjl7txmUV1X9liCGI7vTxm6i47Dx9JfXvee4MBm9SBSM
	sioVJDnpI/ZYQ571K608bgWcvp1jpDHuamMSYJe0TtUpMTs58cQPxfScLL8a7xkRLzYX8BjwJ0f
	YCgFqoGMN06ipuoAxP/fEDIkbmAcAIfXIWgijGNaWQfA81dNZNo8jdIDMi6nHDfWopzk5PVGRjl
	WpZwShjkPfp8UPgmKW1jAOvKen012H7IHBNbH+3gUeCnK4Q5wPxZNLTQSLn56xk9nJU/qQkgU0A
	gI64VA==
X-Received: by 2002:a05:600c:83c7:b0:4a1:d456:dda9 with SMTP id 5b1f17b1804b1-4a1d456e0a2mr15854635e9.9.1792157443112;
        Fri, 16 Oct 2026 06:30:43 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ae6d2esm60109555e9.6.2026.10.16.06.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:30:42 -0700 (PDT)
Message-ID: <ad5f5981-7133-431e-ac8d-8ac064a97f02@linaro.org>
Date: Fri, 16 Oct 2026 14:30:41 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/25] perf/core: Export output copy helpers for CoreSight
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-3-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-3-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> CoreSight AUX sampling needs perf_output_copy_aux() to copy trace data
> into samples and perf_output_copy() to prepend zero bytes when the
> available trace is shorter than the requested snapshot.
> 
> Export both helpers so the CoreSight snapshot_aux() callback can use
> them when CONFIG_CORESIGHT=m.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/ring_buffer.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 1b1ffe0533e58a9d976d0eb0fc23e09d5936da2b..e69ea5b077a5e94b5b6bb1f4c6f0ca5b8a94a6cc 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -298,6 +298,7 @@ unsigned int perf_output_copy(struct perf_output_handle *handle,
>   {
>   	return __output_copy(handle, buf, len);
>   }
> +EXPORT_SYMBOL_GPL(perf_output_copy);
>   
>   unsigned int perf_output_skip(struct perf_output_handle *handle,
>   			      unsigned int len)
> @@ -617,6 +618,7 @@ long perf_output_copy_aux(struct perf_output_handle *aux_handle,
>   
>   	return len;
>   }
> +EXPORT_SYMBOL_GPL(perf_output_copy_aux);
>   
>   #define PERF_AUX_GFP	(GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY)
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>

