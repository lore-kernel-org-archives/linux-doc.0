Received: from smtp-out1.aaront.org (smtp-out1.aaront.org [52.0.59.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA1830FC0D;
	Thu, 20 Nov 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.0.59.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634771; cv=none; b=cQ/2cbYErP3DqBiUBcd+iyy2LlHBc8bqJ1YnD2S1u41MQQls1bkzPAZ2q9DZKB8V3O7mDC94Jgh6vkXTkRq7nAZQN/S/uQ1//qrAAXZGLESQNkzt1aoaXHePFhNrWY/rxqiUgXDVHQmqgrYNqCOidBEsIBbiGHyXRorRyJVKxNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634771; c=relaxed/simple;
	bh=Fwlfi8rYxIwQm+nVBQKp7wwhTtWalTiEGbaZv0neBzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NewpnomDCzwWqzsZtR3zO6l0hx8089VK0if/2/k2v+exjvkG+5PzYHaaRC3WkVJBC0Fg9w0ZUDhZUS4clj6CeiKE5hPuY6dOFpm8kPhovXCjtsH23Fn4x4qmrDehqBCRpt+cz/AdVz0VbANz3gDyr0Y1nJhgGiLAv0fV5UjkrfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aaront.org; spf=pass smtp.mailfrom=aaront.org; dkim=permerror (0-bit key) header.d=aaront.org header.i=@aaront.org header.b=TRW0jeLS; dkim=pass (2048-bit key) header.d=aaront.org header.i=@aaront.org header.b=Tsl0SJCT; arc=none smtp.client-ip=52.0.59.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aaront.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aaront.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=aaront.org header.i=@aaront.org header.b="TRW0jeLS";
	dkim=pass (2048-bit key) header.d=aaront.org header.i=@aaront.org header.b="Tsl0SJCT"
Received: from smtp-send1.aaront.org (localhost [IPv6:::1])
	by smtp-out1.aaront.org (Postfix) with ESMTP id 4dBvfL5rsVzG0;
	Thu, 20 Nov 2025 10:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; d=aaront.org;
    h=from:to:cc:subject:date:message-id:mime-version
    :content-transfer-encoding; s=ckha5xz4; bh=Fwlfi8rYxIwQm+nVBQKp7
    wwhTtWalTiEGbaZv0neBzI=; b=TRW0jeLSQ0UZGJU8TAm0eSWWiqDmLRz0PgHIk
    TIxcEHQOrzaIBuF2C22ekmViRuVpJ20G+wo9gstAQxrEtNmCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aaront.org; h=
    from:to:cc:subject:date:message-id:mime-version
    :content-transfer-encoding; s=qvfkgsmx; bh=Fwlfi8rYxIwQm+nVBQKp7
    wwhTtWalTiEGbaZv0neBzI=; b=Tsl0SJCTB+y3UzF8YacRMLOlUWtuwr7Aa1qOX
    oV5fiic/BIVwnyvhkL8Zqba7IjDRQWIL7MzwbBbWZ1f5dgJE315ZZ6HKASYEovij
    JRSC3dTTqmU2UCh5pQtKqzmbPr9mH6kaRP4RZgI670XCqE32v4BHS8rRS7r6KBT9
    Z5BDkI2bYxhAJnGGhkeX8Mh/YAF37qbXHHX5S/9/y+rsKqBL/m0U07ty5z1u1fOK
    uztykpw64SjlorH6o/RmdqGreUdeS1pudoKlJ+uF/PqpOuvAve0ICIQL/f0q8XzH
    W13mt861PyRE0ayaXXlvVlyslVnk56/4aw7a4Y/6o+837PNmQ==
Received: by smtp-send1.aaront.org (Postfix) id 4dBvfK6zlNzFS;
	Thu, 20 Nov 2025 10:26:49 +0000 (UTC)
From: Aaron Thompson <dev@aaront.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aaron Thompson <dev@aaront.org>
Subject: [PATCH 0/2] debugfs: Remove broken no-mount mode
Date: Thu, 20 Nov 2025 10:26:31 +0000
Message-ID: <20251120102222.18371-1-dev@null.aaront.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch removes the debugfs no-mount mode because it hasn't worked as
intended for several years. When I noticed that it wasn't working, I first
started coding a fix, which is straightforward. But after looking into the
history, it seems pretty clear that this mode isn't being used, so I think it
makes more sense to remove it.

The code could be made a tiny bit simpler and more consistent if we change the
off mode error code from -EPERM to -ENOENT. That would make the off case and the
uninitialized case always the same. The documentation for the off mode
specifically says that the error code is -EPERM however, so I stuck with that
for now.

Thanks!

Aaron Thompson (2):
  debugfs: Remove redundant access mode checks
  debugfs: Remove broken no-mount mode

 .../admin-guide/kernel-parameters.txt         |  6 +---
 fs/debugfs/inode.c                            | 36 ++++++-------------
 fs/debugfs/internal.h                         | 13 -------
 lib/Kconfig.debug                             |  9 +----
 4 files changed, 13 insertions(+), 51 deletions(-)


base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
-- 
2.47.3

