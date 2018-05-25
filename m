Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C23887DF8F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 17:22:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936185AbeEYRVo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 13:21:44 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36378 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967628AbeEYRV3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 13:21:29 -0400
Received: by mail-wm0-f66.google.com with SMTP id n10-v6so16450673wmc.1
        for <linux-doc@vger.kernel.org>; Fri, 25 May 2018 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lUjckscRelX9WqN/6FUbYAqpLfBHLKlTJUaLXI/81Ro=;
        b=D7wi0tvjGH19GsmXvbUDFetH80WmiT4sVJkuo+6TlZIwGVZF+aeiQcRS/zVmd8hsoX
         4M3pb80fq+hrweG1H8PrClMPr0hbj9DeVne7liNqjwdm1xO7kVtHU0nQdAP7Xgve6OTz
         xZFS2mXfuYsHhxMX8ju2+atPxjD8N4oyk82Sqixng6MM03/1agy4pcjqY3JKOspVMF/R
         htHGVfzb1Jw7DL/BhVN9GlqBWuH5Z1XUHAf2OyyrFroQLSm31Vc7+wfISANc/L32WF66
         VrBD4kL+p7jsiTrPilKzWRPii3adIgj/29FCdh1mhNf1eqQIOp9IMFnJyOutowNb5SYh
         wpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lUjckscRelX9WqN/6FUbYAqpLfBHLKlTJUaLXI/81Ro=;
        b=V1zEPfmgIn4XVM9tdLaZ5t4dRMdSjQbyzp7/AI5kcR+yvDjN14kH+d1uL6zV0yUiNd
         LfwS+je/VSKFfNB/a8N9A46DAJs5QLhJ+3yd4RCTFYKcWxK7YVPsrLYNQIugEzoqw5ya
         mHA+tPdYHaw0/RaK2miHeIkkVzOaXcpPBypG0NhIBfdimJqZ/mfJ0Pfx4bV7Mz+a98E6
         4dhT+Yba/++7Wv4IiipJOajLaLKP+ocKVgLXhrsOxVZUfX+J9yMhGpjJzMUNhdE+CplN
         n69yu8iLK4JGhDEoImihDNar3K8P8YFsqqsdMXx7aufug+yEhp6U+FpCwHk2oL6JZqqd
         PFJg==
X-Gm-Message-State: ALKqPwd6kfQqvKIkKLQ4MEaSYKNl55aJ+7PJGCJuB6tgOaGF+XUw2k/T
        InmgoyUC79k4GnQkxZyvz06pgQ==
X-Google-Smtp-Source: ADUXVKIm/vYg/sw9XUuIzvcDV9itQGOEJwWKLZCdqZ3j8/6iqc1AzAIteFMZ2ogZuXnxueZDrFqurQ==
X-Received: by 2002:a1c:9249:: with SMTP id u70-v6mr2252097wmd.128.1527268888271;
        Fri, 25 May 2018 10:21:28 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s5-v6sm26579964wra.48.2018.05.25.10.21.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 10:21:27 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v3 6/6] arm64: update Documentation/arm64/tagged-pointers.txt
Date:   Fri, 25 May 2018 19:21:16 +0200
Message-Id: <e5c51f30f639adeacd4168d925048329b4d6fd32.1527268727.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.921.gf22659ad46-goog
In-Reply-To: <cover.1527268727.git.andreyknvl@google.com>
References: <cover.1527268727.git.andreyknvl@google.com>
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
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
