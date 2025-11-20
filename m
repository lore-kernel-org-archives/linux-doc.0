Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C334FF42
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763662976; cv=none; b=goBtq11//LndYdmsebZXsTVd/msSzNw/UeJTrGCwTJQLdGTnHjBMoyJ7BFsDmzgZl+opWGq56Nhl37HdR/zXuxTg1jWygc7cbBwK1us31yyS+Rkwd601lkHVG63+0R3jmp2hiDfsvOZzGBK7KqiINQQ5iIotUyWo0AocjZj5lqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763662976; c=relaxed/simple;
	bh=wecZEUleM2pVH/ldG6VyoxAP3Tx+t9JIJBh2fst1eeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4dFuZZg4A8UxFX6u1tFRrDdlvxqXK5NFwqZNWXOWMbFTGvJ0m5lWCDJlROSLX1R5qT/O2fA4kuyJ4luUi3OpXCziSYb0QlVSHkdGUWht4vb5iEJRf24iFTqAU2APU4o2x3qi22LENjJC4HijJJf+zmGLhGyta/SYeQQPLtpllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bSLK7b8c; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bSLK7b8c"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59428d2d975so1365532e87.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763662973; x=1764267773; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BPfdnrOHpw/8tC+sL0oorkp9gKYtrunKdRWYzTn+GA=;
        b=bSLK7b8cywnIljZJZlykVO7S8VyuT9V1qeexEqlMG0f9yLJGphKXaxDs+gIzKIg0pc
         phWreBXDcobQON3FoqUceZnLO6KWPse76XBwOZoNsbVKGxS40bHwaSy+m/PFAC63I1b8
         a1SpFcbmShC3VSSFnAnyAZP4oWZKjF848YfYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763662973; x=1764267773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BPfdnrOHpw/8tC+sL0oorkp9gKYtrunKdRWYzTn+GA=;
        b=jZVMbpAmc2WrE0YJ2WEJfPDHl2XctRrlRtzL/4vAS1g2pNz0kWNVUWfXLd9M5ScPXQ
         e+ccT2lQGyzLnLTwWAbJZK8+r2aWqThCZCLzIofYJKwrCG22OrziyijyEDXg87P384Az
         oDqN65GBsSxgum00Hg9iSO8Fowwb0cSifGdTxzyuyVxHo92r1jFTq10Qu72SBZf716KI
         rT0qHwj/5DEzyT9eYPvaUBj587e1+3HaXgfMrsTeeo4YwYv64pEgg+/R9W2onKpc/Y3A
         3hrbTgongO+BOKGTH00e2eNAVUkjr0qRpdUGz1+FSmPwikWDbVioDXqEUhZ7k1Mkuslq
         qnTA==
X-Forwarded-Encrypted: i=1; AJvYcCU5TWkiKEhYWph41MUMIfkgorPf4d9+RX/ino4/G4CzXfz69SLadEMnri1GfOkFqaFIyuPwLD3lrPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0kBrVnsgOKV5oiB0Ec9YYoTIEOm2o5KjSorSidDzaHURDHJMY
	Zem4cvbeHPKskoP+yn+fPod7yM42b2vO/x5LNFqQJFFzD52mfUDsIYVWUtYekSjGQ01/DvqqKGC
	DBBDnqC8AGg==
X-Gm-Gg: ASbGncsAs48CizachaDfHcFLbefRzOPxXksdQcQU1dP3APNzgWrBI3yQeGbBm7N4Lyi
	0FtpqGIUawFeduMivfeSq+vfFse1uKh1mwal4wxWAP8PRQg+ls4cGIazjIM1y4EvBv1qOq00hlw
	V4PmHIPktFODp6JiVeid+RqGgH+PsgdaZltzuKBnFEiydrLjgI9v1sVVkDrquOaVaTmwLeOSzH4
	MzVt1SzaJAZxOg80TtXx1ukGuYBCJdLLIjNF/vqRlQYmb57ph66OwcH2Jg1sTa6YkZK9Vox/JGT
	HWxgxETgp/KSYHHxbBPO/AX6k32uYEYIMMnh8deyNc0xK3OhLw5aK1W7CbYpKfd8iaZnQPHUt8a
	VGqfdZTZiXq5Kd1Sxt4wFsSacSowgqiE6SkZVn8P9CkezFXOXU6+dw8aP843QTHK9uQg4K45rmw
	mMrTghWtB45QLE9aP+55vd5roIkmC7SNIUMFKSUY6qWpsrv8YV6NY8IBuO8tnoXjlMy8Jm/2bSb
	Q0=
