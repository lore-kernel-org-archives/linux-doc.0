Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D8B527DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753092AbeDRSxq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:53:46 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:43462 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753050AbeDRSxa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:53:30 -0400
Received: by mail-wr0-f193.google.com with SMTP id u4-v6so7512628wrg.10
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 11:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=EZGWuFfiHqjCbpQnzR64TWy+WxEaujGKaSajXvCUFAc=;
        b=XoOfHGDK7SgM9AlCtWHh7oh0GHDm4VZCG+jh1df8Vj4ySECjuzY2zXvwQBEs+sLGqB
         6riaTc1/uxe/qFc30n7Yu43YH+sX6eTZV9LRvLh4/hkMa9HIW1ugGQuFc/Ah0OBfOwD4
         e4wTpiBLAFoOxv1VLZ3TY6TsbcUy/J2c5vEGhEcWec0e3bWZ1PAMsFqijpV7YERCLimq
         v9eHL8GFoVB/g8fTQkNuNPC8Av5ezgvUGKackOhu1rb3Z6JWUPuiUowbY9S4PRA7RR/d
         5K5lAZD9nV60MKJlhgI6GNaaPOXgq20MGKk3ntFes0rUWxNS4SkHPFFi8EbDUB0/t6wD
         I2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=EZGWuFfiHqjCbpQnzR64TWy+WxEaujGKaSajXvCUFAc=;
        b=OqwPDOmUI0WxMQIhvUU1gkDfQMKxnibQFdueu0Ft8ptmXMKunyyN4r/QDwwc2cs15z
         dtPs53Kb9Pqa4lkqVxUUk4ks7R8FTzIlRF47u9MNJq1XmkVdw1R5twIN6cuUZ41DwIO1
         1MF/bwsz2FYylbU6MiiWWW1dwzK9w7JMnY6bEwtU6ggm8C8DiM9i2br56GmziKepEzra
         //+EUjSuSxzCxtmo0gdkupN+/5iu7QT8dtofMwj2O0u/sJ59kqvGz4a2EtAljkVwNfFC
         fogp4Df1/YzLNJ73JEFfVZZDfjnk0H2EsF3xHTLI52kxiyPw/dXbYVxOpIGv7BGgwDT4
         LZHg==
X-Gm-Message-State: ALQs6tAzTGza79XK2dJyZi+ak2HSUC4ry9CikVtF13WMR1O1BGeUwANN
        GGdWwiSByfd7WH+hEom3VI0JRw==
X-Google-Smtp-Source: AIpwx4+jqENAWip/MUW3PGvlX0PAg25j/IaqTVI58MpVYsnVtxnKfu+qYLlIBk/+1UQ8zcYiy7iy7A==
X-Received: by 10.28.148.129 with SMTP id w123mr2649992wmd.116.1524077608370;
        Wed, 18 Apr 2018 11:53:28 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k79sm2616735wmg.39.2018.04.18.11.53.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 11:53:27 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>
Subject: [PATCH 6/6] arm64: update Documentation/arm64/tagged-pointers.txt
Date:   Wed, 18 Apr 2018 20:53:15 +0200
Message-Id: <0fdb6332cc5bf333f80212d0b17edadd2bdc9fcf.1524077494.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.484.g0c8726318c-goog
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
References: <cover.1524077494.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a note that work on passing tagged user pointers to the kernel via
syscalls has started, but might not be complete yet.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/arm64/tagged-pointers.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm64/tagged-pointers.txt b/Documentation/arm64/tagged-pointers.txt
index a25a99e82bb1..361481283f00 100644
--- a/Documentation/arm64/tagged-pointers.txt
+++ b/Documentation/arm64/tagged-pointers.txt
@@ -35,8 +35,9 @@ Using non-zero address tags in any of these locations may result in an
 error code being returned, a (fatal) signal being raised, or other modes
 of failure.
 
-For these reasons, passing non-zero address tags to the kernel via
-system calls is forbidden, and using a non-zero address tag for sp is
+Some initial work for supporting non-zero address tags passed to the
+kernel via system calls has been done, but the kernel doesn't provide
+any guarantees at this point. Using a non-zero address tag for sp is
 strongly discouraged.
 
 Programs maintaining a frame pointer and frame records that use non-zero
-- 
2.17.0.484.g0c8726318c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
