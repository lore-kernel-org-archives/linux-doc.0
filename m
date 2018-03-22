Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 30A0D7D0F4
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Mar 2018 05:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752242AbeCVFXs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 01:23:48 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:34761 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752042AbeCVFXr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Mar 2018 01:23:47 -0400
Received: by mail-pl0-f66.google.com with SMTP id u11-v6so4645665plq.1;
        Wed, 21 Mar 2018 22:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=slte1YSMmLpG3tDvoGF8P74n1GTvzOYOZyhLRd5vJYk=;
        b=QpljvzuETu56yBlSG7MSwvsYwzTFa7SJfpw36sEfl1XbuCzI0TB0sRtNXzhIWXpyF+
         YVpziyYunQAqR8i9o2obsVJdeeIqC7H3JT/QHww8gzX3ZPXnsSbTa05dNtt33+wQ4GJ+
         eRek+IvlvXseqsysN8CPH88IbUzNBzbtl6Bt0kRu2TEvVeg4T3SASB8NivmGqZ29SwNd
         JXJd7AC9C7v6ABB9rjw1OFtRHSV+dYhcrn2gp15rSIrGD1g//MEkbDB+aHsPJwLVgK2+
         X2BAtst+7fjTtR4GZEN0WhPTM5NkZ1VJtCWIT35lnIYU+2uyiSWlt92Aks9/u+QvcC9C
         1xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=slte1YSMmLpG3tDvoGF8P74n1GTvzOYOZyhLRd5vJYk=;
        b=F1NP4x0ADGhHWzedklqac2cc4O5p5egVll+pLoLJQnodnXdRluIIVUthzsqyW9NTz+
         LOnr4CkwARPsK2yXQU0v3iHDMoMPgvzZJ0oUZPM4KQ+XC/em8Xx3zElT9KXaL74PGlrT
         a+jH7HMEQasrA7n4J3oK2D5d4fkrYgi51El0urAbg/3ffw7e8K3GrqCg9PBZsxa9HFS6
         cTcY2NWw9BG5GYfUPTJ29N5Og1kXvnkxiSRkCojQX6kjyTuX5lTELcKsaUJJZViZWpID
         51/63R4xrGJC6MG+arRoOxPQsdFTfb7jM5sS4BHLv/2x24ZO/o6R50/4T9MwSuofqCTg
         KujA==
X-Gm-Message-State: AElRT7H9xb8NhB3rXVOLRsRe7KC+jWlgpdLI/HNj4mLv09uU3z00Zcuz
        xhDdJ5SORKCbBRBgmh8R7hZ7IScB
X-Google-Smtp-Source: AG47ELsUgIPYt/PDcvTDx/od040rVUnL7QVmYEXSsBXdP8jylwjppZpkXfPhYrGedcXKxb9ak1gW1Q==
X-Received: by 2002:a17:902:7081:: with SMTP id z1-v6mr18249336plk.333.1521696226822;
        Wed, 21 Mar 2018 22:23:46 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
        by smtp.gmail.com with ESMTPSA id q9sm926168pgs.89.2018.03.21.22.23.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Mar 2018 22:23:46 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation); Thu, 22 Mar 2018 15:53:39 +1030
From:   Joel Stanley <joel@jms.id.au>
To:     Jonathan Corbet <corbet@lwn.net>, "Tobin C . Harding" <me@tobin.cc>
Cc:     Michael Ellerman <mpe@ellerman.id.au>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: Mention why %p prints ptrval
Date:   Thu, 22 Mar 2018 15:53:36 +1030
Message-Id: <20180322052336.1001-1-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When debugging recent kernels, people will see '(ptrval)' but there
isn't much information as to what that means. Briefly describe why it's
there.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/core-api/printk-formats.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 934559b3c130..eb30efdd2e78 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -60,8 +60,8 @@ Plain Pointers
 Pointers printed without a specifier extension (i.e unadorned %p) are
 hashed to prevent leaking information about the kernel memory layout. This
 has the added benefit of providing a unique identifier. On 64-bit machines
-the first 32 bits are zeroed. If you *really* want the address see %px
-below.
+the first 32 bits are zeroed. The kernel will print ``(ptrval)`` until it
+gathers enough entropy. If you *really* want the address see %px below.
 
 Symbols/Function Pointers
 -------------------------
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
