Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F65CE7A81
	for <linux-doc@archiver.kernel.org>; Mon, 25 Sep 2023 03:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbjIYD6p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Sep 2023 23:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbjIYD61 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Sep 2023 23:58:27 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F271101
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 20:57:59 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6c0b727c1caso3842660a34.0
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 20:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695614279; x=1696219079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhsUxrKihKzaZBkbG2I3+KMiT6cOrZp7m1AFdT6cq6c=;
        b=ZPQmF96qpQll08vJTACYLiEM7GLH8jK+X1xhokrCi95QzjiE8lgpr5xme4gHjh2eTs
         J8L/qGV9laUgwmXS3fCTv7RttW//NZCB/ScJi771r7ZaV7pUxIfZ6f9bb5XfAeWNVDSx
         f7YuSyHvdjQ0PIgNW6V6Q/DYKaor7cxcafFoNUccBBnMgJhcM725BGWvxxwRCkrB/nVd
         9ERQqSBYw0r6PXU/fAWuGzSN7zEORZ5qVI4Islu1tS/3cb0e2KpJ/S6FYa4IWprwIZU8
         IOQ2fErQgHZlNBUgCja0V+z8sl/fAv6Q59w5pILdTZsOYMyhVNLJzS9ux1vFX/gZ54NX
         rFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695614279; x=1696219079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KhsUxrKihKzaZBkbG2I3+KMiT6cOrZp7m1AFdT6cq6c=;
        b=ryFxg7Prmfbab2hmQeIJO99YS/PHXA2y0nFSORleOVPwppesfq32K4EmK5X2pyVwM0
         z6T8ycf9xp9rnKY6SLcArXCMOWDnMPF7OKGJSN8+sanEg77twu6jX6ajtFHN3lSdEs/s
         VOuwo9Uoqz00WQYjESDx0ig5xs6+chOYoAGySmoEd2fwm635KSHCrzoXhGgqqS9Fztlw
         uy7/YEYPWJ7ItT2wJUOHmjBQrE2FcOtkx1aHo21G0b+BvQ7AdIIZl2HdgwKDztx85qAi
         3bXF+zCtXZXno5O8CCnpz1yR40z9vWK0KcuTn9BAI4uda+++Q2JyXWveq+ooUNwpx9pD
         USgg==
X-Gm-Message-State: AOJu0YwH7qbeYHpelR78pl/4fzF9Jn3VOjrrS4Ur30o1oRiYUSm+e7j3
        nMD0asErLBj5rE55THHhVcUBdA==
X-Google-Smtp-Source: AGHT+IG8xnTwlDvRtAL4fQiYcDiBP4rCNQWClFYM4caq3KQYqXYKOXAxVngsN9hzhjRjKjwKQB0C3A==
X-Received: by 2002:a05:6830:2012:b0:6b9:c4b1:7a86 with SMTP id e18-20020a056830201200b006b9c4b17a86mr6335137otp.3.1695614278969;
        Sun, 24 Sep 2023 20:57:58 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id fm1-20020a056a002f8100b00679a4b56e41sm7025387pfb.43.2023.09.24.20.57.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 24 Sep 2023 20:57:58 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, mjguzik@gmail.com,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        peterz@infradead.org, oliver.sang@intel.com
Cc:     zhangpeng.00@bytedance.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 2/9] maple_tree: Introduce {mtree,mas}_lock_nested()
Date:   Mon, 25 Sep 2023 11:56:10 +0800
Message-Id: <20230925035617.84767-3-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20230925035617.84767-1-zhangpeng.00@bytedance.com>
References: <20230925035617.84767-1-zhangpeng.00@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In some cases, nested locks may be needed, so {mtree,mas}_lock_nested is
introduced. For example, when duplicating maple tree, we need to hold
the locks of two trees, in which case nested locks are needed.

At the same time, add the definition of spin_lock_nested() in tools for
testing.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 include/linux/maple_tree.h     | 4 ++++
 tools/include/linux/spinlock.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index e41c70ac7744..666a3764ed89 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -256,6 +256,8 @@ struct maple_tree {
 	struct maple_tree name = MTREE_INIT(name, 0)
 
 #define mtree_lock(mt)		spin_lock((&(mt)->ma_lock))
+#define mtree_lock_nested(mas, subclass) \
+		spin_lock_nested((&(mt)->ma_lock), subclass)
 #define mtree_unlock(mt)	spin_unlock((&(mt)->ma_lock))
 
 /*
@@ -406,6 +408,8 @@ struct ma_wr_state {
 };
 
 #define mas_lock(mas)           spin_lock(&((mas)->tree->ma_lock))
+#define mas_lock_nested(mas, subclass) \
+		spin_lock_nested(&((mas)->tree->ma_lock), subclass)
 #define mas_unlock(mas)         spin_unlock(&((mas)->tree->ma_lock))
 
 
diff --git a/tools/include/linux/spinlock.h b/tools/include/linux/spinlock.h
index 622266b197d0..a6cdf25b6b9d 100644
--- a/tools/include/linux/spinlock.h
+++ b/tools/include/linux/spinlock.h
@@ -11,6 +11,7 @@
 #define spin_lock_init(x)	pthread_mutex_init(x, NULL)
 
 #define spin_lock(x)			pthread_mutex_lock(x)
+#define spin_lock_nested(x, subclass)	pthread_mutex_lock(x)
 #define spin_unlock(x)			pthread_mutex_unlock(x)
 #define spin_lock_bh(x)			pthread_mutex_lock(x)
 #define spin_unlock_bh(x)		pthread_mutex_unlock(x)
-- 
2.20.1

