Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82EE2C08B0
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763508233; cv=none; b=XDQxnCEUD4RMX4OFKS9EZVPFUlh/2ugJE8vhwbUdwql+Myw0WL3z4elSeaM4od8BySAwK2zOthZzxTDw0EkpX3/HZtzkuCsSqEkMQWX4b2fxZ0qpEQBPL/GGTpMgiXtWZng34RttWa/cJjkCjo9hXGG/JCHQQiknbRsHDtepAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763508233; c=relaxed/simple;
	bh=yCG2aQS7HGg9MR9oFyJL261e0/79kqNAoo2GoWTkiZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AnCWV5WTXSfXK+J1oz4hW/hCnzv5teg6nQAnrOpf9FEFpUoCoav/buvEF9OPepJIwc4lrGXGLWEpWI4QfPueMAewJi92NjY3SsKU9wQ8oCT2k20j9zZ2yFMFm9YzSnDCukdrQokH7c7rXE1xX4isnFcbINP3wmZ8vEUg71yTF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7b9do+J; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7b9do+J"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-343806688c5so6510647a91.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 15:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763508231; x=1764113031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCG2aQS7HGg9MR9oFyJL261e0/79kqNAoo2GoWTkiZ8=;
        b=Z7b9do+J8c58flzv8atRoDbAiHX7Cdg0L2Z290OwvFzmRC5L6XmzZ3RdjHB29p/jpQ
         tGaP1aA5TcbfigElwFGk9rvhlJfHawzYlQC7bLXzGOZiQG8xc3ctWppTOWQTijn8KgLa
         J4zKTO55SCJ5HnHzFwiPDc9iRWVAbm9CuZfwKnb5Y9L+Upp+rNVH/OILrztQqJ+q/sM2
         xcqhDfvhrTGixf7GkR8iVN4Tu8pMQK032yJ23lLcfR7ds9K4pQHU1Sg+r0sdR6DJkUzE
         6XnD6kXwotobohxcF1BO0nJiS3GOqCZOU4tsan/ur+s+LCuqIkpi+0iqPchhxD7gPmFw
         3xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508231; x=1764113031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCG2aQS7HGg9MR9oFyJL261e0/79kqNAoo2GoWTkiZ8=;
        b=Y55Y0TwQ4rYw7yIUqWSEOJwfvQjQcKtWyH1caJjmCceuwicVcHsIDzl5blKHCyKaB4
         JU+H/yrnRUW/xJ46CUW/2eR+W80pa94ZylZGLTZRHt5rCsxm63595U/HdMsjF4+DGW1C
         qOd5gVWkaiDNC+9Ec2O2cWuaa4lnH17kEYce/ESV31/CeeNqA1gR+pgoTZF1d3zrizG8
         8csFx1xl9NZmPWEkk0ThRfWk0Aun+cEeUjgtlpdpH90UhsiBc1UH+dN2pvPYPEREm9N8
         5HUBAiVeyFpz+pEdL9lcV5GUM8zuZRnA9KeLxVmkkCxkealby+QkJ3WNEPmeGrrjkTjR
         W9hA==
X-Gm-Message-State: AOJu0YzfiQZn5juwSLFtR3q3q1yk1jluJU8dx0d/SrxXfuFKKgIPW3qp
	qgIiAL3xVHQ+mOIwrGSxk46CwJWToefee9hEkrZezN4szkQIS+w8hMg1eFqEhg==
X-Gm-Gg: ASbGncuKd31ohqLJlHJhQY/FMjKYhQGfEDPDywaG6CWUD4lz9h+XDPeUGUxZ4BSOCKz
	GzqR93SkTkN+7VD6+Jk/6kaGvlcT6QhgVkynNvZhfTYWMybPmUkNuzs/vlUNxUPp3sB2pSdffBG
	Y7VNXJd7yHIeSQxGQUWBqbuEGZcxfd+n97acwHp12eSFCUUv+XDScofulLd5lYpcIWudn6wcqsR
	3vlZ92YJUK5F7fd0l6X9l/aCWClEOrt+i8LUdg/f7mwZ1s296irj0CdVzAodpui7okqwW5YhGoN
	R7Nkwma9gr9566Ey5wUEPjD0YzlOHRCkUL/KTXz0jQOs3jd616h41/TpdRRTVSc3A4AKruVaNoc
	RtWImveLGUs+047PJD2vxt2AUN9T/oPsdu85w8nH2fvQps8kic81aumYPeKLJKnl7nCLEzaiusW
	oGrFG8pQAWddj+jwnfN+yIOpJfZ2myqb5Kx7boEg==
X-Google-Smtp-Source: AGHT+IFQEOTeK6CTsapHBFegMkdrPGZvr5eeFWcIJ3et1+OnA1zKWKRZ195rBZ9AYwPzKQ9Us7FHIg==
X-Received: by 2002:a17:90b:3eca:b0:340:f40c:169c with SMTP id 98e67ed59e1d1-343fa757fe6mr19220321a91.32.1763508230920;
        Tue, 18 Nov 2025 15:23:50 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc111e72sm558354a91.15.2025.11.18.15.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 15:23:50 -0800 (PST)
Message-ID: <cdadc017-8874-4af0-b62a-62f70ee5d9eb@gmail.com>
Date: Tue, 18 Nov 2025 17:23:48 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] fix rustdoc build detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Carlos Bilbao <carlos.bilbao@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
 <6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
 <CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey there,

On 11/17/25 05:22, Miguel Ojeda wrote:
> On Mon, Nov 17, 2025 at 11:48 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
>> Sure, Sphinx (including kernel-doc) build and rust doca build are
>> independent. Yet, Makefile "htmldocs" target currently does both.
>>
>> It could make sense to have a separate target if one want to build
>> them both, e.g. something like:
> My understanding (Cc'ing Carlos) is that the idea was that `htmldocs`
> built the Rust docs if possible.


Thanks! I'll also take a look at this, although I fear it'll be complicated
without a way to reproduce what Mauro experienced.


>
> I don't mind if that is changed etc., but I think it is important to
> keep the `rustdoc` target simple and focused: it is a "basic"
> operation (which is also used to lint docs too), and way faster than
> building the HTML docs, and it doesn't depend on them.
>
> Apologies if I put it perhaps a bit too tersely in my previous message
> -- everyone contributing to Rust code is supposed to rely on that
> target to test their commits, and needing the whole Sphinx setup would
> make the target way worse in practice.
>
> Now, in the future, if we start relying on generating references for
> the Rust docs from the C side and things like that (which is my plan,
> but it is long term: first item in
> https://github.com/Rust-for-Linux/linux/issues/350), we may need to
> rethink things a bit (i.e. we may need to run a subset of the kernel
> normal docs to build the Rust docs), but even then ideally we should
> only introduce the minimal dependency needed.
>
> I hope that clarifies -- thanks!
>
> Cheers,
> Miguel

Thanks,

Carlos

