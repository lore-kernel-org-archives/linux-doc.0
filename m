Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF08C433B4
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 05:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 323B261176
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 05:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhEPF6n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 01:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbhEPF6m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 01:58:42 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4523BC06174A
        for <linux-doc@vger.kernel.org>; Sat, 15 May 2021 22:57:27 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id h7so1505432plt.1
        for <linux-doc@vger.kernel.org>; Sat, 15 May 2021 22:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=subject:date:message-id:mime-version:content-transfer-encoding:cc
         :from:to;
        bh=v4i4hH9wRWnBCGdUotO+3BYL0hM+Eo+i46g7TxYffPQ=;
        b=x6zndFDfYyl47/4UADZGbyXKUOQXl1v9G0Ub45ldsCIC0x5g7q85S7gTRduMhvMqAD
         bbAmtABVzZHWCSKLg72hj2h+hyFMFNIKVhMBJcaemnEF1GA5Q5cnnpZ5mya10oD4nFH+
         Q9Apv9igQGFypGOhvqadqcD3IIyKff7Y40rO+8IRIsWiL8zJX2YB0LZsPHNNQxYY8VQi
         sHLLBvrF4bx0qc1NdGIQiGys3ME4CcJKqpOUl8MTkjXUSUrFaEFy5cIP+GAadlJUm08d
         h0gAq+uB5dWQqQ/mzAolIunFOQOmOtJGlmiaZRTr3ruLS/CiEb1eSQSU1/tjReHn/Bhl
         HRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=v4i4hH9wRWnBCGdUotO+3BYL0hM+Eo+i46g7TxYffPQ=;
        b=frVf1V2P/4FzWHueGUvKK6UleE4na7dtGDqdAtFTBfEVKWkgx6cu0cOEs8Vl8pi/H7
         vAg1X9Twu+6PjGKr0TXZteDwFThqFHJPIgD0E/MMJziFyjDQab6gBAt5njOONcTg/tU0
         766+aWPzJDeMqJcZ9niczRVlYre6EgmS2wpBf8EY7WshsaPHhYZ8ebaqQi8MuKKFsgWd
         +bXLBTI0ifJz0/9iSdXx7Wr63V/Xv1Ur6HVO/rGLjDgsBePBRkS0jbVcu/wZQaM0NEhB
         Uo35wo6eP4asbCG/MoNaQL3egyhnTYgxZVFzvNtqwwsN8qWSXVGueaCLzKkWYvvdbabD
         Tbuw==
X-Gm-Message-State: AOAM533PT3n66tHAYi0Omaz7iRki9svTHosuPFeFTbAeP+9CYfdnRFnP
        Zr7wqlx+SCUws+AxtziSJkjBpQ==
X-Google-Smtp-Source: ABdhPJwEBlgJ6tUfCuMtyiYFU4JMDkPX8lC8oTu76DkIZwfYl387dopXFPBiw0eioBooFJgmlHbzaw==
X-Received: by 2002:a17:902:bd87:b029:ee:e0ae:cf0a with SMTP id q7-20020a170902bd87b02900eee0aecf0amr54243642pls.1.1621144646593;
        Sat, 15 May 2021 22:57:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id t1sm214144pgq.47.2021.05.15.22.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 22:57:25 -0700 (PDT)
Subject: [PATCH] docs: core-api: cachetlb: Fix up invalidate_kernel_vmap_range()
Date:   Sat, 15 May 2021 22:56:01 -0700
Message-Id: <20210516055601.2819-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     akpm@linux-foundation.org, npiggin@gmail.com,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     corbet@lwn.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

The first word of the function description ended up inside the function
prototype, likely during an ReST conversion.  I've fixed that up, the diff
looks big because I re-wrapped the whole paragraph.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 Documentation/core-api/cachetlb.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/cachetlb.rst b/Documentation/core-api/cachetlb.rst
index fe4290e26729..548ae069ed9e 100644
--- a/Documentation/core-api/cachetlb.rst
+++ b/Documentation/core-api/cachetlb.rst
@@ -396,10 +396,10 @@ I/O and invalidating it after the I/O returns.
        Note that this API does *not* also flush the offset map alias
        of the area.
 
-  ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``
+  ``void invalidate_kernel_vmap_range(void *vaddr, int size)``
 
-       the cache for a given virtual address range in the vmap area
-       which prevents the processor from making the cache stale by
-       speculatively reading data while the I/O was occurring to the
-       physical pages.  This is only necessary for data reads into the
-       vmap area.
+       invalidates the cache for a given virtual address range in the
+       vmap area which prevents the processor from making the cache
+       stale by speculatively reading data while the I/O was occurring
+       to the physical pages.  This is only necessary for data reads
+       into the vmap area.
-- 
2.20.1

