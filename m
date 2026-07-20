Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82A307492
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561204; cv=pass; b=jP6qdW7WkJUMrdCSP8U3hCMkMyqsgnCPru9s+g7sv0saXnn0mgXYKCnHVSaiG90jUN57UGqWQytEXWe65w86l7jmjjJ2Jl6k0aYhE2SmwF7cktFZ/RytuM5fli//39MerC1FK8zW66Dw1Aof9+anHwVLGUxS270TX8uIvi984eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561204; c=relaxed/simple;
	bh=wIOvE9E0izI9cWeOHA+3iIQfg+0GMdGrx8Op9HFx2UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLNHgLkmBYhaWh4CGIDzFQe/EzA9Cr2SAvAO2nK7bYM1xpCWV8oZznvWclJv9Bk7mMF0prlDGhBZqG1W3rjD+lHOcfZqMSpaubARrxF3j3vn1jkTg3JAOIBEWwD0JLcZYhw8jchpTDTH4qU098lJKZ7I6+Hfs6+CNv6zxsmBTz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pjBlBD/9; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pjBlBD/9"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38511175ad3so8404364a91.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 08:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784561202; cv=none;
        d=google.com; s=arc-20260327;
        b=gcRoUSrhhTpctGDSqmiRwSB1oVhFLZTuppBVY121oZ+oWZD3xOugbohXNf9aKqTdOu
         fsSQjYhFyuQ8tsEL6WosTzZgqIuQDeL9ZoL2SOv02nk+de61G+T5uRiuXMn3TwhDbIre
         F+cGq89NPgP6OrsuwiBBg2m4ecVfE+YU+QDk7SqiNf6F54LcTPzGUfiMVZnwSXC0yW18
         Wfh2+RPLI0xIkzyCBhiYOy/5+uqN6k4Pur4Op4hIT/UodugoO36bvSJIqW6cDikolNax
         CIcRH0wLitaJpohu9Pjcbu1+UQon5r+fKMk9Leh8GBWxZNDAH7ozV2/m/Leqv1F5PDUL
         GV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ppRDMOFJLBPX6KQmdpRBZE7SlCyjKiRE9PJURFV6vac=;
        fh=NEDLHP/ZoPvYuJlmHdEgN5xRBVjukK2wkjRqhvVzBIM=;
        b=jMnwE4yuJokr6RPUFxxIjE+dpagDXbeEzY6xRfL2tPnOxDk3bj3+KNTuUViaVSYiOM
         gCwruohjG/NsDD2rhqhP51SR6JcjGw9JjHePVpmL/0l8+W3QW4GaBwZPm5HZNZS4UW7G
         XrIaP5fM8DIctXquE0gpiQ2fugRtQlcZ9byH4c7OXMX0y3SWySLo8x6DiJi3e30tcdSK
         bk+VgkiUl4yxP4EWYv6Yx5BrCD0k2t2EJgMt1IRu3GVMXxkDjCvmexzEyTfl3dy1qcH0
         09gEeZnNqJ2VSQViOjBXvKKn2RMdcVCcakuPLPjDltCkvnj8afti/gZD4u9Mlk1rcUC/
         291Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784561202; x=1785166002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppRDMOFJLBPX6KQmdpRBZE7SlCyjKiRE9PJURFV6vac=;
        b=pjBlBD/9arU+fFVTL3uXCLUiUtm2Gf96GNDBlpDGTgBZ0UWJ1CyBL1REjj9NaZkpjb
         1b78ZzfvQfufYjmrErNCXsjFY5T9GNph0nJ9wLxtvVEtgKaEQ71bUbe3XO+7skYGI4Kt
         yQOb54RNTpOkmyJ5R23vfR2r+IHnVyp1Z9K8lW/DHXrMiVOVa8u1EiZ1lSLpakif/LOl
         9Ko3dMzotjFR1JGFCrN2sVCKLPrn548ySQOTMPD6tQiPxcpz11VtweYc4TMqx/3WNCsY
         IYOjtk+siLYIRUmJzjcLlUYbMZ3maEMQf0C6vV9vNkEjpcMggN2kL6yHWnOpE+hFSIkK
         UnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561202; x=1785166002;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ppRDMOFJLBPX6KQmdpRBZE7SlCyjKiRE9PJURFV6vac=;
        b=jd+A7YpFyVUauxrLoKkNqvTkAbRR01gRb1yvJCwDmF2L00RRGcGJAoii3Z8qPNJ9l3
         Aq5GH8FX4sM7xGf740JH84/pvU0ZXXgqu4mqTysYkIwFHycY3d9saeYsezsWbtk5iZcU
         Pc5iRBm0rXUu/uprMhrdVl2AfkGwcAsB8NsDiDUQ77peUNmWB3ZMR1sBpygHOnvM61+t
         G1pccqSzcnL5ahxlfurfSe74bUmcWrLzXdK4hSznZJPuhSXXY910/5r+mGUx1w396bMG
         /r2SUD2axy057Pwd1bBJJZ3Gvx1NzIO1GpeUbvPcuOPjQ/jlrG6eNz/yJUg+Lv/yKuiI
         t6xA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7puqh93oFFAwe5RKX5LYZW8LpINAQMtGhN44bRjCIl/7eSqi41bkS1HSaKTtY6CbHoOp4KEgoJGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyttvQ//5rlAJRzc7ifdydP0Ybh15BrGZYa6RxiDijM8oFmmNd
	qy3BS50DYQ48Pk0/Cho8jDKxdQufPYC+Z0WZ4xd7S4mOTLq0iBMRoKLFyxI2wDfMOzkjWX4iQ4f
	eW4DhbfG3l/e1jotriW0kCtNJrYLg9yQNNwz5LhFK
