Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F835CB88
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073481; cv=none; b=DKe/JsKQldJvorxwA0FfuzI2R9O7F+AEtlPdiBdQPYKViYpTkeopCvBZCDhUABTPZT9LoEx6zmMAwkz41quJ96jCGUdfM2Oz2ceuP5GuvZODhukuRQNWZ5JKKkmNEyuS/vBky2NHG5B3xmPduXw/aKRl5srcURDAArq1ZUVYhPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073481; c=relaxed/simple;
	bh=5C+RcXkK3A1ZSReLK1qZRhNMinh6jju+ITuqispS68k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8663iigkI+cDOo1Cb80pBwaioeZDu7SyLzdRK+KU7O9Bnf72qS7TkHWmnN+Hxl+pa2Z/IkPKc7OO3zuXfYgVuaPrVGsuwxJ5sAcRx46TVFiS+CAfjn8qYdti1ddUo3GzfKyc6xqttuQifa13ZHoqOerr+2lf5SeFDMw5+WAJRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=NYaWSNDB; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="NYaWSNDB"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78c35dc5806so6305907b3.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 07:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766073478; x=1766678278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbo/Q10fOjWM8sV0DuXlsI6QStMFfk28dpPwdp8oFO4=;
        b=NYaWSNDB/GqgzVl4W6cHP62JmAtBBzz+6u97qalxSCQoP7P6TEdi+7QU32H0mm+Rhl
         S25jXETCTi9ddtTPFNX5H6cVzTME2FVqoeMy2G/zet6DpUX8kudYQz4aJQrRCxGF0Btd
         +TpMVQi3bLSqtIKP51cE+vLAJt6dqW3QtqHIQCfkCQpHf5dAj4KdKPINEm4DuaX3dlzf
         vLlMHwjfhj7UbXxzP+wYhrx8cceKRDkbGoC0ZPC1GPyghlJ1z6Yd+n+YH5cfp1G49/4n
         dq6JqI9IHWU95/RYqMo2B9PEs30dQoy2lAOjZmbvOhYuN5dlrO68YSL6kpiH7ob6jJFA
         i1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766073478; x=1766678278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kbo/Q10fOjWM8sV0DuXlsI6QStMFfk28dpPwdp8oFO4=;
        b=h6gZYUnX7cEkhzh9urrd0RE0x1imNTJ8mypCUwF4OBaXPs1tXhMp1KrqAKDklXzOdP
         36GqWiWE0QqFyQrAurJCEtBLq9cEr3HsMPlgt+t8u9677E9fIn+xQB8XpRSzjhrQdEe4
         Hv1S9OeKX07nfHUn5WGVuPMLJCZuPhDWKqg2mViYfI3KlcjujXFNxzkEqCHVH7amD8LK
         nEsLhp/yQeBcUSonpmgVrfZ/P752ulqZOO1jcnygnjXg0oB6RnWZzCnze8VHMvhLGQXp
         yWKt+ij9JXq5egHFZPCidg6clwgM07i4x64havtmHM6daFGaWjO2fRlODkQgU9jIpsuH
         s4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVpMFYD3RVjqjO8LAds/NWQNGJ0lGBc1d7uhdxW/1aACTkUxPsbSvcGvzaJrw/ADWbwkYirygGbPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWy2HvyfXJ8TBEORhvWiDa6vBeh3elJoqfqYYO47m4DeoK5lNk
	xaKdRqqwQQS9uuDVTVcvTQf23j9fJiSIpV/fz6SPfYB6etfP2N+8D3Io0cjh6gCNTMk=
X-Gm-Gg: AY/fxX4Pql1Q5AXUJ7MEr9IKfEP/zhqc8vkvcaCUsnGTi3w4IvJlg7gVU8+kaD6ygML
	qDMwEz5F4mZTlvwgxuRYvkO5agFgz/nZZiEnDeugBNwnxP3LOG885PoVs3OO2C8bTrsMRb4eh5h
	B9AOePDsmtYsItCusCOYvqmNarvpOKRtOhyrtogXNJVRzrUa0yt4SYvn2Xij2QszkM2zL1hfNsL
	X8br8MfjeXcKc2+lWwprGXKOOysMSEC/mek4lsw6o4/7GArv9jWC9RsRgPXH5bIMX9ka3rBS+Ft
	p/8RWWkEipies2bXsPb72qgQXRMsjCCERNtlLFbpQm8r2HMJENrMBMppmlhTsFo2zcbSDAlJCl5
	pUbofBRDtRn9N7JnQboMy3XIioMe1+6m6soHP8wkLQCIKlmyyGUwIMfoxquSIrO4CPLFG/GG5m1
	YtNXYr2xN6ENrLSB6eypMJ7OG9xcUmSrCO26K/gag2HHxvqZiVsT7xirt6/Doy1wxhG1OSxe84m
	9Pv0B2LqPWB8zDsGIBPtGPYBvN5ZXrBNaFf4g==
