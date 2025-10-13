Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E5E2FE060
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349411; cv=none; b=MjcuVffP7FBXPqsXHNZl9MLEy9MzQGgZwrqbo455XfqZkM3M7Fi2FBY88jv2QP537bnlUib/R6gtgSEwYljQfstePlWn0M3PRxUujDNQ4JQg7WTj/U8ONQVeiWLL3mi5ERy+J1WBWZLVqnxNd1gresYLHihT27WD3SZzZH3grj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349411; c=relaxed/simple;
	bh=QYkAwIOd/KIga79O3CPPdGljlVcGsxlNaZNwOjdD1B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAmm94tCj+46IZ/jgSdgxxgEUhJ4zkA4SK2HHWT2tlzgBNjm8J0NrYf+0TKA4CCcFEs6pKNAGdtWmJzTxRLky2pUdJhuaZRoguRpEkVMRq9AeRN5A02/jy/vErL3UocJ3KI5hzIVpPv6nY3wjP4tfu7PrRfFeUbfLeHuNVZhJSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDksx5L0; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDksx5L0"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7811fa91774so3393741b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760349407; x=1760954207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV1yGxvf/xG0262giXqvwiOxgNcwdxbw0KGOncpIBe4=;
        b=LDksx5L0hC/hKIdsmtmWm4DCdVf3/GPIxN9oUBPM0OnB6S8IPpVvc+RJiU90fJkHAf
         Ej/NsExAZnaW7XNzn0OHPe5uWQtHiEhsiuVhPhvyeEHgRXYtwLTqEkRALoSfdXl0B4xY
         rrh5rVGw3ZHQ5sUJpzLt5qduFxYr+3zKP4PTjyzyP0q4ggzJtDCZJ7dCZpOB/24u78yF
         ed6d305khHX1dEBB26cVFJ98/ZRxKoveDY7Ainv+dS0VCFscHdcANJyRFb96OPhNVhVX
         v6iA71uNJ2PSL5P5zFbQNqkyNRFZ/gDE1JVFREYPUYDGB5Fj1nskOYzt4JOBnKRx4u59
         7mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349407; x=1760954207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hV1yGxvf/xG0262giXqvwiOxgNcwdxbw0KGOncpIBe4=;
        b=irGK9DYVAXLe1VZxHdwQ5E/qWEfuFJLm5rKVKpVoLh6EByjnMIciHg92SO5MTWlH/a
         8Oc8zfq9Q7u3WuUD7IRTEomfWozHtt2mZ+qQJ+RNUXCaVRio98UuZT6lIDrp7LCSrCHU
         MkKUkPg1R1yBg1HbzZzPhvGvH1ehAwKOs9xSBII8rBk7eNZZ43weTtNWfgoWxDEvcJVx
         enHF0E323IHB4YCuZXe3rQmYVGxHMvDTipkGa7ngOSSbveZDycFKTKx5C1oHntbSQixy
         RZT44oOf0wqL/MP494PRUDol+gM+aIhfeetETySHwkccI/OWYvDbilxCYBC330SIiAkN
         9IOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEwXdNerZDqi/VyLR1I7QuALxdV3EH/BG9gzNtjtCWQ0Qe/wAqxumfAm2gbCE5tb2xkzrMIXSS2mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2y5AqJrRexoUjovkEOywI3YNUUZFGlH2IeqZz+oz1FACa/b8
	iNnFDUC6f01QCAwzJnbGSNowY9smXUTUIc6+G2JSi1+kt1wrM/pUFCYJ
X-Gm-Gg: ASbGnctZVEzG7IISZJ9tobNF+iPMuGv3c+ROYldOu8rnugoBc0G2ppzt/Uq17sjlU27
	2Hg98RSuSurR+Ex8gU1+PRu6PZGGY3CRz25FR/4inYCwnYWU+wTih2kKiwjxjSOH3fayyz8gibh
	xX+gL3DAfET3k44eVKL+27Uti5cJ9BNmdNzu5/hSYDCHQ0xm5ox694craLz8iy4Ra5y0s6zk+BO
	Y+O/nnyoQN4ym4TdXMgA+W2bSKIAFWcs4nANeHz+HyhDT+RumOHMCcerZ47tH0NCImTHJVgSOJD
	3ToIL6F6qTSZRejcrVZAvhQI4PigcgADyNXWEGmZB0JO5H8GciFEpM30PGpBrfvlyMcZEwjFtNm
	cVvOcHAA+jvpD5G14QBiovhD0TuAfboNNIBL/uION9qZioDotB31AA70=
