Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6181D2EB862
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936615; cv=none; b=g/iEJxUQr/o98/exczVas/qJKBszEw2NkHP/a3lgpoMq/lH1XWQyunGymi9FlMPULR06JY2uMxk+Ob6ku4EFZqQNU8BxEmbi0IwCVakww7w5md6p+JD9shQx7mQdTmTHTFpUCysY5GvqvU0YnmC4iNpLLGAkELGrLCQ4bQVWnU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936615; c=relaxed/simple;
	bh=BnmzzALmQ6i43TkH/lSqlM3JS781UWgkE8m8v774+oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3el/OGzsZaHof0L+yiAq5B6DShNmQd1vZzfaO+ucbMmwft3j3XqZ4Psm9gHgwaMrBWWIpY7gqjI3pe817iXEK1Cx23qNM5KQw1JsrXcZIw5Z4jIsrOwalqFCoqt4FS88Tb9n7PIY4iMJjAJyQ4klnz45rQuS0ud/zYeDkKeJC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asiXpVmh; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asiXpVmh"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-641e9422473so1713837d50.2
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 04:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764936611; x=1765541411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=95vJorwkyoR78B/8jsG9TioZNSggd4rEOfr64GuSXwc=;
        b=asiXpVmhLTOrqx/1DgvrylzJsPSwMKRtgnFflzgLeSEOHx/h2KGRGvHz9XNhJSXlar
         s9gPJgCKKxwrkhaHbRbyLWbSUe6NmN4D2JMcQqrvHmwDknMbdpIam52RPDZZNbn5Z4KM
         Mg9x0NpQaMDJ+uKAbZUQMvTa/W2+AYcvoo+181FHaEOqTVIOl3yun/joyrHGLW9aMvBb
         hlPR0DqRDVZ/QtFZwgz8bRPvPJe8E4Wgk8fetJdBp/Bl3JJ6KYO07qLm/OpRYn1eM9aA
         H1TFLd7gJwLrB3YjSQRaT+fdVXscPGCaVHQi8ixY4r9A/JzBSaGu+Y9bdM1RdI769I3f
         bHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764936611; x=1765541411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95vJorwkyoR78B/8jsG9TioZNSggd4rEOfr64GuSXwc=;
        b=Aj2Ze6F9SeLmu010jE7vksfbOvNExeMmFAI6UWcwOmsiCm0Yx75OzBwY/pdvCNKOGU
         5BI55+NCbMRoRU9nS6oHK1IrBBdiHhFi9+eXziec+WlRYkOfZf8EB48Q+ZoJDPaxLHma
         JHzXucdPjAlaowizTvjHRzmx0CWx6b0irQZQvM3wEme7bK4fb/nFZ1AJ9JyVDpNOTWZG
         onih6OZI2FbopAcviksbmD06yd13J6NL5Kk1gYV5tIky1H8hOtWz2dR5RjWW5M9UCtlR
         nQN2aiNCiTlG5cFxMw1vntAcQ1xJB/8s7cCkKS0ctJrDMFRaDhBjqkrAy24IHE0oVA21
         VBpA==
X-Forwarded-Encrypted: i=1; AJvYcCV+zksne7PfSmyG7LknKEFl3lXho8rTLMLVwJkh9G1RM/OZgk1RKUSbqZBPuwqU/YTqHj4dFWMeS+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlDywRWnakP1M3T0QKRVlzToBLenTY6NUr6DUnRCVmwtVeD879
	VLvmlKAp0VlnONexrlwHxKpMIpfpYJp71pFPvRxeHB0emYqhoW4AFyUlovMWr/Bk7j0=
X-Gm-Gg: ASbGncsjX9xRfGE0UoSjy8yvSLUQhxoU9deKU/bS2Lg04BmI/06Ml2mFcxaV/NV9e6q
	E3RiKJZvvLmYoJr8SCOArmppVCS9TG4wVqy61s3bu3zQp72nhKhKoH/HdfGGB2p1guKCOWYqgXJ
	6hmcosaf1xGDfkBFcHM/rU69rfrKoYwAQlbvQy5VBnStoX/Bd2N35oKW+un4pheAGdcflJqZsFw
	uqmoOiByUNcsVLZkF89USoU5z5MRANiwFVQzWBgJDIEx51wqP6RaSBmQeOmtd2zaqGoF3VMDWtK
	PNeKH54rzcYL9S5Bpkmmqqq1dH8gtB9HwdwMcRPhyTs3flCqMGiBJ/GsQz4QCsRuYPRCa5Itpvf
	3PTIsZoP4aTQOZiuGslSmY7OLY1NqTj0f1ro56QODSVuucyZQWmSui/CJi+5NBXSA+H6g3vrX4H
	YUqtNZuQrXRBKhBmyS9igRs244NHQzHh0Skt0CsQ==
X-Google-Smtp-Source: AGHT+IF0PifHDB8ou4ZSqx1GqzM8ln9OkQ3Z+g4y5+YQLXWvZ8wSwE9BraovlYGUdUBZLmoCDrGy8w==
X-Received: by 2002:a05:690c:6f83:b0:788:e74:b267 with SMTP id 00721157ae682-78c1893c4e9mr91543077b3.65.1764936611003;
        Fri, 05 Dec 2025 04:10:11 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c2bc60288sm3280047b3.21.2025.12.05.04.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 04:10:10 -0800 (PST)
Message-ID: <0f469020-6de0-4baf-b906-6d4ef6f32fc0@gmail.com>
Date: Fri, 5 Dec 2025 20:10:01 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Add Chinese translation for USB subsystem
To: BaiKefan <baikefan@leap-io-kernel.com>, Yanteng Si <si.yanteng@linux.dev>
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com, alexs@kernel.org
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
 <06600ebb-14a3-4f3b-af61-0f378e64832b@linux.dev>
 <20251205180130.00003852@leap-io-kernel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20251205180130.00003852@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/12/5 18:01, BaiKefan wrote:
>>>    .../translations/zh_CN/subsystem-apis.rst     |   2 +-
>>>    Documentation/translations/zh_CN/usb/CREDITS  | 153 +++++++
>>>    Documentation/translations/zh_CN/usb/acm.rst  | 137 +++++++
>>>    .../translations/zh_CN/usb/authorization.rst  | 125 ++++++
>>>    .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
>>>    Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
>>>    Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++
>>>    .../translations/zh_CN/usb/index.rst          |  54 +++
>>>    .../translations/zh_CN/usb/usbmon.rst         | 380
>>> ++++++++++++++++++
>> Actually, I don't know much about USB. I would rather suggest you
>> copy these patch sets to the USB mailing list, where Chinese
>> developers might help review them.
>>
> Hi Yanteng,
> 
> I checked who maintains the USB code and got the following output:
> 
> Greg Kroah-Hartman<gregkh@linuxfoundation.org> (maintainer:USB
> SUBSYSTEM)
> linux-usb@vger.kernel.org (openlist:USB SUBSYSTEM)
> linux-kernel@vger.kernel.org (open list)
> 
> Would it be appropriate to send my USB documentation translation
> patches directly to the USB mailing list (linux-usb@vger.kernel.org),
> or would you suggest another way to reach the appropriate maintainers?
> 
> Thanks,
> Kefan

Greg doesn't know Chinese, send to mailing list linux-usb if fine.
