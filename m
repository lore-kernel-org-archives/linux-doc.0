Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71F78F43
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759732408; cv=none; b=goGN90tREZYCSOdNm2yYH2D76CWYaE+vwutHyc7ro12F9SVa0LfYUlvVyf8CU9RbUJ0oQRun+gDMmvVMWWB9i+DP009v9z+Y/RWfF8iGZcquovxFjOqwS79dFNK3WqXS5rn3z50w+aeIab12+y5UlLBZSJHfjbWcAWiMjSj8IiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759732408; c=relaxed/simple;
	bh=vwgN4pd1wlJ5mJCQPllmiwAEef2TsJydAXGY1owNoAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lLiA22BQx/Hk5XTdvmLjnzGkkRaPuj1SGAzCANah6XKhvSS+KW6IPFzzjrFNKqaU5kqPCcGjS7V6tGYpBLO9MopnH85AQPeATTgRlRTVhRY4QjmnxgX9zo9KNlYHuv1dHFQUOtkk6/oex8dJNL8dSw/lckeUAZ3jvJvGMV6uroU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKUhV9Wq; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKUhV9Wq"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781db5068b8so3644705b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Oct 2025 23:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759732406; x=1760337206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B89nSX8bjjMwsKo+3NImU4/R9N7KISOzbf8rIhnLQX0=;
        b=aKUhV9WqgiG99ifBlPDiH+VTOcZAzl4B1hMZdtcEkJtfMz7v3d68H+8P9J7Nv3MNZz
         rA7rfRZvh8QH0FOsw2OfnkQWxCoaB6+kg9soHOVl5gXssJdxVpTcqfWavKppVNfyntrP
         zYTzeV9jSdAJWxwmg34ySzP2VWE6sTMUGt3FJmz0PItBDTQaFuUmk7wknnJ14BUH0H+s
         lN8cIDrropiE944mzHkeXRyWqpAfbhahFjcuvWFQkRVRXGBIxNC5EixekttjrW9RZFnE
         TTaQ1a7eIkm4Mxysdmj0ScpKe+aBSSvJWlTwwXo27R5dEgGJsa/puPU2qeg8JgzomBNt
         HdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759732406; x=1760337206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B89nSX8bjjMwsKo+3NImU4/R9N7KISOzbf8rIhnLQX0=;
        b=X0M7AtzMcSvgk2ALYHXHsgSJkX8YNpR52tsPfZ2WsSBhUFzLk/8P6x58TIuWVYOgAW
         SeMhQ4QdCT1PpJo/iVGhNvqVzdkPwaldy/MSa1ApCSyv9N9VGi4YJaF1VDlnOYJ5ij6w
         NAYNVbHbTrIGymz5jAOufUfx/jkp4glvkwROF8hsRi/RBZty45XYI2/DKQPmLp5iNNSZ
         YQ4Ofq1OROFZVRtbHhBN3eREg/n14hrjCBMy55N1u+UMtdlNwwob0MGWdnqR9FMNJ3WD
         CZJh3y5DfZ7weoUzEjDxIgUx/GY0DMVHps6wI+kPgazmDulaB8rza9nj8Nue3LaVqaB4
         eArw==
X-Forwarded-Encrypted: i=1; AJvYcCXDrTY+cTkIAE4zsMW0bKQ4mypcsFQJ1vUHDN9mxf/HGcuuvGDWCfOYmMkxKGr1JoxzvSpk4PBZ450=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKsPMm5nf58LLX0UYpubD4h3OLYe6nqHi15tyn7q2P9rJLX+I
	EutCVuPcT+JTDzhoEnIW1Et42QdmH0+X1fcJLk2gpDtOHyNkKmAGysnS
X-Gm-Gg: ASbGncsr04bBub3XObXf60Dicl7NhHq5/4zHA23E1OiPBBMPY9XHbe0KduBbA0LAd5q
	Rh8uFrjy5xprh2JqXj94u9K6FucVdJ8CtPoSqcDpupaUuvp68emDIy2VH0/HjqsG27ocwzQ94gp
	ChjroyOD3W6cyCw2AdC3bNIjvv8/MbA1e6YEru64914XeHoszPVSS09sHceIP81jelx3D5bOGe6
	UZyH+MDpGhH+jWxTGoiDwatqMdnHXoh4tKi2YsrwZlx5xPnR8jQUS+ZCgpZzz7gHfRJ+sP6Kn8f
	cDbGZlgmro90QT3S24Uee9YSwyxg9YiQncg+OfXCWVcNb5ivgZkLPA4iMQzCnVuMxC8M6jdZjKg
	XH2ATlBh4HToIxYSehwhQ5IgfHhWt0kWWCNQtFBGMdU7hj+Cs+3KpxS0xpDCFEZ3aew==
X-Google-Smtp-Source: AGHT+IFu0jCCiRVEKF2vGYTKY0UmpfJP0HPhcbwvKc4WgpDQs1RP25o5SvejbRWdDVPcvkwLb5opvw==
X-Received: by 2002:a05:6300:218e:b0:2d9:4afc:e1cf with SMTP id adf61e73a8af0-32b620ea86dmr13981515637.47.1759732406022;
        Sun, 05 Oct 2025 23:33:26 -0700 (PDT)
Received: from LilGuy ([2409:40c2:504c:58f0:9c58:4a8b:65a6:88b4])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-78b02074663sm11626212b3a.74.2025.10.05.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 23:33:25 -0700 (PDT)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Qais Yousef <qyousef@layalina.io>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Jie Zhan <zhanjie9@hisilicon.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] Documentation/zh_TW: fix malformed table in cpu-drivers.rst
Date: Mon,  6 Oct 2025 12:01:50 +0000
Message-ID: <20251006120154.18348-2-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a malformed table detected by Sphinx when building the Traditional
Chinese translation of CPU frequency documentation.

The issue was caused by misaligned column widths in the grid table at
line 109. Adjusted spacing so that each row has consistent column
widths, fixing the docutils "Malformed table" error.

Tested with:
  make htmldocs SPHINXDIRS=translations/zh_TW/cpu-freq

Based on commit 47a8d4b89844

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
index 5435c3928d4b..7f751a7add56 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心層註冊一個cpufreq_driver結構體。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在兩個頻率之間切換所需的時間，以  |
-|                                   | 納秒爲單位                    |
+|                                   | 納秒爲單位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 該CPU當前的工作頻率(如適用)          |
-- 
2.51.0