X-Google-Smtp-Source: AGHT+IGvdrSa99TF3/wQzeHJ7adq7ztHAAjyGmj1egmOD56d3dAzTtWsV5s26vvkYDZDOE04ecLVaA==
X-Received: by 2002:a17:903:384f:b0:267:9aa5:f6a6 with SMTP id d9443c01a7336-29027240de5mr256824285ad.19.1760349407409;
        Mon, 13 Oct 2025 02:56:47 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e4510bsm127981945ad.56.2025.10.13.02.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 02:56:46 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 65689444B306; Mon, 13 Oct 2025 16:56:43 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Will Deacon <will@kernel.org>,
	Markus Heiser <markus.heiser@darmarit.de>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Silvio Fricke <silvio.fricke@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/2] Documentation: assoc_array: Indent function explanation text
Date: Mon, 13 Oct 2025 16:56:30 +0700
Message-ID: <20251013095630.34235-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013095630.34235-2-bagasdotme@gmail.com>
References: <20251013095630.34235-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14552; i=bagasdotme@gmail.com; h=from:subject; bh=QYkAwIOd/KIga79O3CPPdGljlVcGsxlNaZNwOjdD1B4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlvzlR4Lb9qxSP3z95i0fagzF37OTl2XX+o9ddm/wLWp 8trLoapd5SyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiam8ZGRaKvbDk6f2qu8Vy 7v7ANoezvO/3bzkUc3/x2dIFBkcnzLdkZGjLWHB7XeCK662bnm2TtLjxumvxoSb5mFezLu9wfLC QLYodAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Paragraphs of function explanation are currently not indented following
their appropriate numbered list item, which causes only the first
paragraph and function prototype code blocks to be indented in the
numbered list in htmldocs output.

Indent the explanation.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/core-api/assoc_array.rst | 167 +++++++++++++------------
 1 file changed, 84 insertions(+), 83 deletions(-)

diff --git a/Documentation/core-api/assoc_array.rst b/Documentation/core-api/assoc_array.rst
index 792bbf9939e133..61c7ba1e7b877f 100644
--- a/Documentation/core-api/assoc_array.rst
+++ b/Documentation/core-api/assoc_array.rst
@@ -92,18 +92,18 @@ There are two functions for dealing with the script:
 
     void assoc_array_apply_edit(struct assoc_array_edit *edit);
 
-This will perform the edit functions, interpolating various write barriers
-to permit accesses under the RCU read lock to continue.  The edit script
-will then be passed to ``call_rcu()`` to free it and any dead stuff it points
-to.
+   This will perform the edit functions, interpolating various write barriers
+   to permit accesses under the RCU read lock to continue.  The edit script
+   will then be passed to ``call_rcu()`` to free it and any dead stuff it
+   points to.
 
 2. Cancel an edit script::
 
     void assoc_array_cancel_edit(struct assoc_array_edit *edit);
 
-This frees the edit script and all preallocated memory immediately. If
-this was for insertion, the new object is _not_ released by this function,
-but must rather be released by the caller.
+   This frees the edit script and all preallocated memory immediately. If
+   this was for insertion, the new object is *not* released by this function,
+   but must rather be released by the caller.
 
 These functions are guaranteed not to fail.
 
@@ -123,43 +123,43 @@ This points to a number of methods, all of which need to be provided:
 
     unsigned long (*get_key_chunk)(const void *index_key, int level);
 
-This should return a chunk of caller-supplied index key starting at the
-*bit* position given by the level argument.  The level argument will be a
-multiple of ``ASSOC_ARRAY_KEY_CHUNK_SIZE`` and the function should return
-``ASSOC_ARRAY_KEY_CHUNK_SIZE bits``.  No error is possible.
+   This should return a chunk of caller-supplied index key starting at the
+   *bit* position given by the level argument.  The level argument will be a
+   multiple of ``ASSOC_ARRAY_KEY_CHUNK_SIZE`` and the function should return
+   ``ASSOC_ARRAY_KEY_CHUNK_SIZE bits``.  No error is possible.
 
 
 2. Get a chunk of an object's index key::
 
     unsigned long (*get_object_key_chunk)(const void *object, int level);
 
-As the previous function, but gets its data from an object in the array
-rather than from a caller-supplied index key.
+   As the previous function, but gets its data from an object in the array
+   rather than from a caller-supplied index key.
 
 
 3. See if this is the object we're looking for::
 
     bool (*compare_object)(const void *object, const void *index_key);
 
