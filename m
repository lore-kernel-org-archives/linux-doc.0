Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F372765E3
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761657639; cv=none; b=PokW02a97N2sjxt+YxxodqhpdF5pYu9peH9LEZT8wrY6B7/QvEKETfoZ334USvypHqnGLctY5q2DsuF6nHzqVCNYKyTLZqXifkhpYQu5L4Sb7VoAu+9/1pM62dpwxJCcuoYF33PC8JhptCvbjNVGl9SnAdecyHriw60SoAxXWAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761657639; c=relaxed/simple;
	bh=OraHByRSkDTKrt5+sOvd0Ht/6LFZDkcv/nCwyeH4DNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+19lSkkA4SjxReg90lCwpg9zwIxl8P3QynLy4N3iju2JtKzs+crpIUNRJQcwYWm30+CSVp3atu33Q1qMRjCIgOAgnpzyUnZHJLqQi1kUOHctiODdYSKZsq3Mpcllul3zG+mPoVxiNwLjGqGSLRWRJGwyUEbQb/LAkdCVnbu1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHm/mnj2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHm/mnj2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a27053843bso8252453b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761657637; x=1762262437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzLIntGDHL7+P055GuRT7nFuEDkNdk58z2RuQjYnrI8=;
        b=CHm/mnj2dpn87cmLzHcWzWMEC7+jnqnLJxAqGrvOw4INkKxqRau3eRaSPxvf0uHU4q
         NpcSHskzE7xCm+jFtev4+ckipvkl26thUpNqSu+02D0zSrw1jKWdGcOHcFjuvCcibV6A
         md7vijLNpkG/bKCkbKOmOQou8nyMMbB4iVi2cFHMcmZz9k6L8r37goPqD2wZJMVu9M3k
         OwlB8y7DONRhTKgD4UqMGrHgW+i31yywF0TyNifAUqoReMKyogL1rkZqxRMLel17mN14
         mxWZiCZa7kjXAG25tTPU3vjYkECJHWJ1xojIfWvVvOo0Gt0InoewiXwNIQY0cKIli7Je
         rdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761657637; x=1762262437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzLIntGDHL7+P055GuRT7nFuEDkNdk58z2RuQjYnrI8=;
        b=XByLmgEnwi+kMgMYZmNf1RIk6KlXNSThQ5lvrNUjOfHd80fS9dysBziUQOBhw4YtV9
         tvo+Eid0jSWAsIkFOBl/A9GKEyc3/h0JoYzyEH78INLRmLlgiMO0gz/4OFfJv4uE55wf
         dbF0VaMcW329y2ehxnA2JOspgh7SdDFkaPywxCkBRb++SePYJ8zG7/DLGv9VbeAfw/ur
         kGyqFEZ8yxQql3BUmpWZD51zjMn3jF4dChqxzYEsxEEhdnVALXmskmSYEKwCYkwT1Eeo
         KURUJKfxJd0V9jf/dRkjmzdw+6/t6zOTZEd9yukrzGrzGzV5WDSxuZ0DpW18+Xs9V/DC
         dxuA==
X-Forwarded-Encrypted: i=1; AJvYcCXnQxUIQrhc+FVKIxZYD9l1HfynCdavsAmcQHbaCUOHAyPiVZKSKx3LcMuP5khSrPIe4tGjxX5ZIuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeihW3+T43WzTP8oEKcHZh51mnfvatKlmu0gitbpXcq2PabRZD
	YfMxN3Ii34ZHHlJz/Xm1q+bA7pn1PNzX4vQOcYHIsuhKKlotHEuMX9hS
X-Gm-Gg: ASbGnctUG9pklQ+QvqGwdVU7cPQ4vgGiApABYavCAslh5Pdo6VaAVdFMMJe4cUT+9of
	YkNFkm59jlMBceewCPTML7mgxpf25YEX/yjNokOEzUgRZlRJbu/xE/75jG15dpg/WGhf9H5/IgG
	NIWfCVFX71dG7VUnUoDVzIZouLPxqOn9fY0sF8mq/XNoM+Ul/w+9/vni6RA+EUTMBhWUEE6Tvwi
	wIlTilw+EmPWF8TQ4FUyoKQg6wFtO6OQvJUj3Vyo/Hpt5H25XW60epeDMZfNSMoRtzbd2D4ygSJ
	Z1DSdCY+A8Mb4XZ7wBqmirC98a7BsRN0jvbWLQtVcjGOUvhrNCurufyZnBTm5YVlKfIuvoCsyvW
	Zq55rpZX7TWIkPSDhS5Jtdvu8IHTNRD8bsuKU3ydr6EznZVu//ZE026TtdFhiceQ42T453nu8Bh
	IJ
X-Google-Smtp-Source: AGHT+IE5u7Id+aiml99gQys+AcPpH4Eit68IjE0RkIpz2pZA136//uNZkrUUyLYbvp3Vhsbk8QnGqA==
X-Received: by 2002:a05:6a00:4b10:b0:7a2:7930:6854 with SMTP id d2e1a72fcca58-7a441bbe8b6mr4307214b3a.13.1761657636780;
        Tue, 28 Oct 2025 06:20:36 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140301ecsm11844986b3a.24.2025.10.28.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:20:35 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E146D4209E50; Tue, 28 Oct 2025 20:20:33 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Matt Mackall <mpm@selenic.com>,
	Satyam Sharma <satyam@infradead.org>,
	Cong Wang <xiyou.wangcong@gmail.com>
Subject: [PATCH net-next] Documentation: netconsole: Remove obsolete contact people
Date: Tue, 28 Oct 2025 20:20:27 +0700
Message-ID: <20251028132027.48102-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=bagasdotme@gmail.com; h=from:subject; bh=OraHByRSkDTKrt5+sOvd0Ht/6LFZDkcv/nCwyeH4DNI=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkMh4685/SZl8pvmJU++5ua8Kmnm2r8bY5JrJ3fq23w4 6yZxtWyjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExE/yUjw+xdEx9w7H/gPXmG fn/v9peudQs1/eoZ1evVr59axj91fjwjw+3kG/M2lV+d9uu42qWU41EKmnNVjBcFbelOmGDm/Cd nEjMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Breno Leitao has been listed in MAINTAINERS as netconsole maintainer
since 7c938e438c56db ("MAINTAINERS: make Breno the netconsole
maintainer"), but the documentation says otherwise that bug reports
should be sent to original netconsole authors.

Remove obsolate contact info.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Cc: Matt Mackall <mpm@selenic.com>
Cc: Satyam Sharma <satyam@infradead.org>
Cc: Cong Wang <xiyou.wangcong@gmail.com>

 Documentation/networking/netconsole.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 59cb9982afe60a..2555e75e5cc1c3 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -19,9 +19,6 @@ Userdata append support by Matthew Wood <thepacketgeek@gmail.com>, Jan 22 2024
 
 Sysdata append support by Breno Leitao <leitao@debian.org>, Jan 15 2025
 
-Please send bug reports to Matt Mackall <mpm@selenic.com>
-Satyam Sharma <satyam.sharma@gmail.com>, and Cong Wang <xiyou.wangcong@gmail.com>
-
 Introduction:
 =============
 

base-commit: 5f30bc470672f7b38a60d6641d519f308723085c
-- 
An old man doll... just what I always wanted! - Clara

