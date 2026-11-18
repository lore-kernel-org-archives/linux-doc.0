Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037332;
	b=rU56hzWj1eAP4maOdqI7lyHhDYWJRdOPRLYvzuPIEJc9V8XM8sF2BeDGgwGAtRmsCK1e
	 yiLL8h7j9A5Mgku1LXZ2C2NfNOarICiFhBS05u31f4/o23cG+hjNJGNtfa/Ol1xvdEOMz
	 gi4Yxa/tMo6GjNvz0S6YHA2wz45IYgZFwxJxi74fxo9L3yJ4NeMY3s3hzhmDLJHrCJRNg
	 UQttGuFUt+ZJyslOqAIrVj0L2039eEcPfVqhailidgTP2U1oji1hMRVFx6ZPTXRKGGu7M
	 QRs/xsyLyUbf4FPmhwwgdt4yECgLq5N2WDV4c31kMTr9uE+3JG4Lu5X7NJbIcQPgb6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ePURxFbZRmuaZzBcCX+c1ARIFExZY6rS7Q59wKvUVmQ=;
	b=jiuEmIRs753qUXhldUgjSrBCUgsNlBLw+tXytcKQngbAeb93+BEH2F6FNFYSY1k3Un/x
	 35xrThuoaoTygnEp3y5V2iuctmTToLUMfKIBMn24++xXZqCYCEEkb+QT+tSnY7ctvblL6
	 lPU61OiOHyLCTcLWXckLsikqMO8+WgI08X+HKolxmvoXgUMpjE45UABozoUY6k+4vRT6t
	 +ZC6+H529mwbp+RPo3eshtiLzs5fJAgK2hhhJSBTi1ihomP3tVdFRAHOyUXP4jACo4EKM
	 c4OmOlh7up/k/Iy1BzBmXia/x2FJ9KuFL4td+zlnfc52LfuommJn30Bar0yLNhxWHfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iooawujv;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827F606A325
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4827F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iooawujv
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so1135835e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037331; x=1795642131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ePURxFbZRmuaZzBcCX+c1ARIFExZY6rS7Q59wKvUVmQ=;
        b=iooawujvjzstKoxIo3QMQSY9W2lmr3chcPXIxTqwQ4UzlVojE08xCsqGnt6sl5g1Sc
         xxz0MPeQnsOsxQfcNuJ1J9GeM6zm05LcsBKsu1Z6CZtlSVvvIZIlIM8UOcQvkGRLDDBd
         sjq8dwRs3izuHH0bVA9yN+8byYR1N1WpzDQ96sXdG9fWc3qYxYH1JROMH/w0d9u99hEw
         k1UShZ78J0sQoBBGoSbrnUPBk1SsLobLotR5KKngGDUcX0Ee8yZtU2Svq1vpsiCaZ9XM
         J0mmMo3BKFTxUtiMdU7kdZ462vJofiZErqW5Rzm7ncmZpjQwoWVuwCJd6vLdxpn/mfeB
         sQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037331; x=1795642131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ePURxFbZRmuaZzBcCX+c1ARIFExZY6rS7Q59wKvUVmQ=;
        b=UwT7WAd4GDcXdEhCyNXWDb+DlZ0AUtJI/+3/CkG+y79kLOJ2mg1Wop6bwKM4crrCWF
         ZaYitpLwv6VDaR19ij7T1aAFXrVglYW14+mNNnfn9XIyY+rWkgPD8M+wcmzef9/5HS+/
         Wh79FEs5vI/fcEDw9K85gHDGimz0GqctJG3X2s0KzMLf3JvC78ziZU0hxBO8PghKymPZ
         s0PZb2oH3UBuM53HqdpwTtOBOqyyZjY/wTfYhkae7oTCjGVHQiD6NVmmz6GkEjG+E8Bo
         5m4EnjtJDKiU0+IyUFUbCmGJIddjuogf7KtfHFH8/fKweNmTAMhL1VeVjmbHp8q5jslf
         rIEw==
