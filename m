Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB24C92
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766187105; cv=none; b=FN0YeMbucO4m5jehxKbpPr44HtA5cLcgDAvZ6a0GAQd1jiu+ZK641Pr5Us3z6FMQBn6ZTPGgvW0pYpGMgh+a1oSqJtZIfmVxMYNlLkAAlQaqzUhRKn5COadHNvKhwGzjHg0RS6hEdeLH8SUjWimF5AljwWWzd3rlecsp6HNlbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766187105; c=relaxed/simple;
	bh=kqYAQZ609rJygFWC7CbHOEHNatKsPADzGjHUdHPU3XE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pCZMbyEWTPPlvcdTiZJ7AXMb0jYCZfEUsr1WJVEoOvFk4i3K8mVU68GWj3NUGJFtf1qoG3GSP9qayH8Pg7E+BVkg3LzpZemxxCo2T75kuxwtxLLyE+TCcCCA+3smrTMOz2AAqoPBcvWmm7s8u3EkEkX3rwkQfCnFA6jzu50i7a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWAI0O59; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWAI0O59"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso2251469a12.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 15:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766187103; x=1766791903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xjhz9NvSIj1nkwStS3EsBbpnWvjG3hzX9yFNjSmaNpQ=;
        b=cWAI0O591Gv+dba/YfAcSU7vr3T6X/mvNzA4PPUsPf6SyphsBqlqsT6xjeVcdnQiaE
         wxJUdii/zwpubuF+icsr7gCzTRHSL27lmLSejNJNOdXajr70hbEHv1miSuFv2yckOKi0
         ZqbyooP37njNz5uqPY08lR3IjhojGNiJiL0Q8CGrsqU4ByHQ97hGFX2k+UugxjPYQSdh
         +f2wmqv7aagqW9L9u4TThxLVedaMt00AZQVVpHLdURgOH0p4vzyOFr7m59KY9yxB1hrb
         rB9bggdpi3sq5EUEw2ryihS+o08Xa0yFxZcCf5ivKvQjPnFiCLbu6YCz97hnqb1KgvG+
         lG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766187103; x=1766791903;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjhz9NvSIj1nkwStS3EsBbpnWvjG3hzX9yFNjSmaNpQ=;
        b=BPCVoLO6rCO+XVhH+Z5DyBfRFJC0scNi1UYLX02umr3h668FPxjxg07W99ctQBo1xm
         PP+amz2lY5L4mexNfQZMphFqsgKvqQcqcjTMWkqyOK25c/PEE5236SrGmcaSruI+C/rg
         Ngt3/zXfHPYdNwh6dUUTWZtU1vgisOq8Bs3WJoN99iW5HmczSQM9ewo/KpQ5REMqUoS1
         vTRejCbLMMra5QA66eZUXl0Gxk50FnUOLpUDsL2vFMUIrDFN9VCr3vmhjQ3FwarHQeoC
         9+NIv5592GBUZxxqrXcrSA6O25JtT7em1bkBMwwEl83rX+zAqTwRVwM1v8BDLokXemZJ
         2bHA==
X-Forwarded-Encrypted: i=1; AJvYcCWhzhjDZIQT6ieOaX0lLP8ocQD7h6eR3KiQxFedcKba9XXmOHGSfDFLuWBBoK3iXTe1cT6ORwkRJUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwULRVYHz8yTegQI+gCHBQQ6tZcs+VrXuCcU7uKQ9aLcIEVfhr2
	6Xydk/qVrHlTtK/JH8llkiZHPgLNhZCYhYvGq6lvdOQITd99SWXha3H7
