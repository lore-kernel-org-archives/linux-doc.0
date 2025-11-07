Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1190B30F943
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762503204; cv=none; b=d2KQw5WUJyDtuHGtG5Ue2qUd6B2Kwgjdy1uKC6mUunBAAGpqemr5Fvqi2Z7mBCYRyoX9GjP9g67y1eGRhs2wKdhlaIwNxyH5xeLZ4PCKvNBmByEf5BDjn5bCA0bSD4DSCDoqR4d/NrXn+Y7TPLlj7GPBkJXohFGgzZkJvSgz19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762503204; c=relaxed/simple;
	bh=l70ZHuFXGxCuiZ9UWHRnDufmsHg5/+S7082Atj+1UWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRRmB5IQ/TwBG3TgjLMQTRAJgVVCOwiOiKF1KukR7gqcfs8ce1VxiZvHkTsmts1luCLeG+EA0BbGIYdQ+eZCabd4VoDTP7uEs4/rnvwcD6+V7tRr5yS4Qq3/7DivJCJ9046i7yhB73ZvJI1Ohs0HY4zkuJz5WYsgUKQb9cwgBnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNf5qHPr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNf5qHPr"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so984418a12.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 00:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762503201; x=1763108001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/S84Bq0H+5Q5GEwboYARmckBLSU9dA4Cuq2qpko4lg=;
        b=lNf5qHPriYstzhQF7q0ACqxkb9UzdxXEov6xxYtdp1nkHrorl8NZ6sM7FaYVp2sdeN
         Q/rYhVkrmV6NcjaFrHUXgqkIBj4fYcXaA3qcucCBVU31j1hmIwUxR2JlOP9gJiItVIWz
         CNiwQvVyE7/d4+2suH6fGGwVpz2ON68XiJWeKGEcifRcwRyOGvhoqdq9aFourgvSbltR
         FUONSqOFVBpwop2bGMrBKqk4ImNmVjlRnvmKvqIXxmtMn2Mzm1AIWaYBhR3723fYrUS1
         GU4C6xsPO8Ov9WJuTE7uAjgoPdhZx/M7kHLAT9pF35A/h3xZMuQYoQx5TbqCsF926gBm
         EVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503201; x=1763108001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/S84Bq0H+5Q5GEwboYARmckBLSU9dA4Cuq2qpko4lg=;
        b=YxkS3KTNVcxYJKgUemhGVruVONbiQ0mH7n/MR/isbvU+ocxokChfwDOiJQVa69tqP/
         YFxW1WgtCNOcufKdc6MWXnwxGdD7xAjundkIr8H/ZIYRbdaxdOqC/kfHF+jaRND/oKdz
         oyW3C6OupUmPr7M4uB2gbpEna4JXKZ3fl0zs8BMKA6mS4828gjTE2q7/UhHDFMvzkn95
         DGXmLcgqN6VzSkxguEfNQ2ophS7wkaxBVi6kAk4HXs4dwWPFxxkpSAUBN5VugGTanie+
         x+qxNVylhgisdqvs9Ouw5x3ZpPR+vv23oT6cKaJXNuIgvKHNVLfvD3A1lQh0eskWricj
         Sv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTeKm6YjaZpYrrcit3nrGV+SG1eDvIsW7unUEQBPC9Ig2xM+Z7Ho04Za7CU3JxInHz3KIBQqtBPSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV7Xql91RA5oSKlw3FeqbsaOpMuRTBhOXFTU/n1KXNarQCwAeZ
	OrXkFLt8/lF4u3jPadwkYaKSed3QQhSrD8salhXm4wm3kwGTlumYzXq1
