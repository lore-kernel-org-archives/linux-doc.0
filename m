Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF4D1CDA27
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730485173; cv=none; b=Nm5GHeenSM7ZEX8QJ0CvD4spYR2d6x+0A/tVeKalXE3DE1hT2pBbUXTkGb9RVlX+Iseg+xRPUSp5YqDFcNa8CjyVsQPHZHCbG1lkPaYogXJddZdWPCqfaH4PRIqniJ2211rB0rWKarku6OBJysiLMzO9s+2ikyW03dyYwSuSuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730485173; c=relaxed/simple;
	bh=e/JuFjLxAkY9/2840JwIFVwiYSAtqEb7V4148Hvo2as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZwCkzWS9wJ5vEuBS1HOGa3OzfNzBbdnPmlYZlAPJZYvnr4+xP2LUtlBDgDCK0pJj6Na1bISqK3aOMVadAdTtxNunbf8cLTWUgOsDsHMBgmJ9x+KNvDs4aarKOkw7NotTK4FJ2SyoX4ACpWcHsoaI8uczYBPR1QxBfbqfA5X4Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RI6YeC0F; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RI6YeC0F"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-460a8d1a9b7so40481cf.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730485170; x=1731089970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgLXiMi+J/NggzUVpUpWAWf65WUGcPu7JpIAGtH2HNQ=;
        b=RI6YeC0F4iMm6UearPpmK5yftZr0jZfE+cP0k45ImLIRf9/LDr4Mqj/GnXQV0myLqN
         nfCUmc8h7QdewGO6Zl5badmKbWgs/CvvWa0vb2m1fnZ8lz5BNHVTRBxI+xrpjT2yxCdC
         Sa+PtgXz7fM3UQlBuoG1XnMBsdaiUAHR67LiSnEws2K/90HtnytV8zqwMhzDVa/HdMdi
         XO4+yo/IFIlj8KEjU5bI9cOO1k/RrR6LGDWvwrodNFHvRB/6Kg/MiDZPo9Bj5rg1Bkv4
         /HN23XggNhWxhi8b8XC6j+AN03M/GjBtL1ilhuSxDU94Ne1BwAFKYgCcQkeBXPIJUVfa
         W1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730485170; x=1731089970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgLXiMi+J/NggzUVpUpWAWf65WUGcPu7JpIAGtH2HNQ=;
        b=gT+tjcTG3CDc1anjFjnyutQQC54MyMVIv3BNdoe5fvC/reiRY046UuRkN5dZXy0XIC
         6f04K2SvglVceeU+kuHWbIcDZVkj9gcoS5aAkTcfySPwvQH8cUiT+la4/AQGDeL3SJxe
         lfPm4r9h6a54UF5dYC4/GZgepU+KoebUx79Okx7oXId4D3sp7MxNfP1ohKxUPOOAXt/m
         pkB9inFeSNwxE+x9oQuHtKb4Xfb37KgnIpzbWPeZpJLO6slqtORclz9E5kNk8IcCeLX0
         8x7V4pUvjcD9H7KjJBS4T9PtuZOicPutsVX0C8VXEUsH/N/02IZIjQbpeMihRxGNdjDU
         DWlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWTMSPp3Qji1FLhk9ozuWxesNRMzVU0HUkdUbUgEzcaJjzqI5wGAWamjTLru/dkG7kuvawqryxf24=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkz5uhunVM3nYHweCBeI6M6PJrKINeQ0SqZsHfQUJIIXR9u2j
	mQ627adA32upgSA0QZTWrElS+X/yxiq0C4mt0yd1ltI2YwNjlQUKjsubACqUS0QtuQLNe8T4UXY
	Gh/Sm+LBfZsjh1DSY5HW6XNDavva+zi7cVAJ8
X-Gm-Gg: ASbGncs18PqbG44VDDQMGcK0JOtU9ecTCHPjvajIjLoSs8fGrTtAIPkMHOyd/MY3KXJ
	pdCE3+iLE9hCxO79E+m/q4J4QHGyhmKAB
X-Google-Smtp-Source: AGHT+IG0Gl6acjuLtCR71sVFFcnhFR0iLK3dlvBmCqJ96g8N7a0fo0kc0B9rcLPxt1c8RC8oB6pYjnPbwvn9UeWu/NA=
X-Received: by 2002:a05:622a:1ba4:b0:461:4150:b833 with SMTP id
 d75a77b69052e-462c5fe1ce9mr232521cf.22.1730485169937; Fri, 01 Nov 2024
 11:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015211719.1152862-1-irogers@google.com> <20241101132437.ahn7xdgvmqamatce@devuan>
