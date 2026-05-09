Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F43937CD52
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778359103; cv=none; b=h61fusAOWT3CHf4SiDygOAfV/Pwdt9KqyDViHm72bvjqeSDSvlivEwvpLVe+umWVuzwbtRRqat0r2sq9LEtSVBNSUOX+BbTazF0JP34BnE9P51cY+b4gu19J8mBYfZtR6iJmwNOfZ1LrreSMNunTg+zpEKCv4SFnR7dRWH9dYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778359103; c=relaxed/simple;
	bh=ccdSo84sr8qu78iNEyB1pzjAiCl5ax6ZU8nj5CEUIqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blfhel94ffHnZFlysnWfrH5Ejb2XYHCRl2E57478djpDd3bCqTpB4MK6iMMsr8MWx3BvJNvrlZmY9AZS0H79h7dk20vOIPp+mSt19NkF9SWXYoO6YVsBcle6/PQrq2EMj9ju4hwJp8hqItW33edj0W+jMm7JMyp3F3pwEM1Q8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFVFEE5h; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFVFEE5h"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48d102471a4so30343065e9.2
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 13:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778359099; x=1778963899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3qgUsX5Ynu3eBdzTZe+QC4Hx6s+MWvYIyWZO/VZNAs=;
        b=cFVFEE5hfYHoNZbFelhmINa398R5624VIFM6bGXhnGk+J6uBIU8knOuhNViN9SmF5/
         OAEUjnYEUzPs1jlOKLOabuIa5nSthGaV5cB+UIMnEBjy12+xGS8Q0O6qxK7c/fcRB0lT
         4pC2jQ28Jq/Kbqsrw3bcQKMmEM9+JjnwFl2YvMz+j/CjlEx8OlJvl+5dU20QnTP3a+XB
         FpkpktFNumOxZ3vBw3r6eEvWL4V8LzpHsHdsCPce2wuKMfhuxIAa+j5zMFm51RT6QzQK
         i2b+KA73aPjUEgLJ1cdawIMDtvJ4H7hLtJWgxN5tHKJKCcYiGU8bwHI19MsRvZGhKsep
         Gksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778359099; x=1778963899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3qgUsX5Ynu3eBdzTZe+QC4Hx6s+MWvYIyWZO/VZNAs=;
        b=VaV4/mpPVGdWySqHHE+0hgs0+8KMfBz77cyHKU4e2IuR4U6VzpdyLYN0HJxTYTg5SH
         JGZLrjZ2odOQtegeQ97+kcB3eZyClxSfFy0kEQ/c/6CmWGHoGy5ANh61ZbQqmNRouAkE
         WhldyQMUjOyhEbrXzd+x6ahhftkAOY+OWHv2+E7uZ4ylH4mfH7ECOrGs9YYXw631Pz41
         gMUZn7gmgznhm+IvOiGcVCpuPyS+X8qTfbLVCkJ9IemD6t27oRTisFEuMTqo3pNGl3ZK
         MkdUCgTzD4OTFK538UfGFZDOfG2ReECFUJIYhOooEEmVWs894397MbIJnoPYvPQhepW4
         gQpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OD1j1mgowjNrNha88cYdvfdstqwF1WOGih3hUSl0Qo5UltHqV/e6AAF2IlhVvhvkUV59CBwNzGXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwwX+8VnibBIbePb1QUAEsWsFUrJNF6BiLgjzfo0B0LUMZQbXL
	N7PNTwpz5LU3MqTqT2y37r8NuxSHm5dVwO0ynK1iLUFRmzvcgSula5J6
