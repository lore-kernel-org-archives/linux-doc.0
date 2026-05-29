Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1026F36BCDA
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 03:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024875; cv=none; b=hMPq5s4jor2CCKVy5zzVr+3om3wjUcmv+CIbuxegViPW/S3krtfh02Dfsd9wMPrRf8X8VAwm2WyRsNxkAZgEOr/NoFLr67TUQk59QFv1XqK9s2ZDMPnKMyKQBeQJ92aLiPOZofxLMg50Co9Q6srObtIoz9NfwhBrpt7KnWPvoRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024875; c=relaxed/simple;
	bh=xCG7g8cTS3rmmUschcRtrqLp0HBhvgU8+TA0v+hFl3c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJnI8UFb9ZULu/qEio8IA/LJBIhhooRsau1i9PrYH8KKu13n9I1sCqHJ5iqFU/4e7R3kajYgBvlaSwFEEI7TEwCHTDo7QwxxfZGQ9DzhfzK5hgKT+N3q5aQDyBqm3OgtSzCn2KalDE1wFqgW3vJ7F8/wVrzMaPbamSJbZ3jrUY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=R6xKxLoi; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="R6xKxLoi"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50e63771d91so123781131cf.0
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 20:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024873; x=1780629673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpCsC6C+qH6VW/iV99P+6fjIK3KTX0m1gB7hOlYbVxk=;
        b=R6xKxLoiNylJGGSWvr9N87evrpNXQpaMRkdWjXxiAPcbuhpMaLnRHkTA4aKwPhAbPS
         +v4VPUSNr4qDKI7EmBVsi0BmZqWeSlcqzaabvROpDNYvdAcKZFdLODJ39FoB80n22Qku
         lxlk8TMMzB92c2QMmHIgnjIBt7+MZEbdnrdAlpkmp2tUD75r53LOlCbnKa/x8eKr3hBY
         QFefoKOwij2xQ1WUdk0PSWtXN3cQ+9+WhnuaQ6Y8w4tRkDrvJbxW8t2vkuhsoa58DO7y
         m3ya93a86XerfTxspWebyeW2hwD20DDftBy8ePmHtiVWgHUsh1iIcRcfOmTRmiqDeU+a
         5LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024873; x=1780629673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NpCsC6C+qH6VW/iV99P+6fjIK3KTX0m1gB7hOlYbVxk=;
        b=Gdwx5MOpNPFmkE8AJcIxDn2CxDDG6tL21EsgO814hD++A0OC+c5TqiO1dWz+6OaHtk
         C+tPPZzf/gKGRN47hQhJHJP4qnMXZs1HuBrjARoYg2XhOdt+ovBgenYjuS4h/v50oUBf
         pk4vfG9yoJ8VlX/xC9WwAJkihlMYBYCPgfenc6ufJ4EUFphf/9IGWtZh72nMOAxJQXt5
         Eg2A3qM+/PW6RpmTNSxVuxKPbGFkHqBl0P2RABuBy0rcFXoSBuQQs2LM8wWtniMexWxw
         kDnhUrSVrDeLNsH0nTLOKxj/Ivwyf5YtT+GZ2GgzU5NSdH7acxUcSmM0EUH+wlhSUOZj
         74KQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yTUIcoA1iL+aj0rBhT7NkbSISwUFBRRQUq40GnyhTgP72FZ0WRiU65OPZ4HvCjEkbTfp3ZUMRyNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbsEN4wWu3wlotjWp4GnVnCIvQ5PhghmJJcVj/N3axe7rH6iu
	HtJCxm0ZmmC2mh+gspaYkNhQ3l3jrwtJVGj+7A11OjesCgTQldeMQVe6iDNW9t785aI=
X-Gm-Gg: Acq92OHZp07zwrPhRDYLaha78NJ7NfExlrSTtOGyLJfUDUtWY96vrCsARbuC9EcI0QC
	EUeDU4G2/EkXb85Jy/ZJ4wwd/TzAhVBP/mzccvqjJq41yYutP8DrbsnnocUbkAhDHOkP5VBI5mh
	rx/RXO13DwLMado6wrLJlqlIk+m2wJJxJbDQNYm5IiMpvhLXQ2u5lOa7PCvNyc3F6cW22PDPjtJ
	mDiy8otRVudZV2oDsUbvnkOf+pAp28JouVbfPNmuITPcTt9neK1jEQFqpxriPemsxzmDYOvNH9z
	MZ7W2+o6AlUBIljG5//srzwHdBH57NZNnvIvsLU/RqopS21gmIROrO1kWom7MVr9Ll74piOoAn7
	j9Dm38QDeHaoPMfLh0BSD7HSH7oF+TUHJF/Y5l+R4zkqBlcklfteO9s7msK4+aJi628O23wQnDD
	klH9XGb81/7Eqg4/+dsYJxMLM3bV5ysWp0dhsIPBO1faAiB+1XfdLUb8C9C/FOzw==
X-Received: by 2002:a05:622a:4c1b:b0:516:d955:ea2 with SMTP id d75a77b69052e-5172daa1350mr16395121cf.0.1780024873082;
        Thu, 28 May 2026 20:21:13 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:12 -0700 (PDT)
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
Subject: [PATCH v3 04/11] liveupdate: Extract luo_session_deserialize_one helper
Date: Fri, 29 May 2026 03:20:59 +0000
Message-ID: <20260529032106.1505796-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
References: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
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
 kernel/liveupdate/luo_session.c | 62 +++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 1cad54ea8209..5c092c71797e 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -526,6 +526,40 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
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
@@ -556,33 +590,9 @@ int luo_session_deserialize(void)
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

