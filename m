Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020AFC56204
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 12:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8747222461
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603282658;
	bh=SLlCxYtnKWjDjR6xkI87fNMGzcB0tiqNJ9pWSUh4OoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=V0wE17GMJshBDlUyKvQk8uunkDNeXIxf8rlsoiLAX17/9yQAGH8Q1o9CBTEHzXTMS
	 oNfz9s8aEdSU2VdxEHTDailT+WPKyEhIP11u+nxWOhAIqmsj7UdPPNvcdcEt+Xz8eR
	 zeeTs1f4xHXxe0GbHeLMkWVNI0n9kDIbx4EUB+Gc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442273AbgJUMRd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 08:17:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:59170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411516AbgJUMRc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Oct 2020 08:17:32 -0400
Received: from mail.kernel.org (ip5f5ad5a8.dynamic.kabel-deutschland.de [95.90.213.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D168B2227F;
        Wed, 21 Oct 2020 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603282651;
        bh=SLlCxYtnKWjDjR6xkI87fNMGzcB0tiqNJ9pWSUh4OoY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H6DgaaeCq7XZZJNbbFM/7YZszzky1S9JZXuCZbLPTiPpKLgXccoHJcbdom5j7dPdm
         4mw4Z1bTNr4xeBdnzGUeOm7fignhN76QMiUEj5Ae8lexmXgMSuR0CONlbVA/3uzaBx
         /wT5/xkhdKsVjmOh6+JdjOtrTQgo/na3+uItMkuc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kVD3Y-001U2d-Cr; Wed, 21 Oct 2020 14:17:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] locking/refcount: move kernel-doc markups to the proper place
Date:   Wed, 21 Oct 2020 14:17:24 +0200
Message-Id: <02de37b2f6124ef4aa9b0a17723e97de4625249b.1603282193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603282193.git.mchehab+huawei@kernel.org>
References: <cover.1603282193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset a435b9a14356 ("locking/refcount: Provide __refcount API to obtain the old value")
added a set of functions starting with __ that have a new
parameter, adding a series of new warnings:

	$ ./scripts/kernel-doc -none include/linux/refcount.h
	include/linux/refcount.h:169: warning: Function parameter or member 'oldp' not described in '__refcount_add_not_zero'
	include/linux/refcount.h:208: warning: Function parameter or member 'oldp' not described in '__refcount_add'
	include/linux/refcount.h:239: warning: Function parameter or member 'oldp' not described in '__refcount_inc_not_zero'
	include/linux/refcount.h:261: warning: Function parameter or member 'oldp' not described in '__refcount_inc'
	include/linux/refcount.h:291: warning: Function parameter or member 'oldp' not described in '__refcount_sub_and_test'
	include/linux/refcount.h:327: warning: Function parameter or member 'oldp' not described in '__refcount_dec_and_test'
	include/linux/refcount.h:347: warning: Function parameter or member 'oldp' not described in '__refcount_dec'

The issue is that the kernel-doc markups are now misplaced,
as they should be added just before the functions.

So, move the kernel-doc markups to the proper places,
in order to drop the warnings.

It should be noticed that git show produces a crappy output,
for this patch without "--patience" flag.

Fixes: a435b9a14356 ("locking/refcount: Provide __refcount API to obtain the old value")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/refcount.h | 158 +++++++++++++++++++--------------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 7fabb1af18e0..497990c69b0b 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -147,24 +147,6 @@ static inline unsigned int refcount_read(const refcount_t *r)
 	return atomic_read(&r->refs);
 }
 