X-Google-Smtp-Source: AGHT+IHF15CHFSvn2iw7JiSe1zOiuiDDwSN7HW3uphvKiqLN0UcGgr621SGo4sNapWA5IhaiEHGrRw==
X-Received: by 2002:a05:690c:488a:b0:78a:6fd9:ef49 with SMTP id 00721157ae682-78e66951cb2mr177183317b3.14.1766073478421;
        Thu, 18 Dec 2025 07:57:58 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fa6f52bb2sm9348467b3.16.2025.12.18.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:57:57 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	skhawaja@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	tamird@gmail.com,
	raemoar63@gmail.com,
	graf@amazon.com
Subject: [PATCH v2 1/5] list: add primitives for private list manipulations
Date: Thu, 18 Dec 2025 10:57:48 -0500
Message-ID: <20251218155752.3045808-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.313.g674ac2bdf7-goog
In-Reply-To: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux recently added an ability to add private members to structs (i.e.
__private) and access them via ACCESS_PRIVATE(). This ensures that those
members are only accessible by the subsystem which owns the struct type,
and not to the object owner.

However, struct list_head often needs to be placed into the private
section to be manipulated privately by the subsystem.

Add macros to support private list manipulations in
<linux/list_private.h>.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/list.rst |   9 ++
 include/linux/list_private.h    | 256 ++++++++++++++++++++++++++++++++
 2 files changed, 265 insertions(+)
 create mode 100644 include/linux/list_private.h

diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
index 86873ce9adbf..241464ca0549 100644
--- a/Documentation/core-api/list.rst
+++ b/Documentation/core-api/list.rst
@@ -774,3 +774,12 @@ Full List API
 
 .. kernel-doc:: include/linux/list.h
    :internal:
