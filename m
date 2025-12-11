Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B08311979
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457223; cv=none; b=EDwU4i4WyOP/CqISBlkNwLIbM/THFlGcQzR5uzSdYdVmb6RRyXPx4qkha1xjakavDUlGxlE5jfqt5XcWt9p2ZW8fjLyNC0hsMh0ElAE2k3ilLoLkeRHYur7NgXEoYOY37C0WM2/p0yUsIvrbqbA/cb9YKDI3gyYudVEEN9fml/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457223; c=relaxed/simple;
	bh=3qmycWVGwa0fleVcc4GLQW2Fzgtj2dBXk0K8XPFPQCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VteZQdNE2orZRE8jKNhg75YeEu53ZyxjqkcSv3zZIm7e4th0pMOPUC/wUp+OVvVSOwfOF3xBVfh8ylADtn/KB+aLf8x7jI9P1f5knOiWfys/dnJqi7n15WNdJBC8IKYQljooj9JOyQzXt8PvErsKvRu8qqnovcxxyCNW4vI44Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=a57DA8jm; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="a57DA8jm"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 144553F82B
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765457209;
	bh=suV39gaCYkEDANhyygJAMBI3GGjztJlbBT8FfCj6jaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a57DA8jmUp2G8pQpddT93B56oUzkDqon5sLjfgX5ylNMd4rwWccRcDs2WnQqedzIF
	 NG7kKMHPj4Plc0AzD77yWp5vfOkJTrgUKA6PIwJRJ3W6t+Gcbl5c2VfHw55O3WK+WP
	 lW6e8XzUROw4zhWaaEyWoRRLWpCufMzZcTcejRHjpeuEr95EKB5O090rJEX5ib7ZD/
	 o03fH9W5EI8/oEp30W+aSePbbtccnRILy9fED/f/KeSwumpXUhfAx4tsOmIO/RUlCh
	 Eg6Scq063yS/RPEU+2ua5kCctVKE+yLjJuRjA8WXU90n/X/pHHc3eN+40oE8g8WxsH
	 ZP32lNYgvDCjYMyhbym4hfTPsuXuN+1oAVyNE8MomU7cOXRFMlsCRq/Xw5aqfIhas5
	 XNBTqDJaW3WTnaG5jtHGAPzp5Lo9fMWcwuaIqLJlRg+zU6WmxN0Gd1q4w3T8W1dc31
	 TzTuG2wQUdjGMsDCK5N5NjCjFyOA4Udoeq5NNq9CrGbFnWdzLr2Gpf3876nvDWPG5W
	 NeNF9r3G/y2dV/57vfXyVA0jcceb5HcY4IlZK//fvco6d2/mH0+usAQvCfwrYEQLvn
	 YsFio+T40XkaTC06++8LOKEpqvn40XluaQlnYLZlxGm3taPIAJeqU5VS/wy/Z2+BOl
	 yIAb14PwD/57pqTmcUxL4yRU=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so233745e9.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 04:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457201; x=1766062001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=suV39gaCYkEDANhyygJAMBI3GGjztJlbBT8FfCj6jaQ=;
        b=ODDCXuYllfUCSYG0T8Af0xHnDKIUV7lCsD2iGiVqLAY0+payg5HkRrpSN3bLOXCbwe
         GlvOMXy3C3pzERXtYiklkNqQ2LPIoD79YEKyzUlIWy27zbqnJuwpVP76UAevvDrSNuwe
         SPXmsUaxTDs+F5gNG+RydskddLXIqug+xzlcguR3SsujqJMJTZBDIx15VuEzZKf2k5sQ
         Mp4yxUi5Agi/c4WeSNXYY2bup9hvG5be/iaQvm1janOCRYi+qBRa6yvKpuXtVVvc4qQR
         K+rJWtCd1xpdpaiZGVPlswFY6+AI3boWYU8oPS+3oSIgJz3b0pEGMYafGPqmwPDdqS6X
         wOSg==
X-Gm-Message-State: AOJu0YyuJ/xU7JXzK28kcOvqEwkrzmgp6JSHA/ts6Y0Cg0/nKAF8m9hf
	c2PaewyrjeIRXTra9krlLkEte/RWEg8rKHsOhhqvEfWjvtubEFPC/1jCah4kpAk9FVXhp4iRtvg
	3d1HpU6jxvyk5K78wCdiN4IOKvVYRIDQ9Zrl+EuIx9pALSRTdpTvi57IchXV25jXDnRw1SoKi26
	VOXA==
X-Gm-Gg: AY/fxX4MwnIG0OiHPzTVedoq8MSlnrZLznoY4phexedzTQhsgqGjdux890+crGigFyS
	6+eq7CsmrLBQOBRx6aiLqvdEU0Z3ev5F4EkvX9d4D7hr/2vTG/QuN94LC715Oj8ICnl1k5l8glN
	CK5GhZyD24/8OA6xlrPeliY+5/w2bEj3fPT4obwnj4XQyzjwIyC3YcAWh1rpJ86YrXrYBLAFW4F
	ag3NTyevBVKpxKkXOpR0UOpCjMxnL/f4SxQtjxyzBQazur4uOeS6hPD/N4My9g+ds5JRHdrtp7G
	xwzN23vQwkW9tKPTbS/pYU1HXmTPCXW+UgLIw1nznHJUVTAgdljLjkLJh9CbUWtlMA7wq3UeHEd
	YQNpyeBeDlkQogwX2UxYEWhkMq6xU1qDwHsgdi62u+GVZtvnrH+t1LOsGu2jPIr0uVD9e9RsHFN
	aDKTW5ZMYgdAdQZY0LwLC2WSg=
