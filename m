Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8C7241116
	for <linux-doc@vger.kernel.org>; Sat,  8 Feb 2025 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739044569; cv=none; b=WApl+QArNYLafisLIWZt/M7CQY59o6SFLjiimsFDPnbBxj30BNakYOp2iN/fC0E9QWL0Y0twbhCI4pTyPQJilgQ1FiQrDmIFLHVU4HvEW44mYVFLQg57lrx6nWgUmLZBYeOexxpzm45V4/yhf0ZJMHpWz8ZOoY/yLtaZM8JAplE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739044569; c=relaxed/simple;
	bh=1drWUIgvHFq0hezfTkFnWaTwhco6irh+3Gr9yrHOpOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lClZUaORxyB7vyE1C+jLjfYBtY7OaUZ/+I7DuO9xDsvl/rj7VI8B6DoA0UKGbHWhe70enkpUbcyMavf5lYhz9JPiQnN0XcUwKVhnPCQGj671eAnSp+jx4z7UQkezMtQPk1LGvp5+o4SVZJs8SYNj2/XTOgi+pb3WBjRvE81aI2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=USE8hKZX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="USE8hKZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739044566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qJrBPQnhtPlXH6IxDYHNsAVehPX7LGhNXc/5vBp7/qY=;
	b=USE8hKZXGrB0K07X8syeNvmINUUNdDRr1CqJ+8wHCX+EU83y6omS/ADXmIL5Z448kY31cD
	/mY5ATWakq+DLMmEFIAZQVaCTqu7X9Eprrk4Ur2LIYisg4QAA2U3z1YcX1aVx8BRv09NvA
	OZ8qWHaFuAk85kr603CYv57/CbXuvw0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-WSzq0xAjNqWTiIBBLRIoag-1; Sat, 08 Feb 2025 14:56:05 -0500
X-MC-Unique: WSzq0xAjNqWTiIBBLRIoag-1
X-Mimecast-MFC-AGG-ID: WSzq0xAjNqWTiIBBLRIoag
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3eba5d45854so3520388b6e.1
        for <linux-doc@vger.kernel.org>; Sat, 08 Feb 2025 11:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739044564; x=1739649364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJrBPQnhtPlXH6IxDYHNsAVehPX7LGhNXc/5vBp7/qY=;
        b=ccIXNd8Y5F4QApX+Cw9FjOR2XpVA1eB3fmF9di3Xw/Y0hUvWCHzIXbBcBpenIjRZ4U
         HJMnRD1VB4PpWKXmtvGSiv6UsUrF1/+C15frR4lWKcnbhk3riYJqai1qJ5Ldak2yYxsK
         hxLLVQABMVhqD2/luMBtmIpXYG7oLgMKv9nrX+D960w5Qzp3jC6temkWL9aZ8IKTIrI4
         NkIkbCftxlx1JAVP6rDLq6ToQroDgciqjGqIVshWiCYsmf/PGJKZanQOVgF+eCTlxFLr
         NjwbG45OcY1kkPL+VqjcoTwBRmogn0aYefvvPuHDkN2bOgWVn9tKow7DSTxTkVRsgp8y
         XIig==
X-Forwarded-Encrypted: i=1; AJvYcCXRNbNDpJLXTE0Wh+eVOdIfDhM9ju0NdlCoO1y6FN8Uoo86xi7I97DxSUzRN3aL2RnGbt0BLqFGn2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7taPemn1SDJZGfwNBueZ78LzharcId98VBD/jxNkUhMOWmeX7
	D2uBkeqeShaaZlAq6muSqxLC9Le5LJKc99qCUEzUrT6y4aQcEuwAZiRNReZi1eR5dFOX9IO44Q9
	BINiib/3ScQceXQzqwhA2amqEpd4j4b7lz0h1+YVMx3FihmWXIUHnk5+wsg==
X-Gm-Gg: ASbGncv2V0/e6AAWUEm30Q2+643ErjXlBZO6aY4YqARhCMKnOmMlSiyfu2USlhWEe7a
	keZky+Nr8+zneKEmeQpSJ/n2m1umtljaGI6v7bY+P+Dau4bs4vfWmLZjN7xGh/rAoLt8PhahZpF
	Xl4Ujhqq04GkC4B17JDbqB+NpQJ5VkBGopuP3ezFsgqHPIOaQUpMRD3WASdtk8Y4WU9TaIz08Rl
	SyCARIGchF4j9J+KXUq25nAM1qZSF5taMi5jKjit4i+DlIRNRvuJm6rRIyHSM2U5qzFEHATaQsN
	MbXr
X-Received: by 2002:a05:6808:80cc:b0:3e6:3116:99d0 with SMTP id 5614622812f47-3f39222b3fbmr5393575b6e.13.1739044564702;
        Sat, 08 Feb 2025 11:56:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF77f8SjJ5aO8jURW5smUN5SBZK/+nJGx6pVJEW7YxApvAY6WlsUk5VVFGjgRkKRDc4TDJ/xA==
X-Received: by 2002:a05:6808:80cc:b0:3e6:3116:99d0 with SMTP id 5614622812f47-3f39222b3fbmr5393561b6e.13.1739044564465;
        Sat, 08 Feb 2025 11:56:04 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389fda9a7sm1417358b6e.48.2025.02.08.11.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 11:56:04 -0800 (PST)
Message-ID: <720944c4-48b2-4d1c-8a02-d81416ed7484@redhat.com>
Date: Sat, 8 Feb 2025 14:56:02 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] intel_idle: introduce 'no_native' module parameter
To: dedekind1@gmail.com, linux-pm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Prarit Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128141139.2033088-1-darcari@redhat.com>
 <20250206164009.816232-1-darcari@redhat.com>
 <6c258775cdf2f8f3c370c0cb81daf22dacf6aeed.camel@gmail.com>
 <9241eff1-0c2d-4c82-a77d-cb8b67cab6f9@redhat.com>
 <c25d3b9abced9263da463b3ef4f31fff73878189.camel@gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <c25d3b9abced9263da463b3ef4f31fff73878189.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/8/25 5:37 AM, Artem Bityutskiy wrote:
> On Fri, 2025-02-07 at 12:13 -0500, David Arcari wrote:
>>> And if kernel was not configured with ACPI support, are these not
>>> recognized? Or
>>> they are just no-op basically?
>>
>> They are a no-op - the flags are all set to false so ACPI C-state tables
>> are ignored.
> 
> It would be nice to mention this too. Otherwise it sounds a bit incomplete. Like
> this:
> 
> 	If A then B. (nothing about "else").
> 
> Better way:
> 
> 	If A then B, else C.
> 
> :-)

I actually took that from what was already there.

So I can add "In the case that ACPI is not configured these flags have 
no impact on functionality."

Does that work?

-DA

> 
>>>
>> Sure - so is this better:
>>
>> ``use_acpi`` - No-op in ACPI mode, the driver will consult ACPI tabees
>> for C-states on/off status in native mode.
> 
> Yes, thanks!
> 

