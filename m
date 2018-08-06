Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A98607E3D1
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 16:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388209AbeHFSv0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 14:51:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35069 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387789AbeHFSvB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 14:51:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id g1-v6so9509340wru.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Aug 2018 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qyIb1LedubX4Bm4tOfTQFFJt+XM5l2v/UMtetdGR0wA=;
        b=SJkaC5hITo4nP+vXjYHN2mVUXmdrwLIHbNc8CpZmyoVvw3V7GtCN1wz4N7Al1vQJcF
         hd2hQ2Dda2FOZFaB3fi4YONbr7FkxJE0+zV6mYo8QkXkiP+cwOm4HdDWfXUKGfXTgQlN
         Q8wwiuZ3k//FGLrWLP4x7doPn4M/2AOprO2n9lsdrV3GL2iuZY36GdqROtoI4m5Lg5QZ
         FAAmEmPnQxfd5XtkyfuMIGdZRRZ9O3+CyxV3b1xZlSjyfDnCfuNe+F9+7eELSrWmRhH9
         ogwsvNzG8jsKFD9+W2+dNbTKYfDwtsP7DnjDyEzq/aPqETSO9v2jfp/3lWSRQXXa9tjz
         rjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qyIb1LedubX4Bm4tOfTQFFJt+XM5l2v/UMtetdGR0wA=;
        b=WWsO+sQl2Iv9lj4jDViTarg2wxQcLYp/k8vOpLSWTDxeAakqnpZ0FhuqypOXNtHicD
         ott6mk4yTj3mkKm9tL771o8www1CvvUrBLMuCCaUY7PqB7EAiV2pU0x0xkhkG8MXVkaI
         fk3exiRyzKmWVzKJZs+UeRcwNl0N+oxx3f3Djn2KI9TquofEGLzdIQyqTyNYFVnXOGGc
         1H/vvsZ56K3mcHapSJHje036//kCCxlkw8s7NGNsX8ZmY5EDNA2JSPKRI6e0EXes7woG
         kvKtG6iM6BawOA+HdkhCra8/XWDPqffQHr1C1WyhbOIB0V0wVYhdmkbW7KIQDyz6A//r
         c2Gw==
X-Gm-Message-State: AOUpUlHFONCxXw5EwnDQOKuTSZesm6pLVXgNjMV4IZFeokCN6WJuaaSz
        EP+tJv3iE70ARYLddNlWZlUGkA==
X-Google-Smtp-Source: AAOMgpeO7k6j2TtDLWY/G7617DSwScmheLW9n+G6mjNCfjUdKJdVUj28MA6JiNxNbo41h0Nsk3UX4g==
X-Received: by 2002:a5d:50cd:: with SMTP id f13-v6mr10733476wrt.73.1533573666455;
        Mon, 06 Aug 2018 09:41:06 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id 66-v6sm16385790wmw.34.2018.08.06.09.41.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Aug 2018 09:41:05 -0700 (PDT)
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
Subject: [PATCH v5 09/10] arm64: update Documentation/arm64/tagged-pointers.txt
Date:   Mon,  6 Aug 2018 18:40:44 +0200
Message-Id: <5396af31a51aaafd5d65742d1cc48854513be778.1533573460.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
In-Reply-To: <cover.1533573460.git.andreyknvl@google.com>
References: <cover.1533573460.git.andreyknvl@google.com>
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
2.18.0.597.ga71716f1ad-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
