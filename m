Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EABD2D6409
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777803370; cv=none; b=RoYl2Z1pW9tJOkIobGYWsqIANVU79norwzd8Gk+OGc0dlxBleKDQlU9cHhi5tBoXzm48tL3UpbfGUPcubJN1f77NjpsKYsQ8sSf3h9r+7ITVXCTeuLXtX/Ms4A5ruokmPM7BX6zmp26pYobohzRn2O+QujnanfvuEZ/k8fre2Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777803370; c=relaxed/simple;
	bh=1btOSWinIznhILUWPU9SQybPSt0VmE+8i3i6zz1gQ84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hb/wZTr7nj8yaIQXlXbPEkeDURaoIuKUp9L2Juq0hgEGwE2o9QMYepMOY0ikrFMOlAQVmdqTX1XiwxIuW9nXaeUZuOv5bECz6+PrX6VXDL3PNo0Ea20eNethkdGetRXFMJWgsc/pnY7cswSIfGvDj+AwulXJPz/vnd7aUYTyuB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfDzuL+A; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfDzuL+A"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso986950a12.3
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777803369; x=1778408169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svXN+ZlAdU7VDLF9TtRXFpJ6BtWW3ljpT3ve/4UXduA=;
        b=TfDzuL+AosFUfIlhwGPlPmr0Kvwk9jwbOzPZ3hRyrBkWQefnjq4oavyT+2kbyw3y6H
         16qgWM1N9Fris9KXcrcNkkBacFa1JH5LFJkRZnvsf3aYsGHuNmrFUMdupxnzg5yVeEGs
         ie5HUFBZjQXgbx1Z89XRBPRAMT9G5IdI+5Dukyq7PUxWfQXDCc9NCVO+aQdsIZ7jfXML
         KpWQKIgsXqBvzUrfs8P+Y6TE/G2h0yojt/10XwreShYz5YJoIY0IYZ9jrevVnKgP1XQf
         nGKKi6AJ6oJqQKvS7VgI8tCPRoPVLSb78f+6Mh2+3BzcQifEhMMbOw/JuAdigUPKo4nE
         wdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777803369; x=1778408169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=svXN+ZlAdU7VDLF9TtRXFpJ6BtWW3ljpT3ve/4UXduA=;
        b=ZZukDcD3lI0gAeOHb+YjNuyJwNuuLGVuUuvg4ip0WcOxiJbjj/iud1HXbvwaIU55DG
         PAVl1BfjRGKkL3YO2GA6dN1FW+TpbOOZBQLxUfqCmaMGME4BETH7udQpy58xex/GXMLc
         YNsoaU2Cl4kGK6O0lq+GUgo0RIlT6bl5Ue4U+AULNME4l9GhwN08rulGbi1R/8Dp/R1j
         vnJidF9mAvYleGt2ntu2y0euH+Y9F3/BOM00YVhI1vsM62yKYSoo3rsLf+RYd6fi5K51
         +MMpv+bo+wNDRxlnYNnDx18kVN6m2ivSuIKcuM/H3kONUCGys0czNKNiRRGbvC2CmV99
         Qx4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/9vaQ0RXWVtMdq3K7Fz/Mx3TSEabCT+0bITnHXtBwGBfm5GCL9SHderwWCXw67sJchQXJ9UKZnIIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuD3YINFOGoH1zOSLnFJIfI47j9V1rO8GLam8kg0mSTfrtZc5G
	UwjqJl8y0colak6ho1bvEsabNuCCS93v8ZI8gyKamplV1AtNyaVS6PsS
X-Gm-Gg: AeBDiesiDmIO0Wg9ifhSBeQ8+E5p8+sLdxsLrP0sUiv2YRWzNpEAaCL54JHCvHMAifx
	q4KATwf3w5+Li1S1BlSDmQcc0JP7s6UAuHJG/fEdFBAlK0nkbfYXhpoT9tgqUHZ/sKoyVpXmvfM
	Hq8mPDw5DUPvRjru9sc7RaeZCTaLpGXGdT0pdIiadnY216VcYEoAI5vw15+y44mS0U+kQP4Qc+6
	slW7zFa3ETj5220VLxOPpp7bIpc9VvCZbKvZ+d9MEUngRGcqOCesXLc58ALtrgg3wNuvE3TOnBy
	oqukD5F5lpvHUgiQkh0BHKOkXCsYL0gxiVqvLh3J3CSyg6y9jh5J+Tf8oa2OuzSG2yGRtTEe6r4
	OosN5a/9X7GmokzgKLDK2TYxJ5g9+G2uQT0wcWD4MX8EOww5KyNohGxIH+pcSgcciR5OWJfmnk1
	Kd+HJsa+R5D5zuksZfqpFFf9ZwFg==
X-Received: by 2002:a17:903:1a86:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2b9f22144a6mr50304105ad.0.1777803368740;
        Sun, 03 May 2026 03:16:08 -0700 (PDT)
Received: from apt ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caad2bd7sm81073455ad.36.2026.05.03.03.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 03:16:08 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH 4/4] docs: admin-guide: add IGNORE_DIRS example for cscope
Date: Sun,  3 May 2026 18:14:29 +0800
Message-ID: <20260503101429.254394-5-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260503101429.254394-1-hank20010209@gmail.com>
References: <20260503101429.254394-1-hank20010209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The workload tracing guide shows how to build a cscope database by
running cscope command directly. The kernel build system also provides
a cscope target, which supports IGNORE_DIRS for excluding directories
from the generated database.

Mention make cscope and show how to exclude Documentation/ as an example.

Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 Documentation/admin-guide/workload-tracing.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
index c49c2a00a8b8..314e5f03474e 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -202,6 +202,15 @@ database. To get out of this mode press ctrl+d. -p option is used to
 specify the number of file path components to display. -p10 is optimal
 for browsing kernel sources.
 
+Alternatively, the kernel build system can generate the cscope database::
+
+  make cscope
+
+To exclude directories from the generated database, pass IGNORE_DIRS to
+the cscope target. For example, to exclude Documentation/, run::
+
+  make IGNORE_DIRS="Documentation" cscope
+
 What is perf and how do we use it?
 ==================================
 
-- 
2.52.0

