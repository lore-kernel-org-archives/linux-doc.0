Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B0997DF88
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 15:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754177AbeFTPYq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 11:24:46 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37263 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932299AbeFTPYk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 11:24:40 -0400
Received: by mail-wm0-f68.google.com with SMTP id r125-v6so228600wmg.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k+iZynWQRXvZ5615wlWaB9aY3Mmlz8ffNowSv6lWV9c=;
        b=Yi5PvRI/WvQZWuC7LBADIW/4S61zU6FsZnonsBPtHh1OnZr/tsw7/vgcilAYEPpp3P
         H7MOwSQfZAnX4kMMjr5GbcWRcrWLJUjgyo9MQQymOZwV6IhhzlVDJWd0fN0dkju/J6fP
         kuuowXeWkDK1Q1Zbw606Nm6H1UdvRSyROBOfOtpK/2ddCELHQLRsilicNU1P20TUmB+i
         ijMKrVL6HDf/W3bvGx1eijAeBX7IOub0BlEIuDAS2sPkjYisHX3IPc6514252u+k79/j
         36kdUCz1UAbQ63TLoKQyKpwPU9dJP51RVzpkdc3SjxmH9ukUghNG1YH2/xltV/ZzVLLO
         uf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=k+iZynWQRXvZ5615wlWaB9aY3Mmlz8ffNowSv6lWV9c=;
        b=Wbf7cfYG9bgso42pEIozc61T0sV7cTU51j9KaL4Dkp9Jxmv25KGYNJJIMJ68kOVE1H
         Q2Ir8fsSTFVsG/mgF2CqL5XKMryPextrHlebpRHaAki4uhLUGeJI3oRiduSeL1zjC3A1
         G0ir0Jja3eThVFRPerAWbJ1GqyoheXrhHiPp5+NZuM76VQGoxPTLoSR5GWtWAhp9cM47
         gV2IC25tm7ToHjkKan8exi2UY8xHvPiKwjC+kaNPCZMZC+dhjLWKqAdnbrXn5M2Txlra
         Xkh0jFvlNUKLcVrBTv29zptUntScdr8yLq2TC3nAEmt/r30fv1RowoQVBITMoYuQmmve
         6qQg==
X-Gm-Message-State: APt69E2gm3A4nvUZ2l5jqB5J2evqpQ4imDrdcxDLzTYBxzLz/me7fz4J
        FaeTJLIOiicvYdmV3VBlYrFniQ==
X-Google-Smtp-Source: ADUXVKJXc6AKKDoJ+FdN8W93tAEIqcHbvpdSefvagKsbEhUe3hdApwEhSHA+uBzxdDaEIYJpEXocQA==
X-Received: by 2002:a1c:3693:: with SMTP id y19-v6mr2024605wmh.71.1529508279217;
        Wed, 20 Jun 2018 08:24:39 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id c11-v6sm3959244wrm.65.2018.06.20.08.24.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 08:24:38 -0700 (PDT)
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
Subject: [PATCH v4 6/7] arm64: update Documentation/arm64/tagged-pointers.txt
Date:   Wed, 20 Jun 2018 17:24:25 +0200
Message-Id: <ac42b33affe34c8146ac9a882f6c6be270726dc7.1529507994.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
In-Reply-To: <cover.1529507994.git.andreyknvl@google.com>
References: <cover.1529507994.git.andreyknvl@google.com>
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
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
