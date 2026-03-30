Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0861C3815C0
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863608; cv=none; b=b14fQYcahHqkhg9BH8U+Xm4UrWf5GEJVhGpDJT3mhDq8I/bzDHG3EjtxnEZqZSwHupFPxAVYE9Q/48e4oREfctaHU0vqiSQovyTG5KCKIMn/knpYbetkP30EAzhRZUT51ce1kz9k3xoH3FpqbqiwwhRPsAxknCZecr65sLuiFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863608; c=relaxed/simple;
	bh=qql13zPiiqEd2+a2raSu6JfK6cJR0XNhUjqEei7E4jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTR6B5zGDuOJcEfX+jYDvFq1fWc+nQImVZzYKb4ebJjWyaF99oqXDNPH5RfTbJaN8MqDks6y4PGN9RO5cQUxRzEWQEP+c2iPpavqaNCWFrekrWl9rKp3vsmskdeSAnGRm+12r3t4cwJOmPk9EliVGeQELcAWnJBbpFAAYQOUGXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CMg5soou; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CMg5soou"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836fc075d2so6522185e9.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774863605; x=1775468405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Pz5WjDNwODkGCTD7FY1PbGzbLHarF5Y8FutE1r5Is4=;
        b=CMg5sooukPmqQOLoelhyhwkpI/0NhlOgimSIaOHXBzJJJ3xgdNjWOw76pCzuKh4Oh6
         zRGM9q1oYd8o8DA7gOqzHRCgx/iXrKvMWMncxy/anLD6DJXdWyHGjGbtaqsXRZoflFG+
         HtwyhTMXTYNQpq5IyepV9aQ+5/K+456kSrNJIP3GsypDY+86A6QII6MYI6v1NCjWsC//
         ftcoEi+KZXZwbAgQML0w6EzF8mN2xchI2iwG7hR29Yh3dQuShAutF3IOJQWGMp2hh1r0
         02UyEvAoinPITYFisl8zH0tfg342F52Dm9ezgHrShIBeflSOcSbs9BdLCSCE/EkXt9d/
         TV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863605; x=1775468405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pz5WjDNwODkGCTD7FY1PbGzbLHarF5Y8FutE1r5Is4=;
        b=Lw/NwxTAmEHY4zGxYssdsZ9doUltd+RwqzXW670cP2zQoW1XTnCEftZBjp8QzYacgO
         OKxSGSmEninFq9KwBhtNlYXU8au4PngZlyNAA8141Jb7f0L10JNbL3Mqh77Tv2FqRhtV
         m4zrYFGl0eYoKEucG5iqoyT3kSpybAzWXOmI+SbU34Dbb8Zmcq7H24Zu76KyTI/0QcJz
         dA7SzUS94HM8tHdceHAUAogEqXJAabJHXQ+hceCxU/FLvfhZ9QSE1bvUOpPiyWz+wZY8
         ilKVl2shlcIHdixVm3nrVPDrK+wwYHrsxttrIDM9JdOOh8bJbKEzkd6b9Gh4PEik6nvp
         gAyw==
X-Forwarded-Encrypted: i=1; AJvYcCWLTCbkBVTjGzjHKxQFGF60xeKM0Yi8xzsyuGkFBpXP8WCamTyspwfcL+T58H9NYHju9crnCzlNS2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFy5jf/byLsrWRAWLmcUmlH6OUxIvtLWhlxiZRa2UAfM0a/Rb+
	SrpwrHsAAtJsa0Ybzv64ycXOesjAVqSSVBMaSXh9VD5h1C2iW7eoa1NIDWwERAE2vgY=
X-Gm-Gg: ATEYQzy6xuiTlOi0zmzmLZ8X7cfCRA4SBw82Vi+DiL2/Rxk5NxyGRC3NDC5hDb8GKFO
	SAa9ipZ+If8BgAT1f3/KHHSegspT1WTEm0pLGc+7jiWOecjp8QGUashes2363UX1MhPA73u+MdS
	3eGSsx8xJ+/1N1g46OM2A5nLGvWwP4IrGamWnoBfOhmtjAitEJrGdvopUH1fwFnzHN1mM0E/BAd
	8oKVg0UP+vedkuhUr3mxJRGhlaGbxi4E1dYycx1P8hSMSCxpPl7aVsNwaXUOJwtN7YTDY4GkfD3
	BKpGHbqBX+2jVdEh8hmECyENr/EVGXuIUCW5U8RmYl24AJvDf0gBVpdJdGhlQjcHHZFjfnPYgxB
	+XjU7K67KVtncs7rwTny1HlprD5ZHeEBkt0A+xC8deczlSnGMrakCIScxFQrOlihaeimRubvJr2
	cbAewI3SwnLqiqNbOeEIowagjcpVtYa+lTZ2b20mAoQwYm6dRbKgIMN03gMiqyFkA9ybUc
X-Received: by 2002:a05:600c:3511:b0:487:575:5e3 with SMTP id 5b1f17b1804b1-48727f5a798mr109936905e9.5.1774863605305;
        Mon, 30 Mar 2026 02:40:05 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270f1943sm96676395e9.7.2026.03.30.02.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:40:04 -0700 (PDT)
Message-ID: <942f53b9-d8a9-4730-a88f-464f54d5c868@suse.com>
Date: Mon, 30 Mar 2026 11:40:03 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
Content-Language: en-US
To: Joe Perches <joe@perches.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <acTPXMJfkHLeItrK@google.com>
 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
 <acVIBseRrqJI8Uwb@google.com>
 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
 <acWnbG3nGjfYeYXh@google.com>
 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
 <acW6Iar6XOzO9IfN@google.com>
 <f4dcaecb682c4eaa271abfee27c7cc8f6fbf7d1d.camel@perches.com>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <f4dcaecb682c4eaa271abfee27c7cc8f6fbf7d1d.camel@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/26 00:19, Joe Perches wrote:
> On Thu, 2026-03-26 at 16:04 -0700, Dmitry Torokhov wrote:
>> In all seriousness, if you will not make use of this mode it's fine. But
>> it allows keeping the source cleaner as one makes edits, so why not
>> enable this?
> 
> Unnecessary complication.

Are you maintaining a tool that you want to be useful to others, or to only
do stricly what you personally think is necessary?

I don't understand your objections to this rather straightforward patch, it
doesn't look like a maintenance burden to me?
