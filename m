Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460AA1CF2AF
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730488327; cv=none; b=WluIxOfj9Xv/8pDGNOHWb7R+puHXnjM4lIEfibZ1fRm/VF/JmxnVyxn43HjDYw45qePKD18sgxbgqTXl/fAWFgJAlJT7lUAsxvEQOGI0YoLHY4q0vPrgpo/j+UE0oKuLNlfK66nr0uZkArYKie5qCYTIzCSYzpcFXbQbvYNFHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730488327; c=relaxed/simple;
	bh=qbQXMBXDll38zavw7idgfSxVYsvNRdaFG/TpLr0tJ1M=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=XrH8wHOXg1BVDiWWkIsCvgSiFnKU4YNGNl+S7LO7QhdDq9zk8PnEBcIakxBnoHoV6H2oZBPBqDkOFOHowCHSY9S8ABlqZ/ITRTRfUvZHaSMUSv8B2HOCz77UXGPAnfWK0b5Im75VAv4fs+ctc1ZYucpuyAgOBbStfxsJwASe8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LjCfXfHj; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LjCfXfHj"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e31e5d1739so47932377b3.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730488324; x=1731093124; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gkz28xMAWt/2KXNBG3XjAFk4KTwZpcO3i3iJdGxkSFg=;
        b=LjCfXfHjZ1Lm7Vjn8TP8mQpZF2WmaGqMKG5jieXySYDIuBjLpfHuJlrfhLm2kxQ/gm
         Cd99jH2AyBpdtRtZWfHnoW8jLeTv9GreAEdN3/83MjRXVBU/8gSVCasxjt22JUb5zR7B
         lkzRpzWFjz0XHur4TL3Ge/uhAJWUgFSrwuTzUUWcmfA3oXO8qyoKYTr7+7QbDeteyQcM
         gJZ8RUplMODKGMqNI6G8+KmqmjvBZSI02zjunrHzPvINf4zBY8TJkKRKYF7ohKbx59Zv
         wDxWBqeh/WcyGXhG635b6Vc4yqzoGZaJOu5epWVV97YCb1o993yqdK5maXez0Re5T+Fq
         xU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730488324; x=1731093124;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gkz28xMAWt/2KXNBG3XjAFk4KTwZpcO3i3iJdGxkSFg=;
        b=qHmrdjKhiImlXyig18zB/wHZsxTqosAoe142FgGLnsMp3sbsziTe8zKWsNjDLmbAb0
         fJBjfRfpOMlrPs+nTe+OHHQ2nR5YRyDkirDWFRkOTZfzAWpaokXLE+KLASk3ATFciZeA
         G+oigGnwDF1aaBPiMFOYdmvKvh5BVzOtsHTT9F45oMcAv7JNjoQ8tupCBZrEwpM2HipU
         /DZ/gNJ/mIgvBZWvBlJWYTFvHABiBen/Ght56PBQWQJN8WYc6u6GupnSJMoKyIJwWnsR
         b2XrXxygzqSG11FT3iRqpP8XTa3UiYo6cusAnlrqLWxMbQpkpXD2hptArhdN5knoPU6E
         uxhg==
X-Forwarded-Encrypted: i=1; AJvYcCXWMYntBJ9EjCtGe5czYlqLXXig5nVgWd9AWVpStLcebTQV1UXL4caAs/c+gOag8d4yr4dStIBCeVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxId5cLlmisZtNRHiY5BHTBOWVRkd0fkYP1rTiQ937QHSZJqCqa
	yPQ0MWruUoOiBUA2yZPgf97keaDExEfE0hrYQdpD3stcJ1T78sl29LrKf/+GhXvorua9P3NFRt1
	FN2m9IQ==
X-Google-Smtp-Source: AGHT+IFNeLRXXudDwC0gCZ6v3ZzzirUae1o9p+zQDA9iH2FxOAlGCG5xI1JIXPP3rrEcjJqvieuCor38xzmk
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:f2e6:5ab5:a95f:35cb])
 (user=irogers job=sendgmr) by 2002:a05:690c:6482:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6ea64bed332mr945727b3.5.1730488324379; Fri, 01 Nov 2024
 12:12:04 -0700 (PDT)
Date: Fri,  1 Nov 2024 12:11:55 -0700
In-Reply-To: <20241101191156.1272730-1-irogers@google.com>
Message-Id: <20241101191156.1272730-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241101191156.1272730-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v3 3/4] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>, "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Make the sections about eventfd, epoll, signalfd, inotify, fanotify,
timerfd better separated with a clearer subsection header.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 935b54b4c..290cae6a6 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -58,6 +58,7 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
+.SS eventfd
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -76,6 +77,7 @@ eventfd\-count:               40
 .P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
+.SS epoll
 .P
 For epoll file descriptors (see
 .BR epoll (7)),
@@ -109,6 +111,7 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
+.SS signalfd
 .P
 For signalfd file descriptors (see
 .BR signalfd (2)),
@@ -134,6 +137,7 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
+.SS inotify
 .P
 For inotify file descriptors (see
 .BR inotify (7)),
@@ -174,6 +178,7 @@ file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-type ,
 and
 .IR f_handle .
+.SS fanotify
 .P
 For fanotify file descriptors (see
 .BR fanotify (7)),
@@ -230,6 +235,7 @@ The mask of events that are ignored for this mark
 .P
 For details on these fields, see
 .BR fanotify_mark (2).
+.SS timerfd
 .P
 For timerfd file descriptors (see
 .BR timerfd (2)),
-- 
2.47.0.199.ga7371fff76-goog

