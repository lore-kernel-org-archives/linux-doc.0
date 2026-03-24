Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AFC273F9
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 05:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330202; cv=none; b=m6DCGuprJP2UDi8cFE2SgUE537ZqtvDEmGwRIxlN7868tejPvuB+0xTNzeZCE/tpksranui7FWQ7cHg3hvqLwnD9D2/ZmZB/coL6aJVW4IPvCJhOhpI+Ws4YUo9bejKFA0YhC45iKWeMhJBAH1fQ+AXhjjN+Z+Ed7umRFC/1AQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330202; c=relaxed/simple;
	bh=xNJI8BrDJcjv7B3CyIr/xSgaScE/My8YWxbTHX0hgl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mop4Oao8yzHDp0yBeu+q3aLZvJV+UfwTB1gL4QiWWj/YXqXWXx5xSDxXn/jgLQgxr5k06tBzQ5jSHdHPu1/tcNZmIMp5Z4TSNlGm3/7VRKy38+kHhfMGVd82PpRJuiyY6+b2iW2dkSiiWhK6PDhr2CwkUkuVpUSaj7nLqd/ru3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCSJx2U4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCSJx2U4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35a1f3f07ebso1708064a91.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 22:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774330200; x=1774935000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWQPpxJJ5vqy5RevxN77SFSwx0z5emoC9WwG+dKY3L0=;
        b=iCSJx2U4HZsQdper25KI4WHkLKDbAz3U7F5tWdjc1f9xb56yVGsd4FYIuuGAyIr/mv
         pHz/P5TNk0ZbJZFhZuS/YJWgF2laHydyyW1pJzWnMQ4kwBMwjOdVWk5A03JUWBo7Muys
         nYaNgBJbAXCxthq+hHjn+dtuvY6Ojb8NjRIetdsthC1y8HfZAEUEu5zp34EryzXRcSVg
         fsQi5tZs1ZE7Wifrhem6z+Sxt0JQR4E+67QrodjkQIhHd+AMT3bqRfN11XgWDCgoX0L8
         ayqPjBKP8VLqb8fbZ/9X7R03bMT2iBlHKkp5xcDvfrgZ6cILbG3BxQYVHMy6PLjswzDc
         8Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330200; x=1774935000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWQPpxJJ5vqy5RevxN77SFSwx0z5emoC9WwG+dKY3L0=;
        b=liH/eK6VbtR9wPyAU1oKTZUrCpYPKldrkE9T1Avr6c9IhRQl9PWH/1HSOrp92pdGZw
         ITyRC5nrH5bEW/mSL6a/m4x6DmEkB0Pf8AKNkdJNe+oW0fTRzuMYPfsmmBG++1ceuvCo
         aIyTfF3uBQBvy14K89DEUQyri/rk7EB1kc9xN3vc7kn9ZIu699aLnok2q3f9l88WJZ0k
         h5yPTHfMBAMsRlLpVjwX3yb5ROd72xFec5nHfBzuqJUniY3n9KXdqVVuG/O/gdAU3a1o
         pEfPyBeALnYEZ4adsS85yGK/W+HB/ZphKX78VQyZQGmCR6Yl+og9RNvKW5R6//imY7cI
         GF+g==
X-Forwarded-Encrypted: i=1; AJvYcCXHdhOBWsrzYsUxEAc3j0wtBk8Rp2TYYW3RwGFZia2/91BVI8snb4e6mlghxggbOdxFiXD/0+Me/LA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+H2wizgwTPZAVetPvPyNv2A3ydo+TcPXNw9m5NxTjfNZCugR0
	lZoayoFVBA4IIT/EhnJsm1ylN75EFVpmZa9+TfF+vjqznGjB3kjD5u9Lz21GKA==
X-Gm-Gg: ATEYQzwMMq2pPWjL4KMSEupvjsywvgKJGqkMvBRZI0cJi+EJ5SQFxojcmqDAFeRtv7o
	xzLT1EpwG+vGr+IBRThVBya08exmrbMDwyZ1ABreRRKxAfgsWvXj4Af32iUNVKhZqPatEZZJSAp
	0UC408IhQA52Nk6Fy5E82U6jpfer2JyHXOuNSknycdaQ7sSnUAJMFNAjXM316FSLsT0ataNWqR5
	JPm+pM6D0X86QktDwFnquodHTBycU2hCeIPjHeB4sdIkSbNAp3FGfRsp9HsaHsZDarHNki9TN2O
	yXTxCCAdM+XuqTXQOCl4bvPDKX6V0uNpuCAWd5y0l6koNMUCTNul9eipCiF7tp9qGBeCEQyKLX6
	NOObe0oPkwFZ6xiWHHjBqJ3L7vDSuYQBUFVpyqN5ko4/E0lrt2v15eLmXGWen1J0EARvJuXWUsJ
	5U0DngbB3Lv92FknVUE4Zt+qsSwVp+KjYUocTiVfNj
X-Received: by 2002:a17:903:94f:b0:2b0:76b1:93f with SMTP id d9443c01a7336-2b082734032mr121627425ad.18.1774330200449;
        Mon, 23 Mar 2026 22:30:00 -0700 (PDT)
Received: from localhost.ntt.co.jp ([222.151.198.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm165458525ad.7.2026.03.23.22.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:00 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	joe@dama.to
Subject: [PATCH net-next v2] docs/mlx5: Fix typo subfuction
Date: Tue, 24 Mar 2026 14:34:10 +0900
Message-ID: <20260324053416.70166-1-ryohei.kinugawa@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two typos:
 - 'Subfunctons' -> 'Subfunctions'
 - 'subfuction' -> 'subfunction'

Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Ryohei Kinugawa <ryohei.kinugawa@gmail.com>
---
 .../device_drivers/ethernet/mellanox/mlx5/kconfig.rst         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
index 34e911480108..b45d6871492c 100644
--- a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
+++ b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/kconfig.rst
@@ -114,13 +114,13 @@ Enabling the driver and kconfig options
 **CONFIG_MLX5_SF=(y/n)**
 
 |    Build support for subfunction.
-|    Subfunctons are more light weight than PCI SRIOV VFs. Choosing this option
+|    Subfunctions are more light weight than PCI SRIOV VFs. Choosing this option
 |    will enable support for creating subfunction devices.
 
 
 **CONFIG_MLX5_SF_MANAGER=(y/n)**
 
-|    Build support for subfuction port in the NIC. A Mellanox subfunction
+|    Build support for subfunction port in the NIC. A Mellanox subfunction
 |    port is managed through devlink.  A subfunction supports RDMA, netdevice
 |    and vdpa device. It is similar to a SRIOV VF but it doesn't require
 |    SRIOV support.
-- 
2.47.3

