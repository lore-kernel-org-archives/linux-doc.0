Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794948842;
	b=rc7DIo6s98ohBm/XfrudeQXIkmG126Uk7LKDvO35JJLwtUqHAmesMGsbn/QXOMlGmyov
	 YbZxqk7BL0dhtaO4Apx2MGjfH5ljsI3wE2kzm7y3RCpsNhkoKXWUDYJlWOHGyjtqCUGSp
	 Jtu6Ek9HVK+gBcLxjsc0+kdKrSRszL/+pMKg6AO8pFSiDgPZjgBbUTNR7xWvGlBqlN8eH
	 4r0VLJSFowiE60Y0MevdtMjvczRrC59SEHYgFTBHZAQ4Sd5qF8EP6AOpTqvX8llIADAGr
	 lB2hF5lX8M6MKG9L80BcyU9vDOcQaCQcVJQH7nwsLPBwJQ2H3JHLuFklUEgMMoHEbMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
	b=OES5l/1jsiXh+is6cEFcgdq7XR8Iwkkmr/wE/3uTIwOUi8zb2KwxJYa22Xdkr+QAcXvy
	 fKXFOZ3LAvnr8HHhSbvTtfI3vZHDfn6Yf+7gBux5F1XkoXS6Klcsz3AKP2uCcKsJ5JJMK
	 WZJ2cjSPcd+3bKs9lfx8TYxiP1z9aAZ7twyLMbh01ArK13oBeTT3+YY7U0NIYwHuurWXi
	 SM2zRjNYkU+rVHFqrRlQ8OqbW7YTv1Tn9/COI+U5JinM8sJLTpsem86QfvHLmcTIFwlvf
	 DIzJR1UXEF6i6knO9c5os3XDSTxsix0eNZ1ScCkYXS8Msy7UbXp7amhvGNeCFmDugnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LslQjUmg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A10606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 20:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LslQjUmg
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4fea434bso1244828e87.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794948840; cv=none;
        d=google.com; s=arc-20260327;
        b=oFYxx8nFcy9rQmuIo/GrbCHwoiSK995GWhjHhPOsEol34Boe1sqW2li4Rr/YLaGgp6
         WYyFRqwgz2rvRVbLaSVKIQJ5T2muJVfz9ZDNdKvMdFM6Z5HTgGfmI8/vwDOveeKRbWPM
         yBIv9gKhry5tRX6G1mtnOnJOZ/qM9NQ0yOp728JsKOaAp/hlf/PsvTiJF8szC++VXN/N
         yOAc3Y2Bs3VHWgkdKj+GttEe6xD2Bq7CJMBWnMf0PEKRpA35j2p6A0UQBaDCqFQZuUb5
         MiIHMmX8KNJl6wCFPG5OVwZt8N0J2Wy+TBADO9SfPaHGnakYaYrwbMb+5nnbuaHFXJs9
         gQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        fh=A3hQTXOTnuxenpyex1pNA7Y+MS0xBQgWT0Z2nzEit1c=;
        b=hmPEF9D7x1vUVy4t8GScjlbL9iDO9V8yTPeGQM127y0m+ioB30FRo4DU48ntpQZJ7G
         sQ+o6F/w/nThYeGrNaNp0PhUNt06iendzilXM1eTIK/oU6LA0hhWmOj5rtCWQEDmH0Qi
         x8ChLhZ/zGecRezv8LPAgQbsLdJ1b4153GBCy/HsR4xZjvefzRV91e5RmRJ9RseNH/Nj
         ja7i21e1K5Nyh4+XagtkpZ402a5eBOD0+C0BU7NZ3m/CsLzzycdBRqi/OTm7mmgPK1pP
         bJEBEufdAyKJULD/ffVO66FcsTb/5INTRopRZBZhMkUrz805VSgKomVmwsH5Ati7dmBd
         K3hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794948840; x=1795553640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        b=LslQjUmgXp7ppoB5z9C6lIh34ojfvcQ8nzfZ/Bus0FFDGG0DUi+QbKakM0fZFVIykq
         5mE0e/s/CpUqdx5hmSPPf4ZqfdbbG/4eR1cdypM9sQ7xLq3NiWuooniPj3c+oOnP/Gs/
         9eulqTIqNDLgU092uHWrXSQFQOUQ0Ybq8I+KARDSFo99l3A76mmdMOP5EIWjKF4SsU8k
         CLRnBvH95KDC8joQwrmPsfza+TxJts5K4ekF1BkXcERhq9o5i5YAd+8YKoGtExZnN7ex
         +BuNP6j+NU8hBGd6crUPCUF5Rx+iT4Q8fvcxMfppbSleGXT6F0Sca+oO5jRTOaHafzSk
         UZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948840; x=1795553640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        b=cdoRMNk8H7/Tuacx/yK+gV4BpPkh2tVurjj226d3uKueDY7GoPHzBq3XDX40sYptsx
         vdr38q+WNOgIPmdUvQiWWy2kpa7PBBiPh2k+7fxKMZrdKaRgoFAx2zX+ZQlWAcWbIvAu
         tfe1d9usDUxEYi47W02XyGJmDBKwbzSAz1K0TcWZa2L+j0YB09AlnWJiDAdsoJ4JUZVm
         5UuPX78mDYd3Om+9OSGbxgkjdML2DTLc/zt+zYBjpc85C//V4xYFYVPsS3hvpHmn1kHZ
         XpaqZBgxJ2VwXc/0/5Vmiv81NPiwzxL2L2v9Oc0ulVK3Udon4rVdQKnM5h9CLKfN36Sa
         2bJg==
