Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189043CEC1
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 21:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460453; cv=pass; b=J+eGRdhtAYHNhXUbuVldQ+Lfop1Uf1KEc6gWGYXV7Nze9gToKD24w1X0W6RErgkAL7zVzk4QEAZpGWKXImCKQa0f5H3nLgXdzoj79n1Li8DtefkajqkrLNN55RDVBu4z2vPLVwn1eruVwPSQIDI+CrJy9oU1yeDgv4339FBv9GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460453; c=relaxed/simple;
	bh=7s0j3gs1q8B0kvELXLVyzmwUipBlWc1iwp8X7x5EAP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDDoHmGQRaUQ+f5dH3qavJgyXwR58d6HlcLY6fmPaY8yBgo+2hcLWN4z9VikHhW4VuEhCJA5Qw41J+3AOPgk51qCt1fISvB0nec61Ibu/1wABxNgyCJx4WSaixdpvxbkIdk769ButS6CVdCobyPoawT8ImT74TRnSYPYgnzZ9eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bj1ouXvi; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bj1ouXvi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-470174001a0so19973f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 14:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783460450; cv=none;
        d=google.com; s=arc-20260327;
        b=EnDagrDBJKrdVyPj6DwL6fMDSJtmk8kJCXaVfpVAB5J0ugHigxgdI1Ju9oIbnXf9ra
         iYSnWztDljtlOdfwQ3NRjpMLcikYUyMZfR1iOO9xsOEyRtDJF4q3WRz2qBkehWXLXcao
         zPardtPd0MXAUBWg1dnQ7OUUn/FIAz7PgMBFV4fs86b5x+Lt3oTNm6gRcp7MyqUhixPT
         /nodYBXC8MLwZ7fK6jeU5WxUcefLaf7VdthZuGE94Rd8YvZ0Dn/lrcF8LdT3yF/ExhzC
         VrRivmWrWZcTKNqP2Ujry0vKHugVELIk/mwdhItyCdekmT3blf0MhesH0CuPmRzT4cqR
         ZkHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+Ok+D3VRtxGi9vtZTj6D7dsuUylLhpT+aE8x8yKCk0=;
        fh=u04opBOqSX+x9Rg5zOJGqSTDKcyy7XEDdQYnb/yPV/c=;
        b=OmFrnVbZT4Kn3Q1Ta365GzqRZv4HbVu4CNw/Oo1HuXdHGTn687ppfKnH4vvNz4B5T7
         NsrQVUUjQ2M3NlanVJ5Vke/Eo7JuyzqNs73LD6ghpWnxfPn4OmlQRIOB4hzXLHFYAgLe
         iBCGeqz3oj2Hh4ggaAV2tU81l8FfGXapOUPwAsIAapQriMZYJx2Nn3XzbWg+UHGGpKHt
         30GFTgEo/mgovEQ7NYjC5fxIeVObmnnjJqLRklw10XKe5lzkxCprhqVNjEDPvS3J7JRD
         fIa9FNVyr30ScNfjqlmWMrojyNDmQo95+woLn8fXUAmqgqz04PUapnfV44c3+GwpRH9h
         zefQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783460450; x=1784065250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+Ok+D3VRtxGi9vtZTj6D7dsuUylLhpT+aE8x8yKCk0=;
        b=Bj1ouXviKQhPARvNlmOCUKPFeBmCZEQqS0tNDUQN0HhxTuVwDlMO74CRcXdCdgLSRN
         9m06Z+e5fs2pCv45gZpKuzTTUZpp2KQb//dQpAXslcelr6dfoxZBCE+kAqxBpspnXfuR
         4iA9YRsIhhKTXpZFKrzQeNvg396CTpg7WmKglmhlchrzq+tIss3NNA/ET6SUpke/UXlp
         RHEA9u1rlS759AyKjMjLjyguXYll5fANIswitRM/wSlLLDBMxNQlFBneoh+2ihYe2brN
         tQIyge8+e5wfDaZ9Wwc6GufDCkQzngxli57QPQL78gGmOqxOTCbkPYkcPXaLlYxfq5en
         XfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783460450; x=1784065250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+Ok+D3VRtxGi9vtZTj6D7dsuUylLhpT+aE8x8yKCk0=;
        b=K0VqiyvinEz+RaR/JzWb81UtV30ML9TfTYedZhqZrVdmZzI2QQfMaAsDGaITNMLMgn
         epyb0rJvEs5qGPRT0sYRoWNQcmPESDiCyj6AGpKFmSEjAVR48dfEymy7kiwEG0a+4RIb
         hHXRxeV/1bAINkpf1GW3UGYWaeDJx5SwYrR9jsOim8DUMpvsz3s3wWmRLRtXGjRg79jU
         hCWEVmRrWX01wIF6KUUJDSXDaq3RFaYZKiVMgR8t1oodHE2AAtinU/CLTnqYCzE9cyOH
         dtEeso/vMw6w068LBHIS+IhhXzvT3ZSeL/qoNbm3waUq8yjZ1YhB7rZ8rx/xPxK6uDXb
         SGHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsigLqs4bb3/RORTEQW2PJcLofda7BK3ghqMriXKQHjCcZi+vaYVEZATF2CaJ1mHM1xkLzKOvzCws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2L5kX1nh8AbcyxqMSaYsdsMmA6GcIL2EAj+iZmz1ipvkyPmbU
	xW7J2SLqDym+FcjMeZ4vmIb5jbdssqVKakUIb8k2wpaYAWXUennEHQFqpKDYW9OQUQap5GtH4RF
	1dVU41SJF9cjd79wBqTL0tEGSH4nXxVtYrR4mTiCN
