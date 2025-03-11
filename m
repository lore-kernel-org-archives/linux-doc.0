Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27EF22DFA6
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685150; cv=none; b=pIYjX1wYgnKrBU7sNfQsI0PshKIWjBK+qvYz9IHy2MM6UmKWvi8A+2mYdg2AkI/8mYlblaE1ubyqSCTpjuIPqrrCjUS2Kjm172aOJMSfRLizPLNwGY7sauFaiqUQeTiHowcnwum3uLZsvS1JS5hbp6WtWogMc6nMpOJ7YC+cWfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685150; c=relaxed/simple;
	bh=MDk4VkFEZ3Omoennvcf4KMiiddpmT7+bDeMGysrEOqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9zPjo8svIiQ1arPTFGoAvpqDn4yW65AYo8C6aTv7mF/OUdPmnt2INsOCKyxaOdI+GXR1HgUAYQQFAOp/pZ9Fir4LH5Vg75GjrmSR6mIoFc8HeFyzK6lC0XQhkwUlVX0vniv6I92XfXWakDO35bmOLfK9PxTWj9xZ9FcdvmKVFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fEAPUbG+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fEAPUbG+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so17572475e9.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741685147; x=1742289947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtqnqsyxQP/e9bo5ZCxKCH3JxZzZtKfe9AQxqfuk5ec=;
        b=fEAPUbG+8Tz0LIpHl+kaplvV8uf/0SzGXxuJPQ/870CG3saQgOokZFkS2XKXyBBfc5
         z5q/fFnP5a2a5uHWIsDFEP79fC+V/YgzeiXLJFExca0cyELs0ap62LKd+htHRPALwkOU
         XRlmBOkB4JDeB1KKgj4GriH+Grmul83rpG7HMfyOun7+Rsh3qKJJCpiPWNW6hGN4AI3e
         BndRRE4CxInuKSrk9Z1ri1VgVy+L/Asa70Sq58+3hSqo/HFwyMgoulerHU3uoZlD31QY
         QxdcuvRCf0sBiP4ckg9ah6ZUSKUNK0TFKOKoVaDl3Dv+GXRRnQVvWponKpftoJs78lHi
         VfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685147; x=1742289947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtqnqsyxQP/e9bo5ZCxKCH3JxZzZtKfe9AQxqfuk5ec=;
        b=CUyTYRXDDEC4siJf35vxaN6wf2uBHBj1XTFfWOK1olzgXZ+Z6K2P/eGhMmVmYqKqNW
         u5EjncHNpElIx2uMz/DDlwz0bbHd5DLjKNQDpUbLYonW/Apekscx4lbHvflHojbGuIYn
         Ulypsv06yDwOn4pNfYE1dTFqZvS300cFqhBtvoQlu8E8IpcbMasUZcu83jLzZoTlOp7h
         qYg1fIrZd72SxFz9TSEbqmbWerJZZ3kB1ldcnkQnJ9YUtYKOgvtMM6P95a9yNEHg+f+G
         mplBk5Uhim3loE3WPjdYqEi5Ie1eHka4uFXcj5RBO51akuu8dE7PxrRHiISVsJZmuug5
         Dg9w==
X-Forwarded-Encrypted: i=1; AJvYcCX3wXoO4F7nFfFxAwuPjfgqqv4WluIYitG3CBcJCLA6h+6nRMRE6dlZyCXPNIX0Wu+ViVPq6Gp559g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBnq6n1yjdq6mXg5FN3JjLbZpMawT1hLvNbeFngy/r9+D8kk8S
	OeanlQUI58QXk8TMq931gsrGA/RnIpBRfbeUSzbT6JsVKZLgroq6rIyklJeSVyU=
