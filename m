Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C6F8592B
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711724423; cv=none; b=b0G99rVfuVuhwbNPZTkNpaPUX8ghXl/OiVr8VYlVoESWV6ljAwNF86eO7eCqPrcPSZ0/nprzdIOK6TLws7QMPBuwRLluSGNqSNshvzoT7vkPK8IDOJ0al6XLr8feNs0GFislror+jaRe1PWYy0SmkORB6M2eMST/cmzpPDC2I3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711724423; c=relaxed/simple;
	bh=jMpNQKRWDUdzryttmXi4dEOmsQgDWDME5biDB077Xis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfRgQV34g/DFWcTsaCFObCg5VXAtb3o7dmfPaWTdR4VYKpi/W6juQUNjgG9raOXCTAN3hoUnhxF1dZVw5d/Fc6HYCnaJ0shdpW4IMjqI7FOD4ZPdI9z6Fo6H0/aB7g5DvqcKcrhpAiV0eANveSDSey7gqFQiDAR9DQUnRd6qK+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iU4E6c6D; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iU4E6c6D"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1df01161b39so18367505ad.3
        for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711724421; x=1712329221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FI1KiUhHXfgrStw/rzFg//9e4c9Dj7OUlbiTZNSAB3k=;
        b=iU4E6c6DC98TLF8hPPIvnXE4X1tzIHlTzb3tlLZ9L7AJc9SZisSOKPLxExJ9DTEi6h
         w8HHOVHuDdXbIHiAJ57w9pS8ICBFnDCMTEt0YC23JfPj8ijcQYYgvZT4SxP4c33miRbH
         cmhKCKa0pwKDQ7WfgS/xZ80vWQGGkpdCVwWaPUam04TU4LY5f7LI/LW6OKj3X90vjo1g
         MVOdGS0fGrWTg12VewqcjT5OwwelJArmdtBWisLW/XzcS0MWEGzwDeGm6C9oauV13MMU
         fujms9p+aBjXQsE5IyhaFw1Xkyyma72F05YfEJsUsOoyyxXj1Eq2mWsp/eRcX03pYTZv
         zsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711724421; x=1712329221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FI1KiUhHXfgrStw/rzFg//9e4c9Dj7OUlbiTZNSAB3k=;
        b=Hs0+o2OWI2fOtBlu6sAXons8RXowypU7tLuYVSS1DS/uVMrpx0kao6k49wh8RyaaNr
         YnOs8Dt29VOvtbqJrwqBEl4VrOX89aE17AFYav6TjD/w6xzHvjaZ7pt52n0UgRjuJlf7
         2sGp/N2yZysut8jQHaKCJxNhpwudoijB01b1Bfq369MOKlr6i2as9moHv8+WFuYBfeIE
         +duODsvZknpjUSg3kkmQyl0hgMnzrDqD0U8dizsMpmvBeQ7i/rpPTOFM1WiFDVLtQvcD
         xTlOosHfeLCMpGu2k4S2rAdLuA/rha5KAznSotbapowkiplQQzaERQ60O682z61EvFaR
         rOCw==
X-Gm-Message-State: AOJu0Yx5zJUURHATLCJxxkxRGRgEm6u/b6Y85QaS5LirtkBXq7vB0SVC
	5T9uHP4sNHuaaILlHlj0537UXh3BYTxHl96DSM25MObwhnyLYY7lAjME4HyG
X-Google-Smtp-Source: AGHT+IEfVFqPXzyqbSyK9IT1I/ne4TLaqmyc4S1A6tfQZRPa5eZpPDpRPMQND9KFW1hngEg5wxbbXQ==
X-Received: by 2002:a17:902:6f02:b0:1dd:d0b0:ca86 with SMTP id w2-20020a1709026f0200b001ddd0b0ca86mr2494074plk.59.1711724420873;
        Fri, 29 Mar 2024 08:00:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id kz6-20020a170902f9c600b001dc30f148f7sm3575099plb.243.2024.03.29.08.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 08:00:20 -0700 (PDT)
Message-ID: <d3b7f05f-f9e4-4b52-9dfa-efa11513fb2d@gmail.com>
Date: Sat, 30 Mar 2024 00:00:16 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Detect variable fonts and suggest removing them
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, =?UTF-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0Lg=?=
 =?UTF-8?B?0Yc=?= <relect@bk.ru>, Akira Yokosawa <akiyks@gmail.com>
References: <20240323120204.155678-1-akiyks@gmail.com>
 <87jzll5cmt.fsf@meer.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87jzll5cmt.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 29 Mar 2024 08:35:54 -0600, Jonathan Corbet wrote:
...
> 
> The problem with this is: removing those fonts breaks other things.  I
> ended up putting them back onto my system after, as I recall, Emacs
> stopped displaying non-ASCII text correctly (or at all).

That's something I was worrying about.

>                                                           So we may be
> giving advice that some users come to regret having followed.
> 
> As a result, I'm really not sure what the best thing to do here is.

I've been experimenting a per-user fontconfig trick for denylisting
those "variable fonts" for "make pdfdocs" only.  Looks like there is
hoping.

Let me submit a v2 with that trick listed as the safest option in
a week or so.

        Thanks, Akira

> 
> jon

