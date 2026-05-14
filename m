Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB53D300F
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 22:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797599; cv=none; b=hMFxnBcAlds8ReRK86JSPa3Dq9EUHHVrsivCvSrE3ypt56QefIoiXGKwJWzOXRPpituhAuXqJmQNTs8xMhgNmET2/hdYNsHPvZQW+Lp4c1MjpSp64E3koXUyi8tcj+8knFGN77DdQQuxPhyQAqRgeS0o5bMn3zJii1fn6Ibon9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797599; c=relaxed/simple;
	bh=sVZ5o7p+/qtFwBG8i7ARh0384/n8GSnFc4REGXxfxJs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQDgQNp5ZvnmmwJYsGrlBqudMUKLf5o0DT4s6o4OfGGpYj6t5U/vsdJVSEutF5cIQ3oAF0/heWYPjGU7UgYnVgK9ExG5R7T9SIUi0W/qtfTE/JTxbsWuEtgl1VBoNbj8L6Ubpwuro9nevJDmqzYsY+/zKyLt33OhVL2uCKKNb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bKUr1cjh; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bKUr1cjh"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d75bfb259so56813401cf.1
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797597; x=1779402397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DzA3L8/isnr0sHad5OpiNWdq+EP7DXQ1j7lGoEnI0Q=;
        b=bKUr1cjhQpiTyrgFEa9EdedLg4DPjFrY748LQdexu81c0WrSiBv4Bb48KliyEvs6wN
         nvLUhBO4NOYOm814+k6le7MG1+D+A1wcbWEGl8kyans1YuYCrpqv/rLwe1ivQ/Li6J1B
         RuQA75xm22QzOY/POXVBn9UbVfy+mUoKtdU+abR0e4O5YQjiJch7Y6E52hmDJmoTlXme
         3k5eOkZnJnf+ItaZePV0Hu4TxhqAGpELcgmJem0i2KuX14R19HQ+lUHN/HO2XhErNmC0
         gN6MvAy/373/+wee8bOiKyAVf9d22ayO5KxhEt3Yz5/knivhQz/RcSeqyU2OF8ysYMKj
         Gyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797597; x=1779402397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5DzA3L8/isnr0sHad5OpiNWdq+EP7DXQ1j7lGoEnI0Q=;
        b=Q/o3p9PzgfwDC76iGwsbcfJWqYEsisKGlJDYH0EQ7gcnzjgAWbYSdWVdbAEARp0fKe
         KC1cmIJI1mKJ3K7nGtKx0mkDdVgS99Z8V4dRPXPG7al5vmt04AJvWrNCH33y6s1MfeH1
         9xcAoxnw4FCDMPLykk98XbsWWKy3tQo/rI9va2dj6sdtGLI6cUW43bXwJKmb7onY+uja
         tMCiKIj1fBbgrOl3pRwkpwyq6Hxoz7nIFNYJqJ9hlYrRAl6FBMpNp7UMdxNrfOcLtwbU
         kaaozm4KCSo0vfrZfUdHLr/NPBsKGmY2uayQNJIJE5crHTciUrAqusPxW7L6yTyxuwGB
         8Gxw==
X-Forwarded-Encrypted: i=1; AFNElJ8HGssXaZhQCcgiMB2q3cDRlkgjltAgNmuPnZ/lxwc7fDpsJuIkKTpO1dvJyj1efu7BtD3sBrD+pvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhdd2MNaYg2P23pKLfSmP2Ip0O1CaC5dFW3RGj0h6P5imRsb3E
	HAHHfq5H/9FjUIsWEjag/YHfXTZ+aWiCsWzKL6OPQ9Z+rBVm5GkfCMAinBJsLD2LbQw=
X-Gm-Gg: Acq92OHuYUVXNAeuXPc0V76HR1LJ0zLwExKgf7BQtq6gkz7cp3+ECRqPyPsoHtm16nB
	WQu5myjB7kTfRMwESZTIh5lTsKgXZ4fKjYTa/3O1crkPvjQcr7EGuQ+1KurqpnuclTK0/62U6ZL
	+qGAgC3myHaEKsDFQvLoB9QvQz08/gT6JyBHMXsz4aPZYDV81ejxI/IebBqSVSIsyHFhIZns2Cn
	QJ9FxSFCtqBlMC+DiFGzFs535Hpsxd2xOvkfxoq9SGVXKSs6LALG+yqPsOMHJYz3FNv5Zlq89m3
	xdHaTdgvmvhuBFQ6y1euLwaOzDS/eTKt/sQFEFDVkU1g4vU0vgUm3j8g31S5c59Z8FS9Irf5Bdv
	HSecMEyEEplgFL52OlcHno6VBr59ktEkzdFQTptu77zdJcZ8V6ekweGU7tBjHBJz1LMMibvojhu
	lkt45H9V/LMf/MixqMFNh/nvcOI/tdn35nXX+eKDOmKboqNtwhYdo=
X-Received: by 2002:a05:622a:1814:b0:50b:893f:7d93 with SMTP id d75a77b69052e-5165a00061amr19897201cf.2.1778797597005;
        Thu, 14 May 2026 15:26:37 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:35 -0700 (PDT)
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
Subject: [PATCH v2 03/10] liveupdate: Extract luo_session_deserialize_one helper
Date: Thu, 14 May 2026 22:26:21 +0000
Message-ID: <20260514222628.931312-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
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

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 62 +++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 915ab9ce0f34..c08733a328bc 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -489,6 +489,40 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
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
@@ -519,33 +553,9 @@ int luo_session_deserialize(void)
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
-			return PTR_ERR(session);
-		}
-
-		err = luo_session_insert(sh, session);
-		if (err) {
-			pr_warn("Failed to insert session [%s] %pe\n",
-				session->name, ERR_PTR(err));
-			luo_session_free(session);
-			return err;
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
 			return err;
-		}
 	}
 
 	kho_restore_free(sh->header_ser);
-- 
2.53.0

