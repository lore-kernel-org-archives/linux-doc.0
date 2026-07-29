Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28008399CEE
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320241; cv=none; b=qnKJExDs6Ib0PZYlM/3l/Veq+RucMl4tNDtNdpBkYR/B0hEvbBBNxe0BgdziJgLoOIcmKhvFIhj+VIMqs+4/VHrKcYsleLVE8d9aeWR0gs3gF7FH09+Eyu7PNJ0Pt3UqI5r5nZcVtKhOZAKuA0kCPlCUkwzVbxMwRSW55YTTOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320241; c=relaxed/simple;
	bh=kfUL6NEZJBrSZ+w8QMSHo6pGrE8PIPoOT9kbYbv7m3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B53KVkFYAmUdjX4vxT/ZHlmrzQQbOMIEuANuolR5bJ9+rVEU5Aa7K44Rt0OuTFTkNwis9KvHamzh96W77R8HsYJz0q+OaVRg1A2hw2hYBKrfbtfL44pzXVLjBpaBueKvDpluToYNHzFub5uspK/0goeCgQJ+eBUwOfdarVjlUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8+RWTzL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8+RWTzL"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so1261115a12.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785320238; x=1785925038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW3LEfjTPLKPIEhN48PB0+fej5z0A3OPZy5r028XBjo=;
        b=p8+RWTzLRJe7m/gcTXVEpZNk7bZLFc0CQOrNZwB07q3TVxBCGc4LtA1jYr7cCu7Rj9
         uUUJkPpVmyylWOdXM+7t7NQRj9ZyrSzZbFjkIMA55Ee3sjsHZTQoIknpyLEqXOGWIHbY
         pQLqJs90WiWIMqiGuYWaDmFkomPdXuxE6eQts2jEm3Hg5UrCfvkBEWw5M24qL73kIbyx
         D4+3bvF45ncv2eEzBvh5UIvBcCsoMokOVHMR18KvQQDLZGKY70a51XkatjWBpI3JoKP8
         5gJAfCb/ogs70uZFtvZtfOIgCS+sb8OosRwH8T8lqVhnIVGd9qn8mvIHdiAb/OTrVISS
         h6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320238; x=1785925038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW3LEfjTPLKPIEhN48PB0+fej5z0A3OPZy5r028XBjo=;
        b=NLTKuqlDQeCkYWo046HpXshPP+Bbf5Y2B71/vJJjV+L5HkiO9n0XWqy2WUIFwpwsMj
         /XyK+5Y5ijw1QZAoMJ/UOlTmiEdcewr0D1SmaW78ppA61hhqkRDxAiF3OQkPSKzu+uKu
         EH0aBixGNh/66grDqW97hyckmlEYfhTPp3k3ozhsdn79EzbBp79dP57Rx/0yQJ1+8xUG
         CpekvXp6ic6xD93gWiLT6FQFbJYAXc1sPy5X4liX/CshpH0htHoXJh9QL4FoSAuJpElq
         +bcwes+oQzVeyWXXRrq6vOv4F9zP9P9EYuI63mYAem2u1p4s6XSMcINexPpwrQ6Cqmco
         U3BA==
X-Forwarded-Encrypted: i=1; AHgh+RqdErXzTKp/zXbfRXFSNdaQ06QbvK7DfEYSpudXLvSSoKqINblctH/JFYEZPhWJK+ZycUXopDvunb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXKI0HTd0Zum6BGxu6sqtcYHfS5qtZTBIhro5EVvCnQCo3DVLm
	1AH7O5v9tCk9RR0Ziku6H2tI8aIVPo5UmDBHvTMsjg+hTTzRXgd0Bs0JqyO98WCJLao=
X-Gm-Gg: AR+sD12gUa4M7oqDM1ZsAj0mX4dYQwSFC8sE/jaNLpxmKvEmCFBDLvs5CbfZvRJghAn
	NWCVHCtu8vqE/uJs3P9MN9onP1dfymFFE2An5DV2hmd+fX/QYzi+pMlqjcMJgXZPJwgZrvQqaWf
	N4817yN+crft3iAptK98l5a/4+JNU+ZFpAGneQW0PDBoFQxiUI5KVXBywaDR0Q35mbTje6i68SN
	zlZFdQkcz8fivab2OvwZ3DutS8c9D9MhUuWdowuegJRXNzp4rf2sr/AqlfNGUKZ4HjKcKdrkpdh
	YeQ4yZqJ1mawdZ735vowtyy3vrPLqzR5QbH6J+i0UPwMRkS+gMMeOQedBeJ1Hh0S4VpJe7RrQN6
	FGDwj+uD0FxbFD9DMVVtbTMLa+3s4Demi7c7Ypw/S8rPtpgdyLWq7oyHc7n1JM0tztkO7IdjdAL
	rnaHxfK2a9z4b1HPA7tYCe3QlrKkl4HZXmZ9QNzqjHDlSB6IPnChxU4ZCItbOOOMQ1d4jnhDyD1
	nBv
X-Received: by 2002:a05:6402:42c4:b0:698:aa88:56d1 with SMTP id 4fb4d7f45d1cf-6a034a88210mr3501753a12.25.1785320238373;
        Wed, 29 Jul 2026 03:17:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c5cf0bsm632696a12.23.2026.07.29.03.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:17:16 -0700 (PDT)
