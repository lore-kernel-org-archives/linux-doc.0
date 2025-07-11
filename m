Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB872D0C6B
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240117; cv=none; b=Dg7EtsR1/iawoYUKO5udDs/V0rHMqgPs0hVAfEBkickn6WTS6U7IWG6I4uKfZP55NPIRlQV/6pArFMO+7EcuuRFubbC3j1NtDzLx7MbWDFYBp+TxIB7LrF+AmyYCPdqqJ0i/cZnv9KCI+WEjl+cQKt7d3bz6RWXzZP+cSKHDVSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240117; c=relaxed/simple;
	bh=8jLN3VZCDWiz300MGRDmfjBkchE7cBbAjFIEj2bshrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoV75PJDi04EcxkltOF0Ah+ciKQRdJalYg0blzXA3a4DBVDJ3lRbB+iz5k0BXi7uQaRiSORexv6CDUEaaiJvf9cecM3fqnPKGG6LY3HxbJlgBZnMJeJ0TCi9k6j0umVNLb0xroenloPVLwcuia/LpBw9SYUjasdj3bAnSNg0DJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjnmRR8t; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjnmRR8t"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso3992151a12.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752240114; x=1752844914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSqbWCx5pmMJhs42gMdWbuhtuhEPLEOyZUmlt10BWP0=;
        b=gjnmRR8tJHmoSIIdteeVixY1RzopS8+WN0DLdzTUi5dT1wO69iEfs2Ssk72qvVo1Jq
         Bmxb96Wan5dn03Q5Ab1RJmDXiCwEzTrH7Va9cGEvZaaiMgcududPBDNP+S5oUAyC7d9z
         eKTUMYKTbVD+6dA0OvDiBzX+9hm+Pz0JFAaqoocudrHLorT1OlEKOV0XKxC0xFQj+9Ge
         6G3Cli8P6I3K3gatWQMj4UU2q4O3WyMPf+woGrUzAS6ngTz100Ws2JvHXjxyXzl1zn9Z
         w8g9fpG/RD7DPUGNf/y0fF0dOa9C6gPhZunxEvrhWuCZW/L8DjPcwKenGt0QNjP7Y4+Q
         rzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240114; x=1752844914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSqbWCx5pmMJhs42gMdWbuhtuhEPLEOyZUmlt10BWP0=;
        b=D+X6/ZZX3b2ZlWZnWouAEh7zWZ9Mkp6Hx6RFofFPOc2nx89aamaIQ+fA1A1y/dayCG
         Y/5ugXQi3jBUDj+Ntf97veSQlFdoFelPCIHopPWKhEXG03GrGlHxYWQDhXhLTnuzB6Nq
         jzus9YvpW0yIxfO0+hAcrndGrBFvUx+UR8ma0i6wm0m+kwCNi7EK5WjhqmglSQWy8L7V
         eJmbP4rRdSiAk916n01Zl0IpWzaqdLpqrI7HpE5xTSFgouzXtFlJUsflmC6pYbOIszMg
         DNiD3YS6uKUcukPpuQmMmtWlz6YRBqKPSFZFP1YWMvuCb+1+ZjIkM4JYJhESuIQ8DvL6
         nX8Q==
X-Gm-Message-State: AOJu0Yywh8YDrLMWA0kMRYF1qwdX40CDzjwox6BWTeipMAlT+9sfbFjT
	jnLdTS5P3c8mRNW05jU+o68EVKRpFMVLMifH7ubXrd5gfvCMLBmzJAEo8Nvi59ln9KE=
X-Gm-Gg: ASbGncvhVVCN2QKwkbx4q+TfBL/wA5x5tqQx6dq6TGnx3oF/6mbiQbBsFHrZG8q/vr4
	oulhi9Es/ETOd/MhH+0wmvio/vxX1b3Ukp1bDPzANpiMrcs5TAqMUpEXr+dUNLuuHDt2eRRWsVy
	hd4mnVteebEIKc8+tAwhE20v/axouX42SfDh/8Is0b4qpKAleMVSM3EInF85MvCbtn6+9q57Ebr
	Pn3FAU+bJj3vTdt9o5x+kL9MuBlJigzEBhNgC7WVW02A4L6s+hQii6N9ET9FfuM2SRnAweaEcY8
	nQuec2o86nS7zbiLOj2n8/N7GI9Of/wYGjg/Q3Yj/wCGvx6dzaUFJ1ixcFnlYm8JrQDmSkz7+zt
	KN0Xt90U23pY7kydQo5MARHeEmlyr+RW2
