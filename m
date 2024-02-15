Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7912B17C
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707995449; cv=none; b=HK+7WEUh47rbNFFuDCQqAwSK91w516dT6poXgCwHfr0g7BUsSCGO74gLMWQm8Zlmy0moAA8bmOd/OBs2N9unTz8jswNio47XiulyEyHhBQCXluW1vpLWcCmCJImvjm9wM0WQD4BgIWqdoP5YkYN4RZMtoSOCki66mScttXjCfpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707995449; c=relaxed/simple;
	bh=BAP4ykgtywomJf+mWXXZ5eMuWYJ/NKDhztpjwb/COcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=ZHquwUbXy0wcpYNfMFOnR+zwggH1lNDth8W6rVJIp45EWlERZvEmj1JvK2hQiUsQNjhNM7RRfxPQTmSeMgiP0oVQAJjobmyA/4IkQPx1rRfGDKoB2xvibOmSc73Ddoalt/SFKPPZ7M0Hv8tAdPx0L+e2QCLgfVbA15I/hvBkK6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaW+QcdI; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaW+QcdI"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so629538a12.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 03:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707995447; x=1708600247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eXuQEhUgYXwgsNMFJHbQyq+fkOj4TLENtN7726xctAQ=;
        b=eaW+QcdIMxy3rEWxsI36bsWXWsnOSPh6AvwaF/qW3JY5W59s3eHkes21C+C3iPRdC+
         6hG7OaOlCR2IqRNrl0vEbhGRyFqXhpPTg6kq+KGR5ylMt4f7BhZXPNapYSUWOr16uEja
         txjOXpqfk7dl+pQ3wnsOZNkendhYbBiZ281xfUosgYHqjmCdHM+pOMtnASi4xIGeIGuG
         GrL/0zO/FvMcZudOtEKhUPfrBEiN2FkI5oUrJ2SZXR/PKZz5DpArnqMlzGc5ItRpUWBd
         EMNs3+H2SmWJ4DjIKgpBYCNwamL+NgwxjubTNtwe0ktl4SZ266ZCtCnKsHHoyfl/LE4l
         C5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707995447; x=1708600247;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXuQEhUgYXwgsNMFJHbQyq+fkOj4TLENtN7726xctAQ=;
        b=EqhcPrCDNcDjt0k1n7IDS/3SdvHag471ztqnhdLUJY1gg01C84NM/63uW6+eReNpKL
         G8RD0TR4rzY9CEpQ3XZWqezD+Qas7IBr3e4284u9lZa/vGsT9Cvsv10igxNGjwm1/t7K
         hs9OH10TemGydxgkQkpeP5ldl9zEPmCXcpIbOrQ9FHt02Hzl8ZS1yewEI60QInPh3MsG
         CQXrfPF+PK/WTE3V4UvvQrdL9Swy5JbD/AUTc2Q58YZKMDZSXtZeNXx1nZl9+uZjzAfi
         uKAqLDrkNBoeawA2J/VW6QiFiZXi8OchZM0A93cM3V3iQ+IUxrWTFtzUA3kMEv2WT3AC
         +7mA==
X-Gm-Message-State: AOJu0Yzz66G5k3Z1BjO2AiDLptE3GUwEPHwzjaUPkXh9nZnnZgJ+migv
	xQbPF2Ss0TLOo6/081gDf6RhMn6fp+3CRELE8pquQEDZw0/qrKJ/
X-Google-Smtp-Source: AGHT+IG3otWKyJW6dTlf5hueVwk2XGiqYrqLzPis1fYFktigJSezRZr30Dqaif/5Zd8hcg50VqTApg==
X-Received: by 2002:a17:90b:4d06:b0:299:1fe1:cf5e with SMTP id mw6-20020a17090b4d0600b002991fe1cf5emr211031pjb.30.1707995446842;
        Thu, 15 Feb 2024 03:10:46 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id r13-20020a17090ad40d00b00298d2182f1asm3161405pju.55.2024.02.15.03.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 03:10:46 -0800 (PST)
Message-ID: <d34e3dce-0a16-48fc-b3dd-e83ff3568baa@gmail.com>
Date: Thu, 15 Feb 2024 20:10:44 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Only load the translations extension for HTML
 output
To: Vegard Nossum <vegard.nossum@oracle.com>
References: <87sf1uy6f5.fsf@meer.lwn.net>
 <aa42e525-3dd5-4cd9-a8c5-6e9d92c3ad15@gmail.com>
 <3c037ee8-210b-4bb9-9877-35637749d2b1@oracle.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <3c037ee8-210b-4bb9-9877-35637749d2b1@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vegard,

On 2024/02/15 15:22, Vegard Nossum wrote:
> 
> On 15/02/2024 03:43, Akira Yokosawa wrote:
>> On 2024/02/15 8:25, Jonathan Corbet wrote:
>>> +#
>>> +# Only enable the translation extension if we are building the HTML docs;
>>> +# it brings no value otherwise and can cause problems.
>>> +#
>>> +if 'html' in sys.argv:
>>> +    extensions.append('translations')
>>
>> I tested incremental build of latexdocs against Sphinx 7.2.6 as follows:
> 
> [...]
> 
>> WARNING: unknown node type: <LanguagesNode: <#text: 'Chinese (Simpl ...'><#text: 'Chinese (Tradi ... ...>
>>
>> Exception occurred:
>>    File "/home/akira/sphinx-7.2.6/lib/python3.10/site-packages/docutils/nodes.py", line 2068, in unknown_departure
>>      raise NotImplementedError(
>> NotImplementedError: <class 'sphinx.writers.latex.LaTeXTranslator'> departing unknown node type: LanguagesNode
>> The full traceback has been saved in /tmp/sphinx-err-3inve171.log, if you want to report the issue to the developers.
> 
> Jon, this is pretty much what I said would happen here:
> 
> https://lore.kernel.org/all/8b51b6d6-0360-4f42-9b96-02e0ccd0b34f@oracle.com/
> 
> I have a proper fix that should fix all errors everywhere:
> 
> https://lore.kernel.org/all/4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com/

Oh, that's even better!

> 
> Why not use that? I'll do a proper submission, I was just waiting a
> couple of days to see if anybody else would would test it too.

I didn't respond because I mistook your words

> I'll test a bit more and submit a proper patch if this works.

and decided to wait for a proper patch from you.  I was thinking
the delay meant there was something you needed to work further...

I've just tested your proper patch and it worked across v4.3.2 (of
Ubuntu 22.04) and V6.2.1 (of Fedora 39), among others.

Many thanks,
Akira

> 
> 
> Vegard