-/**
- * refcount_add_not_zero - add a value to a refcount unless it is 0
- * @i: the value to add to the refcount
- * @r: the refcount
- *
- * Will saturate at REFCOUNT_SATURATED and WARN.
- *
- * Provides no memory ordering, it is assumed the caller has guaranteed the
- * object memory to be stable (RCU, etc.). It does provide a control dependency
- * and thereby orders future stores. See the comment on top.
- *
- * Use of this function is not recommended for the normal reference counting
- * use case in which references are taken and released one at a time.  In these
- * cases, refcount_inc(), or one of its variants, should instead be used to
- * increment a reference count.
- *
- * Return: false if the passed refcount is 0, true otherwise
- */
 static inline __must_check bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
 {
 	int old = refcount_read(r);
@@ -183,27 +165,29 @@ static inline __must_check bool __refcount_add_not_zero(int i, refcount_t *r, in
 	return old;
 }
 
+/**
+ * refcount_add_not_zero - add a value to a refcount unless it is 0
+ * @i: the value to add to the refcount
+ * @r: the refcount
+ *
+ * Will saturate at REFCOUNT_SATURATED and WARN.
+ *
+ * Provides no memory ordering, it is assumed the caller has guaranteed the
+ * object memory to be stable (RCU, etc.). It does provide a control dependency
+ * and thereby orders future stores. See the comment on top.
+ *
+ * Use of this function is not recommended for the normal reference counting
+ * use case in which references are taken and released one at a time.  In these
+ * cases, refcount_inc(), or one of its variants, should instead be used to
+ * increment a reference count.
+ *
+ * Return: false if the passed refcount is 0, true otherwise
+ */
 static inline __must_check bool refcount_add_not_zero(int i, refcount_t *r)
 {
 	return __refcount_add_not_zero(i, r, NULL);
 }
 
-/**
- * refcount_add - add a value to a refcount
- * @i: the value to add to the refcount
- * @r: the refcount
- *
- * Similar to atomic_add(), but will saturate at REFCOUNT_SATURATED and WARN.
- *
- * Provides no memory ordering, it is assumed the caller has guaranteed the
- * object memory to be stable (RCU, etc.). It does provide a control dependency
- * and thereby orders future stores. See the comment on top.
- *
- * Use of this function is not recommended for the normal reference counting
- * use case in which references are taken and released one at a time.  In these
- * cases, refcount_inc(), or one of its variants, should instead be used to
- * increment a reference count.
- */
 static inline void __refcount_add(int i, refcount_t *r, int *oldp)
 {
 	int old = atomic_fetch_add_relaxed(i, &r->refs);
@@ -217,11 +201,32 @@ static inline void __refcount_add(int i, refcount_t *r, int *oldp)
 		refcount_warn_saturate(r, REFCOUNT_ADD_OVF);
 }
 
+/**
+ * refcount_add - add a value to a refcount
+ * @i: the value to add to the refcount
+ * @r: the refcount
+ *
+ * Similar to atomic_add(), but will saturate at REFCOUNT_SATURATED and WARN.
+ *
+ * Provides no memory ordering, it is assumed the caller has guaranteed the
+ * object memory to be stable (RCU, etc.). It does provide a control dependency
+ * and thereby orders future stores. See the comment on top.
+ *
+ * Use of this function is not recommended for the normal reference counting
+ * use case in which references are taken and released one at a time.  In these
+ * cases, refcount_inc(), or one of its variants, should instead be used to
+ * increment a reference count.
+ */
 static inline void refcount_add(int i, refcount_t *r)
 {
 	__refcount_add(i, r, NULL);
 }
 
+static inline __must_check bool __refcount_inc_not_zero(refcount_t *r, int *oldp)
+{
+	return __refcount_add_not_zero(1, r, oldp);
+}
+
 /**
  * refcount_inc_not_zero - increment a refcount unless it is 0
  * @r: the refcount to increment
@@ -235,16 +240,16 @@ static inline void refcount_add(int i, refcount_t *r)
  *
  * Return: true if the increment was successful, false otherwise
  */
-static inline __must_check bool __refcount_inc_not_zero(refcount_t *r, int *oldp)
-{
-	return __refcount_add_not_zero(1, r, oldp);
-}
-
 static inline __must_check bool refcount_inc_not_zero(refcount_t *r)
 {
 	return __refcount_inc_not_zero(r, NULL);
 }
 
+static inline void __refcount_inc(refcount_t *r, int *oldp)
+{
+	__refcount_add(1, r, oldp);
+}
+
 /**
  * refcount_inc - increment a refcount
  * @r: the refcount to increment
@@ -257,36 +262,11 @@ static inline __must_check bool refcount_inc_not_zero(refcount_t *r)
  * Will WARN if the refcount is 0, as this represents a possible use-after-free
  * condition.
  */
-static inline void __refcount_inc(refcount_t *r, int *oldp)
-{
-	__refcount_add(1, r, oldp);
-}
-
 static inline void refcount_inc(refcount_t *r)
 {
 	__refcount_inc(r, NULL);
 }
 
-/**
- * refcount_sub_and_test - subtract from a refcount and test if it is 0
- * @i: amount to subtract from the refcount
- * @r: the refcount
- *
- * Similar to atomic_dec_and_test(), but it will WARN, return false and
- * ultimately leak on underflow and will fail to decrement when saturated
- * at REFCOUNT_SATURATED.
- *
- * Provides release memory ordering, such that prior loads and stores are done
- * before, and provides an acquire ordering on success such that free()
- * must come after.
- *
- * Use of this function is not recommended for the normal reference counting
- * use case in which references are taken and released one at a time.  In these
- * cases, refcount_dec(), or one of its variants, should instead be used to
- * decrement a reference count.
- *
- * Return: true if the resulting refcount is 0, false otherwise
- */
 static inline __must_check bool __refcount_sub_and_test(int i, refcount_t *r, int *oldp)
 {
 	int old = atomic_fetch_sub_release(i, &r->refs);
@@ -305,11 +285,36 @@ static inline __must_check bool __refcount_sub_and_test(int i, refcount_t *r, in
 	return false;
 }
 
+/**
+ * refcount_sub_and_test - subtract from a refcount and test if it is 0
+ * @i: amount to subtract from the refcount
+ * @r: the refcount
+ *
+ * Similar to atomic_dec_and_test(), but it will WARN, return false and
+ * ultimately leak on underflow and will fail to decrement when saturated
+ * at REFCOUNT_SATURATED.
+ *
+ * Provides release memory ordering, such that prior loads and stores are done
+ * before, and provides an acquire ordering on success such that free()
+ * must come after.
+ *
+ * Use of this function is not recommended for the normal reference counting
+ * use case in which references are taken and released one at a time.  In these
+ * cases, refcount_dec(), or one of its variants, should instead be used to
+ * decrement a reference count.
+ *
+ * Return: true if the resulting refcount is 0, false otherwise
+ */
 static inline __must_check bool refcount_sub_and_test(int i, refcount_t *r)
 {
 	return __refcount_sub_and_test(i, r, NULL);
 }
 
+static inline __must_check bool __refcount_dec_and_test(refcount_t *r, int *oldp)
+{
+	return __refcount_sub_and_test(1, r, oldp);
+}
+
 /**
  * refcount_dec_and_test - decrement a refcount and test if it is 0
  * @r: the refcount
@@ -323,26 +328,11 @@ static inline __must_check bool refcount_sub_and_test(int i, refcount_t *r)
  *
  * Return: true if the resulting refcount is 0, false otherwise
  */
-static inline __must_check bool __refcount_dec_and_test(refcount_t *r, int *oldp)
-{
-	return __refcount_sub_and_test(1, r, oldp);
-}
-
 static inline __must_check bool refcount_dec_and_test(refcount_t *r)
 {
 	return __refcount_dec_and_test(r, NULL);
 }
 
-/**
- * refcount_dec - decrement a refcount
- * @r: the refcount
- *
- * Similar to atomic_dec(), it will WARN on underflow and fail to decrement
- * when saturated at REFCOUNT_SATURATED.
- *
- * Provides release memory ordering, such that prior loads and stores are done
- * before.
- */
 static inline void __refcount_dec(refcount_t *r, int *oldp)
 {
 	int old = atomic_fetch_sub_release(1, &r->refs);
@@ -354,6 +344,16 @@ static inline void __refcount_dec(refcount_t *r, int *oldp)
 		refcount_warn_saturate(r, REFCOUNT_DEC_LEAK);
 }
 
+/**
+ * refcount_dec - decrement a refcount
+ * @r: the refcount
+ *
+ * Similar to atomic_dec(), it will WARN on underflow and fail to decrement
+ * when saturated at REFCOUNT_SATURATED.
+ *
+ * Provides release memory ordering, such that prior loads and stores are done
+ * before.
+ */
 static inline void refcount_dec(refcount_t *r)
 {
 	__refcount_dec(r, NULL);
-- 
2.26.2