X-Google-Smtp-Source: AGHT+IESlM3QZpNn5nGs57f0DHmGN/JSKJJfdYT4k8FVbPsu+vncRpIcT3st+meVCcFx31rG3EVMcA==
X-Received: by 2002:a05:6402:26d5:b0:606:c48c:fb8e with SMTP id 4fb4d7f45d1cf-611e7655f5fmr2860534a12.11.1752240113639;
        Fri, 11 Jul 2025 06:21:53 -0700 (PDT)
Received: from [192.168.0.251] ([188.27.143.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976f41asm2174574a12.63.2025.07.11.06.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 06:21:53 -0700 (PDT)
Message-ID: <b3de1e2b-973f-4b4a-83f3-6015808b3772@linaro.org>
Date: Fri, 11 Jul 2025 14:21:51 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PM: add kernel parameter to disable asynchronous
 suspend/resume
To: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Len Brown <len.brown@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com,
 rdunlap@infradead.org
References: <20250709-pm-async-off-v3-1-cb69a6fc8d04@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250709-pm-async-off-v3-1-cb69a6fc8d04@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/9/25 1:31 PM, Tudor Ambarus wrote:
> On some platforms, device dependencies are not properly represented by
> device links, which can cause issues when asynchronous power management
> is enabled. While it is possible to disable this via sysfs, doing so
> at runtime can race with the first system suspend event.
> 
> This patch introduces a kernel command-line parameter, "pm_async", which
> can be set to "off" to globally disable asynchronous suspend and resume
> operations from early boot. It effectively provides a way to set the
> initial value of the existing pm_async sysfs knob at boot time. This
> offers a robust method to fall back to synchronous (sequential) operation,
> which can stabilize platforms with problematic dependencies and also
> serve as a useful debugging tool.
> 
> The default behavior remains unchanged (asynchronous enabled). To disable
> it, boot the kernel with the "pm_async=off" parameter.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Dealing with the pixel6 downstream drivers to cope with the changes from
> https://lore.kernel.org/linux-pm/10629535.nUPlyArG6x@rjwysocki.net/.
> 
> Similar to what people already reported it seems pixel6 lacks proper
> device links dependencies downstream causing i2c and spi client drivers
> to fail to suspend. Add kernel param to disable async suspend/resume.
> ---
> Changes in v3:
> - update documentation with "pm_async=" and "Format: off" (Randy)
> - reword documentation to make it clear "on" isn't a selectable option
>   for pm_async because it's the default behavior.
> - Link to v2: https://lore.kernel.org/r/20250708-pm-async-off-v2-1-7fada54f01c0@linaro.org
> 
> Changes in v2:
> - update the documentation and the commit message to describe that the
>   "pm_async" kernel parameter provides a way to change the initial value
>   of the existing /sys/power/pm_async sysfs knob.
> - Link to v1: https://lore.kernel.org/r/20250708-pm-async-off-v1-1-1b200cc03d9c@linaro.org
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 12 ++++++++++++
>  kernel/power/main.c                             |  9 +++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index f1f2c0874da9ddfc95058c464fdf5dabaf0de713..06beacf208de3242a3b4bb2413ab6cd3e0083f15 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5000,6 +5000,18 @@
>  			that number, otherwise (e.g., 'pmu_override=on'), MMCR1
>  			remains 0.
>  
> +	pm_async=	[PM]
> +			Format: off
> +			This parameter sets the initial value of the
> +			/sys/power/pm_async sysfs knob at boot time.
> +			If set to "off", disables asynchronous suspend and
> +			resume of devices during system-wide power transitions.
> +			This can be useful on platforms where device
> +			dependencies are not well-defined, or for debugging
> +			power management issues. Asynchronous operations are
> +			enabled by default.
> +
> +

I just noticed an extra new line here, that checkpatch didn't catch.
Please let me know if I have to resubmit, or it can be amended
when/if applied.

Cheers,
ta
