Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 953F17DD29
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 12:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbeLJMvU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 07:51:20 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40229 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbeLJMvT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Dec 2018 07:51:19 -0500
Received: by mail-wr1-f66.google.com with SMTP id p4so10338664wrt.7
        for <linux-doc@vger.kernel.org>; Mon, 10 Dec 2018 04:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=THrF65uyQ43y9XI4Oao8ZCD7W0hiODFoiBK2GnkK+6k=;
        b=PdfHiKV/nw+CfvDzzUmvpjA/YhVLjcLEJGbE4xRNKckctV4ggJLQ09SaEpJOCkc/Wd
         TsbWeQ7VqNxHNADvOwoiDxubfQDEDS0+PHacVgOSQwfEz02dQXLOTxmV5IykKVkn0f9a
         qcdjj+pRCBHgfvFs4fxlSCiaYPFMMXTkQUdwp3B9666yUCdbDg9xBDMR3zDN5H2HdY1U
         EAZ/zAia4HQUr1OpEIgycWmDLiok+qqigVLOzimiWXbPovc2JNH66nE7jrGjj0/pP7Xm
         u31n4umKu6azySOlPyk4zWiDSNjuQbTXYYgyyZeCL1TW0iqGcwgkW/T/pb9E8YfCUAZ2
         045Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=THrF65uyQ43y9XI4Oao8ZCD7W0hiODFoiBK2GnkK+6k=;
        b=cYxOZbij5hjJtamDqMBvGq2PV7Y1FfLAAJqb+GVLRI1vCSbeKeYkVCYv9AuwWkcZ4X
         fRfBBR+zjEvMpBW9cu9+Nk4EdPupEFJpzV6a+ojtEutyfQs4NN7Z21MwFRW0Y5v52p1u
         ye52rEt1hgVzfm4roDbuF6FrSU892EZjszs2MA8we/GTp4LQ0lsASPhqkODx3a/ex1t+
         b13zX0VcHaRvxk1LhfT+Hqx8CVQ3xGNXHiDbtZ4KUjs2EaFS5aR21YAYN9nXXlviT4EL
         W9toHqVHXr7JEqhBtWsP3PThDkHPDhJhN/6v+EELbLyiG9uUvWJoCEAwsX2ENysJEDsg
         49Jg==
X-Gm-Message-State: AA+aEWbbIpGIUGy1538BIGkYpIz0SwMzNAEKcaJshEjcnAlNhYBZpKJi
        4pRNPpZMLfU7t1ubCwIzLZS5CA==
X-Google-Smtp-Source: AFSGD/VI/5BMsRXqnw18fB6Gll7b+Eig1k8PMWahNn8bGC0uXwXuMAwRBnIM/ZnTZkzB47NBiSqZdQ==
X-Received: by 2002:a5d:538a:: with SMTP id d10mr9405307wrv.202.1544446277017;
        Mon, 10 Dec 2018 04:51:17 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l197sm36893363wma.44.2018.12.10.04.51.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 04:51:16 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v9 5/8] lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
Date:   Mon, 10 Dec 2018 13:51:02 +0100
Message-Id: <2c573564b456327708d175f3124256bc71081bd8.1544445454.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc2.403.gdbc3b29805-goog
In-Reply-To: <cover.1544445454.git.andreyknvl@google.com>
References: <cover.1544445454.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

strncpy_from_user and strnlen_user accept user addresses as arguments, and
do not go through the same path as copy_from_user and others, so here we
need to handle the case of tagged user addresses separately.

Untag user pointers passed to these functions.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 lib/strncpy_from_user.c | 2 ++
 lib/strnlen_user.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index b53e1b5d80f4..97467cd2bc59 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -106,6 +106,8 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	src = untagged_addr(src);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)src;
 	if (likely(src_addr < max_addr)) {
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 60d0bbda8f5e..8b5f56466e00 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -108,6 +108,8 @@ long strnlen_user(const char __user *str, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	str = untagged_addr(str);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)str;
 	if (likely(src_addr < max_addr)) {
-- 
2.20.0.rc2.403.gdbc3b29805-goog

