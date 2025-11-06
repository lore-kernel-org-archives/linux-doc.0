Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED831065B
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428872; cv=none; b=UgS0AsgAYmpRrFlP5qjQJyZP4hAct1cTQcpPuCwoGhU5zUzekbkwD0fgFZCpPJM2x6zH7ma9jREfeYVxpsqgL48RL9o8XXMyvR9rBBM0nFe3fFiO7j0cmApVIK3pYQyXTtzBu1b54PzypvNpqyHDhwqPWlhGZ6ybNDEhMgsjIGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428872; c=relaxed/simple;
	bh=a7wQEf6egR4mPuv5cdjgCNZ6WeJSo3nSIgoNmPEuE3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gec8JjSKtd0d4X1s6DNjfGWKFus4JQYfmvUhpF4jeqFTWTr0Zujy5ajC5GtEeMHl/pvVcZJdkX4b0VOOMyxMPN9AjVcyO1iFKLyF66+CYrEdgP2eHyL7dTbQ9eF+UrWdz6aO8+vv4xtM02E6fdj7OomFEY7rZNBhGdCuAbmAcqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ma5hXJlN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ma5hXJlN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1110081f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762428869; x=1763033669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PD+rs5pOYQ8OCsF4o4tgFNdDCvK3XuPAT18E201qmow=;
        b=Ma5hXJlNfP9rAldaxbjYNN+Y6dJsEchEFnZMhMp/wzb74Nx8BUGeR4eonGeYeLDRzn
         s9Ar62qlMUQzWN47RiKnvvoIBhDSIrH3MPFiav7i/J2AMnv36NL0f5e0ETQElhVvbg8y
         NUeHGBnq7mXMpEST+vVzfvefTLif0DD99K25LOcGSzs1TdbsLlL6GkTXVKq7vCCQsIGF
         cfPHKCLf28sOXyGLFaIxsRgt3YolEE1HdKiSRCdOOwFaMHBo7yX6D8RCOxNpQuBnrmrV
         u737ornnnETJWfddlzyjIo5DimeOrzWgCjGJiwUH7wi+WSCRcFx6dv3+hM0qqX2TWOBH
         B6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428869; x=1763033669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PD+rs5pOYQ8OCsF4o4tgFNdDCvK3XuPAT18E201qmow=;
        b=kA30uf8OPbsONItVYLvK5HLrLtJygOa41heBckrF14EjgezqEm/QwGG8gQJ1TeUL7a
         fVCvYAfdYdFrDHIiu2cbaYCt2gkLlrOf6aL8oL4Q7VcyE1mROi+SElhFzqockr+/MwuE
         e+q3Fprz+HIy9tEUGCRjraKQAcCqGfPWf78c444ocrjwksSTBlJ2PodjOWdnwSA5gY/f
         YGOtDXRuQWJhPl1Vgm6lKTC6EkrPDp/n1Bo90usCf+2clNZ+4/QiNFQ5MoOOqwSuOb/T
         2euSnLc4pqwnd2ZvlRZ8zVeOcz1fd6krTg7EU4xk3x+eIne0Dr/I0Ziqwb7d6vuvr381
         jyeg==
X-Forwarded-Encrypted: i=1; AJvYcCXHeVqxMGH23NuZEMUp5d/kN1XCTRi3Hwl0DSeaV/3EvbyvjGS6d+Okq4ONaXCrrSyx3PjdwooLgdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGTF5q5mxhMAi5oadWRz++sgQjwmjon//gMKIQisFKU/3jic/0
	QCjxZkx1UA2JdPl3iRMd9yAj6M5t/pdReJwG/VhG7YeBsaAmGBPdJrT3ZyVzt88fiFw=
X-Gm-Gg: ASbGnctF/zx/Eu/j3in7FU//2iitN2Po8wiyEcMJO/KDbWFQZnTIIJy/UEgtjfcND1y
	id0iTr8t15ypxAgik+1ZEdJY/DhWLQd5dlZH5ihyczTNz3i/m0+SGGJlkiZSjCoPrcVJDQaJgKW
	5W17TP4Oj45rLNni7UMidN8bqg411ECCJqAIYlKoLqVlo6bvSygcu8BVmIKIGzh1SknvFfefXA4
	zBFHMlR8IXwb0oCVwy7DAPujYYLHYuenT7Ef8LBeQeTLB93Zwk/i+powg5Y3tSGTlmGT8DQJ2RU
	NjWxop5rGtuDTiFsz6SXXoQ9jU4jqiubcDZWxBKRsqphOV9hkx4BjjGjcxxr3P2l0SS/ScBSZOC
	BArJowbR7U92ZIGqcG0wIdBxiIrvSPEoIAUeUSUubWmVe2t/S6YX0rxUSch//WQs9WDID9V1iZ8
	aJCMWRLHGWmBwurw==
