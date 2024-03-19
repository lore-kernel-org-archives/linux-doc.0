Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A3924B33
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710862239; cv=none; b=uKcutNc4BnpoV0qYCaR6jZetA61A5dWVNfgTEHPIfnG0L2iTKYNViMp0xTK3SnCEbyCMTnOVboxvyTu0JS7NDf/T5YjRzLEjGkZhYyUyb88dhJ6wT94eK0WTjjOd93DSIZSpkKG0T/lHJwkcdl0u0ZXJ0V5lrxmShizn2Spduyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710862239; c=relaxed/simple;
	bh=4B3xln2Vilw3Up5EDY5GuSJiTKJCyHhkajdj0ewASMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpmLhcjjodA86zMrWkw4Omrhw/pkzRkdB95XOG/c/K30QkMXMgOat1OCZ6B48rsyOcjiQcCSVcklfL8+frdikmSv7SdATqOVgd8qKQ2t5AGiYSz18V0Tr1WRUDGhlQgGn8bTUg4HeVnuvoD7276kepURNkt6u3HXfkVe6oRUhGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKcTXSlE; arc=none smtp.client-ip=209.85.219.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKcTXSlE"
Received: by mail-yb1-f194.google.com with SMTP id 3f1490d57ef6-dcc73148611so6092114276.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710862236; x=1711467036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcZELhaULYART7cfiifm2vpYkO3uc7sefthUzpAuzmc=;
        b=YKcTXSlE77PoyT3O3oLkQbKyHST2CdGO3MIPUsPDbVkK7rLu+vKGURBERKHAFZSex2
         hb1s94S8KF/eYni6MOyQ9l+/wPXI3C9kBh3w9s+B1DXw9gpUL3EeU78n52/K+b/+isUE
         /w2jecRFq963nD8QNLft7CS5hq3Mfn2DpVDxSoi14ziCR5IaH3uQi+8vBp6eslHr5IUG
         ILIuPfm2vCYDPAB0AWxn3fz084vOsyewz8ccrwOEYyDy1tqNWR6T08R+V/0B+DUi9V2Q
         2ZvWMkc/9pGjecD1oJ8LD6EARMB3RAQZ+OeVrz4IXeRtySa4t+CmsDgELawhWX1LvyiM
         2fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710862236; x=1711467036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcZELhaULYART7cfiifm2vpYkO3uc7sefthUzpAuzmc=;
        b=XuZLsoJIe6HM3vRpSMBSjhpdiVI035zSPRRLEN883dOnfqMMghwttHVb4s03QRgjM0
         7wBtByDVkKcsWH0PgBsObtVy6e2TIrgv1JZNL8TtJ6wsGnQknKXBPxXmS8v97ZmZ51ot
         lLJTv9BfwwJGkMtm+2o/e8SaalSnTvQewAVN2aRBkqQZD8CQV28IwoElaBvT//uXgJ0c
         xXHo8xpowgaHrpupvAwHwSwL+sSFRpyYvCZbEYwMt6W+0/3H33LwJIMpuGFNqpAOa4Qd
         dWUTrXbAyKmieAiavUeY8Z5usJZdLHZ3qrblxTgbNr48CqLHt6UEMPQa7Xf7rLlbsz4C
         NZZA==
X-Forwarded-Encrypted: i=1; AJvYcCVVkIio0+f8oXDuOLhW2nRDFCrdyVfGPNEi5a5GYJ3XujG78bWde/acqNSbekIHtYJQXa7lY186BE+jd4JBXpq6I5/4rr5dPN1t
X-Gm-Message-State: AOJu0YzD09Xhi/vduLKXGzdUDrJS81mSP4pC9wqXisp6aB1uv/ve3J5e
	FqYGyhE4sC5spd33XPoO0jJqu6Vd1JfbyiU9IsUqvNDr7/FtuJrlbUjSomU3dQHEiqLTsC5V4sz
	yhPzXVfQKSBqerjz4LcLPsPwCvxY=
