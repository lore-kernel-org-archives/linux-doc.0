Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B90246778
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 01:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082581; cv=none; b=fgUvITB05ZNm6a8uS4mqOE2ApYcJL5uw/eft0q6zFwkFJpiR5jzABPiZR8TwVqiLsu7XDwVyho6ZmjSBJVb8B2IZ1BUwPkXcbOjyqwjSM4KvmVwoU2D2vcWTvVWnVZnBsKOOI47CxQ6xL0qK9paHO4xK6Cb3D4zPwj4EI4gWlSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082581; c=relaxed/simple;
	bh=2X+mytXBtNSV0apIC0KsjvAvt2VlH2ZbcBkfrYklwOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/lRyRCk9qHZ5GYgv0CPqCesuvWLn9EkZ0kAG7qJgO+zbSSrr/8jYa7cMEV6qYWUNB80quPIkKhhIj848YzXVbsvkzNIysdW+6d90aafidRqhGHnkA+cbiECjxkBVaWQMzRF/f/IrDpiMSPIFr/oo9FEtGE24XTrY3FOJ6daAh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLv93Bw6; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLv93Bw6"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-649b1ca87ddso2677018d50.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 17:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770082578; x=1770687378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IDGINNniODK4Zc3R8bth6pqq7qdppNjLL1gm7R6GyLM=;
        b=RLv93Bw6xpk89FZZDN9UOJBCxmu+ZX80fcvlX6bt8TqwUJTiClbdTH5AQD8E5w77/G
         EmANL4xl7htJb2EnggaR7Oey2IPQHsNxiJhn/qp1wRaN4TL9cFC2IaOwf80olBg7wgED
         Fl89qLbZ+dHAAjGRgL4KqL+UdRcPIWczq0jHo9rwVw4NVl6hy5Uon8bpCNIWOpXvn29N
         WYjhEg/iODYyxI4+zhoKTRsfw/GW7YfvfiamnYtVLIghpvMDOOyy6t+MJXT4cxjcPwkD
         KdiNUwbAjbe3Ea7Ku9JdabafkB+05C/KwUceMICFVY9+a40saVM2iBZ4/xO44EPHXENN
         nrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770082578; x=1770687378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDGINNniODK4Zc3R8bth6pqq7qdppNjLL1gm7R6GyLM=;
        b=YF1rIjL8CDAMyzAUhluPnwLPP+Ft8TjI8eQBTJUJzdnZcvGYLQy9di70r6qUlO4Ihf
         V9MkiSflafgHRojH3PiK6f8ovkQu65CHMUOXLyR6fvB1xk1OJKrxjvdOFyrTXP/lRu8Q
         NtdBBtExk6QuEMrwb432L4u/E7B51NvCMry/Z0zMtMPV9yeNMmbTcCSRT2FRgi0vFCt7
         WtDg/E8ZAIgsm/+WPTd9KorjsYqYMx3BI+6ZUKUCz38oFajPRN1g5lsdt3Y+1Xt7D/Q5
         7N30FsNKeaC78GGWbe3rcc8MfzmjOAsD+q4uZIk+E0o9fNe9PDhe4ngvYz1/ntYWjeQE
         E/VA==
X-Forwarded-Encrypted: i=1; AJvYcCVXtKlRN4WqI63sccXTTbwZoNRewdu9HvxF7r4oBbHlFTAk6wpmnUhhePtNllDFKAgpMW/8uvaS+aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZVr0DPLEluvLYWMqYJhrlcA3RPZrzbWaC5W7TNj9wUnh961a
	FBSY6OTn1kWKD+uorhSl5GNbDUUFY5O032B3JZipenOIasKJHd0wYkOt
X-Gm-Gg: AZuq6aL3KyfOCEWWeoOz05+Uqm3Yz9EaWurMxXr/xcBJoDlYTHzADurJyLjdyJOcOLv
	1MhqOgLl/BscqndkxN5dhZeNcPbZv2AkQCudqkAp+nKsWzEc/fhRHDWezwF1aDepQooeptOnAu3
	2DwskeTDGqbKuYbbPb+e0hANAtUr3KSQKmEthok3Zcg2uPg/kPTAcyfROfB4tOe3CCc+W/iwCAo
	3+Fpa1XyrNnjm7I5/HUFCtmNJdvjBMkl+1/J1p6LsxbuK7pp+mMEVBYiRrki9RkPqwetO3hIiuf
	0F+BbO2zpf5n/YpywcbgJPIxklZZBersDRQCO0o7wFYe2DOvTGJJTY5l1gJgkBmmBcdcfng1UBr
	pR6NKpBD1W22EmRc0FBhFUNjR1WHj4ow2Mk5puXdxw3rBDAh0fyqPZDuPlGGDq9A2NY6hG4Z+oS
	7LEaIpcEdivlg0dLoh8KFSNcLJcCecaYW+JBWl5A==
