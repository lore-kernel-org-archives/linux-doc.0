Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D93594F
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560520; cv=none; b=CctiP9JwPtNCdjXhl3/Yg+8J7XYyULxJF7U3UC92M1q/MNiYftjUR1Ri6tImqjdOxy8du4JlXlSluk/mxAGpQbjxZ3i25Xb3mYzTKHcODhIcxMr1+t12CYmYLOxh1uxSh0MBC+8YtogAgiqTI3aZtLzJl2H0W0eOlZAaZZl6brA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560520; c=relaxed/simple;
	bh=opPOOG1O6YWZJsndEVn+IOBeaBmKbK+Sds2Gv96QrM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eM6EaU7Y0QGNMuazS1P9U+xueBincb03mYuHuLPnBVlyrhbzyplOEL3UohfrguQqTmmyGzGN0/yO7dW9OYU6xtBzOg3R5KNkIiDTjfHugmYnrnfqpkL5CXhTdwoOEU59X9J4KDhINkrfY10+cpb9r3jMJozUbMgSmBJzm9DuiV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCQFRJXh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCQFRJXh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47755de027eso46042815e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 05:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763560517; x=1764165317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+q6MH2wUYmWiA2m/aB7uSk/4x8ihBeWt9CWI89JZj8I=;
        b=DCQFRJXhtKz2Z49BmcV2EWeq/8xcAhpXmNcb+iMni7QlmTenAp2QGBe9sNNZwi/QhA
         62FPcB6WKbb/o3807+059x1Gm5UkyTsgnb9Sd2pllOLNydrMduzNNFfJ2aGZB0ydcHJy
         RyfFrk4DW2z28O1r1Dlg34Aupbgq9Grrf0uqo1hEXI2K2ZFXdxS6FmGYOQPCi7oJ/8Cv
         km6xX0ECYZXnU9TCKvoCzpx/aG3VikkXuxvAgjlUx1Xhn6tNzpAl9KSjljvfttevMJib
         Xa2Xjz4NkCvPYG7nU7zpk/t8sprAC9SmyZKH06wFXCwDWbzW03iG2vMKkjG1LfXuH5n/
         6HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560517; x=1764165317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+q6MH2wUYmWiA2m/aB7uSk/4x8ihBeWt9CWI89JZj8I=;
        b=owHTmxxEOwdumyxVfX5ArBJvcTRmorRAHaDmEkC5TDPv/s/Wg8bUd/bnnjI1P/EYBN
         kS9F81+wOuPW8azXCpzwMruqkTdpD+8A4apCUAGat0OVq/psq7ZH5JRWZ0/g5H2I6C+u
         WLwOdQV+U4v2vta0yaThFyxSViCSVC1xwPkM9eDpIEjhegTdFBKnc1aQbZ8VrNa2mKlg
         P/a6oVOpMcMTXzhotjozbmBqO1X/ikIJto4m+oGbZym8Er3U9Ks/klWNO3evfYErWUbk
         lD6dsGMUUre2qoVpeAPMuF+ziBfAzmvLaODt/GsLaWCVex6MfgZOwBnPXQtYuH9QFUhH
         yjQw==
X-Forwarded-Encrypted: i=1; AJvYcCX8578GlD4iLq9dVcssAg0nBwkdyLu+B7jE/GGzdIo3TnlDYcf2YqQNRJWc9ShT6Nin1Q6aIndJocY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyQ580Tq364MlvaSHaWDmvs+ek0drImYmIEfkUKHYYrWrndRAQ
	v3LF30jWO2eXL1QeVlrxsfPSwbtlfUMed84xz/jUCKRpc+PT0Hu3P0Khv9aqL3g/9R4=
X-Gm-Gg: ASbGncvZo6F4bofADZ/M/N9zQR5zjOmPF9uAAvDsIt24B0AixXvCv32YiVI2ViKKzfl
	S5C4AzeTH1lsB/nLXmmpilDdNndmsoED4a1zxjI+Co89nNmoyiS6m6DO8fOYrB1Yx4ZIlWXMR5U
	j/FuO9Y10htqA7B6qTz5gnNhS7NGznzooX/YJ0Qk76jxEQuE6pzn2NeTYtNaTyCSLHHMGTQeGdK
	R3niD9T2MK2Qy1Dds6CM+56vxfXLjWlX1Zulp153sTewdKOKITt+uKlV0VXiyhRGd7GO+qW360E
	Br4duOFeq0UHBk0xkSwKKCGAFTaFh00DkuGZtL8+iMZO5XgD4Trb72zOIrwKyN45YV2Kez+ZLeu
	kaIQm4NPO9wRJ0Bij5cXWxWBo8UlnisXAlGILbYI91fhAKKCNsSBfbsMAFxRDBf7/bJdWRvuvtp
	lAiLc6dZYDUDpdKbwUKTPi0azT/uTSOc63lTpqew==
