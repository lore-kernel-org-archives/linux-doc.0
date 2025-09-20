Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A5D170826
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758372332; cv=none; b=PuXKbWl3fTGZOPZZE+yeblUKGfvPp9Kl6TEVqnli7DvTBieOcgQNRQduKFNFP9yyEg06Ndm6agNZ0D0CEwKHr3QZZmLmR9ydjb3iaKAIdp26Sv32ZIqudrpZpnn40odCmJiX4cSCH+J53sQ7MnJHXVfIQYm/lPR1R0N9QQuu5Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758372332; c=relaxed/simple;
	bh=B2pdUGVo1hxX37az6KU5TDG01liBl6FvTa355/7VdK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3cukmuDEuI4lAQl8jj21xsFjAH7F9ajL3pBt1IXW/IBitlSriemNMSB/8i5/6WasiyBdezYhsPT9eii6cHw8PQFowQhAXP8Js2DK5cFF4S63CQGQ5zWscEyq5SfoBLpskQsI2Yk6Sp6sVuPVi4T6xGNVJJVodgQsRdDaZcrlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UBkC6o/x; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UBkC6o/x"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26f0c5455e2so5521695ad.3
        for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 05:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758372329; x=1758977129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P2Xt5dxImFQDNB+zIOSzEq8xo9rsZmb+jmetH2dJjzs=;
        b=UBkC6o/xEMnutMrAvFhSCg3+/b6YUIt/IIkPi91Mmf1EIvbALnnziFHl6XT5dCqGoE
         TYPO4w1IlqTbNzNMbFJY0x102FE/zza2OmJxDWZO1w7/4wjpDO2YTtgA0F9ZdWKRi3js
         ek81yuj96OBUi8jYkJ4am8Uwqa48PbVWopzu+1dtQVRWQ/r/tQoMoSRQWz3CaRDDxg/w
         75f6+kHr0G9puDEv6susKk4BqCdbwZ0pqz9Q6y+Rjdp581BxYQNFLdFEbjSY+9T35MHo
         l8u6wlNQ6aRwmt9kHXjXwyn77wAYbyP9U5G+guw9UXIA5s15y4rNOOWGrgGSnUohpTtd
         CZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758372329; x=1758977129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2Xt5dxImFQDNB+zIOSzEq8xo9rsZmb+jmetH2dJjzs=;
        b=CXXZjusaBOJcrXPqbtUzh5B7pNd08zzVEtPXargQ8eNA4TZvQ6HoYEVtnYSXoNXLZT
         esrlWyHj8MVziXbOlTM0rT6b9z6q7dbGzcK1l0RFX3qPmd53zX/zCt68/wTdU2Umo4Vj
         lg5b6ievMCSL820UJNhn6XcZdD8tI9AOGB6Xmv6FVpJLk4Ip9Gdar51M00hWUVzRX0dP
         Y0gf65kj+qekN0fvIvfEsJvfRgIbpJotwxc8WWx1bZbZQpSfOpvOHOhXYIEtdi7WitlP
         hnZOdtLkNKSYFkGj0T+x41AJdIXYYDBwNEzuE3isK587rWy3pViPOB5GlmX3UpxiB6nC
         S0qA==
X-Forwarded-Encrypted: i=1; AJvYcCXn/jQo/mcN+t+FLb4QNgbu4EcNhS25KHxCbF/MK8GCFlRgVeA7lRrocthfrg+tr3eh2ewpQezYOn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJQUGT7ApRTtlbIRqbwZFHDdizhHuFA/nO1qsYnsLxvzdETevt
	xceP03xx4UlchqIHRgp8gSyOCPU1ii+xh2wisiiWqRpiXhS1xM2Gs2UuprMN7JOB6ghI5SDIHOU
	XMbubJ94ad9La8wujM3ExQ6/gYPAiE58lDtOI+hjb