X-Received: by 2002:a05:690e:408e:b0:649:523d:e701 with SMTP id 956f58d0204a3-649a852de09mr10271339d50.92.1770082578400;
        Mon, 02 Feb 2026 17:36:18 -0800 (PST)
Received: from ?IPV6:2600:6c56:7d00:582f::64e? ([2600:6c56:7d00:582f::64e])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-649d447df2bsm423325d50.4.2026.02.02.17.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 17:36:17 -0800 (PST)
Message-ID: <74f3e6cf-7c13-43e6-a8f6-2b46184b8ad6@gmail.com>
Date: Mon, 2 Feb 2026 19:36:14 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] ACPI: CPPC: add APIs and sysfs interface for
 min/max_perf
To: Sumit Gupta <sumitg@nvidia.com>, "zhenglifeng (A)"
 <zhenglifeng1@huawei.com>, pierre.gondois@arm.com
Cc: rafael@kernel.org, viresh.kumar@linaro.org, ionela.voinescu@arm.com,
 lenb@kernel.org, robert.moore@intel.com, corbet@lwn.net,
 rdunlap@infradead.org, ray.huang@amd.com, gautham.shenoy@amd.com,
 mario.limonciello@amd.com, perry.yuan@amd.com, zhanjie9@hisilicon.com,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
 ksitaraman@nvidia.com, sanjayc@nvidia.com, nhartman@nvidia.com,
 bbasu@nvidia.com
References: <20260129104817.3752340-1-sumitg@nvidia.com>
 <20260129104817.3752340-5-sumitg@nvidia.com>
 <4432fa04-e67c-422a-aae4-2938be431985@huawei.com>
 <c96312c7-b13f-4f5c-9512-cc0382c1c77b@nvidia.com>
Content-Language: en-US
From: Russell Haley <yumpusamongus@gmail.com>
In-Reply-To: <c96312c7-b13f-4f5c-9512-cc0382c1c77b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/26 7:58 AM, Sumit Gupta wrote:
> 
> On 31/01/26 09:36, zhenglifeng (A) wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Sumit,
>>
>> I am thinking that maybe it is better to call these two sysfs interface
>> 'min_freq' and 'max_freq' as users read and write khz instead of raw
>> value.
> 
> Thanks for the suggestion.
> Kept min_perf/max_perf to match the CPPC register names
> (MIN_PERF/MAX_PERF), making it clear to users familiar with
> CPPC what's being controlled.
> The kHz unit is documented in the ABI.
> 
> Thank you,
> Sumit Gupta

On my x86 machine with kernel 6.18.5, the kernel is exposing raw values:

> grep . /sys/devices/system/cpu/cpu0/acpi_cppc/*
/sys/devices/system/cpu/cpu0/acpi_cppc/feedback_ctrs:ref:342904018856568
del:437439724183386
/sys/devices/system/cpu/cpu0/acpi_cppc/guaranteed_perf:63
/sys/devices/system/cpu/cpu0/acpi_cppc/highest_perf:88
/sys/devices/system/cpu/cpu0/acpi_cppc/lowest_freq:0
/sys/devices/system/cpu/cpu0/acpi_cppc/lowest_nonlinear_perf:36
/sys/devices/system/cpu/cpu0/acpi_cppc/lowest_perf:1
/sys/devices/system/cpu/cpu0/acpi_cppc/nominal_freq:3900
/sys/devices/system/cpu/cpu0/acpi_cppc/nominal_perf:62
/sys/devices/system/cpu/cpu0/acpi_cppc/reference_perf:62
/sys/devices/system/cpu/cpu0/acpi_cppc/wraparound_time:18446744073709551615

It would be surprising for a nearby sysfs interface with very similar
names to use kHz instead.

Thanks,

Russell Haley