In-Reply-To: <20241101132437.ahn7xdgvmqamatce@devuan>
From: Ian Rogers <irogers@google.com>
Date: Fri, 1 Nov 2024 11:19:18 -0700
Message-ID: <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the page
To: Alejandro Colomar <alx@kernel.org>
Cc: "G . Branden Robinson" <g.branden.robinson@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 6:24=E2=80=AFAM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> On Tue, Oct 15, 2024 at 02:17:17PM -0700, Ian Rogers wrote:
> > When /proc/pid/fdinfo was part of proc.5 man page the indentation made
> > sense. As a standalone man page the indentation doesn't need to be so
> > far over to the right. Remove the initial tagged pragraph and move the
> > styling to the initial summary description.
> >
> > Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  man/man5/proc_pid_fdinfo.5 | 66 ++++++++++++++++++--------------------
> >  1 file changed, 32 insertions(+), 34 deletions(-)
> >
> > diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> > index 1e23bbe02..8678caf4a 100644
> > --- a/man/man5/proc_pid_fdinfo.5
> > +++ b/man/man5/proc_pid_fdinfo.5
> > @@ -6,20 +6,19 @@
> >  .\"
> >  .TH proc_pid_fdinfo 5 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -/proc/pid/fdinfo/ \- information about file descriptors
> > +.IR /proc/ pid /fdinfo " \- information about file descriptors"
>
> I wouldn't add formatting here for now.  That's something I prefer to be
> cautious about, and if we do it, we should do it in a separate commit.

I'll move it to a separate patch. Is the caution due to a lack of test
infrastructure? That could be something to get resolved, perhaps
through Google summer-of-code and the like.

> >  .SH DESCRIPTION
> > -.TP
> > -.IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
> > -This is a subdirectory containing one entry for each file which the
> > -process has open, named by its file descriptor.
> > -The files in this directory are readable only by the owner of the proc=
ess.
> > -The contents of each file can be read to obtain information
> > -about the corresponding file descriptor.
> > -The content depends on the type of file referred to by the
> > -corresponding file descriptor.
> > -.IP
> > +Since Linux 2.6.22,
>
> You could move this information to a HISTORY section.

Sure, tbh I'm not sure anybody cares about this information and it
could be as well to delete it. Sorry people running 17 year old
kernels. For now I'll try to leave it unchanged.

> > +this subdirectory contains one entry for each file that process
> > +.I pid
> > +has open, named by its file descriptor.  The files in this directory
>
> Please don't reflow existing text.  Please read about semantic newlines
> in man-pages(7):
>
> $ MANWIDTH=3D72 man man-pages | sed -n '/Use semantic newlines/,/^$/p'
>    Use semantic newlines
>      In  the  source of a manual page, new sentences should be started
>      on new lines, long sentences should be split into lines at clause
>      breaks (commas, semicolons, colons, and so on), and long  clauses
>      should be split at phrase boundaries.  This convention, sometimes
>      known  as  "semantic newlines", makes it easier to see the effect
>      of patches, which often operate at the level of  individual  sen=E2=
=80=90
>      tences, clauses, or phrases.

I'll update for v3 but I'm reminded of `git diff --word-diff=3Dcolor` so
perhaps this recommendation is outdated.

Thanks,
Ian