X-Gm-Gg: Acq92OENaw4HcsK59RF/TLXxSbuBOLkK5rprXjXfPKoAdsSGPcN0SbnFL1fcEQ3eJp6
	Tfe0p47LrDDz+JyERAKJFFjYvykwhIqWaZnRl35LoKvet3fYXiBlF0qTtIs2rODORrkmHztM20/
	MckwK8LYKfrVBzIoUVoEd8OjySiqeLbGTjFA5mwcWngf4OEvUhnHJQlnZhe8WnETdQo+L9xd2ft
	NS43+oB5Nvc5aCvuMK13FH6exluYnV4aYapsJn3o0TykaD6NDp8SOPVkdju8x8+CVoQVOFViIK8
	OjnSpNdBbbvKESL0DqNOM3uzYGBMUmYNRExLImL7jkugnZvGJLyLVO70NarT0gAw1LDs6nh97WY
	44K+BPksUI9nLKTApsFbZJr/XErNreE44Ef34tBusZ73xS7F8hXzNjavRyOKgccxSoCnN/DCpHw
	ugMP9uQ1+0vQNj7TlOG/mPubf+eHbNGvNm43+nEBbOaOMDhIcOWLJk9Fo=
X-Received: by 2002:a05:600d:b:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48e6748a661mr106742005e9.3.1778359098604;
        Sat, 09 May 2026 13:38:18 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db0b95asm39394605e9.9.2026.05.09.13.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 13:38:18 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: jani.nikula@linux.intel.com,
	akpm@linux-foundation.org,
	gary@garyguo.net,
	ljs@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH v2 2/2] Documentation: dev-tools: add kconfirm
Date: Sat,  9 May 2026 21:38:08 +0100
Message-ID: <20260509203808.1142311-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260509203808.1142311-1-julianbraha@gmail.com>
References: <20260509203808.1142311-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usage documentation and a brief description for kconfirm to
Documentation/dev-tools/

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kconfirm.rst | 196 +++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 Documentation/dev-tools/kconfirm.rst

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 59cbb77b33ff..130ebc0d7282 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -40,3 +40,4 @@ Documentation/process/debugging/index.rst
    autofdo
    propeller
    container
