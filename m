Return-Path: <SRS0=sBCo=3S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D659C33CB2
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E95F20702
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZiI7Xx1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgA2Etc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jan 2020 23:49:32 -0500
Received: from mail-qt1-f176.google.com ([209.85.160.176]:39956 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA2Etc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 23:49:32 -0500
Received: by mail-qt1-f176.google.com with SMTP id v25so12278331qto.7
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2020 20:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdQpfiyk4PIWE8ruZ/p4+h6H0Wluy0SA4deRXSuYPcs=;
        b=iZiI7Xx1e+EcFIaJGo+Sne3j0W2cJmpIhRobRlwk6Y4XESgQNyE2x9egcgq5HvHmCY
         ICWqATSuCdUOBmMNl9hqGAPVDn7KkFXuzWGGwq0k4vm2CI2IfyFs+9GGXYfEaociUwdc
         Uv+ozxnp0TfnbjCcjfEFJ4bKdZKb0dQnEOt9xoYuRZRMuEcIijrOuxPrYFTg5Q17aMq4
         r5cwIKLt+I+dlbV+EoM3FAWnTs4ULcrVFxAetSVbOlQhfqIKNBKCtUeBi39b6a3700Mn
         eYgz4x8tvkHhvTFnzJRPYucxSeE3KFnM0hdIKNk9lV5HqlKEucXBL7v0zSQbiEIBn8EM
         MaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdQpfiyk4PIWE8ruZ/p4+h6H0Wluy0SA4deRXSuYPcs=;
        b=jjGUWUiTXMmsMzARy5c5G5caWaaki549M48NAr6qfmvKRnjaiTU42WM+pAdfciVSfx
         5wwrO+2xA3zy46Ttb0Nc4CvbutGCJFKbwAiYbQDb3+0krXbMvkQREx6yl3hAOkFY6NMJ
         LdczMr7KIPZS8g44uN/rBhdzdeohMAs1j2Y+bHxaQWWPbqxMb8OzkaRQrU8ZbjMv0ntF
         9VWFtsJS1Vaoc0Te23TMerrsyYw3OKHoxqQSmEo9tOjcIPIPEb4djJF2M7YJAyW2ioP/
         HqlabPYTyiNx1J3iOVmM8kiM0+NgXoTrxcaPRnEaBg+0W9d1Ob6sS9PTagLB04Pamjlt
         K3QA==
X-Gm-Message-State: APjAAAVVRle0/gNqD9VOwUtW+DlJu0iVPXk+Y4iGbsVbQt+vaanwMEfe
        E3KFws3h+YZ/aM0ppPA+VhA=
X-Google-Smtp-Source: APXvYqxOZpX+t2izGlW8JsNtvl2Ylv9uydRecND37ZTyUgqvp3G2lYRwcILJ28lTHGHwK99P4uaycg==
X-Received: by 2002:ac8:7695:: with SMTP id g21mr16042577qtr.99.1580273371096;
        Tue, 28 Jan 2020 20:49:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id a22sm487320qtd.48.2020.01.28.20.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 20:49:30 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     corbet@lwn.net, mchehab+samsung@kernel.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 2/5] Documentation: nfs: rpc-cache: convert to ReST
Date:   Wed, 29 Jan 2020 01:49:14 -0300
Message-Id: <20200129044917.566906-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129044917.566906-1-dwlsalmeida@gmail.com>
References: <20200129044917.566906-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Convert rpc-cache.txt to ReST. Changes aim to improve presentation
but the content itself remains mostly the same.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/nfs/index.rst       |   1 +
 .../nfs/{rpc-cache.txt => rpc-cache.rst}      | 136 ++++++++++--------
 2 files changed, 78 insertions(+), 59 deletions(-)
 rename Documentation/filesystems/nfs/{rpc-cache.txt => rpc-cache.rst} (66%)

diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
index d19ba592779a..52f4956e7770 100644
--- a/Documentation/filesystems/nfs/index.rst
+++ b/Documentation/filesystems/nfs/index.rst
@@ -7,3 +7,4 @@ NFS
    :maxdepth: 1
 
    pnfs
