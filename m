Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D9F2989BC
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457225; cv=none; b=IIQG/eIlxwHm8OY2A7lraB84yomgaKpGmv8Ht/2NVF+TIx6cI5Ha1M1yCp4tk3a3WRoHwS/fRluWurWUm7rIfHwJ3VkiOVEv2CkGNnxgFQH1Oxp1V0LReM8uxgwXEixghdwU14m2yqyf9ikmjh/F9i0QBk355Xu2gZxMn6GIZ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457225; c=relaxed/simple;
	bh=KlnlyD3GULaarSpQawO7uLrMOMtNq2Im5xzf3rc9j7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THW0s5O+moVfL1l/yEcRzVPABHIRknKdXzEH6aMlPJK83uuoCOAEJU/sY37vRk0gh01QJDmW7CGeXPdNLCw46F9vtCYsrTOfaRLzdn21qXgpZ1RydkrEvIFrXE+V5KxUjrNi76bGG9Q/SUNC+5Z5pt/2Oex1uLrzUwU58uabI3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=pNvAaBWB; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="pNvAaBWB"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4BBE13F682
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765457209;
	bh=I5FQi0ANvMyxYUi59ipfg7QnXBeGhk5Egxi4bOQoBQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pNvAaBWBmZbeNt/87scDxP5C2M7LKikEB8HUFG+fCWvQ4/kLhzbscJhuMcnSQRz1Y
	 lgyKMKlO9IBN7yMJgzjmHt0V1Ww3Kl9E51LMWKd6L2qsKwLgq6d1fSiTcUhxU9LA9+
	 +06F2JTcatXmWkbXT+dwjnZ+5U+LoI/6HblQzuGPAxpxIuDMg7ehD9PXSUNh3IVju1
	 Fv2bynR20GSYdhRMEVoSKw/hPpCQuzLOO3fR8TRMnLZV/3q2mpmMb+O3pHbRL6fzoX
	 2Tg8D0Eh6VpysjO5GiFd/zDne2zXgmTYu8UqeHkglBojbgI4Bb5bvtWs01xm4OZAEf
	 3sC2TF80RxRZ0AQ4DzQIOh1mLbBz8t0PvPI91mrkHv7mNZeI1xlSr7e/VQ72FXsR28
	 UcTWT1JGBEj6RuQlWoFHY6Mos/m9fqVuWFexuJqqNNPNUncQSpLHlUi5UCXN6Kg2hw
	 kiY3pQexCeBtBJZxKryOG9ZsrJrjuXmbeoMZBaI8GqCUHdhAsGh6OFIdI4G3IZChOL
	 Y2A6ml6nzMdfR1ULsvPnkjwbgJXKv2OuoOtH1jm4N4zJWh+dV8kUtRlHQSZ0bW+YgL
	 tLjq7nIU0vJh8DAPfol06U5bvn89A1ryJO68+/t972cdE6WHWR2OCFEbbKjIgwSbyu
	 OFes0LHZH+hYAiovCreFd/nI=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47775585257so364625e9.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 04:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457195; x=1766061995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5FQi0ANvMyxYUi59ipfg7QnXBeGhk5Egxi4bOQoBQI=;
        b=V7t1b7v1+cCvT/BPGtpPiCuJEmAA2bbGjHh6ss1T8fSSgLXyH+dU7+b5I5sa/i/OPD
         6gsiTEuy/xNqDr6a7UkZ2LjGjJt03/wANV+sTXnKhGy/0P7xX9nD/ZTrIbUzhUrWsPyo
         yJ7BWKq4J1z0WO43HJqOBBRR+91EuPNX9AE9YQ3TtGbtgp7uVKGQ0CiJLPqzdLuDTq5N
         evDEzezrDWhJ82u801gh/+WpHRN4ELSds350+bx9X5Sk24N1jtbmMk+t2tw/P9L8K/3P
         5ACpGdTaXEYsY6YsJWygxV2EqnhF1F43lKk+UqgxNGF1dCyfo9HY+jyyTZpNdO8r/mgj
         EBEQ==
X-Gm-Message-State: AOJu0YxIOYSWbRoQLMk6YCnKBcGE1I3QUXGwsgtO/EmOpwfDwzN0tHtX
	DWW/sJxtaMF24G+4vtvT49+8zkWypCB1x4PAnbgjzdRuKidzWS1NhMFiyV5IfvsQh0spXCHVGYN
	2f8pJ8kExu3msu+p4IvEj0f+GuyVzfNDCVjJecjFG6ttoMzaqsKQ02J7y+BT07z6Zst/NLBUQx+
	rGfg==
