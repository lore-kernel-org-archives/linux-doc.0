Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D5218AB9
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904765; cv=none; b=k9fzUEeUOHPWNuP5NKHJ+U9BPcsqWqP1wPSuxHnuxBQmgLDQAZU4RdIaHDvWr4G/7ogWB+a0B+SfcGBxz4hu7eA+IwmfYpxoyzn85W3qZ0vncKAVztNNkrsJthQrEUgWYGUdZui9fsSNuKEdZ+1cDKa4CbtRoh21KVtkOKoSUuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904765; c=relaxed/simple;
	bh=Ghk9v8X6ZI95UzDotAn+mX7JIMr1ajnOOt+YAT0AZyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kgsHDba8Yq9SYPFaXceHXoi68Tl2AR7/Qoj5UVxikTqHuIWZ74bzyBrZwG+CPH6MCeqpIAMl0cf73CZPxMp5zFgWPX423Q4pv3oCcQtbKiRJMJmdwi1n5PVEizgei/PGPpbGMybbN5Oqzy1ShJrHm34z/K6uRAbGlwqolV0mc8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5m2uTZV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5m2uTZV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b7910123a0so3851632f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 02:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904762; x=1755509562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=;
        b=a5m2uTZVGIwKTuVt2sU1f5NGG8cD24Mr/QP9+AR6d/Z7XSzlSFMtVYphcXV18rC9pM
         RjFhWjl3Wq5Yqa8ooxYJofAEg228Oy2Zz4Dkjp9+YF0Ic5rhwOvYxQa129GekhbfsNpD
         mJPpE2a15zFvtBRlx0OlEG5O9bM0zosPoRcR4HOIUR4KyxvI9VZAQGD2eQJ3kl3NM6Hw
         hnqxkiSWTtQcqEf7ys9HkcbYKaJ1NjQOyWB2CNdycs8rD1yTsUhtecwVtFsMRZzrhCRr
         8/akQpJeOJrODWaFH6jFDYYy6pOKlxEN8HIJFUrcbNGW2fEVCfjfqwrgxXOAuYefbTFp
         5pyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904762; x=1755509562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=;
        b=D5SpJmGhhDmAKCDQ4dYdhPAw3o24ORr7fBUM6kqt0YZvCUlDvW+HFZPYjA7w8JUAAb
         XEmbHKRlp+ETEQ0bOilrMzXBJfyS6DOzexpWaHP5N/i3gx9RKME6MsBw4pJMFlthK73e
         wEG81ECNJ9o+Jn+QnSOFOMDmCJ5Cl+rpOaMPH2J6ZpE5zjqeE6uYAraDohGEk9+sWvtY
         Ymq+oeCk5fgajdj1RSR9njWUhOmJWpG1ZAHtS1LE6k5rZvF8FIT6OfCauSODaoKtVH0Q
         esY2QvwjBTh1cbCrSrA/k7tA7UobwB+iwEKge7R09b2RK8UMRR77T7JYtda7fz37JsBJ
         zG3w==
X-Forwarded-Encrypted: i=1; AJvYcCUS3aiOwqNo9eghlzSIgld1UlLxnt00p2qMpPctO05dkgbuV8KyKU4pNvBNwAE7D7spnaKMvDG2has=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8nXcjelynRtK4TyBxcgej6jjIdXzetjnptvxsobXE1XmNj0J
	cqkEmfrI9vxn21PaAbn8/mUKv6NKz5qnwfJbyRQda1MRGdAB10uxUkGcIKBwuknakeg=
X-Gm-Gg: ASbGncuCZNoCZO/zYDWYLqoxOSANOkhaDTdnG7CrKAuxM9mLOmkoY/a8CapyQNaGxB9
	Q1FmcRaKq32U2674Vu9K/9wRsBryv/52ShU7rNykqnLzEyc04JHHHIzP5Y3DVHppRtH0MYzEDcY
	kmvgKlQn8aYTJYIhV7CJem9qZkTjrowzNgftuf/2fIAQuk7ViSUzPcqTC+uw7X7dAVoWrh4oHN6
	F5tsqFXpw0eNfbR/428fRWV7A2q3rSjT9q+NWb1zgOq68cdKuR5lYBNTeYkYVbQjl1IDsL0gLPp
	K3N83R7QUTrj+BQA4nyqQ3Axbgq02/vvdwIFfgVhn5dDt2lqCnsl4PL29iw43GknzCQK5QzUJJg
	SANwH0lqLIA7eDoxRx86TGmQnrVa3m3c=
X-Google-Smtp-Source: AGHT+IF4rGypTA6LAa8xSMn4qKFuOrcs8J0oYr3jFggkDuO4RAE4D4QxeRDmMlz2n46JWmeJ8gWF6w==
X-Received: by 2002:a05:6000:290a:b0:3b7:9c79:3293 with SMTP id ffacd0b85a97d-3b900b8bf31mr8716728f8f.58.1754904761700;
        Mon, 11 Aug 2025 02:32:41 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:07 +0100
Subject: [PATCH 2/6] coresight: Fix holes in struct etmv4_config
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-2-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Lots of u8s are mixed with u64s and u32s so repack it to save a bit
of space because there's one of these for each ETM.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 746627476bd3..a355a1e9606d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -832,28 +832,33 @@ struct etmv4_config {
 	u32				vipcssctlr;
 	u8				seq_idx;
 	u8				syncfreq;
+	u8				cntr_idx;
+	u8				res_idx;
+	u8				ss_idx;
+	u8				addr_idx;
+	u8				addr_type[ETM_MAX_SINGLE_ADDR_CMP];
+	u8				ctxid_idx;
+	u8				vmid_idx;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;
-	u8				cntr_idx;
+
 	u32				cntrldvr[ETMv4_MAX_CNTR];
 	u32				cntr_ctrl[ETMv4_MAX_CNTR];
 	u32				cntr_val[ETMv4_MAX_CNTR];
-	u8				res_idx;
+
 	u32				res_ctrl[ETM_MAX_RES_SEL];
-	u8				ss_idx;
+
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
-	u8				addr_idx;
+
 	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
 	u64				addr_acc[ETM_MAX_SINGLE_ADDR_CMP];
-	u8				addr_type[ETM_MAX_SINGLE_ADDR_CMP];
-	u8				ctxid_idx;
+
 	u64				ctxid_pid[ETMv4_MAX_CTXID_CMP];
 	u32				ctxid_mask0;
 	u32				ctxid_mask1;
-	u8				vmid_idx;
 	u64				vmid_val[ETM_MAX_VMID_CMP];
 	u32				vmid_mask0;
 	u32				vmid_mask1;

-- 
2.34.1

