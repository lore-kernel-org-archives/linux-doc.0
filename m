Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BEB2248A8
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046309; cv=none; b=sut5pm//HDpR+BK5yDVvc1+jx5wOUTy+lglw6/DdvkqwbO3/Xlv/lppGo9eWbFJjxMON3Th27HH/gX05Wm27DGMcy6lxJCQ7LVX4bE92gJlJwDjyMb67g2Rqmbm6XeaVtrtULTtLxtj3GPbyviAYB7p+qkh4218Sn4soS+A1vMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046309; c=relaxed/simple;
	bh=HaSLdUfjo+ndtARltuxzMFZ7pO7xIlqmAt9VSiMwTRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOe1SIgt61xg7XP0n9YmsASWKdz4cryLV/xznKP5Op2Ce9NIcxXWts/sjrb9N3xa6TLGBIup2Nn4H9pkgiEAdt99Mq+X7ytG5biho6ndvAd/FUNgApiosYsrLlM1eOr2JHjhe6EspcGCiCZ/DprAXyvf6CG8zKh/dqQo3EOfx4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C08Ey6VJ; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C08Ey6VJ"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45c87d82bd2so3088254b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 07:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770046306; x=1770651106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgPLskVZbsnwpPXjI0Uy3xPQbW7GUfPIAOi3y1K2veg=;
        b=C08Ey6VJLhV/xq7zMUwqu2azzvc9O3JrazCwCqVbNxkkSX+hLHSDRnlEmlUeLQZA+0
         mbMA56P9TG1iG+tzRuInFnxU4AUmjsCHvEd5AXyIcEYztETIsOIpqWaumLW1OCn1iFLa
         DvH4fLVc8E+1RwUVQzPCucACg7Mu4DE1+yd1XRYYke9PBHZE4Up5xexj51r9TeiFm7f0
         4OJX/gXV9tyPD34EY4Q+0oKtVP/ZsOFNuJiFob+inThg5Wbg+dLCYWBfV0je+65RP7/y
         Sg7EaDe9XwHxxRKfthe6NcbyctS2OfSUrDPWv9fckpYOKKBOmBuZfNRsP9D0sbhz63GQ
         LBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770046306; x=1770651106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgPLskVZbsnwpPXjI0Uy3xPQbW7GUfPIAOi3y1K2veg=;
        b=HIgNXQrK1UHK6nL+l400KICCbfejHpEGqeN6SFKoOSpkOpaOKgRVbeu+QK2J1QpCA/
         vEwl2bLLkxXz8+8k9aktHiHxktUrTWKF3cG9vfjVrWUdD81BNQcRi7DdmHAPDcY7MVfm
         2T1v/QiLzWVI4yjLPx2jcgLV8rATuYxq/ERv3LDJ3Chj8x5clGOp3ndv3IjSMnusbLsT
         3ue6yKAkXFKImeWubk2dMHxoKW0u1dKvKxg5mifSf8GzJv2dOW8KXr8dhABo3cZouSR1
         GPXgrhQ4faMBxcxukgyVNVq6ntfvrSZbz+EM2kfB5Gy9H7xMPXyzqQ/lFZ5PgyWzOT3z
         1Xqw==
X-Forwarded-Encrypted: i=1; AJvYcCViGbjnGrWTlzJ26ghA4Ig2JResBvx7lznjUdL2SwDyAENSZx8PYqNLSW8OmDHm3MQJOPFfTLgUx4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6IdEgw/jRU22EqK3Xl0NEZnHC/aYSRMQLdqU5UC7/qBx4BnSv
	FMwg4bEzKaVpsjaHCh3tIwLL3D57fdne+4dVuPKFkySxgF8kbj1+wnbHed6keC1hYOs=
X-Gm-Gg: AZuq6aJo8WFolXzl0X6IvYdLq+35Si3Denv8ibsEcuxWicbuh07wICillJ7KV0CAOav
	J2PY1AsN797mwIN7cYWS02DotfUK7050cpRc57hYOdKDz9ioBglL6+sh0UV3AZ8K5g2O7r1GwMH
	Nz1+UxI5RgRdNcLJ4ACzsYBcBprYntK9/jyjTuJw7/Xw2PLx1s4u4wKmoNXLFqwtsnYyYO0f0C1
	BpkN1GeONBB7vXQ64SzuUZJKM3amT3jK4QkHjPTNzU+ZZJVJglg8e3L9po8FUelYsvzoD7aWuY8
	ya8d/0OKsi8vwZmad4vsNxr3FqCHoAExZeFbtggqRcF4USLjWp9MxUH32rNPQv/dsFNyeFCorFv
	LrHlCqDmqcL+lYsErQaMDobrtlxfzoQLHnjTp9r19swHnjR6RVHzxBj7422JmhICJqbPyIxe/BX
	XZwF2SpQImvyyITlbA93J8WyGc6eJdB0Ltl6RFbVYTdF8sVoel4sDAK8iw6ubq
X-Received: by 2002:a05:6808:309c:b0:45e:ab3d:2378 with SMTP id 5614622812f47-45f34b3c8f7mr5806724b6e.6.1770046306640;
        Mon, 02 Feb 2026 07:31:46 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d1a6dd4423sm6567145a34.28.2026.02.02.07.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:31:46 -0800 (PST)
Message-ID: <745218f5-fe09-4a20-9cff-ee2ca28143e3@baylibre.com>
Date: Mon, 2 Feb 2026 09:31:45 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] iio: core: Add IIO_EV_INFO_SCALE to event info
To: Taha Ed-Dafili <0rayn.dev@gmail.com>
Cc: Michael.Hennerich@analog.com, andy@kernel.org, corbet@lwn.net,
 jic23@kernel.org, lars@metafoo.de, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org,
 linux-kernel-mentees-archive@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com, nuno.sa@analog.com,
 rdunlap@infradead.org, skhan@linuxfoundation.org
References: <afa85a59-07c7-46c9-990a-b0b34599cdc3@baylibre.com>
 <20260202151939.15893-1-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202151939.15893-1-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/2/26 9:19 AM, Taha Ed-Dafili wrote:
> Hi David,
> 
> Thanks for the feedback. You're right—"missing" was poor wording; I’ll
> rephrase to "implement support in the core" for v3 to reflect that this
> is an infrastructure addition.
> 
> Regarding existing users, the current lack of IIO_EV_INFO_SCALE in the core
> forces developers into manual workarounds to stay ABI-compliant. For
> instance, in drivers/iio/accel/mma8452.c, the developer used
> IIO_CONST_ATTR_NAMED to create a manual in_accel_scale and linked it via
> .event_attrs. This approach is static and bypasses the standard event_spec
> infrastructure.

OK, so it looks like there is just one existing user of any events/*_scale
attribute then. That would explain why there isn't a IIO_EV_INFO_SCALE.
It just isn't very common.

> 
> My goal with adding IIO_EV_INFO_SCALE is to provide a standard path to
> report these scales dynamically through read_event_value(), ensuring ABI
> compliance without manual sysfs boilerplate.
> 
> Does this core infrastructure approach seem like the right architectural
> path, or would you prefer I stick to a driver-level attribute for the
> ADXL345? Regardless of the path chosen, I will address your other comments
> in the next version: I'll fix the "in scale" typo and add the new scale
> entries to the adxl345 documentation table.

If we think there will be more users of this and we want to make it more
discoverable, then adding IIO_EV_INFO_SCALE seems useful.

I would wait until Jonathan weighs in with his opinion before taking action
though.

> 
> Thanks,
> Taha

