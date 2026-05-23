Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2648C38837D
	for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529466; cv=none; b=k7qUa27cL2g5zE8unsKNfgX3IeZYrq/bQrz8GwQuGum5/uPPWLj1RJvknsNXZBdoYJ3QONmooQTpsizKkViRbGyb3TyeqPxip+/dz5iU3yrqpNHuQL4tFxNdtWw0UkrwA5pl1WDeBwNS3MmT/7/Y0qtrryUhcpATZ4qWa5/n1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529466; c=relaxed/simple;
	bh=2X6F7vnlTVLHYY6WdIPCxcHQmhWN0eMKVSV2hTb1Jrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AlQ+90faj36N9Wr9/Wa1htzNqHJq64nZhZ8XtWw7LUR20QovL0SC0DM4LGdw39NXL5ApN0ZGJnDz7ubuImSqzwbVbU9pbHZP/RS2UioWhqZkxayfh3bku7BZBhlaKlpj+rTEXzWChd8v8/LpgkkmGsu/0myXSYi+2FtG0+KvCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2eXJ6HE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2eXJ6HE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so9401405e9.0
        for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779529463; x=1780134263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+33Jnfl9EuHdW/5UYwACzrSC7m7tmZqoG76Vyj9VhpI=;
        b=T2eXJ6HEdOfdHP6g/sr9KTuLiBcbsskXgz8p0WP+CNSv2OqDspq/Z0m/yb9fvwRuOP
         9vC2zCwmkeyfF6Cy4QvFD7HZPTocgKKQ4LrW0myuoEoGpsRTlxM7gJ21uFM3DTWUN8Nj
         t6pg6CTRpAeM0RvL1+/PuA5y/64j32aaOCA5B5DYkwEZcLuDs8A++Ge/AYO5vY4ydvvc
         zL69jSuH7isA3VIaQEbE6KDNtDqRvcdVEh9AfYtVv9mJaYAdSxB0S8Ly5T+n0IK3G2MQ
         fPqt4DGOSHeJX02EJaPJjTqpwdLZx0sJdPdbsSXzqMXwhd6UBw/CiTGHiOGiHsFPbpKm
         Wn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779529463; x=1780134263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+33Jnfl9EuHdW/5UYwACzrSC7m7tmZqoG76Vyj9VhpI=;
        b=FPqh2ZooNx5wBhuiGoIFqRAj63v1QEhpgPat/cSx1Gk05wt8CmPpntEWLxBmSPYEHs
         zP3WbUL6yLhbsNUeYh4gnFs5GLK6XzGC/UOK96z7auovpRYve01L7/TyQGuX6vRJl3VF
         BOKmvREqf2o5Kh8SSA8vydRuYZHtf+6IgsZA3DJXKxDmcpbkOJX/vMzF5mGa3FUtqbwp
         dSjYJcXBCEaIHRtDarfLhrl7dO5mkT3VNt7DMNk8SJUdOQ7msjTgaKNjpf2zV6/b5E3N
         p1TSCugVTyiVkmyghbSBWU2dL5ih0GmZMNkPUCh6oS9SctxRiF7agEyGZbqP3ZXZa2W8
         auNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OAFjMRqjBxDrgqpRaXekRPYDioSlTDXfiXNUcT/DlJXzUzLeQAdiwR1j/TDsiJwV2mRmE8nHhszc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzROn/xOLhwiW7/L5sCkf4p+hCec2Tr9GMtRpktjzRwr7a+BgSf
	IPZhywVVS2sSgaOQ4Cx44bVN5kgLQ74nrvz/9x0oAD977DAR7TIF2zeD
X-Gm-Gg: Acq92OGU5c6uq6l4fNRCUO6SxWV9dgsdYUed8ZvPssz3UtFOyjr1F5Q5aFhEBWSR+h/
	T13vxsrlFQeUKqYYOfd5gRyNW0VzfVRW+I6/dpEmJgLxgKigBgTczsnviQX5nzd9X1kBSdqcLm3
	jsCeWq6UXXVqQRHi2Zmn3fFdx+a4Nspir2DlPVzMGyCJe5VieaMi+CoBjO/fUpmo7HJquOHcG4T
	VygPn+sADZu809lzG7Hk6qBUTGXp/Hei+/eJz8byY14LaeiRmH+WcrCrvSKypcTIpOMHF144ZH0
	+4M00QiKlw6neftdSMYW8IcjOJIq28q5xi6sh1LqyKrTJTVn/TAC+w+aV7VLVtDprLQX+75tPwh
	PM8NQFEG5nMbt9SrE/8Gh/VFeSafRtBIucHdkjxm9KkzF1VnQG48DlVrpkOp2eGiY6LpduvM4vU
	agfbcbWd+gWWbjYY7qa0YfXad3gaD/Dz664t5aeO6CSKT8DZnelE6uXHI2GSL2m8XL9e/E07Gj8
	nafb0uAaDfsotGlSWawIruhV6bhsC6TtA0uWg==
X-Received: by 2002:a05:600c:3e0c:b0:490:4175:4bf4 with SMTP id 5b1f17b1804b1-49042cfe362mr54726165e9.8.1779529463267;
        Sat, 23 May 2026 02:44:23 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm10387044f8f.20.2026.05.23.02.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 02:44:22 -0700 (PDT)
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
Subject: [PATCH 0/2] docs/zh: update DAMON usage sysfs documentation
Date: Sat, 23 May 2026 09:44:17 +0000
Message-ID: <20260523094420.741003-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The Simplified and Traditional Chinese DAMON usage translations are
missing selected updates that are already documented in the English file.
As a result, parts of the translated sysfs hierarchy and descriptions are
stale, and the translations also lack the newer introduction of DAMON's
special-purpose modules.

The gaps correspond to the following English documentation commits:

  commit a7bb1e754559 ("Docs/admin-guide/mm/damon/usage: document 'nid' file")
  commit e85e965bdbec ("Docs/admin-guide/mm/damon/usage: document refresh_ms file")
  commit e0c725455fd5 ("Docs/admin-guide/mm/damon/usage: document addr_unit file")
  commit e06469cdf1fd ("Docs/admin-guide/mm/damon/usage: document obsolete_target file")
  commit 2584dd7496c5 ("Docs/admin-guide/mm/damon/usage: update for max_nr_snapshots")
  commit 652fd06d20da ("Docs/admin-guide/mm/damon/usage: update stats update process for refresh_ms")
  commit e7df7a0bfc90 ("Docs/admin-guide/mm/damon/usage: introduce DAMON modules at the beginning")
  commit d9cfe515d36e ("Docs/admin-guide/mm/damon/usage: document goal_tuner sysfs file")

Update both translations only for those stale DAMON usage entries,
including refresh_ms, addr_unit, obsolete_target, goal_tuner, nid, and
max_nr_snapshots.

Doehyun Baek (2):
  docs/zh_CN: update DAMON usage sysfs documentation
  docs/zh_TW: update DAMON usage sysfs documentation

 .../zh_CN/admin-guide/mm/damon/usage.rst      | 56 +++++++++++++------
 .../zh_TW/admin-guide/mm/damon/usage.rst      | 56 +++++++++++++------
 2 files changed, 80 insertions(+), 32 deletions(-)


base-commit: 79bd2dded182b1d458b18e62684b7f82ffc682e5
-- 
2.43.0

