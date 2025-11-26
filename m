Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301A33CEB4
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183452; cv=none; b=K/o2IzhFDBCiQAdXiqKveOqE02hyOv+hSc93C7E8cDi9Q5LhXOWn17lZgMo8LhoLXegUVpHYKsFjg8D4/WIOdSeUU9zJmhEYPpiIN6Klp9rEnBczlJGQXqIOloFTNHdPiVdW6hgdPIr0OBntCYfwD4v4+qNW/kZnQWw2D9zUmNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183452; c=relaxed/simple;
	bh=iQ4pMQzhTUYQOQ+mIe2w98RI86DZXYJA2KVFyRZG6eg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=e5RXUgLhhE4AhK5q4pMInMfgeiZAvZInjElnpjWcDBhZYhKhqCPA9Wg9oeHAHY1ymwGDQDHcLjmnNC3pHYZzDqBHgdW/dvVO1nYtPkk65aQX0JgBsi5iRKhAGgptK/4/htC6qEhbUwU2XrV2GrPJqLKHpcIgrH900TuaOopxI6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WJnah4q9; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WJnah4q9"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78a8bed470bso1020767b3.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764183450; x=1764788250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j34XM1Q5wy58HoX5v/j1NaTpg1IoWQ2f+g885S4C7WI=;
        b=WJnah4q97HEYCMBc/xQMsLeczVmi4Atj9nt8YVPbjE9aMihMKq/FnFCAzAkOEGhmbe
         Wj5KkemhFgPEv0JCpNVqWAYlIAMO4UfjbYiCyUfpOvAoUICR6Os+KuGaC1JFg5ZbjL+I
         zDvWlvrvPc+X6za91x8gLvNzkhzSgvyckP7GD6+Uo5H6OfKaCs43z688vkxblxpnKlof
         /OxYPjzg4fvZunNN0GZcySN9Ik5xgbaWqLzb6YtW+eLN/k4CYemU5FtwXD1BYUtb3cjK
         bypl2CY6YPa6hIYPDA6IEOU7UY+y3P8gJXBCI+vA4HZB0LdERi/mMm6hfkEJnpQs1CSL
         2Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183450; x=1764788250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j34XM1Q5wy58HoX5v/j1NaTpg1IoWQ2f+g885S4C7WI=;
        b=ZuGw9SFmf83WqxzMCvh7mTwdFzkbkK3iwp6kpxQdRXxrNr1BMO/rfSE9FQ1NITUH5L
         ku6c16dkXQX/tbre3y3wd7QzSyu0pkWvdDPRnqmDlFA8yX6u9lndNruaFi/G6Rhu4O6a
         sPcZkmbhuht5MWstdF5lCuftgc/ZE3wn11XLS+VhQ6TjuBl/OKYC6VJTnkNBJlr10yIs
         83eOaAywtUTsYWdAw/fVib1UVpzoj+4nRCImV2Gh9ePtijWoez05Q80Xz4kwsHWL0pxA
         8r6jt0+d3A2sW5lEi5Z4tIU6yzsBT7B26aE5pfWNubT+J81tCZZ81O9krMJNWzodozKm
         CAUw==
X-Forwarded-Encrypted: i=1; AJvYcCUGlDHLl9R9iI00YKQsYCVsXhErKId8E4boBAcOk0RNQfnlS/Wpif5P1tcMljeGcz+L2T9dqbjPEU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkmOjk+12SbEQRnmqgA/stIjVn+3f8Fa1uMy4XiaOqeodiMW2
	ra2UdwUdtJXdDnmISZVMK0ukGs0brxXIiHet9jzSwf0r5bIl60mH2+1uBfVU8ldD930=
