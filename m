Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428773EAC89
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101932; cv=none; b=C39khilBIuP3CtaWYYI3VJZIF5Xi9Gk8EJGRgqHg723xOTwAVe8Fr3BIWYl4PLoTpMkFQvqo1CpbYCSrCMNZ+z9XoGxbL3ehU3Gz64tdHqPNtfSaCTkE2lLRxjByLs7elxh6iaRVWz4RvRgIUrUMGH8vKLZWG5AjIcQnJYK3FLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101932; c=relaxed/simple;
	bh=kSL6GZts6v+waFfKhqYl/IdC+/kKb177D6xHvzMR/4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBN8uo/YMi//8CxrWTOYXe5ndRlI5OWvRWqCNaOr2mN9h7rrO6x7TMpxlou7eICwCkNo8qMqxTKt2b9i9rbBP4aH9ReC6HcBGTz4AKDdO675KMnxeEZrEZm6KYZTiexbdd3qDrG806mp4iJ4KkGwHOx+DdPFhwec43KsLVHfIdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEjQuvl1; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEjQuvl1"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so8184371eec.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 03:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101919; x=1779706719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=guulY/czompKgO0Ba6aB4aCZrOgAPdTJkMrk16h99KQ=;
        b=aEjQuvl1mG3PMKxY6nPk36pUH5JuSipImHLCbJ2/x+AumVgkvzLJEuKtk5SH6bLXDW
         A5J8XXn0hKvGC4uW7a/GErYSQO9jEbc+af8g560RQWCPEVarOZuLrJVwKn6c5FAINpXA
         xRc989kBMp6SdB6ZsPIUfvd5pNJdsn2aT/XHIZ7SjMKShXyDP8OYlUZ3+3803y2LONL6
         xC6n3FbXWw6R01fi6AsMCpmRTI/1vqah5JIPQh6b9Eotq93gfWQLW72/TtYmj4gRnZ30
         EQbTKxEblqBeAniVC2bkkJSjeMjKLRoNDR/YNfGma0laFqymRWpqoMgK+/ww6SGS3wc8
         xo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101919; x=1779706719;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guulY/czompKgO0Ba6aB4aCZrOgAPdTJkMrk16h99KQ=;
        b=cExf2RQeOyVOAF4rPG1p2CsIfBazhjLEp6uu8wLQL+tutmgOCf3+iPHzYO4hR1Yjbq
         U+EQxQ66DWPUo1XsG9/Otakzlkcf++JYTsBGGDmAmSgAKPKEFD+bArRHs+sqNZ8JqUfc
         uZJVNq368OSaS032b0kwN5P5UoDI5JTBHagtTMCEXiBK8cQkkHCuLT83o5MCFuEyFjDd
         HHmUaE4ZcWVJgA4yBthf1i4otnTU7iwzhLmMcDSSIRxPGDXBOhmWG86TpQz7T47isAZ5
         CoG5za/2HYQGRP6+sZq3pUJmo1XTjtESVI6TXdvN7mPU0grs2pZGC5I8iEqA0M8JAI7r
         Mcjw==
X-Forwarded-Encrypted: i=1; AFNElJ9bBHiTc2AJfjbQ5QlvkXKHcQ2TbEkZqkkO+FpergQv77ALinYZCpfDO9kCd223TI8sH7kizLU1qVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJEgixhOEXyoAa1K1Ma8iyfNCPaI+xUJO+u4avMFx+q4Vt6Z8w
	/hgxqy6aW8KyVVnwNvU4N93ZsVWB+ycpN0y7I0Eoa0kxrCM1eOxHQkr3nEyRCVsP
X-Gm-Gg: Acq92OFC+5QeIN9kDiyfVR+jc8DThAN+hBtEy23gz1pu0nYxVm8n0zED78CoF7oFq0h
	khbiX3rEk+K30CrY2r/BO6weVg/OfTJ68MKacF3NkS+W+bzT2uj7J5dJ1tHxIPvo2kSdOEyMuIA
	VuSpEC3ZIMwA64cWmtkgFpSQCQIBBu+Z87ukcblxnPkzM3MvC147n6DJYfEFkWc16CjNCvzfluf
	Ebr7ftpn7VBbyHOWbz3k/Bzw0UzfJxpR+boz22XEjeJ1ACt3tM5PbkdVgIaqtJXqvglg/2zH0VL
	VBCb566GQZUooqlkr+W4zWjovuhbze4jI6FM57L0Cr8ngTToNCf2iBweE7aikaRln8BBrEN1Ixe
	kN78yqI05JwmBcU69JkuEYdc2ht39ICTyYvtQRZEikWyHxatV3Q2aofY34kCqfrfZZp6YtHZpPf
	eV8le/I0pAtVN4hOkD02obbjpdqwrPe5xARvu54gWnCeZ+ZGbXDJJq5zT6iTMwjK562eqyO8yM
X-Received: by 2002:a05:7300:a286:b0:2f1:6252:f8fe with SMTP id 5a478bee46e88-303981914a5mr6338309eec.3.1779101919432;
        Mon, 18 May 2026 03:58:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e69esm16592264eec.1.2026.05.18.03.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:58:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7e0a499d-9517-4559-abf9-ffbaaa45f12e@roeck-us.net>
Date: Mon, 18 May 2026 03:58:37 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hwmon: add AMD Promontory 21 xHCI temperature
 sensor support
To: Jihong Min <hurryman2212@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Yaroslav Isakov <yaroslav.isakov@gmail.com>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
 <20260517130407.795157-3-hurryman2212@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260517130407.795157-3-hurryman2212@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 06:04, Jihong Min wrote:
> Add an auxiliary-bus hwmon driver for the temperature sensor exposed by
> AMD Promontory 21 (PROM21) xHCI PCI functions. The driver binds to the
> "hwmon" auxiliary device published by the PROM21 xHCI PCI glue and
> exposes the sensor as temp1_input under the prom21_xhci hwmon device.
> 
> The sensor is accessed through a PROM21 vendor index/data register pair
> in the xHCI PCI MMIO BAR. The driver consumes parent-provided MMIO data
> from the PROM21 PCI glue instead of inspecting the parent PCI driver's
> drvdata. The read path restores the previous vendor index value after
> sampling and does not runtime-resume the parent PCI device; reads from a
> suspended parent return -ENODATA.
> 
> Document the supported device, register access, runtime PM behavior, and
> sysfs lookup method. The documentation also records the observation
> method used to identify the register pair and derive the conversion
> formula.
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I'll need an Acked-by: from a maintainer on the first patch to apply
both patches, or this patch can be applied through some other tree.
I am fine with both.

Thanks,
Guenter

