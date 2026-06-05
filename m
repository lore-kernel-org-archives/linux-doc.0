Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE63C3428
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676488; cv=pass; b=lMUtNRswncmPIswuoP/UxKwUA+mXYbYkIq/ZKf7eICOcjjsrhEDBKA2LFYYAh22q6gkesTTKuWlKJfY1DH+pKjoy96Hvtx4A44uPhdtxXj6SH1ZU6lCwHmbSt/3ihTAmzMwW2nkWVOn4SjSoBVxHptBiJZkgc3dYo9JuL4argEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676488; c=relaxed/simple;
	bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgTr9Ht8oJOraASsWeAXeaqWoeQbUGB1xqq8eRc7JRxxPNCmT8TTBSQGcK2h5A6+wTF11j/EWWungcfy+NA44ZPL2MCzjdOTRkphrnqjoTFgpno4WIQ5HeS3P7jt+CrBgzPxBGnQ7k3VV6xCa8+OndBvLmMBJb4AVprRciAjbVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ui8wUur8; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ui8wUur8"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-660456349d9so2588669d50.3
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 09:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780676486; cv=none;
        d=google.com; s=arc-20240605;
        b=FoxKToCyiL1oSNjuknm4Queke7jgiy4gWPCB4ojq175fx/2+mYQi4F9OYxNea82+VH
         PO+e7luvh+n4OLK9SzGapVBwaecFCDZvKUhOzyy3JdNvw3ZfH7PUFN60zH5HmOBL0j5q
         JfvloC1s/jidV1MhKAPFQzclYk8FgCMJnPRCSB+5pY512+2yKC4PQdBrzeD2iJk32nGi
         WHMGfIhmMFyUZblMNnaMUOF9EnogY235R+9l/xW6bFPV2GEAHiDbgtmhpZkmk66qnWH7
         dg7xJfapHyEMTsvMRrobQX2Q9BFpjqVg4dSJvd7QfQmaz2ogfr701FQ7Fcs5w7A/jzRy
         ytag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        fh=s8r3W17UwClzkLK/ML+hmB9/QUX9lIn40zxiNdPGJQU=;
        b=R3kyyNJ+Bozqk17YbLrxkWldVATT/dTZ/XsPLP4lBAvV9/Lv+sq0+yI9dHCJKQtzCI
         30JLg7cSfoi4c9BpaIO1+FPBLlTXOu2Rrq+0DXB5Hedk3LbQ5QIRdeMGaaVewl7ocV+D
         ywUIyotUZUDoJ/EgXxooJWAktTgry/BR0iTXApfKhj/metVUDCJ+5OCi6ofMwep3DetU
         7JLVGofiY3bH0KPHKD4J2omr6fXR2OB4asJcENmRUDEtpwXRDLVryuJ8l8Hp1kbR8Lc5
         KRI5lSpZbleUsqEOSTPEbvRbH1noOOhz2Pdm0l9EmXgXKJ0J7eHXPyjUbvtoc9wP6YGl
         JyGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780676486; x=1781281286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=Ui8wUur8KSyN0pvynRn3skezHBd3sfh1W5TIjT4eVt8Ktiz8vrwisyKkScL5uRWs83
         GBDkw6QrKOQy7eVUQZoCJWF5kgJ9MUu2mbMLhq6GgQOCJWyTwgqUwp3kwBc1JF6hg0cY
         AVaO6PI9zVJGkoVY23ra2X+Pshx9zPmheAZP3Vgy5eNnT59Is8pWFvrufHHr7ADCbIan
         N1LnZ2808X83NOKNBnd2eL5qBX97ba92cAY2Qh3rEEM5SzBPlKMWOzrojBQau6ULIAiL
         fq+cXcJbuJiw+OekQSmQwaeYvzjLb5tD7/ywY9GJ8ni0M44MdhHBiNzPnzL2umckP+rC
         RWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676486; x=1781281286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=cC3lbdcfvElEHJcHpgii28pGkWxayW8xoDqR3FxwRTq1/MsxYnfbC/Xnp1+6yDbGBz
         sjSXweWD1+IqhW3R4tt0JmV94pI1oZXNmvthUSyPCiekp8XKb/Gqj8TIiosGfGsS9pbR
         swHOdQhxUVirc75laaC8HgfrwWMu+7wBUwn0AAtkeVsCq4nT4iopHTRPl49mDrnMQwVs
         pHatKo1gMF+hRka9LTU60zKmRJoducCYKHhoEr6ZMATkJT7uFC34jDjdpAjwoni8l2RI
         IELTJ4W3nVZc3RWaw2OvlIWfpnLUTlR/ksv9sTWCoNVXhcC1ic9KBEDg69hSM+A2ouex
         GF2w==
X-Forwarded-Encrypted: i=1; AFNElJ85ZsFj4vIb1L+O8hGHDtfTmVtQ2t14Q7nnv+iLSIPtJNXvj2g+deXI1/lbcjypgAwSYnLfOsE2ZZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqU4C3CPDuorMxo7fPVVHWWe8WrhajO0brceeL+kLgK6tbqjyG
	1g2LWrOiRRPuLgRKCbtxtb790wsryOv0XQ0oiFs+ykyPDWCEV9X1+e/1Xi9fwKkNdp0zGGR+Mkv
	Y6Y90POPxAZZhm7CyoIN/rgl5DwdzJgb6bDSemz4X
X-Gm-Gg: Acq92OFmpzkh31+4JEXrR7AZsDeI5SObVmhVBJg81z7m4xNlUtHnNF0t3MhXRJ/wlnF
	V4ZxknTGc1UduFKwoEBgRsj7PZFjG5oJL9pSxhjFnOzjG5ExZcZDxF9pwOUixMKN6MaXoUVudz2
	Dq2kDz7hRGiIGXTQiG28/EcEINyn2adqD2QJ/RSM8yA99ztbgc4LNts3uJSvoR8GqAGBwpvusRF
	DSqB10xmjH5FCnZS/HPFpfyhFqycnc1dAmUa/db4XgIIfOIrK/yMW1abVep1nBsS0CkFPWS/Hym
	TtIHXmZu6TL9QwVXjKmCq/A1ZEhwSYxUI2G+XXLpNXMeTUkFYHw=
X-Received: by 2002:a05:690e:1388:b0:660:877f:a5f5 with SMTP id
 956f58d0204a3-6610704f8f0mr3897550d50.43.1780676485426; Fri, 05 Jun 2026
 09:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:20:43 +0200
X-Gm-Features: AVVi8Cev4P7AiBmPodWfwaPtX8_k3m47tFa_rHl6t21z7L5L4Qmm-6Ly0xXbR54
Message-ID: <CAG_fn=W1++qPJWQk1+4MtRfe6n1iUKF2O5pddnqKGwSq85CuqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Introduces a new KCOV exetened feature that captures function arguments a=
nd
> return values at kernel function boundaries, enabling per-process visibil=
ity
> into runtime dataflow.

Some high-level comments:
- Make sure your code can run on every platform supported by kcov (namely A=
RM64)
- Check out Sashiko findings:
https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fe=
e0939de2c4%40est.tech,
at least some of them seem to make sense
- Please consolidate changes to the same file into a single patch
- There seem to be two tools (one in C and one in Python) with
overlapping functionality, can you keep only one?
- The test modules seem to be used only in manual testing. Can you
convert them to kselftests or remove them?
- At this point, long dashes in the kernel codebase are quite rare,
and I don't see a reason to add more.
