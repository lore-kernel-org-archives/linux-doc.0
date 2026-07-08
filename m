Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D4D386C17
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495986; cv=none; b=SdebjMNwg1EROtGxAvrGlx7RnWjkVnsZuKe2OV8td5otYMLsGaVMfbW1OMAVwmFHcHe3GFi+sKs22b1tY8a+Tn755FcbMmmDGW5PCAzJAzyhQJULccep19iHri5fj4aCilUp8a7VqwR1x9hJTGJimsM7SUkQkMs833LvVKuNHZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495986; c=relaxed/simple;
	bh=hmawTu+JUlpKtBWubzA+MUL/MgkXPLRQsMsQmq+7zVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5MK09ohyr3/Rbn+hb62sz5eYt0BhkXsBu25HnhOwsgv+tPqEv4cE2vj2FkM3oWye3zBAeRbtFCgaS7okS/e0nPyMwp7Y6AXK7gAk45R1rWaFHPaXCKQn1Vb+jztK6ehFH3NnaT893xLQ1c4Nu+jJIufH6SuhVJK4pCLK7XxjU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDuJkInU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDuJkInU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-472d9d69e16so7857f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783495971; x=1784100771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAmllN+se0JthLQV82NE0k64TaDaKEJudyrSmk0kR+o=;
        b=tDuJkInUdkuj5HvyejRY91pvMfKYPzJ3Z9eWIjhs/kj6SNQZnbV5RpLBp+gU00hkRw
         /5ub2AyTXk0sF7Q0fHCjJdNCL/YxkgsMTU5DitAUdZ6wI4hfm08ZjhT4VE8+iXi31AiL
         CK2wccJk+3S/87DMisWkVq3MgRV0XNM+PLozswso8P/yZv2fC3vyzOQaVC7kTIpC9Y6X
         5ocbr/tpMhDfgbegndeLJTPHeGi0ggaOQ+RuUM56QOqnB/9aBhrls0cnt50an3VNeDie
         7UoievqfMLkfyobFKcz127BOxIbOcF50GaX5WTFuIP4iL/jGYjPzPVyeWEym3eP7oCXW
         VQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783495971; x=1784100771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAmllN+se0JthLQV82NE0k64TaDaKEJudyrSmk0kR+o=;
        b=dF9VnFiQwIyGkhGqXMO6+d5hqmz0i2e1+OkEVm5RKVcIophldbvEqw75nETGsS44Ua
         lhiRwvjZB1fneTODeVPg3DhoBCJ/Ci0vC7g9XnkmUa9/qwj4PnD4damxb69I11Zw5qXl
         NsyyY4Uh/TteRII2DNjXzeTf+ReTvz0qhKz07akBc9Fz/IAYQMrTfNjj7ssG1cq2Xzx2
         Yxvpia6oihC7EM5KyN4uaOxYb7cJ2Wv6JqHka9RDtfpO16zlORF3XQUI68tgc/XTolwV
         jvhMUDxKQFqgOswsqFgc8nJgoeXvYiTS44ToYfZMQMv1pmC3dLCKmk5kK7THPss9bOrF
         xTFQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc1AV7X2L8sp0HmJ0OAnhE8y51mCoCOWwifaNpVPrEcuKqg+wsqo9LWBWnv3X8U5KVI4VUmOYIzZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+R5L9A02kjfB30PYpCPJshb2fvqLC4y49WLtQd8/VBodq0BoF
	cyLe0Tc40TyLBW8+C+R+rSScR7DwBaqMorrcoXy3mj6igahJsKxKWRah
X-Gm-Gg: AfdE7clHrlMXhCqPGs0LfCsh5rZcOWwlQB5OoN2b9zjSz6IyaLS3WNQwmppaKr+S88K
	diXATxQYVahv4ZFC6kzM2/BWDN+3OCnjuUDSo3GYLJ2Rd1xJqItFY3nMHGtbqz30xSQvmiWD1zX
	bA7hwBTB588U0nsXZZNlV0oCckUz7T03GcNddzeVRN/Z5COxVaU4q7Tg2XrDS1+yiUqpt5IrVK6
	Go+uq3tFBGR1LFYv9iJmcGnQ1jctMJ+BE9sFxZBrl29HXHH/3jwCtybcDW98YsnI4CvLG8hUXqN
	T7HTdMa8ZAyr0duhnxgipfPIjZAxkhR5r9kIPreBsPvatF6RZeaEs1rv8DH2P/K0B/LpkyhisYp
	0czzXnoCB4AbR9o6N0R31jDe4jcJNaBSo/DwGKN1pJElY0q36Iz8vdaizXXd8+M/LvIRRJlmaQS
	hNa9JgAaGdLQ+rIAuYOjH5ca53OtZhgVaeeHkUEcfwGxoBBCLfUVHi++/yZmpNO9aEmZ9L2K6Dn
	bH33djFWxS5lgYF
X-Received: by 2002:a05:600c:8284:b0:490:ec79:3046 with SMTP id 5b1f17b1804b1-493e684e722mr7381125e9.0.1783495970941;
        Wed, 08 Jul 2026 00:32:50 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e610532fsm32876355e9.0.2026.07.08.00.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:32:50 -0700 (PDT)
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
Subject: [PATCH v6 0/7] docs/zh_CN: update DAMON translations
Date: Wed,  8 Jul 2026 07:32:39 +0000
Message-ID: <20260708073246.1652828-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the Simplified Chinese DAMON documentation translations.  The
series is split by file, as requested.  It is based on mm-new after the
English DAMON documentation fixes have landed.

The intention of this series is to update
Documentation/translations/zh_CN/admin-guide/mm/damon/.  This required
choosing how to handle Documentation/translations/zh_CN/mm/damon/: do not
update it at all, update only design.rst, or update it fully.  I chose to
update only design.rst, because the admin-guide updates need its zh_CN
anchors and references.  Updating the other files would broaden the scope
beyond the requested admin-guide refresh.  I would do otherwise if
requested.

I checked the updated translations paragraph by paragraph and sentence by
sentence.  Given the size of the update, some issues may remain.  In
particular, usage.rst and design.rst were significantly outdated and needed
near-complete updates.

Doehyun Baek (7):
  docs/zh_CN: update DAMON design translation
  docs/zh_CN: add DAMON_STAT usage translation
  docs/zh_CN: update DAMON index translation
  docs/zh_CN: update DAMON start translation
  docs/zh_CN: update DAMON usage translation
  docs/zh_CN: update DAMON reclaim translation
  docs/zh_CN: update DAMON LRU sort translation

 .../zh_CN/admin-guide/mm/damon/index.rst      |  15 +-
 .../zh_CN/admin-guide/mm/damon/lru_sort.rst   |  68 +-
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    |  82 ++-
 .../zh_CN/admin-guide/mm/damon/start.rst      |  63 +-
 .../zh_CN/admin-guide/mm/damon/stat.rst       |  94 +++
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 521 +++++++++++---
 .../translations/zh_CN/mm/damon/design.rst    | 665 +++++++++++++++++-
 7 files changed, 1343 insertions(+), 165 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst


base-commit: db6ed2a3d31068ca5577466591b2521dee0508ca
-- 
2.43.0

