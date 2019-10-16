Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6AC877D982
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Oct 2019 08:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391739AbfJPIlS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Oct 2019 04:41:18 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:34625 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391740AbfJPIlR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Oct 2019 04:41:17 -0400
Received: by mail-wr1-f73.google.com with SMTP id k4so11391914wru.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2019 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9SMgLZKRCrUAwZ4Rshpo1HVyP5RqT+TntrXHNZ73xYY=;
        b=FDIPWUL/JwmYB6hACIcWUwuenrffDDAMzGSei/mRdw2EODhUfYubNcKwRfAgNp0DhM
         dtUKG7I75/scKfOkForm7Ld7BuMMDf7BHMR3NlZ5qfVmRtDmpmJc6uB3CuAr91yveAnL
         nGRuVo70brrUGtmp1Ve08DkIzHSi9SVIOYczUBr++j/ObGq2iUw/aBOyKHJ139cBYOgE
         xnfKiRntzrGA96b5jN/E4fIqaZwTsDPzTCU1SZd5nLiOQ3czOfhus2Fq3v2uFkOsxnIq
         s4piFfhm90KHCJPaNgDU6oYlPHFiQUMyTLgNXoJ/09nhO4RdOEdIJ82o/pFsXix8mVoS
         k64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9SMgLZKRCrUAwZ4Rshpo1HVyP5RqT+TntrXHNZ73xYY=;
        b=CpwXEDCwtzgX+3GV4ctp2N+hptNw1suBK5gmqJYsE3GopyeZQLqPl0u+2ygRtKixEv
         FKt6Hra5L8hC5voZnzl5wUow8TVN2hfDnsfqVHA8svGlUzml90KirfGw99DJnDisYwNL
         iAEKLgL74jTrUd8tULAEcfL9f7z5ojPT6c/NHJDq3AkLsxITMM6NPHkJ2+obX8ckqBuI
         fkmb/Ixn2VyS0xBNS+FPoiUeF9AWPqp4Hyx8HcyiYTGv37nb5MD7CFwB+Av58IFRP24k
         UeiRiP0eEqn54RQ25VrxbWh+Hgo6oth8KPXUMhrLxR5LtB9raqBCu1uWuRyB8U78J0PD
         b3jw==
X-Gm-Message-State: APjAAAVcIy+xGRY2K4033uETJyOy0wdzKCpzL0LNZlOx+Bey6CMiWhT7
        eM/b+0Gjv54slVB5vKNYAp4i6d5wVA==
X-Google-Smtp-Source: APXvYqwkgvQBQ5yV1eoCrQo14zvvYIx87rvKqZQ+FG5dzvqnKHHgHQFk8ioyGbzu7TlFoxqNUrf9JlniKA==
X-Received: by 2002:a5d:4588:: with SMTP id p8mr1610112wrq.180.1571215274810;
 Wed, 16 Oct 2019 01:41:14 -0700 (PDT)
Date:   Wed, 16 Oct 2019 10:39:53 +0200
In-Reply-To: <20191016083959.186860-1-elver@google.com>
Message-Id: <20191016083959.186860-3-elver@google.com>
Mime-Version: 1.0
References: <20191016083959.186860-1-elver@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
Subject: [PATCH 2/8] objtool, kcsan: Add KCSAN runtime functions to whitelist
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
        npiggin@gmail.com, paulmck@linux.ibm.com, peterz@infradead.org,
        tglx@linutronix.de, will@kernel.org, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds KCSAN runtime functions to the objtool whitelist.

Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 044c9a3cb247..d1acc867b43c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -466,6 +466,23 @@ static const char *uaccess_safe_builtin[] = {
 	"__asan_report_store4_noabort",
 	"__asan_report_store8_noabort",
 	"__asan_report_store16_noabort",
+	/* KCSAN */
+	"__kcsan_check_watchpoint",
+	"__kcsan_setup_watchpoint",
+	/* KCSAN/TSAN out-of-line */
+	"__tsan_func_entry",
+	"__tsan_func_exit",
+	"__tsan_read_range",
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
2.23.0.700.g56cf767bdb-goog