X-Forwarded-Encrypted: i=1; AL+hErH4ZUSZYAC+Ef7tvNvn9y4+qPRac2oR6+TlzZboRxF9/IxnxM45j2Chx58jG/et4mvYLxFIC1p3Eq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z++N+tlWE7/q+b7MOzYOubVYf5pk6KUrzNYi1UXTneFKs4D2+
	R2iiDeSNiBJsrdRzrZd2NlmOCC/31XxwFoA08g8w/rJYi8Uai2WxK0SWk2RZEDGmUxI+YEAXEsk
	0N7A3qsUiLVOi9dKbMWV/9krErGlAiRucZZwYmMML
X-Gm-Gg: AYBFou1wm0zYIaZ/q4XwqtYKw37tceaxjDPTKQqpXgSgwSYvqlfejQJNMugmkPSNrGU
	tWEUpNWxf4EY5UB3e4YvH3Qtsh4JwS+ExAnti7uQPBU8jpOOgxJZCFxzxdneteoGdUTzBLqHSMq
	ur38yT+ibw1eEkTwDzOINga28VvcRF4xgMzuTrqS3O6AVLzlHUUCd9OaXH0oBIoWpRPn8dilY59
	z63kqZL9EAbLdxGzVLmHeojzGTWBWqm6NNIotTxHy7gXkemeVGxmfnCjDCxeSyZ6laPWjQ+hcW2
	zeIycelQSpRPFSIXmWrPzQZn43Jj/sqvl7o60mJU3Woh9VHbb6kp3eHNDDuv5sf70PwyLZz0Fb5
	GYj7ZoWPaKW2Kc+UJCeVJQLFcEiLYkctFeQ==
X-Received: by 2002:a05:6512:224e:b0:5bf:b96b:89f4 with SMTP id
 2adb3069b0e04-5c1a0f1b8e2mr1319677e87.19.1794948840370; Tue, 17 Nov 2026
 12:54:00 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org> <20261117050841.3289652-8-jarkko@kernel.org>
 <CALCETrWtbUFQGDOCHkxAN9O4i29ixfL5KKF1Cqw2-CjxKwC6gQ@mail.gmail.com> <avyzFnKQrNOid25y@kernel.org>
In-Reply-To: <avyzFnKQrNOid25y@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 12:53:48 -0800
X-Gm-Features: Aa3M54qx88-je4c1jdCxPXUBmX_p3qTxglmaltFgKplV78kiTxOHsj4XFF6xQaI
Message-ID: <CALCETrWHxjrQvRC66d1fvkZw1e8_+38BdzmjSYHmqRjXZnD8nw@mail.gmail.com>
Subject: Re: [RFC PATCH 07/13] rootns: Add rootns_enter() system call
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:03=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org=
> wrote:
>
> On Tue, Nov 17, 2026 at 09:42:26AM -0800, Andy Lutomirski wrote:
> > On Mon, Nov 16, 2026 at 9:09=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.=
org> wrote:
> > >
> > > Multithreaded userspace daemons cannot call setns(CLONE_NEWUSER) or
> > > safely mutate process-wide filesystem state in place before spawning =
a
> > > child into a target namespace set.
> > >
> > > Add the rootns_enter() system call to fork a child process directly i=
nto
> > > a rootns whose root mount has been installed. Transition the rootns f=
rom
> > > ROOTNS_READY through ROOTNS_FORKING to ROOTNS_RUNNING for the first
> > > process so it becomes PID 1, serialize concurrent entrants on waitq
> > > until bootstrap resolves, and admit subsequent callers into the runni=
ng
> > > PID namespace until teardown begins.
> > >
> > > Require CAP_SYS_ADMIN in the target user namespace, forbid credential=
 or
> > > PR_SET_NO_NEW_PRIVS privilege escalation
> >
> > Why are you disallowing this if no_new_privs?
>
> For no any good reason at all apparently: no_new_privs is inherited by
> the child and only restricts privilege gain across execve(), whereas
> user_namespace transitions are allowed under it.
>
> So yeah, it's a spurious check, and thus I'll drop it.
>
> > This isn't necessarily a showstopper, but fork() is really quite slow
> > in many cases.  It would be nice to have a more spawn-like API
> > available.  I assume it's possible to open a file in the target's
> > mountns by some sane API even without entering that mountns, as a side
> > effect of how the fsopen / move_mount mechanism works.
>
>
> If the caller retains the O_PATH fd returned by fsmount() for "/", it is
> able to open files inside the target mount tree via openat2(...,
> RESOLVE_IN_ROOT) w/o entering the mount namespace, and pass the
> resulting fd to execveat().
>
> For avoiding full fork(), there are (at least) two options:
>
> 1. A rootns flag in clone3() (e.g., CLONE_INTO_ROOTNS) and a rootns fd
>    in struct clone_args (disallowing incompatible CLONE_NEW*, CLONE_FS,
>    CLONE_THREAD, ...), and callers can pair it with CLONE_VM | CLONE_VFOR=
K.
> 2. A flags parameter in rootns_enter() (e.g., ROOTNS_ENTER_VFORK), which
>    would map directly to CLONE_VM | CLONE_VFORK.

There's also been some work on using a pidfd-like object to build and
spawn a subprocess.  Supporting that would make sense, but I don't
know to what extent these projects should block each other.

--=20
Andy Lutomirski
AMA Capital Management, LLC