X-Gm-Gg: AY/fxX42br2FxeSNxKcJM7/2TyjQQbBvaeCgtSWB3WPogY+Dfvd6w+IaXIfu0TjS8Vh
	Wo0m8roYWU5Jgs/we3GSyMHNAa9/EhnNNEC89hwPOF7IIv9lvZ6a7MQvJEi5gDzB16M2fLcCxMs
	XroTMmy3UsUl1+cOdrOwW3cWsILdAk6pfCCO5omJLGOeoZJpjX4YYePae4a+XFg2OlR2Wrt1Dfo
	QDtlhoJhpgWPgr4ZSfo22kPooxoKn4L4lGyjZ+oCwJfZMHU5/Aptm+m7B9505klLR3c+vJCcrkl
	rKiIhwPvsZZeZ0MrlTzhXPKRzzVBExXHK6ZUnf1Rpo5FbVlvNkP3lv5ZRf22WssAMbuqS8Nk/Sw
	svGUQ++q8HoGyxe+vvxxJ4UUIjhuiwU+xeYTamMbhP4SWxdU39Hwcka6VQOVyW5OtKy7Etr3cYb
	0NLQj3Tu7Vn/+u9NTtM4kbGVw=
X-Received: by 2002:a05:600c:b8a:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-47a83847b05mr64907275e9.30.1765457195242;
        Thu, 11 Dec 2025 04:46:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE04Bu9T9811Vk3v7Uu4T4rO8U+ertcr5E4wLm6pw5TUxW8Cj3giRIH0Ltz2lCx55IZNIR5JA==
X-Received: by 2002:a05:600c:b8a:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-47a83847b05mr64906845e9.30.1765457194787;
        Thu, 11 Dec 2025 04:46:34 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf57022000e6219d5798620e30.dip0.t-ipconnect.de. [2003:cf:5702:2000:e621:9d57:9862:e30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f0d6f2sm32075905e9.13.2025.12.11.04.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 04:46:34 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kees@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Subject: [PATCH v3 4/7] seccomp: mark first listener in the tree
Date: Thu, 11 Dec 2025 13:46:08 +0100
Message-ID: <20251211124614.161900-5-aleksandr.mikhalitsyn@canonical.com>
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

Let's note if listener was a first one installed in the seccomp
filters tree. We will need this information to retain old
quirk behavior (as before seccomp nesting introduced).

Also, rename has_duplicate_listener() to check_duplicate_listener(),
cause now this function is not read-only, but also modifies a state
of a new_child seccomp_filter.

No functional change intended at this point.

Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
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
 kernel/seccomp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 89ae81f06743..1a139f9ef39b 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -205,6 +205,7 @@ static inline void seccomp_cache_prepare(struct seccomp_filter *sfilter)
  * @log: true if all actions except for SECCOMP_RET_ALLOW should be logged
  * @wait_killable_recv: Put notifying process in killable state once the
  *			notification is received by the userspace listener.
+ * @first_listener: true if this is the first seccomp listener installed in the tree.
  * @prev: points to a previously installed, or inherited, filter
  * @prog: the BPF program to evaluate
  * @notif: the struct that holds all notification related information
@@ -226,6 +227,7 @@ struct seccomp_filter {
 	refcount_t users;
 	bool log : 1;
 	bool wait_killable_recv : 1;
+	bool first_listener : 1;
 	struct action_cache cache;
 	struct seccomp_filter *prev;
 	struct bpf_prog *prog;
@@ -1939,7 +1941,7 @@ static struct file *init_listener(struct seccomp_filter *filter)
  * Note that @new_child is not hooked up to its parent at this point yet, so
  * we use current->seccomp.filter.
  */
-static bool has_duplicate_listener(struct seccomp_filter *new_child)
+static bool check_duplicate_listener(struct seccomp_filter *new_child)
 {
 	struct seccomp_filter *cur;
 
@@ -1953,6 +1955,8 @@ static bool has_duplicate_listener(struct seccomp_filter *new_child)
 			return true;
 	}
 
+	/* Mark first listener in the tree. */
+	new_child->first_listener = true;
 	return false;
 }
 
@@ -2035,7 +2039,7 @@ static long seccomp_set_mode_filter(unsigned int flags,
 	if (!seccomp_may_assign_mode(seccomp_mode))
 		goto out;
 
-	if (has_duplicate_listener(prepared)) {
+	if (check_duplicate_listener(prepared)) {
 		ret = -EBUSY;
 		goto out;
 	}
-- 
2.43.0

