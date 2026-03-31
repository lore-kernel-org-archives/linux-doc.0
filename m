Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B659327C18
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 17:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977074; cv=none; b=ZtvQybHFxiIsQ4NT6jY+yCoPRJF8q3085yD+2dCk9SKphh70FHxi2IzZomtnQOs5NPAbjUwJnd1ZV0qQmjj2mwzT56ZY1mzPBIQElEA6o5583R8OEja0LlO9QMDs/L0dYYyyKDuxZb3l/I4efSbdYSbyPdzuFSR4IP2e2lAetzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977074; c=relaxed/simple;
	bh=fvOPupQEnVmV/NcMv1g9ULLTpQ2SLYsqRQYOCWOIjsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFnxMGelSG+7mog6M+0nB+3L9IcoiHZgSJg2m9hsgvPhDjYuG8hhFqdpUIA/D7wj7Et5XCha4QvX9ejjiS2LY8soM7DnuXEx+relAhD8BA1w+01wFAgt5hqVVEoJqCUg7fYRbKeJWmyN2y386DIzViplvahSuV3f8+hDDfWJG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dAg8WLak; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dAg8WLak"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66db0cf6a4aso162658a12.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977071; x=1775581871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+4YPeQId4Y1cXleVK3wn4GXPFCaXiKdSrMa6qJPwN4=;
        b=dAg8WLakjIyDisHAYIfwzq0k+aJ2OUedqvOn9xSq3WhoE5kIO6Rtm8+fbsKMfzTyji
         vBeB47DuvJmPBFqxXz91YxKu5aGzfxp9bYUYlx1QhgnutL5hbjJcCQo6n3Wrm0SwfOjs
         w6DLuPTVf3uKaz5JNSON2GPlHbWPgTVdXVq2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977071; x=1775581871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+4YPeQId4Y1cXleVK3wn4GXPFCaXiKdSrMa6qJPwN4=;
        b=dXz+8Fl7Vk3V24Ct257cTTZc/3g8eN2KnXlV0RP2OiugvJ40NBgp+RwTAx+09KB1q+
         8/9Rk/b33UaQj4KnCMOB4A/Q7TBATLxRhHul/lCgegED+qwA2uk4LIbztjjxf4bUw4AX
         xHx3EUTEN3ltqhcJaBogtRQA/EkCBbbvCHXU2LExET02iAfLiYoGs2e4VJsR5l/NUG1J
         rj8olqwQcfDIch/ynDiZ9D0J6jIaYthNIc5Ra8a1Yx/GRWDRmKsdB/AonNG14Vqaix0X
         EEKnskMODiAzKYzKuTXqY9REVvdo0FWSqJlZPouxiBRWiLv49QUnPWhJeez+MQ5xHs9f
         3t8w==
X-Forwarded-Encrypted: i=1; AJvYcCXoY0R5OErhPqfgF2KgDsqu0ji9lma06Irx4LtPut8UbFEFlsas6yKrX2vf7JrXxu3LrRmZLo9uqDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbI43wwedxLPvyLJE2ixRG6XQ6nqCILoMYLVm9/6HyevvsqA9E
	Cd4C2xQ1SVW+7q5W8XUyxycIdOag+iPaales5twM1UhHJaNR2Y9bqp6ffT3mOyDd3LDVyryt+Y8
	Lmw0sqZhPoQ==
X-Gm-Gg: ATEYQzxhHhQJ0ZORHV76QcYz/zehCrNSPso59ayGgKoYXyKRtxo+U4DtKDjccjT3RB9
	Mg+2KmdqZNME+mk02w6zsbvuXgLOIKo2rV2IHtpytagYloEDWJvBmxVKtheKO9BvnDdU/UD71qF
	KTjcMf0xa/vXhybq23zs8v7foUQkUjiV6fL97uu5xktxUH8HBdrg9/TvEF9JO4qzoltk24Z9gIY
	E0emMWJSWgweiXeftWeWAoB8P63C4sWqbTFQXOMYNFrbRuGjcumGZ36oq7rswSAmaDnmwzvZVdT
	M1/jCRcHmaEwiyErhljNQ9gqKXCjFOyKwBXSDmzBOqK9pCkhnV22i6X8YO1Fa9RUAew2g7RyZTm
	uKWnFg06nUNXSrgH4x6J2jwE9mpVH6GcE/gjh2P+pMPHnuLwgUSTx+GfK2Y4+gaq25djMt172Kf
	W7vpsvejEDiThD9WsTY/ZArRXHRHBGNf7FXoKM2+XjGaIdb0LAfZiBKOqnWyDlyRI2goFVbGp0
X-Received: by 2002:a05:6402:1a45:b0:66d:ce62:7af6 with SMTP id 4fb4d7f45d1cf-66dce627b2cmr30152a12.19.1774977070766;
        Tue, 31 Mar 2026 10:11:10 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66beb39e725sm2485649a12.0.2026.03.31.10.11.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:11:10 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so10209140a12.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:11:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfqj8/DHprGsenaeCBi2VrrB4FeXR+tbJjMNULaUDihFrL1VHkYYI6wVxbHxZRYeECtpai6tSJa8o=@vger.kernel.org
X-Received: by 2002:a05:6402:320a:b0:66c:2ab4:1c17 with SMTP id
 4fb4d7f45d1cf-66db02ab9fcmr248797a12.9.1774977068945; Tue, 31 Mar 2026
 10:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-5-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:10:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
X-Gm-Features: AQROBzDm3gEHu3WZ_nfCrD45b6_U9t89WHlDWMoUx8NfrAs9jBI1Qm6jv38zdhA
Message-ID: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 09:37, Kees Cook <kees@kernel.org> wrote:
>
> Current straw-man proposal is single letter suffix because it vaguely
> felt like the least bad of all choices, and they should be short or
> everyone will just continue to type "int". :)

Violently disagree.

I'd rather have people continue to use other types than have somethign
that isn't visually obvious for *VERY* subtle semantic changes.

If somebody starts using explicitly trapping types, they need to say
so. Not just *say* so, but scream it at the top of their lungs. No
hidden subtle behavior changes. This needs to look _very_different_.

No stupid one-character things. If we go down this path it would need
to be "wrapping_u32" or whatever.

That said, I think the trapping behavior is unacceptable unless
there's some way to recover from it. An dno, that "some way" is not
the broken C++ style exception handling. That thing is pure and utter
shit, and fragile as hell. Anything that requires trying to unwind the
stack is just a complete no-go because it's going to be buggy and
untestable (sure, you can have test-cases and the unwinding will work
for *those*, but...)

I don't actually see any sane interface. The "unsafe_get_user()" thing
with actual labels and exception tables works very well, but it would
require wrapping all trapping operations in a macro.

Which is maybe not a bad idea - it's almost certainly better than the
overflow builtins - but might also be disgusting. Hard to tell.

              Linus