X-Google-Smtp-Source: AGHT+IFgtVKctrlOuzKQectqSEwKB2ayhahJJEey2N61I2W/lfSJB2I/53UnlfLzRQMvbCarVAJhsg==
X-Received: by 2002:a5d:64c4:0:b0:429:bc68:6ca0 with SMTP id ffacd0b85a97d-429eb12fb84mr2538324f8f.4.1762428868641;
        Thu, 06 Nov 2025 03:34:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4389459f8f.9.2025.11.06.03.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:34:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 12:33:59 +0100
Subject: [PATCH v8 03/11] dmaengine: qcom: bam_dma: Add bam_pipe_lock flag
 support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-qce-cmd-descr-v8-3-ecddca23ca26@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3204;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qu1xfYVQtzlM9Gqzgkm1BqB5ZitfYYPCUMV4Og+CRDo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDIe89GdN/Ar44t5r8WnhaHrBfOPqYa8CKf7cs
 8exTYFLr9qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyHvAAKCRARpy6gFHHX
 cqW2EADe+TsFJg+T/SYNyFg8jW7yGLupg/8qCkMSkRipiwwmuO5kMlhyTmSTWIb4cBBjjcXnyqI
 9iqwPS5Rl6+ZCdzHSJlhhGJTCbeMcraPicuujhsUjSFle5cb8M38heAJ2B2buD/2TCw/+oD8TZ6
 IeujESttv94uaR5D+8wYDT0SkrFxWnO2oJdEqoZ42w+I2CnIUoNkxEbAErInw/GbClt7CUjP+ys
 wrlzkgXZmx3+u3XZHftUWg3CkqC/IbQofwY6n/naqiIAWCsQ+QJqu/1w4sQBO/xQyEHoes5HZmV
 oCDJ3BJa+XGw9FYKD6NgxySFr6pE837fWhTCDOqnJ3JSvCWFxJtN+rs5f3rg9dqIiQBMWcburH7
 /vEWzjWcFS7RUVQH7D8RSypiAqUnZu4yyWvVtBq9wnwVjC3Uy/RNE4sqpgkQKdbvMsDETxrQAOW
 ahSW8FjL8H81NS3eqfIhxN5Vj+cFNMeo+VUdIyDky2XDzYG9t88agarsN6/mifiRT4CyDPrsqo3
 DV8Mg0qcZkAutoOkdgLS0ZGIjcVq/s8kzudJl09WOD4BgmJbdvFyg2vFAbbbHSDy6rHnrLiXAzV
 xvkdg2Ka9dm0mI+ZHmNJBzMrarkWX+GdTQLbbUSSRZ5WolvZJrP9hwl4udloyjQ44BDbSphivy3
 xxHtuqNAmDmKe6g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8861245314b1d13c1abb78f474fd0749fea52f06..68921d22ad7abfef7059b1db78052ff48e842952 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -58,6 +58,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -113,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool bam_pipe_lock;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -179,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.bam_pipe_lock = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -212,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.bam_pipe_lock = true,
 };
 
 /* BAM CTRL */
@@ -386,6 +391,9 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* Is the BAM currently locked? */
+	bool locked;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -667,6 +675,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
 	struct bam_device *bdev = bchan->bdev;
+	const struct bam_device_data *bdata = bdev->dev_data;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
 	u32 i;
@@ -707,9 +716,34 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		unsigned int curr_offset = 0;
 
 		do {
-			if (flags & DMA_PREP_CMD)
+			if (flags & DMA_PREP_CMD) {
+				if (!bdata->bam_pipe_lock &&
+				    (flags & (DMA_PREP_LOCK | DMA_PREP_UNLOCK))) {
+					dev_err(bdev->dev, "Device doesn't support BAM locking\n");
+					return NULL;
+				}
+
 				desc->flags |= cpu_to_le16(DESC_FLAG_CMD);
 
+				if (bdata->bam_pipe_lock && (flags & DMA_PREP_LOCK)) {
+					if (bchan->locked) {
+						dev_err(bdev->dev, "BAM already locked\n");
+						return NULL;
+					}
+
+					desc->flags |= cpu_to_le16(DESC_FLAG_LOCK);
+					bchan->locked = true;
+				} else if (bdata->bam_pipe_lock && (flags & DMA_PREP_UNLOCK)) {
+					if (!bchan->locked) {
+						dev_err(bdev->dev, "BAM is not locked\n");
+						return NULL;
+					}
+
+					desc->flags |= cpu_to_le16(DESC_FLAG_UNLOCK);
+					bchan->locked = false;
+				}
+			}
+
 			desc->addr = cpu_to_le32(sg_dma_address(sg) +
 						 curr_offset);
 

-- 
2.51.0