X-Google-Smtp-Source: AGHT+IFsfPS/Zs/uRgjZLKmB5VagDS+ZlFkxzbBLnn8wgQA83+QPrEStCd8UWGMkJ6gkZJY3q5ekqw==
X-Received: by 2002:a05:6512:6d3:b0:595:91dc:72a1 with SMTP id 2adb3069b0e04-5969e2ae995mr1422963e87.3.1763662972708;
        Thu, 20 Nov 2025 10:22:52 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee86sm875234e87.49.2025.11.20.10.22.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 10:22:52 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a3d86b773so10737871fa.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 10:22:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPsyvX0LYn8vQWfGWcU2vF23VDyKLNELmSvtpVzbTkfp1ys3v8S+INrycfYV69N597Nfh2bZ/FF9I=@vger.kernel.org
X-Received: by 2002:a17:907:7f0a:b0:b70:b71a:a5ae with SMTP id
 a640c23a62f3a-b7654fe9b97mr482177966b.44.1763662490181; Thu, 20 Nov 2025
 10:14:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120145835.3833031-4-elver@google.com>
In-Reply-To: <20251120145835.3833031-4-elver@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Nov 2025 10:14:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=whyKteNtcLON-gScv6tu8ssvKWdNw-k371ufDrjOv374g@mail.gmail.com>
X-Gm-Features: AWmQ_bk-my8wSL6P8yRhTUREdDraem8VrQQmjD7uS2S9oN6T2mRX46ftlS1ytQU
Message-ID: <CAHk-=whyKteNtcLON-gScv6tu8ssvKWdNw-k371ufDrjOv374g@mail.gmail.com>
Subject: Re: [PATCH v4 02/35] compiler-context-analysis: Add infrastructure
 for Context Analysis with Clang
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Nov 2025 at 07:13, Marco Elver <elver@google.com> wrote:
>
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -6,27 +6,465 @@
>  #ifndef _LINUX_COMPILER_CONTEXT_ANALYSIS_H
>  #define _LINUX_COMPILER_CONTEXT_ANALYSIS_H
>
> +#if defined(WARN_CONTEXT_ANALYSIS)

Note the 400+ added lines to this header...

And then note how the header gets used:

> +++ b/scripts/Makefile.context-analysis
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +context-analysis-cflags := -DWARN_CONTEXT_ANALYSIS             \
> +       -fexperimental-late-parse-attributes -Wthread-safety    \
> +       -Wthread-safety-pointer -Wthread-safety-beta
> +
> +export CFLAGS_CONTEXT_ANALYSIS := $(context-analysis-cflags)

Please let's *not* do it this way, where the header contents basically
get enabled or not based on a compiler flag, but then everybody
includes this 400+ line file whether they need it or not.

Can we please just make the header file *itself* not have any
conditionals, and what happens is that the header file is included (or
not) using a pattern something like

   -include $(srctree)/include/linux/$(context-analysis-header)

instead.

IOW, we'd have three different header files entirely: the "no context
analysis", the "sparse" and the "clang context analysis" header, and
instead of having a "-DWARN_CONTEXT_ANALYSIS" define, we'd just
include the appropriate header automatically.

We already use that "-include" pattern for <linux/kconfig.h> and
<linux/compiler-version.h>. It's probably what we should have done for
<linux/compiler.h> and friends too.

The reason I react to things like this is that I've actually seen just
the parsing of header files being a surprisingly big cost in build
times. People think that optimizations are expensive, and yes, some of
them really are, but when a lot of the code we parse is never actually
*used*, but just hangs out in header files that gets included by
everybody, the parsing overhead tends to be noticeable. There's a
reason why most C compilers end up integrating the C pre-processor: it
avoids parsing and tokenizing things multiple times.

The other reason is that I often use "git grep" for looking up
definitions of things, and when there are multiple definitions of the
same thing, I actually find it much more informative when they are in
two different files than when I see two different definitions (or
declarations) in the same file and then I have to go look at what the
#ifdef condition is. In contrast, when it's something where there are
per-architecture definitions, you *see* that, because the grep results
come from different header files.

I dunno. This is not a huge deal, but I do think that it would seem to
be much simpler and more straightforward to treat this as a kind of "N
different baseline header files" than as "include this one header file
in everything, and then we'll have #ifdef's for the configuration".

Particularly when that config is not even a global config, but a per-file one.

Hmm? Maybe there's some reason why this suggestion is very
inconvenient, but please at least consider it.

              Linus
