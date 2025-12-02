Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1E13115AE
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764676345; cv=none; b=jYqndN5z8NLi83wCHronJAXofP3PYNg0FyChaGZUQaInk1GkOzNMSTJeCw44gHHm+LUzGUUtpEKJIJ0GoNV+hPz+tlNr4DMqG8bGRfF6gXtOKjIlV7snp7v/espXqY5s5UHE1fMfgwBASoCKMDMMcz945a+0JFrYwpFY0UCu6cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764676345; c=relaxed/simple;
	bh=57o/qqVOjaIf+LNLr7Mou5cYOVwMnRafqEReYb5z9+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wch4IQEV1E1lkwjARAICZv8zQtV8jAHFlj3vxr575XGQGWu75zRqLATrOhWR0+xQsEM2E4dqqaRa37PsoKF4fUyhXDAKLOhEgKz52H3PGn5X2fUSsjI1HcedP7B2UK2JnkeAFqCEwq6PG4qzWFq/rJ29mQWx4T1NUKlIc4KvfHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=U8lQm2Bq; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="U8lQm2Bq"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9B54D3FE22
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764676336;
	bh=Ct2y+0nl7LmSeBKQ01gBVrV3RhFreqHSexhQZDjqMFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U8lQm2BqqpVAlmjMV9YmQ3aNw1UzP9E5Gt2FbjbnsMDv4vKok3V8P1cFOguiVO4Bz
	 pKoAw5MuQlpi1MeivZC8iecAwqivIg9wQxLhxWLnUqrjft80Lv5jz3UKYfJ8w0eqSh
	 PgJPbUuE99TKHQn5cPBZl1Zua3yTp4iQgYbfC3myGlw/RLbA1e68n5fa9qJN5pNyUA
	 Yv16rF/IWvyJnYhMURaR9aJRebySn1XCyzdLvO6PQrzA6uo7i5CaoMX7EC+DlNHNxr
	 neEeDRPVz9SJXr/ELc0uIN/79tpdhJEIuH48bQkZP13QolqxORIGZY7vZenWjXnMi2
	 srD8FTEOypYbr50O+DMIzn4za3UbGZXqX0VopoCQkyqfjgQKjA4+lOqFHbEdlQW6+D
	 ZH9OMJM99XDhhLE1R+xG6q7vwPymFEKe2kqPFwPXl/3vUfzy5b26wreVF5bQM5YRQ5
	 PnLiroxvpuxTuVt1uKCOYpPBozOMHJ3kHJl+0K5dqcal5CQesVVXcO0WEB4xXeN/yn
	 rLRqb9KmBKWJ0N91nrOUxLx77GbMLIitby4ErvYHypdXfXrqJLcYAH+GbF9wXhuDht
	 Z7iuFffXYkw6DUbNREehNJxvXabbESH9tRr0FKqX2zsPAxa8xufP4BqEVfB9toXRDF
	 P7HywRrhgjzaKY0iqQH2G3Ww=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b7689ad588fso543847766b.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 03:52:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676335; x=1765281135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ct2y+0nl7LmSeBKQ01gBVrV3RhFreqHSexhQZDjqMFQ=;
        b=qLopcax2ZBQK1fFPZMxXx2PIyp73n1hO1OBiCLwUW84Se3DgUO80oL4K7PPPUbjTrW
         caks5mCexfENkZspR5YX9rElw1rLr1GwOOSlLGVskErA+kaNoheMB9El4D3wwrT8CFwp
         PGEKB2fdd9nromr5Db/0wyZhKK1IaWNA4IAyKg6f8lgKcJPJPrpKCwSLw+lM6Ys6sIgn
         vQraJaTfXxx6W0H7JJQga8Zws+Kqid4ZjREDc72sCKN+9oSbihFB5JDhPZiAG9gIyzak
         iRz1VuoMTNLeR0RDUgeOV2ECoh3yPy4yUfcEWnaQlSbIlL+SUkFvj3TODnureFH8wf7s
         tt8A==
X-Gm-Message-State: AOJu0Yz/yyBqVjQzUk/ABr+PlJ8zUjAEQQt/MowOc6vXTBbdP3U7DcA6
	pdVYllmdDVwhDVqADMzLtRPMc8unTcYlszJB45qSZD374tXj86ipknluDYoy0Piellwg/dfn+bs
	MzaFLYdOmKFK05igcgLb3vK0zRHBE008pNkbjqX+3Miqr8wj4Gn8LFdY0iXQI8kjxbVTFr04HAO
	7fcA==
X-Gm-Gg: ASbGnctJvxjARj+FswTzZ5z5WMFXfaeZ7asoRvMj+fJmEiYnaZNlZm5pTZ8VO+nzwEJ
	s77H1LlkMBMHXnY/2VWIvmYVOFt+flqG+x76PwbFz0+4L0qP3FclFpPMKcIxfM2Bl0y1VVEuDcH
	TVdMu8L+A9esqi08qvZavpMApTy9rZSODSZRQFFAzJUQ3JaHVYEyGm0E54rm11b4G8Ymla7V4wm
	rYmHOvSF4hP5NVMVSc82B6fs7cRvCf2jT2YrYMFsm6P0+s9LEoQpjHQKPJOmmkPIeCv/q1Wl5L/
	uI/sA7pn/BWjo4pSGlzIV/dnx+8MPLbtytULcmblwQED2ur/p83cgZGZDFJ2fjLSR8//CcfXhhZ
	i+dZzaNufqblIMnUfronZg4x71omIofML4B3lvHggx2rw5e11sHp8iY+duQghAKWGOJo1S2jtK+
	t3NhD4EArKRLJN7Hd5btm9ZTo=
X-Received: by 2002:a17:907:940e:b0:b74:352d:6dc1 with SMTP id a640c23a62f3a-b7671695438mr3600111066b.28.1764676334760;
        Tue, 02 Dec 2025 03:52:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhyNyJbaiZ5UDTQ2O9lnsJpd6wOQNiwjdEavIHe0j5tnxsWXE4HOlcA5oZg+I9yQNdF6zJVw==
X-Received: by 2002:a17:907:940e:b0:b74:352d:6dc1 with SMTP id a640c23a62f3a-b7671695438mr3600108366b.28.1764676334380;
        Tue, 02 Dec 2025 03:52:14 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf5702200011ee99ed0f378a51.dip0.t-ipconnect.de. [2003:cf:5702:2000:11ee:99ed:f37:8a51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510519efsm15206765a12.29.2025.12.02.03.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 03:52:14 -0800 (PST)
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
Subject: [PATCH v2 2/6] seccomp: prepare seccomp_run_filters() to support more than one listener
Date: Tue,  2 Dec 2025 12:51:54 +0100
Message-ID: <20251202115200.110646-3-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202115200.110646-1-aleksandr.mikhalitsyn@canonical.com>
References: <20251202115200.110646-1-aleksandr.mikhalitsyn@canonical.com>
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
Cc: Aleksa Sarai <cyphar@cyphar.com>
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

