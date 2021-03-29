Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDD9C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 05:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41ACC6195D
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 05:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhC2FQJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 01:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhC2FPp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 01:15:45 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D727C061574;
        Sun, 28 Mar 2021 22:15:45 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id y18so11342585qky.11;
        Sun, 28 Mar 2021 22:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aoCU4oLGOopn6WhMcRujqdex6N6H9eXVcb2AvHeT0YY=;
        b=YrwPBT7TAQct83IC//8yv9Zr+2Qq47AdchreZJxo9i8GyFgy1aL7sdv7vDiVtxvjy+
         4vvkSXNHZVWdcJ5hsF3f56gk6fljPczknFGlbyN2WyPl7sLkMCbEfPCQR5JnqxH/H2Fk
         bW/D22uIFK98GEj1Mpz7ISZ8kXrxnnMRYAWyPRB8VSi2ZpSsjnCJnpYJWVzVY6wDXlWF
         bt+JiE7ScxJW1bsHv8QMEqXNGszbagveEucIRZUnD/YLszU/JJBpGVd8RrmjNODQlT92
         JUYN3Gb/Fwy8rRXrca/50sTIjrFmMbYQxnHyh7RixPCekTrMQU4XlDqG9rp6P/gA0Sdq
         V0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aoCU4oLGOopn6WhMcRujqdex6N6H9eXVcb2AvHeT0YY=;
        b=prgEFcqO39QkaDpm2DG/wWwf8TKAdewBt/yh2WemrjkcQgyf7J2ACn48YmrbLAunMN
         SshU99cM8zzmcF/vurAzUhvm7UwPni5ZLchLq7aVYunMiH6oH1ws9AtfhPlvdIX2cF26
         mdnze5lLw1BjDRovo0B0QWlRYbAt/EwKGXemVuZB0iRRk5P1Bzs5VaRyBjCiqK+PwO1F
         l55BTnJjRp6JOy1/uC75uYN4AERc454UlqbZ3zmHlRovWNl3zeH6UApehbHg6GPokXsF
         GVqHnSaip6zpzVosmA0lhwpybVTWqUzq2ywSQOvyY4DbwAHeXauPjMV6SWYjvSmA8/Ju
         yQgA==
X-Gm-Message-State: AOAM531vKCE0k0WpEPFrWqNs+ySQFCtqPkjmVaqhbwGHBPb1ff9ydVCk
        7OgqGpX5/WKBHw3Bxt7DLKE=
X-Google-Smtp-Source: ABdhPJyWpdcO25ILBxy4hxfH4hZP9C3A+0bdaBynQt6WboLycrNJiqw6fIRgkSSy33AYCMQx4RECBw==
X-Received: by 2002:ae9:e502:: with SMTP id w2mr24158431qkf.75.1616994944383;
        Sun, 28 Mar 2021 22:15:44 -0700 (PDT)
Received: from localhost.localdomain ([156.146.37.195])
        by smtp.gmail.com with ESMTPSA id z124sm12993181qke.36.2021.03.28.22.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 22:15:43 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, rdunlap@infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/23] vm: hwpoison.rst: A typo fix
Date:   Mon, 29 Mar 2021 10:42:42 +0530
Message-Id: <de2e08c8b6bdf278ddd678e9ffcc820115e153b0.1616992679.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616992679.git.unixbhaskar@gmail.com>
References: <cover.1616992679.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

s/expection/exception/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/vm/hwpoison.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/vm/hwpoison.rst b/Documentation/vm/hwpoison.rst
index a5c884293dac..727f080073dd 100644
--- a/Documentation/vm/hwpoison.rst
+++ b/Documentation/vm/hwpoison.rst
@@ -50,7 +50,7 @@ of applications. KVM support requires a recent qemu-kvm release.
 For the KVM use there was need for a new signal type so that
 KVM can inject the machine check into the guest with the proper
 address. This in theory allows other applications to handle
-memory failures too. The expection is that near all applications
+memory failures too. The exception is that near all applications
 won't do that, but some very specialized ones might.

 Failure recovery modes
--
2.26.3

