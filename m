Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A92312834
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330272; cv=none; b=ud+ABOaGIvF+tS91v89A97BPdDRYhMwBi8HJLS8o0pBJYzw+4nEud73bFsi/HHTw5lFpYdB3ao1jZX0+WSKLtTOMuTRAkLUVIDeAX2HriBRefBjV2XdPXzx8mAlGB4tRdNjgUSDcwnXyZOR9sFDyw9WfVY83kkC8+irK6CM5s98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330272; c=relaxed/simple;
	bh=J50ZfSZN5RZxI7OX8x2EkRHJY5BuIZYvS9InOlUCUjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oP4ArYM/alXmeoMO83B/+H2bCq+fKyJiLKSITUYc3KxRJeG0BGWPxa7y4gEGbL8FsoReqJQHTGgJ3OOuVnHjEg0ki9JcPIWsuuvXkgGWjswXd0Iu4T9yfCSEKrj0gB12yM9Ty7FkB2HWVQLXjcL+ljPJvXKZK42AUaNEHZLq3jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mh/aCtKT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mh/aCtKT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47796a837c7so11553695e9.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764330266; x=1764935066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpTOo9DeEr0HGOgc0cn1YI9FHxBZdtPmy+/9LzN6f8s=;
        b=mh/aCtKToakOcSeFj1KMAOkXWBTg9W67xK0opdf9nxdepOWs7uQkvGpncwZAiZ+mbV
         E0CficPi+Tgx7qHBbwffufCodGSE3Hitk/6mP8XXT3RB0UWg55H7eI9asgB7UV7+Maui
         lxkQxq8SJqfaopA8UtKM0K5OdCxdThhQuws9RwhsaUXoNTEF3Fxv9HcF91RTeUOw4m3T
         bv/BSekdLOmJGd3FKZEvqA66APXhnQ+bfQR5wsq4hFDJJp4Q66p/M1gC8yvMGPrUjFwS
         xFr6LqD8GdRwEdfxrjbRimX/9eIPWU6aJi4V3SJQg1vi6YsCF48tXWk68jmLl6+qyT8V
         9n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330267; x=1764935067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpTOo9DeEr0HGOgc0cn1YI9FHxBZdtPmy+/9LzN6f8s=;
        b=sfici0taIWSjp/anPhgMnrdnzSx2vBtq9BeEeYCiV1Q/ndI2HvcP32gB3Z8EgCyCHh
         watbyAC45doqcDZsyypBClVioqaI5UhMBySb5GwmVWfgxnnzrTtdziY+9PICsrcRqnLz
         d/ptRtopmX2I2c1P+fOjTKLU1130NS0OiCjgedTfWDCVOpfcAdVNW4cjLgDDIXWc+Xw9
         S+CkTwvp5FaHYEsz6TSDfDq2EB32/6NesmDWE67CfsjMzM5J4HKNFcTeAAxb1wdKxDwK
         X0ScI3QRd9k+CR4mUkvBw9TK1u2gCrPUaUo1rK9u3NgTAXIfcVuZXRazilNLPwhr3yOC
         myHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6n0YSaQ5xQ1+o/BiJT+iAXCAxKS6EsnOv8RilDq0oqQ2esTM4bfsMTZtR8wf2q667gqOl5vSpA4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HCD6nKYYApy/3I6D76CMrNvujYKc84/l2+wwfZYybrHaUqqa
	kFjAcvXagR2mSorNhu0GaTdZjWpJRvrUYMfo7752As5Lmt88zl7NgYz2uIqshPuYj9Y=
