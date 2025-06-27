Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C97298996
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019022; cv=none; b=FPuONvUgLOij+pItJ4jfH2KULsCqvC8sAEz2Qr/QVwP5dFrBWRRAGfkIkY72HtnJELXljkalVKlfIHCSFV5kZTU2dvMHfLE07kDHiSEOvGhFNKDjpXmCsRUitQclBYTk9cV6ZRVvhxJwHEJEhvNPq42luaxPwhFcHz04AsOa2HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019022; c=relaxed/simple;
	bh=0giSBgmaCphIbxYHr4WmnoLIDsn5RIpi8emWrzo8fZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H+KfIBe4IniNnNo+DgDdPGB+5HcTJHgCtSxOi1yyGB3I23N0DLErxqRFBSFS3DI2aBgbn1A3dg3JNbiMU2It6/2mu0+DXrwCGOpSmcsi7NRmi1/cuWsp4ijvz/7xc+j9jV/jHvvsQp3tGat1sJmk7Q/XC+ZhjkCuIBkV/MIXP8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U9Owwn7t; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U9Owwn7t"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso282900f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019018; x=1751623818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2kHSsv+wfo3DML4q3PqZ9JAPNtZ/a1cxK7CHbHK+a0=;
        b=U9Owwn7tVIWvS9K1cwt1R6vWZhuaAnV93SOQYHl07R6DNEp5JRcNez8L/JmwUUEItM
         8dCvUc4AxrwZsRbj7XEbsMLpRHzE96Zqh7PfpYlgBW6klCMfMmrU6ReOEyxhZRVqH79J
         P/30hvK3aEUuKzfmE+dmA+ekwiokOReJP/YMpcydY6etryTRIlpgzZwAOE1VTu0NtAK4
         dHc/HR71+IWYrCxpK1Bl2QLqXFkfKoZvxyhycLqKNY1bMKj54cHHYsf+XChI9Er3ki9j
         qsQFfXjdhp/PLk/wP9U3nXQMpRG9o1RdQrzP7DZvMXZ2rE+d66ULR44J2nHwU2TCRBYl
         HCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019018; x=1751623818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2kHSsv+wfo3DML4q3PqZ9JAPNtZ/a1cxK7CHbHK+a0=;
        b=Eyxpmw1mV6TjwlHFO12PDYiTCQSZMzf9yyLXtAwjLvhLhwUyUvLb2YrOW/I8eMIIrz
         zXs6AX4j4yjLoSUoEDAIHWHjEzGV8IRaxBLumTSRo8LZHr+IvCxyl4uptRBPPquZecYF
         b5r1b5UAg7IJx5dPb5CFoUqSWAXLSrJRZLRuoPDTZ8iRlMZVfAQuUN3NWK2BxXFSRsdN
         jQCKHrp88MJHdDjZGieOl8KJ8RbLaKVt7dLfSARptd9cXqroWVyfJ5zKx7Ih4gvSyC+3
         sxg6FCdoMQ/AT23mMRqh/wVZywM2X+6JKiTV6/XKODFYvWdG9ThakTQzNON5vLwT/Rz1
         uwig==
X-Forwarded-Encrypted: i=1; AJvYcCWjfdsxvlPQjxQkNpOc3Nd1kDH3fqFaq4N79jczq4uAwld0uGRtgRTXpQw5+SB+GH4t/z7vgXv0paA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoOhS3aJBXkD5GLT2s33JjvZ6RArg165h80oHSIu5aXWzO0B8G
	S6bYnjJUiSMq5+nm2+f46zFGwfOMz6d6ZUc/6zJkrJ+8Qs2vKAcGY9AJA3KFUkZkeo8=
X-Gm-Gg: ASbGncvQkng5yUkGwCKKj3dcPDXuq3C6Uo5pPAsD8rJVMBVjCSuLKOKo2RAY+xTUIGl
	bVznV90u7zCekFss98MZy3NLm5M6RQT8HKWtHguh/TfzWssejMUvPOzvIyAr+Hm1FIsl0A1U0KH
	lzVJalpVgCyXpLiRwbQWN0c1y5xIUBVdzdR93yhjCNVoXxFPKFsovM5mE+WnObjmI9l2JOheJME
	c6TQ+zRUcexIuUY3Y5lRPt4WHBqotq3KBdHUEYLltW96iEx5QrQ4TjPloZPCM61WtHehoNnWfSF
	x5assqm8KWwElJLhRL811WJVKrwSvZc4ZJ/lZLgg8b9EiADoaG3nwUzeG89Mpp8DU3i1jq/OOBc
	rFGRPqOq7bBNUrPsJqJRvMNgIHt8Pg5Znyej2U8gd1A2xyADzTMVLPVW2CABytno=
X-Google-Smtp-Source: AGHT+IFVCTjSV+KDkAU40t12c+V1148+Xj9ejWeKM8rjPyQmHH2LgkyELVwiB8ZSxhmDLQhtUn+Ojg==
X-Received: by 2002:adf:9ccb:0:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3a8fe79bb3cmr805658f8f.8.1751019017581;
        Fri, 27 Jun 2025 03:10:17 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f8absm2300301f8f.95.2025.06.27.03.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:17 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 0/8] update DMA API documentation
Date: Fri, 27 Jun 2025 12:10:07 +0200
Message-ID: <20250627101015.1600042-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few documentation updates:

* remove outdated and confusing parts
* reduce duplicates
* update streaming DMA API expectations

Changes from v1:

* move DMA Pools to dma-api.rst
* improve streaming DMA addressing constraints

Petr Tesarik (8):
  docs: dma-api: use "DMA API" consistently throughout the document
  docs: dma-api: replace consistent with coherent
  docs: dma-api: remove remnants of PCI DMA API
  docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
  docs: dma-api: remove duplicate description of the DMA pool API
  docs: dma-api: clarify DMA addressing limitations
  docs: dma-api: update streaming DMA physical address constraints
  docs: dma-api: clean up documentation of dma_map_sg()

 Documentation/core-api/dma-api-howto.rst |  36 ++---
 Documentation/core-api/dma-api.rst       | 191 ++++++++---------------
 Documentation/core-api/mm-api.rst        |   6 -
 include/linux/dmapool.h                  |   8 +
 mm/dmapool.c                             |   6 +-
 5 files changed, 97 insertions(+), 150 deletions(-)

-- 
2.49.0

