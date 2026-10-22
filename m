Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709459;
	b=lckt4dmOWNYMnjdc5hSIjLI7lwC9VtMHMeoC50u8ASQThmdhxVTZBjj2gnBgGFyfnDx+
	 e9EMdvvFTo9QFFRT6nsCMcUHcVbv8zosoFnevt+GP6O2uWBK+uINuoa64Ww2YzmJQvwWR
	 Q28vTQTESu2ipK8DPI16Hyhnkic/EhEX+IG/JnJqO+gknP0IuXkZbUgtYVclVTZHaTas9
	 j58Cb5mk9ary3pFNpbECWyVsrHl4qr6B3XCGIxPv3UdG2TOJcn+Mwzb/SqpapeRl7ZUtE
	 OGxRicXKEvsEbBSW2OGfqCx6NDNpMzeSU+Hetw06KTyew765AdNSdByS6sCSHDTeH6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tveVWO7bpJoIkcGyu5OICWvMrLDi2sKmFxgN2k+RxPA=;
	b=OkwUKaeoolrXncPDKpXUf7fFV1vV5tIKZ5kSkGPTR1LI06SkD6yI46r6rcSOdncl0JBT
	 XHeEQrOHjAof+XC+X3Co32njwcPXvIuDnf00ZkRy7B3KCurw+WxRlECmZOiJTKWcADlnY
	 PhRN9kFFGOMpfnCis6MtMBmdVekpw2juM1KrXHaMMsUDPS8yNCmMunL43qDCFHBZt6YlB
	 /hZ5aJJFNYuyuq3C5oPU8UtH+chI+6zM3lCmoD4GfPJGkfU5+X/58nWmhbMQ5lZwa87vz
	 rUAjsPvBugN8AXGyQIDuViRuwn9+Q6w/q7HE991fcB3mPiSBJtuJfjdGegmIbPi0k8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JI1oGfp7;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDF8606A32A
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 22:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDF8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JI1oGfp7
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd8b299b05fso277937a12.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709458; x=1793314258; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tveVWO7bpJoIkcGyu5OICWvMrLDi2sKmFxgN2k+RxPA=;
        b=JI1oGfp73ClAM+rrrmG0fU/E10DtJ505Iuk7NocRTECK3OS5pKrAR+KGXtLKgD32at
         Psx+S04EfZlRqm53rtSpodOJ+D+OnJMU3n2xA7CM4nVyMVFXgxwoFoIPE1iz/X/buu/q
         ZJnrAEXWAFGazTBvdoeZrcHA0Az7y1m+kJ9yuwqbhvB4n05Zm4nI9yryqfFe3hNtRPb0
         +P8RY/tcc3g9IdFw9xrJICoJ31mVVGCJa6uB67WpN51tSK0Cw/e7wY65Z1ylDeopw5KY
         YCvOj7BUvMly23jNmQAMu9JRkL38DkL28XTU9UwI10UVUR9QQZ9agQ66wh3xdB2L5HoV
         QpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709458; x=1793314258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tveVWO7bpJoIkcGyu5OICWvMrLDi2sKmFxgN2k+RxPA=;
        b=BwTaQLOrUB0fs34gfBcJ9lHWYY7uyl5te4K7bnMScKS/wlk7rLpZs8Gh1VTZuk0Mm3
         tE3yNA391ahlxD77R++swAmLOOkeBQIwXPBD4yYEfbixnA3SXi1tu7j5zxZ/CSMrfBwk
         46Gq1VomtOoWuhaSzroXQqmnsjUKLthej1JGxTReQrqUiQwaQeYDRNLgtgoR/LAkzWA0
         iyiAsLHOAJI9xNekm5FKlk5wMt+UyDFziMt7Ufg1cIIKFR3QWAAKw9fFt+5eYYxe8l1V
         qTNz4PjfSmOkP9YM43dj++zdafFRkJ5tBYySy7ILcXZE+MoXgXInUlGlhsvWQKoEJf0T
         7Z5w==
X-Forwarded-Encrypted: i=1; AKwUvBzfwP6dfV7euXJQjvJ/IDOKRzn4D92i5KwRkPZlujwHw6wKKYo1g2EHcW9HefMCjh9hZ3VhNm7iFO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhob/7g2ArqISrf5+SFMHnGoK/+Q/G/BC2ZMMib3kOBHudSCp4
	PStER4qyX4zJSgs3mqXgJBhoMNQ/odyeIvWq4kdId4BxQT1DQl2RoAzakQO/PkoYd/BiOdnmnij
	N4B2rViDv1VZZQQ==
