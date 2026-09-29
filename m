Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012674D6C3D
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671969; cv=none; b=JOwYx0BavT32D3FCCtGH3x9yBgytyvRatC9+Gcaed03hQDuCpIJ1brUa1iN1gDxk9sdtHsqy+f2tUrQxrECLXohAVTPPcGRWTHcDuoOJcN46ZoM0EakJnRKiZwUU0DUr0MOMOpiFhp7y7UJIHG7uZpa6FjRA7BHTH8a0EPN5VVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671969; c=relaxed/simple;
	bh=3Zg9semFa1L6TUYPIku22tV4Gxv/z9earrnKg5ztZ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2D6jxQr6CWqxx4f2sVM0f4MTDnmDhQbetg/xclwoRa4tKxeiLxo6x2N6mbLKctGgm2bg7NQZgsFNDSCalrNAFHiknELIhsWBRt8BoOiB8Z0jRAnX8FvSciTL21zp5ghDUQdUwCVKNKh2AXRAr/NsWdV0TEwM4fcalz2FXhyoD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtwxEpne; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtwxEpne"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so1429108a12.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 01:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671963; x=1791276763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=is58lsw0xIPDdPgl/+Xhc4F0CzIMwg5OpJH1w2B2adU=;
        b=MtwxEpney55MVSkMiYU6XE2Vh7tz1d4uA/CSuKHtsEiWMA4mAWsY26abTMA65548sF
         loULd882AshAurFIjd4fv6/fvTCd6w5ybDv59LyorWjwdYjQBVeQnIzTCbqbR+GeZBf5
         Imw45/jqF6XnwmHfU9AT0qEJprti/vA2kNkZEceecUZAu16bl9sEhoc0UiExclgbSwE+
         D+T78Z1B5ZN33YMLg5u6GXBPjUl/Nt15X6D+43GawvvFCdwKVu+l41vYW6PngTusgZ96
         AWKnFYMK8PhbBnEu9lxF3nD1KyXSkruYgzpClGycRWIHFzYE84WmIm2bcIJBkF1frnlH
         T5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671963; x=1791276763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=is58lsw0xIPDdPgl/+Xhc4F0CzIMwg5OpJH1w2B2adU=;
        b=Z5Kib3LQnddax2Oz4STB8t/wm8In6uyJVtHsE26jnhRpEHesFy3RbRptOPqDy6dmZh
         DihxW4zEvoko2mecsikmq9BPLzXJZQVbv/8RFKYLE+CRQW5dWvXHpBMNwAPCzIyWJgLI
         MFk1Uqarn30x/qnYlH3ZtoDsNPAppAJsDjjon3w2mEqxrcXm+Y8DO0bF2svjoTng+0Z1
         vXka+k0GLRQTpIXMh0RPjEXTsdlXXxRn4JseymnI8DYJ7EoZ2Em4OuXa2G151iBRYRWg
         ZsHVPupbuE8i3haw2Dcx6vJHePebAOr351z8iLDtuVli1gZbPeJpnAAC7PddrX3Z7a+r
         Fmtw==
X-Gm-Message-State: AFq9FYJ+r3ZhXubhdn+ZCquHzbbkemj7/liCO4KRFx05DGvyj+fSvjpR
	dzl6MyZPycbzxJ1xgFmyWisGlzSQ7XKiXpEqc4G2DHMChHdSBgwpUN+j
