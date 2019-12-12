Return-Path: <SRS0=cTBG=2C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DD9C43603
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 00:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B4CF205C9
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 00:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nflDkvqb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfLLAHh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Dec 2019 19:07:37 -0500
Received: from mail-wr1-f73.google.com ([209.85.221.73]:39337 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfLLAHh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Dec 2019 19:07:37 -0500
Received: by mail-wr1-f73.google.com with SMTP id 90so286096wrq.6
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 16:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=+h6zMTJd2eON2xkPbR4jSlI/q1iX/u3EoAW/W4Wdsws=;
        b=nflDkvqbPW+NXBxKz+/TaxJ+hRiiFKs69ygPo8MTPhzi8E0PkZ+peZFvLmfASHed/C
         67AvvgMQ/nqK5GxTUz9HaV8hYhwBZoZBcXMDiGZpCMXhb3sNGlPLeMxAF3RSDICRbdNK
         o35WYvqsPyaU2TBb9HBA5ILyP1ZmZonwbxmR50dRVLVp36X+Wzl/HzNdJe53pafj4rV1
         AAu6wPJEZlHpNXz4J2raFHinOYDTm+/wK/PljSBBAJpidBFID8y2ERpp//5+CGcoS1Id
         /F4aaJYVvtwFDDQE+WJnF3s0/3s2K+yUNfjdMTLa/n9IOzkAcEfAYnh0sb5rBLbdaSLg
         N+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=+h6zMTJd2eON2xkPbR4jSlI/q1iX/u3EoAW/W4Wdsws=;
        b=Pcd9iLfJqZCxoUbAnwrjm6kIt1+XCf7npiHtIdS3ZZ91RDqPOcLP7VoZfxIXkZ6RSB
         oL9NX1giXgSIRQIHbf+yjf9eStUqVo0+9z+SlhDK8mbEGrF/Gm1S+shh5t3PZbfcANna
         3WBANMmJP+wwfWPeIySE9VvcDBBOjB7vHiTAltBU9M6fux9Rg9O5AbjJeIdayN8kla9F
         AexAcu5a4yPVr0tC4I6Vnaz5dPYBGJ/zXZLpTAjD7quPp6HTbfagoXLgYukySt2hJG4/
         gdQ+/9UvTh3p+/cQVqCPYlaIB18VcTNS18u57mp+VLhpka1kN4EywMyxMorwIQafYd4v
         6M6w==
X-Gm-Message-State: APjAAAXeyGEf26JbdZATIl+2b+5++wGY9vilK9s9T8nhLFWfGAytwOIZ
        6BBwUktydgWRPKMjzI09l3Gc6itiEQ==
X-Google-Smtp-Source: APXvYqy4MqM0SvaeJcCFp4Uk4iYTiCm8ADNZGKNba+F64Q6fXk6ZFB5n9xcKIckKoFojdvvMj2jVtQtWaw==
X-Received: by 2002:adf:f311:: with SMTP id i17mr2688986wro.81.1576109254697;
 Wed, 11 Dec 2019 16:07:34 -0800 (PST)
Date:   Thu, 12 Dec 2019 01:07:08 +0100
Message-Id: <20191212000709.166889-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH -rcu/kcsan 1/2] kcsan: Document static blacklisting options
From:   Marco Elver <elver@google.com>
To:     elver@google.com
Cc:     torvalds@linux-foundation.org, paulmck@kernel.org,
        mingo@kernel.org, peterz@infradead.org, will@kernel.org,
        tglx@linutronix.de, akpm@linux-foundation.org,
        stern@rowland.harvard.edu, dvyukov@google.com,
        mark.rutland@arm.com, parri.andrea@gmail.com, edumazet@google.com,
        linux-doc@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Updates the section on "Selective analysis", listing all available
options to blacklist reporting data races for: specific accesses,
functions, compilation units, and entire directories.

These options should provide adequate control for maintainers to opt out
of KCSAN analysis at varying levels of granularity. It is hoped to
provide the required control to reflect preferences for handling data
races across the kernel.

Signed-off-by: Marco Elver <elver@google.com>
---
 Documentation/dev-tools/kcsan.rst | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-tools/kcsan.rst
index a6f4f92df2fa..65a0be513b7d 100644
--- a/Documentation/dev-tools/kcsan.rst
+++ b/Documentation/dev-tools/kcsan.rst
@@ -101,18 +101,28 @@ instrumentation or e.g. DMA accesses.
 Selective analysis
 ~~~~~~~~~~~~~~~~~~
 
-To disable KCSAN data race detection for an entire subsystem, add to the
-respective ``Makefile``::
+It may be desirable to disable data race detection for specific accesses,
+functions, compilation units, or entire subsystems.  For static blacklisting,
+the below options are available:
 
-    KCSAN_SANITIZE := n
+* KCSAN understands the ``data_race(expr)`` annotation, which tells KCSAN that
+  any data races due to accesses in ``expr`` should be ignored and resulting
+  behaviour when encountering a data race is deemed safe.
+
+* Disabling data race detection for entire functions can be accomplished by
+  using the function attribute ``__no_kcsan`` (or ``__no_kcsan_or_inline`` for
+  ``__always_inline`` functions). To dynamically control for which functions
+  data races are reported, see the `debugfs`_ blacklist/whitelist feature.
 
-To disable KCSAN on a per-file basis, add to the ``Makefile``::
+* To disable data race detection for a particular compilation unit, add to the
+  ``Makefile``::
 
     KCSAN_SANITIZE_file.o := n
 
-KCSAN also understands the ``data_race(expr)`` annotation, which tells KCSAN
-that any data races due to accesses in ``expr`` should be ignored and resulting
-behaviour when encountering a data race is deemed safe.
+* To disable data race detection for all compilation units listed in a
+  ``Makefile``, add to the respective ``Makefile``::
+
+    KCSAN_SANITIZE := n
 
 debugfs
 ~~~~~~~
-- 
2.24.0.525.g8f36a354ae-goog

