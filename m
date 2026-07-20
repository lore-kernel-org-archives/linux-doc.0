Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1052A370AD4;
	Mon, 20 Jul 2026 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564989; cv=none; b=EfdvGsvXStmUETjSzeN9COQzhK4vspYD6XPlT84du8egxMuC62g5todhlmzPz+VLrjdvblJfLqNFtOsTYH+hlzxu+GP/bjEonb05zkKEJ5DL6UqWtAJMs4jYxkMdTT9SOtN33gN/NMilQHNBkGxT+IgrQe8uj3Npbva84hT33pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564989; c=relaxed/simple;
	bh=kkBsAayC8QwOKTynSkLMbi1Aj5Oaaquu7v+j1xzr1/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z88s/p2jj7PxmC7NfpFJRBWWl20oxv+w5ff0ksbQ18+B0mHT77lTvmFplicBoAWl5i5VlhYZ6WwisHKmBXNJ64kWZ+dX2djQlOas5RzHSmbuQfdRhUupqVxHFq0UtCYEl9cffxBnwVC+ziBACeROKWa1ozZcSWKcoOpxrpObO+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IQG3CFMW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FIhS63Zm; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IQG3CFMW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FIhS63Zm"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4h3mF871XBzKm61;
	Mon, 20 Jul 2026 18:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784564973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VnZuqxzRT5Eax9lVo3hxWudCc264PtMVdVhe+jK5BZ0=;
	b=IQG3CFMWLs9PijRvRDvY1Q/2jst+jPooHxypeHSMujkVY8S5L6NQwzqStIbDetngo943sj
	8xPXSrzzKRnWaUlvFXaTfPPuu5ZTPcAPZT7JkAAUNu4Kw8QtNzMu2i3qlqHx9Nv1+1E5XT
	sovpOx4RS8FOkL5SjCzsWidkFmz0LLoz2Iyq0Lqa21+G4smSADPnl6KSuQe+l56BBFjrdT
	mTrYQ0C0liy44PcVoiLSQrD9SzAYjLFRk5iLIcCgq0WsRM17QnFe4GxZHkUO/Y2GCKYWOI
	73l37Z/24CfYKY8X8Jmr5WhbuvzZ6BabY0AiBbEdC5qerxjvUrLKGLPPEianLg==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784564966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VnZuqxzRT5Eax9lVo3hxWudCc264PtMVdVhe+jK5BZ0=;
	b=FIhS63ZmWIo7FZJHUDBVyJSvmTNfpOa/oXE9QyPP9hUXSe2HFxpypLy8G0zeFWdi61WjLY
	kz5BaC0r7+8/shKAqTa6cI14peXbVKochRXIYhv1p68seTTqA+vVDWCGQcK0GNdP0qTwjQ
	ZYRMLzhV/LTkbf8jm+/a45OEW45VW5JjqLCWSy9JcOweZwbaSbO8lVKsA6YBJMH/JPAodC
	oEtTIeBA3rntjSNHu45eEeVhfkdR9pSPRO04qZ87NLHN3Bwb0mI3S1FJpo7Fl10vK94JF0
	LlxsbmJd9ZWvQD1OOmc4IE0D5MMJdO04mc+T7hKy2os4oJikwdgwis9bqpMPQw==
To: Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Linux MM <linux-mm@kvack.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/core-api: memory-allocation: adopt type aware kmalloc_obj
Date: Mon, 20 Jul 2026 18:29:09 +0200
Message-ID: <20260720162910.1714718-1-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ksg51jniu7h59xjwyyfzzza3k3m8damc
X-MBO-RS-ID: 3a2a5c4c1aad3b6e586

Update memory-allocation.rst to reflect new type-aware kmalloc-family
as suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
and family").
Add 'prt = ' to example because allocating without having the pointer
is nonsensical.
Replace *alloc() with *alloc_obj() or *alloc_objs().

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
I have no deep technical knowledge of memory allocation. I tried to update
memmory-allocation.rst with the help of deprecated.rst and some research.

Therefore @Kees Cock: Can you review my patch?

I couldn't find any clue in the kernel doc of the deprecated k[mzc]alloc
functions of their deprecation status. Is this deliberate?
---
 Documentation/core-api/memory-allocation.rst | 21 ++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 0f19dd524323..d3d8b39c95eb 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -21,10 +21,11 @@ answer, although very likely you should use
 
 ::
 
-  kzalloc(<size>, GFP_KERNEL);
+  ptr = kzalloc_obj(*ptr, GFP_KERNEL);
 
-Of course there are cases when other allocation APIs and different GFP
-flags must be used.
+The ``GFP_KERNEL`` flag can be omitted, because GFP_KERNEL is the
+default value. It is left here deliberately. Of course there are
+cases when other allocation APIs and different GFP flags must be used.
 
 Get Free Page flags
 ===================
@@ -133,24 +134,24 @@ Selecting memory allocator
 ==========================
 
 The most straightforward way to allocate memory is to use a function
-from the kmalloc() family. And, to be on the safe side it's best to use
-routines that set memory to zero, like kzalloc(). If you need to
-allocate memory for an array, there are kmalloc_array() and kcalloc()
+from the kmalloc_obj() family. And, to be on the safe side it's best to use
+routines that set memory to zero, like kzalloc_obj(). If you need to
+allocate memory for an array, there are kmalloc_objs() and kzalloc_objs()
 helpers. The helpers struct_size(), array_size() and array3_size() can
 be used to safely calculate object sizes without overflowing.
 
-The maximal size of a chunk that can be allocated with `kmalloc` is
+The maximal size of a chunk that can be allocated with `kmalloc_obj` is
 limited. The actual limit depends on the hardware and the kernel
-configuration, but it is a good practice to use `kmalloc` for objects
+configuration, but it is a good practice to use `kmalloc_obj` for objects
 smaller than page size.
 
-The address of a chunk allocated with `kmalloc` is aligned to at least
+The address of a chunk allocated with `kmalloc_obj` is aligned to at least
 ARCH_KMALLOC_MINALIGN bytes. For sizes which are a power of two, the
 alignment is also guaranteed to be at least the respective size. For other
 sizes, the alignment is guaranteed to be at least the largest power-of-two
 divisor of the size.
 
-Chunks allocated with kmalloc() can be resized with krealloc(). Similarly
+Chunks allocated with kmalloc_obj() can be resized with krealloc(). Similarly
 to kmalloc_array(): a helper for resizing arrays is provided in the form of
 krealloc_array().
 
-- 
2.54.0

