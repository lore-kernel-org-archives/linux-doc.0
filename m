Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDC6C4321E
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E988B61B44
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244317AbhKRIO0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 03:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244323AbhKRIOQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 03:14:16 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8725CC06121D
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:15 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id l6-20020a05600c4f0600b0033321934a39so2706927wmq.9
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=j+xGmYJ7a6naxsOgId4/Y5ehX22eJTAnRqZAmnKJeqk=;
        b=AFKYBDtNxe/zIpPX6ATOP6Oaf/Q/ogNw/iuYP+kZPqIMpI7lQIp++McD2UNNH1Fpin
         ihP4MNeiSed+OTnLOoVn0uh/0kySxK/Yk0Z1LTYcfyEHKOpLFR3dz9xOUbi2vMRqQA1e
         K8MeKX4ibWJWyagq5O/D04JyuXakUpDsqfcEwbchowFAUBMfZCT0jmD2GaDyWdE/M/O1
         o9NYFL4JjzkzNDER+vaAbRyCE5YkV/7tPiF1eLZHrGIOCrNQev5SHn365wh2dJTMds1m
         pR1to1GIKquZyoS0ryoBzMFyuzgj/NUhPMiB8SAuBj/BlNlPUxNrb7UzTegA7B82czWm
         9OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=j+xGmYJ7a6naxsOgId4/Y5ehX22eJTAnRqZAmnKJeqk=;
        b=4CfzQmuCBl3mPRoVPKhAvVDC/2oXg+k94u2pMP42/PeySujky1iLRkrhNf4Dv+HW+k
         w7V/zUp+Nx824/klqN99rZ831X+riQFRXqSfmHkiQ0Zc5pTS5xmDpY1RlY/Ae0O10Jt+
         27oaJ0p0qKVVWOb7qub7r9gcqciP2ZPdY8gLhPhi89/hB7xbp4/jHF+u147SVgotDC/A
         NILByZANUa3OMplHmBd7hIWj5y7CzGTd1xaOUFcHMPR+HUy1lYnTDQwfB8bAK+jwUvGW
         6HYOP2iD1L0ee0qlGAUhjU+0aYXCHFIbhTKYunhRHGKlFeNjEJnLtUwS75f0fSLA9rBr
         ZckQ==
X-Gm-Message-State: AOAM531M8bTkAWjczhelPh/3oAb3fWJEL+glZFgzdqc9C+8IIMPD2xOt
        A5HD0caTlN5O3HHOVJOq+RYeWh5XQA==
X-Google-Smtp-Source: ABdhPJyrAblfdPUbSGFAD6qCfKTgpVs0/aJt2TepI3LGsbV36W6kcYuuz/E/yHTNXjbyTxE0/jLTFnm6jw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a7b:c409:: with SMTP id k9mr7703441wmi.173.1637223073968;
 Thu, 18 Nov 2021 00:11:13 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:11 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-8-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 07/23] kcsan: Call scoped accesses reordered in reports
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The scoping of an access simply denotes the scope in which it may be
reordered. However, in reports, it'll be less confusing to say the
access is "reordered". This is more accurate when the race occurred.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/kcsan_test.c |  4 ++--
 kernel/kcsan/report.c     | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index 660729238588..6e3c2b8bc608 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -213,9 +213,9 @@ static bool report_matches(const struct expect_report *r)
 		const bool is_atomic = (ty & KCSAN_ACCESS_ATOMIC);
 		const bool is_scoped = (ty & KCSAN_ACCESS_SCOPED);
 		const char *const access_type_aux =
-				(is_atomic && is_scoped)	? " (marked, scoped)"
+				(is_atomic && is_scoped)	? " (marked, reordered)"
 				: (is_atomic			? " (marked)"
-				   : (is_scoped			? " (scoped)" : ""));
+				   : (is_scoped			? " (reordered)" : ""));
 
 		if (i == 1) {
 			/* Access 2 */
diff --git a/kernel/kcsan/report.c b/kernel/kcsan/report.c
index fc15077991c4..1b0e050bdf6a 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -215,9 +215,9 @@ static const char *get_access_type(int type)
 	if (type & KCSAN_ACCESS_ASSERT) {
 		if (type & KCSAN_ACCESS_SCOPED) {
 			if (type & KCSAN_ACCESS_WRITE)
-				return "assert no accesses (scoped)";
+				return "assert no accesses (reordered)";
 			else
-				return "assert no writes (scoped)";
+				return "assert no writes (reordered)";
 		} else {
 			if (type & KCSAN_ACCESS_WRITE)
 				return "assert no accesses";
@@ -240,17 +240,17 @@ static const char *get_access_type(int type)
 	case KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC:
 		return "read-write (marked)";
 	case KCSAN_ACCESS_SCOPED:
-		return "read (scoped)";
+		return "read (reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_ATOMIC:
-		return "read (marked, scoped)";
+		return "read (marked, reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_WRITE:
-		return "write (scoped)";
+		return "write (reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC:
-		return "write (marked, scoped)";
+		return "write (marked, reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE:
-		return "read-write (scoped)";
+		return "read-write (reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC:
-		return "read-write (marked, scoped)";
+		return "read-write (marked, reordered)";
 	default:
 		BUG();
 	}
-- 
2.34.0.rc2.393.gf8c9666880-goog

