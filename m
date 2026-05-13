Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282BB4968E2
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694025; cv=none; b=MUaaVlC8RcHXCmhADz602288O7OZpmGYufRiu28vPPmaPdsB5oHJh7FCAMbFp52hC9TMBCUEyIK37o+MYDmnPz1aVZUmc3kO4CH+slHb8bX4Oqa4GnLw1K4eVdlmjpOwVbMxDesuKGrBO0P/s+a8XmdencD3A936ExfrVlYigA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694025; c=relaxed/simple;
	bh=3MoAmXx4klLcFBlzRztxDrU9XSZMQVB9clxB1R5Fglk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6KyYcIk+ZTW2ZvxlPe7gd4sbew/U99ZhOf6ISHT2cJ1iv2NX1azYJ/z5q7vzY7GG5B0Woj+5jSIYEDbvubBleieXPUjNMQMpPxlCY4pOFjZqXljQe9yrifHHC8rzN8+v6xfe///pUzFANVplR6hNIqq0UsrZpfoinbQPSpRpPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWmTYJuO; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWmTYJuO"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so5041581a12.3
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778694023; x=1779298823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzHqT7+bqReU2IN8b9Y/GQTKGYkCfbW6mkEkF6IdFM4=;
        b=YWmTYJuOjsf3k5lUiVY9uHDz7sC9z5G0Ryce7BE+B+VGxIB3114SyRMGwvbAXB68gT
         8Bv1kLWv3Ww6C3ZAFl7UTMavdfZRS0ul+5dAU0NBah8pMdk1LZmF5JGMmIqXvBttb5D/
         QfUQv4H1O86kcvw9EcXsplxPvTmfF+28y8CEzo6BcyDGmtlFgWkZglFKAVFu2msNTJUQ
         8R7Zj6gJ7LpXhbQKe4oJxxCxg6XyjRXceVpFsnaCbzouZkCztpO4NYhwmhvniyvJLZTj
         m21fgordd6rlgcrdFq1sSYcAzNtEPCfLhMUwaUOx9loE7ja4q1x5pEfwHJ5GcbSsXX4q
         yOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694023; x=1779298823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GzHqT7+bqReU2IN8b9Y/GQTKGYkCfbW6mkEkF6IdFM4=;
        b=KZYrvfiN9vNRTIzX9OPsY1CUjo5Ioy8nDy/Itu1kFRhcwDDRuX01YsmGmJwtolInJM
         mwzrAh52vLrIGGjIpcuFZpQvINlYVs2xaRkOJ+5JDcAPhC6wFiDraZxECETXu43u8Lkn
         dbkFvWxlOJrFeEizDP/459LYNIWbcyr+r+XG14+ao2PiK24jvUV11MQ9CqLy9dfnuODj
         E9dHyx9U9rfZVHiHPUCgkHfL/AUr51iHOyhtKdWjIMxFaBWJjl/JfpuZ0NdQ5T+GP0wD
         HDIwUTey7Jmlwc17lSRaiWHaDfV4qHR2K7klcmpSDXZaVbtEoL9+boEsM92idUKdkaRY
         6/cw==
X-Forwarded-Encrypted: i=1; AFNElJ8tWN/ropqOPHB0qfMW6jk87JQa0vzG0ezcR2dig2/+IoI6CqWZBg0arzH33Sqj5CfIizPzHo56Fsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YydPYmRMNTnnGeVWcG3qq0pp68ij+wj3sYSwqrwOm34Ng2/xavT
	GxW6a49JUb2+UQ0Byq95gBfeWIQfBRJcigtMkhTNaT555rQOJtsj6/dq
X-Gm-Gg: Acq92OFD5b+LcCnvhE4BuGAG/+Bj7ofNovw+ZzYmTDcmPAJ4wpGvZgeoMNSiWwzYK62
	ofTEMXC8XmtbeunN18H+pQiKfSQdsQuwKbWkfLWc1jjWa7TmQwyMWTTxU/PmFpUz93m3LdcAY2r
	ro5bLLNmMxKvgcZZ+zRuY4zUjmv4bxJNUaEQveK3Af+9cdnHFQOLol5uiT+LdeDdR55kqVv9XN/
	/ZySxJh4JqDJh/zoXgtSSuz/Czf9I3SegyC2w9u/UigbxjRDVxozkdI84PdbgXfHZ1YOt2snO7k
	trenCpREMarhswA9bdskIqOeGzANAQURaQ6HudNKfxpIg55aFcstRl73Pot+3sbWZQvwYfbMaxx
	jeOXThRerJPPgg62Ns1kGQ6rx7nFAqyjXXR18+/6Xd94267QWJN5QK6/VN/NTrOiQz5JHQftrC3
	VDxmuwLkS339XuX1zsS62B8+CFA8JX52ls/NZ06AyKICpvDTSgeIOG/BL0Yi7GEo9fCM4gP3MAz
	F4he/A2ZvSJJ7DWUWL6bWRntWPecuYBNyH5aDQ96xAoaMEdf96kXV21UQIpdMcre0OXa1U0SBvh
X-Received: by 2002:a05:6a21:9982:b0:3a3:e2d6:2e71 with SMTP id adf61e73a8af0-3af83289859mr4611942637.42.1778694023167;
        Wed, 13 May 2026 10:40:23 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-163-225.dynamic-ip.hinet.net. [1.170.163.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267696787sm15703920a12.13.2026.05.13.10.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:40:22 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@leemhuis.info
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH v3] docs: reporting-issues: replace "these advices" with "all of this advice"
Date: Thu, 14 May 2026 01:39:44 +0800
Message-ID: <20260513174009.1260-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512150431.894-1-eric039eric@gmail.com>
References: <20260512150431.894-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Advice" is an uncountable noun, so "these advices" is grammatically
incorrect.

Replace it with "all of this advice" instead, which keeps the sentence
grammatical while also making it clear that it refers to the full set of
recommendations in the paragraph.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

v3:
- resend against the original base as requested
- replace "these advices" directly with "all of this advice"

v2:
- use "all of this advice" based on review feedback

---
 Documentation/admin-guide/reporting-issues.rst | 4 ++--

 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 16a66a1f1975..87dd874fffcf 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -129,7 +129,7 @@ After these preparations you'll now enter the main part:
    situations; during the merge window that actually might be even the best
    approach, but in that development phase it can be an even better idea to
    suspend your efforts for a few days anyway. Whatever version you choose,
-   ideally use a 'vanilla' build. Ignoring these advices will dramatically
+   ideally use a 'vanilla' build. Ignoring all of this advice will dramatically
    increase the risk your report will be rejected or ignored.
 
  * Ensure the kernel you just installed does not 'taint' itself when
@@ -795,7 +795,7 @@ Install a fresh kernel for testing
     situations; during the merge window that actually might be even the best
     approach, but in that development phase it can be an even better idea to
     suspend your efforts for a few days anyway. Whatever version you choose,
-    ideally use a 'vanilla' built. Ignoring these advices will dramatically
+    ideally use a 'vanilla' built. Ignoring all of this advice will dramatically
     increase the risk your report will be rejected or ignored.*
 
 As mentioned in the detailed explanation for the first step already: Like most
-- 
2.53.0

