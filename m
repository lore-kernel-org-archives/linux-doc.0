Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D8E437DCEA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Oct 2019 08:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391788AbfJPIl2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Oct 2019 04:41:28 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:46939 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391783AbfJPIl1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Oct 2019 04:41:27 -0400
Received: by mail-qt1-f202.google.com with SMTP id m19so24229585qtm.13
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2019 01:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6B6hVR43CAiybn1r8unXu0YGQ/l4GfBcUZa3qNay/Lg=;
        b=pmKyjAi9Xr5PlfEX3WN4RXfR5rOUMeCVeHFLxeZBnJX60pdmUJcgmq7H9/mtFPlJFa
         moYsn1hDbJspCdD6Vib5sxCF1XQS2zorrJaslTcgAECl0Igp90eao9ExRzxoghK0ZyKa
         /YWUX8wsqgNhUXxIKWeHu6EHevPZBqeqVPpwiuyJgZFcEq2EuNxKt0GInMFNLlo6Yxif
         PrXK74Aw6W9IKNzvlptjE5I+HNUQvjt7bLAKckauSr7e8Ox9+LMH1ifl8ytlPVg92RDl
         Uels+l0S9OCX6mNGK/TPsotu300tngqOS6U+WCI50TixqqRrW/HI3/xID0mukxXkp8m4
         mUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6B6hVR43CAiybn1r8unXu0YGQ/l4GfBcUZa3qNay/Lg=;
        b=N522UxBKKJVzyPKLj0wrDMT/caJ+4FD3Mx2ATNmAM5Ma3j7igVhLajTCGl7/gvCOKQ
         EWMeTKBWclaX6PJvUugRtZavnU6gtMl3QauTypnw6x6MzbkZ9754j4CzAcf3UYB2CA/n
         aTdt8qZlQLnWCGtJ9dnQ8z1YiBsYzl8ap4ys2t0dDXnFTF7k5lD10Qt/pWITjEpnxg9z
         cBJHq/zCPUovPZ6p7c7msE3EzaKzLWDePNHOaLJDAQlBXY6c80UJBnhXLU9twc5/w3Uo
         9Fd/9fembAFP9D5HtBpAyi81tjC0jyiIjLPol2QAMSWvW20r31SUarCnrvP/fPJKHYru
         Apaw==
X-Gm-Message-State: APjAAAUQu9ViveJ+GC+jI1BtE18AcenruBZAw+0yF7Moi1a2N5KtfHC0
        ys0wKBqyhNbQ9nueYEDwRPVltywWRg==
X-Google-Smtp-Source: APXvYqyKyeT2RR7s/B/qIqHhRbJpXB+EYhRbk3Rsw+lqlmOIIkoJ+/xVG889AVzjkW0GfsDaRf2mA9694w==
X-Received: by 2002:ac8:3724:: with SMTP id o33mr42240619qtb.87.1571215284755;
 Wed, 16 Oct 2019 01:41:24 -0700 (PDT)
Date:   Wed, 16 Oct 2019 10:39:56 +0200
In-Reply-To: <20191016083959.186860-1-elver@google.com>
Message-Id: <20191016083959.186860-6-elver@google.com>
Mime-Version: 1.0
References: <20191016083959.186860-1-elver@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
Subject: [PATCH 5/8] seqlock: Require WRITE_ONCE surrounding raw_seqcount_barrier
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

This patch proposes to require marked atomic accesses surrounding
raw_write_seqcount_barrier. We reason that otherwise there is no way to
guarantee propagation nor atomicity of writes before/after the barrier
[1]. For example, consider the compiler tears stores either before or
after the barrier; in this case, readers may observe a partial value,
and because readers are unaware that writes are going on (writes are not
in a seq-writer critical section), will complete the seq-reader critical
section while having observed some partial state.
[1] https://lwn.net/Articles/793253/

This came up when designing and implementing KCSAN, because KCSAN would
flag these accesses as data-races. After careful analysis, our reasoning
as above led us to conclude that the best thing to do is to propose an
amendment to the raw_seqcount_barrier usage.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/seqlock.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index 1e425831a7ed..5d50aad53b47 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -265,6 +265,13 @@ static inline void raw_write_seqcount_end(seqcount_t *s)
  * usual consistency guarantee. It is one wmb cheaper, because we can
  * collapse the two back-to-back wmb()s.
  *
+ * Note that, writes surrounding the barrier should be declared atomic (e.g.
+ * via WRITE_ONCE): a) to ensure the writes become visible to other threads
+ * atomically, avoiding compiler optimizations; b) to document which writes are
+ * meant to propagate to the reader critical section. This is necessary because
+ * neither writes before and after the barrier are enclosed in a seq-writer
+ * critical section that would ensure readers are aware of ongoing writes.
+ *
  *      seqcount_t seq;
  *      bool X = true, Y = false;
  *
-- 
2.23.0.700.g56cf767bdb-goog

