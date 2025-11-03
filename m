Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C71E281351
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762134670; cv=none; b=LAs5HEozCyOYBvh6eyCCJKJ5I5p8rNTwZb1whxWjbX4QWtYw338P1RNnpNecQM9yjOXKRcz85iE4CLeQtpXUtJNiy4S66asWy6O5Q2quF3d5i/qZlNSPrYU414wxXv8riPx1tJY4gklcwsSuqEApwY0jtdCmKEU2Mc0NWFo+46M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762134670; c=relaxed/simple;
	bh=scKBOtDHVqKDIQ1wnHzvccmWbCFHaFUh0A9SeEEBF5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHpHQuDwkQ8FDRgOJfiJFkJF1sl9o9dP0HPCPF0d0CQDET67SkQGV1Gvw7/sxH5juthhYt/qJ9cR7M0xhaXWcdg+BMFjbcWQhREA9d/rn2kyN4u1fsTPiye7+cWyQnP/ckHmh343qcu0pC5u/gnl/sZcjbteM0ncQT1vm98Aq0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnDUNd6B; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnDUNd6B"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so1534932a91.2
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 17:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762134668; x=1762739468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlhKMqWLH6Ttx9Tu79F/62Lvn4ZGhBAbvbXeziFMbEs=;
        b=JnDUNd6BbiaUDEi1M+EQeMLIU8SIzUV2IGLnWyvX4cQ/2kNpz8ZoDhQRl2HS12GhAc
         AY4k925TlMNzCW5qnKHG/sbxl/hyXSUd4IPFwAqW1dveq3AenA5gjhRyiJElYyuqbdxJ
         bj0Wj/OUIGVSmjaRIYhPVUNDanRAEq6d5xWkJioSGnMxs+HyGkKtsRdr+AeZoLf0FOG/
         NNuaW9q8fH5EeqUEx6AfPaDg2s1jad/alo5UAL8R42pHaVShrZvnJMeS7eaXyMzOoXxO
         GKc4jrE1SVEvxSxdGM6AIO13WE7v6QHMjT/2kHo//pF67w3SKUi0mENtf8IcTAlHkVLK
         vaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762134668; x=1762739468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlhKMqWLH6Ttx9Tu79F/62Lvn4ZGhBAbvbXeziFMbEs=;
        b=bePLLx6tW2d3N926jTU1wzzZzDNI6y3IyGIWX7rlAzIuYME2rWo3rSHvmYj3t1nuQD
         02kD3RK3Km+YMh60N0naPWo1SRPqg9/JAy/Gwr+dgSRXYQYPm7ntf+fF9GM9gag1iCRL
         HHXhS4QXHbTuXNNgDIoHEKvQ3jU9cv9vcl4PUtEGErqeuYsrOa2IICR2ARh4Tvw08G2X
         lEJR8HbJ3owkbDu74xOfat8URhAlP43steEtoYimntQjgRkqWR5iXFJJLJwkkQNbhRbF
         xUxDIbejDkwxJsqr2kdynfzGCcPyWo3+T+0W7YSq8Liy9oUjPqE6qSy65AprvLeP8wZP
         wDjw==
X-Forwarded-Encrypted: i=1; AJvYcCVHKgo0F3wg6KyYwmqzFqb0QBFzlARTxDW3auizsTBESeDJyFXQWUkkhXmcTBfTa9zfabT+aCvgYSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9bF/BAwdK/CGkETyiFlBUUhQpSwtzHtqX+3mFmdsOcFeYktm
	4Suhinz8BQFZtm1p8WOKNtt4f0j9a53aynygy7PqwUx9n/961pEYEpg4
X-Gm-Gg: ASbGncvQwD7ReeJRsco4e7ym6BwglLXS6elRcL4AGeEvVAJObx1l3GB/Xacpod0wf5L
	sBGUkhRdwBGUKsgjr2VHnJqVXc6DlzirCjzmLDO6taHWLKA1EhZX3j/I1dBTbVwSqD60pE4lvnB
	BInLCp/6Dr5YcpTRFNvSXyXcMhC39JyTZ3uXnsuUy7ztfiLDlDbSbTtpNfVCDHhWasLpwK+vNUg
	6ZNe4APkSNEaUJC0iDMCDkqBAbT8ZvHIr5DuoDtXbivr/l+Kvw8PGIInA7xcrkHWXN1+mRaE3Mo
	fpe3V5pw4WWhs6AiUtefZQDlGBWtV0zdUdCtkUr4iREuX2J/S0n82byVBsNFVR55gytFZZsmuFB
	Av0NtFuXoDs9CJB/exiAU9F+vZuIhhJN4VPDKtDgTBGNgp5+rQ+J6yTmmJtI1oXHOaj3SYa2Qis
	5jWM7jBjryLzY=
