Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687671F8901
	for <linux-doc@vger.kernel.org>; Sat, 15 Mar 2025 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742063963; cv=none; b=hm5c/t9J1RqcAh/y4VHTXZ03m9gFd9cUqCXIFzo2T915ZGI2YGqyrMczHdcDpA+JxLXuCsfO2Ky//HA+7mgcM3y3B3ZwCoEomEr9d0fojaDJB6Xwezr9LxePCs9nrVg4ufVzRPpdsJ26mAafHKcPSQb0yKBbu5sQVm7ZvkiGT2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742063963; c=relaxed/simple;
	bh=XV+UOWy1S9PWbjopZNL+DwSwF3sDIJJk6cvH5cVz+Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nImQpftUV+BPp6wttcO3BnRku/IXSBntde/FvL0YxeebzNZ3eqt4f75BG+67nyget/7WCLQROss5zt5VWOwk+ETrah6i1Xfpy/Eg86kNFX9uAnlxPrrape/DO/yqW6TKj135ZD1S5tzkwmDvM0uDgX951X0fcQI/45k8bGu5m0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=R0OyDTWg; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="R0OyDTWg"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so582833566b.3
        for <linux-doc@vger.kernel.org>; Sat, 15 Mar 2025 11:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742063959; x=1742668759; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fUg4fCMuPkYhbF/nCEDejVAU0bc8GhrExOsFutZjexE=;
        b=R0OyDTWggNP6bXFQo0cVcAO16OHRGxWU1XfwE8wjXcJpA7PVMoT0NW64DI4mAmyA42
         S7WHHDI96B8C2a56gD44l35UYHl19qdJMW7+RQTV18iP6vRBuLP1mZvZpAV8YoO+cI7e
         mscWyKAkZzl8IV0TmCNi7IWFHOzr3tXM7Cj9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742063959; x=1742668759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUg4fCMuPkYhbF/nCEDejVAU0bc8GhrExOsFutZjexE=;
        b=OF74tZ8Nn9mAdG+Ja1vF+BWb7FV7OcE4bUd0x5DK01CY72KraDAn4FGzudlxgJww1X
         nmjNZoqGNIVv2Jdj0Ssz7vfKAN8j53oQU8O3C+Bo4s8luBt9PGd3yhlPfZNjPtubnQXo
         fprMp5Lp7op43CuX97UP5MfyfPHQeByPeWIz5EjaJEg452b3hLkkp0nTS7qg97HSzm6p
         fwndUQ0IZKI+h2JD3YUynGkW7IvqgxMMhZCev8SUaVO5A8nzg2xmGbO1lewA0ay0phoD
         n2HWlDa9cjwT96w7EgawsWW1GAnZ9o3cav99MMsdm7PVVZ1ex47KbA3es8mUM9KvuYAG
         A+2g==
X-Forwarded-Encrypted: i=1; AJvYcCVn/wBMU3RhYDVeo+Mlu0sX4bbRcfxQb5Wa+pTwxZ3XW/p/0Ry/3PMMjXbBSQUSISjSGZmwMo1uxbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnG5lu0CK+jfZgDFBODmkZgDm/Stfrqb6ATRiMkjn9WmjpHjou
	AlghDBlbHTPRJ1YDe1rD8ap/WkVASx99mo0otR88Sr4w1dBvpQxhyE6M16/nOaHvy+G22D/bzLC
	cVz0=
X-Gm-Gg: ASbGnctDuEbTqPDkklWjG2XoluK6UrGvqci/7jzMj14hrER7sNZSEl+1ygy3+2gPJTA
	BPkJM7be7fxrdmCPZNwxdfpClKMhhBJNV2yE37XdH4WsXKaFjkfXioOiIXvXpO6tRMWGBzQ+mLh
	ggDQGC++ZVTFWyi1ACLJdx6bjtAbM7BjXANOwdaewVNkYBF6UKuqxJOAxFQY/hHlbUGnuRPz7np
	GI5mW1sVVwVThjWDwHJ4YMLkcnygZAgvHervKmy8RCFZbUk3ueY5IlOdmcxCSh8ygtshHjLHiZK
	4DnlcvFtdhZNVHJDRpmkr4W0HwmqexFoMVI8MH5jG3bc+nq1zUS5fozkXH/YRUiAWWMVri8CmuH
	IynFlqq5wqEqes+cjJ1Q=