X-Google-Smtp-Source: AGHT+IEkdbSdxiPZRPo/BfGmPl8Z82ZAzyIqM965RgSEKLzus7ZjC7qYxPL1XYrZ3Hts2RXQnznpcg==
X-Received: by 2002:a05:600c:190b:b0:471:131f:85aa with SMTP id 5b1f17b1804b1-4778fe4a039mr165734565e9.13.1763560517126;
        Wed, 19 Nov 2025 05:55:17 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1012af0sm49846635e9.6.2025.11.19.05.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 05:55:16 -0800 (PST)
Message-ID: <a199db90-a344-40e0-8628-b4c3b56fc92c@linaro.org>
Date: Wed, 19 Nov 2025 13:55:15 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
 <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
 <20251119123647.GC8204@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251119123647.GC8204@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/11/2025 12:36 pm, Leo Yan wrote:
> On Wed, Nov 19, 2025 at 12:00:30PM +0000, James Clark wrote:
> 
> [...]
> 
>> ...  But then to make
>> the code match the warning it might also make sense to change CONFIG_ARM64
>> back to CONFIG_CORESIGHT_SOURCE_ETM4X, which Leo suggested to change. Maybe
>> I can just delete the warning text, practically this warning can never be
>> hit.
> 
> Armv8 CPUs can runs in aarch32 mode, strictly speaking, we should also
> can run ETMv4 driver in aarch32 mode as well.  Then CONFIG_ARM64 is the
> right choice, this can remind us that `is_kernel_in_hyp_mode()` is
> always stick to aarch64 mode.
> 

For the avoidance of confusion, in this case CONFIG_ARM64 and 
CONFIG_CORESIGHT_SOURCE_ETM4X are 100% equivalent and there's no 
functional difference. Yes maybe 32 bit userspace can be traced from 
ETMv4, but that's not really related with how this code is compiled.

>    static ssize_t format_attr_contextid_show(struct device *dev,
>                                              struct device_attribute *attr,
>                                              char *page)
>    {
>    #if IS_ENABLED(CONFIG_ARM64)
>         if (is_kernel_in_hyp_mode())
>                 return contextid2_show(dev, attr, page);
>    #endif
> 
>         return contextid1_show(dev, attr, page);

Not having an #else implies that the contextid1_show() part is valid 
when !CONFIG_ARM64, but that isn't right. That's why I had the WARN_ON 
because it's dead code.

Personally I would drop the is_visible(). It makes sense for dynamically 
hidden things, but these are all compile time. IMO it's cleaner to just 
not include them to begin with, rather than include and then hide them. 
Then the extra condition in format_attr_contextid_show() isn't needed 
because the function doesn't exist:

GEN_PMU_FORMAT_ATTR(cycacc);
GEN_PMU_FORMAT_ATTR(timestamp);
GEN_PMU_FORMAT_ATTR(retstack);
GEN_PMU_FORMAT_ATTR(sinkid);

#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)

/* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
GEN_PMU_FORMAT_ATTR(contextid1);
/* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
GEN_PMU_FORMAT_ATTR(contextid2);
GEN_PMU_FORMAT_ATTR(branch_broadcast);
/* preset - if sink ID is used as a configuration selector */
GEN_PMU_FORMAT_ATTR(preset);
/* config ID - set if a system configuration is selected */
GEN_PMU_FORMAT_ATTR(configid);
GEN_PMU_FORMAT_ATTR(cc_threshold);

/*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
  * when the kernel is running at EL1; when the kernel is at EL2,
  * the PID is in CONTEXTIDR_EL2.
  */
static ssize_t format_attr_contextid_show(struct device *dev,
					  struct device_attribute *attr,
					  char *page)
{
	if (is_kernel_in_hyp_mode())
		return contextid2_show(dev, attr, page);
	return contextid1_show(dev, attr, page);
}

static struct device_attribute format_attr_contextid =
	__ATTR(contextid, 0444, format_attr_contextid_show, NULL);
#endif

/*
  * ETMv3 only uses the first 3 attributes for programming itself (see
  * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
  * sink in both, but not used for configuring the ETM. The remaining
  * attributes are ETMv4 specific.
  */
static struct attribute *etm_config_formats_attr[] = {
	&format_attr_cycacc.attr,
	&format_attr_timestamp.attr,
	&format_attr_retstack.attr,
	&format_attr_sinkid.attr,
#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
	&format_attr_contextid.attr,
	&format_attr_contextid1.attr,
	&format_attr_contextid2.attr,
	&format_attr_preset.attr,
	&format_attr_configid.attr,
	&format_attr_branch_broadcast.attr,
	&format_attr_cc_threshold.attr,
#endif
	NULL,
};
>    }
> 
> Thanks,
> Leo