-Compare the object against an index key and return ``true`` if it matches and
-``false`` if it doesn't.
+   Compare the object against an index key and return ``true`` if it matches
+   and ``false`` if it doesn't.
 
 
 4. Diff the index keys of two objects::
 
     int (*diff_objects)(const void *object, const void *index_key);
 
-Return the bit position at which the index key of the specified object
-differs from the given index key or -1 if they are the same.
+   Return the bit position at which the index key of the specified object
+   differs from the given index key or -1 if they are the same.
 
 
 5. Free an object::
 
     void (*free_object)(void *object);
 
-Free the specified object.  Note that this may be called an RCU grace period
-after ``assoc_array_apply_edit()`` was called, so ``synchronize_rcu()`` may be
-necessary on module unloading.
+   Free the specified object.  Note that this may be called an RCU grace period
+   after ``assoc_array_apply_edit()`` was called, so ``synchronize_rcu()`` may
+   be necessary on module unloading.
 
 
 Manipulation Functions
@@ -171,7 +171,7 @@ There are a number of functions for manipulating an associative array:
 
     void assoc_array_init(struct assoc_array *array);
 
-This initialises the base structure for an associative array.  It can't fail.
+   This initialises the base structure for an associative array.  It can't fail.
 
 
 2. Insert/replace an object in an associative array::
@@ -182,21 +182,21 @@ This initialises the base structure for an associative array.  It can't fail.
                        const void *index_key,
                        void *object);
 
-This inserts the given object into the array.  Note that the least
-significant bit of the pointer must be zero as it's used to type-mark
-pointers internally.
+   This inserts the given object into the array.  Note that the least
+   significant bit of the pointer must be zero as it's used to type-mark
+   pointers internally.
 
-If an object already exists for that key then it will be replaced with the
-new object and the old one will be freed automatically.
+   If an object already exists for that key then it will be replaced with the
+   new object and the old one will be freed automatically.
 
-The ``index_key`` argument should hold index key information and is
-passed to the methods in the ops table when they are called.
+   The ``index_key`` argument should hold index key information and is
+   passed to the methods in the ops table when they are called.
 
-This function makes no alteration to the array itself, but rather returns
-an edit script that must be applied.  ``-ENOMEM`` is returned in the case of
-an out-of-memory error.
+   This function makes no alteration to the array itself, but rather returns
+   an edit script that must be applied.  ``-ENOMEM`` is returned in the case of
+   an out-of-memory error.
 
-The caller should lock exclusively against other modifiers of the array.
+   The caller should lock exclusively against other modifiers of the array.
 
 
 3. Delete an object from an associative array::
@@ -206,15 +206,15 @@ The caller should lock exclusively against other modifiers of the array.
                        const struct assoc_array_ops *ops,
                        const void *index_key);
 
-This deletes an object that matches the specified data from the array.
+   This deletes an object that matches the specified data from the array.
 
-The ``index_key`` argument should hold index key information and is
-passed to the methods in the ops table when they are called.
+   The ``index_key`` argument should hold index key information and is
+   passed to the methods in the ops table when they are called.
 
-This function makes no alteration to the array itself, but rather returns
-an edit script that must be applied.  ``-ENOMEM`` is returned in the case of
-an out-of-memory error.  ``NULL`` will be returned if the specified object is
-not found within the array.
+   This function makes no alteration to the array itself, but rather returns
+   an edit script that must be applied.  ``-ENOMEM`` is returned in the case of
+   an out-of-memory error.  ``NULL`` will be returned if the specified object
+   is not found within the array.
 
 The caller should lock exclusively against other modifiers of the array.
 
@@ -225,14 +225,14 @@ The caller should lock exclusively against other modifiers of the array.
     assoc_array_clear(struct assoc_array *array,
                       const struct assoc_array_ops *ops);
 
-This deletes all the objects from an associative array and leaves it
-completely empty.
+   This deletes all the objects from an associative array and leaves it
+   completely empty.
 
-This function makes no alteration to the array itself, but rather returns
-an edit script that must be applied.  ``-ENOMEM`` is returned in the case of
-an out-of-memory error.
+   This function makes no alteration to the array itself, but rather returns
+   an edit script that must be applied.  ``-ENOMEM`` is returned in the case of
+   an out-of-memory error.
 
-The caller should lock exclusively against other modifiers of the array.
+   The caller should lock exclusively against other modifiers of the array.
 
 
 5. Destroy an associative array, deleting all objects::
@@ -240,14 +240,14 @@ The caller should lock exclusively against other modifiers of the array.
     void assoc_array_destroy(struct assoc_array *array,
                              const struct assoc_array_ops *ops);
 
