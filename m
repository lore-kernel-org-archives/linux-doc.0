Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A15ECAAA1
	for <linux-doc@archiver.kernel.org>; Thu, 15 Sep 2022 13:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiIONzP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Sep 2022 09:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbiIONzL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Sep 2022 09:55:11 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B8D75CEA;
        Thu, 15 Sep 2022 06:55:06 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id bu5-20020a17090aee4500b00202e9ca2182so6138282pjb.0;
        Thu, 15 Sep 2022 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=802EE8b0tWunnFvrIrTZomGLEzcUMvVq0pVtJ083o2A=;
        b=UiAq14Fx+VCy0j6PY6yZJB6LOnXJ7cflioObUfVk2py6w+gRFXkt8QfrpQ85fll6JP
         7KyqMvF3OIlT/o0hFV76gNN8h9DCLLhGXPkLTa7N8TApqwFhjV3Dx/pi4BhPjE0VZovX
         08wjXGvgZfcUEI12dRKKlvBxw/GvDxDtxgG5SiuRGbwUyqbBM8LAqSgibhro4tsuSsnD
         nPwJbWpxE0stMH3Rj0SrYGQFiDeczUFL167OHS4m8I0evKknzz1V92Buorv9lufdbEcL
         RhjhVnXcRhLRlYB1sVSk7HZ+2zOJaQBdry3+qXlYW/pbi5gmvPJZYXvZ7H8ktVCxKUWe
         qDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=802EE8b0tWunnFvrIrTZomGLEzcUMvVq0pVtJ083o2A=;
        b=syUCk9ktdq12yLo6m4w8xJwTrvhgPDOZ0so9VBbRUe9tKmibmulUsj5HgNTJJfALyp
         w9NO4XS4kUGFkngMWEUDOI+kDYFCk1K/0+R/YZeyWpU257WMkzbNAYJZpfANf3oLpvU+
         7mhV7KdyQynyukwNIEc0nDO7+3Cljr/h4Afd43aCX2fQUyVPVjuGfkhVp+NrBPPWYpK8
         3bvp+f2MEvThQ720GxDG77CDSaDyFQTx6PYNaB0UD/Re7MKWfPZZVtejC2DNJpR/qy3t
         1ZEjoy3EEtLTYN0nJZajNhQFL/wycyRYU3m/tOebOpBicHYWCcrTfj6OHVioxtpkTVij
         qeXw==
X-Gm-Message-State: ACrzQf1mBy5KnZkF8VXBu3XCd8Y7jxP1pGPUDsnNSZGhWzfvdEO6vRVD
        W2hVFWC7DNjqdK68ndCs3gI=
X-Google-Smtp-Source: AMsMyM48PqUWoBSHcNNEz0mrn0F+N05YROMD48ELS8O3XjUAmUen2vKgcr5CbLRzuRizN0wKXpxL3Q==
X-Received: by 2002:a17:90a:d150:b0:1fd:9336:5db3 with SMTP id t16-20020a17090ad15000b001fd93365db3mr21777pjw.242.1663250105769;
        Thu, 15 Sep 2022 06:55:05 -0700 (PDT)
Received: from localhost.localdomain ([182.160.5.243])
        by smtp.gmail.com with ESMTPSA id i6-20020a628706000000b00537d60286c9sm12452324pfe.113.2022.09.15.06.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 06:55:05 -0700 (PDT)
From:   Tuo Cao <91tuocao@gmail.com>
To:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        91tuocao@gmail.com
Subject: [PATCH v2] docs: x86: replace do_IRQ int the entry_64.rst with common_interrupt
Date:   Thu, 15 Sep 2022 21:54:52 +0800
Message-Id: <20220915135452.7901-1-91tuocao@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

do_IRQ has been replaced by common_interrupt in commit
fa5e5c409213 ("x86/entry: Use idtentry for interrupts").

Signed-off-by: Tuo Cao <91tuocao@gmail.com>
---
 Documentation/x86/entry_64.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/x86/entry_64.rst b/Documentation/x86/entry_64.rst
index e433e08f7018..4f12152570e7 100644
--- a/Documentation/x86/entry_64.rst
+++ b/Documentation/x86/entry_64.rst
@@ -33,8 +33,8 @@ Some of these entries are:
  - interrupt: An array of entries.  Every IDT vector that doesn't
    explicitly point somewhere else gets set to the corresponding
    value in interrupts.  These point to a whole array of
-   magically-generated functions that make their way to do_IRQ with
-   the interrupt number as a parameter.
+   magically-generated functions that make their way to common_interrupt
+   with the interrupt number as a parameter.
 
  - APIC interrupts: Various special-purpose interrupts for things
    like TLB shootdown.
-- 
2.17.1

