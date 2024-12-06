Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8225732C8B
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733470716; cv=none; b=i+lPVZns81gCJUbem5sxSETxxU4B1oy5oejahPXXnHkS9d7bGdvLZ1XLfQXsWYqsJctD0ByQPRXfRsZ4nusLTxIqJ4lr+Uc+nLS7EUOtDyrL3wuWhn9rPD2R0x7MmgF574INgc4IA/pdt3T7KQnUWJlUFOC4D3RCqgqrrMnXMYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733470716; c=relaxed/simple;
	bh=6bkrrb/uiGTuE/W9xZJReBN+m+hOGzzdHINKIK2NnBo=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=AxHdfCp88yJuweHF1tsUyfuMW/+2Lkpy4zQYv03otJC8XzGSw44HMZu2udFLw2+YhXnatg4TLeaLbog9DLYiP+nUyc2ZkjIj0TFstE4KHfJsP3D7zF5TiNJBtl1l3JIQzoshgqE76L+Itkh7lvJBTj+HO8OcaqbUB1vx3wSENzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DV/UEmBY; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DV/UEmBY"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ef5d557d48so19910757b3.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 23:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733470712; x=1734075512; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SLJxxCZMQjxFHfpRLUoPsE0Pog5U57DZgoMGmPXxLis=;
        b=DV/UEmBYQt7lDBKYp2VF1OJ/CbX79NVUpWrz0tzCjGuIrEXtLE2+ES5UkA/7dhHb+3
         O12Ppxc/daXR3k4MVCkSAcHdJV4Cu6ys6lJg+bho+B6IH9G34rARZzWU4yOQTGhaEZyn
         /elhC2WeCQPXwK4HiSnc+HeS0xUetikHcMCvzs0hs+t+a+kH44cr1REoAuHQmrm92ZAv
         e2rVN+Ps6ZNSOEZhj26qpOS4GUO0Z0/u2r+n6z/NJGU+UDUKOpt8iWuWv+855TqqPp4n
         rvUgTaan/4O92YHQ2VNnf6dhg7ygAH66hpA02Dj/A+qVbj8aTLyA8P/pOXHsR/VDhwXl
         O/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733470712; x=1734075512;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLJxxCZMQjxFHfpRLUoPsE0Pog5U57DZgoMGmPXxLis=;
        b=S91Cz/lofk68cEW1tEnVIVX8fSOYwJtpAExOlgIqRiybbCDomQbclsyJwzIr/vTL+n
         aeMyEhZ0ngw1sLqMckAbaw/q8l+Yn3UvP8/iuCIRhJzB0l1Eo9hYoaHCoA+LfHsjiIzV
         QWtaeuffOqTCBR3soIuy7oETRXtjlRzNSuCHg4aW8fbhGV4jeC9Fjx96ZHp5l30vTEMT
         pSQxdjhgccsXQbZeAZQlTJ45gjvTeebJaYQEB199jpQJLhJthMuhCEbdDhWT8MF8QGg3
         4wK6Fw2Sy8lBNcHHTB0yoW3zBaOxistPtN//KmC63CCX9eVX9FB5WVeP6nDtB5uwq4M6
         8TUw==
X-Forwarded-Encrypted: i=1; AJvYcCVuip1AId97eK2CqhglXuXBJxfVXbFJQx8tL7jewiwJPARK8baPVai90zmNh68D2SNKmkUTkQOxK2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8TzMUi2HHr5gXWpHlVtvDpHY6hCSi8gNpIxS5mfhM8rfLmCTk
	twBc2rnB5Xm+3udz1tjt+nwH38LzquUBEikKcCj4xDNV+1hcHa5nSKrN0Ii3J3nGKmCeew8FGrV
	vitKE1Q==
X-Google-Smtp-Source: AGHT+IFHADbgNWu44wH+EjPynn/KpIRmLys7JfKxs6jd18rOnGXtQ37Irj6xBMwTLehW76cUlY5nbXBYX++6
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:bff4:a354:8911:79b3])
 (user=irogers job=sendgmr) by 2002:a25:e907:0:b0:e39:6c75:dd22 with SMTP id
 3f1490d57ef6-e3a0b0a8930mr3089276.2.1733470712462; Thu, 05 Dec 2024 23:38:32
 -0800 (PST)