X-Gm-Gg: AfdE7cmW+zN9EC1ZqUa9L7UcIvbmxVUIqPMTgCxXrks8NIBaBbTVc9n1+P49uzZkzDQ
	7IBQrT3+vkyO7wCkBQut47mWVz9PXALVWXEIg7PnAce8rSIHS99TUR3+tkU2ul5JVwo+A75vNBs
	dPwr1MmR5MqBWhA1yHRWU5WaSsmoy+mM+pLkQU8Ugo9CuZIeS5gfO4BZi0wVgayvTKkSuCY7+58
	Y3EVSeEYOCvgjWN/ZKVoYtqKMyGr/+9gUAaOjXIhiMjCBf6GYMLjouiJwD7GtLjyzyivUmgx35y
	MlHfAWVfCoeyNsOR7MS/lWz+ZR8=
X-Received: by 2002:a5d:4207:0:b0:475:f0f0:9ecf with SMTP id
 ffacd0b85a97d-47de6723eeamr6198466f8f.58.1783460449777; Tue, 07 Jul 2026
 14:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-remove-task-euid-v5-1-c90c7e2ddf54@google.com> <c49545c6c69225bbc7e93cac58d58cd3@paul-moore.com>
In-Reply-To: <c49545c6c69225bbc7e93cac58d58cd3@paul-moore.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 23:40:37 +0200
X-Gm-Features: AVVi8CfXuyQpigqlnMZkCqwD23ax4BF_tMVmnmNSZP3qMxiXiu7h20uznVvLHgE
Message-ID: <CAH5fLgif5aEVPeD+-jq3e73OVX0uzcEYwggMyF5v_DbZ=3f_Og@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: task: clarify comments on task UID accessors
To: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 9:10=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Jul  3, 2026 Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > Linux has separate subjective and objective task credentials, see the
> > comment above `struct cred`. Clarify which accessor functions operate o=
n
> > which set of credentials.
> >
> > Also document that Task::euid() is a very weird operation. You can see =
how
> > weird it is by grepping for task_euid() in the history - binder was its
> > only user. Task::euid() obtains the objective effective UID - it looks
> > at the credentials of the task for purposes of acting on it as an
> > object, but then accesses the effective UID (which the credentials.7 ma=
n
> > page describes as "[...] used by the kernel to determine the permission=
s
> > that the process will have when accessing shared resources [...]").
> >
> > For context:
> > Arguably, binder's use of task_euid() is a theoretical security problem=
,
> > which only has no impact on Android because Android has no setuid binar=
ies
> > executable by apps.
> > commit 29bc22ac5e5b ("binder: use euid from cred instead of using task"=
)
> > originally fixed that by removing that only user of task_euid(), but th=
e
> > fix got reverted in commit c21a80ca0684 ("binder: fix test regression
> > due to sender_euid change") because some Android test started failing.
> > It was since fixed again by commit 65b672152289 ("binder: use
> > current_euid() for transaction sender identity"), which uses
> > current_euid() instead.
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Originally sent as:
> > https://lore.kernel.org/r/20260212-rust-uid-v1-1-deff4214c766@google.co=
m
> > ---
> >  rust/kernel/task.rs | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
>
> Merged into lsm/dev, thanks!

Thanks!
