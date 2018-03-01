Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C2BB7E244
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 23:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1163386AbeCAXhf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 18:37:35 -0500
Received: from mail-wm0-f68.google.com ([74.125.82.68]:50723 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163356AbeCAXhc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 18:37:32 -0500
Received: by mail-wm0-f68.google.com with SMTP id w128so15533wmw.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Mar 2018 15:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=llpgdfU+LhhfauyqD8+9fltyjWwGopc6752T8CVLepY=;
        b=W9Zjo3R7ECCpiHL3xnDXhUbiMYIbKliTaA5PItgPHbjxZ3ldlmrCKw0Ux0WUR020eS
         1DADmPb1m6L7jWsk32W8cTd4zFLhq4NgDx5a5jlMXa62Kj0Y7gwluL0pczvYZqL9k9Pu
         YjbYBP6Fj75iyR4p5sAjGEuxKSHqHKJzC8ujA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=llpgdfU+LhhfauyqD8+9fltyjWwGopc6752T8CVLepY=;
        b=B7Ju01iQxKOYa6tiF4Dtmi9yjXHyEY6+ZXYdNfvblW3PpfZtyDmXkYIhi7kJXVyXA9
         RUI4kIfb1+GOFJEWmVI8L5/D7IeydtjgmNbLIbKMBWswZBfHAtfm+ZhVGRbFlrZJVuPV
         zSn6TtEtypJjRltTVnJ6OOt6mfiJ0w5T6JbeuTs4FST9Wl2pH4JlkxZw4HAEoq9siXjI
         ckOekKgoGzQviVdX9rLjsFWfaOMToBxh+qnbjdzh5yaMiN8ZmEX2noplSdpbSP30E1JR
         J9W6vPiBdKaGTJlh2UQar7qd42nZV3ikPcJpS1N1OTFMAwijqhJ0v3/wPiw1BYK9XR8p
         o4jg==
X-Gm-Message-State: APf1xPA5Ezaae2e09YPuKZ+nFh5cf4VpnqkpbrpkArl41nVTdJ3fzdja
        9EAfYrMLPj6Tiz7BcIZeGFrVuQ==
X-Google-Smtp-Source: AG47ELuz3gZL5nwkbcdpGID1fl0qtKwVmhKCPYbjABNyljJgt7o6L+wdV/gQ31gbNvTB3LtaNVTauQ==
X-Received: by 10.80.137.98 with SMTP id f31mr4886094edf.177.1519947450836;
        Thu, 01 Mar 2018 15:37:30 -0800 (PST)
Received: from prevas-ravi.waoo.dk (dhcp-5-186-126-104.cgn.ip.fibianet.dk. [5.186.126.104])
        by smtp.gmail.com with ESMTPSA id e12sm4088274edi.29.2018.03.01.15.37.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 15:37:30 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [RFC 1/5] seq_file: introduce seq_open_data helper
Date:   Fri,  2 Mar 2018 00:37:20 +0100
Message-Id: <20180301233724.20440-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.15.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are quite a few callers of seq_open that could be simplified by
setting the ->private member via the seq_open call instead of fetching
file->private_data afterwards.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
I've just included a few examples of possible users of this helper,
there are many more similar cases. As a bonus, the first two fix
potential NULL derefs (if one believes that seq_open can actually
fail).

seq_open_private would have been a better name, but that one is
already taken...

Documentation/filesystems/seq_file.txt | 9 +++++----
 fs/seq_file.c                          | 9 ++++++++-
 include/linux/seq_file.h               | 1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/seq_file.txt b/Documentation/filesystems/seq_file.txt
index 9de4303201e1..68571b8275d8 100644
--- a/Documentation/filesystems/seq_file.txt
+++ b/Documentation/filesystems/seq_file.txt
@@ -234,10 +234,11 @@ Here, the call to seq_open() takes the seq_operations structure we created
 before, and gets set up to iterate through the virtual file.
 
 On a successful open, seq_open() stores the struct seq_file pointer in
-file->private_data. If you have an application where the same iterator can
-be used for more than one file, you can store an arbitrary pointer in the
-private field of the seq_file structure; that value can then be retrieved
-by the iterator functions.
+file->private_data. If you have an application where the same iterator
+can be used for more than one file, you can store an arbitrary pointer
+in the private field of the seq_file structure; that value can then be
+retrieved by the iterator functions. Using the wrapper seq_open_data()
+allows you to set the initial value for that field.
 
 There is also a wrapper function to seq_open() called seq_open_private(). It
 kmallocs a zero filled block of memory and stores a pointer to it in the
diff --git a/fs/seq_file.c b/fs/seq_file.c
index eea09f6d8830..f2145cb6e23d 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -45,7 +45,7 @@ static void *seq_buf_alloc(unsigned long size)
  *	Note: seq_open() will allocate a struct seq_file and store its
  *	pointer in @file->private_data. This pointer should not be modified.
  */
-int seq_open(struct file *file, const struct seq_operations *op)
+int seq_open_data(struct file *file, const struct seq_operations *op, void *data)
 {
 	struct seq_file *p;
 
@@ -59,6 +59,7 @@ int seq_open(struct file *file, const struct seq_operations *op)
 
 	mutex_init(&p->lock);
 	p->op = op;
+	p->private = data;
 
 	// No refcounting: the lifetime of 'p' is constrained
 	// to the lifetime of the file.
@@ -85,6 +86,12 @@ int seq_open(struct file *file, const struct seq_operations *op)
 }
 EXPORT_SYMBOL(seq_open);
 
+int seq_open(struct file *file, const struct seq_operations *op)
+{
+	return seq_open_data(file, op, NULL);
+}
+EXPORT_SYMBOL(seq_open_data);
+
 static int traverse(struct seq_file *m, loff_t offset)
 {
 	loff_t pos = 0, index;
diff --git a/include/linux/seq_file.h b/include/linux/seq_file.h
index ab437dd2e3b9..f5ff376fa62b 100644
--- a/include/linux/seq_file.h
+++ b/include/linux/seq_file.h
@@ -107,6 +107,7 @@ void seq_pad(struct seq_file *m, char c);
 
 char *mangle_path(char *s, const char *p, const char *esc);
 int seq_open(struct file *, const struct seq_operations *);
+int seq_open_data(struct file *, const struct seq_operations *, void *);
 ssize_t seq_read(struct file *, char __user *, size_t, loff_t *);
 loff_t seq_lseek(struct file *, loff_t, int);
 int seq_release(struct inode *, struct file *);
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