X-Forwarded-Encrypted: i=1; AL+hErHg4g+UQ8Xu5xGy7WXdqFJz1G93Zy++n48IfK2H7weQb3W/C4E/fnHcPWWZG/aiIzAZSsdluQQNSaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vKpddcZ4qCgT1zS5zK/32LC2wgjs6n+17qnS8UfTy26g7QKU3
	Pkez4LDflFIpjrkgjRliN8ewZEzwV0FP9Ludp0yqvErtM3cqqchuADiwcg+oEISUK3M=
X-Gm-Gg: AYBFou34X1puCMLOC+JI/DuF3rKsNpzAtjQnn5zUfmEixqxkoVLBnIE7nGL9489KQUq
	lQIAt0i9SiE+IpCpQ14sLiRoW7981C3QGYlBuSHvSLEuTnW96iJL1JHD83OiRUJJ0CI6oVj/Wqq
	FOC1TMs2gjKSPsQcYe68mT++IbXE1Pmjgz+xB8P0mUTKQCcREQE5oe5x7eKJTCpFDi5W7LdEHEs
	+0aWLBzqJGdVBXYFrzl3k+f7By4Nj0nIFfmmmZWlgxM5Kfni4FkTafAdmwkMmZGCc4bnnbwdIuW
	QECfJODzGxNFmQB/M1yaBiAwRTFIQlumOEH6eDaVUXh5PwUKTcnX2f0zGUdHejPSRFz/JQ5ftto
	/BjOTlzQ8WwYg3HUZAyNiGaOLCDYdxuqgZv32EP+ow+rAn504gQEc9/3sUvPjGwWMBT8c6baIUl
	meG6sLhjm63oGNUY1etYxhL+h5z10xdgAxHD07M/JYgPLRpll4atFkplpRAnL2bt9k36Lkit3e8
	El7yZVGwW1sKI2BL4nod1ENJNdZ2wGtF0pbuK8tOuIZnFdHMdVhiWdVE4cVidURmV06AmK7G7Jf
	8OwoAycXQWrp8x+ID/zIj3cACIapvaqi7OqeMTPIz9+e4OhjfphE6QB/SMr9Kl6LX8wlvi/rblZ
	quk22X16aJeU+vs6iuU3KeAGv/dACG0T+hWD8BHCbVwGKE33NhRZukHkw2GVe4D+h7DncTaOFrw
	==
X-Received: by 2002:a05:6102:688d:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d6ba3ddfe6mr1764777137.18.1795037331333;
        Wed, 18 Nov 2026 13:28:51 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:50 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 3/7] liveupdate: luo_session: support incremental session serialization
Date: Wed, 18 Nov 2026 16:28:38 -0500
Message-ID: <20261118212845.2855249-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for committing frozen sessions ahead of reboot, allow
sessions to be serialized into sh->block_set individually. Introduce
luo_session_serialize_one() to append a single session to sh->block_set
and mark it serialized. Update luo_session_serialize() to freeze all
remaining unserialized sessions first, rolling back on failure, and
then serialize each one via luo_session_serialize_one().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_internal.h |  3 ++
 kernel/liveupdate/luo_session.c  | 71 ++++++++++++++++++++------------
 2 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 01a172cd9d7a..77dac2742877 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -64,6 +64,8 @@ struct luo_file_set {
  *              previous kernel) sessions.
  * @retrieved:  A boolean flag indicating whether this session has been
  *              retrieved by a consumer in the new kernel.
+ * @serialized: A boolean flag indicating whether this outgoing session has
+ *              been serialized into KHO.
  * @file_set:   A set of files that belong to this session.
  * @mutex:      protects fields in the luo_session.
  */