X-Google-Smtp-Source: AGHT+IEF9dIS0EB4X0qFTj7djE4LVoDOKgSyFuf0uJYeJaZcP42oaL10lU6ikyhH3a3xHXyTa6a4t8QVP4cCGwnYj88=
X-Received: by 2002:a05:6902:220f:b0:dd1:3421:b3ea with SMTP id
 dm15-20020a056902220f00b00dd13421b3eamr15945204ybb.21.1710862236637; Tue, 19
 Mar 2024 08:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHAQYrN7_0+gi2p=fYPpHHMdOk2jwx9cX+nbovynphU8zSAZ5Q@mail.gmail.com>
 <2ca49f75-6ca6-4006-a332-554aa85399e2@infradead.org>
In-Reply-To: <2ca49f75-6ca6-4006-a332-554aa85399e2@infradead.org>
From: Linem Davton <linemdavton@gmail.com>
Date: Tue, 19 Mar 2024 16:30:25 +0100
Message-ID: <CAHAQYrMc2c6aQH3fuhHY2zkjd6b0oUHr5O7ykRHFkzFwDivT4w@mail.gmail.com>
Subject: Re: Document Patch
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Randy,
> Please send patches inline instead of as an attachment.
Since you are using gmail (which mangles inline text, ugh), you will
probably need to use
'git send-email'.

Thanks for the info.

>Regarding the patch contents:
>The master list of over lists and how to subscribe/unsubscribe them is at
>https://vger.kernel.org
>which redirects to the URL to that used:
 >https://subspace.kernel.org/vger.kernel.org.html

The https://vger.kernel.org leads nowhere, since the site is HTTP only
and the modern browser doesn't redirect you, some clients have "https"
only enabled which does not even allow the HTTP://vger.kernel.org.
Thus I decided to add
"https://subspace.kernel.org/vger.kernel.org.html", as it works and
has a better use experience as what users see is what they get.
One question - Does no team use trivial@kernel.org, or is it just the
documentation team? If so, I will patch the corresponding document.

Signed-off-by: Linem Davton <linemdavton@gmail.com>
---
 Documentation/process/2.Process.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/2.Process.rst
b/Documentation/process/2.Process.rst
index 613a01da4717..8d8fff825590 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -397,6 +397,11 @@ be found at:

  http://vger.kernel.org/vger-lists.html

+To subscribe or unsubscribe to lists, please visit:
+
+  https://subspace.kernel.org/vger.kernel.org.html
+
+and use the "sub/unsub" links next to the list you want.
 There are lists hosted elsewhere, though; a number of them are at
 redhat.com/mailman/listinfo.

--=20
2.40.1

On Tue, Mar 19, 2024 at 4:08=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
>
> On 3/19/24 05:11, Linem Davton wrote:
> > Added mailing list link - https://subspace.kernel.org/lists.linux.dev.h=
tml <https://subspace.kernel.org/lists.linux.dev.html>
> >
> > 2. Process.rst lists - http://vger.kernel.org/vger-lists.html <http://v=
ger.kernel.org/vger-lists.html>, but the subscribe button on this uses olde=
r system i.e Majordomo.
> >
> > Chapter 2 of "A guide to the Kernel Development Process" now has the su=
sbspace link mentioned above and users are encouraged to subscribe via this=
 link.
>
>
> Please send patches inline instead of as an attachment.
> Since you are using gmail (which mangles inline text, ugh), you will prob=
ably need to use
> 'git send-email'.
>
> Regarding the patch contents:
>
> The master list of vger lists and how to subscribe/unsubscribe them is at
>   https://vger.kernel.org
>
> which redirects to the URL to that used:
>   https://subspace.kernel.org/vger.kernel.org.html
>
>
> Also, no need to Cc: trivial@kernel.org. We don't use that email address
> to collect trivial patches any more. Just Cc: the Documentation maintaine=
r instead.
>
>
> thanks.
> --
> #Randy
