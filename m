Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07693D45F2
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501517; cv=none; b=OUqxu2LEg9Zqwv00/KqvKumkSa+IOyTdR1AvZ0byK+PbeqqR+oPtr6qmGDGrbMjd+uMUnm62GG4C4Fe8crTdkWUNazut8jhJuxNqbT0MfoCHfyYvp9Wtr3942UWCjOUDU2f2ZfT3FDVjLiKzs6sKwYSYK/eWowo/4Zwo0U5SGb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501517; c=relaxed/simple;
	bh=FlpNYeZf//1t0Q1W/mmEZOxbLRAkN1/PpE/AQRaykXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p43hwAJp839pgZsHhoU1SGWYkxKfToNHf/ZakpKVfv0fs5JJrw4Ao2RQRB3pLro0tTh4c/ZI4UmV4ZwWpsTOQVnOVd0nM0315JCC9vti8ulGlN5u1dvj74LMrWCGutPvnZ2MuvZo2LfPNVD/MmXkserO24QROhu6mnCw8++fGnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=fzDH+sWh; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="fzDH+sWh"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-915767ea2d0so233295185a.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501515; x=1781106315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfziVgpqRfO53l/kiKYNLloUUY6f9C5CrjqJQDvl8iE=;
        b=fzDH+sWhPgvP+9rHDU/2d4TTChHdcfZaWMCm7LtaxsfPfIX9xxqsi5NNJz0uqEDQ0e
         /ORJfyIwmYZpiXusqJ600KPNVJZuJ8oLFQ3tvmzJJzuRnx0WgcE+21/OMyLxRaxedw2g
         F6I09+mk0Zp2FyZ35tYu/6JbEy+qzcscXbz83SNeweYfalzl0UU6Pqyr7R7vsLFX9oU0
         f2x4z1PWvQT/4wX9fbIfO/fmRElPClspLoYTuTx8n+3DinXdm0+uB7q7hf+n3QC2qlTW
         IXEPCSF8GT3Its5WU8j0hJT5x3Z2ltjETqtq2Wl7y1Tn2ZOnSV1rxkVMAz9k02Bcdei7
         nMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501515; x=1781106315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QfziVgpqRfO53l/kiKYNLloUUY6f9C5CrjqJQDvl8iE=;
        b=jCn6aXlbJUf/tGbYe7z1hzh44VJrHmm9S3H8OQPcdaHvWh8RmCI7sDByKbkRO7M112
         pAEPDBsl0knR1Xsg8+UXI3yXpptKGQ75HjN4cEpXzFnbVTa0Qel9B4hNDKEQAcsJRZAn
         VoMhIWV/ZFBCILz8aR3/gwYAjOx3I4EZiblC9nbAy5ACwi66MmkdocmsJy4rPN6lwmrv
         FLkB9aA6JYQmNse7JzIWTZGggoj7d6eJWLV7phPNPzyL5ZBAATslWQpw36M8/czSOQMV
         pNs58mdLquIaieWq804uPGU/Rmw+RwdQbObvG45lXUmyF5UDi9QKQwDHhd+LFxhcFKav
         vwyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SLrWAHnDUUnaHaHQQKlYH7QeyDZR4zO/UYSRbmdPGqxX/oKCobbO3iCLrUuNDmt72UhF/NXLBmjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHexAmO4S0i4qMul3Byw1w6B7scQ+ljVDg6O+BfxGH+mKTdxvu
	hBHbr/stecm3CebPjchk8IKqIRm+CYa8hCCIPI3EiKDMzInA07Lqsfsnn39C7KBYBic=
X-Gm-Gg: Acq92OGsba8ctRXaE8D17OiULUJcMlZNKKndHAGZaRK554Qqwa+YRfEpCcuIEloFztJ
	hnXpjvpybHpvktm5mjA5Eq0+ziHI6n/Ac9s3PxosFIb+Q9DgLX3B1uuM10g6cRdEt8o6ssBG8N7
	v9mA0f9wPAzSGr7U8BKtFLXYq1DiW5qRsz8JFxJ3E6KGoBuw0wZQSch+4VVjLhllk8QLG7/+1Zr
	zLgwVHfXe7CTd0xhI91YOIETSEssxBiSZQwGe63due8QTaLuwZImiJPqLflpQbwaltc1gzA2+Lb
	tnHVXhgYL6ZXcwPQwickQEXR2UmJcHAZlxcM4kW/LK/IqRt+sDGLJ6N95yc4gmDETJW9e4ocVHv
	U/nKDb2f4lMByEEpR+NGMd3HDfzc79u8UU9sXLUkK4vV0Gxikw3+4tFc7NSrjzhKCOZQNAbEJBy
	FrnlyHD6Lty97VRlkvrs/LN9l6OV4BgLCh2PUo6SgUdJutBhAci4zgBxOH+LGjBw==
X-Received: by 2002:a05:620a:2406:10b0:915:6c4d:d74b with SMTP id af79cd13be357-9158a7aa7d7mr477899185a.31.1780501514839;
        Wed, 03 Jun 2026 08:45:14 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a237330sm280242385a.16.2026.06.03.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:45:14 -0700 (PDT)
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
Subject: [PATCH v7 06/13] liveupdate: Extract luo_session_deserialize_one helper
Date: Wed,  3 Jun 2026 15:43:55 +0000
Message-ID: <20260603154402.468928-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
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
index 85782c6f3d6c..1cd315e0f6de 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -555,6 +555,40 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
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
@@ -586,34 +620,9 @@ int luo_session_deserialize(void)
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

