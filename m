Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91762F5A06
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573325; cv=none; b=AfMZWfZsEXEqWRKFcAKAe9dg2FU1NQpBhb20PI7q/8lI5A8tkbXIJNkMK7ZPa5XH01VMS10Kah5pauJrF1qrq6X5nyQH2bVvfdLFSTf84z+Jq886je94nHUB4mD4JWlWGsxBJjwjvG8ReIh9HAS5r17CFrFcIrkEvMkfWvOFTGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573325; c=relaxed/simple;
	bh=XqniSnxjZywG1UJ0scWRsx8K04ODl3ZvGr+5qxPtkCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g+7aSFWidq44gGEtdNCjlX04/3ThiJuA/T6gsdNinX7d3/UBIjmngxusvb4d79IH3MZLM74KrT99seLtTCFXoJfC0XpeeDKGTDIRANnyP1WqjJv8xMRi3N1DJmlFyaOr+2VNfbRIto/TixRt7+zbfu47Jr6uTepBfrEgF/hiTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENoIpTYo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENoIpTYo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so14704335e9.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788573322; x=1789178122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGqr/uumCH3i/wD1gHE7y7ihUxVOE4Gxi7P61fIxB4A=;
        b=ENoIpTYobYbBK93UEdjZ0EOcLebBhAwxMAE6G3P02k2YSsbaLxzfFtsbCbDPQ6N4tJ
         /40qDeWNQKW6VA9ShH/hHMuzUlHWdvl1SfT9Xvw3vX+8mlJeOKC0L32cN8W+qs/7TUyb
         d4IYwTESbKKUvtQoaAukFRu9Di81EBfQzG2LcBklBqU73oxo2DOqXyAIxHeHB6aV9Q6p
         IJmCdtHE9YhmYjxz0ju52iRifgEhGuFMet/b9l/5pwUVXJ5iOl0JR9lzbcdBCjyYfvcp
         UjENxil9FxZuqiTrN9+tzBs/6ltqsaJ+UxEjjWiFQCNdQ9c4RuZxbZyBnDrwX+2K6QBM
         Kwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788573322; x=1789178122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGqr/uumCH3i/wD1gHE7y7ihUxVOE4Gxi7P61fIxB4A=;
        b=TciaSb8x2Zjv8s4VV6rDQmT3sZtCFe/k4+m4a21Unj0DYtDCdTBtyCxr1QGZ0JxnzW
         huFZ933cGzCqlgITpW6D/sC7DivFvPHzICF8bKZcuk4n4oSiSGhFjgN7iW6FzC4kn6hc
         TykNQwuj0QmiHCJLkeQbg4p7B8TWwxiPpy4pP5J7320mesZZojul43J6lx6N/SP5qhNe
         p5YOugHseoCZqW14TYjykDmgls5Nm3cmaIqTU/OoZ+L9/EiilnhSWqXTwVRmCrHKdRIf
         SXH0/jqUhfWtxHzXsToBoZTig/E+FWYUBUWSfT3JRwTOYWZHfyXI3uzWWnsl7Suzj6Sl
         vFZg==
X-Forwarded-Encrypted: i=1; AKwUvBxUruSCg92NfO0NI7KdLAwgrK+G6hWPfhWvZDUSxaT6yi93sNg1FYstECYb7hd2gJNCHg/9cMVMclw=@vger.kernel.org
X-Gm-Message-State: AFuF++n5Vszun5SE55YSVr60ebtnUcWNsC+PG5LEuZqXFgnAFJdOHNIX
	NF+RvAN3kfz8nmjz6+tEPIWU6OOAZkjokFUlEesyTon+P1w6HokJcN+M
X-Gm-Gg: AYBFou1fudm4FMg6R5DYLztHvuHlktvv6br3Zbwk+ZYT4G5OZJMKX7XcYP/98qtvvLs
	re0BaHVmQfWtJRHyv0PQg68dd4ozHKZs8XLGguKqJYekDxosf1C36QJJezg3WbGZwbyRIJuNm61
	8Ut31yBtnvWodSjqI4jEbmJO4Y9AGcuo3T0TUAzwY9Us105E9A9IYQkGt6ehfFydHuepJSgF1+R
	3aazKkntkysWfz1kEqxXZ2lasDgmrJ6pjvV7NbD8IwfGhiYZd4pEFEaFgdKxzxCgZ+vpf6dq2wo
	2j2QDYCGYuo4yCTIqTsAFJQGcgMHpwvpehWXHbqWJc0G4IhJ4ESOcD4RaTVcYwROcMy5jAW4yry
	uqD3wifuShVqo5NIolx2MViczNEXuTAlL1xzkAZ3p2501hlir9CCS7MZ0fZa4bqaFM+4YFhbZ8n
	qBUXT5gUjgp6LardLqDo2U1XCMzXSS1s1/lFk95LgGFQhnfzVYf0pJTVi9ZbG1DjE2dp3hxocsW
	RFN/dXmqMsAv6HWA/DF/a6iuBK7vRf19bGCGjugrgHXLeBIIeTMS3UPnIaeASezSdfTX0rrTQMk
	V+qLVoBkVTsAgn7LJoVHdYmtAY/ZdGIVmDBhd5IOyuFO8W/KmN6lbIgZsCzzFci4GFY=
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr199069625e9.0.1788573321755;
        Fri, 04 Sep 2026 18:55:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm51258345e9.14.2026.09.04.18.55.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 18:55:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Liam R. Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: maple_tree: Replace removed bulk insertion API
Date: Sat,  5 Sep 2026 03:55:09 +0200
Message-Id: <20260905015509.76265-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e3852a1213ff ("maple_tree: Drop bulk insert support") removed
mas_expected_entries() but left the documentation describing it.
Document the current preallocation interface instead.

Fixes: e3852a1213ff ("maple_tree: Drop bulk insert support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/maple_tree.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index 12bccfb6aac1..836342fb1eec 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -214,11 +214,10 @@ Advanced Allocating Nodes
 -------------------------
 
 Allocations are usually handled internally to the tree, however if allocations
-need to occur before a write occurs then calling mas_expected_entries() will
-allocate the worst-case number of needed nodes to insert the provided number of
-ranges.  This also causes the tree to enter mass insertion mode.  Once
-insertions are complete calling mas_destroy() on the maple state will free the
-unused allocations.
+need to occur before a write occurs then calling mas_preallocate() will
+allocate the nodes needed to store the provided entry.  The entry is then
+stored with mas_store_prealloc().  If the store is abandoned, calling
+mas_destroy() on the maple state will free the unused allocations.
 
 .. _maple-tree-advanced-locks:
 
-- 
2.53.0

