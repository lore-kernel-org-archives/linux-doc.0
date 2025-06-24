Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A07625178E
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772372; cv=none; b=dr4tmeuiFceAviii5ALn0/SqtzaSaqIEN20pBROl6qNVG+e7m7dTslwMbUcVTvRmOjX20m2xMGN9puyvNH8FdsN3qTBsfXtBBHh1QUkrQcn9k8vFGHZYfflp9SxLzhfRkWLMRdWWxJ5WzluEY+9lIV4VV1H1aSgIcoozJhjMYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772372; c=relaxed/simple;
	bh=ncYNDjhndz7kqcJVLVQbBNAMrG9V+TdPRtP2T4abi2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H+t9a9VaLzjRV/i2zwAxt/T1lya2IDstpYf4YUMwQUu81xk4arVnSb2ieVvrRTDoevr9KrCXv2sM48hHM1Jv0BlTaH5STkzppOLq/CcHmLDmNebY783awY2PUq2UkkF4KFY3eaehP5THIkcFYovJ/g9LIeMSx2IJL4qSiVAZeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SFQGJvfu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SFQGJvfu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a524caf77eso804468f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772369; x=1751377169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxjDIBXMuvdPXWJmF9qZYgeWhojZt27wnvO4wkpwI2w=;
        b=SFQGJvfux5u8aijYtMK/vQYkkwl0++x6BtcO8fj4bUL/i5L9z4xXy9czHlOocCS4qn
         38VjBmsFYV0/jkeDj5EF1BCHqRPV+YMfwAZkHF5qKeJ8to7YcQRsze/kdMAGG270gnh2
         uKF08tEzYYm/n6FwJ6ixDb1a8Fpz7BX/bTqBGqsFtCnwK0Xl4F6fBkCGOSQfPh19agmM
         xp7iuqkYH6aWYC1XZoK15SIfVA+2WPs8rmJzCrV6DnWCQ9izcmppP8W8fz8UfhpWfwCP
         gbrDVfmXXyLu4EJIBSUyLlNe5bHTtouYDsqr9Rjfby+EVVv8O96mKyVuNYf8zsqDliZc
         YqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772369; x=1751377169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxjDIBXMuvdPXWJmF9qZYgeWhojZt27wnvO4wkpwI2w=;
        b=VdvSsyAWrzNRjYXQmYSF/yfT52eh5ykBO12ek/mJkx2tBrVMldsIHixaqz9l5UVnUH
         yR70lgM/fYqaHLR8fD8qa6XPk3YnKrTVnpgjF+LKwjdKB1xRm8OlI7UOuo4k69jy3xWa
         Ph5Lxd+JUzW4Odvgo9XW/l83O+5IEhd8qNeB2HykKolSWG7A2kgOcoabpel9x9P1K0Hb
         XRgw6ARNKQcCK50OPfVtZOrb+FCJvWK7PDcw/xz9GAG1ifl39bJD2wByKFKRZhH7JVNf
         9C7aXJQ86/C97e1FyG9/WOmcmAl2WsKY4QrKlN0bhwlHP2dSgmOouJGZfiWktVcLJCD4
         +TtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWGlu6iBoScPq0QWAxndIYCQ55NCixRtGF3XRMKskoktBBhWiYt52+wZJL+/NAESrcNi81feOn0/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4aoJBUBpY++ihF85Ba3XpjbARaa0Cy6hOYgh92WIoQEtoabTQ
	Ou7AvJyx1M87J0GaZ1C9uniDIk7jXxZquHSS2N2BIykhD5aTllaeVaVr7ZnFt5GpHR4=
X-Gm-Gg: ASbGnctfc8Tk+aZg/X8sDlY9Xng07t4BlIRYYQUiBHxJ3F1E5rx/Ex/T6peNOJEHvTu
	rLJe5Lmrp5QkkGbW4c/uO2DSquIEikrMKC/nNb2Eb8qD5pSA4TYDuM7eycZ65PZiGVCLO19Xxww
	WMdD/IHnZzWgdEpeYJrDSCwAlJvHvihadIBbcHZeLcNCAs4N7chVX0mqMuzZXGurbfhbxyAeQSA
	dg99AQNptEx+gF3C7wpcSQ+Fb2tlEjFtFOBmchLM16sPa5T/4vr47Gx04GxORc3SBe5i3628nB9
	lroSjencB5/rEa/pvorRk2V5F2MxPVCur2X2Z7E9JT/jyeXy1cue3BWCcCUsHEqfJFvs5zyfqEF
	n6uW8Gk+AzY8jKSN7nOBE7hJi9tFDuSZXsYpNRWJcom0Cf2zshJh5
X-Google-Smtp-Source: AGHT+IHQyrO4iqMSd7VpKmuXfo0VLyy363LPzuPbS8DTxE31tKkFh26zo1Cks2a5Rs5oGEGjiBKI2A==
X-Received: by 2002:a05:6000:2211:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3a6d12d737bmr4870971f8f.1.1750772368675;
        Tue, 24 Jun 2025 06:39:28 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e805e828sm2040400f8f.32.2025.06.24.06.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:28 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	John Garry <john.g.garry@oracle.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 0/8] update DMA API documentation
Date: Tue, 24 Jun 2025 15:39:15 +0200
Message-ID: <20250624133923.1140421-1-ptesarik@suse.com>
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

Petr Tesarik (8):
  docs: dma-api: use "DMA API" consistently throughout the document
  docs: dma-api: replace consistent with coherent
  docs: dma-api: remove remnants of PCI DMA API
  docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
  docs: dma-api: remove duplicate description of the DMA pool API
  docs: dma-api: clarify DMA addressing limitations
  docs: dma-api: update streaming DMA API physical address constraints
  docs: dma-api: clean up documentation of dma_map_sg()

 Documentation/core-api/dma-api-howto.rst |  36 ++---
 Documentation/core-api/dma-api.rst       | 173 +++++++----------------
 Documentation/core-api/mm-api.rst        |   4 +
 include/linux/dmapool.h                  |   8 ++
 mm/dmapool.c                             |   6 +-
 5 files changed, 85 insertions(+), 142 deletions(-)

-- 
2.49.0