X-Gm-Gg: ASbGncuFgFZkB82Z1JxvsjRvc+nwNbv6d1dMUetwc0C1/mmRgcUerEcXzRjun93dTwp
	pDgVjS7qkfMaYN8pUpdLV0owR77v6h9D+8v6B4RFwrW5FGzU6rEFhbGJm1CQzT3muDN9q0GbD7s
	WWrJ+flhLEaWCfBOYbVBnLhzp4mC5rNvsXlYu3h1WIHhbeQLefsKuwWVlfGe6pU9vPklmTVhFjW
	bMHd8hgmZQL3VyCgXCk71YY0moZJo8jOuU1ia7fKTjsU27n5NVkEYHpiLyNJzq91PCxW7W2T2cX
	FnKcDys7Vso4WgM+q5/t7+HwwGSmZ+yw/QrsxoFxidXVwWmSkjWwKTNxBxzbcupRND690X7TWyQ
	PJadQnGU5ltjTEV+k2bNdhbuwHVLRfaBQXZDQo7qL7FUN8DSRpIiWDOCXNKyVJ/BB6KEk2oPmB5
	Kr/mSi33znymM=
X-Google-Smtp-Source: AGHT+IGeKtv44GcSyZP8wA09Y2J6Plyg1nStPrUzCk/QO5GDH6nrlZ7OMpI0TvErsPPE6Q92rFcohw==
X-Received: by 2002:a17:907:3d45:b0:b70:e15b:286a with SMTP id a640c23a62f3a-b72c0d9438emr243107866b.57.1762503201240;
        Fri, 07 Nov 2025 00:13:21 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf4fbda2sm177442166b.28.2025.11.07.00.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:13:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 41826424DA71; Fri, 07 Nov 2025 15:13:12 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 2/2] iommupt: Describe @bitnr parameter
Date: Fri,  7 Nov 2025 15:13:01 +0700
Message-ID: <20251107081300.13033-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107081300.13033-2-bagasdotme@gmail.com>
References: <20251107081300.13033-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579; i=bagasdotme@gmail.com; h=from:subject; bh=l70ZHuFXGxCuiZ9UWHRnDufmsHg5/+S7082Atj+1UWA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJm8K/Q0zOYGTDgr9jri977z+QzvRDbO6GgTcj+x49BOS S0H9z8VHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZiI13lGhk6LMFHd7FuyC1Id DvPLM+1jsX2t9/75qszetQw2Nvs8NjP8jyxeuf3fy8Vh786WbToquy7djy97wZXeWOOsmF2Opiv OcQIA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports kernel-doc warnings when making htmldocs:

WARNING: ./drivers/iommu/generic_pt/pt_common.h:361 function parameter 'bitnr' not described in 'pt_test_sw_bit_acquire'
WARNING: ./drivers/iommu/generic_pt/pt_common.h:371 function parameter 'bitnr' not described in 'pt_set_sw_bit_release'

Describe @bitnr to squash them.

Fixes: bcc64b57b48e ("iommupt: Add basic support for SW bits in the page table")
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/generic_pt/pt_common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/generic_pt/pt_common.h b/drivers/iommu/generic_pt/pt_common.h
index b5628f47e0db40..3b4e371089140a 100644
--- a/drivers/iommu/generic_pt/pt_common.h
+++ b/drivers/iommu/generic_pt/pt_common.h
@@ -354,6 +354,7 @@ static inline unsigned int pt_max_sw_bit(struct pt_common *common);
 /**
  * pt_test_sw_bit_acquire() - Read a software bit in an item
  * @pts: Entry to set
+ * @bitnr: Bit to read
  *
  * Software bits are ignored by HW and can be used for any purpose by the
  * software. This does a test bit and acquire operation.
@@ -364,6 +365,7 @@ static inline bool pt_test_sw_bit_acquire(struct pt_state *pts,
 /**
  * pt_set_sw_bit_release() - Set a software bit in an item
  * @pts: Entry to set
+ * @bitnr: Bit to read
  *
  * Software bits are ignored by HW and can be used for any purpose by the
  * software. This does a set bit and release operation.
-- 
An old man doll... just what I always wanted! - Clara

