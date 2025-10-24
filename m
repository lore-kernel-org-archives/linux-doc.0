Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7631A565
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761314143; cv=none; b=vGLvlsluIhNmxWt7j0vwH2wHURrIvbeWSKWM1lQP2ONjwLuRwnqV6QkVTbL68DHMQujBQhigJPEmayVXDzB6kmUMutUCORat5tIumTiO3IQ03+8OOSZMbfUGSY0P0tROr8h4/59IwvudksSs43cFN3qJjyF7qnMXDTlFNkDlOOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761314143; c=relaxed/simple;
	bh=cs7+9pN+rGw/+2yYuwe+XPsHIbqSVHW2OegdM5KybeY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TfjlqJHV1ZCG4ZHJHSX1UeSsGtNyOyuBduO0JTm/jzpdUfhh9Z5Ea5QyxFgrI47fo283Tw5iqvmEqW4vZu9tdbcN+ZYlSjEIpgQ70/suOgrNyvXxsTFQoC5m0slF5josYl8pw+WF5I9bn+xqdFQ4i+q5vqiGzE5iW6nmU+FLklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hot0rH70; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hot0rH70"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b550eff972eso1442688a12.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761314141; x=1761918941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1mmYFOWJrmrd7zF8oo99zQ9GonVE6sUpTh9fiKeIIH4=;
        b=hot0rH70MZNE5ewIOsgaLPH0ulUB2PgWD0NyzsMGk9Td0hL+Wnl7lYZiz8yisCqBQu
         FmJ0eUpaFlHxJkkhoIPFjY2ebhNRnz3A3AR9Xz444HboDuDcGaKBokC/eUxO7g+w0cWP
         01TeHHl1loIab8M3wz+vxgN10Peq3OSh+lUXQew6zVFbXIPI5JC650mO5OWcbjrY7Fow
         /W1+frKVcYKpOmdbH1wuoWjjAmFf6nZGJjwHK1b8ndhIqWT6O+m3FbDHL9lXORcld73x
         gRpDppG6Mrp5xaZBNJDdZHKaFD+00yQ1fIzAUXLovNjdA4XIkMPeEw3FA2BwDypht0ge
         Eo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761314141; x=1761918941;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mmYFOWJrmrd7zF8oo99zQ9GonVE6sUpTh9fiKeIIH4=;
        b=n6z8xLRSKkSGDztK9mX/EOPWcstmSKUbA8ca9xpVdy79LGPoHTzklKZlpaLtt8P7Q3
         d2EUB4pRHjljfyx5/3+sQoXi+xqSUiRtN+NSjHFXrhm1nxcKZLYh9fxZLIcjERohZbat
         ZvvVlEroX4aPcU3y4gpSb7RsQEVhl4KQb9Df5f522Kz/ZX+27YwU/6MdqAPXszJgCyes
         wCDGjibjN3rI5d9Ay//HSZpznBtSN2d5tmC0YGHv83d1OybdTYDAF5XyLWQ3WDTf+IYl
         HAHyeOwkDh80E16ioSNPry4iof1bwU9YxUV7VGC7pvgBUy/sF1jpyNaspFkTPxIy3gX4
         LvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV04qKs6J/9mroQy7zO576W0h6GowA5LfLAKFn3OraHnl2D9Kmcm6bF2y8hIVcZZjGpo3M1IQlP42c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPe8nP3z6oabntdz+4p657Zi0IS6LQr8GM+CP+hUOjdB/oec+u
	yZJpxkBwoEYwW4d7Glwh7Dxk0I/EAQwgT8Q4ZsZqkiINuF7n3sxrp7Zv
X-Gm-Gg: ASbGnctJJPhG7swnnfzv/Bi9Lc46KCxZDevrTt/jFCvy1jvNWLnd9cqbzOagDDn3k4n
	Vbe/mQN8Buxa+hGps4tymccjHVH5dxfoN7Ot6Lp+ocgUKC3F7NEoEFIUfpwqC1UA2jPzjgqVOsJ
	NR9pGhWCz3Q3c3/3prQjZ5xZ1++6kgHV7sMv3l+9PwnNFoBqnm2QFZMqItwhBa6kWEQwRqDCNRX
	ZeqvQOG675Lz5XGeWqK1Sd/ep6BOuEi8StK9FNDV4X/ozIv38kAQdlRrvG80NMrTH1HoPlNgdZO
	1lTj5H659we5OEcRMwGv9O1o86xBHlYghNOyb8dK6YJrVlJezVwet+A7+k4sT/U/OdqvcYA7Hla
	TNDEIUJ8tj2VjqgtAg/xjZUxqx4jKxk7ZmlA9lTG6+wxYQwyPTzGeCOQ90Y+gUakkfJtfZF8/IV
	wYIJHfpw0FChzHqhSWpNwUcg6AnHPHfNVcu4p4MyYWjbrZ6g==
X-Google-Smtp-Source: AGHT+IH6ZQ7XsgdLNzrpkVSTNHlrQvhfuOh+1KL2rQ3hQUg/UjKwCTfpXsYF5GGeZ2uELik7ETl8ww==
X-Received: by 2002:a17:902:e944:b0:290:a3b9:d4c6 with SMTP id d9443c01a7336-290caf831b6mr365592165ad.36.1761314141359;
        Fri, 24 Oct 2025 06:55:41 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda72d0sm57293905ad.16.2025.10.24.06.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 06:55:40 -0700 (PDT)
Message-ID: <123ab038-39b8-4632-9090-2c95cbc0130a@gmail.com>
Date: Fri, 24 Oct 2025 22:55:36 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Collect documentation-related tools under
 /tools/docs
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20251023161027.697135-1-corbet@lwn.net>
 <532dcafa-08a8-4e18-b904-53e061734b69@gmail.com>
Content-Language: en-US
In-Reply-To: <532dcafa-08a8-4e18-b904-53e061734b69@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 24 Oct 2025 12:10:54 +0900, Akira Yokosawa wrote:
> Hi Jon,
> 
> On Thu, 23 Oct 2025 10:10:08 -0600, Jonathan Corbet wrote:
>> Our documentation-related tools are spread out over various directories;
>> several are buried in the scripts/ dumping ground.  That makes them harder
>> to discover and harder to maintain.
>>
>> Recently, the idea of creating a dedicated directory for documentation tools
>> came up; I decided to see what it would look like.  This series creates a
>> new directory, tools/docs, and moves various utilities there, hopefully
>> fixing up all of the relevant references in the process.
>>
>> At the end, rather than move the old, Perl kernel-doc, I simply removed it.
>>
>> The big elephant lurking in this small room is the home for Python modules;
>> I left them under scripts/lib, but that is an even less appropriate place
>> than it was before.  I would propose either tools/python or lib/python;
>> thoughts on that matter welcome.
>>
>> Changes in v2:
>>   - Rebase on top of all of Mauro's changes (the most painful rebase I've
>>     ever done, I think).
> 
> I tried to apply this series on top of current docs-next, and several earlier
> merge points, but haven't succeeded so far, even with "git am -3" ...
> 
> Where am I supposed to apply this?

OK, I have finally figured that out.
This can be applied on top of merge commit ee9a66919354 ("Merge branch
'mauro-pdf' into docs-mw"), dated back more than two months !

I suspect v2 is not what you had planned to submit ... ?

        Thanks, Akira

