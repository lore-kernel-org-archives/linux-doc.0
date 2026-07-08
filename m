Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731D3890F1
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496014; cv=none; b=jladdi4xm1wWD4FrUCoxFyfDLXVhZdg9Qeo5YFj1ViGbbxWJxuywWj5yZknPu9xQFutIKB0lejn9su90+13c48kjDTEn9zsd3tGrU0WhEb+7Zuu+CjI20u4jNLUMTvYwDaf1CF7DoEQRBrMNQCw94rZd5CnetEUXhOvTRZNXSYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496014; c=relaxed/simple;
	bh=ow91Y4E1mSY+pmX9Of1DnlWzxLiCg0lkZOWlo+tNkOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhliciYZZeoYfXcrNMpWidOcM2luAy7U7wNoQjKMbarFHNtwBXb84Xo9dpQb/dXTl5P4OtzwtROi2ztSHpkQJq9flwkUDAnGBae07fNiVkPMF6YD3MtE2jx/yvRSdxP6iB1Avj+gStUOmHzpbll3h1RabWr9zAlWTqO5aiPquQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ub5whoSf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ub5whoSf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c2c7770bso332625e9.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783496002; x=1784100802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prmr/Jndi+BNbM07sqH6cB8cxDm8c7W6tjC6zXyacuQ=;
        b=Ub5whoSfK+8uluIEin+GHwqR7I669upDB2mLOmr3nePTjtb7RPAZJJMwxdLN38sMm+
         LLYufxc9a98Mtnr1pruRhjKLpOEAhmr0GGs1fsxiFqfUCDyQKx60t7LQ+guCvgKPzpaV
         UMIC0NtKrGjBH47XXw56+70+Wmo7oVLGxkp+xzCvgpqKH7tYvxuQ3qguQGbqjVXeBoFe
         uKERAKTYRUpNI0QBHjaUSIX25/jTrvq7PnDsE5xrBEqorwbrCt3dX0sn4qbij5TqVOBb
         gVoz3BmG/Q733VvzXC9DBqiZgg/L6LgBngqooImowapP16DBPPJeANUwLwzRRFtzOQW0
         N23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496002; x=1784100802;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prmr/Jndi+BNbM07sqH6cB8cxDm8c7W6tjC6zXyacuQ=;
        b=g1qN/wlLnoByVNhlGeI+XHdWs8j7eldl4UKKicuaL3SSUQcZeSoIjKbQR/NPTenmiL
         5ctZSChQI1if0moU4p65hXCVCJGlKHxzKWVv/4Kw9hCr/JYrd4GVBDjElGSUCfgTVsnn
         Vl1POkkTvnze7Ja1xqpcTVlisykzABWRBWGCUw3HO+YtNrm4TW2NzwH2hr6tZU3JEpVq
         30KKm3qta/0coeh6XTX5Ed7fz81jNGCQyepjgQRAxaxTueXaYuPTd9X/t7+xT0sfqcSO
         MXu5P7afnewINbaWPFPijwn9aLkNcjcCW+HECHczGUDBkYZfeWYzM6BmJ4SLN9+irlUs
         8ZMw==
X-Forwarded-Encrypted: i=1; AHgh+RqimrkjBkzwXMiue5gNUeTmZ6CrIXlrydQl0KZ0M0DneU5M5vJMT7fD1WOX8RpieuMnlXwe/O1xvCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0VOy+85u4fVaJAl/m15pMkgh6/szBOrvUBhJde6gdSKPSOde/
	KLVrpf4bI+e60eAM9WGgzFIxpOFsJvG+76StygDC+zcJ8YcJNUMOmuSx
X-Gm-Gg: AfdE7cn0iXqxWvC4iOMTPM5WAev/BEH/ELyQ7gmkyesqDMGOLhSEcE64D9KmeDJprwP
	ddOhLcNCpM3ZBvQjmcTSBvNl8PymS1/YtAaU6YKqNP/5/IQ72QWlrGJlErKcogB3cZk0T9gnuSN
	m6NO6Lz7d3jpVKABURMeIXwViZMyrHuv28cNuhDPS2+t/pjWZxNxBY4vJgLZb3nWA3BJX6LOmYd
	oBPTIczp1MUioO0vn5yMxVv34NQjnk2GoNDMeTAXO09AHogNarmAyF27VZ1EXZRHQqinJ/71Q44
	dHlytg2k116DMryyu4LYeYosBJdL8uF4buRcZ2ZQk8TWWZIKzd/WKBIVQpZV734zsFGTUqc8gQF
	tSlwHQRm+cznbnqq4vLVU7Alu2Vh8z4XNdB7WfW5kJrkLrjWI07Weu/x0fc1f4msX5ygTCxJL1f
	dqGNyRWzlyjfhYT+oiAtBlwGaktK5H4jR5SYemgErUdyesvhE2n5ZCVAjnbXmPcmjoleDPu0gjC
	GF7k/yxUpni3ukN
X-Received: by 2002:a05:600c:828c:b0:490:b227:da9b with SMTP id 5b1f17b1804b1-493e6820934mr7102715e9.1.1783496002095;
        Wed, 08 Jul 2026 00:33:22 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e610532fsm32876355e9.0.2026.07.08.00.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:33:21 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH v6 3/7] docs/zh_CN: update DAMON index translation
Date: Wed,  8 Jul 2026 07:32:42 +0000
Message-ID: <20260708073246.1652828-4-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708073246.1652828-1-doehyunbaek@gmail.com>
References: <20260708073246.1652828-1-doehyunbaek@gmail.com>
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

