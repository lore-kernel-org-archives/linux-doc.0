Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 07BAA7D87C
	for <lwn-linux-doc@archive.lwn.net>; Sat, 18 Aug 2018 13:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbeHRQc2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 18 Aug 2018 12:32:28 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34441 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbeHRQc1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Aug 2018 12:32:27 -0400
Received: by mail-ed1-f67.google.com with SMTP id h1-v6so5988399eds.1
        for <linux-doc@vger.kernel.org>; Sat, 18 Aug 2018 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=FV0dNHdRcB4ZhsnEc2fPA731UxnGGox6WwKOreslgto=;
        b=cSWf8I5iIpCx97/UujKEH5f4Pm0C7XXGUtPWnFGZU9GSyRcVBp2qOKaGIboDU+Sl+w
         5ECYG43t986TYdBu/urRth/3/g7/TSTesCmV5AWASVMFPs0tNgZuB3pS7wYbpTrXeoee
         nE2uxnbQSt4yhH3oxCefGIJk83OnLq+7Pa8Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FV0dNHdRcB4ZhsnEc2fPA731UxnGGox6WwKOreslgto=;
        b=nz8Xail/5qVi5OCVxfgMe46nptahSqIUvuABkQTbMnf0hVAbdhSdV4IoUqeoqFADIH
         27f95qn6qRKJI1/OZ0M7EsuCzI4BTWCr2M+DavW9PPhA/gClw/1ck0AfvT7Sl5/APEfj
         20ShKRkNEFlTEgoP/+zz5LJkhhdu/2MzcOXeCCTHg550NOQPuvRb3h3JkTe3xyzYLXpH
         gQvWfvwXCBZZDS76Uxt6RnE80I+2Xgqk5vm3eDAaGQdGR5g1WSDXl7vbu9pCBFApKUH6
         Gsji/l+bM4PnQilPuH2ZQMnEDQoKr0gtAttW6VP5/4Q1kBSnY9JGZt3zXox9XC5qXP6Q
         O5jw==
X-Gm-Message-State: AOUpUlHFIebpzJYWm0MN/4iWg5EcCR6kmU15szlQswuDgWA02UNcTYpV
        PUn2iJjhz9mK+0tAYTM/GAjHkw==
X-Google-Smtp-Source: AA+uWPw+UKhHcsh5t3gZC8ty9gStC7DIEPFZMt8/J29uy22Ne6sIfHjTNhfp3IGa4AJ3alXFKM/0QQ==
X-Received: by 2002:aa7:c68b:: with SMTP id n11-v6mr47564358edq.122.1534598683408;
        Sat, 18 Aug 2018 06:24:43 -0700 (PDT)
Received: from prevas-ravi.waoo.dk (dhcp-5-186-114-212.cgn.ip.fibianet.dk. [5.186.114.212])
        by smtp.gmail.com with ESMTPSA id a11-v6sm2739032edn.95.2018.08.18.06.24.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 18 Aug 2018 06:24:42 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Cc:     linux-kernel@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andreas Dilger <adilger@dilger.ca>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        Alexey Dobriyan <adobriyan@gmail.com>,
        linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 1/8] seq_file: introduce seq_open_data helper
Date:   Sat, 18 Aug 2018 15:24:27 +0200
Message-Id: <20180818132434.9515-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.16.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are quite a few callers of seq_open that could be simplified by
setting the ->private member via the seq_open call instead of fetching
file->private_data afterwards.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
v2:
- Fix some copy-pastos spotted by Andreas.
- Ensure everybody hit by an example patch also gets this cover letter/introducing patch.
- Include a few fs/ examples.

I've just included a few examples of possible users of this helper,
there are many more similar cases. As a bonus, 7/8 fix a potential
NULL deref (if one believes that seq_open can actually fail).

seq_open_private would have been a better name, but that one is
already taken...

Documentation/filesystems/seq_file.txt |  9 +++++----
 fs/seq_file.c                          | 16 ++++++++++++----
 include/linux/seq_file.h               |  1 +
 3 files changed, 18 insertions(+), 8 deletions(-)

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
index 4cc090b50cc5..c8c86660f6db 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -33,11 +33,12 @@ static void *seq_buf_alloc(unsigned long size)
 }
 
 /**
- *	seq_open -	initialize sequential file
+ *	seq_open_data -	initialize sequential file
  *	@file: file we initialize
  *	@op: method table describing the sequence
+ *	@data: initial value for ->private field
  *
- *	seq_open() sets @file, associating it with a sequence described
+ *	seq_open_data() sets @file, associating it with a sequence described
  *	by @op.  @op->start() sets the iterator up and returns the first
  *	element of sequence. @op->stop() shuts it down.  @op->next()
  *	returns the next element of sequence.  @op->show() prints element
@@ -45,10 +46,10 @@ static void *seq_buf_alloc(unsigned long size)
  *	ERR_PTR(error).  In the end of sequence they return %NULL. ->show()
  *	returns 0 in case of success and negative number in case of error.
  *	Returning SEQ_SKIP means "discard this element and move on".
- *	Note: seq_open() will allocate a struct seq_file and store its
+ *	Note: seq_open_data() will allocate a struct seq_file and store its
  *	pointer in @file->private_data. This pointer should not be modified.
  */
-int seq_open(struct file *file, const struct seq_operations *op)
+int seq_open_data(struct file *file, const struct seq_operations *op, void *data)
 {
 	struct seq_file *p;
 
@@ -62,6 +63,7 @@ int seq_open(struct file *file, const struct seq_operations *op)
 
 	mutex_init(&p->lock);
 	p->op = op;
+	p->private = data;
 
 	// No refcounting: the lifetime of 'p' is constrained
 	// to the lifetime of the file.
@@ -86,6 +88,12 @@ int seq_open(struct file *file, const struct seq_operations *op)
 	file->f_mode &= ~FMODE_PWRITE;
 	return 0;
 }
+EXPORT_SYMBOL(seq_open_data);
+
+int seq_open(struct file *file, const struct seq_operations *op)
+{
+	return seq_open_data(file, op, NULL);
+}
 EXPORT_SYMBOL(seq_open);
 
 static int traverse(struct seq_file *m, loff_t offset)
diff --git a/include/linux/seq_file.h b/include/linux/seq_file.h
index a121982af0f5..1142e39bfad2 100644
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
2.16.4

