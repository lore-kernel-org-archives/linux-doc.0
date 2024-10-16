Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812E2076DA
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085743; cv=none; b=siPvMPoqm5wCp+kirn9STU20Tv6wwqwGXddjmv2Oijw1tOH4HMbykZCfaJXUmbhA/bhse2JvSSYfGplSJgiu6eyk9nF9w1m0XyNakn7oAxk7uCDtBzo/SA41wsRFoaqVcT/EGECGUmoei8lk06nXl7g4I9JuWP4QGB9JmGhlc/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085743; c=relaxed/simple;
	bh=W7igrC/eK2v9PvQJY3vqt5RVCwQ9nvtig+iwdm+6N48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cmr1xN+j05jPGZ6lwl/gmU4+n9mCVBznNaeJYdno1hHv19UtPzvgR1pORApwaGENj7wBFUgAuL9oH7jdhn3I+uaHGKNdUKI702pgJVEM41Au2yl08BsVUq55bz5FcPUHd84QU/ZsKmXFcYkz3RuQfndtCuZI7m6a5vpmS/4vLfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nB8SeYFY; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nB8SeYFY"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-717fe2a7c6dso786124a34.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729085740; x=1729690540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGFMMPXEklcwVgl1501lsYrVn6gGilFzAu+XllYmFno=;
        b=nB8SeYFYJUenPLbOqgQGE6STzfvRJNQeM8oj0Ttsle20JzbLVSIuAThnro+rPaPypn
         S7OLC1x/iT3oTZkLT8sMCeru47U19/iMI0TxNWp/iiUheJqAMvlyviG76i3e8D0eknoN
         fiVS/iJKNfpGEHQsMZ20ADqWWNd/QpeLWZfDi9GGIjKtXfOIWzHSHg1brOoml67Y2GmB
         sKaCGT79ffDgQL9Vzw5dUOHw75kOKKAGA2mSys8GmWWw2NGzBQds8yzTETcIgAkUkg/8
         ij8lP7tLezTuFu2M18kMvJKVLfluAUMYmzoDn1jp5DDnnYgv+/9r1nXS3KYdZrVNeZfb
         GBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085740; x=1729690540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGFMMPXEklcwVgl1501lsYrVn6gGilFzAu+XllYmFno=;
        b=Hh7JeXcb24YG4LaajDQcSBI9BZ0+lAKSUDDOLmnBbj6SjvxP1KEGCOSOUbA0nlHpB4
         FlCu783NDlqhyffnREPS6+RCcC1rHX7NGD4SOyD6PIStzPjgTvP9z/LuKhrgGpAvudja
         2DP5Mn4QS+5Bs+YN8B6Mo8Lz4l9FAXVubMS6ATYIT3qiK/z2k3QuZKxassJNt38RkFY2
         oC9KDMiTsjnq43CTk7zo2/YmDFFHFkjxv7xyhSdPcLg5zswDxewdzlaK7JxytXj2Zb0R
         O3fsJClt0io7la0e0G83vCwdro5IK9V/Ns05L+6+28dyZpwmuHwoSNJW6+ZaHQZ/Wle1
         zmyg==
X-Forwarded-Encrypted: i=1; AJvYcCXE9oMf9poNzjAfd1pYcq6hlkWiBLwkWmS1XMzFmbNrl0PxtbFACvGo6NldWRczCPsWEfpyj+rLZWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTNxCIeNNDZhg07btr+x5U8GO46DjpLeE8dVaBTzxXcvopr2K
	RiM+NnZH7IajHK1iUZ1VmscyY+fvArmTYj7UTYj/WYBDtZcz32CGnbKAOx+ETV84yyMyDYZ5IjX
	1/KQU3/gBifdxIfMATlOJ6p0JusacOQr6WE/e
X-Google-Smtp-Source: AGHT+IEo2nUPwW3QYnS5NjXSEN6olMWQdzd+0ZaH/E4OSj3fWe9ng8TxJ6S34oZl/m/kvu2FLQCs6M+Xsq0azbm+z1E=
X-Received: by 2002:a05:6808:1905:b0:3e0:6864:52d5 with SMTP id
 5614622812f47-3e5f02584d7mr3874075b6e.27.1729085739815; Wed, 16 Oct 2024
 06:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015140159.8082-1-tttturtleruss@hust.edu.cn>
 <CAD-N9QWdqPaZSh=Xi_CWcKyNmxCS0WOteAtRvwHLZf16fab3eQ@mail.gmail.com>
 <CANpmjNOg=+Y-E0ozJbOoxOzOcayYnZkC0JGtuz4AOQQNmjSUuQ@mail.gmail.com> <c19c79ea-a535-48da-8f13-ae0ff135bbbe@stanley.mountain>
In-Reply-To: <c19c79ea-a535-48da-8f13-ae0ff135bbbe@stanley.mountain>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 16 Oct 2024 15:34:58 +0200
Message-ID: <CAG_fn=UZwpvANRFqgXX+RA3ZO_KLAcQFs0kjeim0Y75GoAgJ8g@mail.gmail.com>
Subject: Re: [PATCH] docs/dev-tools: fix a typo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Marco Elver <elver@google.com>, Dongliang Mu <mudongliangabcd@gmail.com>, 
	Haoyang Liu <tttturtleruss@hust.edu.cn>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, hust-os-kernel-patches@googlegroups.com, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:30=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Oct 15, 2024 at 04:32:27PM +0200, 'Marco Elver' via HUST OS Kerne=
l Contribution wrote:
> > On Tue, 15 Oct 2024 at 16:11, Dongliang Mu <mudongliangabcd@gmail.com> =
wrote:
> > >
> > > On Tue, Oct 15, 2024 at 10:09=E2=80=AFPM Haoyang Liu <tttturtleruss@h=
ust.edu.cn> wrote:
> > > >
> > > > fix a typo in dev-tools/kmsan.rst
> > > >
> > > > Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
> > > > ---
> > > >  Documentation/dev-tools/kmsan.rst | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-=
tools/kmsan.rst
> > > > index 6a48d96c5c85..0dc668b183f6 100644
> > > > --- a/Documentation/dev-tools/kmsan.rst
> > > > +++ b/Documentation/dev-tools/kmsan.rst
> > > > @@ -133,7 +133,7 @@ KMSAN shadow memory
> > > >  -------------------
> > > >
> > > >  KMSAN associates a metadata byte (also called shadow byte) with ev=
ery byte of
> > > > -kernel memory. A bit in the shadow byte is set iff the correspondi=
ng bit of the
> > > > +kernel memory. A bit in the shadow byte is set if the correspondin=
g bit of the
> > >
> > > This is not a typo. iff is if and only if
> >
> > +1
> >
> > https://en.wikipedia.org/wiki/If_and_only_if
> >
>
> Does "iff" really add anything over regular "if"?  I would have thought t=
he
> "only if" could be assumed in this case.  Or if it's really necessary the=
n we
> could spell it out.

I think you are actually right, "if" should be just as fine in this case.

> regards,
> dan carpenter
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
