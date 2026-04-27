Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C342337AA88
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311880; cv=none; b=qzfBLYbqTkLwK7NJZXTI7LlRJgoXH9MLLf6fOf+Lrb1xJ26NN61/e5TdE4OZB+W37e0/FBj/f5NJfOIjS2sDFWo/O+axeggEVFKTikXqLcAS+M932pBp4vXGGqJ/w6PeZa1ZVAEuuxdARI332lgUqCA0LDnYPoNK6yU/jCwIVeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311880; c=relaxed/simple;
	bh=rO7ov8QJ49GcC76RgXU3j5+kIEi3gk/U+tPwA6Wotq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ULa2VWAPuMuYlHZ5e8Ei2VSe0ZAHlCotalA2U+NYv+Hys8Bq2TYdvP4LymLl2DbDnb5WIMhKQrRivnrs4Yhil6JQLg0/VTt5oH2ImVKIXhk/1LZlWkpgP2VbReFMd7OGISp5rEYrTUpWgTvPbAPL0Fi/sLXLIgCMYh/tOik0xNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlhgejSs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlhgejSs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so90139625e9.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311877; x=1777916677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VZVV57UMcCjFBLQCgq7jxMDbx4nGuPsSLCjatqjWVko=;
        b=rlhgejSsCrl6yGhFshhHoTT5TtxgWULJyuN/T4iGh03znzcY2X06lVbRcJlRUYVjeP
         HU9EaO10U9f+9RlnRuJw+XtVjgLd/JpmiGc+ZlchqwGvDx3Mp+uKCXTxq5XBq1fc1LhH
         OzUjzd8h4N/15eGOVy9Yapv+YnX9OwNpbr71XeJ3Iwn2UJHt41pB7mshtOCN4NlUNZEK
         5kDdzsaR5pydNimmMCZyPULNLV+q1yMuiRjEHL3YSWQo8lujUgp6UYyubKZBByYp1xAN
         7IQR+Mh8j6efYF8LPRbUD3VyLiNA3JrkWoQv25GPxbYjF+rv+6WlKu+vR5IlqmKclOjm
         TBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311877; x=1777916677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZVV57UMcCjFBLQCgq7jxMDbx4nGuPsSLCjatqjWVko=;
        b=LORbbK1J1Lix2mG/jIEaARNZ4iMqCOntZywY/lDmsHt5Uvky5GD7NnOumQDFZbtx62
         Zaz4DQ3tc9rEM1e9Idr5+qLUN5BnCI5q7g3jclRmAqvQ7WGdEGWQdLXl3iC9kYef+7b5
         5OIcxjSQvNyFP6o244NhCoQIrhb4nUMNjxMHz9LwAeHDPyDjBPKRL00KBPCBsRoOcWkm
         trNURfMww4qaccodZZwfTIDbBIUjlrYOqfaQ1rvbL0lyxiBCVJ7zHRoozKSVq14jpOre
         yujZjhPUkdIhXT+JrCIupFHVDGlYthXm1wu/t9ihlHSAgv6xUFY8tew+1q5ORUKQdGnV
         3+sw==
X-Forwarded-Encrypted: i=1; AFNElJ/UuTyGy8l4S8E+LqRAn3Ds/cG7letyT8m6uen9yxKKCGDFOOKvKRNec7NUPLzFhtCwKr81hlbIOSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP6/1dI4/yzB4f35Ea4BsN81TZju7gX3K7QRx3pkuQPiGmE3US
	dbBuumy3/p1N5/m72g6u67LwqasAieoDcc+dbyneVJ+FoqIBHvx1o0dF
X-Gm-Gg: AeBDieue5myWcKBNMKIl4kE9HfaMSKx9bXYk7Zj70F/hZox6pr0S9SJUTOVmTsUcMNc
	ZyLkoU4/WEGGPa3Fz2/Z5uxENrMBbhtoYKHx2DmTSYiP5cJAVjGTh3PrLMEKet1Sr2wqSf9E8ms
	n/hAaslM2V5EWLym0xO3hzrHLS1iCgeUmkPPNuxbBjUq2VbfWkw/IeJQ5tu6jLvzWolq/3VXe9x
	F3N87FtgpAOwfdjB/zvfQUp5SUw7rFFKBXkuzlc1/gyz4H3w2xldtE93LegihsKzp8V9RkZ66Us
	ibrIRLHc5ncY8O+f3+7PyqpKy5lTuEY8WtemaI93wL8c3hbmY9pvAKOzHbS9nvEfHnEqmBc6WbC
	Q6NmP9lfAhnE9O4kqjwJJhwV0XJ0YccCMFZbYKX02irZCYBZdYe4rxETGDS852mnkLAc8QxXhml
	mvaGmqVvPG5oSBCy5CKz2a7zA5ZqpRV0i3rYnS3ZE9A2VovzSebYH/2wIc/OJucrWRF4MGtYoYL
	Mkz