+   kconfirm
diff --git a/Documentation/dev-tools/kconfirm.rst b/Documentation/dev-tools/kconfirm.rst
new file mode 100644
index 000000000000..f57bd40508d4
--- /dev/null
+++ b/Documentation/dev-tools/kconfirm.rst
@@ -0,0 +1,196 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+========
+kconfirm
+========
+
+kconfirm is a static analysis tool for the kernel's Kconfig system.  It
+checks the entire tree-wide Kconfig, and reports misusage like
+dead code.  In the case of dead default statements, these can be a code
+smell.
+
+kconfirm has some additional, optional checks. The first is for dead links
+in the Kconfig help texts.  Since this has a high potential for false
+positives (due to websites blocking bots) and slows down runtime
+significantly, it is disabled by default.
+
+Another optional check is for config options that select visible config
+options.  Examples of how to enable the optional checks are included
+below.
+
+kconfirm is written in Rust and lives in ``scripts/kconfirm``.  Other
+than the dead link checks, kconfirm aims for zero false positives.
+
+Alarms are deduplicated across all affected architectures; kconfirm
+displays a tag with the corresponding Kconfig architecture config option
+names. For example, ``[RISCV]`` indicates that an alarm is specific to
+RISC-V, while ``[ARM, X86]`` indicates that an alarm affects both arm and
+x86.
+
+**NOTE**: kconfirm does not modify or compile the source tree; it is
+strictly a static checker.
+
+
+Getting Started
+===============
+
+
+kconfirm's Minimum Supported Rust Version (MSRV) is v1.85.0, because
+it uses Rust edition 2024, and this is the earliest supported version.
+
+kconfirm also requires the Cargo package manager and an internet
+connection for compilation of its dependencies.
+
+If Cargo is available, kconfirm can be built and run from the top of the
+kernel source tree::
+
+  make kconfirm
+
+The compiled ``kconfirm-linux`` binary will be available in
+``scripts/kconfirm/target/release/``.
+
+The default checks currently cover dead code analysis, as well as invalid
+(reverse) ranges and constant conditions.  ``select_visible`` and
+``dead_links`` must be turned on explicitly with ``--enable``; conversely,
+any default check can be turned off with ``--disable``.  Both options
+accept either a comma-separated list or repeated flags, so the following
+two invocations are equivalent::
+
+  kconfirm-linux --linux-path . --enable select_visible,dead_link
+  kconfirm-linux --linux-path . --enable select_visible --enable dead_link
+
+
+
+Options
+=======
+
+**NOTE**: kconfirm's arguments must be provided in the ``KCONFIRM_ARGS``
+environment variable if running with ``make``. See `Examples`_.
+
+Available options:
+
+``--linux-path PATH``
+  The path to the linux source tree to analyze. ``make`` uses this
+  option to pass the current linux tree, but this option can be used
+  when running the tool directly with another source tree.
+  See `Examples`_.
+
+``--enable CHECK[,CHECK...]``
+
+  Enable one or more checks in addition to the default set.  May be
+  given multiple times, or as a single comma-separated list.  See
+  `Available checks`_ below for valid names.
+
+``--disable CHECK[,CHECK...]``
+
+  Disable one or more checks from the default set.  May be given
+  multiple times, or as a single comma-separated list.
+
+``-h, --help``
+
+  Show the help message and exit.
+
+``-V, --version``
+
+  Show version information and exit.
+
+
+Available checks
+================
+
+Each check has a string name that is accepted by ``--enable`` and
+``--disable``.  Checks marked *(default)* are enabled unless turned off
+explicitly.
+
+``duplicate_dependency`` *(default)*
+
+  Reports duplicated ``depends on`` entries on a single Kconfig symbol.
+
+``duplicate_range`` *(default)*
+
+  Reports duplicated ``range`` entries on a single Kconfig symbol.
+
+``dead_range`` *(default)*
+
+  Reports ``range`` entries that will never be evaluated, due to an
+  unconditional range entry.
+
+``duplicate_select`` *(default)*
+
+  Reports duplicated ``select`` entries on a single Kconfig symbol.
+
+``dead_select`` *(default)*
+
+  Reports dead ``select`` entries that will never be evaluated, due to an
+  unconditional select entry of the same config option.
+
+``duplicate_imply`` *(default)*
+
+  Reports duplicated ``imply`` entries on a single Kconfig symbol.
+
+``dead_imply`` *(default)*
+
+  Reports dead ``imply`` entries that will never be evaluated, due to an
+  unconditional imply entry for the same config option.
+
+``duplicate_default`` *(default)*
+
+  Reports duplicated ``default`` entries on a single Kconfig symbol.
+
+``dead_default`` *(default)*
+
+  Reports ``default`` entries that can never be selected, for example
+  because their condition is unsatisfiable.
+
+``constant_condition`` *(default)*
+
+  Reports conditions for any entries that always evaluate to ``true``.
+
+``failed_parse`` *(default)*
+
+  Reports a parsing failure of the Kconfig.
+
+``select_visible``
+
+  Reports configuration options that ``select`` a config option that is
+  visible to users.
+
+``dead_link``
+
+  Reports broken URLs found in Kconfig help text.  Because this
+  performs network requests it can be quite slow, and is disabled by
+  default. May also have false positives.
+
+``UngroupedAttribute``
+
+  Reports ungrouped entries, like ``select`` and ``depends on``.
+  This is a style check, and is disabled by default.
+
+``DuplicateDefaultValue``
+
+  Reports duplicate default values that have different conditions.
+  Suggests combining the conditions using a logical-or ``||``.
+  This is a style check, and is disabled by default.
+
+
+Examples
+========
+
+Compile (as needed) and run on the current tree::
+
+  make kconfirm
+
+To additionally enable the dead link and select-visible checks::
+
+  make kconfirm KCONFIRM_ARGS="--enable=dead_link,select_visible"
+
+To disable a check (here, ``duplicate_dependency``) while keeping the
+rest of the default set::
+
+  make kconfirm KCONFIRM_ARGS="--disable duplicate_dependency"
+
+To run the default checks against a kernel tree separate from the
+current directory, such as ``~/repos/linux``::
+
+  scripts/kconfirm/target/release/kconfirm-linux --linux-path ~/repos/linux
-- 
2.53.0

