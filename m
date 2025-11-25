Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B53770B
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 01:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764033948; cv=none; b=ETufznAX3aaw/CjR2EwFCQex9ghYd4HuIiQivU2qGKSTaLzTfsgAxJIo5fVNKXY5aaV/RlNufkNrUlWJMGDadmx50Qzz5Gb/hGbqpHOL+yjjo9ruafma/dB2195uG4yLwuuNFQajgZ2Rb/XnsUET5/skH9qExhqu5yKE8THrt8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764033948; c=relaxed/simple;
	bh=YqWh9GzlQ+M85xmWJJAhz65Uv8DVVpNHfkEVeveBRMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGeUvZ5tXJrruGtgYgEbmTqc8hvcwrrESPEnxR6NUeHmvD7en0rw5b8PPN3tmE1FUlwt4JcqABlEqdUpGHmg0/DxWJzBYm3kdwWg+uxhcCmCWtyr24pbwv72qcfpJRIRRRSjJf/N72K8ZXB30K9qHgMWHaq4DJpwOd/VYcz7eAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bj0H7jPO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bj0H7jPO"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73a9592fb8so489588366b.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 17:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764033944; x=1764638744; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tqKMRjrSvi+tqRWkNIWke9++rsIS8F7SgGKQGWYYtJA=;
        b=bj0H7jPOQsL/GYNicDu/1n+qn8irexlyC2uViEdPgj547MZ5KyyXdIZpUQMnILnrPO
         vrwYGBmlASbV5UcQyrbmNxys//dWiCbNFAG3dbY+Br5TtyLpOFAppp1XvxzvzyNDPl8b
         TKQS46dEg11Q8xn8cAuhKesZdCNfP2dfq5F7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764033944; x=1764638744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqKMRjrSvi+tqRWkNIWke9++rsIS8F7SgGKQGWYYtJA=;
        b=UD8v70ACjm3h5uBMUJjG7azmn9DJDY68ax01oz7ksY86mQMW3wUoYw6Ow/jtqjSUT+
         HcxADxt86Lnckjsy2qXc4uKJsfTSyjAwsufssXtiii/nQ/ttjUrOZFnb9exIqZl2n8+1
         OhT17KFpE00W4blxIqRimIzzL1HRFFLnCvlOMVCX0WhFQqG97zeX8SnZr+zu4VVWX0Aq
         uApC5FuNWxE3wqRObgBlKiZzeC412TX8Ulj9Rk7N/dGQHQaHXWsKXAZbsMX4bWWe7cSK
         Z2vqH38MN+uXXoKg2aL5u5SKhVC+Z7fcDMKBdTEJz7Y8BhEau9gXbbEY74Qgjf5FaKwb
         WUaA==
X-Forwarded-Encrypted: i=1; AJvYcCXZx9NutUkeNNvNVssrg2DzskjKZh9igxTSBDpEwjxAobQ2YWLti+9wi3ERjpsyQNDYo+I34gLS7WM=@vger.kernel.org
X-Gm-Message-State: AOJu0YykagDaTZ7yha6Ijr9iKO696ET/+uvqPXYT+59yKjSWCkNixUjp
	+cLhUJw25vWInmNrKHaVLYlzMVtrvIudOTd3KIqs0XkX7Y4+d08ehQFc3x3iZY4I033NkRfwaIi
	q9zHlmNY=
X-Gm-Gg: ASbGncust97r6mW5Iu++Nj5rwBz9VU8uklUJ+J6meoPjtQ48ru+MtrAbiSk3KWGzBij
	pVXyejLYavmP7EyJchLej05Z5fbPwT2nEwmMf5bh7LcOvk5QwIlogJLAgvXpb4SeRrHRAPYZx9v
	kLlmgn+fDHP0TQpw5nzf+O7jPYLxPxG80kj0sXUY+bJbTM5sRuGUnN8IH/DJElKlAxkl6j+FAvg
	+ChzSnVxKPpFkFtU6Z+3i5eBORwI/0L9sPjG4D41qMz99dO3+jF+n00sHG70ftWz68c40+W9Uxt
	t0i6gfKWPtUfa3EE1tDI1RBJSZPoLpVL1wAkW/sBqPRzpRMgz9trktMneRMVPBk5WCwBVzv4e5I
	evv0/0pL8A/XkF5b5wkhNl+ElHDol8D+GfRLzF+ExrkT3Zw24U9gAC79cr2EZkocwGRZNbkOjDt
	fGxFIagnst8x7gzVNSIqblnKjDU21QdC73ewGLn4r76+4ipF/dtmegrX1SmiaB
