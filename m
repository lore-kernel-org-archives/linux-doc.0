Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241394E66CB
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186748; cv=none; b=TyN81c5I03ryiEOv37d01XUw6YlAnmwjtpLWxD2nVgRUASoQIipHt73U+GfX/uG0PQAWi6Whud6mqhBMStFfDpVywqLwnJi1HbVAO5UC0I5kq77XoCA7zJCTBbunmVFozc2A3J1D9XgiMPeDPrliNtULu50uhJmWJ8zwTS4Plss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186748; c=relaxed/simple;
	bh=lVZf6gXYP3rEKtgCbZ1/usOfq9IncQX1+3NXISeMmjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9RQZi2hyaUwiWuCrVyvXYczwaUcmr3TNntgCniyqVCVGHSt7faY5xZy5I1KCm8zDkDWNNgttB/zORBIBI8PAtuDwGWabvQhcDN+b9EgSNBsBJrSqiNldszilqKrwxa8oX7hQbOEKfhEh+ZQo3z5a4ToqLh5kTz/C2zQBI/gSEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nkv0toe2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkv0toe2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso40821655e9.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186745; x=1788791545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/OQas85hzDcBR25BQh9+KAtaxVWL/DH8U0ZJQTxmJD8=;
        b=Nkv0toe2RMtu4schcQreMthBPsxhBLWPSLYMWI7zMWjZIQtZwrGlKijoof46rz5sb0
         O4yafgC7W054ts751jRYoD8NS/mO4n/EzzA4eISqkMo9Neop69PdRu0XmvAfhTyr4bId
         XMdo8fZWxF3/4o6oA+LZm4vMs/P+1b+m8myt4l5xZHrQSm6BJ7EUhGDQv28shiV8K+s/
         5WemsB/8beAoC/8e7gCz+5nm2778JTiK4paQb/3x948O7ZQ7BBfttkY0wSA40aPLe5rR
         8aDJAVePcQtN2YvM0RK7wVHgOwX+XHrrHUbQ92x+Qt2yoEQ2JJUbmedRlDj9Zh5JuIFX
         bj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186745; x=1788791545;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OQas85hzDcBR25BQh9+KAtaxVWL/DH8U0ZJQTxmJD8=;
        b=FjchVw4ZCVzB+OuYpJEMfq3xaHYjQZaFehMhUMjV7KYi15N6guQG8oG3qx68D8MFKp
         HMbm2cArEYL3dvjeZySTcjheWBtBHsVdosgInxlXQnBvOHThhuT96FqhIjGbBxWs/8Uq
         +WhE/N/lE7XQaPGKy3q+4pSm4GthmYbgr8WGxA3pwMOGlJvhFL44LRoNClYRT1DLe27n
         Ssh8PksLVs3m3GEuK3akQehqqT4BWgyvVy7B7Ca60iyVzGF4+WHmxvIjuvtL0Bg80cz5
         K6xWIKQ1wbxfHq+86qPwLhIXDcAl2Pfs7ZKag/HaQtVIYewoBopL3AkKhg9Lj78BeyTX
         JslQ==
X-Gm-Message-State: AFuF++kI1njqMGMbIjy1mmEV2Yb7BdQDj8ayLBgMUcSTfRfAWMHD4/S6
	r5GSjhPv8li8ao+RinJpPKW/y+4+/aULJDcAD7XF7+GXrBLWFb+anyqX
X-Gm-Gg: AR+sD1036GOSvEekSYrHCLFnxUCaECQmuuKQG8Xe9k8SDtIc1Tvwcigys9TUNm3+UzM
	8aSZew3q8uENQqGJ5jk71OLD8mFfxbUeoopKttYFK353SB/Gg6wBbHh/JYWSOUIpVDwjXupqa99
	CaI7tZKJyaHmAI0SEDYR7XitQB5dl6XCCg8fsZ/yeiaMtlE+Qks4Bz89Eo6mlh9G2sbg56mqDA8
	TIyulu4fVaeldp0rHqrn1VrzoeoNZnaArwmor1CRqYr0BBlFc1xvdrs6aVY/5ijdJLvThu/4ZLP
	Egmpe9h0N79aYHnnK6fP4YFdEI2IrxGlMElpVPzoNHeYAPaKv4nT5iGli+wn29uW2HnOnZfwgZv
	uW0XrRZbmeStwg0Q7eWOtO5Yv4LLhQFXLuSK6vPB5Pps2gB+MfScZJoFTp77bRpG4fhn5CmkxZC
	d+KDQ0E6QqQfo4zjUT4oAugCQ4eQtfEGzqgq2oNo+4UxiOftaDOFk728Ypluc7CxXRkHH12I6oT
	puITZ27zGqWY9OefJKe+kil
X-Received: by 2002:a05:600c:a48:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49b91c3b7b6mr330456825e9.9.1788186745344;
        Mon, 31 Aug 2026 07:32:25 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:24 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 4/7] docs: dma-buf-heaps: fix CMA heap name typo
Date: Mon, 31 Aug 2026 11:31:22 -0300
Message-ID: <20260831143125.151360-5-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Line 39 used default-cma-region with hyphens; the registered heap name
is default_cma_region, already named correctly at line 26.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index f56b743cdb36..92099188893e 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -36,7 +36,7 @@ following heaps:
  - A heap will be created for each reusable region in the device tree
    with the ``shared-dma-pool`` compatible, using the full device tree
    node name as its name. The buffer semantics are identical to
-   ``default-cma-region``.
+   ``default_cma_region``.
 
 Naming Convention
 =================
-- 
2.43.0

