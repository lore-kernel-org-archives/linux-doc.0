Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E02F60AD
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535042; cv=none; b=BfP/BBucpgE98wYppydzCblZW/f8TzIkszugvGq2e7+f1f0AHgU1Drcxnd56ofi1EDEaA13g/lk+OnT5r5VCxFIquZJnyDZu4PcYbDmYjZ3oq8Zm4LFW6SKfYcnlGPIMYh2VXG1iJftD/aPVxdx3exs9plzZoYv0OWIISwcTUm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535042; c=relaxed/simple;
	bh=LiTxzdPpqZoT1CgAaAWwmxvEAp0qgFo9wy0RJopd9BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHMPzRW6AEzTPbOMAsPvAvlasljOPHrloLNRJXLsnzUE3FsbnnD5bRjvriH2TqkbKUNx07UtTL+e5SECxAzAWCi7SIhX7FqjnWUx927lyHpTZgBBKl/Dv0y/iYzKDL2a1IWE0JY0v9TwZQK7hzTUBJRo7GcsDPVOlscFprrMf9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxpDlVGR; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxpDlVGR"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-323266cdf64so3456682a91.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535040; x=1759139840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEExF954CuEX/+UMtveFHvE+OWb/nmnI/2KEaZqWbc4=;
        b=jxpDlVGRzsvohBo8siwdzf2S0BPE7x5YOyJz4tci9Nz1KiYvESqnu/y0d2YNsMfPjD
         02KwplyQEwwgGiFMeRdQbYz5RcCgYkziW/AEHX2dUC/0ySCJMTAYOjElhr+C4dyO82zQ
         8ysYjA/HsQetAW9vk6HvpltMCEXPCQPgkcyqw1+bIU67o9r5+tdkUJsZ5Szm9hheufzX
         ZQWElNfQyGhbHFxaPvZ7Kq/npxezyEcW7cyHN3Nvu5IGaRKSDbwBM5yL5p76N93hdb58
         7AiUqvjCYaAhjFA3q47jUTi1tlAkZOCtQpRH0C7yVCGtMYNgyMZA2fgQATjbL0Iqgcak
         wjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535040; x=1759139840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEExF954CuEX/+UMtveFHvE+OWb/nmnI/2KEaZqWbc4=;
        b=eU/cXwmE19iTHYDUXphwNHdpExuitQhKLclhfL5uHPzmXxJmPoot2ceXctDJ+gSpgF
         AbU85F5zN1uo1vv/1UmuiMyFu7uikCD2TSv32uEtEBtd4XCNG0VkLsJRx+WJ30j6iD9b
         BD4WqqxRWPH/K1xPFVzFF+0uK2xVWpKDAzdawf9FHGvOFyPTvtkOFXcZ+FPQE6kUFzAn
         8OFsLPLBW4Ek5dSnwi/MSVStpmjtWnC3aoqPoGvld5jaTNZruL+lc+xd7A/wpYUtoYNK
         72NfwK4EEFcXpMgUZDZY/nrOdgWNl/ObjdpFwPKtJueUTqIVmtol5ytFbLqxOY74Wgv0
         1xVw==
X-Forwarded-Encrypted: i=1; AJvYcCX0LKgX2U/pVj+Z0atipqa4az5wfu95m4+0zTXUt0xAhFaEtWMfrlhG3HSmHkbZbXYLZY7s05+m9UY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2+1k/t0RJoGy2RwYBbOn04Lx17h9Ygwe1D7Jc9m1n+dZPlBm9
	EV+zwuN6Smnhb13aQKgg47QErO1y0CZGwLHiROnq5P/3isrQrjSAb+Ms
X-Gm-Gg: ASbGncuzFFviiG9+WY4RkEYBl2nSeL7Fd2Y3GpOCJYwfYuSUfcK2imeBxAKXPDah4aX
	sveo2BmcBH89lzmQlsvuK4cVI1GYnqraKqqNeP/9rW7WXOnxdMTFruxBHKTcGQWMHNMmmRygl5G
	swQMzcXyNPco7GrTbhtVxxktQNeOv53NHgRshMhXQAjlrknPq1dDltiDGf3fRYKQC/zLk5OR1cd
	okFCJVQg8vYg0PjrcQ9/PQC5/jpp6OGOQQRoiF0QbQgiKI+jRa5Y+pwkQUhLpcGMNhKQB3C1jN6
	RhBqEIuL5OSz42SYP1r/xUA6yq335mcF2hHO4iBpMVfMY7fyo9KyJ5jp57/CujXG0nlRAy2QdI+
	kL2nSVyEG5vD3WCPzr2YC7LjL6T6dTcL2
