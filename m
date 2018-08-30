Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 01E0D7DE7C
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 11:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbeH3PnO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 11:43:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34712 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728468AbeH3PnO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 11:43:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id g33-v6so7778761wrd.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QaAF7azGCBxdq6iEEzNBoAuvrmN85mP7cm3lHvX0lL0=;
        b=akbNH9Dh33OFp1Yfxft1/iAWWvJdMIyZlPJJ1bI0TCj69lznWK3PI54Ty8g0gacvcP
         VTI4KEwgIwjURL8e5z8lVSK5LXhpqWNEr9yq465J29bgrU8yZ1vOIjdWB8SBL55Ktaw+
         8Adr/XBoiIXlbE4KMMggbcpFWiFvuTQu8b/9+ZEy2JKekcqtBUZQUbpHiHx/F7cdzpHc
         SCsOWLH9Oo7s3BL0RMzwMg6Pyb7eImoM78fpbnUZafChxGJqjAGAblnQ35NEWyWvHgzx
         Tucj0Yxt1kjv9ZOtZ2XgP81Y13NrW0z+E5TMYVyvGsqMLpUxSwRAqIkbptaHRxFhZXd9
         qdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QaAF7azGCBxdq6iEEzNBoAuvrmN85mP7cm3lHvX0lL0=;
        b=paqTVcXyHrLXvFjDoCPs69kA9DlOwAEjMnwJSCvpi14aPnkogXIOd1TCdPyyXsDHMF
         GFP+UCibFkhgsVMMebvU5GVuZvCjDW7wf1A+ah5azlNsdbS0EPssnNJZM2nvDjNHjd2/
         XtQx2OjomzKk2V8WQxjLU5Fewn79dEu9/lySx8YyOSNSV2Zpijvqo63qJDkVQAiBLFCz
         ngLoOnma1WfYt6MUvNzUWAFBXi7Cs+X4rJKG1S83A42U/fO9UT+AKUJpqaEBNp6RGWvv
         nRJxq0LXOA/1wgn6ojQ/x+p0/f17CSxpgf9qVIwF/K8wI3f23ZXthyq1PMwojvMDTjuk
         pksA==
X-Gm-Message-State: APzg51DZH4H4LwU125wJBNDI/OPmXqhEjVCtHSBs0kMJr8LUcmmhxrRP
        vd/xhfZo5AEsBC+LHEqRFnyz0Q==
X-Google-Smtp-Source: ANB0Vdaqqjdd90OaOAwZrqHj8elm7AVweBzpTBqr0QeZInQNaIkAj+Q8mqFZIzcP+cnkSEyeBYYIhg==
X-Received: by 2002:adf:d20a:: with SMTP id g10-v6mr7876598wri.66.1535629289628;
        Thu, 30 Aug 2018 04:41:29 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z184-v6sm2175218wmz.0.2018.08.30.04.41.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Aug 2018 04:41:28 -0700 (PDT)
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
Subject: [PATCH v6 06/11] arm64: untag user address in __do_user_fault
Date:   Thu, 30 Aug 2018 13:41:11 +0200
Message-Id: <b0f447bbf035a5b0a6cffa9035f1f922266a9f35.1535629099.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535629099.git.andreyknvl@google.com>
References: <cover.1535629099.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In __do_user_fault the fault address is being compared to TASK_SIZE to
find out whether the address lies in the kernel or in user space. Since
the fault address is coming from a user it can be tagged.

Untag the pointer before comparing.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 50b30ff30de4..871fb3c38b23 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -313,7 +313,7 @@ static void __do_user_fault(struct siginfo *info, unsigned int esr)
 	 * type", so we ignore this wrinkle and just return the translation
 	 * fault.)
 	 */
-	if (current->thread.fault_address >= TASK_SIZE) {
+	if (untagged_addr(current->thread.fault_address) >= TASK_SIZE) {
 		switch (ESR_ELx_EC(esr)) {
 		case ESR_ELx_EC_DABT_LOW:
 			/*
-- 
2.19.0.rc0.228.g281dcd1b4d0-goog