> Have a lovely day!
> Alex
>
> > +are readable only by the owner of the process.  The contents of each
> > +file can be read to obtain information about the corresponding file
> > +descriptor.  The content depends on the type of file referred to by
> > +the corresponding file descriptor.
> > +.P
> >  For regular files and directories, we see something like:
> > -.IP
> > +.P
> >  .in +4n
> >  .EX
> >  .RB "$" " cat /proc/12015/fdinfo/4"
> > @@ -28,7 +27,7 @@ flags:  01002002
> >  mnt_id: 21
> >  .EE
> >  .in
> > -.IP
> > +.P
> >  The fields are as follows:
> >  .RS
> >  .TP
> > @@ -51,7 +50,6 @@ this field incorrectly displayed the setting of
> >  at the time the file was opened,
> >  rather than the current setting of the close-on-exec flag.
> >  .TP
> > -.I
> >  .I mnt_id
> >  This field, present since Linux 3.15,
> >  .\" commit 49d063cb353265c3af701bab215ac438ca7df36d
> > @@ -59,13 +57,13 @@ is the ID of the mount containing this file.
> >  See the description of
> >  .IR /proc/ pid /mountinfo .
> >  .RE
> > -.IP
> > +.P
> >  For eventfd file descriptors (see
> >  .BR eventfd (2)),
> >  we see (since Linux 3.8)
> >  .\" commit cbac5542d48127b546a23d816380a7926eee1c25
> >  the following fields:
> > -.IP
> > +.P
> >  .in +4n
> >  .EX
> >  pos: 0
> > @@ -74,16 +72,16 @@ mnt_id:   10
> >  eventfd\-count:               40
> >  .EE
> >  .in
> > -.IP
> > +.P
> >  .I eventfd\-count
> >  is the current value of the eventfd counter, in hexadecimal.
> > -.IP
> > +.P
> >  For epoll file descriptors (see
> >  .BR epoll (7)),
> >  we see (since Linux 3.8)
> >  .\" commit 138d22b58696c506799f8de759804083ff9effae
> >  the following fields:
> > -.IP
> > +.P
> >  .in +4n
> >  .EX
> >  pos: 0
> > @@ -93,7 +91,7 @@ tfd:        9 events:       19 data: 74253d2500000009
> >  tfd:        7 events:       19 data: 74253d2500000007
> >  .EE
> >  .in
> > -.IP
> > +.P
> >  Each of the lines beginning
> >  .I tfd
> >  describes one of the file descriptors being monitored via
> > @@ -110,13 +108,13 @@ descriptor.
> >  The
> >  .I data
> >  field is the data value associated with this file descriptor.
> > -.IP
> > +.P
> >  For signalfd file descriptors (see
> >  .BR signalfd (2)),
> >  we see (since Linux 3.8)
> >  .\" commit 138d22b58696c506799f8de759804083ff9effae
> >  the following fields:
> > -.IP
> > +.P
> >  .in +4n
> >  .EX
> >  pos: 0
> > @@ -125,7 +123,7 @@ mnt_id:   10
> >  sigmask:     0000000000000006
> >  .EE
> >  .in
> > -.IP
> > +.P
> >  .I sigmask
> >  is the hexadecimal mask of signals that are accepted via this
> >  signalfd file descriptor.
> > @@ -135,12 +133,12 @@ and
> >  .BR SIGQUIT ;
> >  see
> >  .BR signal (7).)
> > -.IP
> > +.P
> >  For inotify file descriptors (see
> >  .BR inotify (7)),
> >  we see (since Linux 3.8)
> >  the following fields:
> > -.IP
> > +.P
> >  .in +4n
> >  .EX
> >  pos: 0
> > @@ -150,7 +148,7 @@ inotify wd:2 ino:7ef82a sdev:800001 mask:800afff ig=
nored_mask:0 fhandle\-bytes:8
> >  inotify wd:1 ino:192627 sdev:800001 mask:800afff ignored_mask:0 fhandl=
e\-bytes:8 fhandle\-type:1 f_handle:27261900802dfd73
> >  .EE
> >  .in
> > -.IP
> > +.P
> >  Each of the lines beginning with "inotify" displays information about
> >  one file or directory that is being monitored.
> >  The fields in this line are as follows:
> > @@ -168,19 +166,19 @@ The ID of the device where the target file reside=
s (in hexadecimal).
> >  .I mask
> >  The mask of events being monitored for the target file (in hexadecimal=
).
> >  .RE
> > -.IP
> > +.P
> >  If the kernel was built with exportfs support, the path to the target
> >  file is exposed as a file handle, via three hexadecimal fields:
> >  .IR fhandle\-bytes ,
> >  .IR fhandle\-type ,
> >  and
> >  .IR f_handle .
> > -.IP
> > +.P
> >  For fanotify file descriptors (see
> >  .BR fanotify (7)),
> >  we see (since Linux 3.8)
> >  the following fields:
> > -.IP
> > +.P
> >  .in +4n
> >  .EX
> >  pos: 0
> > @@ -190,7 +188,7 @@ fanotify flags:0 event\-flags:88002
> >  fanotify ino:19264f sdev:800001 mflags:0 mask:1 ignored_mask:0 fhandle=
\-bytes:8 fhandle\-type:1 f_handle:4f261900a82dfd73
> >  .EE
> >  .in
> > -.IP
> > +.P
> >  The fourth line displays information defined when the fanotify group
> >  was created via
> >  .BR fanotify_init (2):
> > @@ -210,7 +208,7 @@ argument given to
> >  .BR fanotify_init (2)
> >  (expressed in hexadecimal).
> >  .RE
> > -.IP
> > +.P
> >  Each additional line shown in the file contains information
> >  about one of the marks in the fanotify group.
> >  Most of these fields are as for inotify, except:
> > @@ -228,16 +226,16 @@ The events mask for this mark
> >  The mask of events that are ignored for this mark
> >  (expressed in hexadecimal).
> >  .RE
> > -.IP
> > +.P
> >  For details on these fields, see
> >  .BR fanotify_mark (2).
> > -.IP
> > +.P
> >  For timerfd file descriptors (see
> >  .BR timerfd (2)),
> >  we see (since Linux 3.17)
> >  .\" commit af9c4957cf212ad9cf0bee34c95cb11de5426e85
> >  the following fields:
> > -.IP
> > +.P
> >  .in +4n
> >  .EX
> >  pos:    0
> > --
> > 2.47.0.rc1.288.g06298d1525-goog
> >
>
> --
> <https://www.alejandro-colomar.es/>
