Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337EF38AC90
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181389; cv=none; b=nuM8fN7LXGeSyhLuVsVssBIZl1j317gjiBMTSmgDE7WqWhLz4QOEA9K5gfGO//l37JbEUhtxP62JPguq9qw/kbmSAgHPXotnMJFbJ2deLq9wTkG85YUbWC5Hs8MebEFVIuNUxlu0jxgOn8yMbe5MTnckoyYLz9pGIVlg581HCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181389; c=relaxed/simple;
	bh=HyMlUX/W9HvvI5kZhh4XgDfUUhUda5AirsyOm9dGlUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g3nBy/CHcFXEgtnU2weT94FQzMJWKaUnLAvDuEHgOd97rfAMi4hEfW9Q1xFWglitDSHgLm2vN5VGz6OmcTkqZ7ub354o90KWEtgXnR5ixWtaI39FK/pwUKMgQFiraMeYM/fvmy5g0FYOxv598ydIOlkGNTZEjnBHB7hJfDwzPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=QhKCS5ty; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="QhKCS5ty"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-893c38a5981so1090977b3.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 09:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1790181379; x=1790786179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8ztzFzESiCouCMaYiUr65tJ28qhpNA5LSgzOI3RJSU=;
        b=QhKCS5tyYcQwxn+dfVzq7sGjioWxu2ybxkIxfXdUJioJuhAMZeBkge8rawr/9F1xVM
         7MAZxqAeIh6t3tie7645xAt1j92seJBopW5YOwg/5lJO4678Rq8RFdNc2e0vZZWDS+do
         zYX/AR7TkonFvYJJ8vqbmbSOjWgIkL7JU+obB7deYyCg5dDaamUeQaCFsrRmIG/RTIdK
         ZabJksbPlhdJ+HNZ8llKwuzIWl8O6g22HgBZEaO5CQze4ET7W3XxKzdjmp/neb0Zd1R3
         nKae+V5+1/wgR29z9OgCeCYvsm4gSh2edqqR4a7hkS0r5x6WcID6rCu6Jz4743shyUzO
         r1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181379; x=1790786179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8ztzFzESiCouCMaYiUr65tJ28qhpNA5LSgzOI3RJSU=;
        b=Ofr7ZzpgONXayePWN177398PxJ5CPlPiaazr5vFaEsr+VMuQuIebetpffOvyvqHkwg
         cgvh3Age1cczvFPa5l3EW60LuIhTIOO6M8lc4nYoSIFsykXDGoo7z0sSZfRD9ZjRSRnT
         yADZOai9+DpzxfZs5AoRDHRWG9np7yPYuvvnBvHEaLs2DySKeEYgzjD5f0TmV14uZc/4
         R6vtmmJXc0eBFioKxwG44nC71q5CWO+ulI0+oTJcZY+sbexRQ1iQXT0p2ho/hDIV+iV6
         nByYwroINgPMgT0inkxwHeNWJ3kmLsVu0lG3QZHYePkr1JWfb0YLnBjsSOjiIwYMQSUW
         DMiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx85n6qLkrcMJ6/fcN7l4vKS/4UuXIsS3Sv2QXG9OSJLLlZv/uyz4pYU6j1SxjAlYGc+fEYpKftQ2I=@vger.kernel.org
X-Gm-Message-State: AFuF++mV+BlKDzzVkrx19mzJjwu2LJwSi8G6Vf7aRL07ACMm2sCFGMti
	1/3WNV3Nz5rHz2qOW9Vb5ozAgOCD29JxnclA+4kWolG1b5qHih2hjj5U9vsq8SPhaJGd
X-Gm-Gg: AYBFou1v17+uREvPjHSOPEtwYq5m3PdvyP7Lkn1FuRtioAl2KXNXNAT5ByTXdSl6gic
	jxOF1SYxLnWIjg1e9U/w7Ds13oK4NvzdbcRz7+2EmaM7Fja0nZYc2QfzCGZC6BNy0oiB798s4Wn
	5fwOwTFPxQhlCiEFsQFc8Yh0FhIOEvbFrftFYhcZ2TiyJbFX6Nghdcf5oa9e92WDP/PPsobQ5jW
	eVYMl+Mp8UO0SetPQTAm+mmQggU2L4cwXe7gEIAQDPjDFFxfJ3P/L4UqlsStj7x+dfJwkH/fCmW
	WEmtIgj4YPNT/UuJZdqyur/dXC2kTvza5CgqhIHpkxj017SyRQyxgQp0mNp4QMcwJpzQb0eHRRR
	Y8E+/Z6QLdhvdOcrVv55zXGqdUiJv4oRbK4d8CJBDlQtVz47MHPoy3N4Uct4hBBai3Ch6EwJNkc
	zlSSPyvbpSJI34hr+BuiHnyIr1x5/YjQlQ4v1AjNsT1J/hHF0reqopsPP0BjzCpGWn1JEiY0Mfx
	NfKttXuekc8z8iWbdXp+IZS6JPEXRAXHsacwc4=
X-Received: by 2002:a05:690c:6b13:b0:862:bb29:a715 with SMTP id 00721157ae682-8a45bb793d0mr35516137b3.3.1790181379194;
        Wed, 23 Sep 2026 09:36:19 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c9778sm12709257b3.8.2026.09.23.09.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:36:18 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] docs: landlock: clarify TTY signal scoping
Date: Wed, 23 Sep 2026 12:33:20 -0400
Message-ID: <20260923163321.79770-2-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923163321.79770-1-clusk@northecho.dev>
References: <20260923163321.79770-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LANDLOCK_SCOPE_SIGNAL limits signals sent to arbitrary processes outside
a domain.  A PTY master differs because its holder controls attached
processes through input and signal injection.

Clarify this boundary in the userspace guide and narrow the UAPI
description to arbitrary target processes.

Built the userspace-api docs; no new warnings.

Link: https://lore.kernel.org/r/20260916152336.1589383-1-clusk@northecho.dev
Suggested-by: Günther Noack <gnoack@google.com>
Suggested-by: Mickaël Salaün <mic@digikod.net>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---
 Documentation/userspace-api/landlock.rst | 6 ++++++
 include/uapi/linux/landlock.h            | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
index 84cb7bf6b3ed..4d9fb1f1588c 100644
--- a/Documentation/userspace-api/landlock.rst
+++ b/Documentation/userspace-api/landlock.rst
@@ -430,6 +430,12 @@ The operations which can be scoped are:
     This limits the sending of signals to target processes which run within the
     same or a nested Landlock domain.
 
+    Holding a PTY master FD grants control over the processes running under that
+    terminal, including the ability to inject input and signals.  A process able
+    to write to the master should therefore be considered as privileged as those
+    processes, and this capability is not restricted by
+    ``LANDLOCK_SCOPE_SIGNAL``.
+
 ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
     This limits the set of abstract :manpage:`unix(7)` sockets to which we can
     :manpage:`connect(2)` to socket addresses which were created by a process in
diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index cceda3b3b961..ad7b1ebd62ed 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -500,7 +500,7 @@ struct landlock_net_port_attr {
  *   connecting to an abstract UNIX socket created by a process outside the
  *   related Landlock domain (e.g., a parent domain or a non-sandboxed process).
  * - %LANDLOCK_SCOPE_SIGNAL: Restrict a sandboxed process from sending a signal
- *   to another process outside the domain.
+ *   to an arbitrary process outside the domain.
  */
 /* clang-format off */
 #define LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET		(1ULL << 0)
-- 
2.55.0