Message-ID: <29c574cf-eeda-4d29-a840-000d62ace604@linaro.org>
Date: Wed, 29 Jul 2026 11:17:14 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf hisi-ptt: Fix spelling and abbreviation errors
To: Sizhe Liu <liusizhe5@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linuxarm@huawei.com, prime.zeng@hisilicon.com,
 wuyifan50@huawei.com, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, corbet@lwn.net, skhan@linuxfoundation.org,
 bhelgaas@google.com, yangyccccc@gmail.com, jic23@kernel.org,
 john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com,
 leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, wangyushan12@huawei.com
References: <20260729060220.624250-1-liusizhe5@huawei.com>
 <20260729060220.624250-2-liusizhe5@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260729060220.624250-2-liusizhe5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/07/2026 7:02 am, Sizhe Liu wrote:
> Fix spelling and abbreviation errors in the PTT packet decoder:
> - HISI_PTT_FIELD_LENTH -> HISI_PTT_FIELD_LENGTH
> - hisi_ptt_8dw_kpt_desc -> hisi_ptt_8dw_pkt_desc
> - hisi_ptt_4dw_kpt_desc -> hisi_ptt_4dw_pkt_desc
> 
> Cc: stable@vger.kernel.org
> Fixes: 5e91e57e6809 ("perf auxtrace arm64: Add support for parsing HiSilicon PCIe Trace packet")

Probably doesn't need a fixes tag, but:

Reviewed-by: James Clark <james.clark@linaro.org>

> Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
> ---
>   .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 20 +++++++++----------
>   .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  2 +-
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> index a17c423a526d..c48b2ce7c4a3 100644
> --- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> +++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> @@ -94,26 +94,26 @@ static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *de
>   
>   	printf(".");
>   	color_fprintf(stdout, color, "  %08x: ", pos);
> -	for (i = 0; i < HISI_PTT_FIELD_LENTH; i++)
> +	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
>   		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
>   	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
>   		color_fprintf(stdout, color, "   ");
>   	color_fprintf(stdout, color, "  %s\n", desc);
>   }
>   
> -static int hisi_ptt_8dw_kpt_desc(const unsigned char *buf, int pos)
> +static int hisi_ptt_8dw_pkt_desc(const unsigned char *buf, int pos)
>   {
>   	int i;
>   
>   	for (i = 0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
>   		/* Do not show 8DW check field and reserved fields */
>   		if (i == HISI_PTT_8DW_CHK_AND_RSV0 || i == HISI_PTT_8DW_RSV1) {
> -			pos += HISI_PTT_FIELD_LENTH;
> +			pos += HISI_PTT_FIELD_LENGTH;
>   			continue;
>   		}
>   
>   		hisi_ptt_print_pkt(buf, pos, hisi_ptt_8dw_pkt_field_name[i]);
> -		pos += HISI_PTT_FIELD_LENTH;
> +		pos += HISI_PTT_FIELD_LENGTH;
>   	}
>   
>   	return hisi_ptt_pkt_size[HISI_PTT_8DW_PKT];
> @@ -128,7 +128,7 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
>   	dw0.value = *(uint32_t *)(buf + pos);
>   	printf(".");
>   	color_fprintf(stdout, color, "  %08x: ", pos);
> -	for (i = 0; i < HISI_PTT_FIELD_LENTH; i++)
> +	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
>   		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
>   	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
>   		color_fprintf(stdout, color, "   ");
> @@ -140,16 +140,16 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
>   		      dw0.len, "Time", dw0.time);
>   }
>   
> -static int hisi_ptt_4dw_kpt_desc(const unsigned char *buf, int pos)
> +static int hisi_ptt_4dw_pkt_desc(const unsigned char *buf, int pos)
>   {
>   	int i;
>   
>   	hisi_ptt_4dw_print_dw0(buf, pos);
> -	pos += HISI_PTT_FIELD_LENTH;
> +	pos += HISI_PTT_FIELD_LENGTH;
>   
>   	for (i = 0; i < HISI_PTT_4DW_TYPE_MAX; i++) {
>   		hisi_ptt_print_pkt(buf, pos, hisi_ptt_4dw_pkt_field_name[i]);
> -		pos += HISI_PTT_FIELD_LENTH;
> +		pos += HISI_PTT_FIELD_LENGTH;
>   	}
>   
>   	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
> @@ -158,7 +158,7 @@ static int hisi_ptt_4dw_kpt_desc(const unsigned char *buf, int pos)
>   int hisi_ptt_pkt_desc(const unsigned char *buf, int pos, enum hisi_ptt_pkt_type type)
>   {
>   	if (type == HISI_PTT_8DW_PKT)
> -		return hisi_ptt_8dw_kpt_desc(buf, pos);
> +		return hisi_ptt_8dw_pkt_desc(buf, pos);
>   
> -	return hisi_ptt_4dw_kpt_desc(buf, pos);
> +	return hisi_ptt_4dw_pkt_desc(buf, pos);
>   }
> diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> index e78f1b5bc836..6772b16b817b 100644
> --- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> +++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> @@ -13,7 +13,7 @@
>   #define HISI_PTT_8DW_CHECK_MASK		GENMASK(31, 11)
>   #define HISI_PTT_IS_8DW_PKT		GENMASK(31, 11)
>   #define HISI_PTT_MAX_SPACE_LEN		10
> -#define HISI_PTT_FIELD_LENTH		4
> +#define HISI_PTT_FIELD_LENGTH		4
>   
>   enum hisi_ptt_pkt_type {
>   	HISI_PTT_4DW_PKT,

