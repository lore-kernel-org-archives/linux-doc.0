Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EBD1F4617
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758336228; cv=none; b=m9pyZMLD7WdFqrk5zXCsDBVpaeaz8O9PkD8rTSn9zpS1SuHt6i/qktciK4FdabwosE6FY3bKx20awzqc5ytGIWkMxTN9r1e2hbKCc6/+p6sIkrIAwGfvfyygymPdQFPs1fQYMCVGMVmRBqgGxjwvC1nP1Nu8ODk5NoDe5QgEaWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758336228; c=relaxed/simple;
	bh=hwVCE9+i5xHJDveOieuvIwdQhF/K5GneAcShYTULfbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nD1GZ1mjczjEQVz8NN74PpOUk8at2JowXJkMWX2sXPrpqyZnflZBK4Dp4wyH8DgOBgxcyOikoROWRp/IZKZ34FXa8yARucIsr8F/+hghxPeEDLWmof97wMmkM/RDGJqQm7Uk0SHdX+AeFKBGxyvG6xFQ7SBk2I9wYGDCXlCjyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvNtd3HZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvNtd3HZ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-330b4739538so1004447a91.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 19:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758336226; x=1758941026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfs3qvic1g+bWFqyjGJtWgWDzIe3JhdLgi/gRYsR0Io=;
        b=lvNtd3HZw1p98bfbFQRzbvtMRCXQQAHVbl64ZYVUA4BFvbIU1Q7rxk/IxFmzXZuj9v
         4d5YUeJr/QlbaoyG+XejOznve9RQm1TKQ1DaZq0t7DlzAwJaHUvqj47UXU35J4665TGK
         DqicZFedoAHNkjzo17JozXCQAgp+bLrXHrFHI7TtfLSv+z2oLLdpwfulZshq7pN75zqS
         8VjTsPS042HE0egRom1BAldVp7GmkWf4XKvH/xAJlQstTzyNonCSoqxag0d5U/iioGbj
         3JslhBVDlacYLp+sPNSafTVH7+x2VIJ4hsRmdmuOZAWCkLPEsySTSlLDUDhz45QfFeC1
         P1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758336226; x=1758941026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfs3qvic1g+bWFqyjGJtWgWDzIe3JhdLgi/gRYsR0Io=;
        b=e/NBXGry0u3IoLOhkUK2qFtW34iKUtUdO6Z5yukUJtkVV7gkC9CsE1RhjEXsDQk6e0
         nmIVoBpM5Rbpct3M7NBg9CQzInUf5FDI0bsEvVi3mOFEHDhi4Td+obVhUdVeuoRBKwsP
         UumqfgQt0gl5cAcCMv0NKGY++q3PSA8R1ELEIEdC65tJ2kePEAc9w/PIZ+ZzTh6J8Dha
         2nIDYmFvvWbj+13hIprxiXenoEbQ8c7StNnzLQgkbMl2Q5xuJo0btsHXwgZ3nR9JbMiG
         wg4vEcczTkJnHZc1yjWehNmAhgwl5RrkvJcRgh5hbx2SafnWjwl6EJGPMlZZixUNEdEU
         pv0w==
X-Forwarded-Encrypted: i=1; AJvYcCXoK6if74JOdhZwQrN1omMslS75hPl4X61Cs33P+Niy4JrSfoNK6mbnti7m2ZVM/K3FG4MVvEo+A/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2TS3Jqx9Xak1V1AS/erMTh5wgWDf9x/YrnuQNgSMRBnBmQrbX
	7LD/B0oQKzdzKC+GwF/cEG3h9/niJ6WKFQ8al0EFEZCfaYNaJzYWRAdZdBmKUw==
X-Gm-Gg: ASbGncuOfQ00qC6QrJzvMRxjJ3scm9+LJWquMwZ2b4cuwBqZ8BU07B3ET1wd1ty6dmY
	i1xNz6f1DCpkUw7zJNx1o9qvjAxI1aILFGRp+aRx8btHSNfbwJDPjngoT/wx1ksMYQzoDk9BdiC
	LK9q6t/YvBXt/+mjCw2XyoSS46n6KX+BoliEc9gChVFjS6aI82JzGYnI19vSwhRp4UFkYrcr7zG
	P/pJcNGJ7buE5EkV3sB6ob7MUksoJLxFhn7XcSnThulrzmpyeBdldvG8usGWJlAwHoekzaA0Ufs
	lxdCAwtnXiWr3aJ9h3wS6UADtX7arSHM8pSGLZMjIS18UgAK5oSeFxd3BSbBk8QbpaeLYzsClbJ
	5GVCyO2+seorHW2xzK86+Eg==
X-Google-Smtp-Source: AGHT+IGQOp23kxhYo2J45QPOq4PTg0tmHp2E/BM/idwJf7XB/3Gt7dyJ059XRLC30PQd88l2yZ+8fA==
X-Received: by 2002:a17:903:2ace:b0:26c:5c03:6781 with SMTP id d9443c01a7336-26c5c0368a9mr48404095ad.11.1758336226020;
        Fri, 19 Sep 2025 19:43:46 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053dc8sm68989145ad.13.2025.09.19.19.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 19:43:45 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0FD74420A80B; Sat, 20 Sep 2025 09:43:07 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Will Deacon <will@kernel.org>,
	Markus Heiser <markus.heiser@darmarit.de>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Silvio Fricke <silvio.fricke@gmail.com>
Subject: [PATCH 0/2] Associative arrays documentation formatting cleanups
Date: Sat, 20 Sep 2025 09:42:26 +0700
Message-ID: <20250920024227.19474-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=559; i=bagasdotme@gmail.com; h=from:subject; bh=hwVCE9+i5xHJDveOieuvIwdQhF/K5GneAcShYTULfbk=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnnhJPV+m+cSXo1qd8/+9y79IIThbNvrKr2b2jsCa4xz lnMGB/cUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIk4ejL8D2ieabT2X/xj7w/Z E34uL395bSrD//BFa1+cu3zr8KXaB8GMDDNOXOOumz7FWPFnKGPk/VfZN+9lSPRumP/2ePct5s1 2JmwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here's two-patch formatting cleanup series for generic associative array
implementation docs. The shortlog below should be self-explanatory.

Enjoy!

Bagas Sanjaya (2):
  Documentation: assoc_array: Indent function explanation text
  Documentation: assoc_array: Format internal tree layout tables

 Documentation/core-api/assoc_array.rst | 196 +++++++++++++------------
 1 file changed, 103 insertions(+), 93 deletions(-)


base-commit: 348011753d99b146c190aae262ee361d03cb0c5e
-- 
An old man doll... just what I always wanted! - Clara

