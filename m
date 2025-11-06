Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFEA314A90
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428881; cv=none; b=klqw4x/XMvKip3yfltw5O8YECZjqnwpIqU3MNJwmMk59KWfIlVOqAcPozEgKsP6K1HlyYMiPOJSpycveMK+KBc+hjmh082iwoEy3C8/KGi6jyc5FjGZJAcWEqkGhnP3dAZSNR5gSjVYTD2GiZx5ua+yZurFR/9tTRtCERVYip94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428881; c=relaxed/simple;
	bh=/4QBhPILX+5X6ezhag3LzaL8aK4X9XYd5TN1S9llZuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+S7JHRj7jKN5s622VE+oBz2Szg/EFESOtWqGBO5sD9W21XGvrINk6DCW9CWQ9cJqIiOJ/3khZ9ymdN1tfKzze7RvLRVy7YfQdmzeDvH1X3WmdRFue//7Wu7QGaAqLB6LLIOcrB6R8lMi9nTTUqud9DaQfmmyEvqLdq+8jyL5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cozPM+gq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cozPM+gq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47109187c32so3824535e9.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762428877; x=1763033677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZCZoXJ9tyVK56ZhBsaXTFl9gWPV9NIZVv0TaZjVvdM=;
        b=cozPM+gqPF257/AAvUHF4OUxs9MiaUza0s09GA/T2VQF+ZDJfF+s4G4mFRla2dnico
         2hGpS6k+8aqcy3L2Ye8kxwNnh6/n97WFndnKlZQfXhUyPejsFPKCBKXjJKcke85/zH1H
         YvbaO5vw8S+0FO9zHLCgjK/EVp8wuO8aNKAiOWM/bMX6DOnjHs//ulByqcTOPbWMdrvk
         TUiV74CdJCUU6oYc8hf1ZXHsSR8ISskjKSmSgfhPJS0Fqhj+HrGKVC2QXB0jeTCWFjAc
         R16U528dhCp3nKEEySIzWXmVZp+zPCS4gqWphggPx2hl5yZ/BS9U2DoIBgKUPopZVeAC
         DRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428877; x=1763033677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZCZoXJ9tyVK56ZhBsaXTFl9gWPV9NIZVv0TaZjVvdM=;
        b=C1wFm768zGqtrBbO9AEd8Vxuzs53XedsABxzJYqikqX92ms7nUH4Ki8yZ+CcGaicwj
         5DSWKgXH3lMoeDOf7yi1VS05fAC/CC6+l//Lpq4TwtcP2rI10ngrrLbPhFs3X9pWt+QC
         vm8+LbElSNMcQHzYJ0FQ6G+gO8QT8O1026pI4HSRsOUOgKUBvdw2SMbVt+NysU6uU3ly
         9a552tp8MuK6HB9gzL6gjvhRkd60x/hV2jIpMWyJZkg3g3SipI2atsWnIhVT/h7GlDx9
         pohDwO4/+M7qsOun3QUjY8kEbhFOXUpAp2jBGpOeLKFLWEEkBRAvzwbqgHVuIkkxNOzC
         KPrA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Oijb5zE+FLYjDPG247LIbKKdSKpIHi9HNh+fz8vMzsj7bWUowzRcNwyBzlWWGPXa7bg9ZC4L3PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEVG5YgfAG4t9O/57P7SpHuBVv0xdKQ0BMLI9AOaGLY3Rjtr8
	JeJIwQpncnzCUpryxtmp0961W++/SIiUvvOHZ48/fR64fUaeqA0n7funLKTVy62Tyw0=
X-Gm-Gg: ASbGncv9VZPdYDuILm+NWhh/5GvdmhXq44qzzo0pUI09rtEYfTxkbHW9tzSuC8riAY9
	MMaiw3/lxamRy13kJUyf1SnR1dACpvWLvgs6aGiHb3m3WHVS/JCRSxQ+htnDr9giM4UpZuZhugC
	MLaGH4rXux7r6WlruYq4DWgMkuJs1srTA4EE3Tsu2VHPyVafcCAl7+wGe/YTM8sB7PWLWAuBT5u
	VrDxHCBxOEuBkcHYp9LRExEXQKdmuF9duvQm2PSox2R542Mn687RTgnoRFNmJQ9O8617RizlNbC
	NM/wor5Md3vj+h1WY9HNf6K5zKO0mV+NMKDjkfm/pGJFbIN9qnhl1lnsyu/Mb9sBLnZSDxf8uyU
	ciEPtQnzzbQBrSTeHfPKCoeG5o8yC1kTuAnxosNSEJXf3zqeI//J3dmH3gDDFZp/5vY4e8PQqLB
	R3S8Y=
X-Google-Smtp-Source: AGHT+IEoXAUh9y67MgtZ/T4+RHHzxUkHerOKyg5NFcea653MMAitTHLap8TN4SHlWCmAxqH1lFJlTA==
X-Received: by 2002:a05:600c:528d:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-4775cdbe164mr62433665e9.4.1762428876702;
        Thu, 06 Nov 2025 03:34:36 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4389459f8f.9.2025.11.06.03.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:34:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 12:34:03 +0100
Subject: [PATCH v8 07/11] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-qce-cmd-descr-v8-7-ecddca23ca26@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KihkhkXsgDZVFVp7bMRhRGSm4F/l7kYDlH9NjlkYozI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDIe8Ry42D3ryUjeP0c/0Pmqoo9z4r8wyiSqXR
 SFSlEAdOBSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyHvAAKCRARpy6gFHHX
 cqF4EADO++008kQ6Q9EDWBZgxlmhMZczuLDY93SmZLHXETOPEMuKPH2bcqkP4XJ0tjidhHLsrJu
 SZLvk/98dkqELZlj9RE6wdE4r+BmgqFlt7l/LxhhCkDLxoC47Ngi+XsQqxG68SP+RnJOjxdQc/f
 wYpSlMwh+YH2oJ4jI87elMTWEWlH/4t817TWLTp4fUnDFmpKSiv+LZ17fAsJUzOxlK68/NUovbZ
 s3MH/9Z5JIXVD/npEUUTrehWYIBybRRTeZ+svv4RHQ4xZr7DyoszfO7E+XGoPopxta3Q54x60Jr
 QgpV+SNqpf6VKViBoxMg+9hzh/uRfu+K0PcesR2QblmkuB64DTjxb+kB/CaVY7LOsZ7k+YPDkmB
 LTD5WVP9wvlCZ5uWwqcMSQK6IIC1chxJjdne5bzVwyuK8BP8s0pl3lQS8uiRcEraD6/O64w1Vky
 aKrkQRx7J4UrZUV7vwUz6NOGMC/2jE6fBGvieEpk9N8zHbqiHGm6fJNy014mxwQhTnFJoM4anmC
 o2SZh7XqPHrXLlN8Tk6PJnqo8gjojBGIY7aF1QuBWEaKudcfKkMJyceOHIhOTMXBFiX7MujpA4M
 /hhQ9G4+TZDJijq0LnhvBPNCjAA/FfmwjVy5T8DOcpi5lm0+hFLvEvXZdd68hslsmL3XgqkFFx4
 dDGrrcS1dexY/5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/dma.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 4c15dd8bbeb85f6ac0e463d7b9eab70faeb2be94..bfa54d3401ca095a089656e81a37474d6f788acf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,45 +12,24 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return PTR_ERR(dma->txchan);
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = PTR_ERR(dma->rxchan);
-		goto error_rx;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return PTR_ERR(dma->rxchan);
 
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
-
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.51.0