+   rpc-cache
diff --git a/Documentation/filesystems/nfs/rpc-cache.txt b/Documentation/filesystems/nfs/rpc-cache.rst
similarity index 66%
rename from Documentation/filesystems/nfs/rpc-cache.txt
rename to Documentation/filesystems/nfs/rpc-cache.rst
index c4dac829db0f..bb164eea969b 100644
--- a/Documentation/filesystems/nfs/rpc-cache.txt
+++ b/Documentation/filesystems/nfs/rpc-cache.rst
@@ -1,9 +1,14 @@
-	This document gives a brief introduction to the caching
+=========
+RPC Cache
+=========
+
+This document gives a brief introduction to the caching
 mechanisms in the sunrpc layer that is used, in particular,
 for NFS authentication.
 
-CACHES
+Caches
 ======
+
 The caching replaces the old exports table and allows for
 a wide variety of values to be caches.
 
@@ -12,6 +17,7 @@ quite possibly very different in content and use.  There is a corpus
 of common code for managing these caches.
 
 Examples of caches that are likely to be needed are:
+
   - mapping from IP address to client name
   - mapping from client name and filesystem to export options
   - mapping from UID to list of GIDs, to work around NFS's limitation
@@ -21,6 +27,7 @@ Examples of caches that are likely to be needed are:
   - mapping from network identify to public key for crypto authentication.
 
 The common code handles such things as:
+
    - general cache lookup with correct locking
    - supporting 'NEGATIVE' as well as positive entries
    - allowing an EXPIRED time on cache items, and removing
@@ -35,60 +42,66 @@ The common code handles such things as:
 Creating a Cache
 ----------------
 
-1/ A cache needs a datum to store.  This is in the form of a
-   structure definition that must contain a
-     struct cache_head
+-  A cache needs a datum to store.  This is in the form of a
+   structure definition that must contain a struct cache_head
    as an element, usually the first.
    It will also contain a key and some content.
    Each cache element is reference counted and contains
    expiry and update times for use in cache management.
-2/ A cache needs a "cache_detail" structure that
+-  A cache needs a "cache_detail" structure that
    describes the cache.  This stores the hash table, some
    parameters for cache management, and some operations detailing how
    to work with particular cache items.
-   The operations requires are:
-   	struct cache_head *alloc(void)
-		This simply allocates appropriate memory and returns
-   		a pointer to the cache_detail embedded within the
-		structure
-	void cache_put(struct kref *)
-		This is called when the last reference to an item is
-		dropped.  The pointer passed is to the 'ref' field
-		in the cache_head.  cache_put should release any
-		references create by 'cache_init' and, if CACHE_VALID
-		is set, any references created by cache_update.
-		It should then release the memory allocated by
-   		'alloc'.
-        int match(struct cache_head *orig, struct cache_head *new)
-		test if the keys in the two structures match.  Return
-		1 if they do, 0 if they don't.
-	void init(struct cache_head *orig, struct cache_head *new)
-		Set the 'key' fields in 'new' from 'orig'.  This may
-		include taking references to shared objects.
-	void update(struct cache_head *orig, struct cache_head *new)
-		Set the 'content' fileds in 'new' from 'orig'.
-	int cache_show(struct seq_file *m, struct cache_detail *cd,
-			struct cache_head *h)
-		Optional.  Used to provide a /proc file that lists the
-		contents of a cache.  This should show one item,
-   		usually on just one line.
-	int cache_request(struct cache_detail *cd, struct cache_head *h,
-   		char **bpp, int *blen)
-		Format a request to be send to user-space for an item
-   		to be instantiated.  *bpp is a buffer of size *blen.
-		bpp should be moved forward over the encoded message,
-		and  *blen should be reduced to show how much free
-		space remains.  Return 0 on success or <0 if not
-		enough room or other problem.
-	int cache_parse(struct cache_detail *cd, char *buf, int len)
-		A message from user space has arrived to fill out a
-		cache entry.  It is in 'buf' of length 'len'.
-		cache_parse should parse this, find the item in the
-		cache with sunrpc_cache_lookup_rcu, and update the item
-		with sunrpc_cache_update.
-
-
-3/ A cache needs to be registered using cache_register().  This
+
+   The operations are:
+
+    struct cache_head \*alloc(void)
+      This simply allocates appropriate memory and returns
+      a pointer to the cache_detail embedded within the
+      structure
+
+    void cache_put(struct kref \*)
+      This is called when the last reference to an item is
+      dropped.  The pointer passed is to the 'ref' field
+      in the cache_head.  cache_put should release any
+      references create by 'cache_init' and, if CACHE_VALID
+      is set, any references created by cache_update.
+      It should then release the memory allocated by
+      'alloc'.
+
+    int match(struct cache_head \*orig, struct cache_head \*new)
+      test if the keys in the two structures match.  Return
+      1 if they do, 0 if they don't.
+
+    void init(struct cache_head \*orig, struct cache_head \*new)
+      Set the 'key' fields in 'new' from 'orig'.  This may
+      include taking references to shared objects.
+
+    void update(struct cache_head \*orig, struct cache_head \*new)
+      Set the 'content' fileds in 'new' from 'orig'.
+
+    int cache_show(struct seq_file \*m, struct cache_detail \*cd, struct cache_head \*h)
+      Optional.  Used to provide a /proc file that lists the
+      contents of a cache.  This should show one item,
+      usually on just one line.
+
+    int cache_request(struct cache_detail \*cd, struct cache_head \*h, char \*\*bpp, int \*blen)
+      Format a request to be send to user-space for an item
+      to be instantiated.  \*bpp is a buffer of size \*blen.
+      bpp should be moved forward over the encoded message,
+      and  \*blen should be reduced to show how much free
+      space remains.  Return 0 on success or <0 if not
+      enough room or other problem.
+
+    int cache_parse(struct cache_detail \*cd, char \*buf, int len)
+      A message from user space has arrived to fill out a
+      cache entry.  It is in 'buf' of length 'len'.
+      cache_parse should parse this, find the item in the
+      cache with sunrpc_cache_lookup_rcu, and update the item
+      with sunrpc_cache_update.
+
+
+-  A cache needs to be registered using cache_register().  This
    includes it on a list of caches that will be regularly
    cleaned to discard old data.
 
