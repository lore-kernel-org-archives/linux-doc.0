Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD403D9DB2
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502701; cv=pass; b=Hqy6j/q3ZaEtIsfbQPw1CX6Sm3fA14UPrdI1+vA27iAm+DqUofo1OCan8RRxaQl4SjYQk2oRW9lgUQBuJwsfyNk12DtFOSY9Wzi6iH6823tCRaITT7DAODsjqqDYUkbGpb+LuXvJlTN5rISSHNCsIt0GUCmxt+WeoYdAUOaS09I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502701; c=relaxed/simple;
	bh=KdK+HJPfqWh89Zp4ToM1VwC3m/NfENtvgJL4u0B4uXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJMmuNILgtLV/kKT9TdBsB/fpUVgnKMYEmSJtUCNYl04IN8TtdIIPsn6DL3n2u72UHd2HV6SGq71AS6Ul20HVP750ERrPD+cguaSPgPFHz09RcEvYie/LAzcnFDy00Xdu5t4i428JE55zH/W59PsUAcqe+63Ogt/B3n8OKQ5oFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bEq5JVUy; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bEq5JVUy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so5132515ad.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 09:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780502700; cv=none;
        d=google.com; s=arc-20240605;
        b=L2vfPBC66b1RoKLC+lyA0tdQ3COejOKjplkXsgGycsx+d4w3Two3dWKVjpKyP9uJ0w
         3m9WfY5XI9VQWrS/gujN/ba6IqM50WSMqVIIBBT1O7Ds/0FQCkCKjYsSQtnxdECmCVSE
         p8m5/bIuh0hVDl5uYEEnruvA91JyP2/zS16BM8yQ3ap5uywBc6fgsa51NaiSK72yEUAr
         jlznk2nGTJIr/uFD0I8359Q8EZfp4aMF4R5GSAe3WYYrrVV4fLMKmi8XbnXyCMjo4uI+
         Hh339Bkuz6EYcEgAceM1s5tPuH9E7aUZTkjLq3qeySEeI/TPtfEBooTIly1pwtKWewN8
         rEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RJiwIu7uyZAaPlamCdTOHC+XlHLfDNYUsMpOrpvH7ck=;
        fh=4ti31UEjSOtPAbtDC1OCsfm68SYyNAly7gCXPUJtKhE=;
        b=PF4hY7R+KCiejhAnVYvG1XdxWE0EiKCfQaHcJMrx3jIsdTtMJoJN2eci/c2w0O5cUe
         8iwki9T0CNO5qOOhJyPEROy/trsYv61d7SOEW0qti5dlrTecic6yiw0/hEQ6bbVwCOCg
         bLNZ58+YKy5qJ+xYHf56HWTZ3vaH2te9ReVD94NmWfrUDaIac5GVa3ehrTOyplviY2kj
         2n5HSfuXGRA+qQ5f1BQ03ZO3QKwPG9sNJhNj+D/yqQ7RDA4Il3t7TH+P5YvUr7vawnzq
         /O9OWQltyqLawoiXjcShJNzvkBQtiIEQ5b7Gz1aRarSYiGAbaZ7KrMgnTN55+Q+qWBRr
         kHZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780502700; x=1781107500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJiwIu7uyZAaPlamCdTOHC+XlHLfDNYUsMpOrpvH7ck=;
        b=bEq5JVUyik36GznJczEmGp/zvq4S+t4sSQGOdFrNgHDAND8PfN9Jy6RKIG6djwP2V1
         JqQV+TZNTTRJ1oNo1sO3ehK+qWCOk8sj61muK9fh4S3QqbpUJf9exaTJaxa3a1BaJeua
         2vqdWL1JblHn6H8rkvvntMOZ7R5BhjjWC5/ckDpvAaI5T9wmazv0lsk3iLkFPFbqdsBc
         pFP/yTbjeEH7SXox3KDwLwKPJbuciNM2Hviy6PI2pk9VYcY+l6vKNgXPOQd4uZDvBkMb
         gXotbk0hlQl6WGbIgxZ7J4ZIUNRGAV8CX+YPsr0oiqF6Ih8e923eCXrZl4RjD4ETaD0X
         zstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780502700; x=1781107500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJiwIu7uyZAaPlamCdTOHC+XlHLfDNYUsMpOrpvH7ck=;
        b=NH3kc23fqFe1LeV4KVEvuS7fdqhNrOk/bfwoGV0H7WGSV0F+Fg4fvQS3Ny9RN6PxUQ
         ghJZ1rhiesMNCFszV90rFrr27+Bk0znCg2cgYSiXnp7tZUUcrWM62aP3a/9nzt40pU2W
         xTnry6DEyCcsFbvn/Eu/taPeLvE7tMNBlTj1lDAFU5VPWT4NLTkuV9/KgWZ53NQk6lI4
         QIbwcjEL6ASs5dY/XFxV0BkSM4sFWOG5N16E5k0zRkuPaeluW4f47tzKjtp4CPtUJkks
         hplJS6AZmuOTyeR5IzKmZDA2g5HK+gq53di21XYAaXU7BaY6cyn53K+fVuNrVT4k/xXD
         OTPA==
