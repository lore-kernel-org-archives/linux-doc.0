Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657802;
	b=NHx3o6UD8zCSgUyygINFCQUudez/721eDCaadQrO/qicLHHxLUophWdJeCzVBb5FqaC7
	 ek9YyLrluGQZvP1+FkCrO3T/Hh2L3lk4Do1FH+QFi5PHvLiMV6lcqUYSWeMTf+FUji6gO
	 YSoOeVDlGTEd8e7htY2RwBbxpN77Og/obXGyiecJ2jRSaZ91qfE8pptd170kz6AkZwz3D
	 tbiKgUuOBIAY2DocFV/wCScZcxBtx0NYlQWiFTrRFOo2a+X899pC4WDT0CjTT2FC7l8NJ
	 GzkYDWV65hhFIlox1jRtfnWTpCv9nB3gj3eRRe49Gs/wuhmANccFVANjTYn/G6rTLGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/tpzHtlkGwh77klAgQ3+7vDN5VnMY54g4sCcJN12BCU=;
	b=roMy0QoEnfE0qrPmvtGGs3b2SOhjEriQDlobnH80nVpuQLgk9lXGty4ITSMTgQNH/Olv
	 sj5vup/s4gOKpCgMOmczSfyrvZsMWvQ5If2B2WIMmc11bU/j+Rfd7er5Ny2iESG5cF/tA
	 fwAF8MymdLAq+ereYrZ/ih0RMASiby88zsQKoZhwv+Rb14PViWlzdyaHVymlLIAYkKjDv
	 gt9s6dLwBaEncew1M4QhxnE8oPTJwSszhiD5cTz1XpwmFxQUmohSamiAMJoMkWVopNvOr
	 T5i5nilKQeM5LaMWg7i5KEKtVCN278J+pn/yQyVR8ijnYO98qkOCoDMMYfn3gddduQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=HTnZrZZA;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB31F606A329
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 01:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB31F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=HTnZrZZA
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38190551625so12732103eec.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 17:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795657801; x=1796262601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tpzHtlkGwh77klAgQ3+7vDN5VnMY54g4sCcJN12BCU=;
        b=HTnZrZZAk1fimzpf7glBUawWrfz/uu9E4sN4bkzRxUwK+9JNC+YgbwMC26RHCqMaVV
         g1fAWikYyKwGlWsTuWlSm2tdpfSKYlMaqe4J+NBvOWJ1jzJWjfQHmb3QSnoQYXG8Pd99
         X2PnM1cNcu1HnNj+AlEXCYovWFuJCKZwJX7DtAQF3HyEZDGF/aM56unH5RHMBqVP3dac
         jQxzA4XpDOCLQq6+kw7Diak3FdD46upCx2ml4v0Tx91BRDlr/leBM44VeK33SH6Y5FnW
         oe6KSxmzGH9/CltxMd6DCGpdsFAFwLxUn8cFI61gpgbeyf0ySiKbkzXmcWDHv+nqIJGr
         pdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657801; x=1796262601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/tpzHtlkGwh77klAgQ3+7vDN5VnMY54g4sCcJN12BCU=;
        b=vM0gr4boScg/+K6rgS712lOXo+a3XYFLbCUA6BLaTaFrEeCXX4sRZomBcbA+LDu42g
         fB92zOo4zAd7SuGWncGQiWgyfW6mijyEfflIlSc9Ac6qcpP9yZPRs24PIBvl+QyNzJHP
         ZexZTsU4R6FcVudtq3sYGMgYI0haIi1m/JHTTAh8ljnBfFrAi11HCrXcfu9uXFVleK30
         S5cKcwF216cixtQb83RNL30GeYKMk2l7LRWqDncS+7jGd+THcWmUDipwGd1FRS5ZFngd
         g/AjqwRe1Vbat8YAW69EznN4K0SVUOiPAr6ZPo5B3y8KTp1XcVg0UQEhP1vc2XhyC/Io
         gveg==
X-Forwarded-Encrypted: i=1; AL+hErHLhoU6EqNZXbbCsF5PQRbEVgG5PvUIu8oJeJwzBh+HX6nJiCD6B+9vaF9l7iAjuVw52BKL+c6L/8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CIERenEm51Pm69H0Ep1t80mhuBkmyDlmWK3t6wvv1w3inJeS9
	oOkTlgvLGXRrep3vyZRTdGKoWjq7RBk0hL4UT8DnDPJFIKpbYt+glkLr2MEwYSo/pbg=
