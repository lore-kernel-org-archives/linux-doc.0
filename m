Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5A21CC7B
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883615; cv=none; b=cqJOTf0FDi3oNu16w2Qh/38LAR+Vx4eoa4N2Yqt9Kn1QdENlybaKlTL9UeiQCumgtpN1pJyA6f8tby5M+Jqoyj+Zu5jn15FLEShx3IwXblTuw3/5le2lCfxzU1onJATIC4JnVrZPQ7lgaitB/zLa5li/dAR/LSznozNRHgTci5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883615; c=relaxed/simple;
	bh=KpVNc9rjFYQdX3EHYCUCUCV0W7x5BuUjCWXMRZKXKM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwAbPdN4KHyUW492RttES150Jj67Pvhec216WzeecPC4tR/bZbLBy8G4SiXNjy6fi8PU5Sb9rFd7yVZNNVLQ8IuALps45u4i1ACheXGO4m42gg70wWnrb3sCrNomf6MPHybF+9kxnWMB4j4Ws10hfvYCweQRNWjiObLIyp+3YS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fX0/AMbd; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fX0/AMbd"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35691a231a7so6294242a91.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772883614; x=1773488414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+AqSRN6kAprDh8uNR+x5CBHDabP9Gjxi/e2CQgO0Lug=;
        b=fX0/AMbdfmVxweTOqlnmluI4AbcaeznO8VDouus8ejvU4T8NrBvxakPHzMzBP23oLV
         ywEtKTMYtA0pmVRkSZ8rBZLQGoni6sPffTj+clHR1ME3hADNYSc5WQ6u/FoXwZJ/JJaT
         c9ra6gV5TOGSstUg0HTCvmPMk03F9O2f7b4rF13LTbL2HHwCZrvVRMT+wmvlZekVVVRf
         txO+7f3t24l43OqUr4OvmJTYZIbhC3LwUznHyPKp+z5p4n/KHlUecAvyp0Tv7YaCBlXa
         VCQKmFGtK3g9Jf5VHzLeVMYA7Xfv4X53tlEedxZsMJ0pvKdTyPMDy7dpNOjOT0uOUDSK
         965w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883614; x=1773488414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AqSRN6kAprDh8uNR+x5CBHDabP9Gjxi/e2CQgO0Lug=;
        b=uTSiGDwwQ7JGG4myiD7q9CSjP70p0ErHAIN0SzLC4tOU/yMYL2Df4JQh8TCXqbGuWp
         XbQWmoAk/yXEPyoj8QDYocWjTm+0dDv+/22hG0qUUlTTjum18aQ0H51d3Es+WmptskUH
         210+rTS234xcy/7e2wgG4z7ktL54FwsmQpDQFOseYrUs9IV3c/HQzpZwYqyFJgdwKSfF
         yiOnCim4+sUb7BC8XmSWYiHm9+zwZVzJXoUaVhguede+M8sMDrlYpkrjq49Aj5+Df1Lw
         vaLPnMNJ/CO80Q88YghXVe+Gf1N+h0wb3xdkBKgouWjU2IMxdoNciQ2KQE6t92CXm/Lf
         PUxA==
X-Gm-Message-State: AOJu0YybebqnVqCqsgYzCFi7wTfmKam/QyIF5FL4/Z8gFY1Iqs9w8crl
	whDjA4MV6JglknL3somWHnvE3k9WEH2i9mZsgE+n3SqwFaHg4U6LRxjSeIMeJGw4
X-Gm-Gg: ATEYQzwfHojcLXlCTU0mhMeP1Jfckb3k40feB9VE++RdG7c9TqTIiNUlgdTw6Fo4AZ7
	KfOzzyuWBA4MzoHMyEXVT6yZyjKXAABn0GlvtsXqFqPMg2yLYZNBjI8CIE1lebw9ptVcxkr5l6K
	YLpTv3/Su2WNA0T9D5Zgm9LsbeNjDMKivihiKzrBRS9kAAHUvIA/E7EW1j+U0OlmGirmWIPqGfN
	Wr+QztjruOvvwk1dOXlo5lA+C9Ct0bRiG46DvAQf4Df6DwnlMiXTvWuwh+KeSl1UHBqq4yVokBA
	6eZIp+3VRCr4f+Doo9h43V+7Su1oDjSZ2HXbH1YaftfnF3eWMTlKypUG7WpwAcauOCUdzz0F6Qp
	6pinQmCVVW0c9Cx04hG/WgnnFkz6mXTYGA/7YKh0vBwzI4QULGJVeTPOOtT8hyUsXred10qmS6j
	CXNhBdr6pBEbwiXNigZLRs2FVNsnuvI+k=
X-Received: by 2002:a17:90b:3b41:b0:359:8f13:6689 with SMTP id 98e67ed59e1d1-359be344aebmr4510219a91.34.1772883613603;
        Sat, 07 Mar 2026 03:40:13 -0800 (PST)
Received: from localhost ([220.247.131.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2de79f6sm8326934a91.9.2026.03.07.03.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:40:13 -0800 (PST)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: bhanumaiya@chromium.org,
	Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] Documentation/mm: Fix typo in NUMA paragraph
Date: Sat,  7 Mar 2026 17:40:06 +0600
Message-ID: <20260307114006.33183-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a typo in Documentation/mm/numa.rst:
-changed 'allocated' to 'allocate' in the paragraph about
memoryless nodes.

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/mm/numa.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/numa.rst b/Documentation/mm/numa.rst
index 0f1b56809dca..b765295c6e85 100644
--- a/Documentation/mm/numa.rst
+++ b/Documentation/mm/numa.rst
@@ -140,7 +140,7 @@ this.
 
 If the architecture supports--does not hide--memoryless nodes, then CPUs
 attached to memoryless nodes would always incur the fallback path overhead
-or some subsystems would fail to initialize if they attempted to allocated
+or some subsystems would fail to initialize if they attempted to allocate
 memory exclusively from a node without memory.  To support such
 architectures transparently, kernel subsystems can use the numa_mem_id()
 or cpu_to_mem() function to locate the "local memory node" for the calling or
-- 
2.43.0

