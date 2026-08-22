Received: from mail-lr2-f7.google.com (mail-lr2-f7.google.com [74.125.230.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693F123395F
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 00:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787357820; cv=none; b=tGFJq6pmYEpBOASrnjZqM72fi+xIB69mrQZfsjZ6SD/6sLjQFlWsgs1Ry73TWA0qP0G4c51BadE9SSPG8XPGH3dP92i/XcS1CvigaVu2vviYb01Kw7CScyrVegXzcJN+uSfOSiAfc1Cre1jW7F7jkX0/rAOmDcxS0ghNJPVnhDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787357820; c=relaxed/simple;
	bh=IxEt7BDjtzyDUmVsxRlklsBGCBNYJ6lAlCSy5VOxDko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IwqiVjE8NnEzFN2cK421xipriHmS578pPHLubhjACLSl5DLLQ60l/pnHtiMtwZcgU0wIq+juDqTjspFK4r9GsmN4guQ9iHFPcdZFxktAYJvS8kwUD/v9K0/pxo1WhDl1pA8fxNkVgV0EIsllOP1ows813KeInKx1bD4HPz6ilRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDmZuzxM; arc=none smtp.client-ip=74.125.230.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDmZuzxM"
Received: by mail-lr2-f7.google.com with SMTP id 38308e7fff4ca-39c689d1d48so8440541fa.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 17:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787357816; x=1787962616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVY8hRFoiccR/YtKB1yMr7nRzRejkXLDMckSsUDxezU=;
        b=aDmZuzxM/Dt3gNeXphTxjqNNGRQ7FLvmbYrj/a8IImYb3zB5AygAoCUXJ5PIQ+0f5P
         3M5828BM0g29Aggd9+nfIuwjs9JGVPFxfwv9oHco6EqhuDFfj/rEGrVQaDAg10AFYx4C
         Hjgm2zfIZRjjYEQ4J2yvO6NH5P4KV72JiEhyVwKpwyDx4/rJ4Jl8oSkHIWD/tScB71tZ
         Tf6uFqF0d9VbFLSL2ugVn509mjZgrAv2mShhcFhjMMT2JfDOE4zKrDTWpqZYsRQs98rg
         f+s1W1VUU49i8Xz9C2pcz6avCSjPHsDVa6fmTvGvqabYkfKNNN7Z15UaDzpiP4wxK2nf
         dl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787357816; x=1787962616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVY8hRFoiccR/YtKB1yMr7nRzRejkXLDMckSsUDxezU=;
        b=cOLznenZzKXKPAGxy4MTRV6VzU3YTvjNRI/Dn32U8HsAdyuQLn7ZYd+xLXi3x5AuC7
         JBEE2igg+wm9+y6VDJiGaVroHzf/GATEr1b5hjXWAVNbfeVDOBmZy9h1DlhW3E2Cr/Qz
         OD03T2XZddfwcADWUD2xVFF9Vfu4zvVd9OuAbdPy4GBUUOYBxhptQLWP5ekMTOdLl+Ge
         QZ04rP3+Fzh5CLtIeucRLtGf5Q5JVZ+8AuZQqr5QfiIkcFLIvxSjVjkRqIH1NogHLr1O
         d4ZscKulV4XEI1Dpv1mFUJNdK20y5gcVmpfKUr1V9zZ22gp8Jxbpx05SftKskfjGkTZh
         abIQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5ADEptrjZacHAzPRUPRUr2E78YYZHk2NQJShhnUIgzESDJtL1cMg6/8q9/xnlQ9Vn8ZmFIerlYJo=@vger.kernel.org
X-Gm-Message-State: AFuF++khs2hMEiMji1ZhRMbqppZQbDodiUBNTFoNCp1u7Kh9D1X9edbO
	hzCJn8nuUH/SnB8r97bIavutLO0qO8MbrYNsM0mu37156DjH98VMU+Fy
X-Gm-Gg: AR+sD13Us+b6lrZLf47hfU70nz1p/8VroiAC1aA4/wGjXT8k9Z6wXLKb3J83AEQi842
	NH+9aL6XR7Qh4upj85zXnDGNAAOXXQA8DbkeCnjfF9OWCGSzv8e+XzvV3JryZ7CoeefjP1W9QNM
	H4cCfxsv+DnLgnmVEZeV9Y4MMIPgUARjfG1q6pXMMAm5SQtFUTgHA+N7iIFk2mUC6MUUHe9a1qW
	4jVhGjGx0mCr2DnVZKzD5C6zwyt1LTY2Smza3+/L0rf1lG0xwKEOmGJnT+I182HFOD73BZQqcMD
	ukxeiI/BVA4z+7efMHiBbPZbiLJtaEuX9cSkE4mkI1aDFRlSyq+/17169FvlfxG4Z4AIgNlci4/
	ODsmrGSbLVG05RcRrzvZt7aNkjRnWuCMuDI4hMQ4lTC1uCf3yowMqXNLeaoidIkQo8y/cECqfNp
	+24bXD7PGDlH93uBlx8fZZAhRZtFozqGxqv9uKA+dZOaePbw2Y
X-Received: by 2002:a05:6512:a350:b0:5ae:c201:c3d7 with SMTP id 2adb3069b0e04-5b48421a5a3mr2390836e87.8.1787357816210;
        Fri, 21 Aug 2026 17:16:56 -0700 (PDT)
Received: from arch ([185.177.190.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48cd9aae8sm31035e87.9.2026.08.21.17.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 17:16:54 -0700 (PDT)
From: Bogdan Mahomet <bogdan.mahomet.dev@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Frank Li <Frank.Li@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bogdan Mahomet <bogdan.mahomet.dev@gmail.com>
Subject: [PATCH] docs: dmaengine: document ownership of the descriptor flags field
Date: Sat, 22 Aug 2026 03:15:30 +0300
Message-ID: <20260822001536.29269-1-bogdan.mahomet.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flags field of struct dma_async_tx_descriptor has carried a TODO
since the provider documentation was added in 2014, asking whether a
driver may modify the field itself or whether it must always hold the
flags passed in the arguments.

The field belongs to the client. dma_async_tx_descriptor_init() does
not touch it, so the provider has to set it, and providers store the
flags they were given verbatim; vchan_tx_prep() does this for every
driver built on top of virt-dma. Afterwards providers only read the
field: the DMA_PREP_* bits are consumed while the descriptor is being
prepared, and DMA_CTRL_ACK and DMA_CTRL_REUSE are tested with
async_tx_test_ack() and dmaengine_desc_test_reuse() before a
descriptor is recycled or freed.

Once a descriptor has been prepared, nothing in the tree changes the
field except the client helpers in include/linux/dmaengine.h:
async_tx_ack(), async_tx_clear_ack(), dmaengine_desc_set_reuse() and
dmaengine_desc_clear_reuse().

Document that rule in place of the TODO.

Signed-off-by: Bogdan Mahomet <bogdan.mahomet.dev@gmail.com>
---
 Documentation/driver-api/dmaengine/provider.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index f4ed98f701c9..c10d8ab8fdbd 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -413,9 +413,11 @@ supported.
 
   - You'll also need to set following fields in this structure:
 
-    - flags:
-      TODO: Can it be modified by the driver itself, or
-      should it be always the flags passed in the arguments
+    - flags: this field belongs to the client. The driver stores the
+      flags passed in the arguments and must not modify them. It reads
+      the DMA_PREP_* bits while preparing the descriptor, and must only
+      test DMA_CTRL_ACK and DMA_CTRL_REUSE, which the client may change
+      after the descriptor has been prepared.
 
     - tx_submit: A pointer to a function you have to implement,
       that is supposed to push the current transaction descriptor to a
-- 
2.55.0

