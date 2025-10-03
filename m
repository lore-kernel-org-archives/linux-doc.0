Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E892C027F
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508826; cv=none; b=Ee7a/xSRIUueWQIpB4joCBfsbgXTwuMwmDzAaJk72klulTN+Nm8hY8Wo9FOCrE6jLZZSq8IXa7cHOkoSRkzHedR9qu1L4mmx4ggE32aHc6W7v5MkFIoeq949wm9uPKoiH+MvZL9DEDLIy0aA1foY5ToDnFDA0lM7NopVlMTx7nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508826; c=relaxed/simple;
	bh=0RiStN3RrbvB94Z1yKDlLdZYvlG/Mj3msFqW/hElFc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdyUxmXuus5Y7zV9mrzzxT0XaseKmaS1kaIBQQnIt7kmIc9gRU1Wb1mYY23sW5iSW5bFapRNgup4LQ27J/A+nqC9behLjOii5JiRPatM68Kje7I699lDVInSumbTEqA0YAKc0iNOd0hbuWlQxf7vup2W79tCf7WlSqOos2gy6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR3HMJLZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR3HMJLZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27d3540a43fso23915875ad.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759508823; x=1760113623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/2q9wYSU+eDUIzaN6J73+bHEEYdLDRSnT+gWaueKZ3g=;
        b=CR3HMJLZN/BC/Kk3kmdZjC1crASgEUur7oXy8FpfLzI+CKlUFYuQTGD9JRv7X1/aab
         CMO4VVm8bbu6PL1Oy00KvwslJGbW9odk6KN5PcgTHSmwmiT8OIpTSsiNEeEKEhGxtYZB
         xqSlHzX5LicQ3OrOTJFs1y/+2PLq8opGgCH14tuo+z+rNF2UK6Fec9ClPLI2UlePoP1R
         ggFBNNez6jhMtAE/mb11OVlIcy+Hk2HK8vGyYKRV5FWz6F+adeT3eL3C2Mmevdk3uGXu
         wjhZdupw/aKJjPnqqlZVL6dJLbOYbSVv9G+GaUM81J0XGZ+Drqpkq/CN9uJ1qnJbDAe5
         B8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759508823; x=1760113623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2q9wYSU+eDUIzaN6J73+bHEEYdLDRSnT+gWaueKZ3g=;
        b=EMJdBovNV49/1zsIEL2+oetyewkBMG19J0PNw/yaXai3eqsD/0tD6mydzocOkDji01
         kMUMqSF143OPDDwoTmO5NIbRR7aewu9M5c6kStcth4iATbvSIsYJXCk03K28ete2dvoW
         AcR77ZjuTJAAJ5WLySFPHWe2OlSPY7LqBcDUqfkiyq10Ndgts1CJTk1vrGSgN7WO35CI
         E1QmMMZLa9BKoZIXr3xHCacHE/5d2Ar7NeazfobtMqo8xEH0cq/TX7/m/0CGOEn3x2Nm
         xu4t8zdu9+ByPAcDvK+qLl9DNxXQ1SeDpnltZHnJs66bzthxrJr/d+Ge7QwJrLl27DZg
         prDA==
X-Forwarded-Encrypted: i=1; AJvYcCUYj8r8ezsFMRhaJq4czb8YhokpUyHbprKP/W+7/eQlzwKjYESDHflO902S6bPVyiN6zsnPpOt5cZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6vcCpDZmb8B0xMc20zzfex2iASRNVRoUJ/0VyLppdw+lwRdzl
	N5g5f6zohedHYgStPPQ14HbXcjHGlHx+OpdyttL3HDJdjuNb9xjsOaCd
X-Gm-Gg: ASbGncv/bJn0b69Ja3XkouoZIqy4nb/U5zq+zikJW+9NiqThiVvBLEevkLpkhrqm6st
	A0pAD4GNxpqldopTaCytF65VaSoQMiIHfhIXn1R19XBXpb/iVITmHX9KTkckU9prcKnRyGExPHD
	om0GAw+Q4ZIfIsbjZJivN751vkXF5fw5A7OALyTZs/3RM4LCjeledupzW5bmo5XCmXnvwkPDiPi
	CmsWj4rVz1iUZKPtt+C+NGp9gUX2s8p3zAg4R9wz6WeIdCtDMEZDqeiUct8g83SNczW/hTxT7vs
	oCWMJpgdasZNZ0eeVoOP8bcYyEgcpsxtTnyOy0/iAqImmqg0b1fspcJKfUjlleZx6LFePmrsL3w
	3DouMBN1fiOOqR14wXns0JSF5PnffnasswU300cELFDrRondhI77WMjx2ScYZ61AXXRHV89eMTo
	SZ
X-Google-Smtp-Source: AGHT+IG33/LmrD2uJocMd7V5DXyh8BugwNDBXU/jsQ9avtbxXfaUabsRIgvZ5f2Dqev4eNNRS1l/Ew==
X-Received: by 2002:a17:903:41c9:b0:27e:de8a:8654 with SMTP id d9443c01a7336-28e9a674da9mr43290275ad.57.1759508823360;
        Fri, 03 Oct 2025 09:27:03 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm8416787a91.18.2025.10.03.09.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:27:03 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: 2023002089@link.tyut.edu.cn,
	corbet@lwn.net,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	viresh.kumar@linaro.org,
	qyousef@layalina.io,
	zhanjie9@hisilicon.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH 0/2] docs: fix malformed tables in Chinese translations 
Date: Fri,  3 Oct 2025 21:56:09 +0530
Message-ID: <20251003162626.6737-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes htmldocs build errors due to malformed tables
in the zh_CN and zh_TW translations of cpu-drivers.rst.

Gopi Krishna Menon (2):
  docs/zh_CN: Fix malformed table
  docs/zh_TW: Fix malformed table

 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 2 +-
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