X-Received: by 2002:a05:600c:46cf:b0:47a:829a:ebb with SMTP id 5b1f17b1804b1-47a8383c856mr56890445e9.19.1765457200892;
        Thu, 11 Dec 2025 04:46:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdBy+0ixhzmCiyvohlwRh+X5WzSwkP+d/0rQhp386/uoSX/xcLaiXgvZ/61M7qhAv/XiR5Hg==
X-Received: by 2002:a05:600c:46cf:b0:47a:829a:ebb with SMTP id 5b1f17b1804b1-47a8383c856mr56890055e9.19.1765457200466;
        Thu, 11 Dec 2025 04:46:40 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf57022000e6219d5798620e30.dip0.t-ipconnect.de. [2003:cf:5702:2000:e621:9d57:9862:e30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f0d6f2sm32075905e9.13.2025.12.11.04.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 04:46:39 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kees@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Subject: [PATCH v3 6/7] seccomp: allow nested listeners
Date: Thu, 11 Dec 2025 13:46:10 +0100
Message-ID: <20251211124614.161900-7-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
References: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now everything is ready to get rid of "only one listener per tree"
limitation.

Let's introduce a new uAPI flag
SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS, so userspace may explicitly
allow nested listeners when installing a listener.

Note, that to install n-th listener, this flag must be set on all
the listeners up the tree.

Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bpf@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Aleksa Sarai <cyphar@cyphar.com>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Stéphane Graber <stgraber@stgraber.org>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 .../userspace-api/seccomp_filter.rst          |  6 +++++
 include/linux/seccomp.h                       |  3 ++-
 include/uapi/linux/seccomp.h                  | 13 ++++++-----
 kernel/seccomp.c                              | 22 +++++++++++++++----
 tools/include/uapi/linux/seccomp.h            | 13 ++++++-----
 5 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/Documentation/userspace-api/seccomp_filter.rst b/Documentation/userspace-api/seccomp_filter.rst
index cff0fa7f3175..b9633ab1ed47 100644
--- a/Documentation/userspace-api/seccomp_filter.rst
+++ b/Documentation/userspace-api/seccomp_filter.rst
@@ -210,6 +210,12 @@ notifications from both tasks will appear on the same filter fd. Reads and
 writes to/from a filter fd are also synchronized, so a filter fd can safely
 have many readers.
 
+By default, only one listener within seccomp filters tree is allowed. On attempt
+to add a new listener when one already exists in the filter tree, the
+``seccomp()`` call will fail with ``-EBUSY``. To allow multiple listeners, the
+``SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS`` flag can be passed in addition to
+the ``SECCOMP_FILTER_FLAG_NEW_LISTENER`` flag.
+
 The interface for a seccomp notification fd consists of two structures:
 
 .. code-block:: c
diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index 9b959972bf4a..9b060946019d 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -10,7 +10,8 @@
 					 SECCOMP_FILTER_FLAG_SPEC_ALLOW | \
 					 SECCOMP_FILTER_FLAG_NEW_LISTENER | \
 					 SECCOMP_FILTER_FLAG_TSYNC_ESRCH | \
-					 SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV)
+					 SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV | \
+					 SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS)
 
 /* sizeof() the first published struct seccomp_notif_addfd */
 #define SECCOMP_NOTIFY_ADDFD_SIZE_VER0 24
diff --git a/include/uapi/linux/seccomp.h b/include/uapi/linux/seccomp.h
index dbfc9b37fcae..de78d8e7a70b 100644
--- a/include/uapi/linux/seccomp.h
+++ b/include/uapi/linux/seccomp.h
@@ -18,13 +18,14 @@
 #define SECCOMP_GET_NOTIF_SIZES		3
 
 /* Valid flags for SECCOMP_SET_MODE_FILTER */
-#define SECCOMP_FILTER_FLAG_TSYNC		(1UL << 0)
-#define SECCOMP_FILTER_FLAG_LOG			(1UL << 1)
-#define SECCOMP_FILTER_FLAG_SPEC_ALLOW		(1UL << 2)
-#define SECCOMP_FILTER_FLAG_NEW_LISTENER	(1UL << 3)
-#define SECCOMP_FILTER_FLAG_TSYNC_ESRCH		(1UL << 4)
+#define SECCOMP_FILTER_FLAG_TSYNC			(1UL << 0)
+#define SECCOMP_FILTER_FLAG_LOG				(1UL << 1)
+#define SECCOMP_FILTER_FLAG_SPEC_ALLOW			(1UL << 2)
+#define SECCOMP_FILTER_FLAG_NEW_LISTENER		(1UL << 3)
+#define SECCOMP_FILTER_FLAG_TSYNC_ESRCH			(1UL << 4)
 /* Received notifications wait in killable state (only respond to fatal signals) */
