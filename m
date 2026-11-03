Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667748;
	b=G5BhF9DHBRCZ+9dTCcDY4xPBKPgSuG0/CrolPjJw4Qoexf5JDi6eU793yd5MRp+Vb47P
	 zOwCOAuz3IbqrW2SBtgQWsJnyTXnJgK0GkZQLYPlRgpTR9QZkE1dwz4cp4246/VFDdE42
	 xsM5xFQtKSIhWWUHNF+z/7e+/gUGADshOmSfIVwVPFl4YemTtmzSaKAIr65Ka0j7xkGSl
	 9JCU1F2KxqqZugkbHa+PxctxSSyLD4qJLJvzUQMPLro200DSZEPWN9A/QNs7lfC6Psyb2
	 4dtKX58LtyQlplYXaX4fWe88DqLv+PdafzuYiyF8J5ksU2fY5O9vpZJCQuq7mTU7YfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ydFgwH1RqwYD9oLhXsqCdCYSovd4C0lCZbr6jb/QI/s=;
	b=2mbMvb4EPiZVL/BymXOke+5Pa5Bagl4ZWaMuNP6BiN6nSS6876LrS+v8t2jYBtbR+YTJ
	 +Q4/njt7GvExNLHKkm5Qj35yofBncnTPduSiJ+RN1CR/32YgvLwflEQcYQ4dQodpEKJbl
	 p/LrT8244eSsCkwjZo5R5hQ0JKT97ei5+mTjn0QSlKk8Iui84cO/rg7eTiyTPj3C18ukV
	 71SGpU1+flgeFpgYInWEuZq+VQSJuuRyf3goo+VukhBgsKMkAohZBem1wM/N79U35K5Df
	 1WjCmUJoENNPfXLF6g20eNW+zpOXPZTPIVPZX0I1CN4tBl1cYMrDxlbV1DaLIqg5tew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EaxatDOr;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530D606D803
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 01:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B530D606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EaxatDOr
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9d52f684fso36204895ad.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 17:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667747; x=1794272547; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydFgwH1RqwYD9oLhXsqCdCYSovd4C0lCZbr6jb/QI/s=;
        b=EaxatDOrL6nO8502r4xabzMHlZ0MYTNwJ+TLXCO7j2Aw16ejN3yWGmjg6tgMWgeDl7
         xLsiInBHZff/UKkRHQUWOLsarLDnG7AVWzV7L/zu8GXc9JJRdovrOMq0256+qibfTnzm
         syEMyUn1p0jMZlQFczofBM/jsQmGpEzedjI9/qtZ8M6xtPIQUZRHNyaEdzUdqTYkTBtT
         IlxIwoTkZBCnypRjN0sdwrswqUdCJb7/vZafpGbRjAy8x0kDLotyAioBAUyOZP57pemc
         lcZcCzd96P1qVpOEuEIyGEIAOcpCCHxohBGEWkjd6Bpasd92oHVHf/N62sscQic4dqgu
         9btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667747; x=1794272547;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydFgwH1RqwYD9oLhXsqCdCYSovd4C0lCZbr6jb/QI/s=;
        b=NtXRan+/oAjKIStsWNdQz1A24o4dbRAo8+K9L55Tio43Xc3FA3LTIGxXqYVTHkzgj2
         hDQX7MOCNnuKseFOiNi4bZnDFs3/q1GDhGlqWgBOEBxTnw4kWA4lLcqyyjuu7c3ctQSX
         lNXc+UOGu2SqUx6h0VHKlrcnDTQu5pfKT5UGtm4Yx3oePL6ktPb/EbUQLuZOwbCJv7ru
         d9aHyhZTnM+Mw9ctrY+pe56kUgDvGz6eEDogpm41muJJqJTi1Dyo4pRAJI2J3nJccJqR
         L0PqG1n7oCwPZ25DZtRoo4vQn5/JVz44TI7U026YNx52/qAPo2FBE9uFmhz1FukNDmnk
         a97Q==
X-Forwarded-Encrypted: i=1; AKwUvBwE5I/5oQ9rL1SIlc4Vp6mCSh5/TdLxBay/TwQEOM5IJ69RQOZWya9M+OUWty7NbJG2Bv3gj0aw3YA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FfxOWjdGfiGvb3UStm+JwUXxUpEPm8SBft+rDG3OzUTZ06Qin
	cliYPL4Nc6aLrMeGn1WbnSm9/OTwXiWxPrTqIfDKKFlLGwFyqHMLjhC/TV8R9Qou0zfJKMBPoTr
	GlTvUomKSI60t6w==
X-Received: from plyw9.prod.google.com ([2002:a17:902:d709:b0:2e9:7e8e:b72e])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f8c:b0:2e8:295c:f03d with SMTP id d9443c01a7336-2eb364f2b64mr122067965ad.58.1793667746894;
 Mon, 02 Nov 2026 17:02:26 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:09 +0000
In-Reply-To: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103010216.3447716-4-dmatlack@google.com>
Subject: [PATCH v3 03/10] liveupdate: Allow file handlers to mark retrieve
 failures as retryable
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

