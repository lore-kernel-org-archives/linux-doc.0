Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133773254B6
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553369; cv=none; b=oeYSeod9CZV6DOFrlOhFmbprRGSbGx3yXw8w6YhYmptk8wzsfoh9LLhAjNygDBfuGpXRJKAhPbO+4cXDh+4sFoDWWkvcMoT06UaEk2YUr0YNK6A3z40cCRPFoNM8hGekdQnpHC8g11hJvb41defaimur+pomTHK1AaMairpn64E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553369; c=relaxed/simple;
	bh=SmF3D/xPAHHTJEmyJroTr7AuP1k7/7uiMAUqeODvgg0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YxoxXXTO2MOhRV4iUjUZkNTSqKYDGOaLJpppTKJ9hkfpQ4Ehcb/dNCsKOKJCbGD0gCgc3w+JapqXZU4c0kuLIREvKppRf+IFtU1+LKRplwvAFnKX7bJCc60I5kFzn1soM7KZepdNoTfWVs0GkphG8Gj2Nk+NoV5Fw5U8K2fTdk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5JpU+IM; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5JpU+IM"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-796f9a8a088so6565051b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760553365; x=1761158165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJWMwls+LAtfP4tAZlyMoRyCGxEoib6nFV8vy2YJhYU=;
        b=b5JpU+IMY9B/n7gtdw3r7x5vUBvXC0xjcsa5uPTgYIrKJq97DhKAI/o/o2/IEfGWaK
         LYXFm3IYj0Y2j3JV5Pxt12UgQmzISgia8Ox5OCr1Kpn+DAB3qh4gBn0z4dnWQloi5T6e
         fqIITLYS1BKUJlwA2cRvvfWqW3KJxRpOKbSeksHYNbHIJt++++4fAElqF5LANKqAGTkN
         JwBxHPqRu0S6XRBx0RnC22rfco/HFu0knztdy+Z7khD+42D+SSdl8QeWpnoFI5e7RciE
         QYteANWCZ/i/FRIAClAy/jNBzBZS060uEnI9zUSUY2x3yTQa9n53J2ftLSE0SovW3E+C
         yp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760553365; x=1761158165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJWMwls+LAtfP4tAZlyMoRyCGxEoib6nFV8vy2YJhYU=;
        b=Npm50uf68NzRXzvXiIldpKpBqhagRIrPq8FRzdes4nZBPPcCzHrnosXHWWEtaBBCtW
         +dZSPSPm3UR999OJXh5eDUCWAcQXjZgM5qke2RiE5GHRBDYAK7J/xiViUReGRLxGIo7B
         850U8B2ys6tarL2yzITkPxBu/o9fvPbXJGfaM0fyEnUm8t/SNjCmadloJEVswkElPJGs
         iWntlgZaPXm6TF5vBbfbknTkBeK2szcXhHITWKrvcT7ek5fMwLC0njqf1w4twv/UPPRw
         uDvp4ZJ92hCzF1vT61FF6aKmDlNkzfOikOwrRiG2t+HUeXO3mg7v7W/GyNQ1FZN/JpFf
         Q2bw==
X-Forwarded-Encrypted: i=1; AJvYcCXEu2mRwolPCY24tLbuPC1NFNgmRlPZ2A5EqS79Bb9u8B+U5HRIZhFu5SqSM4/ISUqazOha1KcleVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuy43wIcNk7tTBgbWjnNUnddfBHe/XH/aVYbHwJEi+xUhI4qML
	1iI9dNwpOdpKKEDJJN7kSCrqbFil/uQ6HXX+e6LNvOgWXMsPLP/wjiQA
X-Gm-Gg: ASbGnctg0HWiP37Qu4EAA8MPVV8RRaOTUWhTbFWVqNCdhUW5VgncINmkHuc0nNzRyaT
	BhcWnpw79VILEf54mi/sSztwDK0sFaMBqk4CvSAvDyN1NbepIR0p0DQjNRpo7/royS5FS/ku3Ay
	MQRsOIEQ0m6guRvOisBowGMZzduD6vVNutMuoPqPbT3ty0VKjAmVTol3gLxNe8t05a1PY5CK14V
	2KcAQf+wDzOlW3XJM8hRhvKZ8IrG7WoIiP+CrLYUrLj+zJUn0kDB3CWtYj7vAlbkjArvrfNsiS9
	iVmFns6TI0GjAevo6QmmJypaWLKymXWTdD9iiyTdOFJGwf2jsjAaNWoZmbcqBlymEzQ0UTr0Oaa
	NHQZx5bmfMzZn0E1Ycpbvz7T0kLeQIToaygiYMHCNCYeWBum9ov2kXjEwGibZJ2a3WRDTzA==
X-Google-Smtp-Source: AGHT+IFlyCa56i9R5oJazvL2hNHkiDW7KJ+UW8SY3pz99LslbXWkSaiSVgZEMdYa4bSHd+QjdapDNg==
X-Received: by 2002:a05:6a20:3d82:b0:334:97a6:17f2 with SMTP id adf61e73a8af0-33497a6182bmr1030221637.14.1760553365032;
        Wed, 15 Oct 2025 11:36:05 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22b9c315sm298122a12.29.2025.10.15.11.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:36:04 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	corbet@lwn.net
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block quote warning
Date: Wed, 15 Oct 2025 18:34:02 +0000
Message-Id: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning encountered when running `make htmldocs`:

  Documentation/userspace-api/dma-buf-heaps.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent

Added a blank line before the "Naming Convention" heading to comply with reST

Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index a0979440d2a4..c0035dc257e0 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -26,6 +26,7 @@ following heaps:
    ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
    created following legacy naming conventions; the legacy name might be
    ``reserved``, ``linux,cma``, or ``default-pool``.
+
 Naming Convention
 =================
 
-- 
2.34.1

