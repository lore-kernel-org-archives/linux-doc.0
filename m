Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31F313525
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428878; cv=none; b=NjRHuKomlcKOuBdKkLegDc0pnElPE/2i6q5HjfhmU+SiGYgUH+0pBJwzwGfcAtZwPlbW3VQdo3pCgyGg5cL64FC5ROW2wSH+FNwVFIB4KEe93h1+zNNMj7rbvBs+l1mkap/7QrESQqnmLrw8clxnWBWQTVM1OE/Ip7UMDDj76JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428878; c=relaxed/simple;
	bh=UrblnyBIttzcib0/BvvP1++FwPrIsvbI5P5xtRb6gow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUKn3u+hZwTPfvteVCF1ZJ5v1sD+Et/Z5IK5ITTAGJbLY8GU1Cl7EJcgViWl+cZFymEeJymCpJnYc3mE0tKchIFXnSe5G9PVB3zdfpCP8784IsHiAcQGap6uhBOwW+QanGCs5wSSkTkUHk59z6k7ngN8Chb34IfLw/+0HGkqGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QVIcyOzG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QVIcyOzG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429bf011e6cso855331f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762428873; x=1763033673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyKbKE6HNdqQ1WAeibtxjl163+kRLNcqsxLc6zP9YwA=;
        b=QVIcyOzGnl0dP3C7N93mZIA2Hr1Xa63PsxwR2+kY+sD/3kpKVmoiXBLWxNrLbaxJXT
         7V0VKpy2ZlXBX5DbiUvpjRsXbQwuhYmxmnKFJKtP2sDoNbmZOUTVWteslE/v1Bjn4waX
         XLvS3O62mhTHeTgjxrWClatLSdYmp+BfAw9JzA2OD8wsCULHeB20HpAt+N3hRTzirvTx
         MFMf4FXAkwrCrosSzTjsIDLQOo5Kc9Z0H9FtC5vKTj8t+WBoG64rM6JW6gbe9kU7YPmi
         TFtc/pXftaiF4r+NtKGApao0bFU2UUg2FeL6q04YivYxf7XmxAV43OAws5iRUz/AUTFn
         Qj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428873; x=1763033673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyKbKE6HNdqQ1WAeibtxjl163+kRLNcqsxLc6zP9YwA=;
        b=uY3iUkiltNvp63UrnNaehZY6xmwvMy/DylOf1Jn65dfzH18XHHDd/mZVK9w/BxyH0h
         Vz2BZddbiueFivGJFD7XM/MOa6RspEAPWVQGonS+IER4ycmzrffNodN5/FA/wM2T8ooM
         +3BfF/dfddASGOUpMd3hwLz4n2r61PZA3Zkf5pSDGEHB+ZXRjF6TWcfzezHaX5TJ27mG
         hkLaN1wuXKmjSnt1O0rkKyuH5qc+7uWDtxykSJ045PesLw2NkW3zCp7iv9gkidQZmAAF
         +NKpT25ZXB4tC89rIc7CqjN33Vbq0aaK43beIBI83WBU0+T+wPYLSSAiCnCZsKkexg7p
         rfKA==
X-Forwarded-Encrypted: i=1; AJvYcCWljm23NEdJYu2pJIi+vL+IfenG5fAdCTKUskLXcdtjFVU5oebnaoJ9RJcnClNLEk0fxp5/NZ21aVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIcMQyMjSo1LvHQ+OyU+nLrQO4cl1MTaFFG7GE6EhivYAZKZrm
	3bFWIfzuU+ZNvJB3zibWqmlvzOPkpTytLlwx+u2180WL40hsiHgXXmKswB7P9NUDjBM=
X-Gm-Gg: ASbGncvfmOlQ0EFxqNXHFXs9rV96BVgA4NmEa4OfGvl456go6HXIieERMsFcKMnhCml
	w/B3KnxEc1fic64RFYoxVHCe+6D7Umdd2Wzq9sBQEb8zbZmMhDTD1jOec8Jhv7kZK0CdWwW6cWG
	dbgEqJlBPXmuI0ZI+B+2BvP/yzZpK8TfgEIqycJyL+sELNgxnCM+N5xEgLzCnwU7Hn5na2WtgWm
	mfgDQ42j0v1D/O7Jftak+PrzOWmjELXf0PZ6Luuf4XRECIajAFFiRluvmA1AV+ps2mTZLVh6TSt
	xCDaiMIDRadnKH3m/Vjei+N9hH+lipTsXhLqxMNJcou5jWy+b7ddbj0KCrzIhXW1DVX/HfPTdiI
	+UAMKMimzZP6e3mSbAA9SD5EQ6e4Az2rf7YS7ObSZfFChvdTkk7OpH5IXMNS3A2alxfeptqJicV
	knDGo=
X-Google-Smtp-Source: AGHT+IHFVmIJFpr/sCySD9e21eB/F2TWUEf2qqi3YYHg+Euddx38s/hI+PHYSUd6bW1lUl2F0o/yRw==
X-Received: by 2002:a05:6000:40ca:b0:429:d48d:acb3 with SMTP id ffacd0b85a97d-429e32c9555mr5921176f8f.5.1762428873307;
        Thu, 06 Nov 2025 03:34:33 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4389459f8f.9.2025.11.06.03.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:34:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 12:34:01 +0100
Subject: [PATCH v8 05/11] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-qce-cmd-descr-v8-5-ecddca23ca26@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i+tVIr2T2657xahpuTvRyQWsZa+C/XB6HLztempFcdg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDIe8uihwYybKFVHj+4YJOXsIw86m0EaVVFa5e
 XDJFWHf0gmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyHvAAKCRARpy6gFHHX
 cnMvEADTLleUP6JoUy0i1pQeWoZvPwWRB1cdePDuITBS+1QQecce2vcar1o3uvGtcptKfAwrZqD
 cHgghMMID0hTz4zOUGfGM0ipSUEDKZYpT/k6w7UXust5mHdtiWLvGEYUZQxR44Yb8H3QfUv7I9r
 tXKdvIK7hiEiELHsV2U3USQq7TbVdMjHSPFJss1l3kDHZJaaS5puYWb5ghL7DbZqxjth3YXqK55
 AljUAGw534t5Ae84F9RsdycGgRt7rmA1UXDXGtPpzx0ZarpTANT0HYdbeqAAQJ31dvXjp5EwJGV
 u8Q4IoemghyGZKzvZJ3IcKZTCIxreN+amXiJ4E6Hw+QjkNsGvP+pyvD5Xdrw7L8Cktq7yDrAgI2
 HjJeSLsV/TqiC84Z3eC4bNPTlDMTpCOKyY2O1GBnqwFG/ytkbdXTnTQXBgeThuSXT1p3/pQLR5s
 JqstRLfrinJ7K2JaN3B7/NNxf4FuxxZ5rjefBLcm4xY/eTD8//8SyiQp48MJtKE+h7lshC6MdzQ
 H5icwAnkVvLzvVfxKO7lNmDhFcqQIGjC2am4a/EBcJEF572yvHb81n02a46hvSn/rDsOgLLuEyy
 yoVtFpduADecCj1X4MSj1PxBvO8YoWPDi3UyqLdR9gKWWbcj7p54m9bgoGTlrsIqBzhsrrVfWub
 gl6ZOwHpdH9JoMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 1dec7aea852dd91e4b2406f5418c0f533731b8fc..f9581d53fe4033aa1982964d1038097fff0e8250 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -39,8 +41,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.51.0

