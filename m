Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD1620E702
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 00:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569236; cv=none; b=S5rLzY4012KGnG/8afEi5QcEHvgaw2XF+Zzy1hT3XFtKaEbaeJ0Q3S6WvS5vE/2Jqj5V97X9HwNIaLFqJE5iBZow2joVRWHxHordL0yNz1RoOeKBwgJBgm5D9PTax8Of7RC4331zNOkDf32Vli00OQgcWnLkGNYWDtkGySXPLOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569236; c=relaxed/simple;
	bh=9O8H+XbMNAvS0v8jx+Btb6gpaFePeTzU8+bTKnqo+90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uoDibA26xleXifIby+IHBnm50Zqq+Rl64jx3LIBErr92ON8YBsH7AiKJ1tXg26N0QjIAeMShoaBRz3ivYj4Jwe9VSN9DnnyMME/Zk4FfK/iLmtE9A15cRN7vyHQNxP5BL4yD3CgWXSaqxDh2VSli2KxD4nt+1yaEeIHB7ZmIkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlZbl/aF; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlZbl/aF"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1370417c01cso5171028c88.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 17:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781569234; x=1782174034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMcLxKso4b2k5fy5qxZ4EymeOosh6CwCvDbgFOT0gso=;
        b=qlZbl/aF8AvrpScOyoFkDU0BNEPYrs/sUjc9Yw8v+b7WULPh5+LSy9F8MfDCXMDcc7
         za1kAR8zwkTVSKa3euLgiT5SSn8I6mOyAqHI1YpUSGKuCHPNQ3jiigNrb0ozqvgPoFcE
         KrnpQl2vYzzJPXW+/1cTjfIg2TE2Kyy2jL/cVNTPsBuS33M9sY48kOTIXTzside/EDC8
         OQOu3d7A2WCQK98PcCtQVbrmhNPHct5AQs47XR/9wTYXwbUYQ6dabT8F5/u545gQCK/4
         Y3Heo/SuZZqC0DVMr9lqDVqEX4kGkdFCd3eNki01gamwg5tNyozVcofrh124lja2CMYv
         LyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569234; x=1782174034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMcLxKso4b2k5fy5qxZ4EymeOosh6CwCvDbgFOT0gso=;
        b=XmzgNpjiUuJDFjhrGzyDe2YeWQpBAUupgSsArs2Blnws7LZhT4jPAoUuEDaB7t4THk
         7W1F8vEYS/uyt9cPRpY30w7dPjtol5AnhnGqBITf0aY9jBiHjRSMMgIEX3qCd49dbQVh
         Zx1zhObFRBYLjo2H/Hs5Z4kVo7aRqXREgaHsJxe4OkktK9szoe4c3oE99q15JCBFTbJs
         TTPyGBeXh0iiMjbACe7jsqiw+XbrfsLWbdGwJiWszGDCZMur8UZ+WiQxeA1EmD0Yukia
         y847ctEXRP/gCfD0rtJlzWQDEbUkdmbxLYuu59u1JCVSyQQRTY2lHy0l4PcfE0xo1amQ
         Fn8w==
X-Forwarded-Encrypted: i=1; AFNElJ8PLpczyCX25gfY1ywCYq8oSf5pACSMyNdF1O5to2M85sXaQR+NoUOEulJdcvjjEiSFU9q88aNTA3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkD1cLBtC3ERXMNvC6FGbVCPw6q5ZBA05XS9KKhPpedIcx4gBb
	ez6tfheZi3DNhi2CqApSxJMlENmbNnaTVZo1+BJk4WCxNdJa16Yib6tl
X-Gm-Gg: Acq92OHOb0BjrZomtbO/4lNA5Jq5SgGEZ6sgm7zJqV3iaqK5tM6Bq9pCXW4IkADIzCq
	orwL6HjKduHxfOCeDAl582GjLR8xzn6k7CPjNC3rtbqFir1ec4nup5wllKwKX53sV+KlB4iXKNz
	N5Z5gOlncK2db9jvklKgeMlnkiIJUF1D4FBf57TPa0c19boRpNTDVxs2H+vmQ9aVf2ajjUs4q4d
	kwlAd4QM5CuMQnUGk/r/fLegPoLU4QZYSeRo//Nl78gZszykx8GiQzrI51wlfMgj2Kh7W/iiiIO
	ESaBsNkeClnzrj9bxJt36cArb7OBgezvoNm+hbU7+22JMnw1/UVp6aRH9b9OQEvDh0LZIl+rG3M
	xHG9fOmH06+f/zgCkQ05pMZSjX3Dt+6vxkHNJ9hgsY4KoDetexCb5u/MuaFQxcc3wCF7vEHcUs3
	znQeTRgh6udQs7jU2tmw5Tl/5WKuIatnTA8d00YJ4TmHT7u/1D0kTGgDi36c6AexAggfs+PNfx4
	55v89tDXy+qiXNS4AuOaWct0sQi3NeFi6WaWkaNGuuONm1N6X92OwgnDb3F3Ug0lPoNHpQfRmgI
	13LwO45I6UGDXV37IQ==
X-Received: by 2002:a05:7022:108:b0:138:508b:93ca with SMTP id a92af1059eb24-13985f23377mr563572c88.18.1781569233498;
        Mon, 15 Jun 2026 17:20:33 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1386f20ad25sm10026045c88.0.2026.06.15.17.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:20:33 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-rdma@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Subject: [PATCH] docs: infiniband: correct name of option to enable the ib_uverbs module
Date: Mon, 15 Jun 2026 17:20:23 -0700
Message-ID: <20260616002027.67925-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Infiniband documentation states that CONFIG_INFINIBAND_USER_VERBS
should be used to enable the ib_uverbs module. However, this option was
renamed to CONFIG_INFINIBAND_USER_ACCESS in commit 17781cd6186c
("[PATCH] IB: clean up user access config options"). Update the
documentation to reflect this.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/infiniband/user_verbs.rst                    | 2 +-
 Documentation/translations/zh_CN/infiniband/user_verbs.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/infiniband/user_verbs.rst b/Documentation/infiniband/user_verbs.rst
index 8ddc4b1cfef2..96bcd1bd37ad 100644
--- a/Documentation/infiniband/user_verbs.rst
+++ b/Documentation/infiniband/user_verbs.rst
@@ -2,7 +2,7 @@
 Userspace verbs access
 ======================
 
-  The ib_uverbs module, built by enabling CONFIG_INFINIBAND_USER_VERBS,
+  The ib_uverbs module, built by enabling CONFIG_INFINIBAND_USER_ACCESS,
   enables direct userspace access to IB hardware via "verbs," as
   described in chapter 11 of the InfiniBand Architecture Specification.
 
diff --git a/Documentation/translations/zh_CN/infiniband/user_verbs.rst b/Documentation/translations/zh_CN/infiniband/user_verbs.rst
index 970bc1a4e396..31534681654b 100644
--- a/Documentation/translations/zh_CN/infiniband/user_verbs.rst
+++ b/Documentation/translations/zh_CN/infiniband/user_verbs.rst
@@ -17,7 +17,7 @@
 用户空间verbs访问
 =================
 
-  ib_uverbs模块，通过启用CONFIG_INFINIBAND_USER_VERBS构建，使用户空间
+  ib_uverbs模块，通过启用CONFIG_INFINIBAND_USER_ACCESS构建，使用户空间
   通过“verbs”直接访问IB硬件，如InfiniBand架构规范第11章所述。
 
   要使用verbs，需要libibverbs库，可从https://github.com/linux-rdma/rdma-core。
-- 
2.43.0

