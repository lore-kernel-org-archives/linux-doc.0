Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F041CE7A95
	for <linux-doc@archiver.kernel.org>; Mon, 25 Sep 2023 03:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjIYD6q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Sep 2023 23:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbjIYD62 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Sep 2023 23:58:28 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4046F10F
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 20:58:20 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7740cd2e404so355874085a.2
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 20:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695614300; x=1696219100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hww7oOWxGKb7qmsb0mmM2P/enCFKvkDkB3bMeqs1n3g=;
        b=RRArD+lq7BAqvn+uNyaKKRU/d7BtdrC2ePuy6kCotmdPQirRoJkgG7oR+E9Y3wf2J/
         oRPJK3BsKoN6SBn/k45+yWcoqfLgeM9NU906qIli0i5PvUp4pdzWjG7Gv5cSXLoKpGa+
         UxOYVavUcrag2xB434jAOsZz/js39Xk/6dBWE0SkBylMjMsAYChYR8XbZEdxCG56MXn4
         1+Ne3+C6M10pZCMmDdK5NMIizrHXkAMICm7EJjfMmTjci4vUVRRic9nasg1MKIin7hK4
         N/GngCG870M5cItWkLwyuB3yFcowXnr0+evOV3w0Q4sJd9NWfGfqDF0tiuxsnUyGDQdd
         B0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695614300; x=1696219100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hww7oOWxGKb7qmsb0mmM2P/enCFKvkDkB3bMeqs1n3g=;
        b=tN7go0/ptf+SkvHomCwy5Q6OxpYtDML8B2RESLHgzW84efsuTiwETzobBRgUrExFNA
         4vVAA1wkRB65TGh6AGgHSeh/K0m3RlL9heAoY4/ulMnDFeyEjfdNgicSd/+b8vR9q/fp
         v0uReC76JJMy9UD3xwr/G9ohme65//M6t9ivAEU9CQ5XpHNH3bIB0dhFXK/qkOhgtn9m
         VjLgg7axywo+o2DPbQylIfOUzgFat3VU4SY4PUTW2S9bIBHKsJU7OF98F474CN3I0Yh9
         heDPZQNrPQE5EA8op1uvZBVY414+bAPxGhqcV86VQH3sCP0CocD8MIJIf3B6eFLIa6jV
         Ni9w==
X-Gm-Message-State: AOJu0YzYfF6gnAcizOJSKCtjDu4AzfOl2qE2+N8PB0GpsmP9x1YXMd7h
        EkRkHwWSntX9K5akSNsJqkZE0A==
X-Google-Smtp-Source: AGHT+IF83HXgYz6hKs16v3Oy5RBkvjlke2ZYjx8DNaVcWabWxUJCzfLznLiorxxWRtU2DFZTy6RRoQ==
X-Received: by 2002:a05:620a:1987:b0:774:2c35:3796 with SMTP id bm7-20020a05620a198700b007742c353796mr3484182qkb.34.1695614300078;
        Sun, 24 Sep 2023 20:58:20 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id fm1-20020a056a002f8100b00679a4b56e41sm7025387pfb.43.2023.09.24.20.58.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 24 Sep 2023 20:58:19 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, mjguzik@gmail.com,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        peterz@infradead.org, oliver.sang@intel.com
Cc:     zhangpeng.00@bytedance.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 5/9] maple_tree: Update the documentation of maple tree
Date:   Mon, 25 Sep 2023 11:56:13 +0800
Message-Id: <20230925035617.84767-6-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20230925035617.84767-1-zhangpeng.00@bytedance.com>
References: <20230925035617.84767-1-zhangpeng.00@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introduce the new interface mtree_dup() in the documentation.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 Documentation/core-api/maple_tree.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index 45defcf15da7..3d8a1edf6d04 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -81,6 +81,9 @@ section.
 Sometimes it is necessary to ensure the next call to store to a maple tree does
 not allocate memory, please see :ref:`maple-tree-advanced-api` for this use case.
 
+You can use mtree_dup() to duplicate an identical tree. It is a more efficient
+way than inserting all elements one by one into a new tree.
+
 Finally, you can remove all entries from a maple tree by calling
 mtree_destroy().  If the maple tree entries are pointers, you may wish to free
 the entries first.
@@ -112,6 +115,7 @@ Takes ma_lock internally:
  * mtree_insert()
  * mtree_insert_range()
  * mtree_erase()
+ * mtree_dup()
  * mtree_destroy()
  * mt_set_in_rcu()
  * mt_clear_in_rcu()
-- 
2.20.1