X-Forwarded-Encrypted: i=1; AFNElJ+QkEy8qlw0mevwqSqXtbuK6m5XmxfWp3PIzBQ0KmnvOuW/uCjwc2wqoxPVsWAYh+o/EO14ucN9rvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQgIxQ/LffLL0bwubbSKp2kSNxsMF4uHRGjj7IkpY2p4Mgkda
	gQhPLJLVXUZzU8Io69dW488FZ3PkXPEX1tTb/eANjjWNdLdVwb2VPu7SJaz93dRiRrK92PS8QR6
	OeXCVv6wdVdIDLfzvjWuAhYZPDkj1UCBvRY37Ydz1
X-Gm-Gg: Acq92OGS4i/VNUsw5PJ5D34eQw9XWCe70MbQ/epxogVIwvUjUMSWXQSznq5bxi7zCHV
	5iRO1u9YcbF8h9fELK5c84Uu9JGJHQVNAp+TK8hB07rCxlqU84SYr1Bt66Unr1phqZEM+imFUvn
	f4/Gj6tvR++LoEVRNjajb28XuvqMSU1JZB0Upfge85jMkJw9fI48JhmwTYpH/Pzj2t+nnJ84xjC
	MipoNeQ1uKBhElC+jIlr47MJrEP2gOjPTyFm91Dp51Dcs1dkkH94p98d8qGsjPOrx/l5kGI/eYX
	gMAYGKeVEOm7gpeOmQ==
X-Received: by 2002:a17:903:2352:b0:2bf:361e:3edc with SMTP id
 d9443c01a7336-2c197a1e664mr634245ad.2.1780502699785; Wed, 03 Jun 2026
 09:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
 <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com> <ah51DY5yfaNZejBd@google.com>
In-Reply-To: <ah51DY5yfaNZejBd@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 3 Jun 2026 12:04:47 -0400
X-Gm-Features: AVHnY4Il2nbhkxMxu_bFZ4TFGt7Ipvw1ewyd2x_7Gw2WYSaTiJOB7iM0xVPzXF4
Message-ID: <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
To: Alice Ryhl <aliceryhl@google.com>
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

On Tue, Jun 2, 2026 at 2:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> On Mon, Jun 01, 2026 at 07:13:37PM -0400, Paul Moore wrote:
> > On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > The task_euid() method is a very weird method, and Binder was the onl=
y
> > > user. As of commit 65b672152289 ("binder: use current_euid() for
> > > transaction sender identity") Binder doesn't use task_euid() anymore,
> > > so we can delete this method.
> >
> > Given the problems from last time, it seems like it might be prudent
> > to let the commit have some time to "breathe" in a proper release, I'd
> > suggest merging this not for the upcoming v7.2 merge window but
> > instead waiting for v7.3.
>
> Sure, that makes sense. I'll resend after the merge window.

No need to resend if there are no changes (see below), it's in
patchwork and I'm tracking it so you're all set.  I'll send another
notice when I merge it.

> > > My suggestion would be to merge this through the LSM tree.
> >
> > That's fine with me.  I'd also suggest updating the commit description
> > in patch 1/2 to indicate that binder is no longer using task_euid();
> > it currently reads like it is still being used.
>
> I guess this occurred because when patch 1 was written, it really *was*
> still being used.

Yeah, I understand the world has changed since patch 1/2 was written,
which is okay, we just need to update the commit description ... which
should be a trivial task.

> Perhaps we could pick up only patch 1 now since even
> if we run into problems and Binder has to go back to using task_euid(),
> clarifying the docs is still useful.

I assumed that was one of the reasons for splitting the changes across
two patches (reverting patch 2/2 leaves patch 1/2 intact).
Regardless, we're at -rc6 and with patch 1/2 being purely a comment
update I don't see an urgent rush on this, especially considering that
if I did pick it up now, it would be for the v7.2 merge window and the
binder/current_euid() change will ship in v7.1.

Let's update the commit description - you've got a couple of weeks to
do that - and then we'll merge everything once the v7.2 merge window
closes.

--=20
paul-moore.com
