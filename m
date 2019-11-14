Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F09C77DBD4
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 18:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfKNSEP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 13:04:15 -0500
Received: from mail-wm1-f74.google.com ([209.85.128.74]:58878 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbfKNSEM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Nov 2019 13:04:12 -0500
Received: by mail-wm1-f74.google.com with SMTP id f11so4391027wmc.8
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2019 10:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yMaGIqlKjXUqwbUrtjSqf1Asst/iuXZBTZYaUH3mnUk=;
        b=VRI7kx/kQa1bxtHhmGo3GcSsuURWiNJPJTSqjyxjWnaQhrmJjUarWDCTjBJ1UO9p1d
         BCrzK2drh1ms4Wy6zG+pz0l83lVSSmaJ2QS6e6qVnpWQ216IIFcjB24GrCCRXQWHhQvK
         rkbcAxgp2a+unX7q6vWoYB/sxObwZ1E6gxz5BGduYlOmlfyHI040gcOkXwiaQy71IUgR
         bV3iaXbAeYIIk199/bU6jP8nFYKbr2/2Bom4kutSGzf1lgtYu5auv7jbhW4nEnJ91hO9
         nTU0pVGQxZ7iAAuFNJzrIJAKqQU0N6nHduMy81Sf0Yfu78coO/unTbAO8Gb+qg7b8QKi
         jzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yMaGIqlKjXUqwbUrtjSqf1Asst/iuXZBTZYaUH3mnUk=;
        b=AyVx1rmwa39io71EaNno5Z7t7s0HyI9OyCKHorgQmwkvWg0hw0SUEE7al4zV7eb/6R
         HXesHNHrQ00mHRAuauZsXOSYpQIzBrA2Oqm7/HCpbHPFFgcyuK9U4ZHii3zIkx6QZCjj
         fW7WGKneL8LjECZKe0+mHV/NNb3+KyaaBiOcSCHy+ay7r/HV3rIElHmh6xMNyB3h1dcT
         Zvpg0Khg2qbo5BoHHW+BTqx8R+3CaDyNZFPb7HTC5BZMvfT1/QFI64dHrgJTcbVGq6A7
         wv0DKlPBHT+CQlKjDcLbOWzhMZc6WJyAsKnuzpjylY+97hwKW7tF5FMwpFMw2AsN5je7
         XjOA==
X-Gm-Message-State: APjAAAU7+dqBJuiTK4rBTS00YojBshuZU0LGTejR8sZikZRzmiJss/Zm
        WmeMCAfNh14mqo2n7DrWZ/XVNAGqow==
X-Google-Smtp-Source: APXvYqyspOQpVtiEwHHRTBFpggwt2BjVGksS/Z0SK5UoLcbkvLbrVwozbQHYvHUI0Ye76E0xz4YUUbqqyw==
X-Received: by 2002:adf:db92:: with SMTP id u18mr9202786wri.1.1573754650237;
 Thu, 14 Nov 2019 10:04:10 -0800 (PST)
Date:   Thu, 14 Nov 2019 19:02:57 +0100
In-Reply-To: <20191114180303.66955-1-elver@google.com>
Message-Id: <20191114180303.66955-5-elver@google.com>
Mime-Version: 1.0
References: <20191114180303.66955-1-elver@google.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
Subject: [PATCH v4 04/10] objtool, kcsan: Add KCSAN runtime functions to whitelist
From:   Marco Elver <elver@google.com>
To:     elver@google.com
Cc:     akiyks@gmail.com, stern@rowland.harvard.edu, glider@google.com,
        parri.andrea@gmail.com, andreyknvl@google.com, luto@kernel.org,
        ard.biesheuvel@linaro.org, arnd@arndb.de, boqun.feng@gmail.com,
        bp@alien8.de, dja@axtens.net, dlustig@nvidia.com,
        dave.hansen@linux.intel.com, dhowells@redhat.com,
        dvyukov@google.com, hpa@zytor.com, mingo@redhat.com,
        j.alglave@ucl.ac.uk, joel@joelfernandes.org, corbet@lwn.net,
        jpoimboe@redhat.com, luc.maranget@inria.fr, mark.rutland@arm.com,
        npiggin@gmail.com, paulmck@kernel.org, peterz@infradead.org,
        tglx@linutronix.de, will@kernel.org, edumazet@google.com,
        kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds KCSAN runtime functions to the objtool whitelist.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
---
v3:
* Add missing instrumentation functions.
* Use new function names of refactored core runtime.
---
 tools/objtool/check.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 044c9a3cb247..e022a9a00ca1 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -466,6 +466,24 @@ static const char *uaccess_safe_builtin[] = {
 	"__asan_report_store4_noabort",
 	"__asan_report_store8_noabort",
 	"__asan_report_store16_noabort",
+	/* KCSAN */
+	"kcsan_found_watchpoint",
+	"kcsan_setup_watchpoint",
+	/* KCSAN/TSAN */
+	"__tsan_func_entry",
+	"__tsan_func_exit",
+	"__tsan_read_range",
+	"__tsan_write_range",
+	"__tsan_read1",
+	"__tsan_read2",
+	"__tsan_read4",
+	"__tsan_read8",
+	"__tsan_read16",
+	"__tsan_write1",
+	"__tsan_write2",
+	"__tsan_write4",
+	"__tsan_write8",
+	"__tsan_write16",
 	/* KCOV */
 	"write_comp_data",
 	"__sanitizer_cov_trace_pc",
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

