Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9012E1C7C
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355926; cv=none; b=Q9/hi9gkXzhroGkW+T2kOs/eSugSjN2jH9RU3NoA+ftkX+2neQvLJ+1hjvixf9aas1xYSRk7wPDNL1AGYBkof3JUtSaA9XFbuYnJ2MVvKo5zF8PWXFiypS//Wc8u4e3DQZXxccbY7G7AVKqkloaCmBs89dTY+WoG9A04Cz3x8gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355926; c=relaxed/simple;
	bh=aPKvrimU3xatybfkmmEJGCuwfRE75IK26HvPJc9sxM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bSEXV6OIp1zeKaYe8KHzmTxOI72vIN/GI1TjO6TzbmCUKxPQ/rlgcC2LDwm+p7BJd2KsU+CjvBmF8zbvxxc5wcGI5jbgifObGwOLZaBTeCv1jr1b91cIkBfgzhALMGNRZsanoqLPBRPbFmNhmFTejsd5FAKv/f/+Vme/GoBQ34w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvgLnpFF; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvgLnpFF"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45391956bfcso6109416b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355924; x=1768960724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=teYKKbLkZbUHHb5EH1qkAwDiVubshmdqathiyRgte04=;
        b=BvgLnpFFxhosxNZ6BF0Q1Q7SKLxkOrZ0l0zAxBovlfeFvTR7CWpXgZTLdxMwpKeyj4
         klOs0eSD1/AOREsp37AGaI7CXSnZTFtTaQh75FzAUWKM71+ysRzRr8sgzCceirbvS8Cg
         DZXKm+zYYCDB+m78PS4QMKcUhDUmrT9mG81K3CqHotvjhMm0Poa3DFfjjS59lPmIYqqc
         I4Q8/7B0wIHkJWrblGzEYNTiQm7zFiR3//U5wW69Av5BErs0MfHPbGU2siJCUzdqORRF
         lcS8Vkpz9kEkQNcbH9YbMZFAVuTQFzpaXguw9pcLfOs/m9PWML2QTZs10YBoF8wVYa2L
         MBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355924; x=1768960724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teYKKbLkZbUHHb5EH1qkAwDiVubshmdqathiyRgte04=;
        b=i569+O5MM33kpTBsDw/qqhvS9KfiT3leIYEwh3AbodLX7fvecARiAqCaFNiaAMCcnU
         g7EeA2wRuyP13Ismz+6QlBCpsW+x3DYBfelzJia2LhgvjxWYmwpUJQLPC1VGJr20sqtG
         A6i3w6dQpPIWmjVG8g6IlvBTlBv1Nz/6gwI6X9U8JIVLSzqcjyIYoMPK4PDXQGdw+DKe
         8XpHta+S5FpJGrKCRIluncKcy4KHtNLzf+Tconyj0kLjtYzVYqF3fYrJfAC0DfnOqwC4
         ptjdZ/oxNssa7A1F3mETMEJBLVW0jUz6ZwOBIqiaq2ef2cVYANjTN3PP22K2Us3JmERD
         CIUg==
X-Forwarded-Encrypted: i=1; AJvYcCWmsIqqCMYP7808b3tln9xgEgj1NyDLwky5uodYm8feSWqlWaSrQXfmKQpfbcdZvsodubBOOnAKKAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHH++ezGYNxqTx/BqgJpRbR0B8+p8ydHFVNCKLAaF8hiAOBqSo
	yGQMBbeSzYz81obthDWIMtaEuvqQmirijV1z+8Kdjam5f9pc9CnEndlW
X-Gm-Gg: AY/fxX6z16k08IDO+KHUVECoq7V/K7EG0gxXX3fbVO4PuJZgeR5nDVhm6rYovy0/U21
	ssZWCG8IjPl/2wkfbapxUpgdjwl2lH2TO/St6g72OQj8I6olfpa66PEj2ztHZIpBfcvmClscNCg
	jArUuBD/DxTTjnaO7GAgbgODcjOpQukI5mqxYm7QsQ/0OSA1khwmltIaIvWckBdtUSO25XjYHBK
	n2pFPhAZLf+gw3Su+FCD6G9ciZ3MXVMJpfpDLqlbe8QUjzjE7Orzf8C1mpI5/JZI5FTO7sIY7tt
	Y59cA1JltDeQ2dxXX7w1y8uzezriDKErAutHf7mQqulTEemGKzy19jp+fzJ51az4LKMiQHkQQ6W
	TERlTijE0TeYzO8zPzoYHZsiXBwjZUItl6G8D2cu/jfRy89oe23E32gI2S9xLfttmOQ78OS3TDP
	ecVsfcWKcQ7zzKksQRmXKlPn6jesGFN4jSxe94