X-Gm-Gg: AZFdTZfnrjhh8uEO8g79mMOOdB/UCLp/mCAJgVnaZVr6fxN92N36dsBMU/qbh+Sl3by
	MGEGVr1DnT+mB93AH1GBgfq5buONj/f7jLHiju0AFsD2eI2wU7T9f/Hz6PeFRUMVRvSJjsE/EeA
	Y/j/WaI+O7gzEPbH5S0QVsZE5q9ifjiJbQwbvVik9pbW6XlSRNPeiiJgX1CskMbBrD9KoxwM/+F
	FKBEql+F3zmJMaczbKkXGxSIDOL+JCBYalvXSAwyPDJacAWkZquqkt68hR2gYudouvOU3xgkqbk
	3jtVAAYh7Z0LfFh00OJqZC4r19q5Bzu+MXKoU1AkNVFG7OQcjncX3Ey4fUr8hKOMzV2joPNoWKD
	SLf3tI037RyLaMMNsoxH6VmHnapEjqRwLEycQuHwlmU2kjwWSa6ZwX4Do6KzMe7Bqsbe7ZIZeec
	YAahUxSSmuZ1t1rK+jY5nK/nQlA1030xu8uXO26xEevYpwQFcQgljeeFfmTJvskPzvXnKlplMGN
	x8zLBCBL7kv7Y36+BNPyqvrKdzNx4CztYx4RUlJlUhY06bXrYrMzD69dyPUD6OAV9C5f6ARXx+b
	JUHbnQDJV+es0QuXTaGnEtLHH6wKo1tSCggCW3nhP8QMxFjmEzei1IY662ER73VpGRUoXyPI2Yt
	0OT5y2hPxnRW0rsoo24y9WYbaJBUlQwRJyenQX5oqYjJQiUAocB9nJE73N2sY8jnsN7kRDQ==
X-Received: by 2002:a05:693c:8042:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3856f14ca78mr21362842eec.13.1795657800466;
        Wed, 25 Nov 2026 17:50:00 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm54208971eec.16.2026.11.25.17.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:49:59 -0800 (PST)
Message-ID: <1cf30693-44c6-4761-9900-e36259082e4e@kernel.dk>
Date: Wed, 25 Nov 2026 18:49:59 -0700
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
Subject: Re: [v4 0/3] block: delay support for error injection
To: Haris Iqbal <haris.iqbal@linux.dev>, Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
References: <20261111215838.103356-1-haris.iqbal@linux.dev>
 <179501806989.17649.3138860274842922761.b4-ty@b4>
 <20261120164416.GA32719@lst.de>
 <edb8249a-7bc3-430e-bbb7-243e1881a0b8@linux.dev>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <edb8249a-7bc3-430e-bbb7-243e1881a0b8@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 4:27 AM, Haris Iqbal wrote:
> 
> 
> On 11/20/26 17:44, Christoph Hellwig wrote:
>> On Wed, Nov 18, 2026 at 09:07:49AM -0700, Jens Axboe wrote:
>>>
>>> On Wed, 11 Nov 2026 22:58:35 +0100, Md Haris Iqbal wrote:
>>>> Error injection can only fail a bio today.  This adds a delay_us option so
>>>> that a rule can hold a bio back first, to model a slow device.  The delay
>>>> happens above the driver, so it tests the code waiting above the block
>>>> layer, not the blk-mq timeout handler.
>>>>
>>>> A delayed bio is marked with a new BIO_ERROR_INJECTED flag so the rules
>>>> are not applied to it again, even after a split.  Christoph asked on v2
>>>> to avoid the flag by allowing a delay only together with an error.  I kept
>>>> delay-only rules, as a slow device that succeeds is the more useful case,
>>>> so the flag question is still open.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>
>> Hmm.  This still has rela issues as pointed out by Sashiko.  I'd very
>> much expect a resend to address them.
> 
> I can resend with the fix, or send just the fix to be patched above
> this, since these are already picked. Let me know whats preferable.

Send a fix please, that should always be the default as otherwise
I have to rebase the tree.

-- 
Jens Axboe
