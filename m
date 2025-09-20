Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CFA1F463C
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 02:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758336194; cv=none; b=jx4lXF/iPz7Y0THUwbab7bcFXvZZavMsd8WrRpwe7SFZwCXpWs0qLA100ZPFOjxGAO93zUQj3OhxKvvIDlB43mvyHOlDg0Fo6fUkeTYpiJ0RhQ8XQbsylHL+cuoj1cNxnJb+KRMyZbDme1PQNDdvcggzCq82zXniKsvC/5a3O00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758336194; c=relaxed/simple;
	bh=jIM2JpEEJdstDzM1FH/a5F+rpZgjGD7AmI+OdAZdLMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azGCfIuyso7/iUomkZTthoTikTzJS5A6U850G2MvMPnbghhVFLQYVbwz8MYSrzPJ86LvRKY0pLLh7qhkwommmU7MTwOw0LwCzuJny4E+DPQOwJnRePux9lWbAVcBU/k+xp4V9YlbW+df/+GqnmG+M6ftyIQ59QZZ9eBEx6CGMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKXjGXrZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKXjGXrZ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32e64d54508so3241843a91.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 19:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758336192; x=1758940992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Feoz4vUuJGBat4TpdOQ5A9d23fZeygOeO5p+rw2PJQ=;
        b=AKXjGXrZRuoq1ID1F7lnjQaNYVnlXeFx9GnRfyXCrREQlmNrZl0Jm7uIMrubAyZ0in
         UOBhAemih1IewWunyxjbDUYKEAVCiPngUo2AGikn2N9JraPRW8Bnlmw1/PH5NZP8orw7
         kE9UqNm1QPNPkkGR5xafIBMHb7GvdItdLalbCeECbdnL8WrJx6Aw+JEMci12N7X5zfmy
         04wY1tetYYKLjb05bCWMwBm2rQK8cyt9fW8+wYJ5gJzn+Y0CvriLsuZ3tjUv73hbUbnb
         NZJu6O0lFwvXtpmvkKMBSkpRZKksZ+JKw/KhvoN/DcnIKaiKRvVQECddeB7W5jPV0ZjB
         GMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758336192; x=1758940992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Feoz4vUuJGBat4TpdOQ5A9d23fZeygOeO5p+rw2PJQ=;
        b=MIix+IrkvWZb+T4GyQp8kwTrd/uaT5TvaShS/BhfwdvbuJGFILcVMhTw2C7nGE2Idk
         Q6v3qc+aUpdJSwylq5keW4M9nUvn7n2xT2nWpKUxnqasHT6gX5KAAP7235qiYermNpKx
         IJU5kPtzouj99okoIoPxBk0lZ92QCTaV2Pa53WuAsLXQ+EmjcSth/5OiVHIlDL8JogWW
         0celcxjVlEyfvohLSYarFccNBV2iVBLAURfUmWvr3yYd1x3txU0JIyvj7Y3ehD92/lHQ
         mnSevqrr06myUiJIvHdE7cuMcLsDigbb14XPD1O14YuCjngGvLOsJdKzYObcMxNdB1kl
         cZPg==
X-Forwarded-Encrypted: i=1; AJvYcCWIgpLCrPvzcq+rE5ANpxdGIxIshmZxqXDXdjjFvvkbTW/0PlOe4pYzl+SSD9dscwBd1vtZq8yw1s0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeahO04yO9UL55R+oEMHgPMPelIXG16rlzdzdQhVjia+E2SYlt
	K1cHsEs9KWXtFFvRGDb8dJDY/jmp4FCFCFoMtZu5lW1N0usoxVUyArIP
X-Gm-Gg: ASbGncuf4P+eZaSaxIvCwSq/F62DYRx899FV6JbFoA5aDZLzRoZyjnnatEUy4jIq1Bf
	nmMDFgxO+WG1D2WO14LIT+gaOf16MXLjHGPdyhD2Up/rL/6p0LovCA3QxRqtaMsFEAwmI1bA2lF
	cKaJxE1lhUx+AQU3uJjycSzKPn4wJxIoRBp8zVcO8pc2lNvToM1EeHicUYdhaeKNCxVgMxkHHV3
	Heuwbel67d+R4xj9aSYUCqR+NsPa2oJlNGtShOkzdz787Z1Usqr7NGI+zFXbDvi5UHwb4uB7vHN
	2PWlMiAPiO0CFT2aZauPD3hIC46u5WAx4Pcbg3Vfv2sGexwHjJbm0KzNHyqXShVNtETndyd4CcF
	fZuiZEA/PJ87SrrHH5kGfSg==
X-Google-Smtp-Source: AGHT+IGhEdhueLpCKuRSYdbs3DuUE1XWKmgJvvfcg2dz20ERj8DuNHNfWNwVMolJGGjHNVPT7ugT6Q==
X-Received: by 2002:a17:90b:3b49:b0:32e:73fd:81a3 with SMTP id 98e67ed59e1d1-3309838d921mr6808570a91.33.1758336191837;
        Fri, 19 Sep 2025 19:43:11 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0da42fdesm2297592b3a.66.2025.09.19.19.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 19:43:10 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 442854227236; Sat, 20 Sep 2025 09:43:08 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Will Deacon <will@kernel.org>,
	Markus Heiser <markus.heiser@darmarit.de>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Silvio Fricke <silvio.fricke@gmail.com>
Subject: [PATCH 1/2] Documentation: assoc_array: Indent function explanation text
Date: Sat, 20 Sep 2025 09:42:27 +0700
Message-ID: <20250920024227.19474-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920024227.19474-2-bagasdotme@gmail.com>
References: <20250920024227.19474-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14452; i=bagasdotme@gmail.com; h=from:subject; bh=jIM2JpEEJdstDzM1FH/a5F+rpZgjGD7AmI+OdAZdLMk=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnnhDPPbVT/t4+tznCmWOfj9ReOFxp8XLK7/Qnb/n2r1 2hZ+3z62FHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJvP7I8N/D7lzDYsup8olG H7Y0qF4OqPY7ZMF4RUY339bqvPq9lF6G/+7XYj/NjmpZEfr321w+D+nF7/mfrjhvGpG/VUV4Xdw EVgYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Paragraphs of function explanation are currently not indented following
their appropriate numbered list item, which causes only the first
paragraph and function prototype code blocks to be indented in the
numbered list in htmldocs output.

Indent the explanation.

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

