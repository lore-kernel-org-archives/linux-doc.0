Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1324E288C39
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 20:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763844903; cv=none; b=Dbf7B0Td8Vy8T9rWk1/PSJaTXNsiuPZHxP2woKOlqTIJuVaULVV3ZKU/o3GGamrDitrQwZFF8+NRboBgDREuo8r8yVx2OameUkA835FblnihzZiM5M6xNE2L0k91ouzNalTd4ZNxZjdiaR7Q/4IHE3YboPnsCCChSe96m1bVrfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763844903; c=relaxed/simple;
	bh=ib193E5ulCM5VsBOwNwbaiGEUjWWX9ZaUyLWHVcJxYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mz3OA6/GLJHm3Z1BSLnVjK6yyePYcMJdvXO8v0auhahJVgde1IMeFxC1oiPHliIWFs5MAnbACJQJpsQN/ECpQ14AnfyqNDWLfQ+h2hKI3NFnGMhnQhFqg6ei3coLcLaaULcM170IrK7yQ/W6YahQI3LX4mwrqHTwJ2tx32Smgps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bxxtQPXg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bxxtQPXg"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b72b495aa81so375345466b.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 12:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763844899; x=1764449699; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jQGcvOhJEN1J1/uUViuAgWsDBHc/YH/i6gYOyi8rm/I=;
        b=bxxtQPXgF82MkLRKYc54P9Eug1eH47ZY0yOw69hxW8OJOXMwAbZ6siNv2MHhxa+uyb
         i25wb7eOSQyajSALv8RJabwBDGzcS0P5v7fp6PXdwpaeTttr24SdQ3JrOiCty24ueO8u
         lQElm+/bXHXZis+QzFWPRw9LQhJltWDKZziDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763844899; x=1764449699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQGcvOhJEN1J1/uUViuAgWsDBHc/YH/i6gYOyi8rm/I=;
        b=LQlY8VpvWbVzYbbvpHV72Cit1w6vRV4AmposVMrZqI8pt1DYHM2WjYOOGs1XGvP73q
         kbd/nbH0NbfbJnVTFJmDn6DE/LG0Qao8c2qsy4bvDKOzXOcgVUMtPDangD8C5KlUWcSB
         M9b9l4DnxYHAllLqIH5GBxUm4pciC506RHm1kD66INpIWD4TnEc2KDJdFWxMDS7Iqvy4
         O0xYAGgX5zYWItcq7amj/7ag/O5YC0CPpFuTgoq2lQfATZCGxcLwgPhbS/WkArZKdCaV
         bVLDy3u2ZT+fva7IyKlrsSXCTCMLMWqi9zoNhNiZyL6Cpn7InA/eE/PY1vdYhSd9lzNP
         j6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUujOHpQH1Tg/gVY/m5HewdDXOEoUZi3Z8UTTqTMTBn8d9cmBfov74cs6XtgYdL9a1K001idt12js=@vger.kernel.org
X-Gm-Message-State: AOJu0YzajU0zMlKkWWB3XHRPjeFCnGFNM8rmfUjsN0WdgyCVh7YkHDj9
	iDws4xuknFWH4/k1eFFVeB88ODFKVGo75BIl/eZZjjzscDR+EEWDPrQBbTH/077Xjb3nNhgAUUP
	+qFixaNstwQ==
X-Gm-Gg: ASbGnctcGJH411SDBYYo46rLYKuk/jH3K1AGNPaHWvpuRX1IrlTTCcYfL4y/nCEThpD
	o2IkQAnqdYYdWjYkdV4fEpuzijmDIM0kJJo2Q6AMrsYlvlXhG7kcvJseDkeyIM6u/g+NLRLk6pN
	sfPnOi5F23Cv6ii+ESRPwp8lAwmj9QfILdfNwppph9DzpxXCjNsfBM2BwuxkoI9Upui+dQ+KjrO
	etH/BPg76IzsDa985Rc+tlu34EtwotqewLV21fcM0jZXI4V44Q/wzqSQomFU5GKDD0Vje0jf5TQ
	H88alFidPkUF/ChdpsWUewSRNIBnrf1AILXkBA4U7v0B/ck9xo/nKERoqspbUxHsFAcxlu/gTfq
	zA7nzEGdbycuAHSprJqFYBW3migikQmdBFMcrng7KGiZ7EWQCwKaFaVEUpT8DwRK0w7qhnIPekc
	L4j5hab2tLWipVz+tnXaqpn+LKU/6Ar5mwUxXdSKcSuoCt4M2LwaypliM+YL9G
