Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C3317D581
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 11:42:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbeH3Pny (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 11:43:54 -0400
Received: from mail-wm0-f50.google.com ([74.125.82.50]:39533 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbeH3PnN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 11:43:13 -0400
Received: by mail-wm0-f50.google.com with SMTP id q8-v6so1681265wmq.4
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5dvluYXXhbs3bkFHe7bYXbDtGM4AV4lqI04lFKRyGa0=;
        b=FrgdPh5TBPIr4rtMd7tklQtyRgar4ZAsFHKz1PwEj3+VC5jau9Dry3d3VxRWxcx9DN
         aM7aeZudTWm7p/kNyIHKV/3zc+Y5VxHMcMOGT00Raehj8yCHK4qQRjbgPVV2KLJMxAqa
         3Rgdu4UCrXM9AqoS+dFhMRoW3rJ0nq+cpf74SiEB/jzedt9fBg4Hfm/m/pENAIQSu++0
         oMrCJovZb3IkPM50eWmd/9DzfAZugaZLcIZhmav9Cf0kn8UP4YxUMn9mjnercwABxtdG
         oWWF4BHN5MPrFvo1HQRM1riSm10AId1VXqNCaVpDU0IN56koQpJ+E8OSG+nLyWo4zchm
         X6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5dvluYXXhbs3bkFHe7bYXbDtGM4AV4lqI04lFKRyGa0=;
        b=lk1AvsFVlW6xsxBIDh6iZQSWIxkC5fCWRm1GgG9e9QBLyp7duOHOkXV4b//2Lc+V12
         yWA4MdGJqxNEyg5Ov9f7x0xtMIGTM95wupjSOV60iGdIVmdaHOHo4eaiQghlZvXPCTUh
         wUc5Dt636xsmpKz6OkhtwoiSu+b/bSYhbZu3/uG/ksVVWJ0z7WD9P97qZgUlpz/7/QX2
         /H0Re3/AbEIhbZndDwqWrvvrUTQuZitlzNTfiKy2qj7Ordd26JyJJK9jmiAxMujGel69
         ghegd7W0cn9FaO30R69HLk3WvJHQb80BL230yArA6CSTkOZUVY8uo4t8mrCoiOYvOf5S
         enWA==
X-Gm-Message-State: APzg51D3WFYrPbgQmBFbxDn0mW1+/RWZs6zLnCOiaSOBiMqMLT3csw7r
        vAKd77iX4Bo1bz9rA5/GBIj9lQ==
X-Google-Smtp-Source: ANB0VdaAurM5wWvTbuaKJB5Eic+D12Dz24+pkaychw8uSDgku8eMYRWKoLaud5DLPVltKXfKUxcYpw==
X-Received: by 2002:a1c:b143:: with SMTP id a64-v6mr1645342wmf.114.1535629288159;
        Thu, 30 Aug 2018 04:41:28 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z184-v6sm2175218wmz.0.2018.08.30.04.41.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Aug 2018 04:41:27 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
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
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v6 05/11] lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
Date:   Thu, 30 Aug 2018 13:41:10 +0200
Message-Id: <a31c2ab78925e0df0a9164e7ee402141ca1b0d6b.1535629099.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535629099.git.andreyknvl@google.com>
References: <cover.1535629099.git.andreyknvl@google.com>
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
2.19.0.rc0.228.g281dcd1b4d0-goog

