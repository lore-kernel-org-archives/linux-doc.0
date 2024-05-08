Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DB8364
	for <linux-doc@vger.kernel.org>; Wed,  8 May 2024 00:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715127372; cv=none; b=qmix3uoSN5nVTzvebJiRV5XSzvkUATIKO7WiNuUv3oD3fGB8J0ZWQtbNxbiEdgMCMrmPtckf+vWMWazXM+bL9CoTSxbmE57KEqsK00iDbZ3Y6ra+mR2O0urN4reBQqTCiEly7j4jjh8wvcdfgpbNxb5xRodM9JPZHY3hfPLMyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715127372; c=relaxed/simple;
	bh=iG1KxbbO5MvARNK5ko7b33Ud/1DhjIU8OBrU8tHaNBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=opqLOmSlhXdwxjBs3QBFUEi4QzXIXqoaQTjaDJMZAu6UtPbXfqKt2Fg8X9gVQY3xsYYl4gaI6xERbIafxuddp8VArFO1OTvQZh+3IXL5bBH3oaf5L9Zr4IwOArLMniOKqMCyb+G80aS+ZGGOGn1g8Vjbs0crW6KEk1ptfL21Xig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTaQEJua; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTaQEJua"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1eca195a7c8so30791395ad.2
        for <linux-doc@vger.kernel.org>; Tue, 07 May 2024 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715127371; x=1715732171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gg8sSzPHrM2jCyT82bneNTIvvXSCQ5woaFjmWG9rkYQ=;
        b=mTaQEJualZtSfHz+xooSU9vOaTwNHF/Dcwf+P3GNnzfZ8hWT7Fp1OiukSCwJQ4eMXp
         KfcC0JJpUVDhCFp36cPh5AGlm0D+/5mOgPoTTQWXm6wKcUylUa2QJQNlzVjqfG95LLlu
         aqZUfo50HKBokSvy8f6RjoY9MCIeJScok21wtcNjMlfnJzEdAZjAFfCymVGyX5+j9mW1
         y8WNNV2U6wLyXwoOeErTluhzM3fxvsVDvCZ/8QnZdE2NdrLWz5zTkeiV5drkUu/M9hNj
         C/9O9msvma/BBqkOFEo72axLXjSvy8LVJMWBGE1hQSyKRZzEJwFtYcUROfNxFiHbzc/7
         P5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715127371; x=1715732171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg8sSzPHrM2jCyT82bneNTIvvXSCQ5woaFjmWG9rkYQ=;
        b=LNAcvSygAMqGQIJesn7qlOt3EOX69EeNQzx6PbyB9DdIw5StQVKT3AD17vYMzryjrP
         VfPJEJCVOFGrmsxqLiCwQeh/+AvgeqUu/MOk7AbOXrrKGgqbjgh3CqTWjeq9xCK+esf2
         LfJi9xqnZJP21Sv0Sp3XyVa1iMtXn/wb+Q8lQPHlFl2acfX60XIovMFREGRthr0HwKH8
         ruWuccls0g181ZdXMaKlT4OL/ZHMoByUdrWxQz4nr+EW7RD2z/CXx//fNz7OdqLE29cc
         3T9R6TGr1UjCq47m+PPpA+eQXP/QGfSmgnZoKqo5ot53yzzXI8hNt6jY9OEQUJRahe8S
         LzSg==
X-Forwarded-Encrypted: i=1; AJvYcCUlZKXYQhGssj+IrHNmnmrxHS1XoS/R70T6x1/ymUl7Cy3e0h2lbTzEkCzqOkxqM7YbxOFvU1pgPH6w6P3JbXjiYPFdCOn86Ifq
X-Gm-Message-State: AOJu0Yxe3AHsRvaQQatM4Ew1AvFAzgwGNowBAl3NqC/mFR/KUbfNQy9v
	IVoqzyZnjcfKLSW04LI0m4R3DmBcYa66hjtxxQ8PMahb1MOnND/Bj2g2VQ==
X-Google-Smtp-Source: AGHT+IEhBT6+9s6iDLTCpWC/yiXCKkGS+D5UZHbvZ8KUeFLJzWY17Ks7mvSlRoWKnR5+l5xRC0Nw0A==
X-Received: by 2002:a17:903:41d0:b0:1e2:9ddc:f72d with SMTP id d9443c01a7336-1eeb019739bmr12711945ad.26.1715127370626;
        Tue, 07 May 2024 17:16:10 -0700 (PDT)
Received: from [192.168.0.107] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902e85200b001eb50eba52esm10590699plg.214.2024.05.07.17.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 17:16:10 -0700 (PDT)
Message-ID: <ada37f1d-d53f-4da8-905c-d6cfa7809259@gmail.com>
Date: Wed, 8 May 2024 07:16:07 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: checkpatch doc suggestion
To: Diederik de Haas <didi.debian@cknow.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
References: <8090211.0vHzs8tI1a@bagend> <ZjTe1STECXg2mmmJ@archie.me>
 <5571273.FuBcWSoPN1@bagend>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <5571273.FuBcWSoPN1@bagend>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/24 20:59, Diederik de Haas wrote:
> On Friday, 3 May 2024 14:55:49 CEST Bagas Sanjaya wrote:
>>> I think it would be really useful if (f.e.) the following URL
>>> https://docs.kernel.org/dev-tools/checkpatch.html#BAD_FIXES_TAG
>>>
>>> would lead me straight to the BAD_FIXES_TAG explanation.
>>
>> So to add link to arbitrary location in the docs, you have to explicitly add
>> target (anchor) to desired location. Then you can reference it using the
>> target's name. For example, to accomplish your suggestion above:
> 
> Thanks for that hint as I indeed didn't know how to add anchors in .rst files.
>
 
OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

