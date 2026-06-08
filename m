Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E933C18B
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901877; cv=none; b=cSvitDGTsdY5cO4t8wKfkM0J7ys4m5T78emxPUZhGa9CQaGbVbrPs9IyjIG43e9pLn97pwTEfRocijBTKWQwgY0cOdngslwbS9t7XqwbEuFwjQK0K6Uu+lOAKvt8SszicDUNDLXqyrVvlAxBwjZk5p3KXhpkgZxeDZnk3ImYJAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901877; c=relaxed/simple;
	bh=4qchsheXtUN9lVoh9GlKQ7z1L47obZCT1Z7CnuIlt0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DO8vJxUYglKnHcpeK3dI8YpJRIVf+VXB1j1HbAMGGxFaEY5CcnE5f3ejJNqL3U+nbBXRHBDn7lVmmxBca8e1DjY/pzvlJQWWTYhkiBeFWGcAVgN5PkeaUGxpmJiUaFY6GS895yKf7Y9LrUU7LGqkxPMBHv4+84V/F4EapQISjVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wt/Zx8q/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wt/Zx8q/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef42b6399so249611f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780901873; x=1781506673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ubq42riN1El7PoCOC8HhM4UEVQCQTgOWtnuKwiB/z8=;
        b=Wt/Zx8q/+B3AesbcOo2RjdswJ/Ow8nGupUsUwtPWLiDMTB+ouEvKgrRMtkMzrkj5OG
         6eT+VZpkt64wgTe4wpBiw7MfbwGRGrOrvZpI8eTkDJJ9lcR7PRajkSMy62Co9iIE0LrD
         u95dq35LwCPGPo9Oh/lrYU6QzgX4dHLqbMrIiezBEG7UdeOvp0314yq1NhYU1zXAg3lc
         Rep3THYdcY0OT/qJ2gD+T7Xg45nArSgJ7TzXhTfjtFC0yHMqvEZdR/mupy04G1w8Cymq
         lm94Oi4i44RZvszgB1D4viHady24sc+MtbuQmhgdzpfdy7+LgHT1ohXP0p7wsV2uTl26
         F2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901873; x=1781506673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ubq42riN1El7PoCOC8HhM4UEVQCQTgOWtnuKwiB/z8=;
        b=PSth1P8az+NC1uaIH0HTsFyT+nKW532J4imb64tATcofVOXsqcnkyUQKibGZIXWY2I
         5L9tRRVBb/frdg0dA/DNhIZsOxrWPsHweKKlAuibmBDaYaDO6ft8qY5LnGEiQVvPoSVP
         z6LGgjqCrPV2qiUg+0Y+G1mgqc2cxHD4IZzXVz96Oq1KaKklpZZ+J6O1wHfWArNa+fVl
         3n9xdqPIERiwFDuFmwdB3uaOOli9brYwOCZ593Wxpl5iw+MtAayKoEroQXQ4SMOZMawI
         JzXJz7ISgq6FrFICei3jk1hLyB2XbFe1PkjHUXUBWJuItUCkadSWh6lbloNBq/P4MczK
         1qIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zkn/EG4HisjUrX6SLdnlLOn0C36nIIuC7eabatsI3BC1O9J7F/9kV5sbEH+cddXIgHJLmU16kKfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyec0SC1TdGBs9XTt0VQDwfQSh/tfIRNZHrGnyxlSkYW9Ur0A+F
	/Qrvg8RrPB6bmiRA0E6I6bLWyhaDlGcxLJ507XuHuklm45diX1y3o7VB
X-Gm-Gg: Acq92OGAUh7q+MbjV7G5k37dpcBYx8/4HL/YB/q/o+eYuVdxDq8NDv8mI3NxgyJBHmI
	iniI2M/sHsNwcyVJzt6GcO6imoUn2QqziZ9UrgeDMnRPzyTBl0cBnHfCt0j5bDjUjjF4FpKp3R6
	lpZ8Yu3lGPG8fyjcwyR/EpsOR1+hpoSbL2TtwrxHc0qE1uO3F9n3Ff2NUKCFTk8DXyuHoDk0ghk
	/YyyY5noSmswZE0HJVv08uONLpc8DytKUaXhb4udvaGxiSuRsRxQIIdPiiho/VJmAC0ybTZVcgg
	z8e6x+9YFk2gERgHWm5YO3zmu8U9KnDjTXH4as5aifFEjLjnJjc10HejQyTWnuVeXiT7guMbkXN
	ZJLi0N+nTU2fOCybbiT1RWi8CAlyglHcklq30ePkxE4rNONgI9+7lbvyQ6SiP6eaANmivdWh8HY
	AAFA2Z7hDDMwjYpZk3e80lSN8WHISRWPen9krsnaOmw51XMzyLYU3EYUaRXHQOoeLbxg4BPv1dC
	+9lruwsuNV8R+dwvIxPafsbqe2DqFiNGQla6g==
X-Received: by 2002:a05:6000:1ac5:b0:448:8796:9c1e with SMTP id ffacd0b85a97d-4603019c601mr10555818f8f.0.1780901873053;
        Sun, 07 Jun 2026 23:57:53 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm89908194f8f.29.2026.06.07.23.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:57:52 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	SeongJae Park <sj@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	damon@lists.linux.dev,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH v3 0/2] docs/zh: update DAMON usage sysfs documentation
Date: Mon,  8 Jun 2026 06:57:43 +0000
Message-ID: <20260608065745.1587885-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523094420.741003-1-doehyunbaek@gmail.com>
References: <20260523094420.741003-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:
- Fix missing DAMON sysfs hierarchy entries and related file lists/counts.

Changes since v1:
- Revise both commit messages to follow the translation update format
  documented in Documentation/translations/zh_CN/how-to.rst.

Doehyun Baek (2):
  docs/zh_CN: update DAMON usage Chinese translation
  docs/zh_TW: update DAMON usage Traditional Chinese translation

 .../zh_CN/admin-guide/mm/damon/usage.rst      | 92 +++++++++++++------
 .../zh_TW/admin-guide/mm/damon/usage.rst      | 92 +++++++++++++------
 2 files changed, 130 insertions(+), 54 deletions(-)


base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.43.0

