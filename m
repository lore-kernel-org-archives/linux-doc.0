Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 52B6C7DE7D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Sep 2018 18:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387651AbeITAey (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Sep 2018 20:34:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52886 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387658AbeITAew (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Sep 2018 20:34:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id y139-v6so7330667wmc.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Sep 2018 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1D2lwL1JaZ9jajF6hdt8cBeNs/CCBgtmxQ7KM/D8RFc=;
        b=PxgUzK0vwDBTyXOPX/cG4NMJdxB4fKJyTnmf8FYPU7Tl7a3W3/HEqI9dXvbmEyWpXP
         PMy/6ufcrDslWWqrDpyxBbArZ24kZrdbF36ZQCcAF9KKqFiIoj+Xq8lguy/MhBKLdXVF
         LX5t1Or53C4aX3hsKSOGer+P1D9wvnTYidtqpN4MkA159JXYlv/M/qM+LI5RlaY6IZi+
         EQ8Hzjdc/4SK7JzcWQKYUNPiUGuClZk0bRzHrlBJZwT5bKRIqwNikQ7MBLrL/QYSu/YA
         p7/o6paGlSDwSslz5TTOCe6YiXAIOfZLKsaiynXEfr/6v0HlmT7enSaUlTczy5k87NWH
         K0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1D2lwL1JaZ9jajF6hdt8cBeNs/CCBgtmxQ7KM/D8RFc=;
        b=SlMvaS09tXd2SvXIIPio83rYmaF5fs9QHrIzCpL03xyipPyks5WbtQxroMWKtyb0ig
         xrG9U9weTepPPWV3kcXCqAqetqS2JO769FQ1KDgARGhqceSo7hVMTwmlkkzBh/t5FOt9
         RvkKxdM//n1KiV8g97z5lxu0kfF+Oryf0pckqqLkhSxjKjEVORRIodKN64va5qg/XqXu
         z6iW3jE0HKSQYQ/UvrIDEMzZ1uoccR5q+ump5R2jHZMGs6uTVLT5Lufqm0slRFdE/HWt
         w+L5QVWWBNL0j4HRlL9tWn8qWIP7kjgKe9QM8w/MdJ3TdNtJ9yHrTRAhVdfot5HsKs/J
         4thg==
X-Gm-Message-State: APzg51AeJ+tTmtqN0EKgIdlC8DJxFlrSa1+EnmM6f5vd1IQrt5K0rhPl
        3vQsJTQvKQyYQ1RbjfWbZfGCkQ==
X-Google-Smtp-Source: ANB0VdZAwJs1ECP4eUwXCvbP/BcECN97gCYmPsH+kOoBGhi7wMdxkP2oUW7mAkEM8arF+3YVGck0kQ==
X-Received: by 2002:a1c:9290:: with SMTP id u138-v6mr21164170wmd.52.1537383335654;
        Wed, 19 Sep 2018 11:55:35 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id b10-v6sm8510065wmc.28.2018.09.19.11.55.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Sep 2018 11:55:34 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sparse@vger.kernel.org, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v8 20/20] kasan: add SPDX-License-Identifier mark to source files
Date:   Wed, 19 Sep 2018 20:54:59 +0200
Message-Id: <d1494fdf6008c0c08b29930efd057a28057b8ca6.1537383101.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.397.gdd90340f6a-goog
In-Reply-To: <cover.1537383101.git.andreyknvl@google.com>
References: <cover.1537383101.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a "SPDX-License-Identifier: GPL-2.0" mark to all source
files under mm/kasan.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/kasan/common.c         | 1 +
 mm/kasan/generic.c        | 1 +
 mm/kasan/generic_report.c | 1 +
 mm/kasan/init.c           | 1 +
 mm/kasan/quarantine.c     | 1 +
 mm/kasan/report.c         | 1 +
 mm/kasan/tags.c           | 1 +
 mm/kasan/tags_report.c    | 1 +
 8 files changed, 8 insertions(+)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 25be74d3738f..de76a2bbb375 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains common generic and tag-based KASAN code.
  *
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index b8de6d33c55c..ccb6207276e3 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains core generic KASAN code.
  *
diff --git a/mm/kasan/generic_report.c b/mm/kasan/generic_report.c
index a4604cceae59..5e12035888f2 100644
--- a/mm/kasan/generic_report.c
+++ b/mm/kasan/generic_report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains generic KASAN specific error reporting code.
  *
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index 7a2a2f13f86f..b3c068ab2a85 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains some kasan initialization code.
  *
diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
index 3a8ddf8baf7d..0e4dc1a22615 100644
--- a/mm/kasan/quarantine.c
+++ b/mm/kasan/quarantine.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * KASAN quarantine.
  *
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 214d85035f99..ca9418fe9232 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains common generic and tag-based KASAN error reporting code.
  *
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index a3cca11e4fed..7b7c21d40851 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains core tag-based KASAN code.
  *
diff --git a/mm/kasan/tags_report.c b/mm/kasan/tags_report.c
index 573c51d20d09..8eaf5f722271 100644
--- a/mm/kasan/tags_report.c
+++ b/mm/kasan/tags_report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains tag-based KASAN specific error reporting code.
  *
-- 
2.19.0.397.gdd90340f6a-goog

