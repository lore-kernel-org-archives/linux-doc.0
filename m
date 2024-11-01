Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF351714B9
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 19:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730488322; cv=none; b=TSQ1zcnMbExXO/Xbdm2uC2FxYBYAMZB8qpqUSO3XG3FushT+Bxpj78qDRHS8CaUzRsEFsBiLge/RrFPDwNW/MBn86wipONhHUxzpfRdTxJMiRbC3rAW4M+FgMUsapRMssk1dQJI46uLkXtky35HAuzaebIcElqJMmWOGeglFg20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730488322; c=relaxed/simple;
	bh=Ca9uy1c+6+qSM5CaxYm4g1ZphcgIFtIPGfZxbIIV/RA=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=p+yow7wOeaMf1XtAM9vc2xA2VC7nwelrQMhg79yu2xphwAOUYqTXY2Pfk4dRTLsm9v4p/RzlPq0dCbx/ujJ4yVtJO0MQZ1ahuhIhIeL8csgMXoU7dYbTOkS+LlfFeTENMxE73jdyYLZUw62hzjxxmzLVOivPOjYl7rU66BPGVZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JVLeJ0Q7; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JVLeJ0Q7"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so44587567b3.2
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730488320; x=1731093120; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qGyHLoLCO60zyzVrXBcmBsuhk/6ChoSuiiRvD06R0Ao=;
        b=JVLeJ0Q7daobeZANy9+4TQdVxCy3PZBKU6qzJZCOUzUnuDeoEifQRJEhbZPxWMyLo2
         W7FhhpvFobu/g55WuiSg/q+153drcggnkmlY79L41CM9b/BNaNf+uZjRpfQ6zIpDHu/+
         OGYpIiam8UIfBCGlEFNjU/nBVxSV++f4MFFp5QdlmtQ/y0nkmyMxE+xzyS7dyATEXNfi
         XgMzxSd491gCBCspIij3jRfRHl4jieMzKls4tE/g+o4qce444gcShRsgiaCbQ3sDUirb
         JcoD9u9YpgXIAWsIjS3ifThTqpNxsxW/i48Yl8NJYirgzuu8d7B+XmdF0DAar+rH/m54
         TaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730488320; x=1731093120;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGyHLoLCO60zyzVrXBcmBsuhk/6ChoSuiiRvD06R0Ao=;
        b=i2QS8Kx4cGjc1AqyMnnMiIjXfltUqutXzUAk82zbF5DILLEHLI0kYkDV55R/uKDNav
         BA6aX+RmG8BXftr77TB6DU7CbOcCNhEUSKLGPEuwDhOMwKOf/MDX6gUMiCX5Gdlcsfs7
         APZPL7d9KgMEcTAL8+m+AhZs/6CFydGpCNVRFFt8Hq4mQC48GUkwoMdLib+kuJ8J+M0o
         DdSiU2+fHxaCutdBVrW2aGZXX+P57lwrwC84y8XwCARys7OaWIkHsbqoIbtMD4pXIxWI
         Ql/933cytSE6mvcnj2/d08Z/X/mtC+OFL3ls/FU/J0CojrA/hxrNXrSGIBuhSUHFHKsr
         lUOg==
X-Forwarded-Encrypted: i=1; AJvYcCU5VBC6pggEbs6RXXhQ6je7b+4WTvoo9Yi+dzvJQ73w2tpLflmfP1FawD1IQSh+Eqoj2RYAGI1T7wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoIOWiU9VmgvnY8Mo8nISMQ2cw4yaAl1H7j3n3uIB3zh+16w2V
	hoNRG6V5yn/0wZBut67lh66m5CqJMRtVy7zw8v/bqqNG3+cblP7olc3iS5A/jZxkLWVR1V2fML9
	h7oWLrw==
X-Google-Smtp-Source: AGHT+IExfO3GhTUorPhn74vvA2Ew+xUdeuR6Buzz+Y5G9C5vnSgo3TGMxhFt4h9DTJYT75pyQsEjAcCgqPg3
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:f2e6:5ab5:a95f:35cb])
 (user=irogers job=sendgmr) by 2002:a05:690c:6913:b0:6e3:1627:e866 with SMTP
 id 00721157ae682-6e9d8b8da3fmr8768857b3.3.1730488320283; Fri, 01 Nov 2024
 12:12:00 -0700 (PDT)
Date: Fri,  1 Nov 2024 12:11:53 -0700
Message-Id: <20241101191156.1272730-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v3 1/4] proc_pid_fdinfo.5: Reduce indent for most of the page
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>, "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When /proc/pid/fdinfo was part of proc.5 man page the indentation made
sense. As a standalone man page the indentation doesn't need to be so
far over to the right. Remove the initial tagged pragraph.

Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 52 ++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 1e23bbe02..87e6dbe56 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -8,18 +8,17 @@
 .SH NAME
 /proc/pid/fdinfo/ \- information about file descriptors
 .SH DESCRIPTION
