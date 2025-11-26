Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D433B6ED
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183453; cv=none; b=Zqzy0eChVrtFCG0HP3sbMziYDXf2ZtYPUFp979Ig+s+i4uZIW69HGf2cs7I3PjQC5nZ4dBUOLBzhBJCQbNN7ZVzxk8vmPEhlQdKx3vQimCcZ9diaiOA+3ufhiIOWVr+ZIpp51bwGm+DB3ZNO/c95eIgvqojZDPRAIgSiOKVf6bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183453; c=relaxed/simple;
	bh=44wvrjsJsA56OuYSPS9rS3D1Jv0o0ZdFIoHQwFGkRDc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VO5txcdblg1PRv4qC+lJOvAw1ih/zK5XkxNfzIVuMuqr9rpiiQVIDvPc8QPaVy70GxtF8Sh5wXoqYTtYbJgBzvY/qypBujhValFX0UDhkhIQhElGGp+3KvNhWNKoqvtC9a/8xUXxtDcuR2akrOBMtq9z5X6K4FO11lukWsqId/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=hlcQvjOl; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="hlcQvjOl"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64308342458so109082d50.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764183451; x=1764788251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=252XjyR+0lgh5x/2v3DurnNqDLZdTdfYV2jUwplovA0=;
        b=hlcQvjOlT/nt6c3sIr0osj95aOONwCwkDR2AQGaI/Q+Dmn58eA387QpfdzPhXPGCOB
         vESovq0hqFkRQSHx3N9TFtRKVoCPhg8LW4W3ee6ftCSR5DuTTf6wP7YJnLYcD5C1C5B2
         sci2wf+8W0demdIhB9JqEcn9z4iig9tHyDknHg8GPlziaD8xjdhnkcHM+U4EhcqypR4O
         aLzX6JSSUOJxCkYKoJAhVDlqq4EAhNdLSoPatbr6lcTg7Pgp6Saf9FsNx3rrqoZCyXqk
         WJvD4XYo6oIJQc5smg7Hu8MJPLmXoUo9HNIye2exQsJNaO5NoYFGSqWI2APMdJDsXuKn
         rQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183451; x=1764788251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=252XjyR+0lgh5x/2v3DurnNqDLZdTdfYV2jUwplovA0=;
        b=Kck8b1ntyb9Sm9ZhQbE/6mb3oKgATRmTjX7VPTyJ9FG44PzYSw8oz6x/PxdQiGUkf3
         ZazA6YPpIO0xchNcjWVAT4PX98JM1tAHkUzBzSjpRHLns7JRrwLsBWSNFD6DTv5aQsmf
         sbC+VORx4gbKcwcWQpKPPO1XrHL4nchdigX89KXUINbZeX5rNqsC8wyyollotfG7ViXt
         7iweT7fGUax7vKpJzbONtHx8DVMFfgD/XhUXVTdGe0IN4KFY1nvqz1sAKz+E7jr5Thx1
         vltXSf6clc+CX/pPfrP8bOKcojZG0YzQJtQy6/AcdU8ch2+a+PbYkmPbHbRN91IIKRvO
         o8+A==
X-Forwarded-Encrypted: i=1; AJvYcCVeoGaipjYy0tvcMD+JXA4acnadUwZcs+mDGzNowVS4dfMV7SG4t3B2XOogTchIvHHOk94Ir6DD5kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgL9zB4yUuxvMGlxPnn2GByyjqbxhjLUQPG6Z+wmXxKXJZ6n4E
	bSPdl1NskAtlvZZbcVGsojfd04VBZlJVa1zh9YlIjS9RcMzEb5htn21/JpdRdkN4F5I=
X-Gm-Gg: ASbGncuFW038k8BPbJujeYm0gMUHCrM4/+apZSJfo7arJO/N0IHUXDra9f/fz7wY9Ah
	ZC17LHmYD1J1UsunCVgFBo7eUbty/FEWI0Zejqs16RK8co2o2c4PD1fyE7bDf4tOe50rItHwF3c
	FgLMeqsmDwCTyXuGLMSOfA9/TfUc7lqZcgOBBZdHffLu5O3L/OzqTSmKp+YDtyCHpuV5i4vFZQH
	c5HB4DcMkq9FcAru09tPXdSDLwSdImXJ+Iu6ggWRlpaBT8TToHU18nwgZDg/BIqH3g3dXAp1eTI
	CoRKh/Ncr0NHEfoCb5kqMcw3XxqUa/vYz+HTTz1NsIyhjydGIbmVP+Ye3X//zgy4E9gNEtDEzdz
	d9xhoYY2XPnG884a6y4mbCL74nNATG+qmG2IWxkDPkJL3Fg4rcZib0hJAHWgjUWscnxdBPXKqHB
	0pQlTPKZeTvKYRYz6P19pef1eSamY0d4epa3ug/lVejqUJfVAIgJA0+1i6ZOMq6Q5G1LnRVn5or
	HiB1d34FFi9H8dH8A==
X-Google-Smtp-Source: AGHT+IHu24upDOl7ro9ofRNY1haZ/Bs6YtgAgi3REfJFG6MqRROVjAAPoCaKTsxQrfJqTFs30v63Ng==
X-Received: by 2002:a05:690e:784:b0:63f:b590:2e9 with SMTP id 956f58d0204a3-64302aa4865mr11760784d50.21.1764183450703;
        Wed, 26 Nov 2025 10:57:30 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-643259fd696sm2960753d50.7.2025.11.26.10.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:57:30 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: corbet@lwn.net,
	pasha.tatashin@soleen.com,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	tamird@gmail.com,
	raemoar63@gmail.com,
	ebiggers@kernel.org,
	diego.daniel.professional@gmail.com,
	rppt@kernel.org,
	pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	dmatlack@google.com,
	rientjes@google.com
Subject: [PATCH v1 1/3] list: add primitives for private list manipulations
Date: Wed, 26 Nov 2025 13:57:23 -0500
Message-ID: <20251126185725.4164769-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
In-Reply-To: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
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
2.52.0.487.g5c8c507ade-goog