X-Gm-Gg: ASbGncvVuxwjefctDRAKYt0ZB/vBOfpQ+dL8cAeTbaV5GUBU9IWENefA64LGQRMWPIq
	I+rVpw7iwBbwTI7lypW/9oxQhgTbFnSPEhXtXIYhihLhxVPKPa0MjzKvZ0i23qpKrL1TVgWR/AV
	7MGj9cyCOrn3o3s7W6goRtpui4wr6/v/E8sB/g2CMxBWd8ojVdMqQpjjTDnhsk8Qk3Dj+ulluaf
	rn3as6IPeOOy0fvsUUw30gdWKXCarEUEq91HOu/7SOmdP0rDJVgWosWx4A54ih9Bvn2pO8uSboe
	68eTW3G7MlflNGz+pMHO9zV+mF4NBjpZW+Y5HL69C/iIvh2yjvRq+9ygX4/5vAcBiwVYHsKkdqU
	/McvD5tkf26zl6EKNwMAyZfdB40h4F5Qj24f/lFFLGDwnLBXuSJ2OBxVphBr+6oSjJf73Zid7yN
	uO7dO0bw==
X-Google-Smtp-Source: AGHT+IGRwFVBtIS14/uhiMzyl0/9sl9K9SBhSDR7J39DwWeob0GHl5nzlWhaJQObZRshnIkcBj57bA==
X-Received: by 2002:a05:600c:198e:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-477c01b218dmr238721585e9.21.1764330266496;
        Fri, 28 Nov 2025 03:44:26 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm89888445e9.1.2025.11.28.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:44:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Nov 2025 12:44:07 +0100
Subject: [PATCH v9 09/11] crypto: qce - Add BAM DMA support for crypto
 register I/O
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom-qce-cmd-descr-v9-9-9a5f72b89722@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6220;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=I0c/8yqrP9v9os34aFasg0EJl+n/XM4dMemH0p2zOCo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKYsJQ680n0oXA8tQIqIrFHqibIFd+QWU1zyxx
 PFgPcW75zaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSmLCQAKCRAFnS7L/zaE
 w+viD/9dhAUXjSBZDjhyEZrpK1HAC0d5kFBZFwjFVzs1+OTlRaqU0GXZfNcXZMSszdgrBCbDOpz
 ArhFUoTxwHn2QsCEESdZBvDBZohahLcZbBWSf9seaTEZwbixtgc0YJhOq5C7SFtbFEGMqnFQa1b
 imjoXrmVmWALawn3PeXoq12fes8i1kzHrigps7k+RWyL7Rotr5fBfINp1XlmIykpQnEZKSdP1kl
 gdk4cHa4ZwLZllJfMlgG59HOlpB4mIf6u6rj6lr3IzkkbxUVrZBWk18g/+7g0LNA8tvlQuSklAJ
 V+EzG114w0T+SFH+6m14YbuKoYEUHnx5cLPyT7J3phz+0i3gndMCqUAf1Dv+GK4LE5oX6IoJWFx
 ZlFUMPXMpqh9+BxuIQFFvrhtc3L1kO9xZKVYIfDhlGTmtPdup/hYq8dYARqezKDmNWVMjxe4psA
 1jxw4kDFomokiCZ7M3W3gO/tbabA0rwbI9DvErRIkODJqzhUr7GQQnMqt2QGSCmr0Fi5Ku9E1n+
 uAMKXMGNvSSBfthRnh/XnH4psoIk710nSqECiVF7mueCznywISUO0c8s8MHGnwPPPHb5VFkQU14
 Ym/uvZFBeLkg+gjHxz38UkbJTfbs9CzMn1Qds5c/i6qv/dC3qfX5VWqzwm6och9UNAljofXJZks
 jMRG2FhLVv9J1Dw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement the infrastructure for performing register I/O over BAM DMA,
not CPU. No functional change yet.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/core.h |   4 ++
 drivers/crypto/qce/dma.c  | 109 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/qce/dma.h  |   5 +++
 3 files changed, 118 insertions(+)

diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index a80e12eac6c87e5321cce16c56a4bf5003474ef0..d238097f834e4605f3825f23d0316d4196439116 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -30,6 +30,8 @@
  * @base_dma: base DMA address
  * @base_phys: base physical address
  * @dma_size: size of memory mapped for DMA
