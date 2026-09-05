Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA2D3E4C69
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604709; cv=none; b=gwSZN/5bLfQtJmq/7jMYVTtwtZADiTm4nHmRbVMfrRIrmg+gNg/SVEWrBQCi2hRid5ekfSRIOwVbFlYiI6OlkTNGid7BjuLuJVAMP3R5AJJwgY3Rc81zf+gcm8ufRF0sTHFtLGc9Fjn0gE6akx5RDAmlk/1fkaW7c+F5OCnjVSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604709; c=relaxed/simple;
	bh=6k1nS/F9xk3/l6EbkKNHsEdhtudmFiQXpV5uPZWMm9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pdfxl8Vr7fSbI5QG+5qsWBpaxtZWBu3bBOGcZgTRJ7DM1fUVR4jqXFi21lP2ejA/3h2gpZpsgbve8lzeeT9gzNQR0YR0hfwQrHeszDWcilT9KDNKCHeWRCvzLyGvCHGOo+85u9uQul5REMkhleaxlBqJkG4W0Blgo1cui+mUlqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLmn6+fn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLmn6+fn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so24067645e9.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604703; x=1789209503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuOySspaniUOzxdoDKGAWC5U3uQzn5Y/9QqLZWlIQck=;
        b=sLmn6+fnujvdU1n3NNUtodNaFWl1aFb1zH4BOnuH9ojQy0GbHe095ZbMz21jfaKo44
         XZDtiui2y3MLJyooOkK83Q944t6WyIAqRsn/gZnwIbEjPj95ABaBbDV3GbecF1coXAJG
         ZNhW6/BkSDF97cKzoXHDd7gYM/MXgqUX/AcWnANICpEHB1rcmHvtqy07Aw0BNMeHk9zZ
         oeFtVXhJf8oGbIuno+Tj2ZLkQ5rx4hSKy5d50f1INeHYVtSTsml83OpnuNmonwlj87B/
         03dznLRWN/hYiPvZpnQd7EFVIrlWb6v97JzYf/fUX9gdcHVJvmNu+WivgeoyEaPRPKJe
         1X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604703; x=1789209503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuOySspaniUOzxdoDKGAWC5U3uQzn5Y/9QqLZWlIQck=;
        b=hIiHbGWO6HaxcKn3sv2q2Qpw4IFpRQWDtTV2dmD0+Hr+F3rg2j+iGjmo4Q3iSWOi22
         4lmHtO5kEck7w+f1LCjj+rftmKHUSc04ZN6c1qDmxxy/2o1lnCSVNfSggwxfzENhR4H2
         QIajvVIALd082IHscezMxg+pCd5zqJMwHEWrLcfV3PDT206qMKs1yKBhMaP5VrSSlVWN
         fYETnq77FtPx2ZiFpWcZYkQhXnNiO0lhBZNfLyyTFHkJvy9m/5ygB+9hnVEQj9o1G6IL
         HLUdv7fUYsH+UV+UGs97iBGlo/jV296ul/MPHZJbOhsEqrTQUipzUgiHivp2qtat6Rbo
         ahKA==
X-Forwarded-Encrypted: i=1; AKwUvBzLVqO8kY5P1oiJEreqbO6/mhhZNdnEu0GsWw92R6kSXyISIK15RkbHNVH03hBM/cZQ8239ieU+Sho=@vger.kernel.org
X-Gm-Message-State: AFuF++kYGy0N49NIQYZs9qBGn8nxtJKEzs4VlgcVMrucR/qdBHXwGGoo
	njsQFtEETemOmhUe8f76HGriH5JM8rkKJ22VblaSU6k+m8JgqRslUYWQcoQEx6jz
X-Gm-Gg: AYBFou0NfzowXgxUaGqBO71+YQptz9lRkODCa20NiKFvLr7Gd0XxbPeVU5r6hNbRd4S
	TASlLC98++N1UQ9WqGrkjd4mho2jKlgbMOqWTCoa0fPKzElHjFKPd34uwVLEBQeCQzWE12YvFSm
	ZSZllF22vGYkq0cJW7Pe2xr5IsK7CyAmMBGPiq3EUC26Kl1TxV5HR6BUpe4cyj4h2kK5hjMl6Rq
	ZDLSiJ0nZsGBtv3ikgeZSWNQkHzhKT4epRZItIpoRjr8aFPYu38IhtAcO6cqeA8SoEWwFRkBtWj
	wok2MiNXLUYz5wVdmLhgvuyOVSwUod+Es5GnM/y5sKnZ+Tx/jQqkydtroLNRIQpmskaiBSabTDu
	kRJ+pxa4gvwR+dn79FqajvCcvcGTOhDlXBtnQPJycmKvH/cLNmHWD86IncP2IvdS+TCY9e6Kqmy
	bRYO7c0WLe6NT53Xn4NQpYCThPy3l14BAhDo4/LeyeTj0Pq03w30p7N11t4jXn8vzm4yg/JBqe3
	rSF7+niQujyg0BNRlNPjCu6WyMQk0fsbWDeHZUd9oRMJfeasfoZ0O3MbXmrx4XP+D12X7QVc2BL
	QsPUt6W684SfewCtLd62MWEM2MeFwQjpcXs/wFNFnchAZSH0xgwB29zKUI54/QLTMlO16Z55YRr
	dmg==
X-Received: by 2002:a05:600c:a4b:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49cf824020amr106100295e9.6.1788604703271;
        Sat, 05 Sep 2026 03:38:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm3335250f8f.0.2026.09.05.03.38.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:38:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	iommu@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: [PATCH] Documentation: userspace-api: iommufd: Fix the struct iommu_hwpt_alloc name
Date: Sat,  5 Sep 2026 12:38:19 +0200
Message-Id: <20260905103819.43424-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct iommufd_hwpt_alloc does not exist; the name is struct
iommu_hwpt_alloc.

Use struct iommu_hwpt_alloc.

Fixes: e2d8fe9148b7 ("Documentation: userspace-api: iommufd: Update HWPT_PAGING and HWPT_NESTED")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/userspace-api/iommufd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/iommufd.rst b/Documentation/userspace-api/iommufd.rst
index f1c4d21e5c5e..763b23339480 100644
--- a/Documentation/userspace-api/iommufd.rst
+++ b/Documentation/userspace-api/iommufd.rst
@@ -242,7 +242,7 @@ creating the objects and links::
 
       Either a manual IOMMUFD_OBJ_HWPT_PAGING or an IOMMUFD_OBJ_HWPT_NESTED is
       created via the same IOMMU_HWPT_ALLOC uAPI. The difference is at the type
-      of the object passed in via the @pt_id field of struct iommufd_hwpt_alloc.
+      of the object passed in via the @pt_id field of struct iommu_hwpt_alloc.
 
 5. IOMMUFD_OBJ_VIOMMU can be only manually created via the IOMMU_VIOMMU_ALLOC
    uAPI, provided a dev_id (for the device's physical IOMMU to back the vIOMMU)
-- 
2.53.0

