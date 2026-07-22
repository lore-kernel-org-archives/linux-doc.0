Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91823F44E9
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784695492; cv=none; b=s+CaW1taLigWClAjUpjnkePu8rSTQF2SrQe81Os0Eg7J58vMjDpAsGIamvQKy4xf8xGUAoxFnwZIlp4disb+VkGDlX4ocxYxFtfNyuwxWhzUQlTCFjhnpouGsOHjKPvq8qJmTxvKnbXLv9rxh3FwjyCyKyNqKLesKV17X6MoQpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784695492; c=relaxed/simple;
	bh=S4ZZskSWu6hnDAKTmmxRJbUzN1DVQxqyUudkEDmE5Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jelFry7koxWtDC83wgdy0c4f55Hs6ZNQyVc6f02X2oG3o69gdAb5eSKyfTF5Iay+H/YY0HN3WURy/W4o7oXsjoeiPyiZwXFxXXYn5tj+zc2b6B+NA1VYNAb7ioByxdARav8Fyb9wSsFVEw5kgpalbIUztYqrHDA8fiPdVliNZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7MurN7g; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7MurN7g"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso11308828b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784695490; x=1785300290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xeWKxJyA+9fWx2LL2WoI6edsZOwmmMa3RMgRh/3VoYs=;
        b=L7MurN7gzaQIFubuIZDWWlSYsBqgmKkhk6fdQeNNgE9QjdaOaSxtwNwnt6Bxbn7hXs
         8378k9ipvQo74/GhAPWV4S6kVN5N71FqrBbqWHo6fWZP+7EOpy62QSPhvMVm/CpuyJxg
         nSoynjUoNZIppHHJTGU1WyONyS2heF37ZoxfHjpv0rLPk1jwp3tynIqysk1gCmuiLkyY
         Yfu7IeDgyYvtpwyQD5vQ/lCUIsyXfOL6R99OhuFdg59l07M72Nu8aOuNaFkQ4m2Xz9cV
         BVV/EK4AMHZ+usmlFf7G4cJ7YGU8pTsSDwBm111O9eUtR9XRZt7NeH2H2zhr64djJ+v0
         5mbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784695490; x=1785300290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xeWKxJyA+9fWx2LL2WoI6edsZOwmmMa3RMgRh/3VoYs=;
        b=P38JbhOqGbCfkFI6WfzrQDi8zuVPAhaeAUSHHBLSmuR+9NaSlwZ+YPVLrMbCRwSUw6
         z5p0QLk+xnTd9UCT8e08C8Pveb6C4HTuTIUrYElkaGRsciiD4F43PdiQerm6To/4o2G1
         154z9zN4rw119ZdnqtqayI7TTWjFaqk5UijGFVY9wmTCfeTZ7rxt7S6aTbm7ygY8PeHY
         y/8n1+4TJxNo2KT8a/Cp9fBaK1C1gQzi6fIZRrOff64TC0r+qzBg3PH/RyyHLJnfkCx1
         jk2NfkYXfDrdSiu9+6ubt6S/AaG0qon+6jkAxYu5Ck0nELs+rQQe4dd/ouEKHi1wzZWm
         h74w==
X-Forwarded-Encrypted: i=1; AHgh+RoBjUp26+q+c7bakkEIYq7uSHliSWlHCV5+XJp+S8NSdP3ZziYgFq4PwOXlWjNaAAKfjRS0UEDhGC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLyw6/1Vhz8Cga5KUJuZDIml0y5yBmzxZelKaXrDOtYe3HI2Zi
	GW2IKxLx5ZfU52FAxzc8TaojNdox+goFwCLPAaMt1wGTdXS8fwv6YGla
X-Gm-Gg: AR+sD13x/9NCnumMvJ24xYI1IpHUXNzTCz0DQWGOkuBqCzRb9F+WXrjssPeqI6XSusT
	ZLrdnEzDf8hfngfm9j87Aj1oTosBcXvER+ZEw0QE4zqnGdD3iL90AILOm+k4CYKcesQps4xAVdG
	lQrBP11kWvYlgHKUJemuneeBxfRzgXBxvnJgbt2GYrxYdzd4bE9WnXyyjsGrKm2SgaqdHk2ZG5K
	+6ExvCyoje6hDnCANc77go/CW/AyTa8TW3BGcUUeSEkGpRmFmJ22e/ddsUsqrF8l4r6Ia/464Cw
	5IzqTBaWJvvh7OejjjhVPIFKAuMav/h3V9QWbj0DdEKMZOi8KkqzFDcjSzNUpmwJUdAZm8YDGNf
	kNgMsYQsEo9PH2K2fjPTmvRfNFuZ22KjJucW+4GOnIwrgGPrcjbxRnNI/VPvA2bQCqqUEtf6Q/u
	/xT5Yq0v/JSRWg7aOqvSVTTYT3+XHNSuxSriUOZLaXYlU=
X-Received: by 2002:a05:6a00:a11c:b0:84a:29a7:f3b3 with SMTP id d2e1a72fcca58-84c294e7925mr14086379b3a.68.1784695490139;
        Tue, 21 Jul 2026 21:44:50 -0700 (PDT)
Received: from colten.. (61-227-26-231.dynamic-ip.hinet.net. [61.227.26.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm654475b3a.48.2026.07.21.21.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 21:44:49 -0700 (PDT)
From: Jyun-An Chen <jun930436@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Jyun-An Chen <jun930436@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list:MIN HEAP),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v4] Documentation/core-api: min_heap: remove documented but unimplemented min_heap_empty()
Date: Wed, 22 Jul 2026 04:42:36 +0000
Message-ID: <20260722044236.6346-1-jun930436@gmail.com>
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
description.

Signed-off-by: Jyun-An Chen <jun930436@gmail.com>
Acked-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
Changes since v3:
- removed an unnecessary clause. 

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