+ * @read_buf: Buffer for DMA to write back to
+ * @read_buf_dma: Mapped address of the read buffer
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -49,6 +51,8 @@ struct qce_device {
 	dma_addr_t base_dma;
 	phys_addr_t base_phys;
 	size_t dma_size;
+	__le32 *read_buf;
+	dma_addr_t read_buf_dma;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index a46264735bb895b6199969e83391383ccbbacc5f..ba7a52fd4c6349d59c075c346f75741defeb6034 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,98 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+#define QCE_MAX_REG_READ		8
+
+struct qce_desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
+};
+
+struct qce_bam_transaction {
+	struct bam_cmd_element bam_ce[QCE_BAM_CMD_ELEMENT_SIZE];
+	struct scatterlist wr_sgl[QCE_BAM_CMD_SGL_SIZE];
+	struct qce_desc_info *desc;
+	u32 bam_ce_idx;
+	u32 pre_bam_ce_idx;
+	u32 wr_sgl_cnt;
+};
+
+void qce_clear_bam_transaction(struct qce_device *qce)
+{
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->wr_sgl_cnt = 0;
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->pre_bam_ce_idx = 0;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_chan *chan = qce->dma.rxchan;
+	unsigned long attrs = DMA_PREP_CMD;
+	dma_cookie_t cookie;
+	unsigned int mapped;
+	int ret;
+
+	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+				  DMA_TO_DEVICE, attrs);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+					   DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
+
+	qce_dma_issue_pending(&qce->dma);
+
+	return 0;
+}
+
+static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
+				  unsigned int addr, void *buf)
+{
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
+	struct bam_cmd_element *bam_ce_buf;
+	int bam_ce_size, cnt, idx;
+
+	idx = bam_txn->bam_ce_idx;
+	bam_ce_buf = &bam_txn->bam_ce[idx];
+	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));
+
+	bam_ce_buf = &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
+	bam_txn->bam_ce_idx++;
+	bam_ce_size = (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeof(*bam_ce_buf);
+
+	cnt = bam_txn->wr_sgl_cnt;
+
+	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
+
+	++bam_txn->wr_sgl_cnt;
+	bam_txn->pre_bam_ce_idx = bam_txn->bam_ce_idx;
+}
+
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
+{
+	unsigned int reg_addr = ((unsigned int)(qce->base_phys) + offset);
+
+	qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);
+}
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
@@ -31,6 +125,21 @@ int devm_qce_dma_request(struct qce_device *qce)
 	if (!dma->result_buf)
 		return -ENOMEM;
 
+	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
+	if (!dma->bam_txn)
+		return -ENOMEM;
+
+	dma->bam_txn->desc = devm_kzalloc(dev, sizeof(*dma->bam_txn->desc), GFP_KERNEL);
+	if (!dma->bam_txn->desc)
+		return -ENOMEM;
+
+	sg_init_table(dma->bam_txn->wr_sgl, QCE_BAM_CMD_SGL_SIZE);
+
+	qce->read_buf = dmam_alloc_coherent(qce->dev, QCE_MAX_REG_READ * sizeof(*qce->read_buf),
+					    &qce->read_buf_dma, GFP_KERNEL);
+	if (!qce->read_buf)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 483789d9fa98e79d1283de8297bf2fc2a773f3a7..f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_bam_transaction;
 struct qce_device;
 
 /* maximum data transfer block size between BAM and CE */
@@ -32,6 +33,7 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
+	struct qce_bam_transaction *bam_txn;
 };
 
 int devm_qce_dma_request(struct qce_device *qce);
@@ -43,5 +45,8 @@ int qce_dma_terminate_all(struct qce_dma_data *dma);
 struct scatterlist *
 qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
+int qce_submit_cmd_desc(struct qce_device *qce);
+void qce_clear_bam_transaction(struct qce_device *qce);
 
 #endif /* _DMA_H_ */

-- 
2.51.0