-.TP
-.IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
-This is a subdirectory containing one entry for each file which the
+Since Linux 2.6.22,
+this is a subdirectory containing one entry for each file which the
 process has open, named by its file descriptor.
 The files in this directory are readable only by the owner of the process.
 The contents of each file can be read to obtain information
 about the corresponding file descriptor.
 The content depends on the type of file referred to by the
 corresponding file descriptor.
-.IP
+.P
 For regular files and directories, we see something like:
-.IP
+.P
 .in +4n
 .EX
 .RB "$" " cat /proc/12015/fdinfo/4"
@@ -28,7 +27,7 @@ flags:  01002002
 mnt_id: 21
 .EE
 .in
-.IP
+.P
 The fields are as follows:
 .RS
 .TP
@@ -51,7 +50,6 @@ this field incorrectly displayed the setting of
 at the time the file was opened,
 rather than the current setting of the close-on-exec flag.
 .TP
-.I
 .I mnt_id
 This field, present since Linux 3.15,
 .\" commit 49d063cb353265c3af701bab215ac438ca7df36d
@@ -59,13 +57,13 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
-.IP
+.P
 For eventfd file descriptors (see
 .BR eventfd (2)),
 we see (since Linux 3.8)
 .\" commit cbac5542d48127b546a23d816380a7926eee1c25
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -74,16 +72,16 @@ mnt_id:	10
 eventfd\-count:               40
 .EE
 .in
-.IP
+.P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
-.IP
+.P
 For epoll file descriptors (see
 .BR epoll (7)),
 we see (since Linux 3.8)
 .\" commit 138d22b58696c506799f8de759804083ff9effae
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -93,7 +91,7 @@ tfd:        9 events:       19 data: 74253d2500000009
 tfd:        7 events:       19 data: 74253d2500000007
 .EE
 .in
-.IP
+.P
 Each of the lines beginning
 .I tfd
 describes one of the file descriptors being monitored via
@@ -110,13 +108,13 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
-.IP
+.P
 For signalfd file descriptors (see
 .BR signalfd (2)),
 we see (since Linux 3.8)
 .\" commit 138d22b58696c506799f8de759804083ff9effae
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -125,7 +123,7 @@ mnt_id:	10
 sigmask:	0000000000000006
 .EE
 .in
-.IP
+.P
 .I sigmask
 is the hexadecimal mask of signals that are accepted via this
 signalfd file descriptor.
@@ -135,12 +133,12 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
-.IP
+.P
 For inotify file descriptors (see
 .BR inotify (7)),
 we see (since Linux 3.8)
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -150,7 +148,7 @@ inotify wd:2 ino:7ef82a sdev:800001 mask:800afff ignored_mask:0 fhandle\-bytes:8
 inotify wd:1 ino:192627 sdev:800001 mask:800afff ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:27261900802dfd73
 .EE
 .in
-.IP
+.P
 Each of the lines beginning with "inotify" displays information about
 one file or directory that is being monitored.
 The fields in this line are as follows:
@@ -168,19 +166,19 @@ The ID of the device where the target file resides (in hexadecimal).
 .I mask
 The mask of events being monitored for the target file (in hexadecimal).
 .RE
-.IP
+.P
 If the kernel was built with exportfs support, the path to the target
 file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-bytes ,
 .IR fhandle\-type ,
 and
 .IR f_handle .
-.IP
+.P
 For fanotify file descriptors (see
 .BR fanotify (7)),
 we see (since Linux 3.8)
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -190,7 +188,7 @@ fanotify flags:0 event\-flags:88002
 fanotify ino:19264f sdev:800001 mflags:0 mask:1 ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:4f261900a82dfd73
 .EE
 .in
-.IP
+.P
 The fourth line displays information defined when the fanotify group
 was created via
 .BR fanotify_init (2):
@@ -210,7 +208,7 @@ argument given to
 .BR fanotify_init (2)
 (expressed in hexadecimal).
 .RE
-.IP
+.P
 Each additional line shown in the file contains information
 about one of the marks in the fanotify group.
 Most of these fields are as for inotify, except:
@@ -228,16 +226,16 @@ The events mask for this mark
 The mask of events that are ignored for this mark
 (expressed in hexadecimal).
 .RE
-.IP
+.P
 For details on these fields, see
 .BR fanotify_mark (2).
-.IP
+.P
 For timerfd file descriptors (see
 .BR timerfd (2)),
 we see (since Linux 3.17)
 .\" commit af9c4957cf212ad9cf0bee34c95cb11de5426e85
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:    0
-- 
2.47.0.199.ga7371fff76-goog

