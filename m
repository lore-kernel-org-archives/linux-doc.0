Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652BD345ED8
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 03:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468077; cv=none; b=TZLHmeYlRSPNLnCpTEhHILP0bp+Ci4YyT6+9meE99UWaydtMpfuTj1hWIt+U4qB1EZ/5I2DYM+yHywLPj/8HDyefJdcb07IYDHK/+FdDNWd7ySU9j8pr9ebqUw5wzdghJ1xeTojnkxwf3RwZP7odJy0NXFp1ARLsZ9a8aT6F6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468077; c=relaxed/simple;
	bh=r9SR9yxCySXq9J2ql+APxqLZjhikM9Q9kwuKDIsXiC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0wodqE6BCvw1hCs4capxA4dpEvCw/0BMC5O9YdfqdwK+XpkxZqbK/lwUFo0rXbTK9qLkkODqMigclFLoXJDUmLoIcRfD2CQLZR6ktqlBxZ+Aw3ceqGIZk6lLMThFo3K0ftYNIG7nwK5LSCjoN9E+Gmy8JZXaXqIv8sIdbiVg+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeXnYEbb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeXnYEbb"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84862aaa8bfso51045b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785468073; x=1786072873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mvki/EeQBL13uYzeBfVRnpTbGzjC1XEWszdE6wXyTkI=;
        b=LeXnYEbbjml/UQZ6rbLqDuEcJ+p499ol4JfhsDNNVz6HEcww057Hn2ouy8UuJAMOJe
         91v2eJ66qvZEpuK+htM3foDWpQW3Tar7xhXzPxQoR604ZQWZtQGWXmAv7/9VzQcR+2y8
         WriR2ZdysvwVUSxh1Typ+uFFoGiR7FJtJhkZ9/SGnFdLzaVQoAlm/Z2z7vk9cTDvY2H/
         HGadkfv2oWw6Ur+HBqvlkdehrhrGGmylRJx+MYpBP6Q9MTIzfcVKE6mbjrjAHmYsdseV
         xcwK3RmXy71G+yWpy6GoPVp53wV55yRdDUXSLs7LP4KXsdbrXnpL7r04LaFThEyTlquD
         j7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785468073; x=1786072873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mvki/EeQBL13uYzeBfVRnpTbGzjC1XEWszdE6wXyTkI=;
        b=BjdIFSjbyo3HryAn00Kza0a9a6WQsaMIzMw13cyFTi5rjn7Dug9KKJZn/rJXuKTdtw
         xcZ2V1SHFjxPbEt+ucUk0+7yIRjoXUbMn6deMrmJJy7eq/BQbHouFOEkhbxW3A4zcElO
         OhpaLpqQNDMK9lkawqoJJ5r8IzEpTspsdPVKcqSXStXKxCKqSljFwcCG01fTwxJmctr4
         CdMCHeFJFw3GPjq5MtWiGRDqkdxfzJo7oKZOLgABrVd9ob4q553qWnLBU9t/jRcS/o8G
         bPXlgTj6mTooOesWmSubcZfyAqu27obBbS5walDyR1n+k7yw1phzhfziU8p6+MmpfEJU
         UPLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPBTYQAmXtELQysVq1YggVT4ZpUntfz+aOwBxt34HcN0jj3aO2j9XIEGNnVwXUAO0A4WFbG7hOh/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPj7uWf7so/AHsL/iAukqDC6k7CTL+FyScQrcCZ1HMNXfb+ceB
	/JGaUuqDAiiih2v7hhswJl+wYjdqlpp5xBRn8J4ERY/kUJNywBEs7dvG
