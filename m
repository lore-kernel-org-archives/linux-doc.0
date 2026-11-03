Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667750;
	b=gyDjqh5ocZo/FRXqsQUmAIzdYfUFq4Rf51S1ebiE8CuzCIudCD4uEdNcNgtSrNwf4Kio
	 khfFfznKPTj74mDsMWFtMQQc5GNHdI0Rm4sDqLA5q3CQqGtRM5k29jokeO4vBVTIQpxlt
	 jw5Y0DETiboIM4cyG/5TtRnGNZ7gp7sICZ4IrFnse0/k4+Cr5za3dPJhhJYtcE+IY/kbL
	 HRPSPe5fiKOsf3XpvmAqvxdz9+Mu5Z876QXpkhOTBM24ljm70DQmtDXfdU7PMuHxphVwX
	 eOGMu3p/nmlWTthECoZ48H5A2DoDziNMtjW2oOa50Rs8dfRarbWlmtZDb/ibCql1egA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Pqlok/L90zyySLepqQOJQncJ0sDMJpbHVdvROaPHHJ8=;
	b=m3IJyDyPxe99JMCK2nTQNfqQZ2vLSXJeWyYSvVPgNWgukAnh3igV4YtgQU1Aap9Pl/As
	 eSUSMIK9+wDUxZLzgMjA/FGJqx7YWRws2EG2Mh4h8ez0U7xv2waTiepm6Z12485dTPNcK
	 rfJ8RR2sCTbacaWwbj7jf3ozDisniFWVDBvSDy86ry5NUACafHks31l42xbOcdWpajr5P
	 E7El7hI3PHCkZD/52px47VsxLKxNEzGoGkQEJOR0ZV0q9hD/BWA0zIpWjoSr3bKb/rlcK
	 XdBEMhNNej5sRE46Vyrz8DPQPqo0D7RUe8MMlsq2iEaJ4b3/l77f1OyFlNdnGvtqlpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gc3iPP3H;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F9606D836
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 01:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3F9606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gc3iPP3H
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9821ca96fso58049605ad.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 17:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667749; x=1794272549; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pqlok/L90zyySLepqQOJQncJ0sDMJpbHVdvROaPHHJ8=;
        b=gc3iPP3HUMm13tANsNJ2kw++s9XvPLqovkanTm98Od5BUFSIBLqZVaaz5z9ITpM1ex
         vVdLEURE8rZhhtpjpZaRufWZU3pGcbz3d7NhmFtOVZ7ajoBZTZhfJFijmxUJKPcwpecW
         udEF1wU8cFx8KGzSJH5+mvo+f8ZV0pYmQQVZlCsOGOq4ZSm7OsEK+IMB/xS0tA6VdypN
         svfjG2EG4V8tbk2vxk8NTI+EZD2XjlumPFMQng5nvAnyJBkX8KZIPCzG1b93rEMdX22B
         Cf5jvdT/T9jiVhtw9alV/EKd2S/8AmsHXQG1ln/uxEgabRmLHv0WAJp8k7NezpnfEvhN
         SZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667749; x=1794272549;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pqlok/L90zyySLepqQOJQncJ0sDMJpbHVdvROaPHHJ8=;
        b=ceSsxFoF7E+WF7W9Et6aaHD1rKyn+uZl1TIXvtohRFJGXnYCc/OS+XsvIgRTC/nOzF
         vMxbld2KS40T7QVYcB6x01sYHoy9SR3Tg3OaqD0NNTzjJ1fLnJlqADpToBRO2Y1sUA3G
         BXdnbL+UjA0zwDWpZbgeqaaF58wBCkT9fTce74U2EigHZUaL/NU/qE3zE1yeVWGF9DsH
         XrXP8WzG9dEALSAEWb9tG1Cou7Oxu8CgwKH6IF6UrYwUFIqdKL8iv5kj2QCQWn0mdW7D
         Q3Ru33LPul9FEoX0GkQFGHgEzeLVwbahoxscPOulXVTkIWs/yZVeY94dgTAOp8k3SHS7
         +4iQ==
X-Forwarded-Encrypted: i=1; AKwUvByLrQ6H2mdja+fJ7vLqUsIb+BvsfGH2COvFkJxkfBBXM3VFwp24dUaBgkl+PKAKoCoGlaC+qou2sZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DcNB/MXdgkZ7TPLGCwvcDL3got2zRe7SptLjpp2ilq5m6spFc
	j1vfDMsxBFDRx857Hd7iA+cFbAvCdp2U28ZXo6RS45ZmUoEsrVp3mW4G5PJA0UCSQLVTeMZ5tTE
	r1I4QjXFILDiu2w==
X-Received: from plru1.prod.google.com ([2002:a17:902:b281:b0:2e8:f377:a4d4])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1ace:b0:2e9:5714:6079 with SMTP id d9443c01a7336-2eb3643f7e5mr119975855ad.31.1793667748954;
 Mon, 02 Nov 2026 17:02:28 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:11 +0000
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
Message-ID: <20261103010216.3447716-6-dmatlack@google.com>
Subject: [PATCH v3 05/10] liveupdate: Don't WARN if tracking a retrieved file fails
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
of triggering a WARN_ON(). Make the failure permanent, and keep the file
until the file set is finished, like any other retrieved file.

xa_insert() can fail with -ENOMEM, and userspace can trigger that with
LIVEUPDATE_SESSION_RETRIEVE_FD, so warning about it lets userspace crash
systems with panic_on_warn.

The handler has already consumed the preserved state when this happens,
so the retrieve can't be retried. Keeping the file ensures that its
resources are not released before the file set is finished. Finishing
the file set then erases the file from luo_preserved_files, which does
nothing for a file that was never added.

Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
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
2.56.0.385.gac671c819a-goog