X-Gm-Gg: AY/fxX4VttAwxAqsSW6/IAusF2rU+e36N/CbHzZj1HqzgjDWj86nJeP+5etkQYCHDG4
	dzj8AE6MmsZe3ZuhjjUldhb7ZkrXoabc3R5YPYi9F3fR/6cP2JCjXulRMsbMN2kucTmaJg8Oqfx
	OJ8zJifpkVTC+yq7CBR6h3VNqsaA405VBUpJ9jViBPRtyWP4RckOPRpomxuzH3CHh4Y6BNVoK4L
	uayDrjPTJu/2KnP0sDmX+Ley/kp9H43LhInR81+z6co6yBSaXgf75MzfdLFE5lV0AuyBpY01Klr
	EfstJ6F2LDYTjFBnZC1r4omrdJKR1dcMRg6f/uNXDwo6fkh7TWHnnMa2ThIiXa+X3F0fCh6QBh1
	K/mULncK+yWLUPwOMggacEJQlzlgIM3JAjaZK0dzfdvp43P4CBxKg+f34U5LuLNRj1BhHnuVLC1
	YCW8EJbR6CyH0bR6o+sQ8MLM+7wJs2BC2FA7UOUHXBdQsMK4nYhQAnRvbRAHoG+o8eVWVyiXKFC
	nRQRHahOJdNiqNCp81EdSig4se4wZZBRzSeOu4O6n0b5EMMRh2PWYt6afMV/G6V25DDJvhkgvX8
	GRA=
X-Google-Smtp-Source: AGHT+IFD9VEfhTkWGAUJ+KrkgUpiheofAxrSZVwNtEffu0+8gx+hrdlGu9tKXSDKwQO+mDr4xt9mXg==
X-Received: by 2002:a05:7022:3a83:b0:11c:b397:2657 with SMTP id a92af1059eb24-121722be81emr4954809c88.22.1766180747284;
        Fri, 19 Dec 2025 13:45:47 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm10260116eec.2.2025.12.19.13.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:45:46 -0800 (PST)
Message-ID: <ae957ee5-cb47-433f-b0b3-f4ac8ec7116b@gmail.com>
Date: Fri, 19 Dec 2025 14:45:45 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bart Van Assche <bart.vanassche@gmail.com>
Subject: Re: [PATCH v5 08/36] locking/rwlock, spinlock: Support Clang's
 context analysis
To: Peter Zijlstra <peterz@infradead.org>, Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>,
 Eric Dumazet <edumazet@google.com>, Frederic Weisbecker
 <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>,
 Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Triplett <josh@joshtriplett.org>, Justin Stitt
 <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-9-elver@google.com>
 <17723ae6-9611-4731-905c-60dab9fb7102@acm.org>
 <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 1:02 PM, Marco Elver wrote:
> On Fri, 19 Dec 2025 at 21:26, Bart Van Assche <bvanassche@acm.org> wrote:
>> On 12/19/25 7:39 AM, Marco Elver wrote:
>>> - extern void do_raw_read_lock(rwlock_t *lock) __acquires(lock);
>>> + extern void do_raw_read_lock(rwlock_t *lock) __acquires_shared(lock);
>>
>> Given the "one change per patch" rule, shouldn't the annotation fixes
>> for rwlock operations be moved into a separate patch?
>>
>>> -typedef struct {
>>> +context_lock_struct(rwlock) {
>>>        arch_rwlock_t raw_lock;
>>>    #ifdef CONFIG_DEBUG_SPINLOCK
>>>        unsigned int magic, owner_cpu;
>>> @@ -31,7 +31,8 @@ typedef struct {
>>>    #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>>        struct lockdep_map dep_map;
>>>    #endif
>>> -} rwlock_t;
>>> +};
>>> +typedef struct rwlock rwlock_t;
>>
>> This change introduces a new globally visible "struct rwlock". Although
>> I haven't found any existing "struct rwlock" definitions, maybe it's a
>> good idea to use a more unique name instead.
> 
> This doesn't actually introduce a new globally visible "struct
> rwlock", it's already the case before.
> An inlined struct definition in a typedef is available by its struct
> name, so this is not introducing a new name
> (https://godbolt.org/z/Y1jf66e1M).

Please take another look. The godbolt example follows the pattern
"typedef struct name { ... } name_t;". The "name" part is missing from
the rwlock_t definition. This is why I wrote that the above code
introduces a new global struct name.

Bart.
