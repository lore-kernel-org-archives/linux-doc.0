Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA322DF3EA
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659437; cv=none; b=YPEkvY9VcU14uQM1ASnJJ3DIvz3HMfOhGFTv6j1JJDPAx9UsR6pFrQAH/2eK4NTmfv2RmJR1XHxb6qMdQRVmxq1jAofqlZeIJDF2/m2h3TPTvteXo7RcLQmKb056ev+WVE4zmE6LrGyKw7itfpAf2E0sVjrjn4s6i2yi0pb3+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659437; c=relaxed/simple;
	bh=2X+gemRbhVzS10YIiVdGi1RCYD1jaegwvIrd8xI4WGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XAUUDbjIn5LM0P80Tp6xkqeORoPWHSR6phrU7cAniK4WW1oV+ahatv4F+TcUgdEBaQE9D+U6LMFkRYY9J636qZErkViUhnPz2L8kL3b44SGrgXGy3SJqs82Ldr+QP46eR1GurzJ8jI64nDQBWa5g7acX3+DNnyOq0XIGZYXLA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNXbiP4z; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNXbiP4z"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so990076b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 11:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784659435; x=1785264235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZ1R52FLh7zPxa/FB3IxbEKOJb4azpn+fb3xIAf3SG0=;
        b=bNXbiP4zY8Tmku0+wvi6RygUfbzssnIfkcgPPnRXg3wnDatUD707OeKaeDs7bgDJbK
         KOhHHhwJn6YMCKdY02Cj+mwXZTeoZAyOU2O6XPIZbByE11Cv7rMP3SpfoantbRlIsdL1
         3NHPIDyQUQ3vf121pbhwqVvqZnXkKkRikYdmfu5oQxzsjW4vtTUPFwBezytzIbORtUg7
         eR+IE1DxNt2pkhEw1D3md0hA6wIulbxlX/kGwRefjXl3VhPHq9HSWjW9gH33mtoB5dtn
         WfU3geXZ5NElJVzmXEM9xrAkm4BgJl81OMiimwTeSkqwmE/YVNEzdwORrvR7ak/LtWbD
         eShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659435; x=1785264235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZ1R52FLh7zPxa/FB3IxbEKOJb4azpn+fb3xIAf3SG0=;
        b=f07mUrejsXFH7M95rVEpNCoqr+g3mOyyPe5Qi5QGN9Iyv/8Fqt/OlC4udlW8bTthdx
         1VSc+lUynO3kslzEPhNjv2rsQgMO5PX3Jq3TNHYG0W3Y9iwtI5LYOPezfdfoz5Vo+ewW
         yQsraeydGy21OQHEL3GdWZRzfAP8ALzZI4RipjBtN6GAxT6/qXQ3l2vZH2bqfAnECMRb
         zVXzlWLSiEmJrxA+WXP8TShHDd9jmUrUGxgxZdkiDP8jkNKAfOB8fuX120tDRGyog4uQ
         tVOrVc0j8Pu+Mgg4VT3hEuaXIo2rlqvw3aAIVvfP+at99qlJNb0c79L1boiOe5whfgAY
         Cv6A==
X-Forwarded-Encrypted: i=1; AHgh+RqO02rIGv1H/rED1HeuiwY0VFbQZOPIkrKIaMn1xAWltJ5g37ynyLDKGldO5HPMAbh/NAIJrYj0hSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwisdDtRQTQj7NAW9WQ2PbpPEnX9FE4wZ4ljnVStdaPrN74/Iy
	BHfRf1S1x7VTCRHeoss9QMXeb8fKcFx6tZ+kAWtApdq4EPF9XFbucvDC
X-Gm-Gg: AR+sD11P0bB0SPN5GwPl7MbEj7YrvjCqTBuQNvhN4/iE0/0JlR84pU2cKvu74d/Rk8X
	84RpoEyQUTcrHiibLSBqdX16fa/uIkTmagN8aRwuCOrdeiHgBd45BEHE00qE/ZL/9w2RPKp5/UA
	tWa61Jt3VXk/w6Vie1Dl9qhsu9gEh/Z8fOufJuKMM3GCkYBNrudBa9iSXNHxPOka3jUVqq5IJoV
	z5VCRGSL7sYfJtGz1cDMcFquYSvEIcOF2cp2Paq2JeNbF1x4Lq0Yo2VoUU3JZRoVQvEJT8xhPlR
	tTUFQu5RCmBjz0KpLTy9MQkM8Z2/zE6OHUbiKB3insSdxg56skLPQPITESbvaPd7pElwekZK4kh
	J+2LCyRKSEbhVhh9pHKsz9CbAvqEPBuG+++i0I1BjRyAjn8QDZTplXDeVw+T4wMZsZlWYUAykNS
	9aBD8cxGLJTPp2f1zwr4k30dc9CwvXS+/qbdONc7XYVhI=
X-Received: by 2002:a05:6a00:240b:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84c294ed503mr19156469b3a.71.1784659435441;
        Tue, 21 Jul 2026 11:43:55 -0700 (PDT)
Received: from colten.. (61-227-26-231.dynamic-ip.hinet.net. [61.227.26.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm138056b3a.48.2026.07.21.11.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:43:55 -0700 (PDT)
From: Jyun-An Chen <jun930436@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Jyun-An Chen <jun930436@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list:MIN HEAP),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v3] Documentation/core-api: min_heap: remove documented but unimplemented min_heap_empty()
Date: Tue, 21 Jul 2026 18:43:34 +0000
Message-ID: <20260721184334.143152-1-jun930436@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

min_heap_empty()/min_heap_empty_inline() are documented as part of
the Min Heap API, but no such functions or macros exist in
include/linux/min_heap.h or lib/min_heap.c. Remove the stale
description instead of adding unused API surface.

Signed-off-by: Jyun-An Chen <jun930436@gmail.com>
Acked-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes since v2:
- Fixed subject line.

 Documentation/core-api/min_heap.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/core-api/min_heap.rst b/Documentation/core-api/min_heap.rst
index 9f57766581df..919dcf1bdec7 100644
--- a/Documentation/core-api/min_heap.rst
+++ b/Documentation/core-api/min_heap.rst
@@ -240,19 +240,6 @@ This macro returns `true` if the heap is full, otherwise `false`.
 
 **Inline Version:** min_heap_full_inline(heap)
 
-- **min_heap_empty(heap)**: Checks whether the heap is empty.
-  Complexity: **O(1)**.
-
-.. code-block:: c
-
-    bool empty = min_heap_empty(heap);
-
-- `heap`: A pointer to the min-heap to check.
-
-This macro returns `true` if the heap is empty, otherwise `false`.
-
-**Inline Version:** min_heap_empty_inline(heap)
-
 Example Usage
 =============
 
-- 
2.43.0

