Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A081386B5
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710270773; cv=none; b=bsZgVO0n2oZZpU7Q1lZuKxddAdbXRjgMWqXotb1z2d9k5sPfkSzehZcIwZ/Cq+qURWJSiM1AtH6dxc1IHOGt65pmtZBTpT0JiXI3lnl5SIIzBoRxydwt+L5RcUUqSvmWpPNXFMBbzCZHyfz7dfw2JIJM+Mdx1OpY3qdPG3bLozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710270773; c=relaxed/simple;
	bh=1Brj7Ha5+fbF32x3NFBv4yvdgHj7Tx/5MV5i9z3IqE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HQ6s79B6jiJM+osWdQckJP02HebL88t+d4dZ1JTnBFgYbZ6mzRvxXJEvvQijJ50IMt07wM47dAb4AOON2vaozvZw2IODxOGOLexqXAE7rb9WLgbGuXgrNtIDPM/MLc/ulG6eTx9SuGpaLh+Gaa9UFnnySD0CaRKflD34DXTnWcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlgPOKyq; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlgPOKyq"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60a5a11b59dso9901697b3.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 12:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710270770; x=1710875570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRLuvuRLRD2eLcvzdQSEvSRDyYr5UyjvEaAEWSq4BXk=;
        b=KlgPOKyqE5F7i1IX+UtwVFY+Zv6x9cUMA+z/BjrYzDi2sCmlONe4LTAqzVZ+xMZVJ2
         1oYfCXE0FO5+pDTuw75tq0GCjBEJrWOHLSVGByKkRCPS+l/WptUY7zSC1YOKiPulj47o
         PHQGXBgYemfeniroVLlrEfoR+mMW7gwi5aQyBX5M3dxC3lxAXQObkytqjP8/FcmwcLLM
         LIW1yUm9ODLENOUa7xmMqYQkCP+6xyJGaqp9KqRNlUeNzHYBwjeu+L16nh825ndLDrRs
         TfUw82rrrq2AanRLMsMBMHnhni7GiyKzzIURBMqbmd8Gc15f+B3/c3ounVuhB7hgeaOV
         wCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710270770; x=1710875570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRLuvuRLRD2eLcvzdQSEvSRDyYr5UyjvEaAEWSq4BXk=;
        b=mdiEkGYw/wjAIgRtYLQqgCkkRa7VylCJa404u18ekzycuOkzAy6HrlsONKTiW8qIK2
         8yGFfeOWoKv6l82iIF4m6pYTWsEPdvrHjXvtBGhvIr0yTpnRS5rRkSVkdYXUuitANIUp
         TO9thsbh7f+Z+kVqnkdKjYaTxFuummOEtR+1DiF1sS4Tv+8rNMRRnth2FIUBzEuOZ7ko
         vBcYrHKvXTkRTQxN9sJ6UtW0FYcQHgpT2jxPeh8OAIEzWO3GUPmAktiZj9FCcmFBy6dA
         1U7KM96SuN7kh1veh7ESybbr1FhNV48S1tM8HB/gA87x3g5R/Q07KQmuljgKVnwLNkcf
         xg1g==
X-Gm-Message-State: AOJu0YxxQPl8q6AMbz/iI3PG4VKYRCQ8YlbOmCVGvNK6T2p3bYp8GNAS
	bHqOrlQk14Qx7co28TVVCIrfnVydlZWvUtnSDe8iP8y7pF1/deClA+ZlKx0/
X-Google-Smtp-Source: AGHT+IEss7N2gsJ5Yf7mUE0aVs8HBFGYGCtzP6oSSLkM3qaS7UzNzEyp2vMuFNKHR/OehZl05brXwQ==
X-Received: by 2002:a0d:f082:0:b0:60a:1d7d:c0de with SMTP id z124-20020a0df082000000b0060a1d7dc0demr378769ywe.16.1710270770042;
        Tue, 12 Mar 2024 12:12:50 -0700 (PDT)
Received: from localhost.localdomain ([64.234.79.138])
        by smtp.gmail.com with ESMTPSA id d73-20020a814f4c000000b0060a03c196cdsm2023051ywb.63.2024.03.12.12.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:12:49 -0700 (PDT)
From: Kendra Moore <kendra.j.moore3443@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Kendra Moore <kendra.j.moore3443@gmail.com>
Subject: [PATCH] doc: Fix typo in admin-guide/cifs/introduction.rst
Date: Tue, 12 Mar 2024 04:47:53 -0400
Message-Id: <20240312084753.27122-1-kendra.j.moore3443@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch corrects a spelling error specifically
the word "supports" was misspelled "suppors".

No functional changes are made by this patch; it
only improves the accuracy and readability of the
documentation.

Signed-off-by: Kendra Moore <kendra.j.moore3443@gmail.com>
---
 Documentation/admin-guide/cifs/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cifs/introduction.rst b/Documentation/admin-guide/cifs/introduction.rst
index 53ea62906aa5..ffc6e2564dd5 100644
--- a/Documentation/admin-guide/cifs/introduction.rst
+++ b/Documentation/admin-guide/cifs/introduction.rst
@@ -28,7 +28,7 @@ Introduction
   high performance safe distributed caching (leases/oplocks), optional packet
   signing, large files, Unicode support and other internationalization
   improvements. Since both Samba server and this filesystem client support the
-  CIFS Unix extensions, and the Linux client also suppors SMB3 POSIX extensions,
+  CIFS Unix extensions, and the Linux client also supports SMB3 POSIX extensions,
   the combination can provide a reasonable alternative to other network and
   cluster file systems for fileserving in some Linux to Linux environments,
   not just in Linux to Windows (or Linux to Mac) environments.
-- 
2.34.1

