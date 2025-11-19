Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5534107D
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569104; cv=none; b=i53Ei8ng/ren+5E2Vsi24bvkB/tM6U1F8y4l0cC7/AP3q/WPi/H/Va2JrLQ2bbPI3Bzl5AVXR/SOIQ7469eydoz9knGhPkH5jWuwJk99jHltBsIF+0Pdb+xp2l3Rk2fw9/NCwWSmCY80jGFuAkrghGKnunNYktbvsxRE8pkAcHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569104; c=relaxed/simple;
	bh=17jMP5BXtLnUallPdavwL3MYV4FkLZYfFbmfg88Z2tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDCDArx6FR1WQ+plwXEs1dO+dRudrdTbSmwLW+7S+iJPw/NwaVciSyJxAiITDvnJMk5gvU7lxrRonxvFsBQnyb9YXCrG7ETQOSKsDulIh7ZzetY+X8OjmMUEsLxITN8Lpul3OznDSxkyarL55TxT80f1tbM0nYy4wCYyJ3y9cCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MkVDnn8c; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MkVDnn8c"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso7273605e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569101; x=1764173901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=MkVDnn8crhCrzMa5WBjIxSZIjf/nZ4vs/loMfXKpCUMuOPB839TIfQyYem07or15KH
         SdnEH3a16PZrlRm8njFW3x+WT/KvIYqeMaOKFaJtkgP/nTXKUYSURADbnDbzMxnSE8Qt
         9QCxytJbjYL70x+Ba25EU/JuG72gW3Qm0oNzAmGMJK6FjHVqil0p09U9H5Y30JMOe3yd
         UaubG5rlmaErsq5G/qYroULwF3gZVTP9STYfQIjMjARlm0ukIFIvH4khAmQG9QC7EzCp
         4SgZP+xxTAGIx7WHSZvqaEiiScvi64AMFvcOoofKInIYVxgr+kgs2ghixrjseGC/mORh
         I/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569101; x=1764173901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=rVcU7e7WwbhA7+je0Iga513iy0nJlVaENKKPHuR1Aa+89Ou8+oyI6h0DULlMWNZMKW
         McsT5TnK+DdjY81DjXw3UschjEAkFYG7grRuOhSsac4oimafHVhe9Q1IzGu22Ae1NGN7
         fzOYWWNROhLUNiBKrk/6SoYCSxn8znow9TQwdq0be3J9AzDHJtlnVspPE0WpzD9zzOj4
         bVk0Eq2eH3wV2o2PbQe29mu8LrQuXenympfcQwN+/Ppi/oJq4RgXojd7R6ESNDO4/xPa
         KC/lbD+xFBqrqRlEzSCun2y6/aPFxKY8tD31D1VFF2d2ByVUMKdW4XDCkzuEe9ShARwg
         rkkg==
X-Forwarded-Encrypted: i=1; AJvYcCU2BJspYwP8MLXx+qGgJ2b3InPSXsD8xeJYrqFEVNAhrafBUt8U9xQnKeJSoDT7PWzIozhdj33NN6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzU9Io8uoq2evtgBqAOdcuX0Ogj0l/KqycZw4fesnCRSzRMWTH
	8cVaiiy4njYmluMmo8wV/Wu0+Fsk+Xuo9QlFvHZFTb4awJFSEMlfK2D2WvRaxGDiMIk=
X-Gm-Gg: ASbGncuP1e/c+11lnU7hMpg6Fkkg3NesqStgFHPaYRMmBsRa0tL42AQwQTmrW2/PuqN
	iJtMbL1jfRvWB2OmACbByJ35bsRddIOOpuJcpyuV8ee9hPdrfSMnTS8Zu8ztuaEw8OV7r2RDAUB
	KwmkHFAqHR/DzwBUdpFv1s+Cqm9EgqEd120syZblgnqcvQkgXb7Pe0NzJfW0b0TrTTGyRVoeOZX
	M/yShqW8IU5PgbfPtvwpaNS6DmCQYGO6LViWxEv3DLchj9XfbV5s67IFmnJM5GcaNtxOUt0TC9i
	UdKg3wBaFNJGgXZO7g3GGzKIm0Wq3Y6trTqkt+o8L9nek7tsEAWMkD/JvPjEWU/QrC8UkaWrmn+
	li2ASiGUEXB1eOoTOzRAkLhseubBssFUnKlrYHkOX6omqeNRE2lLeLFDIULNU39SlUSVfKk9CNi
	CcxtdLPYOLqHMhooLc///Q4sVLtOAAwkI=
X-Google-Smtp-Source: AGHT+IGPmIR6fhHuU+9ub6YJI4vO1xz6v6JjUj7F2wFmtYwIjyDK53AsfCqofC6tMxhfeD9BaOKxYQ==
X-Received: by 2002:a05:600c:3b8c:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-477afc5fbd5mr46500005e9.21.1763569100936;
        Wed, 19 Nov 2025 08:18:20 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:17:58 +0000
Subject: [PATCH v6 02/13] coresight: Repack struct etmv4_drvdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-2-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 0287d19ce12e..d178d79d9827 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1016,27 +1016,27 @@ struct etmv4_drvdata {
 	u8				ns_ex_level;
 	u8				q_support;
 	u8				os_lock_model;
-	bool				sticky_enable;
-	bool				boot_enable;
-	bool				os_unlock;
-	bool				instrp0;
-	bool				q_filt;
-	bool				trcbb;
-	bool				trccond;
-	bool				retstack;
-	bool				trccci;
-	bool				trc_error;
-	bool				syncpr;
-	bool				stallctl;
-	bool				sysstall;
-	bool				nooverflow;
-	bool				atbtrig;
-	bool				lpoverride;
+	bool				sticky_enable : 1;
+	bool				boot_enable : 1;
+	bool				os_unlock : 1;
+	bool				instrp0 : 1;
+	bool				q_filt : 1;
+	bool				trcbb : 1;
+	bool				trccond : 1;
+	bool				retstack : 1;
+	bool				trccci : 1;
+	bool				trc_error : 1;
+	bool				syncpr : 1;
+	bool				stallctl : 1;
+	bool				sysstall : 1;
+	bool				nooverflow : 1;
+	bool				atbtrig : 1;
+	bool				lpoverride : 1;
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
-	bool				skip_power_up;
-	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1

