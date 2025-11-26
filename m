Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3F1A256E
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 03:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128198; cv=none; b=Sx/Xj1vmKJcdjRndqX3zkijhijaEK4i/YDCsa1MS0gGd2UsXmSnbTh+QgEwQ38hRpbgBugimMY2AL/C81zORsnY6x/uchMVo+AFQTlscDRtF/Ewy4/LwVNkObo/P20pAT4YQV559xIpzw9yr26Sm0Vt26hhKtZxsx1N0pLBfVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128198; c=relaxed/simple;
	bh=zMFu608CuZ2nFKv6LrMzd1ndQlr9L32dHna+WZ3FQVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gVFVjCGDVjVU4Z70ktPcjtBT81fx7IS4+xLnjHGz2/ZzGNjTXmUrFDNK516a4N5gn/rLWxoXnjSZLf9afIomzuawXWJt4i+mufDNTvR+iegFjALorBEw6sQ2bWeVpw3M+pw6QmK6u5KmO1KQlXfoBTKPyCZ5AWzujR25tBatHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkAdVKKQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkAdVKKQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297d4a56f97so92579105ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 19:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764128196; x=1764732996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCO8CV5c2NCEpiVClP+pH7mBZNCDGS0UxQk7d2nRlcg=;
        b=IkAdVKKQZsn47xr97CG6c4QDTTab77ICRVMlengXRVXaAjwxZQYjOtnzoHoJ80Pgea
         BMGy2A4SGTGI6wr5bqftiFu89eoLhM3QaUlG+wSneTgemC5ne8u05roLCHQVp2izGYRs
         6SQ923P1WNA38ZgKONePjrbYXqvrPf0fS+kM4t/T7BA9MpIEyXoe8OpWxrB9SyicOpIG
         J/vyk3QW0bgMB28yBWOstCMSnfdyki30+Gmtno7SCvzBA8bafYNpmbACHOzeocKT9vZf
         ZPnIqdIKYKig8CZyN6sXJbrgYIZL/rAKr9ycIqyCFvYp3PfAdPoQUX0WUsqzHFOHpmlK
         Ggvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764128196; x=1764732996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCO8CV5c2NCEpiVClP+pH7mBZNCDGS0UxQk7d2nRlcg=;
        b=mwUNZZZr9zf2TCemchznLRZQGAYCNUDqMBwjDCqVK5yHuZ7m/hzAc/hO1v9AQjNPyP
         5b8viaPQe7NCJDmQrkTMcVgtjmIZoxE/nhEKdTHSi+V34T4PyFKwtijHH20de91HIwdy
         I09Nu9wApOfZrXEu7cM2C0EPREsKlKMIcokAu3M98w+e9nb0q5V//5jrLYovMeTGqB9s
         n3z7fnfT6e6yGphYHVTJJ0nRiVh21094hNEbVghB54j4RY7750EMOoDSNEoaQBtQrEDh
         GiiJu+DIpZw9lqJcWMDLHBcfo0yY84yjmLSYwEgpi4eLHPvn1bw0rmXFzqXn8Kj7TVRr
         WQfw==
X-Forwarded-Encrypted: i=1; AJvYcCWX0QrniCF68mnptxX5wA7m/Ip5JX6kdjDPqcLYydvsBcuQ70zSPsJG36BPBQW6uuhdMuIXDj31KKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVSLU9K1NYgoru75j6CL6cfDu6FKehjC5i+ZOXhiVwg5rsSyE
	GFKCDzuypGJcppfsT+qEvpPJtuh8X6yKnLxnI9ld5Y8vYTxWi3pOUM7j
X-Gm-Gg: ASbGncukDE4LwNxuKPKSc2wCtdIty+jlUt7p5cZPHHJRM0Xsru7KXe6rdNBABy100dV
	SyRWZkdf7+8Wq/VUuVVuTdJpXoHue9DlzeJioLli4TJoKJ5+HuDpx3n0Qn+xSB3/yvjyRNgVvLf
	6bOj+ncjfh2RCBExM7WrizO9KKt+2uHXzfuT7FaZ78u25oOeFdyVqPbilpxsg4bMTUUW/ah2cCZ
	zNkmlFf6d0tXnP/u+RKREvykEEnF5hZgwi535c1Vl1H6np+MEuPw8gnxW1v4ejiWdBCW5O+ETvN
	0nS10lNZLYsA5v1NzhPlBzIcd9kvysoN9Hiwxi2ZrRlrv4AMi973R+orQfsWdx6gp1mYBpnfXPF
	Qh/Kd6XsIopc06klr5wBOhRVTxSwoz4RFFyHQiwkzSh6P+208NM/9EkyUD+K/25GwWpjSHT3DGg
	TjU7xRgmzziJw=
X-Google-Smtp-Source: AGHT+IHhd9qGaeJS/wuZiqSRNY4Ryl1sXYPai0Ym3EV+uvefn07sPl23ppcrOh+ZZhr2mVGD/7vGEg==
X-Received: by 2002:a17:903:98c:b0:298:250b:19eb with SMTP id d9443c01a7336-29b6c6f04a1mr183093425ad.60.1764128195749;
        Tue, 25 Nov 2025 19:36:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2ae1c3sm183730025ad.92.2025.11.25.19.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:36:35 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5C35D476D832; Wed, 26 Nov 2025 10:36:33 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] iommu/arm-smmu-v3-iommufd: Separate vDEVICE allocation list
Date: Wed, 26 Nov 2025 10:36:03 +0700
Message-ID: <20251126033602.28871-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=bagasdotme@gmail.com; h=from:subject; bh=zMFu608CuZ2nFKv6LrMzd1ndQlr9L32dHna+WZ3FQVs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlqpeHpx9StrIVfv88+78DG8cEv1If1faPRD5PJE45/Z 7ym8uFhRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACYiasLwV1ap/Xu74jOjzorc TOlLZgdjPDwEnuiazbn7VXPB1kcTIxkZlqfJXpU03GcX8dl9/T9L9hXGi3idFHx8zink35CRDSh mBAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports htmldocs warnings when merging iommufd tree:

Documentation/userspace-api/iommufd:335: include/uapi/linux/iommufd.h:456: ERROR: Unexpected indentation. [docutils]
Documentation/userspace-api/iommufd:335: include/uapi/linux/iommufd.h:457: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

Fix them by separating vDEVICE allocation list from preceding paragraph.

Fixes: 9f0b286fe40130 ("iommu/arm-smmu-v3-iommufd: Allow attaching nested domain for GBPA cases")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251126125920.207fc959@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/uapi/linux/iommufd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 225671603ade66..2c41920b641dc1 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -453,6 +453,7 @@ struct iommu_hwpt_vtd_s1 {
  *
  * It's suggested to allocate a vDEVICE object carrying vSID and then re-attach
  * the nested domain, as soon as the vSID is available in the VMM level:
+ *
  * - when Cfg=translate, a vDEVICE must be allocated prior to attaching to the
  *   allocated nested domain, as CD/ATS invalidations and vevents need a vSID.
  * - when Cfg=bypass/abort, a vDEVICE is not enforced during the nested domain

base-commit: 800b311b5afbca04e204eec98ee12667c88e9ae5
-- 
An old man doll... just what I always wanted! - Clara

