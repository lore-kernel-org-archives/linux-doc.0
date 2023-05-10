Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E496CC77B7D
	for <linux-doc@archiver.kernel.org>; Wed, 10 May 2023 18:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236490AbjEJSTK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 May 2023 14:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236175AbjEJSSV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 May 2023 14:18:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0AE8691;
        Wed, 10 May 2023 11:18:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B804263F8C;
        Wed, 10 May 2023 18:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BE4C433A1;
        Wed, 10 May 2023 18:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683742644;
        bh=8scz+UOnvZTcnS7Ykx6CtnedJmiFq1UdjUUnARLlRyc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ikm2NLQzY332FjMNQM5/hRKYkRj1qvK9ycCfMuNvYarVrdkH7vu9gGrRyZzmY39W3
         csCAizD3aExQlgib+ooni6h+XqWhfDENU0i4TX4ordvGKdI+LcmEEmHi8WcSw8BxeU
         KCyFlSqhuxoaEYD/zv9ggp7VUAMRCS+MtSMsNarZSe2eBE55lvF/rDi4EUSutdhjBm
         jod4i728JsV3IwNVAEZs9audTUe7WRlVUaj7DoqsgEGleeLf8InmphipjzJVtwiDIt
         xv9Xx2nhOLMQXNVBdpZp2G7CfiHA/p6V6B7sIhiJZV3jVWWOQssXQFBWqxj66ArXCb
         zU/CeO0M/1dTA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id E2BB4CE1BC1; Wed, 10 May 2023 11:17:18 -0700 (PDT)
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     x86@kernel.org, akiyks@gmail.com, linux-doc@vger.kernel.org,
        kernel-team@meta.com, "Paul E. McKenney" <paulmck@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH locking/atomic 08/19] locking/atomic: Add kernel-doc header for arch_${atomic}_dec_if_positive
Date:   Wed, 10 May 2023 11:17:06 -0700
Message-Id: <20230510181717.2200934-8-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <19135936-06d7-4705-8bc8-bb31c2a478ca@paulmck-laptop>
References: <19135936-06d7-4705-8bc8-bb31c2a478ca@paulmck-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add kernel-doc header template for arch_${atomic}_dec_if_positive
function family.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 include/linux/atomic/atomic-arch-fallback.h | 22 ++++++++++++++++++++-
 scripts/atomic/fallbacks/dec_if_positive    | 10 ++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
index ed72d94346e9..4d4d94925cb0 100644
--- a/include/linux/atomic/atomic-arch-fallback.h
+++ b/include/linux/atomic/atomic-arch-fallback.h
@@ -1641,6 +1641,16 @@ arch_atomic_dec_unless_positive(atomic_t *v)
 #endif
 
 #ifndef arch_atomic_dec_if_positive
+/**
+ * arch_atomic_dec_if_positive - Atomic decrement if old value is positive
+ * @v: pointer of type atomic_t
+ *
+ * Atomically decrement @v, but only if the original value is greater than zero,
+ * returning new value.  Note that the desired new value will be returned
+ * even if the decrement did not occur, so that if the old value is -3, then
+ * there @v will not be decremented, but -4 will be returned.  As a result,
+ * if the return value is non-negative, then the value was in fact decremented.
+ */
 static __always_inline int
 arch_atomic_dec_if_positive(atomic_t *v)
 {
@@ -3063,6 +3073,16 @@ arch_atomic64_dec_unless_positive(atomic64_t *v)
 #endif
 
 #ifndef arch_atomic64_dec_if_positive
+/**
+ * arch_atomic64_dec_if_positive - Atomic decrement if old value is positive
+ * @v: pointer of type atomic64_t
+ *
+ * Atomically decrement @v, but only if the original value is greater than zero,
+ * returning new value.  Note that the desired new value will be returned
+ * even if the decrement did not occur, so that if the old value is -3, then
+ * there @v will not be decremented, but -4 will be returned.  As a result,
+ * if the return value is non-negative, then the value was in fact decremented.
+ */
 static __always_inline s64
 arch_atomic64_dec_if_positive(atomic64_t *v)
 {
@@ -3080,4 +3100,4 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
 #endif
 
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// 3b29d5595f48f921507f19bc794c91aecb782ad3
+// c7041896e7e66a52d8005ba021f3b3b05f99bcb3
diff --git a/scripts/atomic/fallbacks/dec_if_positive b/scripts/atomic/fallbacks/dec_if_positive
index 86bdced3428d..dedbdbc1487d 100755
--- a/scripts/atomic/fallbacks/dec_if_positive
+++ b/scripts/atomic/fallbacks/dec_if_positive
@@ -1,4 +1,14 @@
 cat <<EOF
+/**
+ * arch_${atomic}_dec_if_positive - Atomic decrement if old value is positive
+ * @v: pointer of type ${atomic}_t
+ *
+ * Atomically decrement @v, but only if the original value is greater than zero,
+ * returning new value.  Note that the desired new value will be returned
+ * even if the decrement did not occur, so that if the old value is -3, then
+ * there @v will not be decremented, but -4 will be returned.  As a result,
+ * if the return value is non-negative, then the value was in fact decremented.
+ */
 static __always_inline ${ret}
 arch_${atomic}_dec_if_positive(${atomic}_t *v)
 {
-- 
2.40.1

