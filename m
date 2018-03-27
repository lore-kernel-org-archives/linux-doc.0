Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D98297DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 16:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754274AbeC0Q57 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 12:57:59 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:46690 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755465AbeC0Q54 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 12:57:56 -0400
Received: by mail-wr0-f193.google.com with SMTP id d1so11089082wrj.13
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 09:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=zLiSxNYCnbZDGOudEgmHw5G2g+Qsz+FQUgsgraVMNdU=;
        b=dCo2qWPklBfMRyZnIkK9tXaJjSF8B6r1Aivq6hpI1SeUrHy+/gCVqYqRdIFK/bTpZK
         +SqF7iWci+OenSDS5EKNUZEMz0A2rivQrzyJgb1zW2Dmnj7VYmNrqb1O2dE5GhDKUBMY
         Fq+YXUE/fcKFejypRxAbkWfnphhe6NRHU429QjKTrJo8lqStvoes6Kd3F0BwAA4spq9J
         4qQkh66OjsJu6XD4BXuUmEbV3yaBW9lDyBBnbaQluS2oiX8tmCKAbZS1oiNVgYw/Gjt5
         GhG1Qobn+1ta44btCuOC2jtxyoLjRtFqkA9IQOdPtixLk3cT3jJBYo4HJa93kQvNo5Lg
         btWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=zLiSxNYCnbZDGOudEgmHw5G2g+Qsz+FQUgsgraVMNdU=;
        b=pDfHCaQy3Oze/Tchree6muUkXt0xHa9XNSYyzzfUQjGcICnOGeRgGnMmpfSiGNbJ1M
         g/Es5j9fK6kIdJXZqG35Kb7iyBNnGyjmM/6QAVOXMLmIQh7vFq+3rz8AlgvG147RJ0BE
         Rik3zsAglOoLNUuiGX11MXWzskx7UWdKDFXd5bM7sW05AXFWxM9wgrQmehokYXJrIqoo
         pfAEpzDDlH6rzAgwQTRbypSij0AtqabqI2QGVmedFFAnulDYeUzDmdIg22Z2GCvQVrwr
         YLwg9LLddFIhpRJBjH5MEaC1JlKsypQaR9TAnIiM4laovl3cvQsT5fV3YKdJh1oQQFDs
         jQcw==
X-Gm-Message-State: AElRT7Gkd85n4Pz3XLgZBVzMNT0iDJW1inD73pzg9ifkUQ7oeMuPPE2l
        CcOnMeVR7c94tWlwjkyak33+Fg==
X-Google-Smtp-Source: AIpwx48QI24nLLjNvxbcD2UT2yQZ6pWgReRkH9he5h6cS3juE62VyMrI+6oe5NRpvpUIOW/Duw1EiA==
X-Received: by 10.223.225.76 with SMTP id f12mr124682wri.128.1522169874753;
        Tue, 27 Mar 2018 09:57:54 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 93sm1622992wrh.46.2018.03.27.09.57.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 09:57:53 -0700 (PDT)
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
Subject: [RFC PATCH v2 5/6] lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
Date:   Tue, 27 Mar 2018 18:57:41 +0200
Message-Id: <1a761b77620457f3bb57d327343765068cd652eb.1522169685.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.rc0.231.g781580f067-goog
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
In-Reply-To: <cover.1522169685.git.andreyknvl@google.com>
References: <cover.1522169685.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

strncpy_from_user and strnlen_user accept user addresses as arguments, and
do not go through the same path as copy_from_user and others, so here we
need to separately handle the case of tagged user addresses as well.

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
2.17.0.rc0.231.g781580f067-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
