Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473BC30C62A
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591867; cv=none; b=CdIbvqrPdFBXiQfEKsg5OuF7YGetzPd3YeAxsLYbPyMdaJA/O/WYbjLKM0qnlMtYdLM4Fj9vrRGuzDMny1OA965uT67fJeOT6FrB+n/7llrYuSKJiDhAuYV2A7gThD1s2cM+thm8FZYo33U+nxQ8/3plXpXg72J1lY80j02lk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591867; c=relaxed/simple;
	bh=zX8NS3dWkP2kRHi9JuvLsUigUyl5bWfZvHSDrk2+hPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4EYLn+14v0K0EX/HSQnS0xHV06g8+RQV6RWconpf4WCIakzmdwPlZNJe+bX2dS/4Plw+XgqXV6G8Oe7LOD8CbIY2/9j3lF9x/bP5HPaqfldmIPrK4qbH9xJYjR+2N2gtqH6UQlr8UPsSMsFKgIGbP8Wn2hMjFPA9/EgY6lUkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=RIZiEt0Y; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="RIZiEt0Y"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0DA0B3F2BA
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764591860;
	bh=GzOHE0e9hBLU7il+hYgcPRfRQ1LLK3xgtQjcXzvOJu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RIZiEt0Y1c8xjY686u90iDziFyGoD3tofpti1kMarrOmhcPDztGHU4LsWUw2A+xN1
	 rkINjzClCl8r73/F4zAuv8K8qO2Ts7IZnGY9R+yyfcEcm0/SZ8yt64liIGSqq+fA4S
	 +jHpQsLQVn/bvVTt6WvxZgSoxwHn0YNipQz06R/btrQH0F940ztMyulIU6e4A5dZDA
	 S/HbGx57m1EmFBRtT4tW84wdxteBJVlfFA34lGO1NrsV0SDWBG42M/N7BoIawEsolk
	 JHg7bXaTWTxE0AUPBZLsDdR+M9anl5+HN/v4LqnqoL+Ni0PirHE34wcAkjORLfCJVU
	 mOV64CksMU4KLrhUFxCkYy45H94jyBI7laJAbTAe0S9FSp5LDkYMLn9vnPeOimeLz5
	 ycqmv1pVQHNOocY02Yjq12JFKmwLNOpFJLSFVKD9Mw4sUaoQhJHPxiChf7jZBJEvJW
	 TJ2K4xxbsYR9BlLT2SPDPUbMdK5Ry/nAwOmkLx/3WW/cnU9MaG9BibP26NMZwGGq35
	 XSs0yOezMapMGkssE3rMS0n6xIyFhXAagJF04QZjclgenrY1nVgoxi22DS7PdrP1Qu
	 QFkFV0y18yryJnRRZXct8f0iC6aIYS9vUbz14Erl6KpfWBa0i8ctJvJuDfDAB4RpZs
	 vwqg0KSV3ufyorYKkzHsh2eY=
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6418122dd7bso1173852a12.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 04:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591858; x=1765196658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GzOHE0e9hBLU7il+hYgcPRfRQ1LLK3xgtQjcXzvOJu8=;
        b=juha4qJ6c3Z14vWzfKbfBRKzaj8mknzQ3AiBwI915P+HJAPnOvxZ7keNQfX0BmmLky
         TQ1zifVuxmFENZ9MfLkQKIS86lJ/x4G43+NebVwtUb+y49Nbnr1p5XtgDV31svk78gUx
         6NQ58hphTp2b5zKNzVzwzgG7as7C2Ind+2XaoEg6RdM+QbFjpv0HX/8rxBXhWv2SEzkY
         OJ68kkyCyTYKf4+B5lztI9QsDaCSWv8mj0+RcyhpUztLBYgeGKMxd9+nsCbeHWaDcKsn
         /vLaU5JyL9V0VnirFD/k/2lG5KSrBJzCx6oTAwsVFLGJDpeR9+JJY1l+WfhobMmo+tBL
         NoXw==
X-Gm-Message-State: AOJu0Yx/lv6Z/0wzg69OjbQ7qpeZj/mJOGOb6DqPMnNJl6z0zOodkNS9
	ge4C4y5C8F3KMcIIePYu2uIq3qNwpZPmqjhNhBkTHJwGDwibJRtQ0+DppBIQwqhYf48XF3X78Qa
	L79tEZeBQZHP/Ruw0KTKcRdCIkddADfyGgRDavBrzYMTgwMgmjfAPSwCz0f9kCX7wEHWv/RVyg7
	aWhA==
X-Gm-Gg: ASbGncudxY46wEJBSY9ia3LrkpS7WSgw0+CPhIwTFLMgTaNoRT1crYhB6oRq2Jzt4qr
	iihuKWb4vmP9KgvYqvCPXUbS1WlMUo1b0kkYGG5f0op31FIcDJUjyJg59izeT5Nf5xmJTxoFvIl
	q0Hnj1meEOVqd+JDhLe1rhNr6nultDRslTpUc4fedMxNzcn4Ac9SdhroVY7kyGtbl81id2xxn+X
	S6Hiu4wh+xIwOCOMItJsonqkBhCxCgVyhyuuRdF/SHcjGYUoTIHbpLhRyF6rnWVX8LMRXSeoFZU
	PtFJDJf16hy8bQ1oXx8YcK3sFffcyIDakgzNAt2u5soV4OVY1KTZJo7/9bCF7+xGwPwxdq6qCDm
	AT98BxBvHTQgIluv4WuEtJQaf+l/Xkjtxix81Q7FIFuqq3TDsTGHWMIw8Ev0bzu7ie7zjggBWRm
	LrQ4qyRZXQ8rdmXEhqwAb/SrVa
