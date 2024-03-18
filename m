Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3EB1E86E
	for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 14:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710770512; cv=none; b=o9YR7zagWUUps4Ds2Up6+qQq5Z5ku/mUXMlqDAr1EPOlVFX9jFi73AkSWrQtgFcAz2bG3OsBovSd7Nb5K0k4sIdsFDGuJdymR97zlqRwm2hZoTWm0LY8HE7K2QJK5jy/eKQ981Ltr0n448ju2JDTupcSns56rlOIF9t22/ZjEns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710770512; c=relaxed/simple;
	bh=f42QFd4ddefzRhFvX01zEygFICB6QwBMsFIpmMH/hFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cj5VX1oMB+YrkVQo3A68Dx5RTkyUOfKzvl7nmkKz39Zx5X4bgmphM7/5XLXGWhbyZgtFtWvUVNrS6Emqq5Mi7ghSbLPJKXiaCeFLOWFT2aiOz8ADt1zPzmhgYz2UZqdkq3HvQ3jMSKX6MGOI3kcxlVYgN70SRhRcdYv1Gwm5iBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wc5lPKKI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wc5lPKKI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6b3dc3564so3574375b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 07:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710770510; x=1711375310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ru+3XtFk8Mldmzt5Sdpz3/O0WvjijTMcQiSboXNacQY=;
        b=Wc5lPKKIjzeLg7a18NNDKw3mNm/pnBenC3hhhTv6DC4wUQ3hAgUMwuyFc1z17MAnv5
         0d7vhhcGjaTwIuJZvJcLO6HxFaO0OsjkKAz79lGRRVmCF8hv73iwGrFIWqBU1LVsI9jr
         sWsHf2DIoZKn7yAADDufwcFONKBeQ3Qn7Su9pYh3CSeMN6khx6Lupt0lJ9Wf1M5R/snW
         w8z0IKb8rMbpjcdR88dN7hHMo6XJSP8JQorwgoghYN15JXcqLOnkjn9Pz6R1Hbxha+om
         xMwJ6yu1UcRUYglDU27pOyZjHfr7b1WYiUWY/cZucyGvBbEXKOk3MG95KrxZqScjZQa4
         N17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710770510; x=1711375310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ru+3XtFk8Mldmzt5Sdpz3/O0WvjijTMcQiSboXNacQY=;
        b=m2TeXXn0t4iQm4Vlf0ihLFiwKeKYPlqS1tIp6HUW65aGKacmiNLKlBT/CYVJWn0flP
         FLcho9v2QLyqc4mKcmUyE36xf+m8m6FAPmA3nU6KC4ESUDtX4gf/eXX9bYrtKsFBCgwt
         6NFflNHbG0QiAHGmhTeYAi0TMCpMC4x+vunQIlD7A6s+K3/Ynlt4EgIOmuDC1Bo2yIOl
         V8oq39nGL67iaCz5eeM5wOSrkOK/84D7MdW/NjMnRoEDjE6+2fd5MzKp0xJyAz6ccGsi
         7F+KJFx/xp69ar0IKX7WbuvQSM3RkdpS5T4QXyj/SKAr6BR2bMkEt4mcIVRxRAbMDzRt
         kxyg==
X-Gm-Message-State: AOJu0YxBAF3rgArP7Uor8QTXP+p+L1/xYn8cd9O3b0LpMvhe2h+Eh7TI
	rkrBR7fotWWroKwJngmx9eRenukOm8eJuA6mX4mMOGTFbzQz/tdYNAsil2K7B3wZZctT
X-Google-Smtp-Source: AGHT+IF2+iFzHa3o7Eyk9n141dqRNUwOcx6S2YPox7xllFm+35y+l1UIX7OuWbzLCYVuCKNT5Qjn1w==
X-Received: by 2002:a05:6a00:39a1:b0:6e6:7af6:2201 with SMTP id fi33-20020a056a0039a100b006e67af62201mr12735631pfb.8.1710770509994;
        Mon, 18 Mar 2024 07:01:49 -0700 (PDT)
Received: from localhost.lan ([36.62.84.199])
        by smtp.gmail.com with ESMTPSA id kt2-20020a056a004ba200b006e6233563cesm7882475pfb.218.2024.03.18.07.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 07:01:49 -0700 (PDT)
From: Weiji Wang <nebclllo0444@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Weiji Wang <nebclllo0444@gmail.com>
Subject: [PATCH] format shell command as code block
Date: Mon, 18 Mar 2024 22:01:25 +0800
Message-ID: <20240318140129.21986-1-nebclllo0444@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This formats the last two shell commands in
Documentation/admin-guide/mm/zswap.rst as code blocks.

---
 Documentation/admin-guide/mm/zswap.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
index b42132969..85612d705 100644
--- a/Documentation/admin-guide/mm/zswap.rst
+++ b/Documentation/admin-guide/mm/zswap.rst
@@ -155,7 +155,7 @@ Setting this parameter to 100 will disable the hysteresis.
 
 Some users cannot tolerate the swapping that comes with zswap store failures
 and zswap writebacks. Swapping can be disabled entirely (without disabling
-zswap itself) on a cgroup-basis as follows:
+zswap itself) on a cgroup-basis as follows:::
 
 	echo 0 > /sys/fs/cgroup/<cgroup-name>/memory.zswap.writeback
 
@@ -166,7 +166,7 @@ writeback (because the same pages might be rejected again and again).
 When there is a sizable amount of cold memory residing in the zswap pool, it
 can be advantageous to proactively write these cold pages to swap and reclaim
 the memory for other use cases. By default, the zswap shrinker is disabled.
-User can enable it as follows:
+User can enable it as follows:::
 
   echo Y > /sys/module/zswap/parameters/shrinker_enabled
 
-- 
2.43.0