-#define SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV	(1UL << 5)
+#define SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV		(1UL << 5)
+#define SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS	(1UL << 6)
 
 /*
  * All BPF programs must return a 32-bit value.
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 51d0d8adaffb..7667f443ff6c 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -206,6 +206,7 @@ static inline void seccomp_cache_prepare(struct seccomp_filter *sfilter)
  * @wait_killable_recv: Put notifying process in killable state once the
  *			notification is received by the userspace listener.
  * @first_listener: true if this is the first seccomp listener installed in the tree.
+ * @allow_nested_listeners: Allow nested seccomp listeners.
  * @prev: points to a previously installed, or inherited, filter
  * @prog: the BPF program to evaluate
  * @notif: the struct that holds all notification related information
@@ -228,6 +229,7 @@ struct seccomp_filter {
 	bool log : 1;
 	bool wait_killable_recv : 1;
 	bool first_listener : 1;
+	bool allow_nested_listeners : 1;
 	struct action_cache cache;
 	struct seccomp_filter *prev;
 	struct bpf_prog *prog;
@@ -956,6 +958,10 @@ static long seccomp_attach_filter(unsigned int flags,
 	if (flags & SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV)
 		filter->wait_killable_recv = true;
 
+	/* Set nested listeners allow flag, if present. */
+	if (flags & SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS)
+		filter->allow_nested_listeners = true;
+
 	/*
 	 * If there is an existing filter, make it the prev and don't drop its
 	 * task reference.
@@ -1997,7 +2003,8 @@ static struct file *init_listener(struct seccomp_filter *filter)
 }
 
 /*
- * Does @new_child have a listener while an ancestor also has a listener?
+ * Does @new_child have a listener while an ancestor also has a listener
+ * and hasn't allowed nesting?
  * If so, we'll want to reject this filter.
  * This only has to be tested for the current process, even in the TSYNC case,
  * because TSYNC installs @child with the same parent on all threads.
@@ -2015,7 +2022,12 @@ static bool check_duplicate_listener(struct seccomp_filter *new_child)
 		return false;
 	for (cur = current->seccomp.filter; cur; cur = cur->prev) {
 		if (!IS_ERR_OR_NULL(cur->notif))
-			return true;
+			/*
+			 * We don't need to go up further, because if there is a
+			 * listener with nesting allowed, then all the listeners
+			 * up the tree have allowed nesting as well.
+			 */
+			return !cur->allow_nested_listeners;
 	}
 
 	/* Mark first listener in the tree. */
@@ -2062,10 +2074,12 @@ static long seccomp_set_mode_filter(unsigned int flags,
 		return -EINVAL;
 
 	/*
-	 * The SECCOMP_FILTER_FLAG_WAIT_KILLABLE_SENT flag doesn't make sense
+	 * The SECCOMP_FILTER_FLAG_WAIT_KILLABLE_SENT and
+	 * SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS flags don't make sense
 	 * without the SECCOMP_FILTER_FLAG_NEW_LISTENER flag.
 	 */
-	if ((flags & SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV) &&
+	if (((flags & SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV) ||
+	     (flags & SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS)) &&
 	    ((flags & SECCOMP_FILTER_FLAG_NEW_LISTENER) == 0))
 		return -EINVAL;
 
diff --git a/tools/include/uapi/linux/seccomp.h b/tools/include/uapi/linux/seccomp.h
index dbfc9b37fcae..de78d8e7a70b 100644
--- a/tools/include/uapi/linux/seccomp.h
+++ b/tools/include/uapi/linux/seccomp.h
@@ -18,13 +18,14 @@
 #define SECCOMP_GET_NOTIF_SIZES		3
 
 /* Valid flags for SECCOMP_SET_MODE_FILTER */
-#define SECCOMP_FILTER_FLAG_TSYNC		(1UL << 0)
-#define SECCOMP_FILTER_FLAG_LOG			(1UL << 1)
-#define SECCOMP_FILTER_FLAG_SPEC_ALLOW		(1UL << 2)
-#define SECCOMP_FILTER_FLAG_NEW_LISTENER	(1UL << 3)
-#define SECCOMP_FILTER_FLAG_TSYNC_ESRCH		(1UL << 4)
+#define SECCOMP_FILTER_FLAG_TSYNC			(1UL << 0)
+#define SECCOMP_FILTER_FLAG_LOG				(1UL << 1)
+#define SECCOMP_FILTER_FLAG_SPEC_ALLOW			(1UL << 2)
+#define SECCOMP_FILTER_FLAG_NEW_LISTENER		(1UL << 3)
+#define SECCOMP_FILTER_FLAG_TSYNC_ESRCH			(1UL << 4)
 /* Received notifications wait in killable state (only respond to fatal signals) */
-#define SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV	(1UL << 5)
+#define SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV		(1UL << 5)
+#define SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS	(1UL << 6)
 
 /*
  * All BPF programs must return a 32-bit value.
-- 
2.43.0