X-Google-Smtp-Source: AGHT+IFnqNtZothtLBdHQylQL3GPIa1cCMG1F4UPCT+Q3a5dXvjxPeaJiRTaXhq4CC3h9tGDKtGUdw==
X-Received: by 2002:a17:907:3ea1:b0:b6d:f416:2f3 with SMTP id a640c23a62f3a-b7657285452mr1964653966b.19.1764033943772;
        Mon, 24 Nov 2025 17:25:43 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cefe53sm1436503466b.13.2025.11.24.17.25.42
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 17:25:42 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b727f452fffso979613266b.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 17:25:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7o7cggk/hrfrEmdC1eOGVn/KNQ+P2k17k8HnOmQIdd/YX8+07XTvqGR3HttM0OxHNaCpXIwI9ZeI=@vger.kernel.org
X-Received: by 2002:a17:906:f20b:b0:b76:b791:b58f with SMTP id
 a640c23a62f3a-b76b791b623mr277396466b.0.1764033941841; Mon, 24 Nov 2025
 17:25:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
 <202511241119.C547DEF80@keescook> <CAHk-=wikqnc16e7yUTJuqnc5f4rL+y_-JpRzCLRu9WPnt3nmiQ@mail.gmail.com>
 <202511241612.6CF90E9@keescook>
In-Reply-To: <202511241612.6CF90E9@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Nov 2025 17:25:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh7jG7vUqY2JjkJmjxOYzXR+iUARN6W908pCVfmyprSvg@mail.gmail.com>
X-Gm-Features: AWmQ_bmW9etMzrFCL9DwpEr0x6CUkdioyCuxtdBlodJu1UMrkK3czrKtVUGlZJ8
Message-ID: <CAHk-=wh7jG7vUqY2JjkJmjxOYzXR+iUARN6W908pCVfmyprSvg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] slab: Introduce kmalloc_obj() and family
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marco Elver <elver@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Randy Dunlap <rdunlap@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Nov 2025 at 16:29, Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Nov 24, 2025 at 01:35:12PM -0800, Linus Torvalds wrote:
> > Those macros are illegible. And 99% of all users DO NOT WANT ANY OF
> > THAT COMPLEXITY.
>
> Okay, I think you're saying "I don't want the common helpers to include
> the infrastructure for supporting the ..._sz() variants"?

I don't want the macros to expand the code more than necessary,
because that just makes everything worse (including very much my build
times - which have gotten worse over the years, but historically my
build environment got faster at an even higher rate - that is no
longer true).

I also want the macros to be somewhat understandable.

Yes, we have some macros that are works of art because they are *so*
obscure and are fundamentally hard to understand because they play
games with really really subtle language semantics.

And then I enjoy them and appreciate the insanity of them. I still
think our __is_constexpr() macro is truly a wonder, but we do have 40
lines of comment (!) for that one strange macro.

But this was not *that* kind of hard-to-understand macro. This was
just overly complicated.

> Fair enough. Looking at the treewide change I prepared[1], it's less
> than 1% of those mechanical replacements:

Yeah, I did some numbers on my simple version, and just the three
simple ones were the majority of cases by far.

I also believe that when we're doing more complicated size
calculations (ie the whole "struct_size()" patterns), then the
advantage of merging them with the allocation itself is questionable,
simply because it takes two different pieces and makes them one
*compilcated* piece.

Doing

        size = struct_size(ptr, flex_member, count);
        ptr = kmalloc(size, gfp);

is basically two fairly straightforward things and easy to understand.
You can *scan* that code, and each piece is simple enough that it
makes intuitive sense.

No, 'struct_size()' isn't exactly a very intuitive thing, but written
that way it's also not very surprising or complicated to parse at a
glance.

In contrast,

        ptr = kmalloc_flex_sz(*ptr, flex_member, count, gfp, &size);

does *not* make intuitive sense, I believe. Now you have five
different arguments, and it's actually somewhat hard to parse, and
there are odd semantics.

In contrast, the simple versions that take

        ptr = kmalloc(sizeof(*ptr), gfp);

and turn it into

        ptr = kmalloc_obj(*ptr, gfp);

actually become *simpler* to read and understand.

Yes, there are some other advantages to the combined version (ie that
whole thing where 'kmalloc_obj()' now returns a proper _type_ - type
safety is always good, and avoiding void pointers is a real thing),
but I do think that the major advantage is "simpler to read".

Because in the end, simple code that does what you intuitively expect
it to do, is good code, and hopefully less buggy.

             Linus
