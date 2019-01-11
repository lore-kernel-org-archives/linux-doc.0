Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7EF6F7D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Jan 2019 13:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732828AbfAKNrr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Jan 2019 08:47:47 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44181 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732207AbfAKNrq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jan 2019 08:47:46 -0500
Received: by mail-wr1-f66.google.com with SMTP id z5so15216102wrt.11
        for <linux-doc@vger.kernel.org>; Fri, 11 Jan 2019 05:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JfzJzGO9UGsoHAHmj51k1BlHyWbSStwDHYTwKhI57Y4=;
        b=NEkMkJ+mRpnXceIfKVHdidDME1rqbsVFFyuYNbksIGQ533359BmSQX2EilvvFPUN6D
         tGfDFrq2ukPIHlM36+5L0mDWXTb6Ve78GanvqRtToFr9dzd5KVM3wt9Pdl6siWpUfse4
         FM0lDfchKlAfLUl0AZ5gJk8fL7NW1qg+hR9XSoLfs+Z5XmjjckYgRkY/AkXKSzSCU91y
         J+sHFqQ8l26j7qabqmqE5gGX/GMMNOIuG3uKV4yyNrFVQmdFZgyrIK7bQhcGK3CrmYTF
         10lqjyd/OFB8ceEbDt1sdwwdIcMne/mU27opORNvTLOz9taoqsIXnKQtKou48XFVcVW8
         MQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JfzJzGO9UGsoHAHmj51k1BlHyWbSStwDHYTwKhI57Y4=;
        b=cKZarAmNF3un4aZfqcGpE/GH7lonUC44nYBpZHeRPGJBBlsh9wwxB2NDCC3+oIlOip
         j6hRR4+l54vtoK0iUn6FpN6KYfEe3PvYf1QAcngcWSxXJKu5EyIaUhr6Gs9sHh59skmj
         iIa60c3WAy6B92e+GSNiIgjXFJ4E/rYGZXMeW9lPoratouwfZuAG0eAdiXtAotK6tHPf
         KYmI63ea3mgONjdieOCuNZSgLcD5mTGWNqB8ds65AUdfivXcugrVpK+bAi+Po/JBChVu
         nevnAtlqZFyo7/HGFKzPaJ/wOCFz7v9gK8LkbxYVIv19hVNezZ73CEk6O5reqpHwB5LK
         0xXA==
X-Gm-Message-State: AJcUukfXH7I8e/HaTigc053o3y39VgYDJjEQkXAjjPfSs/9t6BDmkO45
        x4T+Hhsbzd0zgJ/8Q8QCY8JZ/g==
X-Google-Smtp-Source: ALg8bN79o72/jOe8866Av4s1M/ZY2sXogUQzDJeTqtK3cI+i3sVXtdmXDxWwD/wEpFd113uizmdOkg==
X-Received: by 2002:a5d:454f:: with SMTP id p15mr14423289wrr.39.1547214464989;
        Fri, 11 Jan 2019 05:47:44 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id 3sm22946971wmw.46.2019.01.11.05.47.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jan 2019 05:47:43 -0800 (PST)
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
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
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
Subject: [PATCH] kasan, arm64: remove redundant ARCH_SLAB_MINALIGN define
Date:   Fri, 11 Jan 2019 14:47:40 +0100
Message-Id: <7f36be5fdf491259d6c8100232fa93ff40edf841.1547214440.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.1.97.g81188d93c3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Defining ARCH_SLAB_MINALIGN in arch/arm64/include/asm/cache.h when KASAN
is off is not needed, as it is defined in defined in include/linux/slab.h
as ifndef.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/cache.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index eb43e09c1980..926434f413fa 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -60,8 +60,6 @@
 
 #ifdef CONFIG_KASAN_SW_TAGS
 #define ARCH_SLAB_MINALIGN	(1ULL << KASAN_SHADOW_SCALE_SHIFT)
-#else
-#define ARCH_SLAB_MINALIGN	__alignof__(unsigned long long)
 #endif
 
 #ifndef __ASSEMBLY__
-- 
2.20.1.97.g81188d93c3-goog

