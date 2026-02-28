Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9C21DF736
	for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 01:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243721; cv=none; b=CT00hlGD+67X3/vyY3OZRsOcC5sK0Nnr9qZZZLV2X9Vp/QQYfTqcYudWDS9Qrw1CNx8HYGkS88H2bHB/mRLPJzQg5HVRE/V5Uc6/noiTeF3yX4drw1ZUUB144HKmZMSjLOzMQqnWuJLnkus8XeiRWla9+BhOG732PS1qcn2xqzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243721; c=relaxed/simple;
	bh=wSXKBv1s9N7rM7tMp/dbyCKz7EHhkOlMiIvXCLsWZyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ji/9ZwZ7vRuv2eyZvEsaVbxdl0v/8ObsKv2PBQVaY4UVkzkXNkJVZ3FMth+BLH3qxq78/VcrbUlmpCnsgXZdI9oexbcv0gVk2g33Duxh6NQUfBOwHf+uLR81vEXIhutySlRxAF2VLFE0ev6g/tJ+FNGk9nRp3m1mdp9/7xwjRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4LRhHVz; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4LRhHVz"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bdecd00ebdso2030669eec.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 17:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243719; x=1772848519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fI74CQjZrJmGul0yaBzfJGuaMOgAVh92XkiFRIDxOH4=;
        b=d4LRhHVzF0lW7LcZ4Im7ZDlCxEd5LMwfyXJyfFr/eTCdoZ9IQDORcplINwQDlp05Wt
         JsKGeXJteB+fGWRjsP9I3xD4b/34WYHDzgL0Ri3NpILEvu994+wvyMu2dEHrlStXXcS5
         Q1BJN7EaOOTBqh6/eoiRUiIdVuHVG+zl7mLvsVkqtm9oLn7UyCFJ5q5U3rCBKGWh6uFQ
         +WfOde2dg0w0pP2iqnddK0y8nLbJeJn8xIxwXB9zgx33j78IZni4MgEcDTyS5/7jeNc6
         kd6XV8I0BGyrEkit28n2Sz808P8TgGIUbh7oO4gMR0FscRpOuLnR9dqGHuuuxlPkKeYc
         47Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243719; x=1772848519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fI74CQjZrJmGul0yaBzfJGuaMOgAVh92XkiFRIDxOH4=;
        b=lDXfaXgjGu1iR+XTochuUBRG332rKw9NJjonpunNIfoLebT4g+kiZo73IXlbNyyOWg
         IF8aOtPHoeVUQ199JiVvbvRs5R9E8N4D1yEU1Szd2bCoV3p2h71wlFtxULj0sdW8192L
         ttEWUTu0ueeEhjZmnZrMEEWBCOxNDvzst6riYqSrrCrGjm9RSHR6eHGaLLq4Ayr2GwOV
         qe9Y1QqLiM+1d3IeLq3EPjKjIC3SUtF+JN8JU503Q55N67QO7A7LzRr6Pz1HtV4R2Mny
         xaCB2YkAWcbQDAwxorOnS9VT0ToGAi4YncHuRrHXrZcK8Yrn0/Q2OpW61K69baHcxihz
         Qdmg==
X-Forwarded-Encrypted: i=1; AJvYcCVAG5ZFPNu5p+Q/M6+nOlCFdulQu9S4IbVq/6pISo6/ubRBlrVGSHGkm0gFxJx//Y965Eofs66qHHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoem5gYOb81PX2LCbFhWRGC48nH5jrtZpqbiOXFAD6EmjCCAvt
	F35AwqgNJrQf8rkyGz93VFw6xB0cnnFIOH95EAhZwHvJiswpVF8b6MbYt5qSwTLn
X-Gm-Gg: ATEYQzyFxRyvvoyFJMsEvijt0LO9cZv+/zbupHp2IufhL4mYeV4Rx2c215rMfpV4hsW
	DpS0ckY9ki8nWSqs7+9DCf7Lj6bW4Kl3mNQDbnMikCOfdfyd7nMl/+YSJtPJgTeTd+/SOO7d4d2
	Q0zei0OT2NJT7TNeJJZTilyp64/7DTicmaDUEDkpY4JLpqg2OFUlyaNunO868rZPFx53qoQvBw4
	ZgSMeY9j6ckw5tp1/J0tpWf4J8T0hnEgo7UEWitxcRAFbDSpo9t22MCH2ptnmV5Oo+X5Q6kfaj/
	t+kuKusiCuZwlp2lPbI01tJ/P8SwT12Cln+pIK3BUAd2Zq5Vpdv+cjAfzrgXwXPi9P+ThoEYYvE
	+DEMTHuDRKfgaExckw+U+PV+raEUk/TaWIEgsOwBpRA7hGB8ELD88yYOVgzBgSHhjlM68yDk7ZB
	SpwAPlai6lFW9SVQ/iO0+o0QDPmhMo3GZ6+1L1B/Aqm3kiVuGp3nww+G79ZKbLFO1KkCMJwnlV
X-Received: by 2002:a05:693c:3618:b0:2ba:7875:10c9 with SMTP id 5a478bee46e88-2bde1f9c38emr2009598eec.26.1772243719022;
        Fri, 27 Feb 2026 17:55:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1bcdf35sm4871072eec.7.2026.02.27.17.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 17:55:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d5f50b7a-a71c-42fa-b5e6-ff8ef602651f@roeck-us.net>
Date: Fri, 27 Feb 2026 17:55:17 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] docs: watchdog-kernel-api: general cleanups
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-5-rdunlap@infradead.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260228010402.2389343-5-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/26 17:04, Randy Dunlap wrote:
> Fix grammar and punctuation.
> Add a missing struct member (pm_nb) and its description.
> Add a subheading for Helper Functions between the struct descriptions
> and just pure helper functions.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

