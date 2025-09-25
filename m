Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB012BD5A8
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809709; cv=none; b=Wm1jJDvipMopk3dbQUf0aBmO8kupReUz067LxHHe1Yl4vrqkUs/TUcWHBbMQt7XuCj5yrjWouU4q+kT0nvUWlnH4izDbTzOXVFjRZqqhctD83mpUGMwAkx0WCcumjDG15poiSSvfO7BNNAmdezbEWKwNI44snI27NcTCtiWXnoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809709; c=relaxed/simple;
	bh=nuislbAtqmU78XpJlZX4vNz0vwiV71O1Kx5IczGC5SE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kYaLz7f1BSxc/pu2IYYA0KmU2iCSaGC81qu+NCwTYRHSBSIapGBlTLuJ1Qhzj7+Mp7llYbVaK/gDx4PknKBqf421yrz4PNXZfe7IkvOg/GOetL9Ztviops6N7v58EUv3aQHrmrBtxviix+QRbHe5xKJnWjol+yEddDZj7tA+k5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYKnm266; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYKnm266"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so15496595ad.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758809707; x=1759414507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTn7oez8OOqttdy0B0PFYhUePNvjLlG8H/kSBIplgEA=;
        b=OYKnm266GVr4HR4TJoNi1tcFHjlwYNPPe1UG9jcl/9e9PpAldqs41oBqireaCH8Zr8
         NjxJ+A42kxWJxt0MVR9vCeMqBBzbMbk2pheEpWZuoCOvAZUdrMrPBPufrYxagl4oiT1Y
         fqDq57NTEj9ZmyAXJUj1/fgHGPLCmFKTZGce8OdQSWu+pJEzLjEXjq6vYJv8kllVK7Sz
         2arkdnJs/W8EWTzrAJbhqN7+Bm7JW9HMdaLBEmqY79IKMwX+bjPTCxI9ThcvslZAdIb0
         BFGEKqjhUZ90vOLkuvN1v5iAPDpAwtameZBjHiJaQIJ84yn4RlRbUiG1/UA97CgMB8YF
         ZxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758809707; x=1759414507;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTn7oez8OOqttdy0B0PFYhUePNvjLlG8H/kSBIplgEA=;
        b=d9yZVraW3kEdasUoUc1E0OWc+vnvMF3m1ebkGqQwRClpLTkzVkqk5mjgGnTih7e344
         TsO3/guX/mgKL5Gu4BI50PuPhUDyIk2Sa4l2DCJqqklB/Bu10WiNSBaHk2RhgHtlAQVj
         7XVup+EcBDchekzL1I10V0K2aNzS92Anpul/cUGl1vn2T6u4O9+/6476XwarXeX/i+S6
         A1e5+hwZW3bF1Zm1eNJ/OWEncQd5rNYNCNgiN2bM/XcTu6pKMR+DAqkpELIwDbFf8j+6
         FRKhpkP65tslAfz2UCi+sNIGzp4ljOmYWxOXkhbaUjo+UI/okTq51NCVyY6kbQXQ81zq
         QM9g==
X-Forwarded-Encrypted: i=1; AJvYcCWD9cGrqNs7HzK1M1e7OSGmwn6hZWHqyImnZZHGOBqmkgIMW6n7foiyuRRjrMM6iBWYATrhzsL86gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPu0XpR2gbVh0cWgAWA0K0pWrbrX7Bou/xDSw/eSFC1E6wi1AL
	wdOhuUaCgxx5/Q2Dvrq+nplHIzQJGeErAA7CANSpRjXqVt1SRv58I84D
X-Gm-Gg: ASbGnctQL4tMGyjTOyx04bLOTntbhSkSgRtV3/1yD3RhYJMil8ZovNeawtvA/mQGxwA
	DueNGCiz30QA8zsyGUzosTsqwQe/NVCAbJbMPa9U9xIQuJdOFm8LQqgOQF2BN7Dp6Ws2gvNmEL3
	oRx8zzKhxX0dfiSH5r7cOVNz0wev6DplUy2tPkuAtib5nbVFSaehKqrN4LjrQDIyfRFSheAQKZC
	fJL0IBJqhEHJJdsLdMBoQrmamspmVJjHqP7vtTWlojGOq4SoqpOS2K88oRPnZyZ57nuy1N89qsy
	PwoNG+dx/8tYyKRGtNbQetqGnOd+eXd2vmrwcI9grCjXolv26algQPew/y+5Iibn2rL7a+2PD2u
	jePHTUoSi4vRoigAM4MRLEajxgUwFQ1pOgZwHA4p2lhExbY8xCoiUpJZiVZGbXrBu7dGm
X-Google-Smtp-Source: AGHT+IGf+C9wBYJZEIjno4ujMvEF5ZwL9cnu0wsxmJrVEUsdaEwrDpFgSLVxq/qYS7s9JPxVrPjc9w==
X-Received: by 2002:a17:903:bc8:b0:278:9051:8e9c with SMTP id d9443c01a7336-27ed4a56ce7mr33844965ad.42.1758809706785;
        Thu, 25 Sep 2025 07:15:06 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69b0685sm26317945ad.116.2025.09.25.07.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 07:15:06 -0700 (PDT)
Message-ID: <3666a4ec-ef29-4342-b3aa-8c602c258bea@gmail.com>
Date: Thu, 25 Sep 2025 23:15:08 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rdunlap@infradead.org
Cc: broonie@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, mchehab@kernel.org
References: <e7c29532-71de-496b-a89f-743cef28736e@infradead.org>
Subject: Re: linux-next: Tree for Sep 24 (htmldocs / pdfdocs)
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e7c29532-71de-496b-a89f-743cef28736e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Randy,

On Wed, 24 Sep 2025 10:54:18 -0700, Randy Dunlap wrote:
> On 9/24/25 7:41 AM, Mark Brown wrote:
>> Hi all,
>> 
>> There will be no -next releases Tuesday and Wednesday next week, and
>> it's possible I might run out of time on Monday.
>> 
> 
> When I run 'make O=DOCS htmldocs', I see these warning messages:
> 
> ../Documentation/Makefile:70: warning: overriding recipe for target 'pdfdocs'
> ../Documentation/Makefile:61: warning: ignoring old recipe for target 'pdfdocs'
> 
> 
> Is this a known issue?

I could reproduce these warnings under containers who have minimal
packages needed for htmldocs *only*.

Current "docs-mw" branch doesn't show them.  "build-scripts" is the
one who carries this harmless regression.

By "harmless", I mean "pdfdocs" needs texlive packages anyway.

HTH,

Akira