-This destroys the contents of the associative array and leaves it
-completely empty.  It is not permitted for another thread to be traversing
-the array under the RCU read lock at the same time as this function is
-destroying it as no RCU deferral is performed on memory release -
-something that would require memory to be allocated.
+   This destroys the contents of the associative array and leaves it
+   completely empty.  It is not permitted for another thread to be traversing
+   the array under the RCU read lock at the same time as this function is
+   destroying it as no RCU deferral is performed on memory release -
+   something that would require memory to be allocated.
 
-The caller should lock exclusively against other modifiers and accessors
-of the array.
+   The caller should lock exclusively against other modifiers and accessors
+   of the array.
 
 
 6. Garbage collect an associative array::
@@ -257,24 +257,24 @@ of the array.
                        bool (*iterator)(void *object, void *iterator_data),
                        void *iterator_data);
 
-This iterates over the objects in an associative array and passes each one to
-``iterator()``.  If ``iterator()`` returns ``true``, the object is kept.  If it
-returns ``false``, the object will be freed.  If the ``iterator()`` function
-returns ``true``, it must perform any appropriate refcount incrementing on the
-object before returning.
+   This iterates over the objects in an associative array and passes each one
+   to ``iterator()``.  If ``iterator()`` returns ``true``, the object is kept.
+   If it returns ``false``, the object will be freed.  If the ``iterator()``
+   function returns ``true``, it must perform any appropriate refcount
+   incrementing on the object before returning.
 
-The internal tree will be packed down if possible as part of the iteration
-to reduce the number of nodes in it.
+   The internal tree will be packed down if possible as part of the iteration
+   to reduce the number of nodes in it.
 
-The ``iterator_data`` is passed directly to ``iterator()`` and is otherwise
-ignored by the function.
+   The ``iterator_data`` is passed directly to ``iterator()`` and is otherwise
+   ignored by the function.
 
-The function will return ``0`` if successful and ``-ENOMEM`` if there wasn't
-enough memory.
+   The function will return ``0`` if successful and ``-ENOMEM`` if there wasn't
+   enough memory.
 
-It is possible for other threads to iterate over or search the array under
-the RCU read lock while this function is in progress.  The caller should
-lock exclusively against other modifiers of the array.
+   It is possible for other threads to iterate over or search the array under
+   the RCU read lock while this function is in progress.  The caller should
+   lock exclusively against other modifiers of the array.
 
 
 Access Functions
@@ -289,19 +289,19 @@ There are two functions for accessing an associative array:
                                             void *iterator_data),
                             void *iterator_data);
 
-This passes each object in the array to the iterator callback function.
-``iterator_data`` is private data for that function.
+   This passes each object in the array to the iterator callback function.
+   ``iterator_data`` is private data for that function.
 
-This may be used on an array at the same time as the array is being
-modified, provided the RCU read lock is held.  Under such circumstances,
-it is possible for the iteration function to see some objects twice.  If
-this is a problem, then modification should be locked against.  The
-iteration algorithm should not, however, miss any objects.
+   This may be used on an array at the same time as the array is being
+   modified, provided the RCU read lock is held.  Under such circumstances,
+   it is possible for the iteration function to see some objects twice.  If
+   this is a problem, then modification should be locked against.  The
+   iteration algorithm should not, however, miss any objects.
 
-The function will return ``0`` if no objects were in the array or else it will
-return the result of the last iterator function called.  Iteration stops
-immediately if any call to the iteration function results in a non-zero
-return.
+   The function will return ``0`` if no objects were in the array or else it
+   will return the result of the last iterator function called.  Iteration
+   stops immediately if any call to the iteration function results in a
+   non-zero return.
 
 
 2. Find an object in an associative array::
@@ -310,14 +310,15 @@ return.
                            const struct assoc_array_ops *ops,
                            const void *index_key);
 
-This walks through the array's internal tree directly to the object
-specified by the index key..
+   This walks through the array's internal tree directly to the object
+   specified by the index key.
 
-This may be used on an array at the same time as the array is being
-modified, provided the RCU read lock is held.
+   This may be used on an array at the same time as the array is being
+   modified, provided the RCU read lock is held.
 
-The function will return the object if found (and set ``*_type`` to the object
-type) or will return ``NULL`` if the object was not found.
+   The function will return the object if found (and set ``*_type`` to the
+   object
+   type) or will return ``NULL`` if the object was not found.
 
 
 Index Key Form
-- 
An old man doll... just what I always wanted! - Clara

