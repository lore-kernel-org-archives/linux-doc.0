Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15F61F81B1
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 21:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026977; cv=none; b=G2aDlNAvZ0I8hQYLZO0lMSYRpcHLQzZ6Zq2bKmioKKUuA7dcIK2XOLEe3t8co2V96Cs8O264kTFA7pX5ssFiC0hL4+Kpb6e62YrC/pcHL95gk216rqkR04aeT3vUlt8IhaeyDEfBUUBNOqb98f3gAwqY+IzRpW2h3b2V3eLgNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026977; c=relaxed/simple;
	bh=apgOJUyzRbuZaee4XpVPnPmNtrBW0Uxe2veHVmjM9VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzYW5f01/+FZdwKMbnJB6szHSbkalR7j/61qofugd7vC113CLW1JyNKzcl3errW8MRVfSAq8k0UssnCG1RnXc8PvChGRaLYMyz/XTRMVfO+gvyExZqF5tfv5n+qN7RBDIwcvMfrgGexGVTBFAfIjpy+WL+TMOykxW2biILnJu6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hyun42B6; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hyun42B6"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a3b28ac9a1so1229685ab.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 14:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729026974; x=1729631774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8t3MQX53gJacU2dQjrjSkqB49dUGpAYvqMTaTgZEsw=;
        b=hyun42B6UD3ehnDregkMYAHGN2lH48336vO/9BJj/Ip2BZY5zGnthx3aSEWAuXCFiv
         BpK03fIqXeW6J+TNFiErjRmMGhXDOUCBaxnqjIGZrnCi7+Rd7XXWfAaLb4WxHZLnPRa7
         6GOAVyKEqYT906DWd3+xUcdaNpufkIgOaKRBMcT41mNIg2CSSi20dZeed8stNdTEFOnz
         phxrSzJCotAUVr2sonSzR90tXGtbf8+TZwAfocuKdlobbnXgcxJyqKys48yQI0B+Xiaw
         OryTK7wmqDe8niW/oxkV3VmR8oWLVX0Agz+yFrxKnN1xRtB86MqSGRsEpQhvAI0FzU0z
         UK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729026974; x=1729631774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8t3MQX53gJacU2dQjrjSkqB49dUGpAYvqMTaTgZEsw=;
        b=OcS/P9a3ENiQMwqva2y8tRRmnnK92JTDLniciYCmUYproqYVHEUeJWl9GJriouAbU4
         kmRs91yIkPHbTPWwrChY0Uq1FSDtmQCdT/oLAAE/WKWTlnhLXSq/aFEvZ2/IiSpl/4aa
         ZriRpBErHsCDgKD8CeL8L5ALwdU1M2BiQc1QSG+iaWWaZbT+o9DvveLIMMClDifPlK1H
         d9yAt53Zmbr2mLu2EqFS0up3qJRng1+jNQm9dttfo7NxNatm+Vt3pvsHz6KxIHYj59Af
         rIUYpi2lKGHNykYXw46ewf1ZoasrLyGlf6DN9yH96ddxFit7WjgGcv/aaG+BKMiFQRRO
         Z3JA==
X-Forwarded-Encrypted: i=1; AJvYcCXe+7v4os5Ke6+ePLwlgTLANRXUdEqqwB9kCXLiXqimOTUZUXZMq+qBk8Ujw11VWJU6JDksUhdRWxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwSCNgziF8icDKR8Swmws57BxVi2l3aAC3CG2St9sNaqLF8hMd
	T9+t2c1aNxvb3Z7gI3QZdcnyvNqKxXaN1dfkCN7Ko5OmS2sOR1FD0qHHK8vF44boUqkyBOQ6cPy
	ksRWl4FNKc/Uw+mmFJI1PZh3U73EUP09Gsv9l
X-Google-Smtp-Source: AGHT+IHINpXEi5bb/dccSxtN8wJyzozbPFXJh2tHJWT4nH0CEB3DhiR+erAYo6ijlB3wG61HmbFlaLAczJD9QPgiALM=
X-Received: by 2002:a05:6e02:1fc6:b0:39d:1b64:3551 with SMTP id
 e9e14a558f8ab-3a3de7d1385mr347375ab.19.1729026973940; Tue, 15 Oct 2024
 14:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015183824.1014964-1-irogers@google.com> <20241015203202.vyfi4nykkid35luj@illithid>
In-Reply-To: <20241015203202.vyfi4nykkid35luj@illithid>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Oct 2024 14:16:00 -0700
Message-ID: <CAP-5=fU1Rh8z0RdRri7+yw5ORDes3sCSLyaHf9UqZ6o1rygkrg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] proc_pid_fdinfo.5: Reduce indent for most of the page
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 1:32=E2=80=AFPM G. Branden Robinson
<g.branden.robinson@gmail.com> wrote:
>
> At 2024-10-15T11:38:22-0700, Ian Rogers wrote:
> > When /proc/pid/fdinfo was part of proc.5 man page the indentation made
> > sense. As a standalone man page the indentation doesn't need to be so
> > far over to the right.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  man/man5/proc_pid_fdinfo.5 | 50 +++++++++++++++++++-------------------
> >  1 file changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> > index 1e23bbe02..0c4950d5d 100644
> > --- a/man/man5/proc_pid_fdinfo.5
> > +++ b/man/man5/proc_pid_fdinfo.5
> > @@ -8,8 +8,9 @@
> >  .SH NAME
> >  /proc/pid/fdinfo/ \- information about file descriptors
> >  .SH DESCRIPTION
> > -.TP
> > +.TP 0
> >  .IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
> > +.P
> >  This is a subdirectory containing one entry for each file which the
> >  process has open, named by its file descriptor.
> >  The files in this directory are readable only by the owner of the proc=
ess.
>
> I don't find this usage to be idiomatic.
>
> There's no point having a tagged paragraph if you want that paragraph's
> indentation to be zero.
>
> I'll grant that it's also unusual to have a man page's "Description"
> section lurch straight into a definition list without any preamble.
>
> Since the only topic of this man page is now the file (or class of
> files) in question, I suggest dropping the paragraph tag altogether
> since it duplicates the summary description.
>
> And as it happens, you can put font styling _in_ the summary desription.
>
> So I suggest something like:
>
> .SH NAME
> .IR /proc/ pid /fdinfo " \- information about file descriptors"
> .SH DESCRIPTION
> Since Linux 2.6.22,
> this subdirectory contains one entry for each file that process
> .I pid
> has open,
> named for its file descriptor.
>
> This renders fine with groff and mandoc(1).
>
> Sample page attached.

Thanks for the advice on how to make things more idiomatic. I'll try
to incorporate your feedback into v2.

Ian
