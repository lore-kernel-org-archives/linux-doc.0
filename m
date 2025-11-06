Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59F130FF3B
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428870; cv=none; b=u84++xSD1E+OVGwdRLMgnC0vzyaABh3qovzExKu0adpT4AMOIwRwEbLwK9bmoi1cn4PPPrl1Vy+YKVwJexot5hgizoX/CZf414wXnMpP5P8a9VSfJIFM6aPoXB69LLDXPqqL/V2HebrlmcTsHM6UFifnOznqjsX+XkTL4dNvz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428870; c=relaxed/simple;
	bh=TUyr94Jtc33qfF1dHLVyC6XEZjaXwlAM1r5rnAPwmwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UzwPgrRbu14jHit0PdGx8Fn8Xx1Be98GaOfpDW5GMlMREnJb8aifJJbfEQCIdBjmhAL8EbsRZB9Xh5dHDVuObEDyFaXhNgO6tWQGEaSFrVLMRfk+aZ6nmf+BXKxz7pN+V6cutU/dYOqhO5NI/EOEx93Er0U8TCH0MttMyOlNVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NylK+gZ5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NylK+gZ5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47758595eecso4454455e9.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762428867; x=1763033667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsLkHPSXKJgPwvxtY/gmIzQjj9kLAJgCqTwY9k7v6bM=;
        b=NylK+gZ5OfoTdc4Golj7tBLUjjhe7YSkgrSsQ6d4MrYCvlaiu+zc8/nH0bAxRrZgeJ
         thI7MjsB30wmQiC5m+YJtrUz/N/1AmZwQDUdfnucBvCiDVX/pMBUqsLm6xE2v5xO3yaE
         RihRtBpOM0qHQ3zh48xjWJCA5ZVYrR731D3FYtU3WLLi1DkqbCkCnCJWDhewnIHLIpua
         bMUng+ZtM58e4fSf0nUYutJa6dFLnoA8OR6FZdEYbLMz/74V7q+N5QskJ8noTyzJLbYf
         J2AU7AebOJYL89DFpHvwVCoyvAYBXJFM2QSs5B7+gPchDbTvdRdguYW5vj5yuBjDoFwf
         HM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428867; x=1763033667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsLkHPSXKJgPwvxtY/gmIzQjj9kLAJgCqTwY9k7v6bM=;
        b=QI87ijWRE4c4uloMcyZJvLKCj309ehm8p1HOViIhYgFTLKehswHE7ZhvfFIFAK/G6G
         Kr7k8tTzA9t7IdLYbFUTIpUVitRtje8RNW+QTvRqjEShMlxt3P8JQxMUSut1GUwzUP7B
         g8FSYKpdazgpOuy901jcyZI7mT4s7V3rqwffDvqfCwcu+LZU3YmnnXc5aAagZeoY3z7g
         HG6Aq0KakMxNO0m4UR8eSMKe2Z2BqE65nJGmt1uIGsdNzHDsDjByAe4d5Hcbe1xe0hSx
         wMdLhj0wxUXWnF42AQyYaHRvj/fsd/pvP80scosRAb0Zy6OIYu3eAyP7tlwcaF5t2Qxq
         sneA==
X-Forwarded-Encrypted: i=1; AJvYcCVDLRofe7IYDBCZlqLhvuEvr/90PlsVgp3zjZRDW7/oc1IPC5IRPFDuAQQMx4gGjBChE1rsrkUpB/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmxDbYnqmxkG846eIL179yWoPjmvhk4UuDcturqQQDvqf/HYo
	lYOZe9WKXXTDbhS638OfK4ag3PWv1PfFY7BUlEqLvnFJdeGG3hFjXUi89nJ4ZaUIq1c=
