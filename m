Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB03F20EC
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457359; cv=none; b=enOnPnoI4uP9gdUToiAuEtgaB8HVQBY3ExWWJJYXNfmoqb3kylJJnu7u50CLfT6FuUNMsr42dfSTBcCtvgIOf2JZCxrIV8HWrBD3SXSuAnrGroyqXKLr6ed/bILF+AfQmwwPslL/BE2X2TSeU7W2/IW+8CIzjW1O2bEI9NUq628=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457359; c=relaxed/simple;
	bh=FlpNYeZf//1t0Q1W/mmEZOxbLRAkN1/PpE/AQRaykXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UM7J6AEvDlpLZc8PeippDmyFb+Bg52fifA/Hr9mdxCJ01BBwj0a2kIQMkFMniTjqIPCdWSdN78bPQ1lWqjIFf1QXVavYtEMnB6COZYfKQCWPdWqxKlTiCEjNaQpu+haLYA5PIhnBReuK9O2kzvXkS6qfVgLEP2QTPHWh1sejMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bebspVmA; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bebspVmA"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-517760dc3c2so4587941cf.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457356; x=1781062156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfziVgpqRfO53l/kiKYNLloUUY6f9C5CrjqJQDvl8iE=;
        b=bebspVmAznl06IYs0jzgCrNjFdT8fCHv6nTAogr41a5XDLXtiUt/5WFIW3qSdyvzxx
         4bocL2l45EFZ9YqD/Fo/BlrcB3R2R1uefBnRMrYiO6R9CvuXPwqDKk9dlzNEq0Jcd8WP
         G/L/pEzDE88CwMMX8HNti4hVFY4C2PXs7n1ohqTtKVVSsE8YMSswVwElBnEOsNnwwrfs
         et/W4aY0IUOQGhULAkDpoR3YAME92CIab/rFVHCBSJYyzoKLyA5U2B/FXdlvpWr3NBcy
         VR2yZMqFLKn/K56mHZaDFqddXHwi/DFm/hNZoY86SVeypjuHzIKTllLwa4IFSuSTB2KR
         KKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457356; x=1781062156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QfziVgpqRfO53l/kiKYNLloUUY6f9C5CrjqJQDvl8iE=;
        b=aYYMBaIu70FlC+7rUfotTvYCiO27DqUno2aYgrFEKuKoTnMjB6uoTDtgJOFDqzmhKm
         E/57THHVCU1oReOrrdWkq02pOgHgKqfwaoxlurDvAUZZZ5MZrODC4k+FHDzQey6Hx19b
         jbEqlpylq5yrPk6tL5L8emyHe1Ho3WA2fxOlcei4WcbTWsNzmL48f2yLwv0UKv062BKu
         WhCFiU9gQGc0Kp5AIns7kPiGkkpJ+GtCpuXDdyhpsC0aC2m4tXDUe+DQ8lxF0F3Tj5MW
         4egGGZOnKcTX6b1gg7wz+NDBqUdOF3npEFgUA35Oky95B8xDHJW8RIlAUm/BrwZiDsgG
         VWxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NAfvpEOm5G2uycaFRe/ago3XJYtVVipvRQA10XVDBUMLbrIsfUJLfmMeR70YMpIopjQrGbrsnc6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIlIgOkcI3sDdyE3E7YrvwDhEtn977Fbr8iWhtlWpq1aJ6TujY
	PHz6JIp5jc1GzShYBJywjEXTZbk0bLxTTgRF0OBW3Gm5G5bDydz/HITZYcmzuwV2Fxs=
X-Gm-Gg: Acq92OHJ7wU0BT4AINUtnhNKiz/P4arUnL+ib69TNP5Uh/RKpajpgYPwVb1UFQi2lwu
	o9b146MPPXsL1rqhFochYfD8pg1jYshe+TgKlUAF0xqtDVXehUY0TL+BAq/3ZS8phbQflZdjc7o
	Raa7RgAOxhYC0Z43/B8NRPz+GiPrnCuGAwkhBtFLAjcDxOHdJwYTwkI36UyCRlMmHMz+oaLMmyp
	8NMoEBrv/uzH65HqTqMeHivq8p0n/9XA8cTsbPBZQgBpXJCYO5eYQJ6TTwq6LvCt4weYn5okBb+
	HcHhX48qS2dpEGxt9v4YL14Xw0SahTCcJM/2jyFa9+a9r88gtUHCu6PwNszYe+8R0K6xZZH9qhr
	1smHdElm4Bzhn9ZWdVW/NhpcgpBmyY+6e23b7lkRDGC8M1wX+QZFOQLHrw8m8rE0GL8uySn18oV
	bf79FsUMAVNFXpUH2yI2GPMWdVFJChDAzDw2gk+fk6JNoBPQb5Dh5A94H9ZrLp6w==
X-Received: by 2002:a05:622a:1c19:b0:516:cfb9:2856 with SMTP id d75a77b69052e-51778683f95mr26668491cf.31.1780457355655;
        Tue, 02 Jun 2026 20:29:15 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:15 -0700 (PDT)
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
Subject: [PATCH v6 06/13] liveupdate: Extract luo_session_deserialize_one helper
Date: Wed,  3 Jun 2026 03:28:57 +0000
Message-ID: <20260603032905.344462-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603032905.344462-1-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
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