X-Gm-Gg: AYBFou0uyRkXIvIb36JeYeZxNyfckjCtvuYeItOVM6Fzu8S/EtrSPRwhw+MXOlMmDW1
	k9XL78TwuQAbn7niPPJTCrc1IUAsEGDvcJDIO533Aqf/SmRN8kVxFnt/nVvBU6TzLJRTzeyKS81
	L/n/KnjScndJVtAjVyoOPUkTaw45aAuPV3v+X9tGCDc7koxM5/YYN3rY4K3KDvJvYaWUVpU6wKc
	3yJZMgFUvEGpRCH49uMaB77TUoxs5Z/ZYo4fPQxw2gOzffMzWa76Z8NMjacQlQxEW8o528b9ncG
	KZ2eUf3Eyi0NAw/NHjB6OTrYZXMA1nVgff39wh6cUqoFltR+xV3m3EWbZhApYHVFDQANgLBz67A
	k3Z1mG7WLVbT5KdFmh9YscX1WNQpVoAZUWAPBknLP2S04Y8qsFafDYymfZMCQ+dSkg4BhewT6ZU
	xqu55oVxvCWACDiZv78sJMt46QAhiQGrUfLN5ROb6bZQIeDUmVT46s3nR6bzxsMgKDy2rg
X-Received: by 2002:a17:90b:2785:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3a09875ee61mr13273827a91.19.1790671963192;
        Tue, 29 Sep 2026 01:52:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498179081sm4288623a91.14.2026.09.29.01.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:52:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/5] phy: core: Add phy bulk helpers support
Date: Tue, 29 Sep 2026 16:52:30 +0800
Message-ID: <20260929085235.469515-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in [1], some drivers may do not care the difference between
phys. Instead, they only need to treat them as a group and operate them
together. This means a bulk operation is needed.

Add some bulk helper functions for phy core by referencing the design of
clock/reset subsystem. This can relieve the driver owners' life who needs
to handle many phys, as well as each phy error reporting.

The example consumer driver is at [2], with the following function used:
- phy_bulk_init
- phy_bulk_exit
- phy_bulk_power_on
- phy_bulk_power_off
- devm_of_phy_bulk_get_all
The devm_phy_bulk_get_all() is also added as a simple wrapper of
devm_of_phy_bulk_get_all().

Note: The patch still uses -EOPNOTSUPP for dummy blob. Instead, I send
a new patch [3] for fixing the left function.

[1] https://lore.kernel.org/linux-pci/ak9KzNFF26B0Kttz@ashevche-desk.local/
[2] https://lore.kernel.org/linux-pci/20260929083755.458238-1-inochiama@gmail.com/
[3] https://lore.kernel.org/linux-phy/20260929084739.467082-1-inochiama@gmail.com/

Changed from v3:
- https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
patch 5:
1. Fix spell error in the document.

Changed from v2:
- https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
patch 1:
1. Add Andy's tag
2. Update comment for phy_add_device_link
patch 2:
1. Add Andy's tag
2. Update comment for changed function
patch 3:
1. Remove all unused function and make the dependency as static things.
2. Update comments for struct phy_bulk_data and left functions
patch 4:
1. Remove all unused function and make the dependency as static things.
patch 5:
1. Add phy document for these newly added apis.

Changed from v1:
- https://lore.kernel.org/linux-phy/20260831025319.94886-1-inochiama@gmail.com/
patch 1:
1. Update document.
patch 2:
1. Fix document format.
2. Fix several document description.
patch 3:
1. Split into two patches: one for non devm helpers, one for devm helpers.
2. All the bulk helper now use unsigned int for counts.
3. Fix multiple the while loop statement.
4. Rename of_phy_get_parent_count() to of_phy_get_count().
5. Fix some 80 line function problems.
6. Use PTR_ERR_OR_ZERO() to simplify the error handle.
7. Fix zero value in the document
8. Use two separate release function for devm helpers.

Inochi Amaoto (5):
  phy: core: Add common helper to add phy phandle device link
  phy: core: Add common helper for get phy phandle by index
  phy: core: Add phy bulk data helper functions
  phy: core: Add managed phy bulk data helper functions
  doc: phy: Document some bulk helper functions

 Documentation/driver-api/phy/phy.rst |  29 ++
 drivers/phy/phy-core.c               | 416 ++++++++++++++++++++++++---
 include/linux/phy/phy.h              |  74 +++++
 3 files changed, 483 insertions(+), 36 deletions(-)

--
2.55.0

