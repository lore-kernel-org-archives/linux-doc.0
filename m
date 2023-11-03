Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C278414002
	for <linux-doc@vger.kernel.org>; Fri,  3 Nov 2023 16:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeFUigdZ"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C30184
	for <linux-doc@vger.kernel.org>; Fri,  3 Nov 2023 09:21:32 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9dd98378a39so64751466b.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Nov 2023 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699028490; x=1699633290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqnTgqC0tubb97gP4+JpNRHveIV9LPfQHz8+p0DsoCM=;
        b=XeFUigdZHeLcethfVcU68mP6ve0l6Vh/XlxBZw46sR51iOSDCXYE44QzcfM7SUrF/0
         QydMWJ0EHGwCjHTrmvt24+xSUKUDEMxlVYwPskCYCCeyYdWcEWY2LcDJi0tTAhtbNHXE
         37FlzcVsa70kK2rCTIXmQOxNHVwqYUOMb4CnZv7I204odbKYRYahEYKWjnvy+4pb3nxP
         Cr+ys50Jp4jpZfM6/y3SfPk2j6FQbmENG+OMxJw9wEGLqF1f1x2c/zyYfjRQ9Iqykbpo
         XM+QIvrv3coyaeAMbPRQZS1xL1iLpvNLQeXbert/abYY8+ZaAXyo7jQe5R1Qm9DpsFt3
         krug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699028490; x=1699633290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqnTgqC0tubb97gP4+JpNRHveIV9LPfQHz8+p0DsoCM=;
        b=e8n0wJgCIhEbAlniJxbmyPTaD6KYcZHpywPMe0sFn1J4SlrKv3kE4acm2QVK0axfzr
         TfnU6+jX9DduGdhY1x+RD2V54MYGYHiEYycTp+rlI5t3iPzONv60jXvkOErV7iovV1Og
         pYgH1jMxnkAGwCV06rClepGwM2CchMj70TqONO7CJqg7CbLQgGSastgFyFwkgb+cHe6p
         sXh+pL1mxX/eaW+fWGHSnylyW9JR95drD2IdJNQrAc4mIuNpXCxwT/qj3LJL6+gj1nQv
         bAyGITTamgytmyOE/8x0yA7OzKRDTxIBWFo1II9Djf0LNQ/OCvVjoiYO1FRqKhK9p4BW
         G0/g==
X-Gm-Message-State: AOJu0YxT61d/pygQK5K7lWgks50AZA/qNX6CnwOkLaPTJdiHmThKkPAL
	d64JkU8woOmo+plEG0YXaHo=
X-Google-Smtp-Source: AGHT+IHqq/5+h8Df7zbi2EHXr5ZD9+fn8o0iHF93sJKD5zYaQakeGc9geAcEVPprNqj4Ty121RmY1Q==
X-Received: by 2002:a17:906:6a1a:b0:9be:58e4:376 with SMTP id qw26-20020a1709066a1a00b009be58e40376mr7417920ejc.46.1699028490316;
        Fri, 03 Nov 2023 09:21:30 -0700 (PDT)
Received: from rex.hwlab.vusec.net (lab-4.lab.cs.vu.nl. [192.33.36.4])
        by smtp.gmail.com with ESMTPSA id n4-20020a170906378400b009c764341f74sm1064420ejc.71.2023.11.03.09.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 09:21:29 -0700 (PDT)
From: Brian Johannesmeyer <bjohannesmeyer@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>
Subject: [PATCH] docs: dma-api: Fix description of the sync_sg API
Date: Fri,  3 Nov 2023 17:21:20 +0100
Message-Id: <20231103162120.3474026-1-bjohannesmeyer@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the description of the parameters to dma_sync_sg*. They should be the
same as the parameters to dma_map_sg(), not dma_map_single().

Signed-off-by: Brian Johannesmeyer <bjohannesmeyer@gmail.com>
---
 Documentation/core-api/dma-api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 829f20a193ca..8e3cce3d0a23 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -448,7 +448,7 @@ DMA address entries returned.
 
 Synchronise a single contiguous or scatter/gather mapping for the CPU
 and device. With the sync_sg API, all the parameters must be the same
-as those passed into the single mapping API. With the sync_single API,
+as those passed into the sg mapping API. With the sync_single API,
 you can use dma_handle and size parameters that aren't identical to
 those passed into the single mapping API to do a partial sync.
 
-- 
2.34.1

