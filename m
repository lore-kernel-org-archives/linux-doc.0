Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71A2D12E2
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 03:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761104634; cv=none; b=Ig7reCsk0QsnkUr+gYxwEKsoq1grVe+P0lLqvBaEj7ngKaeVdlzw+f0UzqKf8CmRt+KnuRGtQJ4gOt/BXffNI9yeJdD3snmiEIVBWEEs2tzdqvl3Me+euNZLi7q34XAjXXV3cqh5716NBcoa2Y8QCucdLLxGgvnnf6W7KjCxgF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761104634; c=relaxed/simple;
	bh=dg6Xeh8W9jYy+DaZHQ+BRa/bMuMWs5I/8dF5W8zJ63o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNgxOt7ocnwNZc/vlY2eenfVO2Z0K7An6xLnG4hN0FyBA8n3EjjBMXzrBf7KUt/GTDHBi+gfUCT0pmPQj/ukzrMtXHJSgXi6N25cTCXNLBJrfLCHUggu1by8S5SdK6BfBho/EwoqxDSIi5IiPg/V/1zCBP8tz/js8NNBSMg0Bxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dhj491uD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dhj491uD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b40f11a1027so1242009866b.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 20:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761104631; x=1761709431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vTRF+HmDl+bAL0OAwMRSISeP2Yi5Xj/P9MCjPmh9ndU=;
        b=Dhj491uDf6GgM98QDG4rMrgqFm6Y58n8M6FCBBSlbDeNKpHfWParpleNOIW63VzvJU
         OoQbFPtQRX1HkjZFuLqUjICVnSAuGdRG0ltM+9eO4K1c9C4frsmiRF7u1dhx9CpID9AH
         PRhsQQOuGxQeexv3lbX9lkJS0BCLokA3/542To6uNd/Vww6dXvxe5t843vjvU5ezjxY0
         OZptqPdPp22XHpCigZDNaKCekDu54tRgd2SAGr0F0feHl3jT5sZWrUzZg/+oyblcJWdS
         CvR2ELCxwntRh2NEn0qIzuB8D8pAqSTV204DdPIXvMmvTYVl5K2anL6YCw4+tyEdRCl4
         wu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761104631; x=1761709431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTRF+HmDl+bAL0OAwMRSISeP2Yi5Xj/P9MCjPmh9ndU=;
        b=pHTUsGJfHb8XlFGuygNfSc2ybBJtxO7jMfFFTfvfvcHx8IqMQFr42sLncyLm+4OBNQ
         o51bAhrIkIcSD2mkbMPkvyrUxD9MWMQsWs5eUqwFDgSrQPczTlmQKICSDdNvppzukjzl
         XX77htwxf4NAX4w3Nr0vfQRrmtxLWqlwkK7JrIrehJvgxhC4dARzBGe4xMmSuy0LvjRI
         8AXFDibdkYcFak3V2+3OPe0tXvyFTfxdXgRqqH4fax4YiEYnSiZhgC5v77fohJ8DwVai
         RuJu05NmoBJj/PfEqQ3R4GA9JIdA+GjGG3YohviyuGrIsqDBCYc8nXUQNwRBKhz7pW92
         ctYg==
X-Forwarded-Encrypted: i=1; AJvYcCX/WnqenjRoafflP/FROjJ/t22ZmydqVZG0n5r8a4ufHL9fjsRrf5r83awuHYmuQ6fWgjCIz24Btwo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Bu6XwEhe2QRNlvhfsSc/jzHi2m0eTNlviTiJsRmf+Ogg0Enc
	/n7FMrm9S2Xy9kn01bGWLjJtERHLXeh3oSO1Mi8N50lecbUsmN/NWLSE
X-Gm-Gg: ASbGncvoqt0oGg7hlaAl5nmwCwSoaXEX0ivzOeGDQn3900eS0cfnfUKKVW6BeikGdyd
	nIon5ww6l0pqgELSwT2jrSUWrOKMD3HOZ867Xt0xu1HClvj3dnnKuwzC4P4KM5Wb+5292ZfKOn/
	5rV3v8PxgTlLRvEJxxoUS1jYYYrOFzFk92HRnoUek5kVVYR47WJebkvjcsby63tZpAUx1KqAFLH
	pn/rEy4sY40Gqslt8hT1noLbxj4IsfDJf3MPEimwTgOGmzPZS8DDgvXznGOCxV2nfVEIS3vU6ZJ
	QPM9s9pWc5U1mtDmB1oSDbAnr6A9jai1VQtAiXSb/ZTdtJ9kskcQUcCw53wtmkrXCzFmQ+7u60I
	Eq0ETtSFlGc/+TFXWnW8Bny+xKUAk76yIxutYd9t/eaDPOAnBEx0ZWP+M0SVn1txfEBwfXiFiUQ
	upBw==
X-Google-Smtp-Source: AGHT+IHPO7PWYa0DB82l3UyTHZGWH0MJm65SKGjGbpwKQ7i46gAfvnK/b0OSSMfiAZu596bNELN8nw==
X-Received: by 2002:a17:906:c103:b0:b3c:de0e:7091 with SMTP id a640c23a62f3a-b6472d5bb42mr2004845666b.8.1761104630850;
        Tue, 21 Oct 2025 20:43:50 -0700 (PDT)
Received: from archie.me ([103.124.138.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8395c52sm1220593966b.30.2025.10.21.20.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:43:50 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 719D24236CE1; Wed, 22 Oct 2025 10:43:45 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Documentation: process: Also mention Sasha Levin as stable tree maintainer
Date: Wed, 22 Oct 2025 10:43:35 +0700
Message-ID: <20251022034336.22839-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=bagasdotme@gmail.com; h=from:subject; bh=dg6Xeh8W9jYy+DaZHQ+BRa/bMuMWs5I/8dF5W8zJ63o=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBk/gpqT5OacOPDC+KawRsOrkmu8Rx9v9XgcMJ0/bc1H9 ozpt+fv7yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEWmYyMjyrXFyeoJDyazqj mLijOOeZ7xGZXoeiWr2TF1z4zvzmzAGG/8UupnIcE9laTvRv4g5s25PjYPPET+orvyjP2468Cvf zTAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sasha has also maintaining stable branch in conjunction with Greg
since cb5d21946d2a2f ("MAINTAINERS: Add Sasha as a stable branch
maintainer"). Mention him in 2.Process.rst.

Cc: stable@vger.kernel.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/process/2.Process.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index 8e63d171767db8..7bd41838a5464f 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -99,8 +99,10 @@ go out with a handful of known regressions, though, hopefully, none of them
 are serious.
 
 Once a stable release is made, its ongoing maintenance is passed off to the
-"stable team," currently Greg Kroah-Hartman. The stable team will release
-occasional updates to the stable release using the 9.x.y numbering scheme.
+"stable team," currently consists of Greg Kroah-Hartman and Sasha Levin. The
+stable team will release occasional updates to the stable release using the
+9.x.y numbering scheme.
+
 To be considered for an update release, a patch must (1) fix a significant
 bug, and (2) already be merged into the mainline for the next development
 kernel. Kernels will typically receive stable updates for a little more

base-commit: 0aa760051f4eb3d3bcd812125557bd09629a71e8
-- 
An old man doll... just what I always wanted! - Clara