X-Google-Smtp-Source: AGHT+IFnFPv7i4BwIVgzktSGEmdnuEgCk/k8vopYwg4mkprQmWaBcygrBOlUaWbzVijxoEDTRdYMCw==
X-Received: by 2002:a17:906:f0d2:b0:b76:74b6:dbf6 with SMTP id a640c23a62f3a-b7674b6dd6fmr492158766b.38.1763844899177;
        Sat, 22 Nov 2025 12:54:59 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fcfd9fsm831217166b.40.2025.11.22.12.54.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 12:54:56 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7277324204so532552366b.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 12:54:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCWqfFXSTKmcg5dbUsiVW0/R3ENiMmFa6BX9DkZuKCoBVAGxxfvtaGDxs2dLacGGoW4Vr9sD60daw=@vger.kernel.org
X-Received: by 2002:a17:907:6e8d:b0:b70:7cd8:9098 with SMTP id
 a640c23a62f3a-b76719d4d02mr618930666b.61.1763844895821; Sat, 22 Nov 2025
 12:54:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
In-Reply-To: <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Nov 2025 12:54:39 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjxj---dy5haOvNXjg_Xz-mDQciGL7OnJnpJpjYD9Moog@mail.gmail.com>
X-Gm-Features: AWmQ_bnv84PkVSmG-NV-hwB1C2eg-gsEJfo3JVaH66sxShWKO-Vcyq708ZlrB18
Message-ID: <CAHk-=wjxj---dy5haOvNXjg_Xz-mDQciGL7OnJnpJpjYD9Moog@mail.gmail.com>
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

Btw, I realize that we don't have a good way to do the alignment with
the current kmalloc() interface (we do for some of the vmalloc
interfaces).

So for now, it should just have some static build-time warning if the
type of the object we allocate has a bigger alignment than the
guaranteed slab allocation alignment (ARCH_KMALLOC_MINALIGN or
whatever).

And I really think the first version should do the minimal thing that
actually matters, and strive to deal with the simple cases. The main
things that matter are

 - the return type should be a proper pointer type (so that you get
warnings for mis-uses, but also so that you can use automatic typing)

 - making the 'sizeof()' match the type

so honestly, I think 99% of the gain would come from something fairly
simple like

    #define kmalloc_verify(type) \
        BUILD_BUG_ON_ZERO(__alignof__(type) > ARCH_KMALLOC_MINALIGN)

    #define kmalloc_size(type) \
        (sizeof(type) + kmalloc_verify(type))

    #define allocator(name, type, size, ...) \
        (typeof(type) *)name(size, __VA_ARGS__)

    #define kmalloc_obj(type, gfp) \
        allocator(kmalloc, type, kmalloc_size(type), gfp)
    #define kzalloc_obj(type, gfp) \
        allocator(kzalloc, type, kmalloc_size(type), gfp)
    #define kzalloc_struct(type, member, count, gfp) \
        allocator(kzalloc, type, struct_size_t(typeof(type), member,
count), gfp)

The above macros are entirely untested. But they are simple enough
that even if they are buggy and I miscounted the parentheses or used
the wrong name somewhere, I think the idea is clear. No?

(And I made that "allocator()" macro use __VA_ARGS__ because
kzalloc_node() and friends would want that, but I think it's starting
to hit diminishing returns at that point)

Hmm?

               Linus
