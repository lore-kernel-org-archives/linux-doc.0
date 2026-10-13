Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8193BE64B
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885149; cv=pass; b=d4bpfO0Jx+6neuoCpD1GrowdgkyDh0jgYmEe7pQKEIf78B/FR0XuXsjkTWWdXAV9KKkpSL7YP84mfeoGSt+sI2zCPhH7sTrmf0xNIowgFnEzn8Zisk7JH6E3k4UvkrRu/MazEpMqKd7lrP5WU2xUuYw5XYqtOeP+sATY/kiGC30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885149; c=relaxed/simple;
	bh=TyAuVkyMsHJJREXO1/HTkl4JIBxp9Fm42OQD2fqAPFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4zqlECUq22kXyw73s0NJ06LwEcoDcebu8Q2IPjdCBay7hxK4SydQAFQZUhkDP0HTKLL2kQpWfa00dHoo5ff8DVeZdlbmpbKzOjafgJKpQosdRqVkCEakQjl+dAeRkjMEwGKpP4DHA6PLpfXHaGuKUZEhoAhi2OqSdE+yPmENDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OUe1p8Js; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OUe1p8Js"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1419d3416ceso4096430c88.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 02:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885147; cv=none;
        d=google.com; s=arc-20260327;
        b=mLMD6USXAk5mBgmhd9zSRf7huAMv/TfAh4IH2szS1HuMd9lLYYA+fwh48yQzETj818
         Mh0ivFAKfC7/0F16B90PJQFdeJ+QZDiKDxkuhwDLFFycOqEJK/LIkK7ETRanK+mS3698
         UbmqSbKsc/djPC+OKHxbK7OioXIi4IkczJN3hnpvbWwM3gzGFb7DIDs3WvPPRNMM34Ya
         hcLw4KyKo4/8KIphw6yLzv6iN4uSYRGeK52phegmnUZM1hiw8HmIVI7cJZffCeGwvui2
         7Ya5THgxHHkT33Z9V17cTTCioBqQU1bDIItdChOqoei3CojlOCH/JaFdFzuiMsHpKGM0
         8Yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        fh=byfegLTZlh2d4tZC5lO7enrZDd3kSTohECOptHwZ8X8=;
        b=AGvhPftK7/PMf4hdf5kJBsCGf8BAyMpnaFB6Z3UiwgVif7gTV1t4LzP0Bd8MwYduff
         LhUWM1v3TvMAm0+fDyVtzdU105xopD53x/xOvVk5VPpaz7DCCLzTFZf8fHK3PjEW0cNa
         eTPhfTnA19OCHH7GuIjAD4UV/zkPI+NI0Mzxn7CkLoP9AtJo+JkzIEvkHkJzBRS4kKhy
         kenjKD4ufMW8Cva9PSRCWFrIieSmWbucfcu8wBykorGIiXlPk1eHs1UMdy2nCm4Cou3H
         yB+qM1PTn7sdT/fbQyB9TXYwbT9XM0I3Q5OLPMpO7NNo5SM9gVPjyFsWZZM186a7qBvq
         tGnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791885147; x=1792489947; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=OUe1p8JsbeOEmdidmgAwZjuQYWObCln0UY6mN2eUEQlLo8RQwV3Wez4R6Toconn+2u
         SwPGP8b+GpqrAeyfYZLM692dVCl8k5vn4xCfNuGKRAfvfdLW4KGBVya1t4RWLKH6ELWD
         9A6WuTcdLUTdhNf/MuIce3PoimcZODZ0HtnvYu+7q5io1IQl6ksS99sdaHam2o+3ZYqL
         niW9YVjN+cw91gOGKi1XQJ3scIcybviJt/gxM/9I12iEZMz/64ksZfQ8QV7Zh7qg+gew
         8cSgZD1M0cXsfyOnBJpvjsn9WE/cAIIzU57mjE7HVw0PwvaLRqH0Jo+eujidbn8w+Y/Z
         fV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885147; x=1792489947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=Ybr4jXHeB/2Mmu/YNhUnXngZFa3q2XRvC9X4hiX66s97/7WWhxH6SgwbQAmWQSfMbU
         OXoXZoj6tNuJSFYKUYpGi6kC4dPyVRA7e7kHDEyaxShAujRmgc84s+AdNwpDJBPvepgh
         4VoQZPRC+qUujzLCD74SjFtVfqLXGJSyqijetx8qnL63IsTWwfn9ElK5hHzvNsem7jJY
         TbNC1xuHF9ptZGaQuo7ymbgFHGqrmCz8UN8Qm7fjhIo9ZnzVJeO2Q/kByoO4AWjF8te5
         H/zQSTwrNkhwe9LegMTgxHIvhgFEnd1NZPbPCoxiL8BLEwjQDkuKe4S9lYHY2mVkceLC
         xaXw==
