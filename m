Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F6F13DBA0
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625939; cv=none; b=IdZWNExS2v6bNu9F54MRViIcKzB5ZISR/HiJTFJg1DN9I5a9q20WoCm5FKvQUGP63fG8A7GEZLVZ6YYYfTLCGk8545ZHomDoMJgtMKNs5/HjiVcz7Fo6dFcuu8pk+nFDZv+ZX0AG0psHxxDi0pUFSahX9ij7HXwAbvr+QVQAq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625939; c=relaxed/simple;
	bh=HqjORkXyUAJZ5t09djKo2B+llLHFZYN3T2zYVJKoFPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jP8v4KXcK9Q29FeMgrQFLxmTFvZXD//Lnv1mmeC8YZoxnjSfYM/0GqeynyA8yg5xf0tPvrucVYOzNJVjFzPfnBK3DLsVPQZxNI0Jf3uZ1/T0AMOhpK0big1XY2YZUJx9DdlkaMDVxw/0ul/hfZ+OACe1wr5GHrj/6TZxO+HqFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhncS5Oy; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhncS5Oy"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so644234a91.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 18:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773625938; x=1774230738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPA/F/DsU0PSQq3nz65hqH1FDo0PeiWks4BdWpvXxQc=;
        b=jhncS5Oy3v7pjuYVGPtZEjRJz2ksp+Iaa9xcxVUtNHgdDDOg4DAWVfHn8hN2sgGfXy
         ukJC7t1voPCTpfgLncXLxPlhssWqqRf1g+/zhOej4vZ4Z+1uqYByAvgEE1+Nkkn/CGg7
         XoiYzRHBJPKuFukJOs5HRq8++V5yea3ad6m+7yElGRDSAuydElvenBdi15xSfbG1uinh
         c1LcQcLzENeFcoB/Su9yhqiYgQhnv8qpSHutj2/NVk8PfHj/7LHGkLORI/l4/asGva9F
         oiCpxGFT6F5hknX4vEm2ac2DWNyySD6P4OvLJquA1HkgZJj19UhY1ABv0EbsF9GRoXv5
         IvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773625938; x=1774230738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPA/F/DsU0PSQq3nz65hqH1FDo0PeiWks4BdWpvXxQc=;
        b=BZVhijmGHub2vDLBEatjrXYuAsCujetqvvC38rtOBfBeUWXhPe2kXw2YkKxzFZ+FT/
         yZVTa+G4ZDI8xJI93c7B1UlKMiAcPylq4h/FKMGe4fAk3KxtquFD8/+jUeSaaXdeQCHj
         Y36rjw+OmKzvHTa/50YaZp2M85KH2ORcnUGNSgp+Zq3hNNhJL4UKNk5ZNKPX75mNWCkR
         3GRKT1/ySp9E7x4dkrPH7JZZIjU8ReweFYjHhr7mEkbCCjbG3+gifyFbS3sir7mZbTdF
         x2zchnzGiU/id68ighLwaOZjvu8iqMnhpoElEiwzedHFJPEWtI94vzGxr2+7amWC9a+T
         zKEw==
X-Forwarded-Encrypted: i=1; AJvYcCUm0/6FjZVfhzvXegvkfloIf6btvFbyYB3YuhIDv3iiFFTWXkG7XnHuDti2v8k8UNS6qVa/tG1tX+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyapI7P2dTnMpLxM51jzGnpCD+7PjonHZOSN1G5U9a1nubNNsy2
	6iptFjpRRI8IjCWZbE6gpoqtLb8bSJq13Glo7TmSDLfOo0lU0GFFZlAm
X-Gm-Gg: ATEYQzwlQc+t2amIX9OGtPF6Nucz7waGDYtOOQAmPCI1oMReKuGlN0StpvJUWo7LLDf
	LPrOk5lOoZuDwglKhwFs7wV7J2d+uIcmU8dGKobJx4lhNCNc1VlCg1R8IFGp2AR5k0ZAuYWu+e6
	fGaTwKm5t6wuQRv8qrUx+kaxZ+dyI6s4+GER2Wb3yUrZufL+ZT403zjoNLs0cO8iOrx97MIG9QR
	4DGwuPCSC+pYPI6rWrzmlkJYYFADPrh6EUfxy8TPU/PzOLiQIoD38DPnYE9C+h3VJuzmW5XHHn8
	Rws7jX5NSzz4AlDdnfVyaRckJd61ao3JliXmF2n1CO4QWlI49CnvAkxEUsQZ08sjAr6OHSMxCpq
	R7suy1Hqi2eeJKHzdzbQ5JakBQJxu9qfybjW3V3dXmI2ftV6wacchr+tHakp6JXwFRDm2VfaN6S
	ifNAfOm8ii5aAVGZvEjmi5i63trSzbfcssMeNz9/sy
X-Received: by 2002:a17:90b:574f:b0:359:fe72:3559 with SMTP id 98e67ed59e1d1-35a21fdd3b7mr10281855a91.21.1773625937953;
        Sun, 15 Mar 2026 18:52:17 -0700 (PDT)
Received: from localhost.ntt.co.jp ([222.151.198.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9d6fe68asm725329a91.6.2026.03.15.18.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:52:17 -0700 (PDT)
From: Ryohei Kinugawa <ryohei.kinugawa@gmail.com>
To: rrameshbabu@nvidia.com,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: Ryohei Kinugawa <ryohei.kinugawa@gmail.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next] docs/mlx5: Fix typo subfuction
Date: Mon, 16 Mar 2026 10:56:14 +0900
Message-ID: <20260316015621.41630-1-ryohei.kinugawa@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'subfuction' should be 'subfunction'

Signed-off-by: Ryohei Kinugawa <ryohei.kinugawa@gmail.com>
---
 .../device_drivers/ethernet/mellanox/mlx5/kconfig.rst           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
index 34e911480108..d549b43e00fa 100644
--- a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
+++ b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
@@ -120,7 +120,7 @@ Enabling the driver and kconfig options
 
 **CONFIG_MLX5_SF_MANAGER=(y/n)**
 
-|    Build support for subfuction port in the NIC. A Mellanox subfunction
+|    Build support for subfunction port in the NIC. A Mellanox subfunction
 |    port is managed through devlink.  A subfunction supports RDMA, netdevice
 |    and vdpa device. It is similar to a SRIOV VF but it doesn't require
 |    SRIOV support.
-- 
2.47.3

