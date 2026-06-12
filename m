Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDB35AC24
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251248; cv=pass; b=l2PiCe+3WQJjGFEC0/Y9Y0Orr8Lf2Boz2dcOqOxiPUs+uUbCT/I6Ju4FliZYybGxYVXGYcknSdvqsJJXne2j4RSWCDtoBv105hL3HdLANcRh/kzSlfe4WZoQmUXvMfM8NYaGsf5zhyO9rRx1gCSV0VMRj3EqvAcxC0WAkAEkZVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251248; c=relaxed/simple;
	bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2GUtDY3EmZivP8OJg2Wvzjq6T6Z9DJRG3npnCazSr+eCAmW7AaJeD3NOe0Fk2NhUCNp4ZXOdXLPan0Ii7jCdc50qG2tlhm/qKKnyQJZIvWZNXOdlRcdewrOzj2boJOpfhYZOewujkKNNgFqDwB5RCG1oh6FgrX+ACEnPWgvHVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/KaT+yK; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/KaT+yK"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7dc67a5e102so6681717b3.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251246; cv=none;
        d=google.com; s=arc-20240605;
        b=XpNEnxsI5/HGFWE+RWWhVu78zOCvU2KKFblZEaUEIvAzK//kbl1a7PHyN24tPM59gM
         YQpzDB/sEzI07fyRwOcbDPjoWLVSAvE7BiEi+0d591vsXYURpfLTBdS/98nCFkZDQxGP
         EGiW3SXaWAA4uJKY4hbZkHiAr/qWBY7iccMlIR/31caSX6cJ1JOtvJ+pVf7f5+V6gkaR
         wg6kd7bWdERYmMitc3I0ud/7c7pw22EsfUPBx6Y8nCHLSim5tU5BNNwI7+7973lOKFqC
         BGs3VMdS7mNJMOGq5ZOky7ENi21/E/d7tNutvnte920aMa9yEYqg4lZXxwZAgFEUenu0
         fhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        fh=BgUd53mn1hg3kNzKoeGM9RGFDhKLSQp5ep11KgB2v14=;
        b=XrU93txGvkkSVS/3Vf/OtZjTnVI60uTg/yE0oMJiNTl+qs3SfJu7w9SPGHj4wkuEhZ
         pPwNxQcZgrAgp5hUGjY7qT/BthmqHtLtQ2Kx9QZnfzn3p/buyYZTL624VTBBs0oEA6af
         EFXZ+ScqNaNYYbq97mnu7JbCCO74sKHNNiReMQMWnfs/xQqYfbHtgyiU+0AqZDKU5Wla
         hnImFJzN00GQaVZL3NyUyPVvx5ULvfVwmFNZHm8JmFzykxHW6HY5/KshirNeYfJRDBOT
         BDhh23rRgujv5loBdesLssA2mjM5mS7FUtfetQaQ3BrBK9GNZRoZlQEo7xIMOYgZRCIJ
         uC2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781251246; x=1781856046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=v/KaT+yKVuYKxugk9GOkU+ByBS5tAuu8BM52P0ROYU/zA36UgpEdVVgn/Siw7JATqN
         eJF4aDW9cpF4phgd8eNvDOGOd9fp9S8mgtqPR02h49maNhy6DW+9FDBxBrjYkfilUXtp
         173US70nRQrPQjMz5ChJs4F6QYj0e7NO90jIwHXCCGmxmrKjfghm4AUxd6eNSQnUkwhv
         qhzkHeddM8HkbCVyqW5biYj9jbh+zqe62E968ClSB4V9Jym2H+hq4cbAz5RcxrpaBwN0
         YrF2QYkryG1AYMaCgXfsQ29oUL+6fvYeXb34RP+xlfGbfPJUeBhB9XEnPQWC03zgAE84
         CQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251246; x=1781856046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=HhNfYj6SB4rKdm/Yt3WkM3rFPoHmlTf4pnXwNxhXuNy0PS3hmoqMgw6DIRYKrbSms0
         q6fX6SJIeuDQDuj2l/P3bNHqKFm+OejOifUxVMcEdBDcUq5MqVqxy2AI3oTpsSiLuO3p
         rHCQeC1SBvYaein9o/eCDFJl3nRLRHHyB94N4G7fAlKcfiPCXx3xRoDl8s/mg4dcRVz8
         cC9TJcsZmiTuYKcGp+LV16Ksq0Q28OibkjF9SlT4JbrunAFw0erQPVCReAOxzYt7dbwF
         E667V6kac7/4BTN9cV4/l3cliESU09WGBSD+QLOd7qyCpC8WUfw8J81o7w3pg0InatP8
         4pYg==
X-Forwarded-Encrypted: i=1; AFNElJ/ajCPnd57Q8uZGI7gV8CXVpFpATyIDDwKDCFKVY8c6LAPXkF18PVS4C490MIc9jzIhgS5WrM+d0yw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqr7qo7Wbb0BFgYS4ggB8jqWZ9zuWqN6OzPSeN0690/BRLiP1g
	jAOfDi9x/T/uS8H6K3EnSvYhd0v24cBHYwBiVfXqvxnQSBhFuW4wMFOTmkU9ma7hiL8laPn7RmN
	lmXaTutZH+j80IpIeAoAGbvv7I2K2TBL78xIQNN1A
X-Gm-Gg: Acq92OGBBhuugx0PTCHHI016qrBCIO3uGLwmRVYxV3bNHTsMvnH/A6hHXFgzI1eoRJr
	rku2pf4T85FbFbNKt+VE/Rs8c0f+Kw91wIrAbWwvYPw/F9vTCJDhyV/mGWrLfeNSdEZUp+ECR6O
	G+KbCBgnKiCAIbxste5cA1SJ2jTIuwaFeJq1s+QSCN4vx2YLAhtbypEc3jVFV5v4ddSGdeNG141
	s7aHAbE706RcYC3lCt4M0g+ASiF2Us465Zhgz6155TPWKWVYQvbFCWb50KAYJIkXzJhCB2zJ4rL
	kcpoMrN9prIMwmr3/GduTezaWqbRUalJEX5X5w==
X-Received: by 2002:a05:690c:6201:b0:7db:f8b1:cd80 with SMTP id
 00721157ae682-7f7bac02970mr15863297b3.2.1781251245971; Fri, 12 Jun 2026
 01:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech> <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
 <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
In-Reply-To: <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 10:00:07 +0200
X-Gm-Features: AVVi8CdEFjoun-R64CqbvYJPTnaS_E7TDNryUpyw-2UHJoZxcDfdiOQP2RCPBTE
Message-ID: <CAG_fn=XB7_zbjGzpgwEzm5dqcwehqvB+=SpJhHvw9QdETberAg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 9:25=E2=80=AFAM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Hi Alexander,
>
> > On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.=
tech> wrote:
> >>
> >> [snip...]
> >> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202=
60603-v2-0-fee0939de2c4%40est.tech
> >> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> >
> > Can we please avoid this?
> > kcov_dataflow.c is being introduced in the same series, there is no
> > need to send a buggy commit and a follow-up fix - just squash the two
> > together and note the changes after Signed-off-by: separated by a
> > triple dash.
>
> Thank you for your guide. I'll remove it in the next patch set.
Also please make sure to update the patch version. It's really hard to
distinguish between "[RFC PATCH v2 n/6]" and "[RFC PATCH v2 m/14]"
when both series pop up in the inbox.