@@ -107,7 +120,7 @@ cache_check will return -ENOENT in the entry is negative or if an up
 call is needed but not possible, -EAGAIN if an upcall is pending,
 or 0 if the data is valid;
 
-cache_check can be passed a "struct cache_req *".  This structure is
+cache_check can be passed a "struct cache_req\*".  This structure is
 typically embedded in the actual request and can be used to create a
 deferred copy of the request (struct cache_deferred_req).  This is
 done when the found cache item is not uptodate, but the is reason to
@@ -139,9 +152,11 @@ The 'channel' works a bit like a datagram socket. Each 'write' is
 passed as a whole to the cache for parsing and interpretation.
 Each cache can treat the write requests differently, but it is
 expected that a message written will contain:
+
   - a key
   - an expiry time
   - a content.
+
 with the intention that an item in the cache with the give key
 should be create or updated to have the given content, and the
 expiry time should be set on that item.
@@ -156,7 +171,8 @@ If there are no more requests to return, read will return EOF, but a
 select or poll for read will block waiting for another request to be
 added.
 
-Thus a user-space helper is likely to:
+Thus a user-space helper is likely to::
+
   open the channel.
     select for readable
     read a request
@@ -175,12 +191,13 @@ Each cache should also define a "cache_request" method which
 takes a cache item and encodes a request into the buffer
 provided.
 
-Note: If a cache has no active readers on the channel, and has had not
-active readers for more than 60 seconds, further requests will not be
-added to the channel but instead all lookups that do not find a valid
-entry will fail.  This is partly for backward compatibility: The
-previous nfs exports table was deemed to be authoritative and a
-failed lookup meant a definite 'no'.
+.. note::
+  If a cache has no active readers on the channel, and has had not
+  active readers for more than 60 seconds, further requests will not be
+  added to the channel but instead all lookups that do not find a valid
+  entry will fail.  This is partly for backward compatibility: The
+  previous nfs exports table was deemed to be authoritative and a
+  failed lookup meant a definite 'no'.
 
 request/response format
 -----------------------
@@ -193,10 +210,11 @@ with precisely one newline character which should be at the end.
 Fields within the record should be separated by spaces, normally one.
 If spaces, newlines, or nul characters are needed in a field they
 much be quoted.  two mechanisms are available:
-1/ If a field begins '\x' then it must contain an even number of
+
+-  If a field begins '\x' then it must contain an even number of
    hex digits, and pairs of these digits provide the bytes in the
    field.
-2/ otherwise a \ in the field must be followed by 3 octal digits
+-  otherwise a \ in the field must be followed by 3 octal digits
    which give the code for a byte.  Other characters are treated
    as them selves.  At the very least, space, newline, nul, and
    '\' must be quoted in this way.
-- 
2.25.0