X-Forwarded-Encrypted: i=1; AKwUvBwwoTtP79mxefgjnDLDMLHVtvu40PA7TtsdjNJHVWfJuU2Y6va739si2AuJ+5zt9+6F+LOczaHu84Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYL68sutieN8HAJGUT6+Tivj9rYsJofS2ocof3qBE+IN071XYn
	nXel0pEJJjw2bpzj5h+kbYAvAD+Pr4NgV3wOqDlVrDjvrhL1+yCUEhuZcpmMjSQN3ptVPg1fr9w
	XGkDV13HDzPGXkcqecqnMn/ZM+fkdT1C8xLUvbTqe
X-Gm-Gg: AYBFou3UZIHop31nSC/Y4HnUesWeqb6lSMov/JqMPnmFbd+8Q+5TjETKziXI5dID/iH
	G67AMcpWnZmyiZzoq9z5JMYeqopOqMuINMMQ+ppGCSgzIyHU+F0V91R+pkIM4u4n22Mm6xoe+FL
	NgJ5fFd1K38fNPRb0R0QGodWBEIj/qLJzHQ71LZacPC5J9ngQkKTjznVEDe+o5fXGElF0WiqsdN
	j/pSvIDGVfKaw97tqhZ/rll4FErpxLZDq+ZphkmWfIkiogcgRtV6TdV0yDMfTR7kgo8+yreR2PM
	+/nldDa6uVWrpXzmCCip88u1cHbuek76oRxO6OQ5zmm5lrek1H6zJsUm2Jk9D6Wp4eUBo06tntp
	4HFGFYyQZ8A==
X-Received: by 2002:a05:7022:92c:b0:165:8e0c:1886 with SMTP id
 a92af1059eb24-16a610c9bedmr22542241c88.25.1791885146407; Tue, 13 Oct 2026
 02:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
In-Reply-To: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 11:51:49 +0200
X-Gm-Features: AclHuK_xfsOoDi6wrmohki4XfQkFak1e3ZKbYQiASZjaKFsec73Ai0xMvJurni8
Message-ID: <CANpmjNOdnZw7kgjruLikbyPK2fqLgtndMdnX5osWtShP0Wh_UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 11:36, Alexander Potapenko <glider@google.com> wrote:
>
> > +ifdef CONFIG_HAVE_KCSAN_RUSTC
> > +# The minimum supported rustc's LLVM supports all of these options.
> > +rustc-param = -Cllvm-args=-$(1)
> > +kcsan-rustflags := -Zsanitizer=thread \
> > +       $(call rustc-param,tsan-compound-read-before-write=1) \
> > +       $(call rustc-param,tsan-distinguish-volatile=1)
>
> Do we also need -fno-optimize-sibling-calls here?

It's optional - I added it for Clang so that stack traces are always
complete. But rustc doesn't have an equivalent option (neither do some
of the hidden llvm options work). So this is the best we can do for
now. I might want to note it in the commit message, though.
