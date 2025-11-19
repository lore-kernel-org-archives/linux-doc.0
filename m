Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3E23A79CB
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567167; cv=none; b=rO233QWq3jSKSVYz5IkYs0TWOdWaxsanl+3YJxGlAu621oD89x7sqn04A+FHbvZfQXquwitETsWEP0MY1TIqwY2kEyeAgZfRzWiGo+B4E5gALbSO/KqGjTb+TRYFcij+CvlvE8h3tV+4pUNQk6a3CzGBwW3xXRCHcr5PzzdtGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567167; c=relaxed/simple;
	bh=BG5tLoxomZq6QyZmtX+DmOmp49QzG4CslaIEh2rN2og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOf2Zg9K+xMlPNb487vDE77FeCLfTB2IVp9Q3K5jFvbqvj6VsF9lA7ameSqQL4WGW7v/34HqygvyULDi07A2pikQztwHW6poPXUVzOi/Mm094zcGn3PcmHCIeu9wov9k2JAqGc3M04+PtRkFw5znctEbjwPyAoQkzn5HKzHcZ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h67n1qs9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h67n1qs9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso5105477f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567159; x=1764171959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqVd/I23ujzds6aG+1Lfyj/OLmPD/Ehk8Zy8jv9bGeE=;
        b=h67n1qs9Ihf0s3aPMinZSRCAczRQpw45ihMWMfjlNIvhknSfGnG+w+mMTwEi2c4pVy
         DL0+rKrt3+DReC07qFokF5Zkip6Gxvmbs6ndgMAcyZWTrgMwyDTjzLCMzlMYA9iEa8Sp
         Qtv3Ml8J57ag90nIHGke7OMoWVl6pkSuHd+H9mOYHRulvjzQRwMtGgelh1C/+3AXs0Vp
         mPSyP3aEBR4pq7oTf94IHwIeM5TfZSJDalWq7B2Kt327N8QvEp4zkM/wHSsLopjX5SEg
         6CImGXk5cI/2l+iH0yRuOdj8QppJoe8lro4QThyAmtoqPuVU4Oz9R0Ce1/nthGUifyJ5
         gWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567159; x=1764171959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqVd/I23ujzds6aG+1Lfyj/OLmPD/Ehk8Zy8jv9bGeE=;
        b=Ctd4B2+/QdNLjygq0nAgBE+A+izwVubomNcW+5fPCZSeejCBncp66zTSKB6stzCuJj
         IC+Hm2r9R/qo8MQD04WAVIi1q1Nb1m4zuC58ROeGopUbkm5G3hkdA+5sH/mnRNQ43XHn
         8tTIRo58/+W9bIzbzKv1mJ0w342eEvd1qJIfO3cIqXOOy0fsJ8LFyBodkZD+NSbdGuDx
         wbQa/ijVjTWhMhEIviVAO40Gcl3ZBe04xV4DEYNAglgo1XGxfPKlcwG0foWIPH/E1YiC
         lF7Hu35jN8mnmxg49o94LqyAQIEMU2/pkuEkF5eKqFQXCtDzItCftf223S2O8JHAWoNW
         KkGg==
X-Forwarded-Encrypted: i=1; AJvYcCVSqTD0WMXfZ79uPqEAqE7VGByN/aEO0pN7fLa6lk/JY1+DUIWZGZ9v9RX/5AdyqR61i63MFdW1edI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2pPP2E1kH8EOBRCf3LqqtxrGmA0tKTxqVjZ31hyr/bv1Idqn
	cj0dsaDkk6meOECZBDcMpQxRYOT7iND2gtFqLwW2OOSggwppvPQEHs5HpCOa6n8lmEs=
X-Gm-Gg: ASbGncsxdsDcRiTR9KCdEt/9FoDho9lFQPy10qFmpjd/83gXsqMVEl0xTxHZYjCt69N
	DjvrD4IfONpTtSfF1V8Jnp0JjFm2rlhWtF8AqUAFkp+G7qLhrO09H8GbY7i7u9WisnGHABgZAQi
	eGlX/wv1deeSDEaS5tDMe0/ek8tW71fK9s19VMip5hjTBqE7XxPSLeCJV5Vf0ONXiylgRsCptIV
	8ee64AoHx9fk/gMGR8WR7n3n2Mb2b9JMVQc/aRINU0amt0ed7eayW4Ndx2EW7VOduyMotxOI8lG
	oxyWo56bfbEdp/5SqQUAdO+F8NGLJ6eS3xQ7H3Um2LeO43247zgoXVs3Tjv2FYxSHmzyWEJ1RC3
	nA0EZr6iAwM5lbR71ssEQ6BUEDqpj+KEJER1k9mogcQZBGQRoSfb91v/qnOyw9wZIrGf0zdJUha
	W4wPpGarqMF6YXT1N4bihdRsCql1lbQg==
X-Google-Smtp-Source: AGHT+IETZCFytuhcxmwyAYMbvVQ+k0LcHrDBKuExYdhaEVzislepliPqczS5k/WGmFJtVck24Vggmg==
X-Received: by 2002:a05:6000:2405:b0:42b:3a84:1ec3 with SMTP id ffacd0b85a97d-42b5937ff2emr21375859f8f.29.1763567158737;
        Wed, 19 Nov 2025 07:45:58 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:58 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 24/26] soc: qcom: smem: Add minidump device
Date: Wed, 19 Nov 2025 17:44:25 +0200
Message-ID: <20251119154427.1033475-25-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minidump platform device.
Minidump can collect various memory snippets using dedicated firmware.
To know which snippets to collect, each snippet must be registered
by the kernel into a specific shared memory table which is controlled
by the qcom smem driver.
To instantiate the minidump platform driver, register its data using
platform_device_register_data.
Later on, the minidump driver will probe and obtain the required memory
snippets from the memory inspection table (meminspect)

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index c4c45f15dca4..03315722d71a 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
-- 
2.43.0

