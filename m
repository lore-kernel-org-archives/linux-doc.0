Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928A83876D5
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 07:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036712; cv=none; b=gSqlt3+kRqoxZxoW3dTSyKTNn3fqXqyXp1VVqFwwCj4jsa1uBF2/9ClvXOPXux9GPz1qzQLlqV1jykzgRWXNRbz9zSchYlg5Ts5AlVh5np2UmGnA0ozt8EB9CKv6gUEaXRenay7Nx8ZGRydE3aLKJHtBVOghtmmjRwp/juGxx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036712; c=relaxed/simple;
	bh=ow91Y4E1mSY+pmX9Of1DnlWzxLiCg0lkZOWlo+tNkOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SECfJNKZS+12E4kRiqO6DEZNnJkRcmZf4ssDdz4Fa4zyet65rYDescOdcN7gqQRuruxKGxRfGamyg1CbmIIOZtV9WruPoYiL52oxbYssjNdqQOJrhPfHzR8fjKyHOPA9iKrbM2jmlRrfuO+3r/XFKHR/l00ZGE4wmfKRnc/p3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDikHvDH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDikHvDH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495773ee3edso3481415e9.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787036709; x=1787641509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prmr/Jndi+BNbM07sqH6cB8cxDm8c7W6tjC6zXyacuQ=;
        b=EDikHvDHKMqsE9GOSfGH385YmXNOG5r9kfhzVGylgV69KCcjyXZyuyCfQHYswvOWUV
         6w18b5IrXQdMyyXb2ihNT3TsszRJSt+uUnKRJbOUGuWQL8kkcFOcSsYbG9c+DCpL5kWj
         vSo7JPSX8qZ47xEp8S6JjhNM4StN951J7/zGHRyFi68Q4VdwhaE1ieYgtNTMH7vblUJz
         xXtvJPha67yk8dLiRuT3REi8Eec64550odsEaVzXyeEKKHoy6wePeDXCySFeyPaA54jA
         1cmBp7jK3v3PVYcNnJ04Dl+45KTtOBZWTvVsAU+iN6OcHtH0pDwgfAdf25qcEzVelem+
         ZJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036709; x=1787641509;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prmr/Jndi+BNbM07sqH6cB8cxDm8c7W6tjC6zXyacuQ=;
        b=llLkP15DJhDws0UTdKNaQvGoS3q5VeD+ApjtHuDMQM36wGJGKrZVVeSUx1vACqkYFE
         ExCiiad83R+0tcn2Rdidjl3VHAVRQJ8oZLcSspopEO8FuprJvObrIVn7SwEfJrDrcJpV
         xtFeLaSfHwSms+I1e7JeiS9N2Av5wddYFMgAFCA8Re4ht4s/CQX82TDDhkARjN+QsMeR
         CvbwSIml8ga0Oa0jJ0W0VXn3nWvTbXB/PrjGPXjMossAPmyeOne8Hw7/xYRmTPtXvGYQ
         PT2kA8kn6R6ie/KdpgRKcx64OgAc5hoXoYHIC3wbyQfo1tCdUVFiLhOkn2vUqemQ8THu
         izFw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0xgEatZjcfNy7giXBAKA1dWsYrFCJMFaGl9qPscXlP4U18malFnwoA0S+/9YgbVLYDnhqlgHstO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9OcyRWzln9d2USFMYTxV+mvzmLEOsySLcGjUZpVDSDpMjSZ2y
	kedroC2U+y7whuDSbHPzr4HfLnaRvKyFTHCfUOjhuUVHf8wDgN1MrIL1
X-Gm-Gg: AR+sD10CfqrCN/gmUKPymxuI8YPuZmY+HTtIObJvlc1Sjx7BChBRI4IVrg9dWdDv1BC
	ArQb7MAslEUP4LUj6dAg6jlpaQ3wUbtQPQNEPlHb5225FotlHgQyR8GXPMMoo4IR8egkVg1Pb/Z
	PbpWPtPb+7nDb6CobbFZL75N61yuTv1ye2+k9lMH7/oFNUJowvItiWXEE7K4fK7z2YxwS8kBeJW
	zxaYnkAUABU9oy8fqWd1QpSIXEUDmV7h26xFw9q5H77z8TTgze0evUL3yYJK3PM84mosxDVdvKT
	6mShUrgyHACZrbfmNurMoB/1glZU+osXQ4t6DIWc5hjrXDzDS8zdY2ARrOifHlx31Go7gmsLDjw
	jh4Ej3gnjdfxjfVk/7eFVwCFDVThYODSOjFivw3OogeUhWiFVGOLktB+CQu502EGw0x/UbiHwp5
	UYeOvp9tuRrmd+XOgUPqOIHDrlWb+ls8ySLFMoJsHe+flQgoiTALD90Z2ch3UvWERofjGEX77Pk
	eBsFxutse7SXsRlrG7D+sseBBkWB2Q1LJFTG1PFy2aUlM3tkbVTK09xsFw8BfwMPI6Uxvqe+bAf
	XSCIkWwMnZSJj3ePGG71i9Gbif8IuN1zbjI9K9830c+QFg==
X-Received: by 2002:a05:600c:1f91:b0:499:59da:12b9 with SMTP id 5b1f17b1804b1-499878cf8famr209718415e9.0.1787036708705;
        Tue, 18 Aug 2026 00:05:08 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996188217sm495557495e9.13.2026.08.18.00.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 00:05:08 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Doehyun Baek <doehyunbaek@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/7] docs/zh_CN: update DAMON index translation
Date: Tue, 18 Aug 2026 07:03:45 +0000
Message-ID: <20260818070358.455768-4-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818070358.455768-1-doehyunbaek@gmail.com>
References: <20260818070358.455768-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Chinese translation of .../admin-guide/mm/damon/index.rst.

Update the translation through commit c9380cdd949d
("Docs/{admin-guide,mm}/damon: fix DAMON documentation details").

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 .../zh_CN/admin-guide/mm/damon/index.rst          | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
index 6f8676a50b38..77bbfa7c25dc 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
@@ -9,12 +9,12 @@
 
 :校译:
 
-============
-监测数据访问
-============
+========================================
+DAMON：数据访问监测和访问感知系统操作
+========================================
 
-:doc:`DAMON </mm/damon/index>` 允许轻量级的数据访问监测。使用DAMON，
-用户可以分析他们系统的内存访问模式，并优化它们。
+:doc:`DAMON <../../../mm/damon/index>` 是一个 Linux 内核子系统，用于高效的
+数据访问监测和访问感知系统操作。
 
 .. toctree::
    :maxdepth: 2
@@ -23,7 +23,4 @@
    usage
    reclaim
    lru_sort
-
-
-
-
+   stat
-- 
2.43.0

