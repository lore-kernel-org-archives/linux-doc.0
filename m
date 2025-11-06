Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E229C338
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762414740; cv=none; b=F8UpaVi4o2R/LRQWJoFIYRiwHUMHSvkv6UpvO0ks613WPE1kkgTTCCkVkvcc80tRxwG9KeDp9JO0yn8HvgXNepXU9qTsq1HEHhxHp9gGkEpHUqb5RgL6k7QF5U4Fh/bsLpglEr/2fWULQz/zVR3boazsRnPXkcP6S2ycDfZIp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762414740; c=relaxed/simple;
	bh=e/6TSSJQOJhHj68tFAxKU6w6UcIQwXM+cEaZaP7McA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgqo3xk24jtKXqv3LyAvN7FPKZ/ahP77jUSmnznj54ckLa02SiJuklDliI84E0/W5IFejS4lH+ZLnbtmC/AnI8mSXhfhqDpND8gf6nZetHRssOJ9iNy6IQ5PJvbbQ/cbTiQhUgJAIEd86vKXvEttUWXLDPZoQj+bJLtTCgToD7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkcQXEG8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkcQXEG8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so642392b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 23:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762414737; x=1763019537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf6KQbaWXXRW/TKl+9mZAaUOer2HLcjSLNcGRazOzGA=;
        b=mkcQXEG8zJYNgYZ+8SWmzejNt6LsTSwE4Oum9//RN8MOxQX8bL69UOd/PDypxENPk+
         JqW6msHO559AR4xGxUm2Na/gk1QSak3Ad2+dLbLHW9noZjByno1tj52HtYfpa2LjvcBP
         Xa1wCfrRE20k/HFhxouGZ5jEQNHN2yn9n3AgbNy9hTQSTw93TSjQHmbhXoKq/cm6avHy
         t+WYHH6RTX56u40Qt+dfvjmb2DpO4Zt/bzIQGnZZ9m1l6m+0DGTTBKV8BA7Il/+ku8/e
         fjPhTBoUDRPszr4F0p5bNdgqNFgZN2CGtQRnFYThbfuIXdJIOUHH/gr3PDjQClCLM1qE
         SdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762414737; x=1763019537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf6KQbaWXXRW/TKl+9mZAaUOer2HLcjSLNcGRazOzGA=;
        b=gEhrNrlwTxsJyGOhJZNmr7SdW6rUdwrbkbNZ8GGwxFW+amSv7maW+o1ExwBn7xH+0F
         /SCETPRdJvY8pXul40Jg7iT2E86/c14xZVLxMyR+em4znznAY21bKYPeALt2Enhyu5lY
         nrtODMKSykDmIVQSJ0/wryrA1DivHZwVt4ke0WpW8t/kYN6FyLI8O2ztqAnjUMeygiM+
         0a/T/bbTmUpYQoVwFe6vvxCzMvF2Cngu4pMCzAP1Pd6gMOgSAKSG1vyBkmfNZTuoLwjB
         J1THJll3zEdOJTLVvLfvmQ2Wvs+rJ6DOA3Ny044A4KplL/akuDbgWHO9o6JwfRk/u7eL
         mauA==
X-Forwarded-Encrypted: i=1; AJvYcCW2AbwSWKrdt2qDmTgCGUYTHjkN2BHZs4KWUGxVTzCNcSmeHC76Y+RyRiB2D5RB/iM8lW0lcsrfsXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQsLP+8W6sjgcK0dBtB2vOLL6JMuUpwe8xO5LrfxkzoDZ8U0gd
	uG0THi5cRo4kNZ/ljOB0xYezJgdCfWfmWQueXK1BXtYDc4L5AeuU9bgf
