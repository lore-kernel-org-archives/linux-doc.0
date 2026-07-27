Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D0C1DD0EF
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 00:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111401; cv=none; b=Zj4OZzHAv9Z0Ltzvd2UMhP+ioDvVyWuQjmWUO3R+/9lWb6XHjPNhQa3RCiy/jg44qDNNMjWn8Ko3a73wBxWVMnJH1FiwNnzECZawTcY7h7zSHuigSaswqdySGajpaPjlVl9ysHSjcio1Nj7GQWlntQDZtc07C/PsJBsotc+jNec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111401; c=relaxed/simple;
	bh=mPYKxLawYTF8HSasCpnt+nClA0qSbdehEBnCbizigV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMN3YwrxLz9+EtwX3d8UaMw4L/mcwnNm25xV1tTZsa2V47VOkZ/gVNY0I8Yv2jLA9ahtCSTlU/Q8Sb0x3TH9xmAuRdgxFokPUesR/hyf8n9TsUjDIW2KPAmMIDPkAJbvrIeK65U14UZuT3s/0uy2KZ05VXysAMPehveYte5vXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqokETad; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqokETad"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so22770855e9.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 17:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111398; x=1785716198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PF7yOTCO8cyhQPZ9+iu5bcy6EKeJnZbLGZt0DtiR6BI=;
        b=nqokETadg5fLYZDVYxGtMOLGNkbzKVFDrEk6RB1FKdlu3GuXcmFsv6TeCwAF9Shhw3
         x2/VwcXm32D+dYxv22U/3ssOUrfLkZRhH3BS12pXLvjau41nuPtKsIfDEFCCtjN8pJD0
         06RZv+2is0j8LSpm33PW02WtplaKKIoGa1glCnL6l3nHo0aVXR/yp1vwXaJeLN7ftzG3
         DrieS/sk4P5yu+vsczjex47qZJX1OQ/ib5T3C2q4LXanvZN4E2UGcIcexesGRvMcINom
         ciU2nPA9K/Pr4QGaBr2rdFgdc1oKrqx2DkIo9NqREP+M4KTCSkcod5Vr7T0hCNW+pFM3
         cuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111398; x=1785716198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PF7yOTCO8cyhQPZ9+iu5bcy6EKeJnZbLGZt0DtiR6BI=;
        b=A1J5mVArmmPyR08SimI2bNoGIfjveAWUJcRWw9VW++ZlaQYBsIJrmZatox5dt7yoLR
         7XCc2RVNP/WiL6BWAKeQnP5D3TgXxwhLx76jKOAxZrvbolCZULyqJGDQ0931FuokvwpZ
         gHeTReijOQtXvI11Gz3bgQq/LQ9u98zWy5giM2F+8H/sKlEeE+noraWgQD2XIdCHwQBC
         dORx6v/Q59g1WvcSwFXKkNQ9FEdXWRxZOqHb6jVwlC+uAkX3D7Y+HMLaB9fMwjNqYDQI
         LXQXzTdLcGp4uPz+LH4PwtKEmOnrNpc4JyuHIBNnfSbER2Ag47gyY7t6mwC6zxtWH2HE
         +Ofw==
X-Forwarded-Encrypted: i=1; AHgh+Rpzyh8TjQ40rS+IfS8qSrQqt/D9JOj3JjKn2Qy5SfLubzTlewDNsq33Ky9VTTLNJhIbYnmcnlHgpl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVQxOzYKug6NII7FD5cn3HcgbnaVx1PWqIwvSWHKnwqvOc1v6i
	VTNS0psDRQK+p0dfLgGVNwsl1pMk7oqA3Gb4qToesCKw6tIwmUtoaQOc