X-Gm-Gg: ASbGncs1bdnFvvsZkWR+AUEYS5ghYwKpmupZen+DnPWYG0lIu+iu1qLhO1AOj6Y2ni7
	E/cBZ1tIxli1b0jyVJ6Jm3R689l1U9DnqJgLrVfn5W7QV0vPrtGGxFYSvoecjh4crbJEn6EJIUP
	fzUCFGz82HE8kx/cVZE+VKFPU2KmZHd5tlvbD25v/+N2ZdXfL334kTsw6QFe3eAe2KQAhVj+sjH
	xiOGC2B0kOu9HYTi7jPYLFYew8UJ4AL+flvGAHg8n4OAkBp
X-Google-Smtp-Source: AGHT+IGp/N/ayplQqKKBxnGs6WOfyKUH/iITNGJNC3m56lH0ddprjnIe5eKw57ece8B9TDbj2UEYyt+VdKNzNYtu5ro=
X-Received: by 2002:a17:902:ccc9:b0:267:b2fc:8a2 with SMTP id
 d9443c01a7336-269ba46f141mr83309515ad.23.1758372328847; Sat, 20 Sep 2025
 05:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <20250918141511.GA30263@lst.de>
 <20250918174555.GA3366400@ax162> <20250919140803.GA23745@lst.de> <CANpmjNO2b_3Q56kFLN3fAwxj0=pQo0K4CjwMJ9_gHj4c3bVVsg@mail.gmail.com>
In-Reply-To: <CANpmjNO2b_3Q56kFLN3fAwxj0=pQo0K4CjwMJ9_gHj4c3bVVsg@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Sat, 20 Sep 2025 14:44:52 +0200
X-Gm-Features: AS18NWBli1y9TeOySCtz0PRORw8H0Rr8apw4LW7wblD60qoNXqS9BvtJEM0Stlo
Message-ID: <CANpmjNNkRQmt1Ea-EsSOVcA94kPqH_WntdT-NGnTjRocT25tFA@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Christoph Hellwig <hch@lst.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Sept 2025 at 12:23, Marco Elver <elver@google.com> wrote:
>
> On Fri, 19 Sept 2025 at 16:08, Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Thu, Sep 18, 2025 at 10:45:55AM -0700, Nathan Chancellor wrote:
> > > On Thu, Sep 18, 2025 at 04:15:11PM +0200, Christoph Hellwig wrote:
> > > > On Thu, Sep 18, 2025 at 03:59:11PM +0200, Marco Elver wrote:
> > > > > A Clang version that supports `-Wthread-safety-pointer` and the new
> > > > > alias-analysis of capability pointers is required (from this version
> > > > > onwards):
> > > > >
> > > > >   https://github.com/llvm/llvm-project/commit/b4c98fcbe1504841203e610c351a3227f36c92a4 [3]
> > > >
> > > > There's no chance to make say x86 pre-built binaries for that available?
> > >
> > > I can use my existing kernel.org LLVM [1] build infrastructure to
> > > generate prebuilt x86 binaries. Just give me a bit to build and upload
> > > them. You may not be the only developer or maintainer who may want to
> > > play with this.
> >
> > That did work, thanks.
> >
> > I started to play around with that.  For the nvme code adding the
> > annotations was very simply, and I also started adding trivial
> > __guarded_by which instantly found issues.
> >
> > For XFS it was a lot more work and I still see tons of compiler
> > warnings, which I'm not entirely sure how to address.  Right now I
> > see three major classes:
> >
> > 1) locks held over loop iterations like:
> >
> > fs/xfs/xfs_extent_busy.c:573:26: warning: expecting spinlock 'xfs_group_hold(busyp->group)..xg_busy_extents->eb_lock' to be held at start of each loop [-Wthread-safety-analysis]
> >   573 |                 struct xfs_group        *xg = xfs_group_hold(busyp->group);
> >       |                                               ^
> > fs/xfs/xfs_extent_busy.c:577:3: note: spinlock acquired here
> >   577 |                 spin_lock(&eb->eb_lock);
> >       |                 ^
> >
> > This is perfectly find code and needs some annotations, but I can't find
> > any good example.
>
> This is an interesting one, and might be a bug in the alias analysis I
> recently implemented in Clang. I'll try to figure out a fix.

This fixes the problem: https://github.com/llvm/llvm-project/pull/159921

I guess I have to update the base Clang commit hash for v4 again. :-)

And thanks for testing!