X-Received: by 2002:a05:6402:26c1:b0:647:5c87:8668 with SMTP id 4fb4d7f45d1cf-6475c8786c8mr12140923a12.14.1764591858563;
        Mon, 01 Dec 2025 04:24:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnjM0Qzg6CtgwzGYH8gmhz+bLP0gt4lrDJ9TM3/lU3ORJOfhu2tpvth2CTJnOUWADyLTe8JA==
X-Received: by 2002:a05:6402:26c1:b0:647:5c87:8668 with SMTP id 4fb4d7f45d1cf-6475c8786c8mr12140891a12.14.1764591858195;
        Mon, 01 Dec 2025 04:24:18 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf5749de007c66abd95f8bdeba.dip0.t-ipconnect.de. [2003:cf:5749:de00:7c66:abd9:5f8b:deba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea36sm12307884a12.2.2025.12.01.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:24:17 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kees@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Subject: [PATCH v1 2/6] seccomp: prepare seccomp_run_filters() to support more than one listener
Date: Mon,  1 Dec 2025 13:23:59 +0100
Message-ID: <20251201122406.105045-3-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare seccomp_run_filters() function to support more than one listener
in the seccomp tree. In this patch, we only introduce a new
struct seccomp_filter_matches with kdoc and modify seccomp_run_filters()
signature correspondingly.

No functional change intended.

Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Stéphane Graber <stgraber@stgraber.org>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 kernel/seccomp.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index f944ea5a2716..c9a1062a53bd 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -237,6 +237,9 @@ struct seccomp_filter {
 /* Limit any path through the tree to 256KB worth of instructions. */
 #define MAX_INSNS_PER_PATH ((1 << 18) / sizeof(struct sock_filter))
 
+/* Limit number of listeners through the tree. */
+#define MAX_LISTENERS_PER_PATH 8
+
 /*
  * Endianness is explicitly ignored and left for BPF program authors to manage
  * as per the specific architecture.
@@ -391,18 +394,38 @@ static inline bool seccomp_cache_check_allow(const struct seccomp_filter *sfilte
 }
 #endif /* SECCOMP_ARCH_NATIVE */
 
+/**
+ * struct seccomp_filter_matches - container for seccomp filter match results
+ *
+ * @n: A number of filters matched.
+ * @filters: An array of (struct seccomp_filter) pointers.
+ *	     Holds pointers to filters that matched during evaluation.
+ *	     A first one in the array is the one with the least permissive
+ *	     action result.
+ *
+ * If final action result is less (or more) permissive than SECCOMP_RET_USER_NOTIF,
+ * only the most restrictive filter is stored in the array's first element.
+ * If final action result is SECCOMP_RET_USER_NOTIF, we need to track
+ * all filters that resulted in the same action to support multiple listeners
+ * in seccomp tree.
+ */
+struct seccomp_filter_matches {
+	unsigned char n;
+	struct seccomp_filter *filters[MAX_LISTENERS_PER_PATH];
+};
+
 #define ACTION_ONLY(ret) ((s32)((ret) & (SECCOMP_RET_ACTION_FULL)))
 /**
  * seccomp_run_filters - evaluates all seccomp filters against @sd
  * @sd: optional seccomp data to be passed to filters
- * @match: stores struct seccomp_filter that resulted in the return value,
+ * @matches: array of struct seccomp_filter pointers that resulted in the return value,
  *         unless filter returned SECCOMP_RET_ALLOW, in which case it will
  *         be unchanged.
  *
  * Returns valid seccomp BPF response codes.
  */
 static u32 seccomp_run_filters(const struct seccomp_data *sd,
-			       struct seccomp_filter **match)
+			       struct seccomp_filter_matches *matches)
 {
 	u32 ret = SECCOMP_RET_ALLOW;
 	/* Make sure cross-thread synced filter points somewhere sane. */
@@ -425,7 +448,8 @@ static u32 seccomp_run_filters(const struct seccomp_data *sd,
 
 		if (ACTION_ONLY(cur_ret) < ACTION_ONLY(ret)) {
 			ret = cur_ret;
-			*match = f;
+			matches->n = 1;
+			matches->filters[0] = f;
 		}
 	}
 	return ret;
@@ -1252,6 +1276,7 @@ static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 {
 	u32 filter_ret, action;
 	struct seccomp_data sd;
+	struct seccomp_filter_matches matches = {};
 	struct seccomp_filter *match = NULL;
 	int data;
 
@@ -1263,7 +1288,9 @@ static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 
 	populate_seccomp_data(&sd);
 
-	filter_ret = seccomp_run_filters(&sd, &match);
+	filter_ret = seccomp_run_filters(&sd, &matches);
+
+	match = matches.filters[0];
 	data = filter_ret & SECCOMP_RET_DATA;
 	action = filter_ret & SECCOMP_RET_ACTION_FULL;
 
-- 
2.43.0

