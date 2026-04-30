Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C5429826
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557634; cv=pass; b=IUuKf3O5thgkzkunnOfgeg5Vij4/jeSVqyZncRiGkfkDy/eRo9iesdsS6dFKnKjNQPwzN/K7Q0BcqcxAvEBMz115PBs9WvyWaatNSzHXhuUBK+E0BwZpCzpF+P6gzKm+TsWGqa6IMt6SGaZX8zTQDL2D8fEpTbbvCh0aqDt3bdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557634; c=relaxed/simple;
	bh=q11TjLbVvV8woWQJHWB4Pgl2P7O1TL92s7zig4m0+0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnsFWsf7zuFDuuVGU+/0bb9runm/VNOUzK8yhK6LiAN2K6DaPZjtHMoUSbQyL00Vlyzhd0DMcBqdpg6qfYVoetGVlMtd7j9Gx9Szm4KyN8GJnqOjrr1W9vaPXW3BsYqEEIyNJJ9mLkRqyGM/Oe7i8WqOnd/mc5W1nU/7Rv3gRJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VolEubN3; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VolEubN3"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c8cc7a77eso1506258c88.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 07:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777557632; cv=none;
        d=google.com; s=arc-20240605;
        b=gvnU7/5KeRR208rnNQSLNQBYLrFtvHltAg9AHKyl/O+JfiobWsWJvarvBcSbjj9iEa
         9g9FgraR7Iq0m2SSlQLwyAWXUrBEMvzXWcC2A+IGbvaFhJRaL1f+xteYU2nFBt9kSGtd
         pEjYU++gn3lbFZbUMpE7DTOTmvcMbjBbWthkx4CiTFEZbOnmg2TU1hqcCIXp6RvwuJAV
         RN8bcV5P517vAUhd3wokZY624B5N+LZErg3agCPb57KM97dXJIpsYcT8GDYpZJTX5uc8
         6UoOZKVEW7NOyPZZdtaPEIE1ikSXljTldKINVU4MFWvdqWwYAc26XXHJyrfuz4H7U5dl
         CK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        fh=PkLFZB+WZVTRBKuDZjo5D8Gkqrb4tIq/41WpU5thicQ=;
        b=K5TLg/ivCjrdntKYSkdTkvQEfQQDha9r8ccm3fEtKryi09FknaE/KhrsGvBmSP6Hte
         +tZCEZzjaUJlolpD7xlj4A+p1qtECveNqzT+VGY6kU10pNw034mX4hZpbKJpUfGfAFbe
         ODXihIStXsadou1pGhUFA2kOhq9Uy5GAm3JWv8rBc4h8ERwpRMiVQq6Appg7ZIt1Ykqy
         jGJmlDxcfk5N9GkZa9WS6HPZnmm7LOF1e6zC9Gne6P4l471OKpmu4PCbMxUPGc5/qe4K
         fe+gZWFQ6Dv79IPN/q4cdcfA2344gFMnCCKiTAHRLjQJ+xlWMYcK71O6Sppe0t7AYgkt
         JqjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777557632; x=1778162432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        b=VolEubN3S0MJlDzpzE7njYA3y/QBNaIGOok6O/1OUtn/YSTyBlSaEWaiUUWSbsUZ6A
         lO8D5VLTcXWq+FZ19tp8pW555yvlEy3P10HzNBezwFKAL1m1tpqajnEj69leQIcvZhZI
         2mixAIsixojM2AYfx4sZBMaPi63me9KggRfzI3adnQ4mc2L2w/xmf4xTm0jX81GZMonc
         T/7ROeIlbBxQQAMiZP4Yyf3AUFsnSRBkjqfLQg6m//jC6LiAHVbTrQk9PQww/TPaf/Ls
         V9HddpdnGU3B87aaIeSFOVvnHPWveT+MygJ4541Qg+HHf7fCGkghywXlRTM/7BKkmBjD
         7Vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557632; x=1778162432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        b=izp0x107GGsYD80dYh3dcpoWdyNqTsvM7CkGOe/hu1IaWIKduuMxrernnJl1FhyYJc
         jCa8wCkcXjCsePW+z85j3oQd1Qzyw05t5Rx3+cGUxNdGDmRt5aWagOWoSH3ioRcumiPO
         FfD03G6hrixGfaKU5tvqt/YuYJXjELwPziqJhPIMiOJXxuy5sc9MSxbBPjKsJ8S14L9o
         04kONTpI5u1pPWEV8E+MfPaXP3AIgrUCkmMSz4RAbAiMtOHRnsP0inLo/B9ktvgK0lxI
         qORLcqndzJPgQZsKZq2amZKGkpdSrh88QkKDIXwtf2NCdqR21bpHI43DvTf+yF1GIbYb
         P2jg==
