Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 176927DE5B
	for <lwn-linux-doc@archive.lwn.net>; Thu, 13 Jun 2019 15:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731933AbfFMPXE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 13 Jun 2019 11:23:04 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:37266 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731923AbfFMMdj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jun 2019 08:33:39 -0400
Received: by mail-qt1-f201.google.com with SMTP id g56so17363857qte.4
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2019 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=hR/rel8D4gBiToxcZ/kWhC4zY96wRtLwSvBkxQ4V8Fg=;
        b=vMwEtqzM11ZDYbxg3IuXNuB/bsH8Fggv3MeD3vzVsIqAPesB8sArdWifMXfLgIG4NM
         LKslpGkbYufQ9y2r3lINgugJro+63B7oTJN/g5EikB1ZJGpZvZtAi7Vkud5BnJ8dEm1F
         cFX7OacjFj4EWaBYSbaZ7TpjBs2pMWAXdrP8o9CJuByMAH13OVxImx5HQenwYzhG1jfl
         fWTs2IF7Rd+9scxlHkPTN1IQXTcviFJbrJT9wpG9/PiPivDghlafXY/iCkJ+0dd69EM7
         NXp0sSqLMZ+4yfB1hzsv3yvx8EB/6hQjV2zGZ9QTO90uHzdNxIjxFp0Xh4uzEfNsMxVn
         D6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=hR/rel8D4gBiToxcZ/kWhC4zY96wRtLwSvBkxQ4V8Fg=;
        b=Z4XkNIFoctNhOpZVJSaP2Kt2g051iitwX5HnC+yab/rYm1QJe+XNODMKsrZdf88rFZ
         FPphT7YV9rtXQNd7TvowzLWXbA1F2UB/16p/Wo0WiJKoqcUuMsQWFC1ohkZHHaynouVF
         mwJW+nxEGWdNtByswcSXmNIL8xdygRpEqZFScwulxwgWzNwFiXtrVuommCcGGVY+ytEF
         nmrkHCA2JnnYkZ4Apx2WwA5NY9aRDFVo4H0OztaGNPaMjiE7UTiq38PDm7SAZxJOAf3+
         KF8T1l9ADnXhRqsBicamGh0Ka66yj5BfGQ+0vMvVHErg3isSbfF2oUOra2LNso2p1kr3
         tf/Q==
X-Gm-Message-State: APjAAAVpNUc2NdZTEiW1ipatLdk0+parUCdtpcgUBSxJ9bWqXY1mXCEs
        6NLT6XAOuZgkhevEXR3rcTmxaKSSzw==
X-Google-Smtp-Source: APXvYqwDOFO/TXAwxDgGXuhGAv16VtS2A0XMMDggMph3dbT9XaDKtbaa2+7NijtPy2Mna6BI/pjimZ5Cxw==
X-Received: by 2002:a0c:888a:: with SMTP id 10mr3409777qvn.0.1560429218725;
 Thu, 13 Jun 2019 05:33:38 -0700 (PDT)
Date:   Thu, 13 Jun 2019 14:30:25 +0200
Message-Id: <20190613123028.179447-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v4 0/3] Bitops instrumentation for KASAN
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

Previous version:
http://lkml.kernel.org/r/20190531150828.157832-1-elver@google.com

* This version only changes lib/test_kasan.c.
* Remaining files are identical to v3.

Marco Elver (3):
  lib/test_kasan: Add bitops tests
  x86: Use static_cpu_has in uaccess region to avoid instrumentation
  asm-generic, x86: Add bitops instrumentation for KASAN

 Documentation/core-api/kernel-api.rst     |   2 +-
 arch/x86/ia32/ia32_signal.c               |   2 +-
 arch/x86/include/asm/bitops.h             | 189 ++++------------
 arch/x86/kernel/signal.c                  |   2 +-
 include/asm-generic/bitops-instrumented.h | 263 ++++++++++++++++++++++
 lib/test_kasan.c                          |  82 ++++++-
 6 files changed, 383 insertions(+), 157 deletions(-)
 create mode 100644 include/asm-generic/bitops-instrumented.h

-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

