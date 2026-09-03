Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFBD4A0F10
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437336; cv=none; b=ujOVh8hwC8gVJbw6Yw+w4b31dVWFuNA/qQSQhu5GHEKLlWL0rfNV325l0EIRuyzZuKTr822Bpkq6pt7R3Ot127I4xtYtVUOFBJva2BhpRJ9fOjAAe6Z8JYJHnngsJWhrHL3pbyV17ITgwolCYarHcQjaeHzLY2sdPXaQU/bfihM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437336; c=relaxed/simple;
	bh=BRKIuIMQwGJz+W0+V2Cv4f46rDoN+QkQp0uwFbNfBIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzbSqyNKmu3CAOw3CKi70Bcd2M/bwe+Pn6SmrWN8BKvOs3R+yLWnyZ3WqiDoWU6M/bztyDuTpDU0ENj7uLMEdVWphBkPyvZ8rzL4bB7uw9POLNOpZkpXmP/EuGWbFfwwsUzRJd6dciVR6SWu2v+2G8BSbyg/4Vrjj9vTYbdqK+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNTleZLj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNTleZLj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso14591315e9.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788437332; x=1789042132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRKIuIMQwGJz+W0+V2Cv4f46rDoN+QkQp0uwFbNfBIs=;
        b=LNTleZLjtLgIkdeZGbBPeA9ZsjsvEyJPAhQhNw2PZd7ulApEWLz537mrDf9ZD5zD1W
         IKRBieQ9ZE3yGWPobxeG6n5BXCN5/89i/ov0Hy5ANlwABc6aLPvxpegb5+l79KI6X6Jo
         l+vN6k2xe86K3nisCWYEpHTA7W2K9seBjLKwpUhDxHnaCXI8KzgJRYAqrxjPPrFF4pK7
         oJV3tXY7t5rvjU5gIw4KkjJdJXJ2Jp0YSmz9uJ06ODrtEjzDrZu+sZSay4S6Upq0eK7c
         xB7EzuW9XtK2N2yhAq5gu0jbPGqKb/czT2e3Z6vn0F1ejmGraUuNngCFotffaXXogYwJ
         uJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437332; x=1789042132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRKIuIMQwGJz+W0+V2Cv4f46rDoN+QkQp0uwFbNfBIs=;
        b=cT0BEKGz+mzRGsGedFIEWtpILvaQLwSFhboeLZ0DEpb/5nUJlDc/QkpidQEtlAVIh3
         wYe7OHcXbVxxDSbRF3drWhQCKmJATk6zqCORmuA1kB/VmVpteWq8NsHJiTTLy0SDhNKv
         q5m3r0zmeTNwfOlYnjgkCdM1AQmX43AxAuQ+nMhbDnR6viE6tfoMcQTQbA4CcwDFSoPb
         KIvpNQckg4g6qwfTJrDKNf3b+8VVohIA4V0rXIHTOHx6ryQhjH9iW3ZckmF/kl5xApmT
         RnVc9i+Ab8x8+UStyiGg8ufhY5onzDk3Ch2H+SPS1O6UjAu6+8HAKdplXnIsUjOBhUHe
         T8ZA==
X-Forwarded-Encrypted: i=1; AKwUvBy/ryvZMhYy2/2wR8xqQBKl8fopt5AItuRU2I0puhT+zkQcWAw+XcjZlFhNt9XiFHM6zE0oyfqnJLY=@vger.kernel.org
X-Gm-Message-State: AFuF++meDdB9NGWaB6gTWDIkEO/w3lErQmJDUG2T+TWd/npR3HIYSpve
	9Ht0IiBZHOJ+k5hhFLypZSKsZuIWJEZcrp5JU+TPCmZKOfHPGyyxG5K7
X-Gm-Gg: AYBFou0PazqFLmwXkto8CD1MGAEbvLEIYG1abhqEpRmOd9WvWnhF89J4FwzOzLZEfnC
	AsqBmClVbdCjOy4cQyecmA3qBRi8uFe7CWwtYg6bbIGfGHAvkwyDk0wPPL9R5R7GZgj4gwdXF83
	MskYKFykYzZLiQ1Y25FxkEBwYMbeFJOVKU6IJeKBnsB5YjlG4VYFujO17i4laPTf3NT80oPlCnK
	Cn3n7Crf3EX1jPiMyUf3JDbUvCTHezi3dPX/QqrC9j0QqUaW/Bcv82Ir/KK8s/61oJl2G0MbZeX
	HCEnoVRIObfNaMQZeRecNC+qSBFMRk9ZFgKSqWWhcY1IQ4S4xbLKwpcX1MJxZ0uNR3PjnvGBwJw
	0c9R5bfoJ9zJKw2xsLxAt/EqK8p2rFWziaiubRygP0Tmd61b3/z/R4wVf+s4wy5cZqwt6qGBFe9
	ss0DWeMdiyFMEyAbr/8fzMy+b/0Dva0E0EHdHrz6IMwsXlKt8StZ4Ln0bs4vA0ILqh7gkZPpAKT
	u+k5a1zXCoVhPtWq3vnHlbFY59wOSa8t4/txF1bwhizJdjoLnBptOnOIRdjZFPNCg==
X-Received: by 2002:a05:600c:630e:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49ce55ecea8mr213777445e9.3.1788437331849;
        Thu, 03 Sep 2026 05:08:51 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-247-184.092.208.pools.vodafone-ip.de. [92.208.247.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf0c1728bsm52458095e9.15.2026.09.03.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:08:51 -0700 (PDT)
Message-ID: <98851819-2079-4505-b8fa-1b6943ef71e2@gmail.com>
Date: Thu, 3 Sep 2026 14:08:50 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/20] gpio: regmap: Use regmap_test_bits() for single
 bit reads
To: Bartosz Golaszewski <brgl@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Michael Walle <mwalle@kernel.org>
References: <20260828-ad7768-driver-v5-0-e33ca6f841a2@analog.com>
 <20260828-ad7768-driver-v5-17-e33ca6f841a2@analog.com>
 <CAMRc=MfV+ziruvdyFU-RTbD09E_Jhpxgaab9T6bG=tuPg-jhLA@mail.gmail.com>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <CAMRc=MfV+ziruvdyFU-RTbD09E_Jhpxgaab9T6bG=tuPg-jhLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/26 15:48, Bartosz Golaszewski wrote:
> On Fri, 28 Aug 2026 17:30:40 +0200, Janani Sunil <janani.sunil@analog.com> said:
>> Use regmap_test_bits() when reading a single GPIO value from a normal
>> register and when reading the direction bit.
>>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
> Janani: the GPIO patches don't apply on top of current gpio/for-next. Can you
> rebase and resend just the GPIO bits separately?
>
> Thanks,
> Bartosz

Hi Bartosz,

Done. I split out the three GPIO patches, rebased them onto the current gpio/for-next branch and resent them separately as v6.

https://lore.kernel.org/r/20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com

I will drop these patches from the next version of the main AD7768 IIO series.

Best Regards,
Jan