X-Received: by 2002:a05:600c:4714:b0:488:ab37:b442 with SMTP id 5b1f17b1804b1-48a76f91ac6mr4075375e9.28.1777311877059;
        Mon, 27 Apr 2026 10:44:37 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774b6300sm478485e9.16.2026.04.27.10.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:44:36 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: akpm@linux-foundation.org,
	ljs@kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH 0/2] scripts: add kconfirm
Date: Mon, 27 Apr 2026 18:44:27 +0100
Message-ID: <20260427174429.779474-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Following this discussion:
https://lore.kernel.org/all/20260405122749.4990dcb538d457769a3276e0@linux-foundation.org/
in which Andrew brought up the possibility of moving kconfirm in-tree,
I've prepared this RFC to do so. See also kconfirm's introduction to the
mailing list:
https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/

kconfirm currently detects dead code (defaults, dependencies, selects, and
ranges), and includes an optional check for dead links in the help texts.

False Alarms:
kconfirm aims for zero false-positives, which is currently true for dead
code detection (as far as I'm aware - but there are hundreds to go 
through); this is not really possible for dead link checks, as this
depends on an internet connection, and we do not attempt to bypass bot
blocks. For this reason, dead link checking is disabled by default, but
I've provided an example of how to enable it. Additionally, you can view
my previous message to the mailing list with hand-verified dead links
here:
https://lore.kernel.org/all/6732bf08-41ee-40c4-83b2-4ae8bc0da7cf@gmail.com/

Current State of Alarms:
The last time I checked linux-next (next-20260427), there were 579
instances of dead code, and 81 unique dead links. The most critical check
is the dead default statements, which has surfaced a few misconfiguration
bugs (fortunately, just for kunit tests), see examples:
https://lore.kernel.org/all/20260323124118.1414913-1-julianbraha@gmail.com/
and:
https://lore.kernel.org/all/20260323123536.1413732-1-julianbraha@gmail.com/

But hopefully kconfirm can ease maintenance and we can prevent more of
these from making it into the tree in the future.

Use it:
You can test out kconfirm with this patch series by compiling and running
kconfirm like this:

`make kconfirm`

You can enable dead link checks in the help texts by
passing KCONFIRM_ARGS="--enable dead_links", like this:

`KCONFIRM_ARGS="--enable dead_links" make kconfirm`

Note that it is not architecture-specific; it runs tree-wide.
If you run it on linux-next, you should find 579 instances of dead code.
Originally this number was even higher, but many patches have since been
applied to linux-next, and included in linux 7.1-rc1. Thank you to the
maintainers and reviewers for their feedback and patience :)

You will need Rust with Cargo and an internet connection to download the
dependencies for compilation. Originally, I planned to vendor the
dependencies and submit the entirety of the code here, in-tree, but the
dependencies (and their dependencies...) are too large (somehow, a
whopping 264MB!), so instead I am proposing to add just the tool's own
code.

I've included the Rust for Linux team to discuss the build system changes,
as I'd like know if there is a better way to integrate this with `make`,
and if there's a better solution as far as the dependencies and Cargo go.

Thanks,
Julian Braha

Julian Braha (2):
  scripts: add kconfirm
  Documentation: dev-tools: add kconfirm

 Documentation/dev-tools/index.rst             |    1 +
 Documentation/dev-tools/kconfirm.rst          |  147 ++
 Makefile                                      |   12 +-
 scripts/Makefile                              |    2 +-
 scripts/kconfirm/Cargo.lock                   | 1710 +++++++++++++++++
 scripts/kconfirm/Cargo.toml                   |   21 +
 scripts/kconfirm/Makefile                     |   28 +
 scripts/kconfirm/kconfirm-lib/Cargo.toml      |   16 +
 scripts/kconfirm/kconfirm-lib/src/analyze.rs  |  593 ++++++
 scripts/kconfirm/kconfirm-lib/src/checks.rs   |  257 +++
 .../kconfirm/kconfirm-lib/src/dead_links.rs   |   63 +
 scripts/kconfirm/kconfirm-lib/src/lib.rs      |   55 +
 scripts/kconfirm/kconfirm-lib/src/output.rs   |   52 +
 .../kconfirm/kconfirm-lib/src/symbol_table.rs |  209 ++
 scripts/kconfirm/kconfirm-linux/Cargo.toml    |   14 +
 scripts/kconfirm/kconfirm-linux/src/lib.rs    |  129 ++
 scripts/kconfirm/kconfirm-linux/src/main.rs   |   74 +
 17 files changed, 3379 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/dev-tools/kconfirm.rst
 create mode 100644 scripts/kconfirm/Cargo.lock
 create mode 100644 scripts/kconfirm/Cargo.toml
 create mode 100644 scripts/kconfirm/Makefile
 create mode 100644 scripts/kconfirm/kconfirm-lib/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/analyze.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/checks.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/dead_links.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/output.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/main.rs

-- 
2.53.0