+
+Private List API
+================
+
+.. kernel-doc:: include/linux/list_private.h
+   :doc: Private List Primitives
+
+.. kernel-doc:: include/linux/list_private.h
+   :internal:
diff --git a/include/linux/list_private.h b/include/linux/list_private.h
new file mode 100644
index 000000000000..6f93d54e797a
--- /dev/null
+++ b/include/linux/list_private.h
@@ -0,0 +1,256 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+#ifndef _LINUX_LIST_PRIVATE_H
+#define _LINUX_LIST_PRIVATE_H
+
+/**
+ * DOC: Private List Primitives
+ *
+ * Provides a set of list primitives identical in function to those in
+ * ``<linux/list.h>``, but designed for cases where the embedded
+ * ``&struct list_head`` is private member.
+ */
+
+#include <linux/compiler.h>
+#include <linux/list.h>
+
+#define __list_private_offset(type, member)					\
+	((size_t)(&ACCESS_PRIVATE(((type *)0), member)))
+
+/**
+ * list_private_entry - get the struct for this entry
+ * @ptr:	the &struct list_head pointer.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the identifier passed to ACCESS_PRIVATE.
+ */
+#define list_private_entry(ptr, type, member) ({				\
+	const struct list_head *__mptr = (ptr);					\
+	(type *)((char *)__mptr - __list_private_offset(type, member));		\
+})
+
+/**
+ * list_private_first_entry - get the first element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the identifier passed to ACCESS_PRIVATE.
+ */
+#define list_private_first_entry(ptr, type, member)				\
+	list_private_entry((ptr)->next, type, member)
+
+/**
+ * list_private_last_entry - get the last element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the identifier passed to ACCESS_PRIVATE.
+ */
+#define list_private_last_entry(ptr, type, member)				\
+	list_private_entry((ptr)->prev, type, member)
+
+/**
+ * list_private_next_entry - get the next element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_private_next_entry(pos, member)					\
+	list_private_entry(ACCESS_PRIVATE(pos, member).next, typeof(*(pos)), member)
+
+/**
+ * list_private_next_entry_circular - get the next element in list
+ * @pos:	the type * to cursor.
+ * @head:	the list head to take the element from.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Wraparound if pos is the last element (return the first element).
+ * Note, that list is expected to be not empty.
+ */
+#define list_private_next_entry_circular(pos, head, member)			\
+	(list_is_last(&ACCESS_PRIVATE(pos, member), head) ?			\
+	list_private_first_entry(head, typeof(*(pos)), member) :		\
+	list_private_next_entry(pos, member))
+
+/**
+ * list_private_prev_entry - get the prev element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_private_prev_entry(pos, member)					\
+	list_private_entry(ACCESS_PRIVATE(pos, member).prev, typeof(*(pos)), member)
+
+/**
+ * list_prev_entry_circular - get the prev element in list
+ * @pos:	the type * to cursor.
+ * @head:	the list head to take the element from.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Wraparound if pos is the first element (return the last element).
+ * Note, that list is expected to be not empty.
+ */
+#define list_private_prev_entry_circular(pos, head, member)			\
+	(list_is_first(&ACCESS_PRIVATE(pos, member), head) ?			\
+	list_private_last_entry(head, typeof(*(pos)), member) :			\
+	list_private_prev_entry(pos, member))
+
+/**
+ * list_private_entry_is_head - test if the entry points to the head of the list
+ * @pos:	the type * to cursor
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_private_entry_is_head(pos, head, member)				\
+	list_is_head(&ACCESS_PRIVATE(pos, member), (head))
+
+/**
+ * list_private_for_each_entry - iterate over list of given type
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_private_for_each_entry(pos, head, member)				\
+	for (pos = list_private_first_entry(head, typeof(*pos), member);	\
+	     !list_private_entry_is_head(pos, head, member);			\
+	     pos = list_private_next_entry(pos, member))
+
+/**
+ * list_private_for_each_entry_reverse - iterate backwards over list of given type.
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_private_for_each_entry_reverse(pos, head, member)			\
+	for (pos = list_private_last_entry(head, typeof(*pos), member);		\
+	     !list_private_entry_is_head(pos, head, member);			\
+	     pos = list_private_prev_entry(pos, member))
+
+/**
+ * list_private_for_each_entry_continue - continue iteration over list of given type
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Continue to iterate over list of given type, continuing after
+ * the current position.
+ */
+#define list_private_for_each_entry_continue(pos, head, member)			\
+	for (pos = list_private_next_entry(pos, member);			\
+	     !list_private_entry_is_head(pos, head, member);			\
+	     pos = list_private_next_entry(pos, member))
+
+/**
+ * list_private_for_each_entry_continue_reverse - iterate backwards from the given point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Start to iterate over list of given type backwards, continuing after
+ * the current position.
+ */
+#define list_private_for_each_entry_continue_reverse(pos, head, member)		\
+	for (pos = list_private_prev_entry(pos, member);			\
+	     !list_private_entry_is_head(pos, head, member);			\
+	     pos = list_private_prev_entry(pos, member))
+
+/**
+ * list_private_for_each_entry_from - iterate over list of given type from the current point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing from current position.
+ */
+#define list_private_for_each_entry_from(pos, head, member)			\
+	for (; !list_private_entry_is_head(pos, head, member);			\
+	     pos = list_private_next_entry(pos, member))
+
+/**
+ * list_private_for_each_entry_from_reverse - iterate backwards over list of given type
+ *                                    from the current point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, continuing from current position.
+ */
+#define list_private_for_each_entry_from_reverse(pos, head, member)		\
+	for (; !list_private_entry_is_head(pos, head, member);			\
+	     pos = list_private_prev_entry(pos, member))
+
+/**
+ * list_private_for_each_entry_safe - iterate over list of given type safe against removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_private_for_each_entry_safe(pos, n, head, member)			\
+	for (pos = list_private_first_entry(head, typeof(*pos), member),	\
+		n = list_private_next_entry(pos, member);			\
+	     !list_private_entry_is_head(pos, head, member);			\
+	     pos = n, n = list_private_next_entry(n, member))
+
+/**
+ * list_private_for_each_entry_safe_continue - continue list iteration safe against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing after current point,
+ * safe against removal of list entry.
+ */
+#define list_private_for_each_entry_safe_continue(pos, n, head, member)		\
+	for (pos = list_private_next_entry(pos, member),			\
+		n = list_private_next_entry(pos, member);			\
+	     !list_private_entry_is_head(pos, head, member);			\
+	     pos = n, n = list_private_next_entry(n, member))
+
+/**
+ * list_private_for_each_entry_safe_from - iterate over list from current point safe against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type from current point, safe against
+ * removal of list entry.
+ */
+#define list_private_for_each_entry_safe_from(pos, n, head, member)		\
+	for (n = list_private_next_entry(pos, member);				\
+	     !list_private_entry_is_head(pos, head, member);			\
+	     pos = n, n = list_private_next_entry(n, member))
+
+/**
+ * list_private_for_each_entry_safe_reverse - iterate backwards over list safe against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, safe against removal
+ * of list entry.
+ */
+#define list_private_for_each_entry_safe_reverse(pos, n, head, member)		\
+	for (pos = list_private_last_entry(head, typeof(*pos), member),		\
+		n = list_private_prev_entry(pos, member);			\
+	     !list_private_entry_is_head(pos, head, member);			\
+	     pos = n, n = list_private_prev_entry(n, member))
+
+/**
+ * list_private_safe_reset_next - reset a stale list_for_each_entry_safe loop
+ * @pos:	the loop cursor used in the list_for_each_entry_safe loop
+ * @n:		temporary storage used in list_for_each_entry_safe
+ * @member:	the name of the list_head within the struct.
+ *
+ * list_safe_reset_next is not safe to use in general if the list may be
+ * modified concurrently (eg. the lock is dropped in the loop body). An
+ * exception to this is if the cursor element (pos) is pinned in the list,
+ * and list_safe_reset_next is called after re-taking the lock and before
+ * completing the current iteration of the loop body.
+ */
+#define list_private_safe_reset_next(pos, n, member)				\
+	n = list_private_next_entry(pos, member)
+
+#endif /* _LINUX_LIST_PRIVATE_H */
-- 
2.52.0.313.g674ac2bdf7-goog