X-Received: from pgww26-n1.prod.google.com ([2002:a05:6a02:2c9a:10b0:cd6:1195:61cb])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:8a0e:b0:3e2:335b:1a5d with SMTP id adf61e73a8af0-3e3767c3067mr249935637.71.1792709458271;
 Thu, 22 Oct 2026 15:50:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:34 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-10-dmatlack@google.com>
Subject: [PATCH v2 09/10] mm/shmem_luo: Allow retrieving tmpfs files with O_RDONLY
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

Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
to retrieve a tmpfs file read-only.

open() requires write access for O_TMPFILE, so create the file writable
like before, then reopen it read-only with dentry_open() using the same
flags, and drop the writable file. Like open(), which grants the
requested access to a new file regardless of its mode, don't check
permission for the read-only open.

Retrieving a file read-only allows a restored binary to be executed
before the session is finished. LUO keeps the retrieved file open until
then, and executing a binary that is open for writing fails with
-ETXTBSY. Being able to execute restored binaries right away matters
when they are needed to finish restoring the system, e.g. to bring up
the services that retrieve and finish the remaining sessions.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/uapi/linux/liveupdate.h |  6 +++---
 mm/shmem_luo.c                  | 28 +++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index a9dcc4fcc87b..790742a247e8 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -265,9 +265,9 @@ struct liveupdate_session_get_name {
  *
  * The kernel creates a new file as if by openat(@dirfd, ".", O_TMPFILE |
  * @flags, @mode), fills it with the preserved contents, and returns it in
- * &struct liveupdate_session_retrieve_fd.fd. Like any O_TMPFILE file, the file
- * is not linked into the filesystem. Userspace can link it with linkat(),
- * unless @flags contains O_EXCL.
+ * &struct liveupdate_session_retrieve_fd.fd. Unlike open(), O_RDONLY is
+ * allowed. Like any O_TMPFILE file, the file is not linked into the filesystem.
+ * Userspace can link it with linkat(), unless @flags contains O_EXCL.
  *
  * If @flags contains unknown flags or O_PATH, if @mode contains unknown mode
  * bits, or if @dirfd is not on a tmpfs mount, the retrieve fails with -EINVAL.
diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index aba2bc1f18c5..0b4a9d6e2968 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -112,9 +112,10 @@
  *
  * Like any ``O_TMPFILE`` file, the new file is not linked into the filesystem.
  * Userspace can link it at the path it wants with ``linkat()``, unless it asked
- * for ``O_EXCL``. Like with ``open()``, the file must be opened for writing.
- * LUO keeps the file open until the session is finished, so a retrieved binary
- * can't be executed until then.
+ * for ``O_EXCL``. Unlike ``open()``, the file can be retrieved with
+ * ``O_RDONLY``. LUO keeps the file open until the session is finished, so a
+ * binary retrieved with ``O_RDWR`` or ``O_WRONLY`` can't be executed until
+ * then.
  *
  * The blocks of the file are charged to the target mount, so the size limit
  * and quotas of the mount apply. If the file doesn't fit, the retrieve fails
@@ -649,7 +650,9 @@ static struct file *shmem_luo_create_memfd(const struct liveupdate_shmem_retriev
 static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_retrieve_arg *arg,
 						unsigned int seals)
 {
-	struct file *file;
+	struct file *file, *ro_file;
+	bool rdonly;
+	int flags;
 	int err;
 
 	if (!arg)
@@ -673,10 +676,16 @@ static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_re
 
 	/*
 	 * Create the file like open(O_TMPFILE) does, so that it gets the same
-	 * flag checks, permission checks, owner and security labels.
+	 * flag checks, permission checks, owner and security labels. open()
+	 * requires write access for O_TMPFILE, so create the file writable and
+	 * reopen it read-only below if that is what userspace asked for. LUO
+	 * keeps the file until the session is finished, and a file opened for
+	 * writing couldn't be executed until then.
 	 */
+	flags = O_TMPFILE | O_LARGEFILE | arg->flags;
+	rdonly = (flags & O_ACCMODE) == O_RDONLY;
 	file = file_open_root(&fd_file(dir)->f_path, ".",
-			      O_TMPFILE | O_LARGEFILE | arg->flags, arg->mode);
+			      flags | (rdonly ? O_RDWR : 0), arg->mode);
 	if (IS_ERR(file))
 		return file;
 
@@ -694,7 +703,12 @@ static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_re
 	}
 	SHMEM_I(file_inode(file))->seals = seals;
 
-	return file;
+	if (!rdonly)
+		return file;
+
+	ro_file = dentry_open(&file->f_path, flags, current_cred());
+	fput(file);
+	return ro_file;
 }
 
 static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
-- 
2.56.0.257.gf7497c7d27-goog

