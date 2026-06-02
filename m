Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C7C36AB53
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370249; cv=none; b=NZcrP3OrBocb8xj6jhRDKd8YsM71kPMJVGFQcZcCscGelF3qkAHHFxzCUTb1fJRaGGBkQS53OH2Bbe/ChG54aiY1dLrJZLmNOsq9KTgS0QBgoE3YjPxXlA3EZc3jWvGfxF3FVVatcARZu8thgyrLpOfy4pdFsu23D8b0Ccqpa7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370249; c=relaxed/simple;
	bh=Iya2BCuDuT2VVt8xOPzvkxqPyMFfGD2vSAsYFx6T0gE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGkUB+NzjQmGF5tyyEs36L3cpEnx90rrqe0ELqBmNOggMkz/OGTp8T1euC52iKlcljADAUYADr08AJXT+cPQVyysrvNevMDUN0bID7deHWYhTzwLJ9i8/oDKrn3ThSAtJPzqsU2UoyVZxUr7i2VU5kUVxM0i1RBk5g9qSAMiKtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Rk34jMpN; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Rk34jMpN"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-516e1525aa3so109473651cf.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 20:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370247; x=1780975047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flqTP+T3G7cekhEWLkwDVj+JxO0X/Tc2hrAvIJPKbfc=;
        b=Rk34jMpN8cXOVURk1D75tQZ6Ft6v0WA8czJ0pUxB3yhytSwtXBJeaD84zpVvXoSygt
         LFyCe2mICMi29KARtFUPSGuh8xadGvP87OAPxYuUhDPg1lJyaFmaybrsEcPV0tAgq5zS
         Ynvt9AAQaHubZKtRDq4JkgLyu3qiIiXRrFFbPNGmm6S5BMjxV/xYIKMBv16reu0YLZfl
         run5mZCyievQrkJu/ZWjdWqtIAdPGYXLUQ0z8mcKSJuXg1JIV+qh+nLefhtZyQq4LJ2H
         CyCDSp227Ntb2fl4B1m4k4UTT3qKCrkzK2xHN54Q/SAElwoKdpeylAvIa4oft/UW8q18
         bBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370247; x=1780975047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flqTP+T3G7cekhEWLkwDVj+JxO0X/Tc2hrAvIJPKbfc=;
        b=Cap13Rna1gg/VG9F9gLI2gqAavcmqys8qnl9YuO9DB1n9pmH0TiCyQL999ZkQy4fzA
         jDorVWJxB/JW3TM/n/WYmBDUsUDAHhrn0Z1bPaFQy+xnuHhPPe7gJbhNxBno02q5PBvC
         HSRpKXjx19rCc2btJWzmYJBqaY5Xpvct4OYNQMRTKnT3z+U6XPJsWlib60fO1zw0QctT
         Z5h6aS5MJBDUqXgz3ues4U3VLUwo8QXDrhkQWuLS1Dnu7alG/A2vPTeggIE9Qhz5CwmH
         WpZzYmO+YIRxfTnqEZCx70IEkivt5y8wJmcpbmrX6NNAk2ginwMV7+RdbQ4bPggTZc75
         tuMw==
X-Forwarded-Encrypted: i=1; AFNElJ/givxrRYJ9i7jEEzGcanP/5Rj1Vi4sQe23B8wrbwkV5OufGU+B/Qyfv1gEBZwp3l/kQxuW7dg623E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXoxB9oODe2H1pt0qWf+EYvufKFG0w5dgsXNL8+wRBgl1+y8h2
	JtxJS9+gBKZkxqcfXg6gZzy+Zmb1b8asWTZvGDsL8Hfwv1oJxvCvcj4zT5Yf9CMhXvY=
