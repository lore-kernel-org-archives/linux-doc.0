Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709451;
	b=fPFRCItMVI/8Im/VuuaPZbpTI1IrbwocZWHHPc/TwQOafenGckN2ilCpBBfaoI+3lrX4
	 QxGGRwDBgvR4gh+rLP0tNGL3E5kydJiDuxIhSca9BWJ8h0jIbymG5XWOfdaHtvCdz83zD
	 n+eqrb1unv3bDIfPghh2uDTCw21Zktn7aTgb1JFLfxkZKRHF6FBVpv9xtxIGprg2et0lS
	 tmdQem931OAVjI2LZKv9iTszREoizGvoU1L32RfCqSDjIsBQvbNypf63PoUipPzU02dfQ
	 9cYyVZwbnEdUlQMX3bMXK8ZscOuTie6KQpbABy7IY/hxaHCCFQtNzfs3gxKBewmarHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
	b=lIC6EUGVqhvtcfpFj6Z8xNl4Pv6FxLQ8TcYkjXWXar9v5MfugSPwtMQDhpqkHitKVjsA
	 3vkJyv0TnFvYkhu7lpRIqeIH+7W39iCZGVrDH9vbH5lp5KKmXaGsZTbshPNICXliztOLC
	 QN3PY6GgJvvzMCa9JfcGIPoDN38sYCrwxE2oUnB+R96yEx+pLn6NaxxVV+lyKWZUquERp
	 cCpm+J+ElSBLIdCSdlwqOWWM7cXA1WyqYf1SeavO8Pao6BcPgVjDkECeYZhwwmQ5syOn1
	 PKpXzD6K++xWels9vtBxtlNdz782toSvNfMcjZMYioVTiIkJmxKrItYskqdwvGuqjKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="Z+/XXPUF";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BADA606A33F
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 22:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BADA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Z+/XXPUF
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so3328725ad.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709442; x=1793314242; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
        b=Z+/XXPUFmVmC5mVsEOw9RDTDxL7sGpoEDkjYTwWRUb1pHFVL8eT0mJh0RDtmFeNwoO
         sb4IOO4ushBGVZOf/szyEenft9lCTcLloC8YgzjP6QWzPo1Rp9qadN8Xf5fD69CQiwe5
         FE+N9rOVj0v0uO/jHXNQg7d9ojYrcpDOZm/+iv20BD7mHFs90bE/Y1C5LfWBMuBB2Ngv
         5dJvmcGUBfCOHUA2wpo8pQJzOj620CmKEHOsI/4SgZmsVZ71af9tU5qUi4m8otR5r89O
         AE13JYaWG2cd53YL3fFxhPF2yEKO0Xq4+3SElXDXNIlJ46iFsQVek+1VsOgq4HGLQSv/
         atmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709442; x=1793314242;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
        b=H08RD4Qh/Rd4CTnIbWE70inIBLQYWafHE2XBxO6KvF2LKZ53CBVQD5cf10aN8tSyZG
         4mD0pwbl3LkiJhCnWMsqmGEn5dsuZsLQGJ2xY8fnt0pJNYLtlVat4o3LyqO1R08ejTfl
         VoSEvmhkiWUavhdoabQdwoQjKEi+tyLHFbqjlbHbuj+qc+4X/7B4tN9XKdQMr0VgpwUf
         BsTMYAH0TRzWvMY3JeRH5gFdDWrrTBYhI4mmP+zjSOyW05Qkf/lRIofzc00mP+9LzB4s
         dcOjT0xDs0Z8A91iYvS9NrmsIk2rTecOeYJ19BcHwtaQ3TOxfTzTxVCHx3dv09xufhcn
         WahQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2HHIuJAJhGzyZ3YPSDwhHg08JJyosHfT4MfoMEEv5DkW1MU3J0aUklkYP4wzi73o3XiXuMA7ffiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4LyCqoBfIiCiSrCz8fu742yt7/uGmMzX50jAYa/fKJPo1RIwo
	Xr+vCQwI8hD4hnM93rXX8RoSEjsA7ZIXhHJlwWEyhym27i+3fczlb6oSQNJ8NAW2kJe+J0PM/I+
	JoaZDEyJQcZ40rg==
X-Received: from plpa12.prod.google.com ([2002:a17:902:900c:b0:2e4:8c0e:97db])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5c8:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2ea7d09b8ebmr5151125ad.20.1792709442296;
 Thu, 22 Oct 2026 15:50:42 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:30 +0000
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
Message-ID: <20261022225035.377445-6-dmatlack@google.com>
Subject: [PATCH v2 05/10] liveupdate: Don't WARN if tracking a retrieved file fails
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

Handle a failure to add a retrieved file to luo_preserved_files instead
of triggering a WARN_ON(). xa_insert() can fail with -ENOMEM, and
userspace can trigger that with LIVEUPDATE_SESSION_RETRIEVE_FD, so
warning about it lets userspace crash systems with panic_on_warn.

The handler has already consumed the preserved state when this happens,
so make the failure permanent. Keep the file until the file set is
finished, like any other retrieved file, so that its resources are not
released before then. Finishing the file set then erases the file from
luo_preserved_files, which does nothing for a file that was never added.

Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 908ae124ea5e..5a82e45b9062 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -684,14 +684,25 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
 		return err;
 	}
 
+	err = xa_insert(&luo_preserved_files,
+			luo_get_id(luo_file->fh, args.file), args.file,
+			GFP_KERNEL);
+	if (err) {
+		/*
+		 * The handler has consumed the preserved state, so the retrieve
+		 * can't be retried. Keep the file until the file set is
+		 * finished, so that its resources are released at the same
+		 * time as those of other retrieved files.
+		 */
+		luo_file->file = args.file;
+		luo_file->retrieve_status = err;
+		return err;
+	}
+
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
-	WARN_ON(xa_insert(&luo_preserved_files,
-			  luo_get_id(luo_file->fh, luo_file->file),
-			  luo_file->file, GFP_KERNEL));
-
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
-- 
2.56.0.257.gf7497c7d27-goog

