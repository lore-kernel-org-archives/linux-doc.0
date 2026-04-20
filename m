Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D339EF1B
	for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776685566; cv=none; b=FQoszwzrlDzuWpw7xLpxlscGHQ62XUuvgCXvuSfDqhZfItHXnIH0IRC2udCamTUwHcfnYZIvqa1pQX/0MSaE8K0nN5T9650Gn5Fwq3EmLT04X5UkD1qMVc38XcFM+7U9YEHaTgQJrc5KhFZxFNan5I3ZVYl/TRW+YiYREUj44yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776685566; c=relaxed/simple;
	bh=e0AJAUNOmNDd6/YhHvW3gryjlpU5u5Opr7QfNUASCWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W7ujJSypBk+u797kql7Mt/XmAupnjf6mYcw+Y4erucQa1n24mfGboaf4IWAmbLdMWqqzjvlLtEQn03/9wGvrg/VPKK+dYaaJs1pxpzNOHq9WLCzvMawEed9H8NMmAN6WhQfuSiiZdsOtifEUUsK+X5oY7PdHR0mpdZ5XPgeZTSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8pZ1/um; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8pZ1/um"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so381918b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 04:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776685563; x=1777290363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QQ2J1q7j/KIwNXKtt8cG0N80aWhIRJXk717uRg6Vhg=;
        b=P8pZ1/umD/WldT+HMUn15g6iMXiLOUNWhP+2FA7mDoS207yeBRUqGairgx1Ot8ylqu
         /+k/3MnxT3kVjwX2cftuTkuwJcM5onuk3/7g04AykAFQggBhg27ftp8ytTZz7UKoczaU
         8OoGAehv0oRgu7sOetgfCgVobUcqrohSdOYH4S5HcAgUOXAEkKqa21WFJSL+BZtVSpNb
         OBRK28mX8dFyqsfigbWxnGynwnaJ9fR+yWnaTNTjcctpf64Flis+Ma0RPPJ5yqR7xpU9
         TFuu07SUnontNZeJ9VoNWBHrfAjVvrIkhqhyWmmZl+0rqrbekkR01/Y75aOIWm4Guy8X
         Ihiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685563; x=1777290363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QQ2J1q7j/KIwNXKtt8cG0N80aWhIRJXk717uRg6Vhg=;
        b=bZ1/D/GEjo1/5J1WZpIbu+mfECz1pMitgiInNsl6RRDNFLvEWWhvEqAj+K4VK+sp0t
         ZX7mcUt9g84RMJ34woV1GjCcORectj5JIjlHkMQPvHWzcrkuQGNP+bfQfkaf8khuo0WT
         qyYJV2C8s1iPdL/AqMQKlFMJkFwitSU8akUji6vNwxlq2ImGNSPmDq1J8v/WFMW9MMaT
         1Nge5cI+GM6wN+Hxn3gRO8rhah917P9TrXDqztHQ/K9vv9HaNpirHKrmbn6ejWZ1Y/vN
         S72pufwwIVN4tvBY+JZ/4W6hfO5afAdDQZdoU/SSh+Gs2YnzXHHcEjMy8rVJNcsUsX2G
         16XQ==
X-Gm-Message-State: AOJu0YwTN+ppEjfW1b9Cn8TpU8azG+E1dQYNi/iQPC0WYa/DPKPBm8oR
	CWHBt2sJfHWMzxsbh8TCrgHQ5+NKMGQWupGNazfKBJm19BR7PFXo8j1W
X-Gm-Gg: AeBDietdaxJK5pUflEo89KxVPN9g+rKdtGyiylO56bBUbIu88HOS5UmMcnijOtBr/zP
	hMLxOulvIRDw7Z6bJerFZtC6ik76A+qwJIMR1rhZuxC1W8ZngK6jJ3+zU3irGqW3uXERDevteT+
	/pbvH5HOs3BCNu0VEJZOQE7qmI+WwRxooVs4WXSl8zBEzIy7BDuSdy1mk7Dd1naGvc9/qg02RBY
	qVTl2A+h3f5EayWDwyD96Sp/Thsdc1HijlHAwet+CTojb0G1+qbkwl/eF68l6h2XuwqcAcE6VHd
	98dF5K7APUSv32fW2V2iXpNDhsdHjYj3fR/F4omNfZ/7Ts4+uXj2fLE93aaWEpIPGhvasm2W7MW
	nwS969V/swBdLeZmxRy9TUi7cYZy/bN2ghUQqZKu4Yn0FlHT3oYvyTKaPEjvNUNxApbYUCbx+LU
	2PYOKQOaiCIBLNvV8KqwznKEICt/na7JpS6qM/vw5A4Nxq5w==
X-Received: by 2002:a05:6a00:4b54:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-82f8c93d102mr13145150b3a.39.1776685562678;
        Mon, 20 Apr 2026 04:46:02 -0700 (PDT)
Received: from localhost ([220.247.131.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm11598567b3a.47.2026.04.20.04.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:46:02 -0700 (PDT)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] docs: maintainer-netdev: fix typo in "targeting"
Date: Mon, 20 Apr 2026 17:45:53 +0600
Message-ID: <20260420114554.1026-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake "targgeting" -> "targeting" in
maintainer-netdev.rst

No functional change.

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/maintainer-netdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index bda93b459a05..ec7b9aa2877f 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -528,7 +528,7 @@ The exact rules a driver must follow to acquire the ``Supported`` status:
    status will be withdrawn.
 
 5. Test failures due to bugs either in the driver or the test itself,
-   or lack of support for the feature the test is targgeting are
+   or lack of support for the feature the test is targeting are
    *not* a basis for losing the ``Supported`` status.
 
 netdev CI will maintain an official page of supported devices, listing their
-- 
2.43.0