X-Google-Smtp-Source: AGHT+IFg8qhnYS+/VCHi4aItW8Iz1eBgf+OnDK39pb/AwlReuqEHtNS0V/i19WjXGq79bAGE7CzXNw==
X-Received: by 2002:a17:90b:350c:b0:340:d578:f298 with SMTP id 98e67ed59e1d1-340d578f568mr5305116a91.8.1762134667617;
        Sun, 02 Nov 2025 17:51:07 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ab3e48d1dasm1238109b3a.34.2025.11.02.17.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 17:51:05 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5E4BF426D9DF; Mon, 03 Nov 2025 08:50:59 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next v3 8/9] net: Move XFRM documentation into its own subdirectory
Date: Mon,  3 Nov 2025 08:50:29 +0700
Message-ID: <20251103015029.17018-10-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103015029.17018-2-bagasdotme@gmail.com>
References: <20251103015029.17018-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3293; i=bagasdotme@gmail.com; h=from:subject; bh=scKBOtDHVqKDIQ1wnHzvccmWbCFHaFUh0A9SeEEBF5o=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkcnJUpSTw9Zxc0LFPyWXT/yvmfocf0+rudtaZF5zErP 5LPX2LXUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgImETmb4Z/I0wbAmo0mv+zr/ JA3Dz69+tGo7ejjIuhzubHow9Z6CJyPD3887QlSuJphqrReQklSXeLF9RUjOz2TbFO4PizmnZzx jBgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

XFRM docs are currently reside in Documentation/networking directory,
yet these are distinctive as a group of their own. Move them into xfrm
subdirectory.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/index.rst                  |  5 +----
 Documentation/networking/xfrm/index.rst             | 13 +++++++++++++
 Documentation/networking/{ => xfrm}/xfrm_device.rst |  0
 Documentation/networking/{ => xfrm}/xfrm_proc.rst   |  0
 Documentation/networking/{ => xfrm}/xfrm_sync.rst   |  6 +++---
 Documentation/networking/{ => xfrm}/xfrm_sysctl.rst |  0
 6 files changed, 17 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/networking/xfrm/index.rst
 rename Documentation/networking/{ => xfrm}/xfrm_device.rst (100%)
 rename Documentation/networking/{ => xfrm}/xfrm_proc.rst (100%)
 rename Documentation/networking/{ => xfrm}/xfrm_sync.rst (99%)
 rename Documentation/networking/{ => xfrm}/xfrm_sysctl.rst (100%)

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index c775cababc8c17..75db2251649b85 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -131,10 +131,7 @@ Contents:
    vxlan
    x25
    x25-iface
-   xfrm_device
-   xfrm_proc
-   xfrm_sync
-   xfrm_sysctl
+   xfrm/index
    xdp-rx-metadata
    xsk-tx-metadata
 
diff --git a/Documentation/networking/xfrm/index.rst b/Documentation/networking/xfrm/index.rst
new file mode 100644
index 00000000000000..7d866da836fe76
--- /dev/null
+++ b/Documentation/networking/xfrm/index.rst
@@ -0,0 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============
+XFRM Framework
+==============
+
+.. toctree::
+   :maxdepth: 2
+
+   xfrm_device
+   xfrm_proc
+   xfrm_sync
+   xfrm_sysctl
diff --git a/Documentation/networking/xfrm_device.rst b/Documentation/networking/xfrm/xfrm_device.rst
similarity index 100%
rename from Documentation/networking/xfrm_device.rst
rename to Documentation/networking/xfrm/xfrm_device.rst
diff --git a/Documentation/networking/xfrm_proc.rst b/Documentation/networking/xfrm/xfrm_proc.rst
similarity index 100%
rename from Documentation/networking/xfrm_proc.rst
rename to Documentation/networking/xfrm/xfrm_proc.rst
diff --git a/Documentation/networking/xfrm_sync.rst b/Documentation/networking/xfrm/xfrm_sync.rst
similarity index 99%
rename from Documentation/networking/xfrm_sync.rst
rename to Documentation/networking/xfrm/xfrm_sync.rst
index 112f7c102ad043..dfc2ec0df380c4 100644
--- a/Documentation/networking/xfrm_sync.rst
+++ b/Documentation/networking/xfrm/xfrm_sync.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-====
-XFRM
-====
+=========
+XFRM sync
+=========
 
 The sync patches work is based on initial patches from
 Krisztian <hidden@balabit.hu> and others and additional patches
diff --git a/Documentation/networking/xfrm_sysctl.rst b/Documentation/networking/xfrm/xfrm_sysctl.rst
similarity index 100%
rename from Documentation/networking/xfrm_sysctl.rst
rename to Documentation/networking/xfrm/xfrm_sysctl.rst
-- 
An old man doll... just what I always wanted! - Clara