Date: Thu,  5 Dec 2024 23:38:25 -0800
Message-Id: <20241206073828.1119464-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Subject: [PATCH v5 1/4] proc_pid_fdinfo.5: Reduce indent for most of the page
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
far over to the right. Remove the initial tagged pragraph, move the
"since Linux 2.6.22" to a new history subsection.

Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>
---
v5. Remove the word Since.
v4. Since from Alejandro Colomar <alx@kernel.org> review comment.
---
 man/man5/proc_pid_fdinfo.5 | 51 +++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 1e23bbe02..1c6c38423 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -8,8 +8,6 @@
 .SH NAME
 /proc/pid/fdinfo/ \- information about file descriptors
 .SH DESCRIPTION
-.TP
-.IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
 This is a subdirectory containing one entry for each file which the
 process has open, named by its file descriptor.
 The files in this directory are readable only by the owner of the process.
@@ -17,9 +15,9 @@ The contents of each file can be read to obtain information
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
@@ -28,7 +26,7 @@ flags:  01002002
 mnt_id: 21
 .EE
 .in
-.IP
+.P
 The fields are as follows:
 .RS
 .TP
@@ -51,7 +49,6 @@ this field incorrectly displayed the setting of
 at the time the file was opened,
 rather than the current setting of the close-on-exec flag.
 .TP
-.I
 .I mnt_id
 This field, present since Linux 3.15,
 .\" commit 49d063cb353265c3af701bab215ac438ca7df36d
@@ -59,13 +56,13 @@ is the ID of the mount containing this file.
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
@@ -74,16 +71,16 @@ mnt_id:	10
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
@@ -93,7 +90,7 @@ tfd:        9 events:       19 data: 74253d2500000009
 tfd:        7 events:       19 data: 74253d2500000007
 .EE
 .in
-.IP
+.P
 Each of the lines beginning
 .I tfd
 describes one of the file descriptors being monitored via
@@ -110,13 +107,13 @@ descriptor.
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
@@ -125,7 +122,7 @@ mnt_id:	10
 sigmask:	0000000000000006
 .EE
 .in
-.IP
+.P
 .I sigmask
 is the hexadecimal mask of signals that are accepted via this
 signalfd file descriptor.
@@ -135,12 +132,12 @@ and
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
@@ -150,7 +147,7 @@ inotify wd:2 ino:7ef82a sdev:800001 mask:800afff ignored_mask:0 fhandle\-bytes:8
 inotify wd:1 ino:192627 sdev:800001 mask:800afff ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:27261900802dfd73
 .EE
 .in
-.IP
+.P
 Each of the lines beginning with "inotify" displays information about
 one file or directory that is being monitored.
 The fields in this line are as follows:
@@ -168,19 +165,19 @@ The ID of the device where the target file resides (in hexadecimal).
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
@@ -190,7 +187,7 @@ fanotify flags:0 event\-flags:88002
 fanotify ino:19264f sdev:800001 mflags:0 mask:1 ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:4f261900a82dfd73
 .EE
 .in
-.IP
+.P
 The fourth line displays information defined when the fanotify group
 was created via
 .BR fanotify_init (2):
@@ -210,7 +207,7 @@ argument given to
 .BR fanotify_init (2)
 (expressed in hexadecimal).
 .RE
-.IP
+.P
 Each additional line shown in the file contains information
 about one of the marks in the fanotify group.
 Most of these fields are as for inotify, except:
@@ -228,16 +225,16 @@ The events mask for this mark
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
@@ -296,5 +293,7 @@ fields contain the values that
 .BR timerfd_gettime (2)
 on this file descriptor would return.)
 .RE
+.SH HISTORY
+Linux 2.6.22.
 .SH SEE ALSO
 .BR proc (5)
-- 
2.47.0.338.g60cca15819-goog