@@ -71,6 +73,7 @@ struct luo_session {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
 	struct list_head list;
 	bool retrieved;
+	bool serialized;
 	struct luo_file_set file_set;
 	struct mutex mutex;
 };
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 6dea35911181..56d7f76c0282 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -108,6 +108,8 @@ static DECLARE_RWSEM(luo_session_serialize_rwsem);
  * @rwsem:       A read-write semaphore providing synchronized access to the
  *               session list and other fields in this structure.
  * @block_set:   The set of serialization blocks.
+ * @it:          Iterator tracking the next slot in @block_set for outgoing
+ *               session serialization.
  * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
  * @active:      Set to true when first initialized. If previous kernel did not
  *               send session data, active stays false for incoming.
@@ -117,6 +119,7 @@ struct luo_session_header {
 	struct list_head list;
 	struct rw_semaphore rwsem;
 	struct kho_block_set block_set;
+	struct kho_block_set_it it;
 	u64 *sessions_pa;
 	bool active;
 };
@@ -203,6 +206,33 @@ static int luo_session_insert(struct luo_session_header *sh,
 	return 0;
 }
 
+static void luo_session_serialize_one(struct luo_session *session)
+{
+	struct luo_session_header *sh = &luo_session_global.outgoing;
+	struct luo_session_ser *ser;
+
+	lockdep_assert_held_write(&sh->rwsem);
+	lockdep_assert_held(&session->mutex);
+
+	if (!*sh->sessions_pa)
+		kho_block_set_it_init(&sh->it, &sh->block_set);
+
+	/* This should not fail normally as blocks were pre-allocated */
+	ser = kho_block_set_it_reserve_entry(&sh->it);
+	if (WARN_ON_ONCE(!ser))
+		return;
+
+	strscpy(ser->name, session->name, sizeof(ser->name));
+	ser->file_set_ser.count = session->file_set.count;
+	ser->file_set_ser.files =
+		kho_block_set_head_pa(&session->file_set.block_set);
+
+	if (!*sh->sessions_pa)
+		*sh->sessions_pa = kho_block_set_head_pa(&sh->block_set);
+
+	session->serialized = true;
+}
+
 static void luo_session_remove(struct luo_session_header *sh,
 			       struct luo_session *session)
 {
@@ -637,48 +667,35 @@ int luo_session_serialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.outgoing;
 	struct luo_session *session;
-	struct kho_block_set_it it;
 	int err;
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
-	*sh->sessions_pa = 0;
-
-	kho_block_set_it_init(&it, &sh->block_set);
 
 	list_for_each_entry(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_reserve_entry(&it);
-
-		/* This should not fail normally as blocks were pre-allocated */
-		if (WARN_ON_ONCE(!ser)) {
-			err = -ENOSPC;
-			goto err_undo;
-		}
-
+		if (session->serialized)
+			continue;
 		err = luo_session_freeze_one(session);
-		if (err) {
-			kho_block_set_it_prev(&it);
-			goto err_undo;
-		}
+		if (err)
+			goto err_unfreeze;
+	}
 
-		strscpy(ser->name, session->name, sizeof(ser->name));
-		ser->file_set_ser.count = session->file_set.count;
-		ser->file_set_ser.files =
-			kho_block_set_head_pa(&session->file_set.block_set);
+	list_for_each_entry(session, &sh->list, list) {
+		if (session->serialized)
+			continue;
+		mutex_lock(&session->mutex);
+		luo_session_serialize_one(session);
+		mutex_unlock(&session->mutex);
 	}
 
-	if (sh->count > 0)
-		*sh->sessions_pa = kho_block_set_head_pa(&sh->block_set);
 	up_write(&sh->rwsem);
 
 	return 0;
 
-err_undo:
+err_unfreeze:
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
-
-		luo_session_unfreeze_one(session);
-		memset(ser, 0, sizeof(*ser));
+		if (!session->serialized)
+			luo_session_unfreeze_one(session);
 	}
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
-- 
2.56.1.708.g77570a6a1d-goog

