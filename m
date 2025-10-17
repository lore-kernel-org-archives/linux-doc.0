Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D83354AC9
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733464; cv=none; b=trmh9MM2SZh7gEZOBarV1gZnQz0jVcQSbZixxSs09P/VMlUJUE+4IGVmAe2cdEmPog2ue4+WOO7Had3i/20cmpaHe8gmeg1Ziuok8ACtlOEUhprqwQz0JmB5zYM8/1oBEUOeYm6oyGHg0YCiBS2HIdG7cmxP8W0JjLEHKhwlEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733464; c=relaxed/simple;
	bh=t2vDXy/N2ueu39KGbBgzoIFHjBCJD6yAmUD06c2XdZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JU3ST1EWEpyhCmgD9N173WLJzvIRMzaQolfNJTb0T09V95NSzQXc4B261tOiwaLxP9673aIBpSxJVwfErLb83ZU0uJUQdvt+Intw4812awrErb1tf7HmvG70S+MwRlbw+Y0BO9wV2qj2KSwuO5amNqSwPhp0wEAx2bvWNt7+3EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WKSMlI1V; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WKSMlI1V"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-273a0aeed57so44362165ad.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760733461; x=1761338261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PJC7jMvSltr45N6j/1sXc1iZUOgofsB+o1CC9x8JZE=;
        b=WKSMlI1VVQL+fGdk+hnhtkNrPTxW+8gKTq46Vgla41KT1Gr7E+MrM/dNuaAkA8KP73
         dkaXvB1MFQ+dUbDhzfB5bpsa9t79bwsdfo6yzWjeHsGM9KUSlUiEbqikGEyKh+Mcrh38
         CNZLg0wQ3mLh4XJZfVNQhBrJxD3wkr11b5wjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733461; x=1761338261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PJC7jMvSltr45N6j/1sXc1iZUOgofsB+o1CC9x8JZE=;
        b=dD9gP0NHQA5AIzuLDqdGshUWyg19B6oium+PfI35Go1BDSbPiCvL/NZEblcBq5GES6
         7txb1HgHZRAqZGE/BfJJ0OK3cx+CWMAoetczEWvju+TsUDlfhHTQrVGUVyop28MPcBpt
         cYEix1RQWBkfmES7CM2wSf7t/0X5ltalpI7qzQPr6Cspi0LWNDPynkLKJWFSYg84Fecb
         lIIys6PGnH/nmAgJoDxrFKaru4qgzdJcsC3uZ0XZ4OpuFMyJTPcH2DqfNV6DLxR1HxTP
         sHIDbQSHP5eypz/rlhQU0QPZ87jPxE01lYY7dYdFxGNQlXw83OIeZfunOY04NX/zbBmU
         DMJg==
X-Gm-Message-State: AOJu0Ywx2gRKUaNuhjaqBiqd+WhCqXxao4i4IVPJbzjrAQ470kb+X7Y6
	ntcBDy0yV+XnVOAwhx5x97Gz28EIp9w8HtgPXJfYURB2KoPV70t7YejrwTFz+YbEPg==
X-Gm-Gg: ASbGnctQBGPCU6j76sqe9gmPteCOSgp4PTAszHCaY/LSAEUVoKvsa3z8fUzmcObuUXA
	f0muTgUdar71/Mq4dx/cpNirvymBs15pLOmoAetYEZO7eHS945ulB03sdukee5JnnyJ/LkopqsQ
	uMDaSX0Tf05gUU8N5YiOY2Qjiupc6C/T949lJBi4Ke01gpFOKhK/I+hqNbxYiDza/EvOLtBLjOp
	50yK/av4VBiFvB0AEYjQWoo0NNGZWQ0P/FgEnfnTrRPUmYQodyWtGxzUHNsuIdZfOg/SOXUU1Pb
	UYWvsBmw8r6RGFNFJhn7LQdowli6STByoFyo6gJAgItfOYcmJRTBYggfeV/j40m5an7ZnS2Z/qC
	Bg4+d+ShkzDu6St6xm3HgGS9X97GTdNmmXNz75ZrvKS/pOFSrEom8vwFZWjPQkCSix5VdbFoqwV
	q90TwfGLzzOKjtndwtBLQVynaXuZMhiwWQGnMhzjmpwxJQvmgk
X-Google-Smtp-Source: AGHT+IGroNG6E6CZwhT/9LbiABBUYxgk0gxokJeQCFd79Alxi774wplaobu25vmDQEPRfMelbU6gFg==
X-Received: by 2002:a17:903:22d2:b0:288:5ce8:ea74 with SMTP id d9443c01a7336-290c66da7e2mr76340735ad.3.1760733460923;
        Fri, 17 Oct 2025 13:37:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5ca9:a8d0:7547:32c6])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2924721936fsm4049835ad.114.2025.10.17.13.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:37:40 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/2] docs: checkpatch: Align block comment style
Date: Fri, 17 Oct 2025 13:37:11 -0700
Message-ID: <20251017203719.1554224-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ironically, the block style comments in the checkpatch documentation are
not aligned properly. Correct that.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---

Changes in v2:
 * Add Randy's Reviewed/Tested-by

 Documentation/dev-tools/checkpatch.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d5c47e560324..d7fe023b3080 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -461,16 +461,16 @@ Comments
     line comments is::
 
       /*
-      * This is the preferred style
-      * for multi line comments.
-      */
+       * This is the preferred style
+       * for multi line comments.
+       */
 
     The networking comment style is a bit different, with the first line
     not empty like the former::
 
       /* This is the preferred comment style
-      * for files in net/ and drivers/net/
-      */
+       * for files in net/ and drivers/net/
+       */
 
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
 
-- 
2.51.0.858.gf9c4a03a3a-goog