X-Gm-Gg: AR+sD11ZI/w7vRnQ9MWZa9FlQlEJ1wsVM6nVGAUsYej1NcKGHk49ErMXaRqw1RO3vk/
	wI1hJe4VF8oVCXszdiSTYKmHsRrbCCBQLQLJBNwzPVx3KQ4OcJyIFxeFJMjU7Jl+FEO/yf/ZBlO
	8PRJ8LnyLGk2k5uWAGU0/CJsjdb+DYob5Y5h6l84A+Der4bOJNkRnwiJILN44B3TCisnCezoTYi
	fFr+IOJrn+lOHEec0z09dMQNVN7Qr1RreicQlneLWa8o5YnYOB7k1f/grezldUpq/UGHgLrI+Wz
	nr/ZiOCy7HHrppjdtdc8/eG/1RCEBzJ6IaNP30NLX19c7BrLcrdGzZ3ua63gOVSWevEGpxC3KMN
	UiZPtJV4i7I530M0ok9SKqYZgKHg61d9bm+270lAmfEcjNCn9lxWds12jb0mlFEBJiyTnosrmUP
	6nen66Vb0c6ZChqX28Lqrd3PuK2PtwXlNlL8w82quPlDVnWum30CFr2M5PatCZ0Hga+jnSil8nI
	lJd
X-Received: by 2002:a05:600c:c8f:b0:493:e983:806e with SMTP id 5b1f17b1804b1-496b56e6df4mr76757955e9.3.1785111397588;
        Sun, 26 Jul 2026 17:16:37 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485f65csm176403555e9.5.2026.07.26.17.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:16:37 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	akpm@linux-foundation.org,
	jani.nikula@linux.intel.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ljs@kernel.org,
	andrew.jones@linux.dev,
	masahiroy@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 4/5] Documentation: add kconfirm
