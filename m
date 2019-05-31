Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F9D97D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 May 2019 15:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfEaPLg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 31 May 2019 11:11:36 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:46072 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfEaPLg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 May 2019 11:11:36 -0400
Received: by mail-qk1-f201.google.com with SMTP id u129so8102523qkd.12
        for <linux-doc@vger.kernel.org>; Fri, 31 May 2019 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=DHrqTUytQArIdQz1xxPzRVqqz8q7l/i/jn+bESY1v40=;
        b=VT0VhU5diy4D7S+PBFYFmWJZM3wQFT034TEzFtXa79nkY7mFiZqAq66rqbZ2BEasQY
         5qvLyitDkcYkM3+HCUZP4WUEQoxkk7wsTF9szzHwKRKaG30oy4uWB2jkUBQ3lwq8+0N5
         G8EH4PAeV0fONz/+Z99fpGrpxrRrGs8huirgP5uF4ArUup/88PAiT4olJKtbbuw6XDYi
         nwbs/PxRd0NEru5t9bQoAW57/dXGO4cj3DPuM3ZdtDwZu+oOdHGeC3zI2yNeJpJYuOC1
         o7KL7K3LHGmWoU1HEWi4ZvKAHB+dAXmVd0U8GDVMwggw6HqBTqvEMS3ig3GxdlYf5aCi
         /0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=DHrqTUytQArIdQz1xxPzRVqqz8q7l/i/jn+bESY1v40=;
        b=aEOuI1/5pGYJsPvRbNta10DPy8FN7Xzo/LF8az3kBh/ZSzoOqiSmOlPGdNVHBcJogV
         EXmki567YvIGUSj4lZN1Erclrc0pRplehqbb1IS8rbGzemyI+h+/js69jNxTl0+cqIHq
         hwzEwk4oJyYkAtFe7PS9ePfCrSQKKf/BSLNDIYw7CV6OV4+wOVuAk7EbR/wHruNPOFtW
         LQwORSMqr+JLPysigCnuyr/SdNwT/UBZeJ1KeG/FXOtU4UCuQ93fp0ypuyL0gYEJoLyz
         N/V/nu270BwnTPC59uAJKLm1Z6ymcMi6wdRn0y6lWI65WCsueLRe+Z4FVyugTM0bjwYz
         7z2w==
X-Gm-Message-State: APjAAAXECrFUmqobdjgaswvDbZv/ilsKYcEfYhy7Kw96MFhNn65Moktv
        Nx67XVnKZqVjE/hMxyES09Qbst68ug==
X-Google-Smtp-Source: APXvYqyege0R4wshcAYIiWymm6vQUMPjgKiKC5GhEGj/WkXa+ttPqmEB8FQ7p/IStQzHMpf7y+eHFZsQDg==
X-Received: by 2002:a37:af03:: with SMTP id y3mr9056184qke.296.1559315495561;
 Fri, 31 May 2019 08:11:35 -0700 (PDT)
Date:   Fri, 31 May 2019 17:08:28 +0200
Message-Id: <20190531150828.157832-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH v3 0/3] Bitops instrumentation for KASAN
From:   Marco Elver <elver@google.com>
To:     peterz@infradead.org, aryabinin@virtuozzo.com, dvyukov@google.com,
        glider@google.com, andreyknvl@google.com, mark.rutland@arm.com,
        hpa@zytor.com
Cc:     corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        x86@kernel.org, arnd@arndb.de, jpoimboe@redhat.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Previous version of this patch series and discussion can be found here:
http://lkml.kernel.org/r/20190529141500.193390-1-elver@google.com

Marco Elver (3):
  lib/test_kasan: Add bitops tests
  x86: Use static_cpu_has in uaccess region to avoid instrumentation
  asm-generic, x86: Add bitops instrumentation for KASAN

 Documentation/core-api/kernel-api.rst     |   2 +-
 arch/x86/ia32/ia32_signal.c               |   2 +-
 arch/x86/include/asm/bitops.h             | 189 ++++------------
 arch/x86/kernel/signal.c                  |   2 +-
 include/asm-generic/bitops-instrumented.h | 263 ++++++++++++++++++++++
 lib/test_kasan.c                          |  75 +++++-
 6 files changed, 376 insertions(+), 157 deletions(-)
 create mode 100644 include/asm-generic/bitops-instrumented.h

-- 
2.22.0.rc1.257.g3120a18244-goog

