Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0950313E32
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428879; cv=none; b=Zu3jGQkDcyn0GqUjIvC71KOa3y4nsuclg6dkQfjxvZrOFVlU9sDtnbnRlOayp2Z6Y1Eawfrjf+uK8oIRFdcMR+1pdS+i4SgnzZ7stfuOau3vW+QFcnDtmVV6Ki+EiwoVblRWD/3QMTb0mMQ5G/HpyEQZPPP8ZV5vpWMgjOeqnpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428879; c=relaxed/simple;
	bh=D9uhShmSvaScrB4GZnuqnNJP9xg1MzacdZg5nrPGQA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lz6rngwouCMcMnvOWGFBCpdPNUZFlJIYKdP25TGUk7bEZGuiKB+qWFcx/PAvXiqy+/R0bSihojVD+JI8AVKpBxII0foLkwyQvSCWW0ksO3n1k6PG+PMNSomS1xox1nw9mDxEo97zO4YkBhNzzwPCRmjeGzDoqtINu5Hgnpz3jQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nQZyM8O6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nQZyM8O6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429c2f6a580so805078f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762428875; x=1763033675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2o6e8yKaUyRVohH0rydhHaeWDHZmkPZViVKmV/j0dw=;
        b=nQZyM8O6V5e/yUHJp43IWavW+jZbNbJkUihtXtDlYbjFHF580NCnriDoKSITggAq4g
         mlfAUHr/kVFr8lkir3R2dsyJ37e2e1D4At4Je2TTwpvkpHJGCO9X1VXkGmrG5vWo23NH
         +OABCQ9ThElRmhTBNGtRVZTSSTwUghi9psOemnvUB8kAyTALE/Smlf4vKfAvQG+rA5OS
         5TXa4R7toUC3lJJ98oPMblBqerheM6Z2i+3ij/2xZ1Y2+DmbtWrfgj++TXoU7UmLIHaa
         fpRWXjfd54r5QRdHiyL3uAPcd3GQELgTgJuI8FwVOhjsMBoGjOwxuoLrcSDPTxw1D89O
         s56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428875; x=1763033675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2o6e8yKaUyRVohH0rydhHaeWDHZmkPZViVKmV/j0dw=;
        b=L1e1DbLVpnQTEGqM/iF7EodeCsIYo66zCQg9Hgj0HJflSLA5r1HxgEx6LB6w9ciRrH
         wpKtwjhFKkwi5yjMe0K+HUbKnVDUdOcxUtxB3EjnD6o6Dop7jdIRImaZ5M3RvxL3QGHn
         DbQbEDQPREdR4g/trufOeFL9hm5cLNmYcZj9OHhakXOTJTqXhdUE9ERYDReIDWXNUk+2
         fYbIF0eVdDUFl4oalPs/w/ayHp3P76yAwWxKsGaYj+ZK2MSRLkSB5tNDzKdd8ZLKqL8o
         Mi3hircpp2aB8GvMIyXk/+SepCTt5fVukZRqKgxgMEyWb4eaXoATIEbs5rmWb6N+vZ/w
         lO9g==
X-Forwarded-Encrypted: i=1; AJvYcCUaB1BROKgEDgzq7XI7okY2cgrjSnzIzEX8VMerB1jsICr0T2hYGYaSajBIcviT1Dj0CXkzKDX2za0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyw7+LuNYs0kYRLag4EsNseaVhOF42lfKrO10OtW+nr/c747EH
	pg90Ws7CJiQyvgKLFLnysQ6fZd/x22MeDnnYwGh/MePhy3HdWmsmRiR7aOgTqdVw4SE=
