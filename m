Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F32BE639
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649560; cv=none; b=ZpWDBoM2Cmn4z8V35z2IaQdpfSgrnD0zHOOWEq5kOC1xncW0VjS5pRNswSKstCAyI7XtHI2sB3LNe2z9So0tgWUgvhyYIogI4u2/64LLENPFU4ASVYLAxno6Vu9ulh8otMD7lIlMtEJj8POax8AqRXDQ/EuxO+dYjQmwCLgCHJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649560; c=relaxed/simple;
	bh=ZA5+WmWa81BDLJP5BGQk8ATyh4n2927mbHOeirEVD7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hevbnN4kp+QPhH174Eu/Ffx4xpsYHgYoc7BMBz0MCXT9KDJHKhHf1/8xweSlrGzfr577AHHU4V44MEhv62G7PReovBLjnS6wqOx1FaaEiXMgExPH8LZF6nLU/bEH4qbWxzG9kqDLjLRTccnN6ruhvqF/Hlq1sScQpb11ahZZbSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VBzNWGRt; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VBzNWGRt"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b25dd7ab33so55561885a.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 06:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649557; x=1764254357; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1YYwr6/m+b0XJm7ZWyrVETMWpVegAdWdXxk9Fmto5Bg=;
        b=VBzNWGRtSIwzLebqQzHGsjTwW9k0kO0/JDW0ltdZUlyVaN1pdV5YMpW7veVmZSWthu
         NnT4gv66vGvazkI6AoCy5rrmDt6KyH2oOJ1SPXj5rE88ZJm6y7U4PUvx7riQ+l6ul2i0
         Ykb2lWmWI2wVeAtQ85MxUoDp4N2RPFmvNASyudfIZMJiNWG4WK3dU651ZjCdP+1oMjSQ
         Ic9ioEJA46EvY7eH4jvFjjuV5n0oedldzsBUDiBZBh2ijwvFyXoI+/Z2YvCAWdKl4KGp
         upe1BnfnRCZUavmUVleIOB33MCr7QEvxGBUx/mBjZriWUZR+QM5M2XTtK83SvCUtNrST
         GMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649557; x=1764254357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YYwr6/m+b0XJm7ZWyrVETMWpVegAdWdXxk9Fmto5Bg=;
        b=t3zDJ/cmPg40BxAwuSLTxu68wiVV2RMVVjO8Q63uGHgBZVBKYS9iiratNrVp0/P0Lz
         K2lQ3lIrPWdjtHNal+HswDRcYkL37NWRZPGAFtZknJV8FVyNHvMZWJdRv6jprTFhl3tP
         /uSYx8JxruVsq6260w+sdhNeNDE2W5tWasZXH5Kp4QSm/GE+tJ6SLbuNu4MGz3bXG0FY
         1Xwerzcg9GCujkmLa149VUwWrrJ4HcaM3/jxX/gW8+M7QEuCs3FEs69SHVajKxcWtKxy
         pBn2c1Myn3k2bBWpCOkBLxwrID+SPQvRdiBS70jdmjZdxX3/io3ELsK2hi8JrgsvgzSd
         FqRg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Iuem0vBQAnmaCJk1TxBw9I+nrwkfbtXascP5Xi+aDtccmOT7E3b7osgv2Qrdtkvp1Hx8KjsDYCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7NSgBd0AYJyKBc1g0qkT4b7jQUFjdOHYnjVacsSQxOO8mSN5N
	9lhSyqxODjeflSF/k2HVH4/doWH6vxfvDWAI1gUW7owh5zgzMLo6bVnVPvAveywI3g6aFsRegpX
	SA/j9/KkroKYKjoGVsai44HzDvuv29t3mTlGTqTmjAg==
X-Gm-Gg: ASbGncsVmDGf0Kto7hZLPTIR0iH6bEfAZitdyJPzL8aMFijcOZ7BZrC/SPRI7F4T26v
	RlUQv8Q39IBq8mYIdpJeiHmxPdhHUSEAU+Yy+cq/wHRytCLrU1IHldJFHVp4hxsoTyJo90ke91B
	mdDXvVMBg/cDZE1jtER7uNB0UthUOhUaSau2OUQAudcgPdcaTkdkyDP6I7WQZLO/U/e//m65MZn
	0bWshE39mv+cwJKgP1IW9RStkdbl6A/nq6YkIo3d4mbw7HqG7bhXburIMwE2wQUkiyOSD0sz69i
	HVOb7+NqwHxvs2b2XpNXA5aTGfq4
X-Google-Smtp-Source: AGHT+IE/cYHjwh32MRdltB28T2tJfN1f0Ft40ID0C4cRQVP34kZKhQiUHkvPg/zZ8LIUS1orCjlgHUCSDffLbt6pAO8=
X-Received: by 2002:a05:620a:179f:b0:8a3:cd9e:e40e with SMTP id
 af79cd13be357-8b32749aedcmr396458285a.86.1763649557337; Thu, 20 Nov 2025
 06:39:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org> <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org> <20251120141821.GA724103@e132581.arm.com>
 <20251120142520.GB724103@e132581.arm.com>
In-Reply-To: <20251120142520.GB724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 14:39:06 +0000
X-Gm-Features: AWmQ_bkldnJdoOcwmqeUFrf-9arSuuMXBjA2pwzRXHnuYEEP3hoN9Iyvci9YeZk
Message-ID: <CAJ9a7VgcZP_Ck=ZJrHBi3uffYk-DNC=MV0q3CoAm2twrsoCgvA@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] coresight: Refactor etm4_config_timestamp_event()
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Leo,

On Thu, 20 Nov 2025 at 14:25, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Nov 20, 2025 at 02:18:21PM +0000, Coresight ML wrote:
>
> [...]
>
> > Maybe define a general macro but with extra checking:
> >
> >   #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> >
> >   #define ETM4_RS_SEL_EVENT(paired, sel) ({  \
> >       if (paired)                            \
> >           assert(!(sel & ~GENMASK(3, 0)));   \
> >       else                                   \
> >           assert(!(sel & ~GENMASK(4, 0)));   \
> >       FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,  \
> >                  ((paird << 7) | sel));      \
> >   })
>
> It'd be better to use BUILD_BUG_ON() instead of assert().

That is a decent option - except I would have ETM4_RS_SEL_EVENT(mask,
paired, sel) - so it can be used for every register that has the form
<REGNAME>_<EVENTFIEILD>_MASK

It is slightly vulnerable though if someone passes something that is
not 1/0 for paired - which is why I preferred the two separate macros.

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