Date: Mon, 27 Jul 2026 01:16:22 +0100
Message-ID: <20260727001623.2794156-5-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727001623.2794156-1-julianbraha@gmail.com>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usage documentation and a brief description of kconfirm to
Documentation/dev-tools/

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kconfirm.rst | 229 +++++++++++++++++++++++++++
 2 files changed, 230 insertions(+)
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
index 000000000000..64ab9d1c3057
--- /dev/null
+++ b/Documentation/dev-tools/kconfirm.rst
@@ -0,0 +1,229 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+========
+kconfirm
+========
+
+kconfirm is a static analysis tool for the kernel's Kconfig.  It checks
+the entire tree-wide Kconfig, and reports misusage like dead code.  In the
+case of dead default statements, these can be a code smell.
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
+kconfirm is written in Rust and lives in ``scripts/kconfig/kconfirm``.  Other
+than the dead link checks, kconfirm aims for zero false positives, though some
+will necessarily happen for config options that use macros referencing the host
+environment.  These are common for host compiler-related options.
+
+kconfirm checks one architecture per run.  When run with ``make kconfirm``, it
+checks the same architecture as the kernel build.  That is, it reads the
+``ARCH`` environment variable, similarly to the build system.  Findings include
+the source architecture Kconfig option as a tag; for example, ``[RISCV]``
+indicates a finding from a tree that sourced ``arch/riscv/Kconfig``.
+
+**NOTE**: kconfirm does not build the kernel; it is strictly a static checker.
+Also note that parsing Kconfig runs Kconfig's own ``$(shell,...)`` and
+``$(success,...)`` feature probes, just as ``make menuconfig`` does, so some
+scripts under ``scripts/`` are executed and your compiler is queried along the
+way.
+
+
+Getting Started
+===============
+
+
+Beyond the usual kernel build environment, kconfirm needs the Rust toolchain:
+``rustc`` and ``bindgen`` (which in turn uses libclang). See also
+Documentation/rust/quick-start.rst for how to install and set it up, and
+Documentation/process/changes.rst for the minimum versions.  kconfirm's
+Minimum Supported Rust Version follows the kernel's host-Rust toolchain
+requirement.
+
+kconfirm is built directly by Kbuild with ``rustc`` and has no third-party
+Rust dependencies.  Bindgen generates the raw Rust bindings directly from the
+Kconfig parser's headers in ``scripts/kconfig``; the generated file is kept in
+the Kbuild output tree.  ``make kconfirm`` verifies that ``rustc`` and
+``bindgen`` are available and recent enough before building, and exits with
+guidance when they are not.
+
+The optional ``dead_link`` check verifies HTTP and HTTPS links and requires the
+``curl`` command at runtime.
+Attempting to enable ``dead_link`` without ``curl`` available in ``PATH`` exits
+with an error.  An internet connection is only required when this check is run.
+
+kconfirm can be built and run from the top of the kernel source tree::
+
+  make kconfirm
+
+The compiled binary will be available at
+``scripts/kconfig/kconfirm/kconfirm`` for an in-tree build, or under the
+corresponding ``scripts/kconfig/kconfirm`` directory in the Kbuild output
+tree when using ``O=``.
+
+Run the kconfirm tests with::
+
+  make kconfirmtest
+
+Run the tests with the kernel's Rust lint configuration with::
+
+  make CLIPPY=1 kconfirmtest
+
+The default checks currently cover dead code analysis, as well as invalid
+(reverse) ranges and constant conditions.  ``select_visible`` and
+``dead_link`` must be turned on explicitly with ``--enable-check``;
+conversely, any default check can be turned off with ``--disable-check``.  Both
+options accept either a comma-separated list or repeated flags, so the
+following two invocations are equivalent::
+
+  make ARCH=x86 kconfirm KCONFIRM_ARGS="--enable-check select_visible,dead_link"
+  make ARCH=x86 kconfirm KCONFIRM_ARGS="--enable-check select_visible --enable-check dead_link"
+
+
+Command-line options
+====================
+
+**NOTE**: kconfirm's arguments must be provided in the ``KCONFIRM_ARGS`` make
+variable. See `Examples`_.
+
+Every option below also has a single-letter form, and accepts its value
+either as the next argument or attached with ``=``, so
+``--enable-check dead_link``, ``--enable-check=dead_link`` and
+``-e dead_link`` are all equivalent.
+
+Available options:
+
+``-l, --linux-path PATH``
+
+  The path to the linux source tree to analyze.  Required.  ``make`` uses
+  this internal option to pass the current linux tree.
+
+``-e, --enable-check CHECK[,CHECK...]``
+
+  Enable one or more checks in addition to the default set.  May be
+  given multiple times, or as a single comma-separated list.  See
+  `Available checks`_ below for valid names.
+
+``-d, --disable-check CHECK[,CHECK...]``
+
+  Disable one or more checks from the default set.  May be given
+  multiple times, or as a single comma-separated list.
+
+``-k, --kconfig FILE``
+
+  The top-level Kconfig file to start from, relative to ``--linux-path``.
+  Defaults to ``Kconfig``.  ``make`` passes the same file that the other
+  Kconfig targets use, so ``KBUILD_KCONFIG`` is honoured.
+
+``-h, --help``
+
+  Show the help message and exit.
+
+
+Available checks
+================
+
+Each check has a string name that is accepted by ``--enable-check`` and
+``--disable-check``.  Checks marked *(default)* are enabled unless turned
+off explicitly.
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
+  Reports ``default`` entries that can never be selected because an earlier
+  unconditional default or a default with the same condition takes
+  precedence.
+
+``constant_condition`` *(default)*
+
+  Reports conditions on defaults, selects, implies, and ranges that always
+  evaluate to ``true`` or ``false`` because the condition, or its negation,
+  is already a dependency.
+
+``reverse_range`` *(default)*
+
+  Reports invalid ranges for int and hex configuration options.
+
+``select_visible``
+
+  Reports configuration options that ``select`` a config option that is
+  visible to users.
+
+``dead_link``
+
+  Reports broken HTTP and HTTPS URLs found in Kconfig help text.  Because this
+  performs network requests it can be quite slow, and is disabled by
+  default. May also have false positives.
+
+``duplicate_default_value``
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
+  make kconfirm KCONFIRM_ARGS="--enable-check=dead_link,select_visible"
+
+To disable a check (here, ``duplicate_dependency``) while keeping the
+rest of the default set::
+
+  make kconfirm KCONFIRM_ARGS="--disable-check duplicate_dependency"
+
+To check another architecture, such as RISC-V::
+
+  make ARCH=riscv kconfirm
+
+To run the default checks from a kernel tree separate from the current
+directory, such as ``~/repos/linux``::
+
+  make -C ~/repos/linux ARCH=x86 kconfirm
-- 
2.54.0

