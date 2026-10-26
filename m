Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007448;
	b=tlElGCTXE5tT6b7G6+vTEIvWjBSoOlr7zBrKXId4JuQRk2nIxlS7Wrp/ijqBlk22Gq3R
	 Bld9jed8w6MPWSGoWQJo+hK4VFvklF4qcWXlbaLwSXhH+jwXG5mayx6pz4BPRPEvSTRlk
	 Ka3naWPacQMk/Kpl6jzZYa4/rOfixDK++ga8q/s+4SQGt+UoWWs9Q/23C6ysGhYHQcUU5
	 MYM6skRgu+9sQzaKT+jfWSQI5mopK4cj6mXzTKzWgHIn1BDGXr3ucFSMEjVXfnXHmC/Zc
	 c/xv0npluYvwwXkIhnCigi5HWhOpzacaluPOSSRMmb5ioWVXJ3gzPXzhcxFrsmh/kwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=;
	b=R5gCNlkW1xmbn0epBrUBy4iGPIcVHDICZaFFUb0dzedtm7T45p347V+QNcKRCeod25JP
	 ilNJoIDkpKScJVGJsdrB8sytkK8GMJvpgNLI4n0NF8DJvPqZ77r/8cT+3WqduPuE+ULh5
	 PFqnrve63OxVlS5PfccHtHoJoP5pzMR5zZYyoYIEpquyERXuaC9tn5lzxV9KdzL6MH/qZ
	 ai+AxIyfhTsKf2EWiNQTAdVvBcvN07wZArHz7B4smk2wOGwkR8+xNqFXCdoZKITlz0FCK
	 ivXEIOx1tSqEGSs6+AQdEk9ebyRVfRf+I9yDrtyJhof9tjOLorsuZIoYYv9eH091g7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tLf+eDyC;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56AE606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 09:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D56AE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tLf+eDyC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso25036145e9.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007446; x=1793612246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=;
        b=tLf+eDyCrqkusRn4LesJuB4DaDDh5/20b7Ue98qaLBaWiRTiOG0IbPjyJjMjTYiwLg
         dG08uCjck78bfH41rpV2uiyRlUzy2d5tv+1dehSR/g/AXAbVjTMOGtKej5MUjryp6PHO
         u8598BsZxuD0XuUcH+Gzv3Mc65o3jEZlmaDNhJbnM2vzwtb7cu3mPasSSql4UpYGJB9P
         hBR69WATa8I9YFSDMTLYtWkj06NsFAMep3lUE30OCPqLyZUc7r/JeCRXZZK7nRa5ypTK
         CcrNvxxovTAwTyHJqHq0DjWfwPKi+GhZBbnfsagbyd5p69+wW5WCVI5MHae6IxwsgaHj
         En+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007446; x=1793612246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0PxtI+uEAhVBAWQKpyvj24AYTBUji0RB6U5PTo7niU=;
        b=yPCNQcwpGJ6sF7ok2fkB1oGAx4+rTe+a+aTKx6p7Rmo4a3ZZJBFomR/a/TUhhxwIln
         e2eeSqg375rwE6VZMEZm4p90yOWeuxYSMhFSudE/6Z6twnLJsCyvFU+/0mZ9GHhTLJW+
         onKGrBIi1Ty9kbJ3o1QhjUIgVqM/48nRwnPLKFyU458hMsDjs9QEw9RW6SonA4564+dV
         1nRZbAhdPXHaXLrBS6O631Jebco08fR1y+xKbQC4kV3hDFcPMXzFlctA397xVoaTIbBI
         K7YZfMDVmAmt6tkXcFH/CGnMyvFtvq3lxJozbNINQo59UNysof3WycVpoKaFOHUyTm6a
         KZPw==
X-Forwarded-Encrypted: i=1; AKwUvBzGWVnupCTRUpfKc+z4BRMXPkWxB3uNS2iiEdtvCrdP2k7hItMbIvZ4ipp1ztvdbuvmaFzA8SqaK34=@vger.kernel.org
X-Gm-Message-State: AFq9FYLymuhYUcZgVp9e9sG1JkjHEmiMTb2NyhEN4FKJVqsYcG9cAViT
	6V1y512/8KDluPATmMeWzAMAZogwpbk1qfrLaJsaTKvQidOFOTYXMnHkNupXNwlZRw4=
X-Gm-Gg: AYBFou3U9hRDGwJNf1S8W4IynpK4YYSIHaCQHxwgWfFMi9t/Lb0r59mlkbGoM4xHufo
	3hDO/Ea7r8DpXT1fsaTrxfWPAB/wuwHAdsxqZGJcXx+uxMLQfF/ezfjmsaXSSnjHKD0ZFfPUYXz
	513n9e8H5AKqVkaHEH4CBDlpkNeQOnKZ4jDv7fcNqzEXxSa4p1cGZ5VqkA77/VscHBL6oY4+ZMS
	lCBhvrX3DDccM0zI7Xw3vb0dkjGT/utrYrNP4H2MSdQQgEEZ8n5eFglRSc5lQZ3V2/sISUA+n72
	O6mji7IvJpdNyRO6yww47Pfxgw4ags1Ji+eCRZPwylWWj/GZiq/XTuQrqsXp4fR0kNe6tX2uVkB
	pavGHEG5uQGTR4nNxRAenTrJpK/nEfSxiEzKX3R8a3vXn1NnBrgTFojMEnQ9a/3pPRn4rYMbS4z
	klPyxnep7Sb75EYAG8ZCqAudUQK31nhOpyWc+qixZ79R3YTT71l6I7DCQcDy7o0gnQaG+F0tKqF
	HpaOBoZZ1h3OyckQufEuh4i2R+XXsgLSw8IVEGoFouEp11Z9t/n4rUQYIwq
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr121663115e9.16.1793007446278;
        Mon, 26 Oct 2026 02:37:26 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm15638434f8f.21.2026.10.26.02.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:37:25 -0700 (PDT)