X-Gm-Gg: ASbGncspcxsP9pWep1EmSXO337bi64gTgi+Vnx4ayiWQiD+sV2euWJlfPdWa44cwX6i
	07t/3QOMUhq2Vi1BPHch4tL8fD0dldloNcS1sBCO/jGGP+OqmzQcw05TSH+cnJfsR5Ny+g/oXuC
	jYOjHyKz/0YQiq1RU/AC21WFMkqzCbVmNDWmkrcrpGjOav9K9/lrkFj3pTgC0zIqWLeOjQOLEKA
	bdYvIAzl9XlmI0tUV0TsJnbbjgK6YF3ND9zZS1mbHzkGcZbKJ6fdLw552FeoVIAI6KWiyAOlp9v
	Tm8MO9ik0XGK0af8BlHVqexCfdST234Jnuv+nutn8ayLtZ7AhLhsDdL6bOVMHnT5dA2nfLP23UT
	QNmmwMc3xTWWTXeDTcPqv/FOp35V0CGrykf6Rg8yJ/u5HMRDQVBM+pl/em07ad91cRni5QfCY6+
	G7RylzWUZsvfA=
X-Google-Smtp-Source: AGHT+IEviUEYxYzZKu0NJgXfavETj2BVNx3f+QV327vSZX9DqBgD79uVfXkQNhs/ljNyRMIF2MkK8g==
X-Received: by 2002:a05:6a21:9986:b0:34f:28f7:ed78 with SMTP id adf61e73a8af0-34f846fdf0dmr7897940637.25.1762414736633;
        Wed, 05 Nov 2025 23:38:56 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba902207232sm1399020a12.32.2025.11.05.23.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 23:38:55 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 10AFF420A6BB; Thu, 06 Nov 2025 14:38:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH 2/2] iommupt: Describe @bitnr parameter
Date: Thu,  6 Nov 2025 14:38:45 +0700
Message-ID: <20251106073845.36445-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106073845.36445-1-bagasdotme@gmail.com>
References: <20251106073845.36445-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=bagasdotme@gmail.com; h=from:subject; bh=e/6TSSJQOJhHj68tFAxKU6w6UcIQwXM+cEaZaP7McA4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJk8/q/yt4tPPxHKzCSWblzaovaGPbBt/c7YbVJp6/3ce tm37ffpKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwERWajP802mtCl/7xFRZvtn4 1Jm+8M/S0tdK/63Q3jbFReLDhFeyWxj+l71+fN8o9uTki5wP2kvdDDZeF58pymBpxiOdw+t4cuF eVgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warnings when making htmldocs:

WARNING: ./drivers/iommu/generic_pt/pt_common.h:361 function parameter 'bitnr' not described in 'pt_test_sw_bit_acquire'
WARNING: ./drivers/iommu/generic_pt/pt_common.h:371 function parameter 'bitnr' not described in 'pt_set_sw_bit_release'

Describe @bitnr to squash them.

Fixes: bcc64b57b48e ("iommupt: Add basic support for SW bits in the page table")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/generic_pt/pt_common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/generic_pt/pt_common.h b/drivers/iommu/generic_pt/pt_common.h
index b5628f47e0db40..54c16355be2842 100644
--- a/drivers/iommu/generic_pt/pt_common.h
+++ b/drivers/iommu/generic_pt/pt_common.h
@@ -354,6 +354,7 @@ static inline unsigned int pt_max_sw_bit(struct pt_common *common);
 /**
  * pt_test_sw_bit_acquire() - Read a software bit in an item
  * @pts: Entry to set
+ * @bitnr: Bit to set
  *
  * Software bits are ignored by HW and can be used for any purpose by the
  * software. This does a test bit and acquire operation.
@@ -364,6 +365,7 @@ static inline bool pt_test_sw_bit_acquire(struct pt_state *pts,
 /**
  * pt_set_sw_bit_release() - Set a software bit in an item
  * @pts: Entry to set
+ * @bitnr: Bit to set
  *
  * Software bits are ignored by HW and can be used for any purpose by the
  * software. This does a set bit and release operation.
-- 
An old man doll... just what I always wanted! - Clara

