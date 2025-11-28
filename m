Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6C5313268
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330275; cv=none; b=djbXnajvXy9qZ3vAyNg6E8BNPQaKVP2Id19P+qwR+l0XAxWCDttGZtV8TvQqJWFt8+GU1MwHu0GZ2oGpp+Dh5W5DsroW5fOsE/bIZWtceVHWKaQPNlr5jRP11iwCuUPFBaVOsZj6GPL7c+08SIQ4WuXHquRJyPidzAebmcUzUiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330275; c=relaxed/simple;
	bh=DCCMlvDGThFFIvgY86LqD197iJw6Jsoi16VgT7CHNFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcdRlByvFzJKPYWHcYjj1xcZ039bCWFjOgEn+u+mpk7ha/groM1FhbPaxLCZmQiAD+udf5UyDADN71vZacIZvnxfiUT/mVnMJB9f5JrGE4Xus3m2sGegF5XpGFddgv3jR1m8ZibL1SfMCUXxi2J5fSiUzaj9mDjhnaaJNctt/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AOlZ8DDQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AOlZ8DDQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1680292f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764330268; x=1764935068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tw3tkmAmu4OrMkcprgGA2oojzoMKM9441R1Qh3dnLxQ=;
        b=AOlZ8DDQxopy8SEaQLQG516GV7n2z9u5pbNvxuqJxmlyi0zOoqqRNKQE4WRvmo6NrD
         LrGBQbZjUyB+Jc+i2vGKOcN4M8gWb4GqBQyq9ZiGBG1INqy8vG5OspUKkDhfCufA/3dq
         VvVJE2VdJlm4+T3m1Ib0bwjMZdJYrO3evJ2vNu53YmZU6QUdrGFJyIGnkzjqlXkw+NfQ
         7mSV5zwSRchQaPK5EkaDb5BwOqLAizpCWu3C9/j3FbRsBVisDX47MIlgeZ8v7nc1AenA
         kMe0gyMiOQSo1iZ+7O2+dE0K6RfXEXAoT3+RkUKPYNCSvJihOshJ9Ov+Dj6IyQlw4dq3
         nsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330268; x=1764935068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tw3tkmAmu4OrMkcprgGA2oojzoMKM9441R1Qh3dnLxQ=;
        b=RLlJ77s3yHJ6wGbjUrNO5aH2IMePggCd1Tt96bBUICbpAnI7nWJ54FVwBfnrdORX8q
         /wq3TQgRlNHGuxsui/WEu84hYUHWsqr9EMcRjT2RK3Ir2Vj70hxrCGI+6NCKQMY8LhI6
         iy5dtMiT0554GlwJfNesxKVXz7PK4gAKuRCPyslSTV7DPl18B0UFfXJPC9EScPm25+Ej
         aMIJQxPpEwuJbSbZ8qj+HnR/hCBNwP6bTMYYN9j44f2oWaSywa8gmi/sLWRh7bFDelLr
         zGKcTYxiQXV569EETQ9m54DK6wCuOQhPGZYjuYfqFpXrD2LPDRJMvRYaTG4P4MGoibkV
         HJxA==
X-Forwarded-Encrypted: i=1; AJvYcCWTjfFEYLS4P/yZwrTHpZVb68QwWjUGSj5Bw/AE0JTIM+mDt+4FkAJ8xaWVRV8JmvjNltiFHIrq1ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOXX6MgdAgFivXOTysJzLIwN7fGMzyH9EwwAvfhLfgE40Rmux
	nWy6HkJMdHxN6I2iWOhrm0FayC6ACB8bwA+zFKG3KPDFxtLbAV5FHRt8/Wv7W06h4+A=
