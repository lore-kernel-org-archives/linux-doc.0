Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30DDC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 30 Sep 2021 19:24:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D7F661A05
	for <linux-doc@archiver.kernel.org>; Thu, 30 Sep 2021 19:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhI3T0f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Sep 2021 15:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347267AbhI3T0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Sep 2021 15:26:12 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3687C06176D
        for <linux-doc@vger.kernel.org>; Thu, 30 Sep 2021 12:24:26 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w11so4726453plz.13
        for <linux-doc@vger.kernel.org>; Thu, 30 Sep 2021 12:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cCZEIJBVsAd/u/iSLABrp+vF2bwae9FauM9X0ezDyBE=;
        b=NaC/oYoIyG/sqThHT4Wqa8vqeEfAqVClj6GuK20Xd3o/gP+SozAiebqUty2iz+s+jE
         HGrOHe9vxiQKHCEQOGXPLc8kDj0y1UHdhHNVNktvfgv7rkqfGqU6Ma88r2oG0UBEcc+F
         ELw6tEOg5LNchC1HgdKwSxc/eRsvjfEVgzfBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cCZEIJBVsAd/u/iSLABrp+vF2bwae9FauM9X0ezDyBE=;
        b=m5kTM6f3CIE43b2aNEAuLU6XEZDwKF9OBRQcxEmZKQjQx1b716OnyYtYxQVxFgeoYq
         zW4C8yrdGKlNUvkSXgu45XPlQiAzym/mn9A7GI7XaQNn8WiCrKjc3olTu8nhNlJjkU6T
         ryfdXz6n3Foc9smR+sMcutMWQQaYOUjJKzvKyjMHbTnvUBe5BAGBlVsVAfQdgfVU8NXx
         UJgNnVC++RXEFvHEdiXyhKC75w7czU7JPvXcixsesyklTB3817f1uHKr4JzWkHJqbcRj
         UNyf+tAn30HUOJXO9tz9lk7DFopDH+mqgG7fYCPccF6VSwGLkd3Q72aF0r2F6PtZawhm
         fjjw==
X-Gm-Message-State: AOAM533RFyDMEDVHI/4N2GzbmyRId1rUHXlIgB1I3xAaR9RAq1JDQakJ
        y8rvy2GBldHrhymq2Q+/Obdi2jDuKl9Tpg==
X-Google-Smtp-Source: ABdhPJzDjRceSFOGLuzlRnsLu/TWlP+bgL8O97kqhpZWIVDT4meQKEGYGxJiGL+UZEEdPmTe3FnKBg==
X-Received: by 2002:a17:90b:d89:: with SMTP id bg9mr8279103pjb.165.1633029866169;
        Thu, 30 Sep 2021 12:24:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mp24sm5747751pjb.41.2021.09.30.12.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 12:24:25 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>, Joe Perches <joe@perches.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2] docs: Explain the desired position of function attributes
Date:   Thu, 30 Sep 2021 12:24:17 -0700
Message-Id: <20210930192417.1332877-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715; h=from:subject; bh=i7cG8TZa4oDAPe7ezkIu+ROsqNciX0KZdudkLtbVLC8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhVg7hksFHlNiPU1nD6lV2hHwGrTkkeNWiZNJUUuNQ JPOsHpSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVYO4QAKCRCJcvTf3G3AJjzxD/ 4mVht2431bSigny/zJ72JGuQIJabWKEreTWMo/7MNYzuBNnIhBjz4dxwWNbvjNaikJAUmJCNbUHAbB atsUlVEVQUKOep+nlaPcmzetVJ0tSjycdelzsX8DyFOsjslPJU/i3Ftljd5QI0er/J1ON5fPeCRCHh iY5bX6cp0SIqhlC+9Wx3iisek/wfg8iF5daB7J6t3zBSjHobJk00q2RFns69GObeAdrGOlvIYO+ttV jJADOqXzoFNKdbEmKbRnBQxfn1TskgwvDP46gJ2a2VfvpAUDhG+iPsVD/IA3fTdyEuE7tnZO4DAIOo pqoLCku0yFWuxI7OPY0UcXd779eProhmbth6dsGtWKN65ODwhCsYNqNkFTfzH7B7wjijdd8h4xoeGl eOt/5s7xMs3OKxbxdF9o8Q/OImVdUrxY3mIhI+6Jn+coK7JKMru7DDNexFoKtwBBHBLk46v7wiB3Pp vUjh3QZ8td0FUx99k9yT4garPsP72CNldNDDTOQkq0E42YTBP4BKhjmE7NEaQ8EAGGHMlKsVqXzWOz ktBHa8zd0ip6VqIM3I7eH6uCQ+ET5PuujSVXi0QZy0x/+QwVNGkI8scEnJFVNcIcD0LWuwbDgWRQpp O1xSkxhoxUETERtC1s2aqnEmZoTHFRnhO9EN6a4+5tD3YKhspNtwCIHkr5lg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While discussing how to format the addition of various function
attributes, some "unwritten rules" of ordering surfaced[1]. Capture as
close as possible to Linus's preferences for future reference.

(Though I note the dissent voiced by Joe Perches, Alexey Dobriyan, and
others that would prefer all attributes live on a separate leading line.)

[1] https://lore.kernel.org/mm-commits/CAHk-=wiOCLRny5aifWNhr621kYrJwhfURsa0vFPeUEm8mF0ufg@mail.gmail.com/

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/process/coding-style.rst | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 42969ab37b34..6b4feb1c71e7 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -487,6 +487,36 @@ because it is a simple way to add valuable information for the reader.
 Do not use the ``extern`` keyword with function prototypes as this makes
 lines longer and isn't strictly necessary.
 
+When writing a function declarations, please keep the `order of elements regular
+<https://lore.kernel.org/mm-commits/CAHk-=wiOCLRny5aifWNhr621kYrJwhfURsa0vFPeUEm8mF0ufg@mail.gmail.com/>`_.
+For example::
+
+ extern __init void * __must_check void action(enum magic value, size_t size,
+ 	u8 count, char *fmt, ...) __printf(4, 5) __malloc;
+
+The preferred order of elements for a function prototype is:
+
+- storage class (here, ``extern``, and things like ``static __always_inline`` even though
+  ``__always_inline`` is technically an attribute, it is treated like ``inline``)
+- storage class attributes (here, ``__init`` -- i.e. section declarations, but also things like ``__cold``)
+- return type (here, ``void *``)
+- return type attributes (here, ``__must_check``)
+- function name (here, ``action``)
+- function parameters (here, ``(enum magic value, size_t size, u8 count, char *fmt, ...)``, noting that parameter names should always be included)
+- function parameter attributes (here, ``__printf(4, 5)``)
+- function behavior attributes (here, ``__malloc``)
+
+Note that for a function definition (e.g. ``static inline``), the compiler does
+not allow function parameter attributes after the function parameters. In these
+cases, they should go after the storage class attributes (e.g. note the changed
+position of ``__printf(4, 5)``)::
+
+ static __always_inline __init __printf(4, 5) void * __must_check void action(
+ 		enum magic value, size_t size, u8 count, char *fmt, ...)
+ 		__malloc
+ {
+ 	...
+ }
 
 7) Centralized exiting of functions
 -----------------------------------
-- 
2.30.2