X-Forwarded-Encrypted: i=1; AFNElJ+EE10TqhEvoPj5MHAcjTwVDki+fSXh/83PFI1wMqTqKGESO0HwvX//LenPHgXjal8pnfRFQnfKYMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUVdlwH7rZHLSWM/AT389LcLAw2uoGmyNCy4lDNojuQqG20gUC
	0CQhdj15rnaQdC4BjwBpdVEJ8viCOZct4IMnDD4Ph0CDhAb59zidhOF8nqc3FoXoH8OY0iY0E7O
	P3xKZGpmNLJeZvkF04R/K1Z5tZY+n94gKnd92qVaT
X-Gm-Gg: AeBDies9Qo49i7EjswFw/8mPjMOCg5IAYaTYf7owGwvzYxcvBeVbVHWlzqw7RCCJyAq
	krFI+gelmdX3NmUWclfRi+tvpkZTF7vh6lm4MCCMZIwjFiKF2ufaZ8ro26P9o3R4rFm05HuJkzV
	7v2nvGKQR5nwMEOmMogNDiYb0MlOaCZV9pzPCR3MCetcW7xEAWuccMBJ6NR9s37FigQDFfYz5na
	qAjCxxfvlfqT0ZlVGxCBb/EwNEixhiIR1yUhkLzC41tIwjXkDPL5g0/EbD2dYyhPVuoIJUkW8Lv
	nWrem/+dKqkaZF/EV2t1U23nMwUwn4TkuI8lcE6h41YEDANff+g7BOI88qg=
X-Received: by 2002:a05:7022:92c:b0:129:1d25:f1da with SMTP id
 a92af1059eb24-12dec602250mr1294888c88.3.1777557630763; Thu, 30 Apr 2026
 07:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
In-Reply-To: <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 30 Apr 2026 15:59:52 +0200
X-Gm-Features: AVHnY4L3BCY_keL_qhcVurJjgr2ukKogo3SaEXX5idcPkTjREyzfeKAeC-ucDp0
Message-ID: <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 15:40, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
>
> On 4/24/26 15:24, Marco Elver wrote:
> > The mm-api kernel-doc comments have been broken for a while, as many
> > documented symbols shifted from being direct function definitions to
> > macros wrapping _noprof implementations during the introduction of
> > allocation tagging (starting with commit 7bd230a26648 "mm/slab: enable
> > slab allocation tagging for kmalloc and friends").
> >
> > When the kernel-doc block remains above the internal implementation
> > function but uses the public API name, the documentation generator fails
> > to associate the documented symbol and generates warnings and fails to
> > emit the documentation.
> >
> > Fix this by:
> >
> > 1. Moving the kernel-doc comment blocks from slub.c to slab.h, placing
> >    them directly above the user-facing macros.
> >
> > 2. Converting the variadic macros for the documented APIs to use
> >    explicit arguments.
> >
> > No functional change intended.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> +Cc Jon
>
> I thought it was supposed to work because the kernel-doc scripts were at the
> time taught by commit 51a7bf0238c2 ("scripts/kernel-doc: drop "_noprof" on
> function prototypes") to handle _noprof. In the current form git grep finds:
>
> tools/lib/python/kdoc/kdoc_parser.py:        suffixes = [ '_noprof' ]
> tools/lib/python/kdoc/xforms_lists.py:        (KernRe("_noprof"), ""),
>
> Doesn't it work for you then?

Ah, I see. So it doesn't work anymore because we add the '_' prefix, too.

I guess the question is if we want to proliferate more kdoc parser
special cases, or just move the docs to the macros. The downside of
macros is that they lose the types in the displayed function
signature.

Preferences?
