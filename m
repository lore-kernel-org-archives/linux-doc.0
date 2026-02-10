Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5BA25228C
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 06:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770703752; cv=none; b=Y2GTNuTH88LsUhtPC4mF28BAmi8wPpAZMO1I4yTyC6jcRyFDEPMr7sJ/OujC1hQzTsu79E5cMyZw627AqzusKgTxPN7kuzpVZ0Dnvn5jcFkPTD9k98Kua98ke84o6ard5S0OH3H17dLeAmB2uNaNMVuELdMoujTW0O7Ze3XuGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770703752; c=relaxed/simple;
	bh=Sm6alnGtkJd2Vwm8RJudinOjw9tPVgXu68YtS7LFBoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQAKjv42VcoTsJJJeO27claKthPHy2XeusWamDpWuUHTl/Jvhk5tRwQWbPgvoK63K1vgWRsFjBh2nV+t91/x+pMRy1raPV9zUP8PgXr9SCTiCg5bYrIZqk94j4OphSkJIQqFl50vqZzFvz7qHdT1dMuiE/gTnBxhkUsJVNY2DGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTs6XS8s; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTs6XS8s"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so198733a12.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 22:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770703750; x=1771308550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6G0TTk+DKwqC0qssTfjz0S1C9npwQozCQAXb+0qprpU=;
        b=DTs6XS8sEHeQqgwRSbKZRJODjcXoT3CfIvpXv2CKmSFh5ldgA759cgZk5dZ/tR3jZq
         UGAE0w+YskBllO0o3axfrnvc+4h3DPJGCyQe2SU80+gIysxJIymqvS2k5O7bQOq5y+4r
         1mDQx4WkLYpjmq8tuySqlU2WJ3IgB1rceo/39SGa6DEi30bNxWRzSVVT4s9VRw2wPOEM
         tAaa8P1WCyE6k+pqLwijiDQO20Z5qm8IkQA6mr6+BVu8X0YOuZUy4/XE0UQ4kIV2UmT0
         PIr4bQAN2aliS9K6Tvu9otzZ3DXs6VsimBk06alQ0QZSEBW2Qj64pNCBcyFDE0c38wQy
         BefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770703750; x=1771308550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6G0TTk+DKwqC0qssTfjz0S1C9npwQozCQAXb+0qprpU=;
        b=YLAXoNrFylkcHrWIb10SGT2E0OSSYGLAWWdHdBBDI0wBO21/o9tMN10rLMORj97YF2
         2TFwasWYiW6+8dEjC2mk+gmgY3gfl0IltAjYH7uvGhLiygxSD6QDFs2ekP1spHQ2CpDX
         KyeKR6sPE0lmHOPqUh3sLArbSdDlMWnNj+L9sR6ZZK2J2zPw+sMbJkPrmJJ28jHf8hvR
         oVKdX/xX9u4GiOj+yYb0PawlL80Ru1WP+RSq6mOEU0ZYzkGt9Jkkd4GgLt9+MmIuJeSE
         7wKtCJS04pnJutEH1omwKAFDwPfNf2iO8i+/vBOAbRL9X28Cez/2jTE9ppUprfnQArRK
         dy3g==
X-Forwarded-Encrypted: i=1; AJvYcCXhZNZ1PWT/7YhPhoAlzmzUlUCSRTW2hE0oLkEQlDPTtx/xN2o5rGzzcZ5XmHWPfmWLnovdGDENGd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXGX0fNqgVqzYA8fJEun5A9OwMp9/CRYMjOC0Xc0VNSs2LI8lA
	hh3sswLmYC1qF1jmeKW5o/x91Jyz844iv7QSol0RDKwjOg7IrYS4KhHn
X-Gm-Gg: AZuq6aKO0YLA6w+2/sFBYxAQog126mSzwvxdT4dan+Urqqdv+Hw/5e4+cUUL3aotIU6
	pLGrqVFG70bKCHYg2aAdkN9esHl0zJfAW066d0xn8E8q+bjvvy703Xen3vYoFmyYDLbDhE5YuQw
	qVQK9/IEhcA/B13TYsLautjlGLBTmY8KLVnfrFvixjMLDTx2OT2saVZR7HiEo/mURL+n3RzH3m5
	kKyjk6Va9L1PdNwNo51b6Z2MDADXstzS6TsWDthoL7WuIsSJXL3fc1NiVhM/gQdF0VjHwgN12jO
	whxQRLIiveg7vWEvOxv2pDNHRUjQSueCKWgTn6AKOak1iwju7ubuZGbx8AtAJ2QonAh3MtOgJ7s
	hErCD8yG/EOURa3Qu2kRWZrspMLsv2w9rTA/zcWkY7MiCxf5tx7GVSRYrHv/3uI8r6MRm61fhB5
	APwruaUx9XZwYmYfE2hUN1RrgoXMQfS5pvOMEiU2dhlD9zn2I0OE5POjhwHQWVQgb14ePk5O4As
	Zounj/DX/54Zw==
X-Received: by 2002:a05:6a21:a95:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-393ad30704cmr14156801637.47.1770703750390;
        Mon, 09 Feb 2026 22:09:10 -0800 (PST)
Received: from localhost.localdomain (123-194-188-82.dynamic.kbronet.com.tw. [123.194.188.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb542c36sm11520990a12.16.2026.02.09.22.09.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Feb 2026 22:09:09 -0800 (PST)
From: Min-Hsun Chang <chmh0624@gmail.com>
To: corbet@lwn.net
Cc: rob@landley.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Min-Hsun Chang <chmh0624@gmail.com>
Subject: [PATCH] Docs/core-api: fix typos in rbtree.rst
Date: Tue, 10 Feb 2026 14:08:29 +0800
Message-ID: <20260210060829.42975-1-chmh0624@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct minor typographical errors in the red-black tree documentation:
- Remove redundant "a" in the cached rbtrees section.
- Fix "updated" to "update" in the augmented rbtrees section.
- Fix "be looking" to "by looking" in the interval tree sample usage.

Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
---
 Documentation/core-api/rbtree.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/rbtree.rst b/Documentation/core-api/rbtree.rst
index ed1a9fbc779e..cce80e19087b 100644
--- a/Documentation/core-api/rbtree.rst
+++ b/Documentation/core-api/rbtree.rst
@@ -197,7 +197,7 @@ Cached rbtrees
 --------------
 
 Computing the leftmost (smallest) node is quite a common task for binary
-search trees, such as for traversals or users relying on a the particular
+search trees, such as for traversals or users relying on the particular
 order for their own logic. To this end, users can use 'struct rb_root_cached'
 to optimize O(logN) rb_first() calls to a simple pointer fetch avoiding
 potentially expensive tree iterations. This is done at negligible runtime
@@ -255,7 +255,7 @@ affected subtrees.
 
 When erasing a node, the user must call rb_erase_augmented() instead of
 rb_erase(). rb_erase_augmented() calls back into user provided functions
-to updated the augmented information on affected subtrees.
+to update the augmented information on affected subtrees.
 
 In both cases, the callbacks are provided through struct rb_augment_callbacks.
 3 callbacks must be defined:
@@ -293,7 +293,7 @@ way making it possible to do efficient lookup and exact match.
 
 This "extra information" stored in each node is the maximum hi
 (max_hi) value among all the nodes that are its descendants. This
-information can be maintained at each node just be looking at the node
+information can be maintained at each node just by looking at the node
 and its immediate children. And this will be used in O(log n) lookup
 for lowest match (lowest start address among all possible matches)
 with something like::
-- 
2.50.1