X-Gm-Gg: Acq92OFi0+RzWLvWDOTzDFAbgqVZIdXDxR8K3FCA2mgqBaiWxcRR6VaYV4HwGCrP5Bf
	khloB36hLdM7zs7QZY36Kj6wXalwEpHcaaujRa1JY56lMjHk8/7vLdEXokdwAJ0XajMavyszBc0
	j1yYrqYiB8/VDIxFbtgN4b2EpV2upCy2iuTQCSlxIbIedORluWsiY2hSEfbYyxaXiW/4NVR0jAE
	bL7Dwjh0QMYsMMH43r9Dq5geZyKHox11ItnQIhsHkFciKaaPTcJiyMAqbvRnFrQ/3ezhdXrvnb1
	sFGzIqNfPMyXXTqLbEMz9yLElQFczE1OjawEZECgZMGehM2iFgMa3h3VFMIk1UxgwNuLKUZiPhZ
	dUlISMfReWR/E1X4eJ/REYHPBf/p+eOxs2AxdAa0sKjnDq8DneJIgWLSt74PBCiL+U4AniDyoip
	haL/bfCdZv7TIGefDGybYZAL6LYwQg9hlb+C408HJ9FjI1c99Gl1DhyJyVaB1b6A==
X-Received: by 2002:a05:622a:251b:b0:50e:635b:5579 with SMTP id d75a77b69052e-5173a73ae37mr218885561cf.19.1780370247179;
        Mon, 01 Jun 2026 20:17:27 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:26 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v5 06/13] liveupdate: Extract luo_session_deserialize_one helper
Date: Tue,  2 Jun 2026 03:17:10 +0000
Message-ID: <20260602031717.197696-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the logic for deserializing single entries for sessions into
separate helper functions. In preparation to a linked-block
serialization for sessions.

This is a pure code movement, no other changes intended.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 63 +++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 3b255ffd1bf1..9f72a8b0a9a8 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -553,6 +553,40 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
 	return 0;
 }
 
+static int luo_session_deserialize_one(struct luo_session_header *sh,
+				       struct luo_session_ser *ser)
+{
+	struct luo_session *session;
+	int err;
+
+	session = luo_session_alloc(ser->name);
+	if (IS_ERR(session)) {
+		pr_warn("Failed to allocate session [%.*s] during deserialization %pe\n",
+			(int)sizeof(ser->name), ser->name, session);
+		return PTR_ERR(session);
+	}
+
+	err = luo_session_insert(sh, session);
+	if (err) {
+		pr_warn("Failed to insert session [%s] %pe\n",
+			session->name, ERR_PTR(err));
+		luo_session_free(session);
+		return err;
+	}
+
+	scoped_guard(mutex, &session->mutex) {
+		err = luo_file_deserialize(&session->file_set,
+					   &ser->file_set_ser);
+	}
+	if (err) {
+		pr_warn("Failed to deserialize files for session [%s] %pe\n",
+			session->name, ERR_PTR(err));
+		return err;
+	}
+
+	return 0;
+}
+
 int luo_session_deserialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.incoming;
@@ -584,34 +618,9 @@ int luo_session_deserialize(void)
 	 * reliably reset devices and reclaim memory.
 	 */
 	for (int i = 0; i < sh->header_ser->count; i++) {
-		struct luo_session *session;
-
-		session = luo_session_alloc(sh->ser[i].name);
-		if (IS_ERR(session)) {
-			pr_warn("Failed to allocate session [%.*s] during deserialization %pe\n",
-				(int)sizeof(sh->ser[i].name),
-				sh->ser[i].name, session);
-			err = PTR_ERR(session);
-			goto save_err;
-		}
-
-		err = luo_session_insert(sh, session);
-		if (err) {
-			pr_warn("Failed to insert session [%s] %pe\n",
-				session->name, ERR_PTR(err));
-			luo_session_free(session);
-			goto save_err;
-		}
-
-		scoped_guard(mutex, &session->mutex) {
-			err = luo_file_deserialize(&session->file_set,
-						   &sh->ser[i].file_set_ser);
-		}
-		if (err) {
-			pr_warn("Failed to deserialize files for session [%s] %pe\n",
-				session->name, ERR_PTR(err));
+		err = luo_session_deserialize_one(sh, &sh->ser[i]);
+		if (err)
 			goto save_err;
-		}
 	}
 
 	kho_restore_free(sh->header_ser);
-- 
2.53.0