X-Google-Smtp-Source: AGHT+IHqEO6iiNGQK3OyW4Uff/hCa9rPgdg72YBN6JanxJzyvHSupgZP7w1TLkIwL8CTeFn76R4ZaQ==
X-Received: by 2002:a17:90b:3f48:b0:32e:2059:ee88 with SMTP id 98e67ed59e1d1-33097fd0ec5mr15794232a91.6.1758535039977;
        Mon, 22 Sep 2025 02:57:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35aa47sm11631315a12.5.2025.09.22.02.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:57:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D10BA41A2EDF; Mon, 22 Sep 2025 16:57:15 +0700 (WIB)
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
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next 2/3] net: dns_resolver: Move dns_query() explanation out of code block
Date: Mon, 22 Sep 2025 16:56:47 +0700
Message-ID: <20250922095647.38390-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922095647.38390-2-bagasdotme@gmail.com>
References: <20250922095647.38390-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3870; i=bagasdotme@gmail.com; h=from:subject; bh=LiTxzdPpqZoT1CgAaAWwmxvEAp0qgFo9wy0RJopd9BQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkXZbZOM/dcu3wP1zQOvlf7vD0+ipm+cl98c99v+cnrf ywR2Bih0FHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJ1KYx/K+KOV1f1yY9QaH0 Rte/+tfuMQ5LiwIeTZfVkMlLmmb40ICRYW7sWxGjdwy8a+YH2zae/lDjVvj3LfvNq83Lvibpb58 ezQwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Documentation for dns_query() is placed in the function's literal code
block snippet instead. Move it out of there.

Fixes: 9dfe1361261b ("docs: networking: convert dns_resolver.txt to ReST")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/dns_resolver.rst | 45 +++++++++++------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/Documentation/networking/dns_resolver.rst b/Documentation/networking/dns_resolver.rst
index 5cec37bedf9950..329fb21d005ccd 100644
--- a/Documentation/networking/dns_resolver.rst
+++ b/Documentation/networking/dns_resolver.rst
@@ -64,44 +64,43 @@ before the more general line given above as the first match is the one taken::
 Usage
 =====
 
-To make use of this facility, one of the following functions that are
-implemented in the module can be called after doing::
+To make use of this facility, the appropriate header must be included first::
 
 	#include <linux/dns_resolver.h>
 
-     ::
+Then you can make queries by calling::
 
 	int dns_query(const char *type, const char *name, size_t namelen,
 		     const char *options, char **_result, time_t *_expiry);
 
-     This is the basic access function.  It looks for a cached DNS query and if
-     it doesn't find it, it upcalls to userspace to make a new DNS query, which
-     may then be cached.  The key description is constructed as a string of the
-     form::
+This is the basic access function.  It looks for a cached DNS query and if
+it doesn't find it, it upcalls to userspace to make a new DNS query, which
+may then be cached.  The key description is constructed as a string of the
+form::
 
 		[<type>:]<name>
 
-     where <type> optionally specifies the particular upcall program to invoke,
-     and thus the type of query to do, and <name> specifies the string to be
-     looked up.  The default query type is a straight hostname to IP address
-     set lookup.
+where <type> optionally specifies the particular upcall program to invoke,
+and thus the type of query to do, and <name> specifies the string to be
+looked up.  The default query type is a straight hostname to IP address
+set lookup.
 
-     The name parameter is not required to be a NUL-terminated string, and its
-     length should be given by the namelen argument.
+The name parameter is not required to be a NUL-terminated string, and its
+length should be given by the namelen argument.
 
-     The options parameter may be NULL or it may be a set of options
-     appropriate to the query type.
+The options parameter may be NULL or it may be a set of options
+appropriate to the query type.
 
-     The return value is a string appropriate to the query type.  For instance,
-     for the default query type it is just a list of comma-separated IPv4 and
-     IPv6 addresses.  The caller must free the result.
+The return value is a string appropriate to the query type.  For instance,
+for the default query type it is just a list of comma-separated IPv4 and
+IPv6 addresses.  The caller must free the result.
 
-     The length of the result string is returned on success, and a negative
-     error code is returned otherwise.  -EKEYREJECTED will be returned if the
-     DNS lookup failed.
+The length of the result string is returned on success, and a negative
+error code is returned otherwise.  -EKEYREJECTED will be returned if the
+DNS lookup failed.
 
-     If _expiry is non-NULL, the expiry time (TTL) of the result will be
-     returned also.
+If _expiry is non-NULL, the expiry time (TTL) of the result will be
+returned also.
 
 The kernel maintains an internal keyring in which it caches looked up keys.
 This can be cleared by any process that has the CAP_SYS_ADMIN capability by
-- 
An old man doll... just what I always wanted! - Clara

