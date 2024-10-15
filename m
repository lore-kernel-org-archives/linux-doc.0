Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689861F80D4
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027047; cv=none; b=Oz3yVtYyJdqPBW8mbrGkNMDh8GYhfZQBRYeBoUZzz2NJ1VuyQNIHtlNuxut8BsY+wFlM5WePC7qJZ36dZ1wVFEbK/tM8WygJSAWhJFOlf/AB+1q9FIrtgoa9QJs8qUo6FNQ2fWiO/cJgoMVloJ9hjq5tg2rJfiH0DEQFUgcy4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027047; c=relaxed/simple;
	bh=YNykN0VJoQ/HBbS/F/cmUAxr+3qVP6RzlnVSsR6H88s=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=PHac5u+/z9kBPAtRXFOuNvJPdDVbhucQ9bYIf5YgQM0owhlnbDJ1JSZBZ+ByGw1mB+wrGycaln1gttAMF63Xl56MUMwytNFsfWK+UQ5MTDxm2WSAayJ4EHNYNPi6xlwSaUhCxhGJ5asZpj7eExkL9+rJI6hGuKPGHfJr8MVXpiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LLMEG46D; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LLMEG46D"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3204db795so86624097b3.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 14:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729027043; x=1729631843; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=txjuk5KKMHwTz+/UPetAowSwk4pU0mPYYmnYC+nTh88=;
        b=LLMEG46DAv9Sou/isfgo/AdqLcUWxSVV9UKh2szmjuPB7wKRnv9L4XLb3pZAAOaMVC
         vQsl9by/2ENWM1IxdvDcZa08RZKfBeUr+Dg9/FsO9IqepZRJdtN2BMHSMizO3UoSVfEG
         rBveyQ/8JkUF72czkP1GnlE+mj8UIj24XbswNmMHAC9rzbp8PNWGTowdbb134ZrsBR34
         sT573/BS68/xNUe/bdlSnq5GSyFrhrn/WBrAX9EH4wXN3fPvlKdAKR0JSI8RwY/luIa9
         XO+cGdEvnShNRo6tXQk4KvRXU3KTClwQblddf9zaNPbWxZaRAPPvA+lnUub8zPTa15KN
         Y3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729027043; x=1729631843;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txjuk5KKMHwTz+/UPetAowSwk4pU0mPYYmnYC+nTh88=;
        b=Gk2DaEnqBXb3iplr/WKbtqVxn0gVmLX0w2DCjInp4Md3ylzMHcOebrfVjjWsNRoKDx
         B7M0dAwqTV5NrDcuS9XMXlEX+gwNaLlAGDl25oFS0InbwqKQ5ZYscCe5WuZ3KgnyjzzC
         xaNGVJPeOuadOaltmShkMyl1kgefvS0sll3e7pF0KUBGtHnxvxGakwX+adsw5BOHU/eP
         ME3zeyfJgIDImoDmfaxXKP09Nf9qMcpg2XNzumEW0yXrUUIxdprEY59ag7pMygTLgPC2
         N+s/SZBMCJTJyAA6UYC7jKdTr0M7+IyX/R+OoF+SmPbzE4Mb6MEZ1nRHDtbAtDL2fYyN
         lCTg==
X-Forwarded-Encrypted: i=1; AJvYcCWxWKwRTo1kC2N3q56BSvONsKA/0dYr6ToMzmPDP7x3Bts+j1ta0zoeLM0pKfHy/OImo1MM2HS30jM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/Wlz8lzQutT5U59fv2MfzgNP0bS3vSA+3TtqvGQYQaDare1/
	7mL6t9ydZdoqPjCKXbOqahg4iVKIqk1N93ayApyT8Jwi9/n64G8SBb+kd7uZsX6Llo0cXRgCkg6
	/C2P/lA==
X-Google-Smtp-Source: AGHT+IHT/1zxWTgrIqgA/1rSj+mzRq1XZtza4mJalhXeseoFKyJ0a7dvTKzCyIb/2Gjaw9Ez4gd7F15whol/
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a05:690c:6703:b0:6e2:1713:bdb5 with SMTP
 id 00721157ae682-6e3d41e6748mr24557b3.5.1729027043418; Tue, 15 Oct 2024
 14:17:23 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:17:17 -0700
Message-Id: <20241015211719.1152862-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the page
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
far over to the right. Remove the initial tagged pragraph and move the
styling to the initial summary description.

Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 66 ++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 1e23bbe02..8678caf4a 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -6,20 +6,19 @@
 .\"
 .TH proc_pid_fdinfo 5 (date) "Linux man-pages (unreleased)"
 .SH NAME
-/proc/pid/fdinfo/ \- information about file descriptors
+.IR /proc/ pid /fdinfo " \- information about file descriptors"
 .SH DESCRIPTION
-.TP
-.IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
-This is a subdirectory containing one entry for each file which the
-process has open, named by its file descriptor.
-The files in this directory are readable only by the owner of the process.
-The contents of each file can be read to obtain information
-about the corresponding file descriptor.
-The content depends on the type of file referred to by the
-corresponding file descriptor.
-.IP
+Since Linux 2.6.22,
+this subdirectory contains one entry for each file that process
+.I pid
+has open, named by its file descriptor.  The files in this directory
+are readable only by the owner of the process.  The contents of each
+file can be read to obtain information about the corresponding file
+descriptor.  The content depends on the type of file referred to by
+the corresponding file descriptor.
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
2.47.0.rc1.288.g06298d1525-goog