When luo_retrieve_file() invokes a handler's .retrieve() callback and it
returns an error, LUO currently records the error in
luo_file->retrieve_status and blocks any subsequent retrieve attempts.
This is necessary when the handler has already partially consumed or
freed the preserved KHO state.

However, with user arguments passed to .retrieve(), a handler may fail
early while validating caller-supplied parameters (such as a missing
argument, an invalid or read-only target file descriptor, or a non-empty
target file) before touching any preserved KHO state. In such cases,
userspace should be able to fix the argument and retry
LIVEUPDATE_SESSION_RETRIEVE_FD, and if the file is never retrieved,
.finish() must still run to release the preserved KHO state.

Add a retryable output flag to struct liveupdate_file_op_args. When a
handler sets args->retryable = true on error, luo_retrieve_file() leaves
luo_file->retrieve_status at 0 so the retrieve operation can be retried
and .finish() will still clean up the unconsumed preserved state if the
session is finished without retrieving the file.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/liveupdate.h      | 11 ++++++++---
 include/uapi/linux/liveupdate.h |  7 ++++---
 kernel/liveupdate/luo_file.c    | 20 ++++++++++++++------
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 7543f5d648d3..e4ad0bf78a5c 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -58,9 +58,13 @@ struct liveupdate_arg_spec {
  * @session:          The session this file belongs to.
  * @retrieve_status:  The retrieve status for the 'can_finish / finish'
  *                    operation. A value of 0 means the retrieve has not been
- *                    attempted, a positive value means the retrieve was
- *                    successful, and a negative value means the retrieve failed,
- *                    and the value is the error code of the call.
+ *                    attempted (or only failed with a retryable error), a
+ *                    positive value means the retrieve was successful, and a
+ *                    negative value means the retrieve permanently failed, and
+ *                    the value is the error code of the call.
+ * @retryable:        For .retrieve(): [OUT] Set to true by the callback on
+ *                    error when the preserved state has not been consumed and
+ *                    retrieval may be retried.
  * @file:             The file object. For retrieve: [OUT] The callback sets
  *                    this to the new file. For other ops: [IN] The caller sets
  *                    this to the file being operated on.
@@ -83,6 +87,7 @@ struct liveupdate_file_op_args {
 	struct liveupdate_file_handler *handler;
 	struct liveupdate_session *session;
 	int retrieve_status;
+	bool retryable;
 	struct file *file;
 	u64 serialized_data;
 	void *private_data;
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index e806752c2fc6..953ffe0823be 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -174,9 +174,10 @@ struct liveupdate_session_preserve_fd {
  * associated with the token and populates the @fd field with a new file
  * descriptor referencing the restored resource in the current (new) kernel.
  * This operation must be performed *before* signaling completion via
- * %LIVEUPDATE_IOCTL_FINISH. If a retrieve of a token fails, subsequent
- * attempts to retrieve the token fail with the same error code. Failed
- * retrieves are not retried.
+ * %LIVEUPDATE_IOCTL_FINISH. If a retrieve of a token fails after consuming
+ * preserved state, subsequent attempts to retrieve the token fail with the
+ * same error code. Early argument or target validation errors before
+ * preserved state is consumed leave the token intact and may be retried.
  *
  * Retrieving a token that was already retrieved successfully returns a new file
  * descriptor for the same file. The @arg only applies to the retrieve that
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index eeeb3b5ff2fa..908ae124ea5e 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -152,9 +152,10 @@ static DEFINE_XARRAY(luo_preserved_files);
  * @retrieve_status: Status code indicating whether a user/kernel in the new kernel has
  *                 successfully called retrieve() on this file. This prevents
  *                 multiple retrieval attempts. A value of 0 means a retrieve()
- *                 has not been attempted, a positive value means the retrieve()
- *                 was successful, and a negative value means the retrieve()
- *                 failed, and the value is the error code of the call.
+ *                 has not been attempted (or only failed with a retryable
+ *                 error), a positive value means the retrieve() was successful,
+ *                 and a negative value means the retrieve() permanently failed,
+ *                 and the value is the error code of the call.
  * @mutex:         A mutex that protects the fields of this specific instance
  *                 (e.g., @retrieved, @file), ensuring that operations like
  *                 retrieving or finishing a file are atomic.
@@ -604,7 +605,9 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  * The operation is idempotent: if a file has already been successfully
  * retrieved, this function will simply return a pointer to the existing
  * 'struct file' and report success without re-executing the retrieve
- * operation. This is handled by checking the 'retrieved' flag under a lock.
+ * operation. If a previous retrieve failed permanently, it returns that
+ * saved error code; if a previous retrieve failed with a retryable error
+ * before consuming preserved state, the retrieve operation is re-attempted.
  *
  * File retrieval can happen in any order; it is not bound by the order of
  * preservation.
@@ -671,8 +674,13 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
 	err = luo_file->fh->ops->retrieve(&args);
 	kfree(args.arg);
 	if (err) {
-		/* Keep the error code for later use. */
-		luo_file->retrieve_status = err;
+		/*
+		 * Keep the error code for later use unless the handler marked
+		 * the failure as retryable (e.g. invalid user argument before
+		 * preserved state was consumed).
+		 */
+		if (!args.retryable)
+			luo_file->retrieve_status = err;
 		return err;
 	}
 
-- 
2.56.0.385.gac671c819a-goog