Message-ID: <84e1c5ed-cb93-45b6-8cf1-6c6778efe412@linaro.org>
Date: Mon, 26 Oct 2026 09:37:24 +0000
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
Subject: Re: [PATCH v4 1/7] coresight: etm4x: Fix event count decoding
To: Amir Ayupov <aaupov@fb.com>, Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <4d45171946cf41751215e8c1cd9a8b14d38d3159.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <4d45171946cf41751215e8c1cd9a8b14d38d3159.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 05:48, Amir Ayupov wrote:
> From: Leo Yan <leo.yan@arm.com>
> 
> TRCIDR0.NUMEVENT normally encodes the number of events minus one.
>  From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
> means that no events are implemented and NUMEVENT is zero. The sysfs
> event controls currently interpret this combination as one event and
> allow writes to unsupported event fields.
> 
> Decode NUMEVENT after NUMRSPAIR and store the actual number of events
> in nr_event. Use the decoded resource count so that older ETM versions,
> where a zero NUMRSPAIR represents one resource pair, still report at
> least one event. Update both sysfs event controls to use the actual
> count and clear their event fields when no events are implemented.
> 
> Also correct the instruction event enable mask for the single-event
> case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
> event 0 from being enabled.
> 
> This change depends on the recent driver refactoring. With no reported
> failures, it is not intended for stable backporting.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../coresight/coresight-etm4x-core.c          | 13 +++++++--
>   .../coresight/coresight-etm4x-sysfs.c         | 29 ++++++++++---------
>   2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e21be6468e954..af017bd8a5477 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
>   	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
>   	/* RETSTACK, bit[9] Return stack bit */
>   	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
> -	/* NUMEVENT, bits[11:10] Number of events field */
> -	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
>   	/* QSUPP, bits[16:15] Q element support field */
>   	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
>   	if (caps->q_support)
> @@ -1519,6 +1517,17 @@ static void etm4_init_arch_data(void *info)
>   	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
>   	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
>   		caps->nr_resource += 1;
> +
> +	/*
> +	 * NUMEVENT encodes the number of events minus one. From ETMv4.3,
> +	 * including ETE, NUMRSPAIR == 0 means no events are implemented.
> +	 * nr_resource already accounts for the pre-ETMv4.3 encoding.
> +	 */
> +	if (caps->nr_resource)
> +		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
> +	else
> +		caps->nr_event = 0;
> +
>   	/*
>   	 * NUMSSCC, bits[23:20] the number of single-shot
>   	 * comparator control for tracing. Read any status regs as these
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index db9e603f97ba8..fb38f0102290a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
>   
>   	raw_spin_lock(&drvdata->spinlock);
>   	switch (caps->nr_event) {
> -	case 0x0:
> +	case 0:
> +		sysfs_config->eventctrl0 = 0;
> +		break;
> +	case 1:
>   		/* EVENT0, bits[7:0] */
>   		sysfs_config->eventctrl0 = val & 0xFF;
>   		break;
> -	case 0x1:
> -		 /* EVENT1, bits[15:8] */
> +	case 2:
> +		/* EVENT1, bits[15:8] */
>   		sysfs_config->eventctrl0 = val & 0xFFFF;
>   		break;
> -	case 0x2:
> +	case 3:
>   		/* EVENT2, bits[23:16] */
>   		sysfs_config->eventctrl0 = val & 0xFFFFFF;
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* EVENT3, bits[31:24] */
>   		sysfs_config->eventctrl0 = val;
>   		break;
> @@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
>   	/* start by clearing all instruction event enable bits */
>   	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
>   	switch (caps->nr_event) {
> -	case 0x0:
> -		/* generate Event element for event 1 */
> -		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
> +	case 1:
> +		/* generate Event element for event 0 */
> +		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
>   		break;
> -	case 0x1:
> -		/* generate Event element for event 1 and 2 */
> +	case 2:
> +		/* generate Event element for events 0 and 1 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   						   TRCEVENTCTL1R_INSTEN_1);
>   		break;
> -	case 0x2:
> -		/* generate Event element for event 1, 2 and 3 */
> +	case 3:
> +		/* generate Event element for events 0, 1 and 2 */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |
>   					     TRCEVENTCTL1R_INSTEN_2);
>   		break;
> -	case 0x3:
> +	case 4:
>   		/* generate Event element for all 4 events */
>   		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>   					     TRCEVENTCTL1R_INSTEN_1 |

Reviewed-by: James Clark <james.clark@linaro.org>

