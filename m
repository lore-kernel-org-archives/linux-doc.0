Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E14C2DAFCA
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 17:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513197; cv=none; b=bDPkpA4+sTSMKNXYFNIpGCuFucWbv4/U8L6Q2IjIBB1x7hSqVmZRRpMHvnNX+alXAJ+rGxLS4NilAA5HIpgB7jfOl1aEszWVuDICBNWeogz2a0vN+cqBD/hPkYqsdGCEGym6O2nYuXihfVectoDLm2wFGqTF7vKHTADqAyHdbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513197; c=relaxed/simple;
	bh=K9MnDj8zru19z4WabVyc96zz7IXhP2QKMqGlIBk5Aw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKrcMaFFuTi8DKPN4yIAN4sS9RRzZc+DcaiXZkVSfhUfe8uW//COrwbjCbshXgJH55/mZ9eKYsjHt0jU9iJfY7BpvYLjulSjRyGgevIbcbUjnUTIEOqLXpetfwctqE5NOimY+XjeCWeFb1RLqZG8EEp3BsR94k8pKXBeNKkNg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrlGpn9Z; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrlGpn9Z"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-269af38418aso29621945ad.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 10:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759513195; x=1760117995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McKrphvnyhX4IqUDStO+Mgag88IPYLvjzv/054SeX0U=;
        b=GrlGpn9Zngig282ddCeVNdxUgcvY0Q8oBLwm34JfNQOC9AN7ktOJgJU1XtoJoUqs0+
         RpbLg0OchZB6hwgC+6cM1kd/FIhyGei7quVs6KCte6A/m6wH6ENc+lSvZ9oOCqfoJVVN
         GBJGtCO4vprQcullXTrb/Dhp4JX9JCGX/8kjRx35vVu5xTEmTeTZSAVWi3CmQz2YnuEb
         KzlrHNRpqm3jz//WQRqBtcKaL9qjA8NhjHMiEilD3k0QZj1vfzzE7LvWwLXpjAzIS6Gn
         ZFfTvKx0A+jd30S8izz6Pri7VmQZqTU5emDwCxVjKCKBFg5grGQqoipInr1lPZkN+pM8
         m+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759513195; x=1760117995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McKrphvnyhX4IqUDStO+Mgag88IPYLvjzv/054SeX0U=;
        b=OzscQhuIZkXGgnIdBVPAdxQBPk6Qh8BoWtEPRFqyHbJS3Qnh8NhEyEkr6hiDzqr0oa
         /MCx91yYYS7Clyi4gZupCW+m0eQHri7Ae0BwybbJSAKhiwfA0/gftO8plqh/QzXos5l9
         VUnA27CW59t2M9nSjsij2vs/IL87N/2AFJyalWideqffS4tbw85BNE62PIpr8hiBb54u
         DZU6dgEhEX6wSF2gLGPF5FkZk3jTtWqVzB3ST0stvjq03eFPuejJ0nqLpi549ZSDHX39
         rKue9QAPTtkv4WWHAdOYBpME/czchV4shIiACOShKB6Tx8YnlBtv09SdunHvL9vQohPQ
         XR1A==
X-Forwarded-Encrypted: i=1; AJvYcCWEOUbFD8Y9TPi8aiPLFPj/5AIoKkrHeQjB7wGn9p2LXwI2fEkHgk3DaOLM9F98zPO1MhU+9MiYf18=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxJ8HiAnaitsl8gLIZVKGMN2Xffr59uL1v6+G6jiq/W3UlBrpU
	MH07ES3TVqM41UgWxj30r5ex2KiklvBGhUZ8fKlJsE4rezqGdLIe1uzi
X-Gm-Gg: ASbGncvn8lNjmPOUui1R4W4m6yPtphj9/+AvJ5LAqykB7eMobw1641JZNxLEKIAyH2+
	e6WPbiCUjyB81GJVXyRm4nIAIK/qcEF+jLx6SBnag9QkaXPucnd1lQ93GrRHsKkV34gXUUijMv3
	pKl4/bzmqw8hJ+/Ye1WkC30TGEcbzRU78yo5GOoJNp+XipC7M1tUSlP4CHvZfBbb2sbuSNsMBBe
	jNJk+Pi08/cqcyOm++9ebkmUKS27XCC1BwVhxFxxOgM20XlwIxcD93nZXsiN9LN6ijD9LsbktL8
	2LTvd600WLdt7x8koY5keAnamYWbqoDcjq0nQDKXqLcYheupZDSvP1wnakR6IGav1LunYP3qakL
	FS0KuV2vxSK9Xi+kwsd6BGUOga4FaSQqBY5tCM3qzea9ZPiJ2S22vJ2CRfwiWHJAH8g==
X-Google-Smtp-Source: AGHT+IFxK5aSMu30u6TJURWj06wmVP4JpzEOP1enPdk3/3t/y0sloBrTIpKjewn/xJuh0/y63HSRMg==
X-Received: by 2002:a17:902:f68f:b0:26b:da03:60db with SMTP id d9443c01a7336-28e9a5ea070mr54639985ad.13.1759513195403;
        Fri, 03 Oct 2025 10:39:55 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261edsm56267635ad.34.2025.10.03.10.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:39:54 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	zhanjie9@hisilicon.com,
	viresh.kumar@linaro.org,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH v2 1/2] docs/zh_CN: Fix malformed table
Date: Fri,  3 Oct 2025 23:05:59 +0530
Message-ID: <20251003173926.10048-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003173926.10048-1-krishnagopi487@gmail.com>
References: <20251003162626.6737-3-krishnagopi487@gmail.com>
 <20251003173926.10048-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build error
in zh_CN/cpu-freq/cpu-drivers.rst:

Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst:109: ERROR: Malformed table.

Fix the table formatting to resolve the error.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:
- Adding missing TOs to the relevant maintainers.

 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
index 8238f4c6e4f5..2d5e84d8e58d 100644
--- a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在两个频率之间切换所需的时间，以  |
-|                                   | 纳秒为单位                    |
+|                                   | 纳秒为单位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 该CPU当前的工作频率(如适用)          |
-- 
2.43.0

