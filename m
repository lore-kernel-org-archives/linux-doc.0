Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633672;
	b=ojwAldclRgdbPy08jli40Hv+xZRK9Wx0UMAGWoEvZIic7lIrkN2J0C5hdODeoaGE/W0Z
	 gCo1RFmPwGBLWZkATgci6JxDiFaGqCpvQCtMgfmlxvtO8TLxUZ/j90KFSj65WEJyI1hNL
	 kMJ0vspzIk6x496PNzi7ibgycXZDy1dmZZNAIY0WuyjCterHs2jJtBSAMAGfyI8YbVMVR
	 DaPYm0kP2Vf+vcrNPHn4kzd7hFW4V+pXDIIPTiqrog4BTSNxI6PvCKyj2hdgrtimUUSRs
	 T3aiI97h+EZtrQhSw/abHsZbd7OIi3uVOqzluRirqlcKdD5FhO1Q+m1iskj4GOH5+tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
	b=26Vcb6Rpuh2kIKblpkLWbHPe8dWG/T7MBfFXNXXSzvgQPay+OuYSaArT9hnw4Izb/qx1
	 8v902BJLU92eAOZLhELxa2SRc9ZUbNykD8pB4VWkAyj9Ffw9rT2dViW5HNR2797iEZ4Qb
	 tD/ZhypBnz54W27mDHCXqk2qCEQsNAfwUn15kqxprldL5WId3aOQo+SNJGaVIDRFpw0n/
	 LmOjYSBq37Wl3xFChW3cHGgK/+WoALK7rbDg/65Vt38yWrDbOW+KIqofqpMf+VicTgTfw
	 Du8A2xh9Zl9FgP4D2LgBFQmFi3mwhZ+DS5hDfzRmc6bV5eQMfOLVTde5QjGjgyhcMuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZENFQ8;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C42F606A331
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 19:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C42F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZENFQ8
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b5786e099cso4572652c88.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 11:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633671; x=1796238471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
        b=IPZENFQ8+nUfUPdU5/BAlejZdB21DpJJ9TBHmw1H3RyPgU9CH7UK7dfJp17y4rm6sb
         oQhEgNUkXKkhqklAF48CSxETEkYxf9IuenME0V1c1IsGwsJlRdAs6NumOPv16JHLJoRg
         8uwj8QmzErb6jz4NYbIZAPZSIgwgIFXy7iWuwQNS3ZabBlnkyzOWzouuw8DVkkfW+6tq
         5g0yos4Ioz7P/mJqFaHMOs6QOl0rEeSTKS9vY7ZBZarPDkfBzIeoJiAAfBJOeNYBd50a
         BGQfoDsEE8y2rGY81xZKBt+KDUpvDCH1FW4rLjH3IviTzt0DCXRY0TKYp6s636IW2JcO
         ni+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633671; x=1796238471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
        b=YGSHYEZUuiEnf19oPgkCAwwzDbkv7XRbQfr6Ecf5mskCy0GpCpqOPUtnpNwMTla0tg
         ulu+OCNzFd2vyOjYaf7lLTrrWYBZNmKEiRZk3DyDFMxgb6Yk/zVwjEglqD2nuu06k+Fz
         rWI5ryk3vF4R64wxVsTZb1kEG5qsJmuW7G+p6XyWVAJFMlyztaWuDiO0j0q6WplQzT2z
         6JPlGxwrtL9bnP2DKSSZwmHkdciDQAJ7MBJqmOnMu4/pFDOcog7HicEWzAXx1wohEimU
         NLUFe5yYXOAi5VHX1cWwXXGJOh/V0iIasTBvI4/IfIulub6BjKrkNvga9wuD8HjaOWoo
         klww==
X-Forwarded-Encrypted: i=1; AL+hErH2sbB1+UUGJmD7ITdByonBEWFKL4+0kvGCRM1D35r6PuJpi2eCkVO+/g374No1ht1DCLEPDuah7PA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UND5h+JMxBvgbcYMVn7oovhinkeEsTKJ/qc663JK4grqlJ9qA
	om0NeR0xQeOSLNn4qIyLwVvYRHXXnl42cUiLWqGskMShpQ+sdMPvpycK
X-Gm-Gg: AZFdTZfPx3KAbqX9zCn6fgCjDjHBNc3FLJO4A29bP5yCi1A51d1B8vONwzXPs4sRiUE
	m3VuJIg1/rkLHxkHQHCIIoqaIJAtdso1Zqg3lr+X8aNMsS0OWJB94Z3gDA+KCmj6dsIXu8eD6aQ
	3cRdXL3co9lzrsS7Thxr8cF7fSYeqNkHlofycebhwiyBhNT891ZWy+pNCXbis3wLZChclX1e0hO
	spl1y43BqhgQYZA4C4P2eDqZGX6SuXv5uWxXaHGrHD2e5HUZ6wC5DRb1hHVwIWLA5sziUuTMrhI
	8eqWpxGVysO7061uirH/3p18ENetWN3EKaX31HLePyhbMMIr8b3c0IdncOkDe2Qn+qxym2hokcy
	t+fomuz05oFxg/qZ8b3STur1PZBm4IBShMpq9MDcbJHvqHu/LRqfl6z8V365PXxjBt+xL+gvO6T
	WNqKz8Sj9rYx5U9FZTzlIA5VfauJi1+Qh/y+BCgNWzP/mXRnTZMbLpSMPusHsMe+nJrDYyuGU1w
	wzf7RMZbfEMEzeB9R8uaLsJ9XY/xyflBhclEmhEPzj0eGNGT9a54HjDbl91+cAUBDRLdhc6+hxm
	VTc4FgVIwr8/RN5ieomG
X-Received: by 2002:a05:7023:a8b:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b5568feb77mr18978686c88.25.1795633671181;
        Wed, 25 Nov 2026 11:07:51 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42584510c88.2.2026.11.25.11.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:50 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 3/3] docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
Date: Wed, 25 Nov 2026 19:07:42 +0000
Message-ID: <20261125190742.2420486-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125190742.2420486-1-takano32@gmail.com>
References: <20261125190742.2420486-1-takano32@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4e29dd3821df ("Documentation/ABI: Add new attribute for
mlxreg-io sysfs interfaces") added shutdown_unlock as a new attribute,
but sysfs-driver-mlxreg-io already described it in the October 2021
block.  The tree ended up with two entries for the same file, and with
two different defaults: the older one says "Default is 1", the newer
one says "Default value is 0".

Keep the entry that came first, which documents the behaviour in full
and carries the kernel version the attribute appeared in, and drop the
later copy.

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports shutdown_unlock twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index f59461111221..00cff8965b22 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -741,18 +741,6 @@ Description:	This file, when set 1, indicates that access to protected
 
 		The file is read only.
 
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
-Date:		May 2025
-KernelVersion:	6.16
-Contact:	Vadim Pasternak <vadimp@nvidia.com>
-Description:	When ASICs are getting overheated, system protection
-		hardware mechanism enforces system reboot. After system
-		reboot ASICs come up in locked state. To unlock ASICs,
-		this file should be written 1
-		Default value is 0.
-
-		The file is read/write.
-
 What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/boot_progress
 Date:		May 2025
 KernelVersion:	6.16
-- 
2.53.0