X-Gm-Gg: ASbGnctu/V2/Zdf1WaIAnVgZqsBvcs/QrJ4ndUR/kDbZ+FJ6eZXBPLRCWq7+yqv5pU5
	XAahPu4YikYNDx41K037RHpcTF4hjY3rgAowY1y/i865hqMkPppjIM2TA6UBaSL0yeYTv8C3xNO
	4tG5jYluw6CN/lOldYEvD3WQSA8oJqTdAdK5dFh7fEmYxvuRhsPzzhXcVgkqQugGq/iRrw30yjM
	SWCVdadMtR+jGyrrkOS2lfSiUlVp6c659xccFn0JfjPQUtfFb+NzCcudBsiGgqImuI5u1YhQt56
	OaX5pGQemtCSI6aS3Wyg8zGQC2Cv8+TkJ0Z4UkJP7z12JaANOJI0kWtQ7P4t0YrLKQ2+Cyry9kR
	8yzyxqIt5vZ5aow0LO/fIz9QNKUjtfWKYnKSPBQBt1SDGo/3jKF4YlBGAMDfHLjVbZgvNpV29Mi
	wzIISqDCKH7bhCpEOT+FwCy/4UG1SmVanWkmR2HrReEBeeysnBuwtLF7zpAVa63Zc2GDKjJVFb4
	D7NnOI=
X-Google-Smtp-Source: AGHT+IHPg0Ww2v/EZu5kM3VtzM1iXq1+nf46frOToa/LMYoPGqdBh3UuhDtfA4u5LJs+g1YpHvWl0w==
X-Received: by 2002:a05:690c:6506:b0:787:e3c1:8d with SMTP id 00721157ae682-78ab6efaafemr128031227b3.37.1764183449606;
        Wed, 26 Nov 2025 10:57:29 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-643259fd696sm2960753d50.7.2025.11.26.10.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:57:29 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: corbet@lwn.net,
	pasha.tatashin@soleen.com,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	tamird@gmail.com,
	raemoar63@gmail.com,
	ebiggers@kernel.org,
	diego.daniel.professional@gmail.com,
	rppt@kernel.org,
	pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	dmatlack@google.com,
	rientjes@google.com
Subject: [PATCH v1 0/3] list: add primitives for private list manipulations
Date: Wed, 26 Nov 2025 13:57:22 -0500
Message-ID: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently linux introduced the ability to mark structure members as
__private and access them via ACCESS_PRIVATE(). This mechanism ensures
that internal implementation details are only accessible by the owning
subsystem, enforcing better encapsulation.

However, struct list_head is frequently used as an internal linkage
mechanism within these private sections. The standard macros in
<linux/list.h> (such as list_entry and list_for_each_entry) do not
support ACCESS_PRIVATE() natively. Consequently, subsystems using
private lists are forced to implement ad-hoc workarounds, verbose
casting, or local iterator macros to avoid compiler warnings and access
violations.

This series introduces <linux/list_private.h>, which provides a set of
primitives identical in function to those in <linux/list.h>, but
designed specifically for cases where the embedded struct list_head is a
private member.

The series is structured as follows:
Core Implementation: Adds the list_private.h header with support for
entry retrieval and iteration (forward, reverse, safe, etc.).

Testing: Adds a KUnit test suite to verify that the macros compile
correctly and handle pointer offsets/qualifiers as expected.

Adoption: Updates the liveupdate subsystem to use the new generic API,
replacing its local luo_list_for_each_private implementation.

Pasha Tatashin (3):
  list: add primitives for private list manipulations
  list: add kunit test for private list primitives
  liveupdate: luo_file: Use private list

 Documentation/core-api/list.rst  |   9 ++
 include/linux/list_private.h     | 256 +++++++++++++++++++++++++++++++
 kernel/liveupdate/luo_file.c     |   7 +-
 kernel/liveupdate/luo_internal.h |   7 -
 lib/Kconfig.debug                |  14 ++
 lib/tests/Makefile               |   1 +
 lib/tests/list-private-test.c    |  76 +++++++++
 7 files changed, 360 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/list_private.h
 create mode 100644 lib/tests/list-private-test.c


base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
-- 
2.52.0.487.g5c8c507ade-goog