X-Gm-Gg: ASbGncssZkp+T+noLg4ZAjcIhlwcY9hD+jikk/WNH7vYEwBX2jbrShkatzhoomkHusk
	r50zmkrA5e0n1kj3I1g3SKhgoGKG6ZcvpPH50EzkQkme/4xLf0TbT1LRQUCceMIGQRj2Z5TTEby
	SPOD0Q7Zo3SZ0CHBKHV40v2UxLlbNsiwyuQjlUnKrDfM9llRYUvdpScPGSHwKDYO0YcQgdzLFYm
	9dRQajmZyGttZh+hi0CMf5PfQPiM2/2UbSBGUQbsGp1IzGrTnvPYOVIIe+rn0l24IMkOTcNuXRN
	zvqxhpB3jT8zOyDb38C3jJwfDKmPWeIHz7OhLJVzmMnYloSKbUmCOSwtIlVrjzeSMh/0e1mY4uC
	a1aRaKX8AAYKboh8/xASqKYQUbrJQbh4Faz1LpKaDMcK/crpPOdBsTe2ICoelaSzcrDjz4VC2Ng
	0CaA3pbQ==
X-Google-Smtp-Source: AGHT+IFY+Z1hsVNocOJg3NO1dMXyuSIVF4z5Hq+Vdu8X38RpK9J7FuZL5nWRH5tcw+Lx885k5tTgfg==
X-Received: by 2002:a05:600c:6d56:b0:479:1a09:1c4a with SMTP id 5b1f17b1804b1-4791a091c4emr4042835e9.31.1764330268163;
        Fri, 28 Nov 2025 03:44:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm89888445e9.1.2025.11.28.03.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:44:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Nov 2025 12:44:08 +0100
Subject: [PATCH v9 10/11] crypto: qce - Add support for BAM locking
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom-qce-cmd-descr-v9-10-9a5f72b89722@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Udit Tiwari <quic_utiwari@quicinc.com>, 
 Daniel Perez-Zoghbi <dperezzo@quicinc.com>, 
 Md Sadre Alam <mdalam@qti.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4359;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GYMvWd4G2OtMriFfOvACVEj/3rVgLKC4UYGoghgUhI0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKYsKPeo2cebRHz/smU6qyWPz+EA205XyjrMye
 TGvcJ4alE6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSmLCgAKCRAFnS7L/zaE
 w78cEACGsGB8VrsYSRk7Htz+ngRasAWx7hSIWcx0SzmZX4Q/Ot0gNhZ0wxd6/HCKgDiZbKexEUI
 K+wir4BZdm0/TMOynQL10S47WqI42vcFqhst6dkQ7kJqLdmh9+cbCgO99RCT3MP6TUh8/b4hz9t
 ey5WqZkW1HXo682CydqukZ9DTzkV+Umzp/JnwPHDnjkOI9Bi9nFfED+1Mqcnf1K7ztlXNOlqoLL
 YrRtobLM5KqvGUFMEAoULNlubmv08Zt1GhsHT0TrY8aWVYJrvqSD1F0zSeySREivImmc9Qy3mKF
 USLEMI0TwWDm1Esj486MBOG+bVKKmH5xds+nMEoxaDiVtL9Kp95mPIbUk7rLMta1t2a7OXAGyP6
 Cd+9JgU83Rj9enfAmR7encxpBwOgw4Ma0eN1eKCTpKvvR08uzQDhMgrmVYeX8IN2l2iY3wiseXb
 cYA+AekmsrClCitQIkP7zVSTQFXQvI2bmnb0kQuS5hHNAALI13TWYbt59K+doEMr6t4PLwnyUiu
 KETDzQNbN1dkIvhJ5rMhkQ+o/lrvy0KNDE/zwtusugIuyZR/iTIPJ8mizFuU2GZt3rBwuwMbxXy
 ZplfO9G1FRIcDRrVBv3DvbNfeXigSQvcjx1QF9pfXI+wvwhWCr2b44Hjh/OqezfcrLBBypdf64m
 8vCsrZGFMr859wQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement the infrastructure for using the new DMA controller lock/unlock
