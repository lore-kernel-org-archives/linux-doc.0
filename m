Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V8aYhMYG"
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C69210E4
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 08:04:05 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54c52baaa59so9432a12.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 08:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701446643; x=1702051443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIw3vEF2EG/mTMxw2khY1FH0qqPJ+aeReW5VuqhMwP0=;
        b=V8aYhMYGPG7qXDSgQZV048cN3bvc4ya+jEedS0ehzqcpE8A7T25Ve09tW1ILDL0yQg
         cxAJKjbiIcAmghFPbzabY6ZJqAg9bj8M7I53mgMMmG8ATpRLdj+pgPKe+La2Oqneah5t
         UljG21HuOsew014XfiEEsiXdbDxELwqlPj7QCAuVBKEHtpIqrxxPFE7vdzhC81nRVDzM
         bPD0I6zMqgKwPprPzP2iNZOxu0ClP63y8NFWDy28H/Y2ZHcu8/rp3cz2bc5Qbq7UFHQQ
         f7pryyhSQqi5wk9/BJ8PSKU7Jjc74qIg6pA4aKF+G5ndlZ01EQqCXVL5djZyNHC05Utz
         cS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701446643; x=1702051443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIw3vEF2EG/mTMxw2khY1FH0qqPJ+aeReW5VuqhMwP0=;
        b=JNEkKQQQ3qGouJ8jo+iwAqfbIR1xo+J2AE8L4cH03+uoV4xrPvQFwf+k9tdfBlMwQ0
         AygsqLbaVS5Tc5cJZn0CgmeUbimRSicmFWHYehjYeQl18tIMIDM+2SobSbLMLLwQeW5D
         12g7l++8K/s4dXQ8gisRzTliPbBectvxg5Ac37HHZtYOD8ML8P0MLst55PL5b77Ehl3I
         XGPEdW9daYdP6okmFvA2oCda2mGwmsYLxwiLTsYv6QoYHk/rAyYeRFGODN9L0PMCQjNV
         BGkjwFM0i/cZ7QTJlR4w54+Zk3ke3BmM3iFrmaWD8dWFm2SEjvTPhY6+2se+15rI8XA6
         eJqQ==
X-Gm-Message-State: AOJu0Yx1Cbnzn6cMTv3RMJs1DSQoWnoRX2Artc6qcnXOSeEr39k3tcKE
	bUbWl+nUUTQ5gXj1CLvcXKz0HDuhF5tQrSx9SVdcMg==
X-Google-Smtp-Source: AGHT+IFbKGM7joZp4qw2RzfIG1a+QAT2tCZJbbGRakYxypzXhqZtf5JyGalyvKMXGjmVbhgvNVqlwR+qh/bbdS/yzjc=
X-Received: by 2002:a50:d49c:0:b0:543:fb17:1a8 with SMTP id
 s28-20020a50d49c000000b00543fb1701a8mr83893edi.3.1701446643476; Fri, 01 Dec
 2023 08:04:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130204817.2031407-1-jannh@google.com> <06c05c8b-9a3b-4c04-b898-0f82e98da70f@redhat.com>
 <CAG48ez1a=VuEWwPTjcXFAwCyt9bRH-WzAfw0uP-qVu83kdxkZw@mail.gmail.com> <a9e19ad0-9a27-4885-a6ac-bebd3e997b02@redhat.com>
In-Reply-To: <a9e19ad0-9a27-4885-a6ac-bebd3e997b02@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 1 Dec 2023 17:03:25 +0100
Message-ID: <CAG48ez29cS9KKC_0g_eCxiUsSpg1CjJzt83sBViY0izzf4K5yQ@mail.gmail.com>
Subject: Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 4:52=E2=80=AFPM Waiman Long <longman@redhat.com> wro=
te:
> On 12/1/23 10:01, Jann Horn wrote:
>> I think this pattern anyway only works when you're only trying to wait
>> for the current holder of the lock, not tasks that are queued up on
>> the lock as waiters - so a task initially holds a stable reference to
>> some object, then acquires the object's lock, then drops the original
>> reference, and then later drops the lock.
>> You can see an example of such mutex usage (which is explicitly legal
>> with userspace POSIX mutexes, but is forbidden with kernel mutexes) at
>> the bottom of the POSIX manpage for pthread_mutex_destroy() at
>> <https://pubs.opengroup.org/onlinepubs/007904875/functions/pthread_mutex=
_destroy.html>,
>> in the section "Destroying Mutexes".
>
> The POSIX mutex is reference-counted.

I don't understand what you mean by that.

Anyway, I guess this thread of discussion is moot - I'm not suggesting
that kernel mutexes should support this behavior.