X-Gm-Gg: ASbGncuUCFJOsTl2WSQ4gvcJKi/waE6C6hY3ETTuQKfcOcqZ+8ugVe+VbgtPqPTyhax
	UfyANCWiIkKNrYUS8pmwvH7XviXqZrfeiL0/PSd9yincPBOp/8CHIR8jVBaJY0OQMCFnENKCLDV
	ge+qtZ2hsY4zi+mC31/z0nzv91QAvkFgTnrPADdEZSmVEh4t0MRh5zMSwA5sLwo5D4G+ZcIfiLC
	PVrcRVxRtCSCWLbtceAFuyMChAbyY28ZjKKbNxJpz1TErtPxobZ5Qy1XS0eK48mBLfCeGeZm2Ul
	N3G+nFqFpwEfxNtLN4oYQ27NN3NfTF+GWTgBRLnhJKsxu0aUXKAQ+Pa19z1q+kNG1qe9zVBVm0G
	mg6pY/x/1WCgvkGNmLdbhhNNoeOYAyI9tbQKq21rgMhkCQn77Uo8gBEmJT5iIUBP04BFgJn9UW9
	QW8JY=
X-Google-Smtp-Source: AGHT+IERQUCsT9/K+EK42FlU5rD13+DKKUBZoGLOBrpfWCcavhFwwhcjhsMGRsrk3LgLdPK4Pnr4FA==
X-Received: by 2002:a05:6000:646:b0:425:7406:d298 with SMTP id ffacd0b85a97d-429e32dd8a7mr5384377f8f.5.1762428875011;
        Thu, 06 Nov 2025 03:34:35 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4389459f8f.9.2025.11.06.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:34:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 12:34:02 +0100
Subject: [PATCH v8 06/11] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-qce-cmd-descr-v8-6-ecddca23ca26@linaro.org>
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
In-Reply-To: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Udit Tiwari <quic_utiwari@quicinc.com>, 
 Daniel Perez-Zoghbi <dperezzo@quicinc.com>, 
 Md Sadre Alam <mdalam@qti.qualcomm.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JYgzjck2CuPcYXJ6P1UUpTPVBg5UfKOlRAlVywM/5yo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDIe8Zb/QqUX5hqxfcaPffhFDw7Q9GIm8ZMQcH
 ee/tj8DmuaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyHvAAKCRARpy6gFHHX
 cvRMEACllNsILUmgwRfS8eXNCjFlp0V4MCPnLNPyzoQmLgPJMUCbVZAirZknewnsH5bxee4LVCp
 /INqNHdquHKRRGb6puJjNDJYY+0wAb45UhHrzJ8eWIwr5rRSwM6UczevsULrota4TrtupoIaFQe
 Ft59PyLP4nZZv9F+SNhUcNU4RU+0RyPmw1nTfA2P7KBE5XEMdzr1amIdJMVvORQPFqWWr4XblIx
 7HI6ojLH/tXB1Q1KgOFTjkwJKmVAjAOIG0SJHmUR7vvOGP/8h9nBI1bCRZUndZutTX4EWzW1Jwi
 U6BPk71QkrFfLumwCbcZZwE/OJddFP9YI0eAn+qMT0A+0eMsZlkQL26tCYq7pURtSG0A3jSjMmj
 5N/rj32tHn6wmRSeGMEM1sDugwuA6319QsnWe0Dbcn3L4g1UXrUSevYccteN+JOkcrM/8at8D4M
 pOJDMHxL2KdBJ1jbJ5jT58Az2Z3dn4WZt1RfED6vNlDSdmwidIXnnzJX1RhsRal7kyJPMxjqgrG
 LyeiAsv2E5b9XKEzqXEShZa+tKC96pvfGH12OCsmUV1Pokd8oFBMjY3CgcU9Q83JHfmrxMbeK4G
 dHmsxZ+frN26A54Ckkywd7N10R4q04r3gp7KJfKAT1JqM/o3cCKxYejIQRNhYuuHtLac775b/lp
 6RdCsyVYicjKjEw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 3114b7f458de0c1cd8527e602b408958f224a7d0..aac65041f585221b800f4d7756e4bf9d9f21d0a0 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -227,7 +227,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index f9581d53fe4033aa1982964d1038097fff0e8250..4c15dd8bbeb85f6ac0e463d7b9eab70faeb2be94 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.51.0

