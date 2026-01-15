Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7AD35EDAB
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472660; cv=none; b=NyfLWqoWSgq5IbytA+RL+OEF2sEJiKDArVyFmKqwMYztMUiJY1DZWHZRteGx8VaBJkIeEnK+DcSLCrLcuh0AJ3jFCfqNHcU4gRy9Vi5nkI4OjuCUd3zMyUJkCsKLTd2jXK0pIHSXYdTKdKbueiWJtam2I2Itt9uXPdq9Lm0iVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472660; c=relaxed/simple;
	bh=LnL8PEILXOHYUFOavVHmQg3bEM1znin2GHQAseAU4rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aip/aiQRGyZjomzTPZ+VQ+QAK8OuvR6fUvUA9TAh3TFWKAHupUJN9UpdCvxiv+vD4f6LklsV2OYqb62UU8JI2QBGS8nnZbPglbXQ6V5ZHG9G2kUmsS+X+Kkr5bJTQ2O/xH8MxcFdsfdvTddAKmsur0Xl448oAqI8Xw/jWrd6ics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJpFJjBU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJpFJjBU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so592956f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768472657; x=1769077457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LnL8PEILXOHYUFOavVHmQg3bEM1znin2GHQAseAU4rg=;
        b=NJpFJjBU3/XqtxVRr3RKFfQ16T9hVyIFJbV3/rWMI9sttdJgyh+GfoLix4B+3/7ijX
         VP/uknAJhXlX8sg354swG7hAhAEsBjlmWwCliL/rkvnWTnqMXHDrzz6YmEZjPX4Wd2ea
         AQBRKS8GpOQut4BCrfS+hyeNA88E/pmTqy1/yGU4jbzWDEn4r/BjVo2GDcbd/ug7Bttg
         pJK8OTEUV1RkRV56rUfkBmLvIto05mmj/qgE3n+FRHPsODOThQXGDsPEK6tn+vLbAE5R
         gjmLd6pimTEiU/ntiQig322ehmKuTDMBZpSOxsQgJTCW3XzvDGhKgv6GzkWHC9RoCjI9
         RqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472657; x=1769077457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnL8PEILXOHYUFOavVHmQg3bEM1znin2GHQAseAU4rg=;
        b=KxeQokflWi7PbN52Fv9/QApuHLgFcq/ZKZbsibo2LwUakGoAsEkj+mj3ROrrjSQ5Hp
         O38b4sWQOOXRruiOHsWcGH6mkpLalswwUTohhor9fCun8UX+r+rRQR4uc+gWxA0XhvXW
         68MgS/nokNztAZkl192DyXvypqvy/aJGEVu2xicb0JP9XqjQ+cbCh2jLKinSzue4ts3b
         WtdUuI+0b91s0MB6NDsn2QFq5jbg3vfJl31secK4OLc4wkyYr0g70qQDRn6v6HfVzWlL
         OpNA2E6DQun54YXCOAdDnw1Z5ggbs7KyoGGrLnW7ek0rYnuEGO5iWF/gBqCWsRUpDlgF
         Mjdw==
X-Forwarded-Encrypted: i=1; AJvYcCXp7TubqgjCAIjeaIAFpu30zYEIKX9Bom2l/HI4PAccetL/9pMt5YOrK1na1M9gF/5wJ1z1mNOIcc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoozAZsDq0fkzg9xWTqYzrdlFu5lLgWfmBHf20lBncXQjfGhpO
	nXweHmk/ZtsW4UB5B9pU8Wkd2GErxmtkRQ9qUZXVKUwKKF7ShDT9EyOy
X-Gm-Gg: AY/fxX65zlE+mXV580LrDBtxTgsR5bU9ThGll8MYUILBcFcK2XhISktfZK7McnsiDqh
	rGLY+ZV4qkFqsnNQZDuP7JBuYzLl9hlPBoijZtW6sUtsGxFgHzlKqnGQjIK/xx41lLtvN77Ohcw
	7G20SXnYpjE2RAU0gmEvo0muxJrYIafm5vk3Veitv8QJdkSEkH0vHkpJNs6ymfNFJ9gldM2l8LJ
	ADr4gY62wLu7gvuWmd1M1cXHXB+I8Ca/v+rfN8FvEQNWh2jZq39jmFyCjA/CQx8cR8+MrjlQbVC
	kPDG6bmBURwwuNdaSFqgUo5whOpHRjVER0GQhO9G7DhUdqzviv94GIqouYhh37nQX5Eq8r42g51
	asv0SAqPbOOdvs32NJVBFfIdBGn+x/PO4HC6Ly7qMo8ONqIn/Pi8Vyu2Vvjf0NOeYL+LVCqQBrD
	uk5XdrwJUDYYrsky9bXR6L7zNuHw==
X-Received: by 2002:a5d:5f49:0:b0:42f:bab5:953b with SMTP id ffacd0b85a97d-4342c5010f2mr6772659f8f.16.1768472656687;
        Thu, 15 Jan 2026 02:24:16 -0800 (PST)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6b29b7sm5062627f8f.23.2026.01.15.02.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:24:16 -0800 (PST)
Message-ID: <5b3cc813-9244-4ff2-b00a-cc8dbab7e144@gmail.com>
Date: Thu, 15 Jan 2026 11:24:13 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add max22007
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, gastmaier@gmail.com
References: <20260114-max22007-patch-v3-0-769298f50b8a@analog.com>
 <20260114-max22007-patch-v3-1-769298f50b8a@analog.com>
 <20260115-elegant-hopping-kangaroo-6cd32b@quoll>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20260115-elegant-hopping-kangaroo-6cd32b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 1/15/26 10:24, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 05:17:01PM +0100, Janani Sunil wrote:
>> Devicetree bindings for MAX22007 4-channel
>> 12-bit DAC that drives a voltage or current
>> output on each channel
> What is happening with this patchset - why are you making somehow
> unrelated, different, unexpected and incorrect changes like ones above?
>
> You are supposed to work with Git e.g. on dedicated branch, so you
> clearly see what you did. Why doing such changes?

Apologies for the confusion- this was my mistake.

I picked up V1 of the patch by accident. I'll rework it to address the incorrect changes and will resend the corrected version.

Regards,
Janani Sunil