X-Gm-Gg: AR+sD105LCEAa8YigkizbcoQQfQr4Fn6XWT17j+p97XlQu/77iWRDmYBtptg6KULyFd
	G+GnUl0OF7VhWVjwOWPVj9yBPLMorNBxdWP2K3UIAwcjTho58iYNvj7AYZli/baVkCGxJ9bQxs7
	gWhLBn3Nx/whtIgv3w5LhpblbYke+LilEH05rgJcVAj20E725Qtt85i+1KBighCsqq+6qOaWgj1
	jtQKtSe6QsdBXWn5DF62eInUM2hPB6NO5ROr8YTYuL/81cIwAk0ypgy/nS4DFmcSr7DdYlN3fZh
	sFJQTau+46VDrde6eRPcqLyTUbs07BzcqdCMBb/xhBj1MR9QrSRJtxc2WKsdAzxcopG/ubc/fTA
	8WRAKewBAT3nDV7KbWSzF95NsLm1cIM4hhM7z5f0N9wm79T0g46sakc7GojehtHul8KqkrGQJRm
	3SBCpHYwwWZiJrFE35iE/Am1o4t22HcWYNdipueoAcDQmoBIFHRNerVaEE/m1WacdazjixEFjtG
	qhuNP3w6GynGj65BoPoiEje0u8rhlbsjO+r3PY8XLCFoqxMxkvlmm6t4uOhKbh1K9Q1EtViWdha
	0WcO/9BSd4ENGhODdqk9LVo6+nJjbQ==
X-Received: by 2002:a05:6a00:be5:b0:843:468d:780d with SMTP id d2e1a72fcca58-84ed71893d1mr232260b3a.3.1785468072485;
        Thu, 30 Jul 2026 20:21:12 -0700 (PDT)
Received: from chenyou.domain.name (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5dc18f9sm133304b3a.33.2026.07.30.20.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:21:10 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>,
	Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] MAINTAINERS: update Traditional Chinese documentation maintainers
Date: Fri, 31 Jul 2026 11:21:01 +0800
Message-ID: <20260731032101.7244-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The zh_TW translation has been unmaintained for about two years: the
listed maintainer has been unreachable, and because no active
maintainer was listed, get_maintainer.pl did not point contributors at
anyone who could actually pick up a patch. My own zh_TW patch sat on
the list for five weeks for exactly that reason.

Following the discussion in [1] and the plan in [2], add the people
who have stepped up to carry zh_TW forward, with a shift in focus
towards Taiwanese Mandarin terminology rather than a plain
simplified-to-traditional conversion:

  Chen-Yu Yeh   - translation and zh_TW terminology decisions
  Weijie Yuan   - process, list monitoring and status reports
  Dongliang Mu  - review

Hu Haowen is kept in the list; his earlier work is the basis of the
current translation and he is welcome back at any time. His personal
repository links are dropped, as they are no longer reachable.

zh_TW stays a separate entry and is maintained separately from zh_CN;
the two may share a tree for pull requests, but the review and
terminology work is independent.

[1] https://lore.kernel.org/linux-doc/20260603082531.263115-1-chenyou910331@gmail.com/
[2] https://lore.kernel.org/linux-doc/amcZ5SI3-Hzw4HkJ@wyuan.org/

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
This comes earlier than the trial period I mentioned when I first
offered to help with zh_TW [1]. Weijie raised the MAINTAINERS question
off-list because the lack of a reachable maintainer has been the main
bottleneck so far, and both he and Dongliang have confirmed they are
willing to be listed. Happy to hold this until after the v2 series
lands if you would prefer to see that first.
Weijie, Dongliang: we settled this off-list, but could you ack here so
the agreement is on the record?

 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f9472c1a090..60f77e7fd3f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27460,10 +27460,11 @@ F:	kernel/trace/trace_osnoise.c
 F:	kernel/trace/trace_sched_wakeup.c
 
 TRADITIONAL CHINESE DOCUMENTATION
+M:	Chen-Yu Yeh <chenyou910331@gmail.com>
+M:	Weijie Yuan <wy@wyuan.org>
 M:	Hu Haowen <2023002089@link.tyut.edu.cn>
+M:	Dongliang Mu <dzm91@hust.edu.cn>
 S:	Maintained
-W:	https://github.com/srcres258/linux-doc
-T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
 F:	Documentation/translations/zh_TW/
 
 TRIGGER SOURCE
-- 
2.43.0