X-Received: by 2002:a05:6808:50a2:b0:459:bcc4:d6d3 with SMTP id 5614622812f47-45c7115a02cmr683734b6e.0.1768355924022;
        Tue, 13 Jan 2026 17:58:44 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm16131037a34.15.2026.01.13.17.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:58:43 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 00/31] dyndbg: fix dynamic-debug regression in DRM
Date: Tue, 13 Jan 2026 18:57:16 -0700
Message-ID: <20260114015815.1565725-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")

added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
mapped its bits to classes named "DRM_UT_*", and effected the callsite
enablements only on updates to the sys-node (and underlying >control).

Sadly, it hit a CI failure, resulting in:
commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

The regression was that drivers, when modprobed, did not get the
drm.debug=0xff turn-on action, because that had already been done for
drm.ko itself.

The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
in both drm.ko (ie core) and all drivers.ko meant that they couldn't
fundamentally distinguish their respective roles.  They each
"re-defined" the classmap separately, breaking K&R-101.

My ad-hoc test scripting helped to hide the error from me, by 1st
testing various combos of boot-time module.dyndbg=... and
drm.debug=... configurations, and then inadvertently relying upon
those initializations.

This series addresses both failings:

It replaces DECLARE_DYNDBG_CLASSMAP with

- `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
  `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
  the classmap so USE can use it.

- `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
  create a linkage to the classmap defined elsewhere (ie drm.ko).
  These users can then find their "parent" and apply its settings.

It adds a selftest script, and a 2nd "sub-module" to recapitulate
DRM's multi-module "subsystem" use-case, including the specific
failure scenario.

It also adds minor parsing enhancements, allowing easier construction
of multi-part debug configurations.  These enhancements are used to
test classmaps in particular, but are not otherwize required.

v7 added:
. WARN_ONCE when classmap isn't found for a class'd callsite, JBaron
. reorder macro args to match kdoc, JBaron
. Doc formatting fixes, by Bagas

v8 adds:
. CC's for tools/testing, DRM, others
. p21: change _ddebug_class_user.base name to offset, for p30
. p30: amend commit-msg to explain untested, speculative nature

Thank you for your review(s) and/or Tested-by:s

P.S. Id also like to "tease" some follow-on work:

1. DRM adaptation patches, tested on my HW/boxes.

2. patchset to send pr_debugs to tracefs on +T flag

   allows 63 "private" tracebufs, 1 "common" one (at 0)
   "drm.debug_2trace=0x1ff" is possible
   from Lukasz Bartosik

   NB: the private tracebufs allow test scripts to verify
   log content, not just counts of changed pr_debugs.

3. patchset to save 40% of dyndbg's memory footprint

   move (modname,filename,function) to struct _ddebug_site
   save their values & descriptor intervals to 3 maple-trees
   add 3 accessors to fetch on descriptor, from trees
   move __dyndbg_sites __section to INIT_DATA.
   
   NB: Despite the new accessors, `cat control` is just as fast.


Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jason Baron <jbaron@akamai.com>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: Petr Mladek <pmladek@suse.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org> (ftrace/logging tease)
Cc: Liam R. Howlett <Liam.Howlett@oracle.com> (maple-tree tease)

Jim Cromie (31):

fixes, cleanups, simple stuff::

  dyndbg: factor ddebug_match_desc out from ddebug_change
  dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter

callchain grooming, re-structs, code simplify/dedup by macros::

  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions

core fix, detect api misuse errors, etc::

  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: resolve "protection" of class'd pr_debug
  dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
  docs/dyndbg: add classmap info to howto


Jim Cromie (31):
  dyndbg: factor ddebug_match_desc out from ddebug_change
  dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter
  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: resolve "protection" of class'd pr_debug
  dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
  docs/dyndbg: add classmap info to howto

 .../admin-guide/dynamic-debug-howto.rst       | 187 ++++-
 MAINTAINERS                                   |   3 +-
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/linux/dynamic_debug.h                 | 302 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 776 +++++++++++-------
 lib/test_dynamic_debug.c                      | 198 +++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 +++++++++
 14 files changed, 1465 insertions(+), 461 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.52.0

