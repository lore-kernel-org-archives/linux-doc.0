Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E80271A7B
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 19:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763841238; cv=none; b=F9yXxJOmPd3ta9TSyw8NKlyVPncZ1rs7YLsjuV+ueeq4j2Sra5K1Rea+MeEeeaohZVC1hlQl85dpy1kP4v9i8BNR0aEX5gXK0MjtpyxIs64VaeoNDzzNrBTtf0iqB5hB8tCsUD7/eZXn7aQ1E+KNSJLbSAH5VYRuBoL7YSRDQAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763841238; c=relaxed/simple;
	bh=Kj+BG0xdKGqNhRUvh68tbMkfYejpZnIN0MW2Q/oBVMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMfTiF4vmrfwgudvtHRt4ZBqH6EPWTqQUqm8pj25lvvdXR/l/JyNW5RNzvE8GJIrEIUdebOpIak0DPG8vb6gP2s8tLcOvOMKrJZ2d1WjMnhR9/isAcQYbKk9a85eKxWYtXbzkaYv5Tp8L/quLFpQ+bwheKZWGG0cLE4ng0Jw6hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OJW5BCeU; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OJW5BCeU"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b73875aa527so486620366b.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 11:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763841234; x=1764446034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V8N0HudTgWpU/ayUVIeNFnWWwreLw332W8BlQTA6nQs=;
        b=OJW5BCeUDKm30FYaUqkAIb3pAomdEtbSufjxmsynah8gUlp9zsd7xaKLo0gItLqNkr
         Lp9RI+FmZ/+KJ6os6rPM5auHQJmkP2/xIJ0wYHit+yBrVH4MkJYbf3PFTKJEDWgcHjby
         V3r80V3S3aP/l1ojws/TK1DvEyWf+4sIosT1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763841234; x=1764446034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8N0HudTgWpU/ayUVIeNFnWWwreLw332W8BlQTA6nQs=;
        b=Queq/WKUeBcmuar+N9bff/5HjeOGtsIlK9FFC/v+B4h089VO+3B/tNbRmYtpasHRs4
         ub4GCtdNN3cAWx48iHq/PaPaCZDtYWv8VBkCrC0W7aBW1VGS+w1SXfKd/onKwdgKm1Xc
         REVW0wteRwEUKGJsl4Xb9sUDWFvbX6AILBJV+desc9v7JBrKzhdtF1n6hsR2V7SSwTLG
         L0Ek6hza+4KOnRpc1jt/oYf7ElWYQBSFHrWQJHEwWvbq1qNCBIkAvsf0V/C1AtUXf1Bq
         mWjaTIZE+d/JgQvKYOJaHKm6w8wXer7KfmSGgvGG7UZQ+U2Qr09bjUF/vjxeIhA0Easa
         R8hw==
X-Forwarded-Encrypted: i=1; AJvYcCWC/d4t5A5Oov2a2oKmAz9kH561Q4lT3L1BU2ykHCu3YwGuOijrHXy+nWifwFn2NVRP3D1VEERtSaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPLTaBKjvtQLqKRKgef/IHMyv0YEJ2nC0acUSyd0fXfkKx6rF4
	Q648GZOC/WBvuOcHd4sb4c7ZjTbW1MyoQkMz2OJGOQ0yXr2a1daOu1PGJDbiWNUrx7ZW20KrBhJ
	HlNk5OlQ=
X-Gm-Gg: ASbGncuJ5kQy+iPjGi/wx0K/n6A+Rmvsp++ZOuObi8e5Rw48Vm1cBIEQ7QAg7a38rUw
	5jLCFSUV/WB8/lo4zsTFWscVzDrkU8o3IPnSTe4IuI8FFUlcN+cOl3auE1u8ZQYKmZbheC1e5cz
	PvbWPZMPeVn0AV+7XpweCtRdIVvMe/feRmGipd69ujigGsL2l2zKWqk5ArL/qwD3FeszZ5Hmru/
	tO/ByYQJPfKwWSzRKu8xzk0YVAaN7VAbJUKAffP8A7rrtebcLZlzHS0821B54MVV9mtQkSMsj9I
	vGTMjn5bP64PZykQGCpLuFF44I44Bbc8c4mb9tR0oJI+q8I2H6n3f0DKhL2oEDWlj+voeGAeqeP
	8fRpnpolY5WJlMd3FpByiA1EhaYxB2UoidB83qvklPq9qONypruy/t0PtncyhI5RCBfv2G7rAN/
	w8/tQrx9iH71V6oK+dA6+BPylyfayr/nN3DDVSS1Iall20FTy/eOlnCbgYJR+2jF7lDTz0HYY=
