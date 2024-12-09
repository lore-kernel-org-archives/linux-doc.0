Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DA84D29
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733760603; cv=none; b=P32QQthnkxDfCfXFcRrNpYIpmgl/lwug3qAPGBgRVaijIRqMkAL1jy5dYPRFrR2ZLEwp90DtmD1aoXoa+IFDIdbpoCS0RbMPL7HASYg5DFEg0vmSqtUlCCFiKu3Ueluix51rGXjPHdY8wpXqXV1QltNHOykprDTq09E1moo48KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733760603; c=relaxed/simple;
	bh=Enyrrd0VzS1Y7cktywegGn5iQaSnLAshlm/tiYkUbJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sk2na2VW1t7ARlOTKMPKHD2Xzbv+tbaXEIL9KRevkRjTvHIww0iu+B9x2iyhU0WtzUVAWt1wHv5tpr+VLddbWxibYhY1rF/3eTcRwUti9XrmPDTk4buY5DIxR+Nzh+UfTGebK9y65OPVNrEdcwyKTnNxgdrnciyfHqeaRFJLe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iCGI5T2c; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iCGI5T2c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=B2Z3OOMXxCJKWUkMY6pv9fAQaAW1uH4yMFgpK+RqsK0=; b=iCGI5T2cD5WCAFlA0seeVhQTey
	s5/l5x5+XUAc+G4JkNActOPHiVhkimIm7bmM7BrK+CDsv9sRidtumfRWa1aUGGxTWCxY2+VoUnZC/
	IX5tIsHH/KrYYcqmq49CnQ3V/BN0U6iKkM8Fc0MNfQV0QIDa6qE0AVQo19ujpWcy8GRprrLPpHEm9
	Oj00+Uv6x0dPUt3bRJ2u8o1QS2i0yvjvZCv//k8abDT4hP3LKc1B5Zh+CscTkMNADRx0x1Yj9w3+Z
	/Yuqlx9Q6AERmzfxeaXuw0kogGNuWQNG3Q0snSbWt3bnSxeRp86Hf2ktqWEeEHaagjc9+VBmHbI3X
	4piCRtFg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgKc-00000003BCk-1Ys8;
	Mon, 09 Dec 2024 16:09:58 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-doc@vger.kernel.org,
	Corey Minyard <minyard@acm.org>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] kref: Improve documentation
Date: Mon,  9 Dec 2024 16:09:44 +0000
Message-ID: <20241209160953.757673-1-willy@infradead.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is already kernel-doc written for many of the functions in kref.h
but it's not linked into the html docs anywhere.  Add it to kref.rst.

Improve the kref documentation by using the standard Return: section,
rewording some unclear verbiage and adding docs for some undocumented
functions.

Update Thomas' email address to his current one.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/core-api/kref.rst |  7 ++++-
 include/linux/kref.h            | 48 +++++++++++++++++++++++----------
 2 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/Documentation/core-api/kref.rst b/Documentation/core-api/kref.rst
index c61eea6f1bf2..8db9ff03d952 100644
--- a/Documentation/core-api/kref.rst
+++ b/Documentation/core-api/kref.rst
@@ -3,7 +3,7 @@ Adding reference counters (krefs) to kernel objects
 ===================================================
 
 :Author: Corey Minyard <minyard@acm.org>
-:Author: Thomas Hellstrom <thellstrom@vmware.com>
+:Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
 
 A lot of this was lifted from Greg Kroah-Hartman's 2004 OLS paper and
 presentation on krefs, which can be found at:
@@ -321,3 +321,8 @@ rcu grace period after release_entry_rcu was called. That can be accomplished
 by using kfree_rcu(entry, rhead) as done above, or by calling synchronize_rcu()
 before using kfree, but note that synchronize_rcu() may sleep for a
 substantial amount of time.
+
+Functions and structures
+========================
+
+.. kernel-doc:: include/linux/kref.h
diff --git a/include/linux/kref.h b/include/linux/kref.h
index d32e21a2538c..88e82ab1367c 100644
--- a/include/linux/kref.h
+++ b/include/linux/kref.h
@@ -46,18 +46,18 @@ static inline void kref_get(struct kref *kref)
 }
 
 /**
- * kref_put - decrement refcount for object.
- * @kref: object.
- * @release: pointer to the function that will clean up the object when the
+ * kref_put - Decrement refcount for object
+ * @kref: Object
+ * @release: Pointer to the function that will clean up the object when the
  *	     last reference to the object is released.
- *	     This pointer is required, and it is not acceptable to pass kfree
- *	     in as this function.
  *
- * Decrement the refcount, and if 0, call release().
- * Return 1 if the object was removed, otherwise return 0.  Beware, if this
- * function returns 0, you still can not count on the kref from remaining in
- * memory.  Only use the return value if you want to see if the kref is now
- * gone, not present.
+ * Decrement the refcount, and if 0, call @release.  The caller may not
+ * pass NULL or kfree() as the release function.
+ *
+ * Return: 1 if this call removed the object, otherwise return 0.  Beware,
+ * if this function returns 0, another caller may have removed the object
+ * by the time this function returns.  The return value is only certain
+ * if you want to see if the object is definitely released.
  */
 static inline int kref_put(struct kref *kref, void (*release)(struct kref *kref))
 {
@@ -68,17 +68,37 @@ static inline int kref_put(struct kref *kref, void (*release)(struct kref *kref)
 	return 0;
 }
 
+/**
+ * kref_put_mutex - Decrement refcount for object
+ * @kref: Object
+ * @release: Pointer to the function that will clean up the object when the
+ *	     last reference to the object is released.
+ * @mutex: Mutex which protects the release function.
+ *
+ * This variant of kref_lock() calls the @release function with the @mutex
+ * held.  The @release function will release the mutex.
+ */
 static inline int kref_put_mutex(struct kref *kref,
 				 void (*release)(struct kref *kref),
-				 struct mutex *lock)
+				 struct mutex *mutex)
 {
-	if (refcount_dec_and_mutex_lock(&kref->refcount, lock)) {
+	if (refcount_dec_and_mutex_lock(&kref->refcount, mutex)) {
 		release(kref);
 		return 1;
 	}
 	return 0;
 }
 
+/**
+ * kref_put_lock - Decrement refcount for object
+ * @kref: Object
+ * @release: Pointer to the function that will clean up the object when the
+ *	     last reference to the object is released.
+ * @lock: Spinlock which protects the release function.
+ *
+ * This variant of kref_lock() calls the @release function with the @lock
+ * held.  The @release function will release the lock.
+ */
 static inline int kref_put_lock(struct kref *kref,
 				void (*release)(struct kref *kref),
 				spinlock_t *lock)
@@ -94,8 +114,6 @@ static inline int kref_put_lock(struct kref *kref,
  * kref_get_unless_zero - Increment refcount for object unless it is zero.
  * @kref: object.
  *
- * Return non-zero if the increment succeeded. Otherwise return 0.
- *
  * This function is intended to simplify locking around refcounting for
  * objects that can be looked up from a lookup structure, and which are
  * removed from that lookup structure in the object destructor.
@@ -105,6 +123,8 @@ static inline int kref_put_lock(struct kref *kref,
  * With a lookup followed by a kref_get_unless_zero *with return value check*
  * locking in the kref_put path can be deferred to the actual removal from
  * the lookup structure and RCU lookups become trivial.
+ *
+ * Return: non-zero if the increment succeeded. Otherwise return 0.
  */
 static inline int __must_check kref_get_unless_zero(struct kref *kref)
 {
-- 
2.45.2

