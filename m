Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE4218DB1A
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 04:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780027465; cv=none; b=szMKDpiXmXWuFKUjHni1XSeOS3D0TXQ0SJB/C9Ko/yDfilYNiA8F68at+xuxbkMGhBpH4P3hYenz1vgu84IdJxGv0xDGoLj5ay4KQQrzIhWo3pzrg/zwsW4bU9jdfkASBqCSf82MzPDfulLjyk6hFcADUsPFvJQFCS3WGfboSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780027465; c=relaxed/simple;
	bh=mb/rSxm+wEzd8QfIy2jMWfCNfq2RrUdQW3aBnKQ2H/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnntuvDCn2meCfwX7QMO7d0ywPCf5f1ewaRovy3Wavuy2pguIlDgv75gBvt/nCFxwDe4RGGqPQny27CR3iU4xLIUTYxG44W9PcFHV0eeNXWfDBOnttla3y5BceFwcTNwZsWr2YsKN6DUCE/+xZ1iL4Z/0OuYt4bXcFWGnZTUS3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq4qatgH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq4qatgH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b941cd869cso87643575ad.1
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 21:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780027463; x=1780632263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haCV6tMs2b3vmhgg0KLA2dyWFG59i8yL6VtK0SLdaRI=;
        b=iq4qatgHaln1/ho1gXp8jyZdr9FZLYQ+ATX/1ZOsHB/1IEoW2JNKH3Z1vP1RozG+ES
         2LJYESsUquJmlfEgIvZAJISZAfrLtopOBqo9z3fAsYr20PJem9rvCaINqMzWZ9H1vfKr
         ePtp5cYwPJLtAs+5TRw+0ZpgVdAKNCkSpZSZVuHqiDFU66qOLTFzQXFeR2QCvi8Brm6h
         v2P+13/egxaVt/rZLzff/oFgDtYbaIBtFfWUEeoiyX0hxbACBufLmDJ7NnKMBciUaGYS
         je9WpIJa45+k4a/LAav5RriT9TA9kkZOundNTeP1Un+Ur+ehfOJwmNfCgTmaE1uAz+0n
         eK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780027463; x=1780632263;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haCV6tMs2b3vmhgg0KLA2dyWFG59i8yL6VtK0SLdaRI=;
        b=Nv0B5n0lEFhttLVrDOQoPdTR+dbrcvIWcE1gwk9kt/KtcwL0NFDm85nwq0+OGL3UlM
         GFg7ezg0vL+KshG/qSh+LBol/dYPvl6d9+tXW2pq7gFogrL34Nqsfc0uZp6alZP29skE
         m0U+H2P1UIX2b95c4jXpfvqw+4RlJ0UL5nDm6qIFojk/Ny9ySMAlWds3FNmGlyCdV/5U
         3Bsaqm7RcK//ct+Z4iiQumadeMHBEojNvVe4jZGsk7LwGf1sUxMM44AnZe84FX7ousy5
         lMQRS1MZY0LRK1xruYXTpDf1zkI7bHZlcdUUnHCecovBElMSfFfdFeCFQ+IbKMBQYnzq
         D/Mg==
X-Forwarded-Encrypted: i=1; AFNElJ9fV6suXl9xX6wmWlhgylyXgIWm1yS2Mtzct8m9Y4KZ9j65PEv21HLVZSvY05Av79G+BVJBDGi46+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOSAi5lyFfqdPNWyAK8PiJ4zAVxIQwzRBNKkzi1DUntWaTRB1D
	JyimO2IjO6nctITT8PxHqQH+FlakCB6IVaLwol72lFetXBYGsHopdgXt
X-Gm-Gg: Acq92OGuee9YN2IRkmeH4Ul52BDaFQEVKLCJMWUoT8440VRcZesKMOF1bm0QqDUrNjm
	VK49VrJchEAd01w1MKjJhRAiTPTo7N05X1MnK0GhRowceZ0ESBVLpxGp86B3Yc62uJBnazUNLHW
	1ltd+/3bjywodE3O5gYm1pbKYByiEm91sq13fJNr1+yBgYHwFKgG+Ir4bNGoUDZ8t7x4W1q5xPT
	kD7y2NetiqmZ3dGyhUUYyVPzdo16aQkr2t88RUH//CEmOjKfxdkUm7S9GjLFXHu+eRd5O4qREox
	evpTVOfvCTjO4aAfRkvbmS1VxKtUbproPVdGtY2u6AeuKeQkdZFpu4D4L32BE+o5/vdHXKJy/VD
	ppchO+Ll8q4VgBoE+NvZbr5kKgJshji05Hjcdk5Ec+85GdZhOOQNOcpEmomWgGrRsQdKjKYoSB8
	BgFSFxc+FGSn2pmmXHtsT+U+mjhTNczS+IItcm++gZ4uyDzwW2ln1b6s2Z3FyQu8iOkke0eRmZ4
	ZM=
X-Received: by 2002:a17:903:1b70:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2bf204e2cadmr16279045ad.2.1780027463398;
        Thu, 28 May 2026 21:04:23 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:2f00:9977:36d9:e3b9:b31f? ([240e:38b:e68:2f00:9977:36d9:e3b9:b31f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b01732sm3261465ad.54.2026.05.28.21.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 21:04:22 -0700 (PDT)
Message-ID: <c26e8fce-de82-4fed-a749-41c4f051eacd@gmail.com>
Date: Fri, 29 May 2026 12:04:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: zh_TW: process: localize terminologies and improve
 fluency in 8.Conclusion
To: Jonathan Corbet <corbet@lwn.net>, CHEN-YOU-0331
 <chenyou910331@gmail.com>, Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexs@kernel.org,
 Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>
References: <20260528041330.23247-1-chenyou910331@gmail.com>
 <87cxyfllhr.fsf@trenco.lwn.net>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <87cxyfllhr.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/28 21:19, Jonathan Corbet wrote:
> CHEN-YOU-0331<chenyou910331@gmail.com> writes:
> 
>> Translate PRC tech terms into Taiwanese tech terms (e.g.,
>> 內核 -> 核心, 代碼 -> 程式碼, 軟件 -> 軟體) to improve
>> readability for local developers. Also, rephrase several
>> awkward sentences to make the document more fluent.
>>
>> Signed-off-by: CHEN-YOU-0331<chenyou910331@gmail.com>
>> ---
>>   .../zh_TW/process/8.Conclusion.rst            | 45 +++++++++----------
>>   1 file changed, 22 insertions(+), 23 deletions(-)
> I, of course, am in no position to judge these changes, and I worry
> about getting into some sort of turf war over differences in
> terminology.  Alex, are you able to give me a recommendation on this
> change?
> 
CC to Dongliang and Yanteng,

Yes, we could take care of tradition Chinese translation in Haowen's 
absence.

thanks!
Alex

> Meanwhile, the signoff should have your proper name, please.
> 
> Thanks,
> 
> jon
> 