X-Google-Smtp-Source: AGHT+IE9x2JYUnKS3kU/bm4pLwmpR/bKtCskLl/EhnDupZFHwijWOiUzm/JmZ9dEmtzZU+QWUYhGKw==
X-Received: by 2002:a17:907:9722:b0:b73:6cc5:bb1a with SMTP id a640c23a62f3a-b767159f4e5mr630434266b.16.1763841234276;
        Sat, 22 Nov 2025 11:53:54 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d73430sm810957066b.24.2025.11.22.11.53.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 11:53:52 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73875aa527so486615766b.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 11:53:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0YhzLiZtR6OijoLG0q4qFTolu+0ToRLzRlcmqEIiTx4W6rOBPd2Nhf+JQUsEoOk41JcJDeLRvG/w=@vger.kernel.org
X-Received: by 2002:a17:906:dc89:b0:b72:a899:168d with SMTP id
 a640c23a62f3a-b767159ef70mr722565666b.13.1763841229122; Sat, 22 Nov 2025
 11:53:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
In-Reply-To: <20251122014304.3417954-2-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Nov 2025 11:53:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
X-Gm-Features: AWmQ_bmh5uuI5AnMmiOZjFdonQtxoafj9Bhk7ARyKlTTPm6tMsrXbFYBvPbdku8
Message-ID: <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
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

Honestly, I hate this.

In particular, I intensely dislike that horrendous 'SIZE' parameter to
those helper macros, and this just needs to die.

The argument for that horror is also just silly:

On Fri, 21 Nov 2025 at 17:43, Kees Cook <kees@kernel.org> wrote:
>
> These each return the newly allocated pointer to the type (which may be
> NULL on failure). For cases where the total size of the allocation is
> needed, the kmalloc_obj_sz(), kmalloc_objs_sz(), and kmalloc_flex_sz()
> family of macros can be used. For example:
>
>         size = struct_size(ptr, flex_member, count);
>         ptr = kmalloc(size, gfp);
>
> becomes:
>
>         ptr = kmalloc_flex_sz(*ptr, flex_member, count, gfp, &size);

That thing is ACTIVELY WORSE than the code it replaces.

One of them makes sense and is legible toi a normal human.

The other does not.

The alleged advantage is apparently that you can do it on one line,
but when that one line is just horrible garbage, that is not an
advantyage at all.

And the impact of that crazy SIZE on the macro expansions makes the
whole thing entirely illegible.

I will not merge anything this broken.

The whole "limit to pre-defined size" argument is also just crazy,
because now the SIZE parameter suddenly gets a second meaning. EVEN
WORSE.

Finally, I think the parts of this that aren't wrong are too limited,
and do not go far enough.

Because once you give that "alloc_obj()" an actual type, it should
take the alignment of the type into account too.

I also think this part:

+       typeof(VAR) *__obj_ptr = NULL;                                  \
+       if (!WARN_ON_ONCE(!__can_set_flex_counter(__obj_ptr->FAM, __count)) && \

absolutely needs to die.  You just set __obj_ptr to NULL, and then you
use __obj_ptr->FAM. Now, it so happens that __can_set_flex_counter()
only cares about the *type*, but dammit, this kind of code sequence is
simply not acceptable, and it needs to make that *explicit* by using
sane syntax like perhaps just spelling that out, using VAR, not that
NULL value.

IOW. making it use something like "typeof(VAR.FAM)" might work. Not
that crazy garbage.

I never want to see this kind of horrendous patch again. Everything
about it just screamed "disgusting".

                        Linus
