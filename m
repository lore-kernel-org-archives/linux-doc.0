Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034652D7DEF
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031411; cv=none; b=SbxI2bjW0PGtcamnQd50qbVj53F77xzI4PIJhnrr4OhxMjAe7kURW8JWMakeZuU6podLBFlAtH6l6tjGqdNbMzF6AivdryIjnuJcWr1RnV3Wz+lEKEQ5RT1UO1hnSgIeKdFVYNyXsUO61r7EMQNXhWubLDJNsD+skwZDUPxC0bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031411; c=relaxed/simple;
	bh=MYsUh7urxhgOMr+Qi8MfeXHMmzPh55LuXDz7NmF32GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBAVBw/QCmrPafW8bYPB75rnDDRHjmuZzp81RjUUbQQEufuX6lHXqsndud9BGT2qVl+TVIMLf7G/q/7BCoV9tQpjHb2Min6oYXF4w2C9rm0sqvPezjq+PvOfUlZrVdQGhYI0txcMIhryLdNlaT7sdX8qQByLW4rbkaxuk18HUEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8YVDQBJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+8mfaxm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8YVDQBJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+8mfaxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789031407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+3XiVm2BSc0hPt9jP/xvmeAgnaOCDwoBy+TAIUxAixM=;
	b=P8YVDQBJy4+wkXLwUw3Tg61Z13x0H73ix8Fvl74+zSZE2XQaDa17Yry622f0x4ciCmRlOV
	WOwECifVVSabXjBCu8YLgaTMXxAIBPIvufO+TkJbTRxfdMSTBM0ISZAyt5wHrDO/V00GNg
	PBgkwdMx0js+prWSr5bO91DkLb7rRLs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-_Q2hQa_WOdO1twb3wMCa2g-1; Thu, 10 Sep 2026 05:10:04 -0400
X-MC-Unique: _Q2hQa_WOdO1twb3wMCa2g-1
X-Mimecast-MFC-AGG-ID: _Q2hQa_WOdO1twb3wMCa2g_1789031403
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b7c1dc61eso54595475e9.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 02:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789031403; x=1789636203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3XiVm2BSc0hPt9jP/xvmeAgnaOCDwoBy+TAIUxAixM=;
        b=Z+8mfaxm9C1zWPeHslJIU8VIATH/AduLrXgdzA/68+gMxxUaT1kOXmlKoY/q+NBD4L
         YLYj7R03EkvvyjjUyozS31t3aBoYRTp76oNCT/B8WqMk9+FscRlezT+aVgzz17zzxLcc
         /yDKw6DhDuF+a17uBHdSfDQVWUbPF9tOpoWavm2BX2L2tvzsKPWnr8a8Y81QLFtENgHL
         wHlLW/T5rzr+1n+SWy4blzU54Bz+274LT3wKgOMzFleTbH+n8lLj6n5Gu2jgsHXoTYjA
         gmySNAkMdKIwqbFjqNv6q2C2M+Kilp03oDkOsWDg/ChIAI2bJn6+40x3hmmhJ8cJwKwb
         /ySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031403; x=1789636203;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3XiVm2BSc0hPt9jP/xvmeAgnaOCDwoBy+TAIUxAixM=;
        b=A1wv/7/DBMkoWITaL9rTFsSKo80BsEsMVINlW/PCDOtxU77hqBTiypjPw18v5XnxIf
         nD0Rs6jxxQuPXc5TdHUBqjrLhxaW/lMDWW1E4QkUncQk14INjZ0LDwKbqEIfy29m0Nsw
         ORcEFOc/8KLwND9VChRZKhVHCJ/Iz+woWEUdkEZVLMHs0o358D8N0VX3fqFmMOUOjDAx
         7B7AapvwrAjNzVfKfM5L+KlpgZjiAWBCuI3v7c4o/WxhH7IqN6SuinwfmQqfSn3eO1ZL
         ObZFsElsILo1RXNT6PvMWTcitEB0hdo/uOfqB3XOxrsV9CyOGkT9mlGE9GRYwXz0rhE5
         R2ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwll2ZUhN/M3zdeZEY0/NpUfVUXo2lmknaUtUaIgmGT/KwVEDrYG9JFzl2m1oUhTmHn06QLRZ1hopI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGdRqim25AmP5R7OGYwMU4U9sG5D2ls8ZdMGu2nbXQnTMkvfxw
	1JPcCwdk1CpsC67c2h2MvJADOW1twjkllj1tJkS3L+XXz11jEeS3Nkz5Gh5hHRYdfu6s5QikdtN
	oDQoyJVhQZJLM8V/64B4cf31UA/YlgTrGWZeVAkC8JbFVUVHlE5+H/+WVU7b48g==
X-Gm-Gg: AYBFou3V52mwLlsakqUm1Mpr/dKgPkwDCz202m8YzirxkndcMiHudkol86UQ16TJ5W2
	TkJMIMJ6wDFtP34gRh38AzJ4MfhkcpAMtZIUKZwXNPp/tm3vwy4WF4uEIznjXV+tOn56Yp26VvT
	coglS1+yYcYzvxqEiaUaCxOVvO8pxzM+Emjw6JyfdGdvL5KCaJQeHLc2bCnfh/GCfcHKFqlx4TR
	Oyfn44oCiebfG2a6dqGU50ZY6qO4pzw+SrpUyF7/fFF70v0r+M63umvXTa6NpP+SKalYrbIvWaL
	Mg/4F3JBsFXOAIdzalF/moQlTwio57ifEKyhGA79ftkDVNumFtSdwhXg91EIXIxq4XSIxDWMyA=
	=
X-Received: by 2002:a05:600c:2045:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49d259158a5mr40225855e9.28.1789031402804;
        Thu, 10 Sep 2026 02:10:02 -0700 (PDT)
X-Received: by 2002:a05:600c:2045:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49d259158a5mr40225375e9.28.1789031402430;
        Thu, 10 Sep 2026 02:10:02 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c0f8d9sm60394615e9.15.2026.09.10.02.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:10:01 -0700 (PDT)
Message-ID: <140605b8-251c-47b7-95fa-69db40bf465b@redhat.com>
Date: Thu, 10 Sep 2026 11:09:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] lib/crypto: Add documentation about zeroization
 of key and context data
To: Jonathan Corbet <corbet@lwn.net>, Eric Biggers <ebiggers@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org
References: <20260909115455.157093-1-thuth@redhat.com>
 <20260909115455.157093-14-thuth@redhat.com> <87bja6muf0.fsf@trenco.lwn.net>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <87bja6muf0.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2026 15.22, Jonathan Corbet wrote:
> Thomas Huth <thuth@redhat.com> writes:
...
>> +For other cases, the kernel provides ``memzero_explicit()`` for clearing the
>> +memory.  Unlike plain ``memset()``, ``memzero_explicit()`` is guaranteed not
>> +to be optimized away by the compiler, even when the memory being cleared
>> +appears to be dead.
> 
> Don't mark up function names, just say memzero_explicit().  The
> automarkup code will then do the right thing, including cross-references
> when the functions have kerneldoc documentation.
OK, thanks for the hint, I'll fix it in the next version!

  Thomas

