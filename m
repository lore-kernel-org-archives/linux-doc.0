Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BFA231824
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430202; cv=none; b=pddFGUIUuO2bGIqFrHdTn2Sd6lvfH2gdE456w1QCtWlvrZakqLKXIQFQPB+AX/DfEO0YipyUyt3VMyxSMDZNgCnL6iL1Hq4HXi5PK9Gz8IinnO9rkaMEH/mO39gocCCRBBMCXr3zV7g52KpLu+LpB7ylGxxiJ8OONjeuIoCGay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430202; c=relaxed/simple;
	bh=lEq7cL6BsT6j/RnRnM44W4XFLaR6CG8CDiQb9BaYVEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EI32aP6SJp2OfHdy2veZXRi3GJD9KjuboE0XPdpOND0pULpd09if/BChyIKgZEilSZKcmsOe59aE/ey1JadgN3jmp8BySghvldK/Y69jKx0QQ5hL1RSyXk66+ZAt4+mXSDknl+dYh+vpE4rLFt25rO+rlT4qwj1Qjjgnv2Mwlqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YI7gbwTM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI7gbwTM"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so1466654a91.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750430200; x=1751035000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g20En4v3jYt4kBc3V1HIA6rXAY82KrK6nGXhWwEXANM=;
        b=YI7gbwTMUbWFGCiSDzbluoT/24nasLe+ghvEYHX4y/pAVcXL5QSh/BjCT/DilPhuve
         yUWJoKTdHBtJzkBlb0qWVOzcrbgeQsqOV1v6GZjRUcWp67GMzUuXCuN0kvi7s2o6Z4Yg
         i4opcfa7CvIUjkT7JkrBofvbMNSxWidGwT4YsDaTF+bJwwdzR6sr+Csrwliio5jVBODN
         Aw6ivQgOnhiCOtr7b32BhUiJJl7hZur3Be+y/oLgAQ4ot0RsHVilhqSE658ClK2rOlLp
         dljJ+6yzQQ3nKgTZQIpWkRvs+BrdY+6JMRRqQApqGWAF0iaINQ4GUHxI3GdLSVJQWeqb
         B78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430200; x=1751035000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g20En4v3jYt4kBc3V1HIA6rXAY82KrK6nGXhWwEXANM=;
        b=aAEZE9/JXxtY52aqDD0ym+6WQraHDJcP8PMGDUuZz174pQhYkXaah9mXMBLpg492zZ
         O54ZbrewebSHEnAgOpZts8HFAAlXbRzvaVZTZkGp5KJbq/bF4FJ3CqDuEJ+gk76L8kec
         8wk/UNBHm1MkpMs0sfSWWDrZZMzpEBAC/GzlNrJfF+fhEyK7Jg7d/SjgtttGQI4+e2av
         jDCQoWbL5um6bDvRYzDpPVYVjPblZSf64/Mm2zwpQXRYCm3EnpiZkqdalX+oL7OFw/2d
         P+3CmCq8pvCJFl8d+/kpNMxfBf6h/ZczfOWgFwAN3+On5I+wxup5eWQ1YAr3G6tcgwMq
         Rbqw==
X-Forwarded-Encrypted: i=1; AJvYcCULuZ1h1TTio8InD0TcDIT6wXzY6cCNdh6CBNkgbXtzhd/rbH5MGP9kvbWV5fbTHkD5+tlxJhM0ovw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+fw1A3PjN4TYxLA8diorcd0b0t8OD6JlF0J+2ApCcdbnlT4/
	Wx5fqrlGXCia6xscawQSbYmdBzNd2dteOu+Ro+Clx4m8lDiwUvkD4hDpcx5bdA==
X-Gm-Gg: ASbGncssm40IyLtwOBSm3fmvieN4iWfCIQLSTOHb9XiJMVeoDq2Rn4ljlpEkZ6MphUx
	2nFIabwEPSbQ85TWz8lM1Q0cEIUZvuRALHXiMaix8LvxXpv1mc8Xkx6BMvcA6iMaiJ0I+6RC+Ug
	KXcEi8GQ8LeE41K6aPbv9XpynrvB+Vz0LawINhpWope0FclmjXUCPnPNn2KBQVw92yFTgSZft3Z
	F66MLZ6l/g6Yh+CFslNIiNjPXxwHcurYCgDATbAUPGCKYMGyGIRVZwIE648u9Yw2QSf7esVmuAL
	bdKLmeJ/j7nlBIghzGGg2SiAppiuqmdFHb3uwABmfhXk0hImQbN+ylBD7JTbB+9vf70oUbCamSb
	MAwJPFA6Vo/zWhohgDbI2YZWXTwX9TdTb
X-Google-Smtp-Source: AGHT+IH8iJcnci5fNvkMbjLk9TrdNGFbv/rlRmq0SrV7ZzkO/JDG9Nyf/eTmyoFz4OKaxuxAiiej8Q==
X-Received: by 2002:a17:90b:2d8e:b0:311:c5d9:2c70 with SMTP id 98e67ed59e1d1-3159d67fea5mr5513241a91.15.1750430200487;
        Fri, 20 Jun 2025 07:36:40 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a31d40bsm4810656a91.37.2025.06.20.07.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:36:40 -0700 (PDT)
Message-ID: <713db067-7aba-48a6-a7e7-779d1c1290e0@gmail.com>
Date: Fri, 20 Jun 2025 23:36:38 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs: sphinx: avoid using the deprecated node.set_class()
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
References: <87wm97fmn3.fsf@trenco.lwn.net>
 <03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
 <87frfufrgy.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87frfufrgy.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 07:54:53 -0600, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> Hi Jon,
>>
>> On Thu, 19 Jun 2025 15:26:56 -0600, Jonathan Corbet wrote:
>>> Docutils emits a deprecation warning when the set_class() element method is
>>> used; that warning disappears into the ether, but it also causes a crash
>>> with docutils 0.19 when combined with certain versions of Sphinx.
>>
>> To be accurate, I'd rather say:
>>                                                 but it also causes a crash
>>   with docutils 0.19 when combined with any version of Sphinx whose
>>   requirement accepts it.
> 
> ...or just "with docutils 0.19" and put the period there, perhaps?

Ah, that should be good enough.

        Thanks, Akira