X-Gm-Gg: AR+sD13hewpH+LP6yYhlrnIsEvrHZmK6dAAOohI26zyArfzxUpGV0IpHK8Qs4CMcTv4
	xqiVYuDdLBG4isEKn97s2zN8piaWI5LR7t99PxfhvjSpS8F6xme/j+UdmmmEl/wluZV9TGP4/Wr
	/K8l1kkbpQ/a35K49owVosRfNBALFeq9vkMNwRyKbF8lc08h9M+YtiE67PXsNnGDy3HnpHx5M9F
	gc9JsP+mCLY2aBteshea4DsqqEoNdCiHycgKkZrWuWTvpkHHFKDvA6LmcNllOPNAZPXWy5p61Pl
	yeKJdbJaFMdVTZfib4Mxry3JIw==
X-Received: by 2002:a17:90b:580c:b0:38e:2524:724f with SMTP id
 98e67ed59e1d1-38e4b410109mr15364918a91.12.1784561197991; Mon, 20 Jul 2026
 08:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717125023.1895892-1-wangjinchao600@gmail.com>
In-Reply-To: <20260717125023.1895892-1-wangjinchao600@gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 20 Jul 2026 17:26:00 +0200
X-Gm-Features: AUfX_mytGrClEjUL35sTA01mL-vDpdcepD52IC2sE_eAPBJUPR35g0y1m7pBRLg
Message-ID: <CANpmjNMpKXxk2KsZORakwwdOpDG=pRbtJKi7doBt7QmQwUKdgw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] mm/kwatch: dynamic hardware watchpoints for
 hunting memory corruption
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Potapenko <glider@google.com>, Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jul 2026 at 14:50, Jinchao Wang <wangjinchao600@gmail.com> wrote:
>
> Motivation
> ==========
>
> The hardest memory corruption bugs are the silent ones: a rogue writer
> scribbles over a live object through a stale pointer or a race, and

The stale/dangling pointer (use-after-free) case is the main one you're after?

> the victim crashes in a code path far away from the culprit. Any
> single developer hits such a bug rarely, but across the kernel's code
> base and install base they keep arriving, and each one is
> disproportionately expensive to localize. The question to answer is
> "who wrote to this object, and from where?", and it is hard to get at
> with the existing tools:
>
>  - The kernel's own reports - an oops on a clobbered pointer, a
>    BUG_ON, a list-corruption warning - fire at the victim's access,
>    not at the corrupting write.
>  - KASAN/KFENCE catch memory-safety violations: out-of-bounds
>    accesses and use-after-free. But they have a blind spot: a
>    corrupting write can be fully memory-safe - a *valid* pointer, in

Language-semantically speaking, a use-after-free write to recycled
memory (be it in heap or stack) is NOT memory-safe. The detectors may
not always catch these (KASAN relies on quarantine for that to
increase the chances, but yeah, not guaranteed..).

>    bounds, to a live object, written just at the wrong time or to the
>    wrong place - and then they stay silent by design. And even for
>    the bugs they can catch, KASAN's rebuild, overhead and redzones
>    change timing and layout enough that racy corruption often no
>    longer reproduces.

There's also tag-based KASAN (KASAN_SW_TAGS or KASAN_HW_TAGS), of
which KASAN_SW_TAGS has an x86 version based on LAM (not yet merged
though? see https://lwn.net/ml/all/cover.1773164688.git.m.wieczorretman@pm.me/).

One property of tag-based schemes (and any other lock+key detection
scheme) is that upon recycling some memory, the tag (or key) to that
location changes, and any previous pointer that still has the old tag
will fault. The caveat with current pointer-tagging schemes is that
entropy is relatively low (4 bit tags).
