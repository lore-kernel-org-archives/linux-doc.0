Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D1D97DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 11:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbeH3PnT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 11:43:19 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:40113 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728653AbeH3PnS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 11:43:18 -0400
Received: by mail-wm0-f66.google.com with SMTP id 207-v6so1659189wme.5
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/jdbb2Vq3Kiym03/gav3BOUvcnL67E9+cfyfM7MhIU=;
        b=DMD4I/SS8lJ+d3U1+HP9Yl6kLLZHPhvAdJS/JxxXCHjmDxUF/UgLbg2LpoqOkcwLuR
         wQQPHq4FCtWNS5xr7a3yBgBLJiWBX59b39kyQUx1OqIRTZZTjyRpftdyJmGkxbABZFU6
         5KDwphISdpfEXbTOa+4UH4EiTU/0Wi30p9H0GhSfdYr6ze+w3YzNJGGCjrGlYOzyxLmh
         iWSjewMZmvPQ1GwgRIhyGXsGTzAm8HlL91OxzULxqV+6QAR/5fdqnSyQQBmOZsTukWgi
         9+fmCsSQzqxxTagM+2Wx2wT5yLGsY3A4DZXaZsUTAtgiarABDJqijOFj2slq5uuV7G9d
         s3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/jdbb2Vq3Kiym03/gav3BOUvcnL67E9+cfyfM7MhIU=;
        b=GUmm2zsuziAPr8MiELuEnxzjUtX5h7aGfsHGhD9vIaHCoEE9VGFekw/Q52BYXcJbT6
         hTFti+K2W7X8s7r1piSu7JL304rmeG5RzpG+ZlYF4p9Sx7ppmH2kVi8rgrfhcUcLiZuo
         H/jFJP3B2gCbF7JpCnSvznK7sJKyX34zw4XAL4fRoZj0JjEfziwz3Mtz7vAWsah8CAcy
         EUZgDC578fPnvESM7G+m145B1oY4jXUify4BYjuC56wIfY9SkvrttoZKSHO5Qi2pLB7y
         PZxRM2lkjEyNHDEL3RV58RWM7VQlseNe0ZILWMu7c9B2jATdHn6xHJhqtUUlPCCV66Fg
         f5eQ==
X-Gm-Message-State: APzg51CqxFWu2C6qAi8X4A6RIX95HreL9aGKdHL8nSesgQUgZNImrIX9
        v+3qWzYZCNXpwDY3H7lO7QpqgA==
X-Google-Smtp-Source: ANB0VdZJCY9SDGNv4X5vQQOPslJfwglBfynr1JnV8gKw4PAQtLtDlI07kC0OD66facMHWBf1VWf6KA==
X-Received: by 2002:a1c:e54:: with SMTP id 81-v6mr1614151wmo.84.1535629293894;
        Thu, 30 Aug 2018 04:41:33 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z184-v6sm2175218wmz.0.2018.08.30.04.41.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Aug 2018 04:41:33 -0700 (PDT)
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
Subject: [PATCH v6 09/11] arm64: update Documentation/arm64/tagged-pointers.txt
Date:   Thu, 30 Aug 2018 13:41:14 +0200
Message-Id: <594756b2aa9fea948f4da3cd01ffa8a5acbc5805.1535629099.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535629099.git.andreyknvl@google.com>
References: <cover.1535629099.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.19.0.rc0.228.g281dcd1b4d0-goog

