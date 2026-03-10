Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE5A3A16B5
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144736; cv=none; b=IfMvoLqG1oxcQC3RJgSJSmwCdvy2S5wIMbyhJPjUx2GaVnFpc5seF2B+JvMvd3CfvawQSncdO1o+XTxhPl9M/dU3G6gbolfBqO0B2rtsXDPNi2Fs3M383Py6cLEU0sO//NJfqnc91utzqBAmI9VmPx8xWFK/L+508NPinKvAX+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144736; c=relaxed/simple;
	bh=0ftKGsefno8hkyECfDZZdBh2ORhyT6Actio3coB+55w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsG7g3N6BzM81pHYQA2bKMQxEHC9ODI4eKMcNesX4osiVSWOavJQhhlERDuzush5UYxUmnpidSAsmbyhnE1R0NJv+wTAuUisXPiondYD+FzxpTInvJr6RQRfAX6Gxp1zHFUG+l1gyBX1Cb+q6YEqDop+eiCrZxdEveajxpZOXMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFTjnA7P; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFTjnA7P"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae505619baso56169435ad.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 05:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773144734; x=1773749534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XX8ddarU3vfGaDSorcd4YuuArxCsCdoexFVSxb2qr0=;
        b=hFTjnA7P9hnRyLwt0gwggbN/iSxNB780ABj9R7UnbMG3JBCgZpIDJ8G/zHAGx1M8i3
         leMTB5ibEs1v146kksJzAyWan3GTM3jPS4Z/0B8CcsYmTcd0+KDpNlfO5MeCyTUkqhNG
         jZEzXsdBJhMuP3f42ZFsD+Ytd9sqG5GzBoIgUGrWNSydy/vYolvhKuwq6tIl2ohKm5KT
         jdg3my5X7csEwy3XQ+oeai5iBWV7Vb73qwlvj1XpXwb8yCV8vOYrnG3Tr/tIgKu1CgTd
         DklGJgWaCzUllNYphlycyYluUthRSCXvFG5zGTZtkg+rv/24eWqLRktwXnPYiP8OWaS7
         LGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773144734; x=1773749534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XX8ddarU3vfGaDSorcd4YuuArxCsCdoexFVSxb2qr0=;
        b=Fnd8cGgT47Mc2NT/tKl/RrIqh263yVxqaeXg8tP8hG8Yu5P/KkAkAWnxv8JvYqcb6x
         p6dFue0q0L/32qrcQcsPrq5RfjVzSQtQIIrKP3Xx0sfOt1LEYAMG9Pyk4sNUkk+kZ720
         0RULE602y3Q1zZ3nr+raFL7ztYOGsVV7ZsWhQoHMzt+5JO8C/xxc2sMnRZxVtzmTsXt4
         pI1JkM4571Vuh8DkJ61mX/35BBKnVHUkQQvoYbXG4AJhgEdCnyS/SPeZaOVhE5PPpJu5
         fEJ/DNicGmx+vWQAS0FWeDTASlyjXK5vpcIUxwKONkXbEpcs09qpGgCXRL/huhi8L7qz
         qzUA==
X-Gm-Message-State: AOJu0YzuN+9o5YcAL4r/rRH44UModcnmr5h3RrA/5yVyOvofoQkDddhi
	pOOxjqZg7mBGwZw9hIEwKU0zdJSmyLHEK1mrJ8FeS4a1VhIlNo1nYKqp
X-Gm-Gg: ATEYQzzy8jm0hFPH6MzN2aq4fJKXwKjvpHO4VebOMQQywL5VtmhVPjio9YTwlrdk4KQ
	DAzl8m/s4SVMrajnk1946xZtKl4kk7Smy7dMKodFsbfb0ySio/T/bVSQyF/zS2z5WWksIA/xzCQ
	G3MuqgrZj/erWWg+aW5CXuh7cansCJGFJ4IK0ToxEC2NDi3rKamj4SdpqNl6Y9HdJ8qWd99b16Y
	9SWz8xpalL9CjlgcITWQcWwRwawtW1qzw9C/b5lu2cwIw6eJG8hSX3/uzIE1nJRoYBAUDIbS+wL
	mhV2STM1wBQauTGou4+uT3RHivAm50STGI8rgb++GoyUlz3LJo9ZdgKt6hdcgfvKIlUzH9upNa7
	WY+x1G1E6etmHR8Jxf+3HH/1K4F77mlqBwJL1nmVVAE1Qlltik40OodHDqGbU4QztyBJqEqXcIA
	yNmgq6DvlxEClBdMViyXO0SYtGYM6BnFiMhIKdT/UJWdQhQ1xmmzKa0ap+aMWRWNqZytxK
X-Received: by 2002:a17:902:dac1:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2aea95f0223mr7820585ad.8.1773144734219;
        Tue, 10 Mar 2026 05:12:14 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm195828045ad.92.2026.03.10.05.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:12:13 -0700 (PDT)
Message-ID: <da719e3c-dd4d-4666-9d71-d02238a30482@gmail.com>
Date: Tue, 10 Mar 2026 21:12:12 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH] coccinelle: update Coccinelle URL
To: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
References: <7db99952-d1ef-7148-4c8f-1e6ae8f0d875@inria.fr>
 <793c8771-83ab-4e6b-811d-41fd54b78e3a@gmail.com>
 <c94cd15-2052-f746-ae38-304b4d838486@inria.fr>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c94cd15-2052-f746-ae38-304b4d838486@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2026 12:46:46 +0100 (CET), Julia Lawall wrote:
> On Tue, 10 Mar 2026, Akira Yokosawa wrote:
> 
>> [removed most CCs]
>>
>> Hi Julia,
>>
>>> On Tue, 10 Mar 2026, Julia Lawall wrote:
>>>
>>>> The LIP6 URL no longer functions.
>>>>
>>>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>>>>
>>>> ---
>>>>
>>>> I used the UTF-8 encoding for the email.
>>>> Let me know if this was not the right choice.
>>>
>>> OK, this doesn't look good.  Sorry for the noise.  What is the proper
>>> encoding?
>>
>> Encoding itself looks good, but your patch has this in its header:
>>
>>     MIME-Version: 1.0
>>     Content-Type: text/plain; charset=y
>>     Content-Transfer-Encoding: 8bit
>>
>> , which should look like:
>>
>>     MIME-Version: 1.0
>>     Content-Type: text/plain; charset=UTF-8
>>     Content-Transfer-Encoding: 8bit
>>
>> Didn't you say "y" to git-send-email's prompt of ...[UTF-8] ?
> 
> Yes, I did.  I thought that would select the default...  Thanks for
> letting me know.  Should I send it again, or is it ok as is?

I'd just resend with a proper charset.

    Content-Type: text/plain; charset=y

would look confusing at best.

Thanks, Akira

> 
> thanks,
> julia
> 
>>
>> Thanks, Akira
>>
>>>
>>> thanks,
>>> julia
>>