feature of the BAM driver. No functional change for now.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/common.c | 18 ++++++++++++++++++
 drivers/crypto/qce/dma.c    | 39 ++++++++++++++++++++++++++++++++++-----
 drivers/crypto/qce/dma.h    |  4 ++++
 3 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 04253a8d33409a2a51db527435d09ae85a7880af..74756c222fed6d0298eb6c957ed15b8b7083b72f 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -593,3 +593,21 @@ void qce_get_version(struct qce_device *qce, u32 *major, u32 *minor, u32 *step)
 	*minor = (val & CORE_MINOR_REV_MASK) >> CORE_MINOR_REV_SHIFT;
 	*step = (val & CORE_STEP_REV_MASK) >> CORE_STEP_REV_SHIFT;
 }
+
+int qce_bam_lock(struct qce_device *qce)
+{
+	qce_clear_bam_transaction(qce);
+	/* Dummy write to acquire the lock on the BAM pipe. */
+	qce_write(qce, REG_AUTH_SEG_CFG, 0);
+
+	return qce_submit_cmd_desc_lock(qce);
+}
+
+int qce_bam_unlock(struct qce_device *qce)
+{
+	qce_clear_bam_transaction(qce);
+	/* Dummy write to release the lock on the BAM pipe. */
+	qce_write(qce, REG_AUTH_SEG_CFG, 0);
+
+	return qce_submit_cmd_desc_unlock(qce);
+}
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index ba7a52fd4c6349d59c075c346f75741defeb6034..885053955ac3dc95efefef541907f57844b60a3d 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -41,7 +41,7 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 	bam_txn->pre_bam_ce_idx = 0;
 }
 
-int qce_submit_cmd_desc(struct qce_device *qce)
+static int qce_do_submit_cmd_desc(struct qce_device *qce, struct bam_desc_metadata *meta)
 {
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
@@ -50,7 +50,7 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 	unsigned long attrs = DMA_PREP_CMD;
 	dma_cookie_t cookie;
 	unsigned int mapped;
-	int ret;
+	int ret = -ENOMEM;
 
 	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
 				  DMA_TO_DEVICE, attrs);
@@ -59,9 +59,15 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 
 	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
 					   DMA_MEM_TO_DEV, attrs);
-	if (!dma_desc) {
-		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
-		return -ENOMEM;
+	if (!dma_desc)
+		goto err_out;
+
+	if (meta) {
+		meta->chan = chan;
+
+		ret = dmaengine_desc_attach_metadata(dma_desc, meta, 0);
+		if (ret)
+			goto err_out;
 	}
 
 	qce_desc->dma_desc = dma_desc;
@@ -74,6 +80,29 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 	qce_dma_issue_pending(&qce->dma);
 
 	return 0;
+
+err_out:
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	return ret;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	return qce_do_submit_cmd_desc(qce, NULL);
+}
+
+int qce_submit_cmd_desc_lock(struct qce_device *qce)
+{
+	struct bam_desc_metadata meta = { .op = BAM_META_CMD_LOCK, };
+
+	return qce_do_submit_cmd_desc(qce, &meta);
+}
+
+int qce_submit_cmd_desc_unlock(struct qce_device *qce)
+{
+	struct bam_desc_metadata meta = { .op = BAM_META_CMD_UNLOCK };
+
+	return qce_do_submit_cmd_desc(qce, &meta);
 }
 
 static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9..4b3ee17db72e29b9f417994477ad8a0ec2294db1 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -47,6 +47,10 @@ qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
 void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
 int qce_submit_cmd_desc(struct qce_device *qce);
+int qce_submit_cmd_desc_lock(struct qce_device *qce);
+int qce_submit_cmd_desc_unlock(struct qce_device *qce);
 void qce_clear_bam_transaction(struct qce_device *qce);
+int qce_bam_lock(struct qce_device *qce);
+int qce_bam_unlock(struct qce_device *qce);
 
 #endif /* _DMA_H_ */

-- 
2.51.0

