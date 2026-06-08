Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9142EDD69
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898601; cv=none; b=qwjoNeiiipFq7qUZq13bICvhFefpEWGjIggjpfDEMCrGpQs9mttYFyjc2Bv22M1wNyH0BZBXr2PlH31AFG364gzoEFzw8u4Wk2mrVUUfJ4azBLR5lnhtMCEmezITPNzSUfJ2pZfGkQjXCTOO30hBYtG7/OwQRS9eUbijNZcyYAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898601; c=relaxed/simple;
	bh=qfKaMWmF0sxnjH+gu9kp51f1jwGLmJYv7TRXGRVBt0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJyBWv5YYBwJ62LDYvO18HakKcwy/7U6TI18Quavj4xcbS6WrTiee8fmcevTfsWJPMkk/fn8adKIo+IvvUmeccNBhyRU8ZfcsKeSOph74+NIKsXGkNAPOhmGuMJLsw8XmEwfhNQ9c/besGhJuQH76lMfMQaKeFcSwmWBIWTzTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVuu/gQi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVuu/gQi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ae0812c9so3431785e9.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780898599; x=1781503399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZSzr00MGkKxaluJZ1HWpON2lHxunjWudF+1j2Ezry4=;
        b=gVuu/gQixIK1WXLGEr+9LsyNY4XuP4LD36lUbl1V6rcxuUNvVfI0PNqfcpvjltj8XM
         TboA6tXEMUnaDFwJ/SEwVkGybZLjBC4+lcvb+HCOZUoPP3i1MvDdr9l+E5nXGqWeZtwq
         rZDZlsMphlUMELTAKEU0l90E0gSNM0B7cOB0ds1cnIrGsk0TEA8zy4Qm1oS5ODUL0Dob
         bRXxySUJYyclvTlAHda4P4z4Q2OaXBSUKfTMReximBYpkL7qrTof9UQug4A9FuVY/d6G
         dtkFiNboLjHyJsNey34SVLge1+33QjpnihFhn1NQFE4KxnRMa1ygWcHkkXgPoaRAoyqp
         UpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898599; x=1781503399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ZSzr00MGkKxaluJZ1HWpON2lHxunjWudF+1j2Ezry4=;
        b=qEASRaBrWBEPyke36CFjgb6kkzAv8IP7DDM1dM8OtzFGhjiDU7j/qQbnBc4ST8bL28
         yzXILiTc68si4PFzU8eEqXz3aQ1eVuGZeX6yBSmnSEhRXEHsTPietMTos5FpgZr5Vnl5
         tbKjzP4vzbT+wzZuUI3S7/w1EaFTdyDIkxAbna9CxeIISWA1bUWmAxqKyZomqKqcyAEo
         bH5kLiqHn5663K4cm7iRnfgu6+HG04H+Tf7HRuH/38GBj6rmwcgDb9ned0Y4cYpEF3rX
         4/VkQs94N1QGTpfzpxDApKqLGN6+qQa/HUEoPsHtwYNCyFAMMRX2ZrggsGBHMGb5Zr+7
         85pw==
X-Forwarded-Encrypted: i=1; AFNElJ+/W4LEEF5ANuCIRePha2qqmzh2M2g2PYu4N8Pxd8EKdutPLC6WH2enJC1SUyhWBv+8EHLGjMuUjho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6204oswQrC1zttP8rtQVeQf2+gmGjYBYSLxuBIq68n7ulTvL/
	H15Y+prm6nhDbNYM1bZ03jzFHF1yic1hc4EEJhu5GGbo5UM+zg+/4gjt
X-Gm-Gg: Acq92OEoQh+an2X68C3/IyXmP20wY5/vK81bpz+xEjiWsPLIXPjTgayq1e0qIkx3+b2
	Y0WmIWILgF2Ud8GCUGHFnXfP3ILS0Mp3dnozVW2ceeKEa/HAUx+pL7mv5izrg6gu5JOHVKxAUce
	2jfgQJYxn0ScDz9XLtGEz2dsfLc1hWiWLAYBe6Vai4qJivD/l/IV/sHuqoKD1+b1EwgozIo6ssU
	v9KcOtVrcCefNl4Wls1QpviuYlbQO0yTIOmKrOWQ3P42huIxyY9Vm5eS8bRJc9N1CqRnsNqU5Q0
	e9Oo8++1WnQLqRoQA3k7EXqQGMS5+y1Kcj1g6G0Xk7YHB6R9k/iEs4CpuIa1hj3DEceV0z92tAx
	Kv99j2o261hlWElN0gXEEhKYVIBhMc4I1n8PPFN+bjVF9LAm7hV8GSzDuNCz7ESfFmohZoLL6Cv
	f6Lpr3t2efxA1exF6v5FvCpkOjl5nF/XJHvVDHYd3WcrBayKVv96A79TzA6kuu6c/VPCuvLymqe
	Av8QA+5I8WSgpz+UNxcqXMjb1XXol4/9icBPQ==
X-Received: by 2002:a05:600c:3551:b0:490:b71f:2eb with SMTP id 5b1f17b1804b1-490c26220b7mr97147595e9.7.1780898598517;
        Sun, 07 Jun 2026 23:03:18 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm392992805e9.8.2026.06.07.23.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:03:18 -0700 (PDT)
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
Subject: [PATCH v2 0/2] docs/zh: update DAMON usage sysfs documentation
Date: Mon,  8 Jun 2026 06:03:00 +0000
Message-ID: <20260608060302.1564003-1-doehyunbaek@gmail.com>
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

Changes since v1:
- Revise both commit messages to follow the translation update format
  documented in Documentation/translations/zh_CN/how-to.rst.

Doehyun Baek (2):
  docs/zh_CN: update DAMON usage Chinese translation
  docs/zh_TW: update DAMON usage Traditional Chinese translation

 .../zh_CN/admin-guide/mm/damon/usage.rst      | 56 +++++++++++++------
 .../zh_TW/admin-guide/mm/damon/usage.rst      | 56 +++++++++++++------
 2 files changed, 80 insertions(+), 32 deletions(-)


base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.43.0