X-Gm-Gg: ASbGncsHoVdXU+qqkL+nPUWfgsxJDn6Cg/1FF2aL5nM1bMBZuAZzhSrZ2zp5LGiskR/
	NexaGkiueAZR6EVDSbJyha8AX7T3a6nQiRJUCAaSuvogsPGlqUVYyKJbcFPWVBwUtR/U1eUf9aC
	qT2ZAnw+wwjgDEfsFhIjcdpI9pHMqcl1DauasQKxMCswSrjdUNsRon8+xD5Y1AiGton65hgXdoF
	4B1Hhmpx3kV7sQGRJDCaGR3Laesdgj8nmzc6rcHcD59xka4iuE0rXuRr/Bsh/ZBn0hX0vNsuryk
	G33d8AaaXqfDNtzrGiVJ4P4A7yrDukNbOC1JHupT9xUgKtbTcEF+7Fcle4qISSV0NrOSK2W1wv/
	FuspzT02ZUFU2qF5lE8dqZ9azXw8Rnzs14UQvhyicgSzqhru7fFDjKLLt1gpxVGPWj8PHCZFqB7
	nGtuwkuyCVZulv8A==
X-Google-Smtp-Source: AGHT+IFahXEr4ZGh92ZHnLmQal/Sg2eEH1GM9R5Bh/LzSwcu5yEaVd9pf6gSidqfdBNhpyxEGtBX9A==
X-Received: by 2002:a05:600c:a12:b0:475:ddf7:995e with SMTP id 5b1f17b1804b1-4775cda52a6mr46190695e9.12.1762428866806;
        Thu, 06 Nov 2025 03:34:26 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4389459f8f.9.2025.11.06.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:34:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 12:33:58 +0100
Subject: [PATCH v8 02/11] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-qce-cmd-descr-v8-2-ecddca23ca26@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0woh03/bgCFE8ePGo1YBxXHVZW/UvQS3qBPjY4r3K2A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDIe7TuUba5IpirBE/7QlEvE19WL7MjL46Cfxj
 Ixyu8bcGUeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyHuwAKCRARpy6gFHHX
 cv2ED/9umX73SuQ6RQy//ZjGO8kD59B23ICQgxE5eBgJesW6Dh9L/4P8P0qe1a39NKehoRwIAAC
 WC17JrjrYo7jS7lOJNwM/WYFuHqy8sc8RFi8xKOg05Jcm1HSjLcs2a7PjwGG6LGl16tReWBoWDj
 DLtps725G6Ok4kJBOS3oJZCj9CpOpoUjYZWuXlKMDXr6odDSBscU29LWb8H64LXw+sPBACbA+gv
 2Nkif4nM3MXiiak/RQTJHBiI2pQe+/hm/Isi6+i2WGlZd1qgfVmlPNOyjb6FCgF06g8kMlSwVbd
 rHIB3J+U5+3YUzLprmCzNu5b6kB/LtkevfGf6XnOgNdA7yYdi3+byfthWmFZbHC3ZVjqKP7zicg
 Q6qPXpM/y0766XEm3AQTH93s4+s5u0cOqkuvYu8nRw5qr5hrD8Q6C5GPP5eERLkZizR3+LHxXwD
 Eqm8tcg/VfbXRbSUw/iQlkAfq1J/RZBOxNasnA77rLnIAViW4WaLt6UQp11o+7jWWb0Rrgiv8Xo
 82Bc8Afx9520hSMlGTTEbRYc7VUOgpYQvy1cHzO2sUcBvjcUN8Wl9V4l+kiRmQ9xkRwNpANUJgY
 QvA793gTzRHkE3r5rlRr9iscIJT1rOr3IojA6XUfpXrI65zswuI4kAx10y2Q7Dlbs+bFUn1sIwZ
 pdBEsCfyvRy7lXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2cf060174795fe326abaf053a7a7a10022455586..8861245314b1d13c1abb78f474fd0749fea52f06 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -111,6 +111,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -140,6 +144,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -169,6 +177,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -198,6 +210,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -391,7 +407,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -409,7 +425,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1225,9 +1241,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1251,7 +1267,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.51.0