X-Gm-Gg: ASbGncsJh9FdJjeeYky36GtQPz80P7OoxZA7ti5+NY/Yv+o3o/WVqA1a/T3zHSsGBJ2
	yApkL2EdtDtfWt0NvBctrTVRRhmZm3IIzZO5H1gkg9nEPasKDEWpNGUzaSn2Mizunld3n99YgSo
	lnHBpON3Ii+cXAx1CfMwkp47VCuQnFSDrwTEpmoxskE2vqty1NDfT0Yon6ueRAMv1UzA44yKP7i
	jNVH4TU8pGu2Pc+FrsiHh6UUSsmH07O6eZC+ybCtNS8KzHLQ1SlewtdBv/mrfHukM4dLdSWWt4A
	CBs6rq1N2FMm6EK/NLeZV24qiKLQRvkAeNVR
X-Google-Smtp-Source: AGHT+IG1l09uBciNj409gzaq9ZRZL6KB9sv+vZnatdy5m6HxJOreByN1ubwyWqhG8i9TAR3rokJMgw==
X-Received: by 2002:a05:600c:3596:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43cf8fcf8e0mr52620265e9.9.1741685146987;
        Tue, 11 Mar 2025 02:25:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cea8076fcsm107436465e9.15.2025.03.11.02.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:25:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 10:25:34 +0100
Subject: [PATCH v7 3/8] dmaengine: qcom: bam_dma: add bam_pipe_lock flag
 support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-qce-cmd-descr-v7-3-db613f5d9c9f@linaro.org>
References: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
In-Reply-To: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
To: Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q/3RP4DiTyaxTRnIH/tALxp3dBkxS3/vcvd9GKBezPM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0AGVUBvjeQRh7H7aAx1rE8T2VzvFTVozUiuqz
 vf1B0ns0RSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9ABlQAKCRARpy6gFHHX
 cjelEACN3/JUgds8V7OXUaqnsGAgQkUwmon/d9kX8vT1YYVYYguRoqUrSTNeC9njYmcKrucjs5K
 k2k1oWasiHuafyOeEVIAqLtsXUL6sYz2cSKDl3j4dnfK1HSRE9Uh/ESR3JawYqwT4JI/cZXI6A/
 JOPdtRb2ik4iGtUSxn3Uz4rEGv7zfeCKzfUTl+VimkvHv8coNAghD9bI5NsaN3Xo59kB4KesWQb
 j75ftmhE7WcPw6L6k0H0Y5C394+rKmt4xoFpDczUY/Lbqxbqh9tM3zjFV8H8XNqkE4OWujEkwG6
 flbnLqZNiwDxXZg6bRFG24STnKsv/TsTlc54mnt3w9N2nurVJCEI0I6HoWgrv1bNaeySWOb6GS0
 hdsCEU9sdYkts4FjT38yi81tbluPpvbOkfn6XOTaynYBMbqoKG0CB8TSjmM5yT58vXEDHqWME1/
 r6KKVRQT+1ySkn/cXyBHRT7U3iE3jbWhjp63WTx9zGNmKVuyr1m1jXJRIa6iOHOrqmKDa4sZivJ
 szseRtVCJsUJ7iUeQSa5RcgQ6rtLTx0MXlxpdjTBuTUmrXvWlo3Qf5rQC/T+oyAUqiZ2+GFPPcT
 FH5+7j4YRP29sYKuIE0FRl+7zF4fPmhTHyohLVoDmGrF6jrQUPh5arOPMJv7tADVTNJDiX9gFPf
 tSS4tBeYqPZmF/Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8861245314b1..737fce396c2e 100644
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
@@ -707,8 +712,15 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		unsigned int curr_offset = 0;
 
 		do {
-			if (flags & DMA_PREP_CMD)
+			if (flags & DMA_PREP_CMD) {
 				desc->flags |= cpu_to_le16(DESC_FLAG_CMD);
+				if (bdev->dev_data->bam_pipe_lock) {
+					if (flags & DMA_PREP_LOCK)
+						desc->flags |= cpu_to_le16(DESC_FLAG_LOCK);
+					else if (flags & DMA_PREP_UNLOCK)
+						desc->flags |= cpu_to_le16(DESC_FLAG_UNLOCK);
+				}
+			}
 
 			desc->addr = cpu_to_le32(sg_dma_address(sg) +
 						 curr_offset);

-- 
2.45.2