X-Google-Smtp-Source: AGHT+IH3h/l+5P3dNgsRD+5Ls/ChGc3FqIDqi0e5fPhik7uE36SJarl5hyQUj1NoI+hPw/Pi2gJnyg==
X-Received: by 2002:a17:907:9445:b0:ac1:dfab:d38e with SMTP id a640c23a62f3a-ac33017fafdmr773949166b.15.1742063959452;
        Sat, 15 Mar 2025 11:39:19 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aea76sm403663466b.32.2025.03.15.11.39.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 11:39:19 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac289147833so557059866b.2
        for <linux-doc@vger.kernel.org>; Sat, 15 Mar 2025 11:39:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWglViKOb7p2Q33qOd4xugZaETDPxesCXypTf4tqBbWvHB7jWN3CympmQYi+8bHOXMzkdoPiB+tXjY=@vger.kernel.org
X-Received: by 2002:a17:907:6e8d:b0:ac3:47ad:41e8 with SMTP id
 a640c23a62f3a-ac347ad42e1mr292577866b.1.1742063497897; Sat, 15 Mar 2025
 11:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315025852.it.568-kees@kernel.org> <20250315031550.473587-2-kees@kernel.org>
In-Reply-To: <20250315031550.473587-2-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 15 Mar 2025 08:31:21 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiFjwOk9knz8i-zAqE=Kc73+3TgkMuj-C_mNB1U=k2W7A@mail.gmail.com>
X-Gm-Features: AQ5f1JqnUqw5FSbsGnxD4hWFlYlctW64jtsJobEgwKJ2Lw8II8J0HunpM362-9I
Message-ID: <CAHk-=wiFjwOk9knz8i-zAqE=Kc73+3TgkMuj-C_mNB1U=k2W7A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] slab: Introduce kmalloc_obj() and family
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marco Elver <elver@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Mar 2025 at 17:15, Kees Cook <kees@kernel.org> wrote:
>
> Introduce type-aware kmalloc-family helpers to replace the common
> idioms for single, array, and flexible object allocations:
>
>         kmalloc_obj(ptr, gfp);
> [ ... ]

Honestly, I absolutely hate this.

Don't do this. It's a huge mistake.

Yes, it's a really easy and convenient interface to use.

And it's a ABSOLUTELY HORRENDOUSLY BAD interface to actually then *maintain*.

Why? Because it's simply visually and syntactically entirely wrong.
It's much much too easy to miss that there's an assignment there,
because the assignment is hidden inside that macro that visually looks
like a function call.

So when you scan the code, the data flow becomes very hard to see.

So no. A hard NAK on this. It's wrong, it's bad, and it's crap.

Maintaining code is AT LEAST as important as writing it, and arguably
much more so. And making code and data flow visually clear is
important, and this is actively detrimental to that.

So I understand why you want to do this, but no, this is absolutely
not the way to do it.

It needs at a minimum some way to make it very very visually clear
that this is an assignment to 'ptr', and honestly, I do not see how to
do that cleanly.

Alternatively, this might be acceptable if the syntax makes mistakes
much harder to do. So for example, if it wasn't just an assignment,
but also declared the 'ptr' variable, maybe it would become much safer
simply because it would make the compiler warn about mis-uses.

Using visual cues (something that makes it look like it's not a
regular function call) might also help. The traditional C way is
obviously to use ALL_CAPS() names, which is how we visually show "this
is a macro that doesn't necessarily work like the normal stuff". Some
variation of that might help the fundamental issue with your
horrendous thing.

But something very serious needs to be done before this is acceptable.
Because no, the advantage of writing

        kmalloc_obj(ptr, gfp);

instead of

        ptr = kmalloc(sizeof(*ptr), gfp);

is absolutely NOT worth the horrendous disadvantages of that
disgusting and wrong syntax. You saved a handful of characters, and
made the code faster to write, at the cost of making the result be
much worse.

My suggestion would be to look at some bigger pattern, maybe including
that declaration. To take a real example matching that kind of
pattern, we have

        struct mod_unload_taint *mod_taint;
        ...
        mod_taint = kmalloc(sizeof(*mod_taint), GFP_KERNEL);

and maybe those *two* lines could be combined into something saner like

        ALLOC(mod_taint, struct mod_unload_taint, GFP_KERNEL);

which would stand out visually (which is admittedly very different
from being "pretty" ;), and would also save you some typing because it
also gets rid of the declaration.

We allow declarations in the middle of code these days because we
needed it for the guarding macros, so this would be a new kind of
interface that dos that.

And no, I'm not married to that disgusting "ALLOC()" thing. I'm
throwing it out not as TheSOlution(tm), but as a "this interface
absolutely needs clarity and must stand out syntactically both to
humans and the compiler".

          Linus
