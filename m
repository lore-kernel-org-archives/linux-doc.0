Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A879F7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 14:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfE2OX0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 10:23:26 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:45225 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfE2OX0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 10:23:26 -0400
Received: by mail-yw1-f73.google.com with SMTP id d10so2252241ywh.12
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=PLHql6HuZD0bzmA8PfaTdvUizoR7LXyZ6UL9cOmZOnQ=;
        b=Guy5Xjr5Wholvk2wwpj43VueywLu/AoMNYGYxpgCWt0djZBOVn5FgcePWoupL6XXsj
         7IPSG1wBXeae7XBJIn7bzmUq8mJ9wuBxmhbor+E5UQqqV2K7PEeEDgWhrtOEFMi8cHUG
         VUrxUug7tZaBxJoM+N3GXVlsx6vGe+QFZ/l76oKzcR1wyxSC7jXJxYr8+RaJHSEDq8uX
         DP98R4+p+DEeSThMxTKmQwKbeqViUNQty3XNKqErwgKL0Q0E5ScNtJuO322XY0yhLcuM
         Ze8YkXH+MMzFzPo/7YnKbKetJ4TLvtyCIlNAKD+IKXQmcSIL+tRecQXIiCW9eYpJfTZr
         Tq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=PLHql6HuZD0bzmA8PfaTdvUizoR7LXyZ6UL9cOmZOnQ=;
        b=QKaeUN2bhxM31Gu+HlW1qFSZlz623drd55o0atfpBrY6sOYhQz0tvw0otPpIKuQq9E
         StfWQ5flcL+gS52zzPeq37x7VjSpsvjEe8NxK6ohYgKcBIOHWIQ02VC5lyH4hM1SKIeQ
         C+38tzs3Ho7U3kYDx3c6sHJsNIl4T/vD2kfw2v9qRDCY0KfDtIT6QdFk7b+9jNTZKWfM
         RlPa2sT4tgSpD3ViEsNN6Dm+z3elEwpi140ZOkPDQSU8TmwY0UpOlgCyn7ce7fBXyPZv
         kjcJkjc5KgoPX3ezpe79F0OXuQf09PcA8ZAxfra+My2gwEQiTqvMcSFLQZAC06E2IVMV
         kO5A==
X-Gm-Message-State: APjAAAXcqD7PMcINbAhiORYE4pkAIoef6g0fQ/pv+QBkfAfHc8MRuhax
        /vAUMH3CowDfDHfeP/gKsagjj/QuhA==
X-Google-Smtp-Source: APXvYqxLC6zyJv0xSSACzvKIA6nLKuJm7cRRhTv9ht3NB5WR/ekCb4ojh+2GmRIqJexYFBRx2sWzsjgesw==
X-Received: by 2002:a25:c0c6:: with SMTP id c189mr43131422ybf.339.1559139805383;
 Wed, 29 May 2019 07:23:25 -0700 (PDT)
Date:   Wed, 29 May 2019 16:14:58 +0200
Message-Id: <20190529141500.193390-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH v2 0/3] Bitops instrumentation for KASAN
From:   Marco Elver <elver@google.com>
To:     peterz@infradead.org, aryabinin@virtuozzo.com, dvyukov@google.com,
        glider@google.com, andreyknvl@google.com, mark.rutland@arm.com
Cc:     corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        hpa@zytor.com, x86@kernel.org, arnd@arndb.de, jpoimboe@redhat.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The previous version of this patch series and discussion can be found
here:  https://lkml.org/lkml/2019/5/28/769

The most significant change is the change of the instrumented access
size to cover the entire word of a bit.

Marco Elver (3):
  lib/test_kasan: Add bitops tests
  x86: Move CPU feature test out of uaccess region
  asm-generic, x86: Add bitops instrumentation for KASAN

 Documentation/core-api/kernel-api.rst     |   2 +-
 arch/x86/ia32/ia32_signal.c               |   9 +-
 arch/x86/include/asm/bitops.h             | 210 ++++----------
 include/asm-generic/bitops-instrumented.h | 317 ++++++++++++++++++++++
 lib/test_kasan.c                          |  75 ++++-
 5 files changed, 450 insertions(+), 163 deletions(-)
 create mode 100644 include/asm-generic/bitops-instrumented.h

-- 
2.22.0.rc1.257.g3120a18244-goog

