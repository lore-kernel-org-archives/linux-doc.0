Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9837E37A481
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671795; cv=none; b=rERjikiZYMhJp8TEHrjSAoydaXaz4ic9Q8PmGRk3iJfHEeMhjKFvalKeHxvlQ7qcnLjemhre7z13RuvL34KJwSUB47cJEQ/+45YdNcjwOb5J2LNHC0kGUE8AxADRVOkMfns5m7Tj2XIz3D5zPV6XBh2jDeYAQYPb6otOtto0GcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671795; c=relaxed/simple;
	bh=x90qC8LaybvLC+qwA76UKpOgS9j/YY3MJ/cGbittCGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wm6qQxkHmklQFklO1JgpxJv+DJqOhUJdZSfwNkCqkndm0g53Jwfa69nJjIoqxgbZUGO6S8yb0wBxAwh5tR1F2943Y6+zATSu9ZJX6+jwjVES6Ko6KRTxCmyZTRNiQ+60pgEplJfDfApDAMIpYUeI2nE3gSfns3iRfv0qGvSXuRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pz4gZkiN; arc=none smtp.client-ip=209.85.160.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pz4gZkiN"
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-4042905015cso427409fac.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671792; x=1770276592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5k22CUWxoDCFWg5lgOlNQDS0dCgTANphXGWpbOhMltU=;
        b=Pz4gZkiNBNdn/ENE5hPLoxmzbxPoPJwLvZ0qrSJvmaUgN7o/qKj+6wf8PykDTCc2bg
         Q7rX5cQJjXmDiN7B0KFrR+/3Ht57uv510/WLnryjdCDwirxqZtQElzfp0XlkzhSGiiF7
         wqn49yyZN3OAQrDPdJiyajZ7Z1PRZ9nV7CifUoubMvAXKtHtb0g/SURSVO+fmnJw05WL
         42yH7iKgkzJJLRALc2iYVNID2HWQkLtH/qk6s/4lr4mjIrNolLrp1UcSglsEZQzuEArM
         juK8WiGSQP1TdBP0lBGqEBUI4gULCFANhzkIq9JIvBFUtbin/Pet3vcPOsZDMBJL9nHt
         VPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671792; x=1770276592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k22CUWxoDCFWg5lgOlNQDS0dCgTANphXGWpbOhMltU=;
        b=JNHfmHBo7R3rgSKZgiD5Az6lgm6BZduHGU3eymj4456qnxUFKxpJ3VYkU4MYkmc94W
         KV1e3OOciF6cgXFJ0E3z7PQxE3VkuFPMbgM2l8YoCLybeKv5S6ZiH7sD+wdcOADvpHU7
         /DHEwn9bWqltkXrDhN+7egDVvxXmRHUisnF/Y2YdRnWUDznV+5ptidnrMfjcLe75HOSn
         RV8dmazH4wfsPjXCTGhi7y7IUL1Xg7UVg84adQluPYQ1xpWaggJ6YCCnEIr6V7IoAyL9
         +05d9N/p3UQkQKJINmJefpRfb+Bl7xm/D8TLybq99AmrzNFCKH/MbMFnmZ8yXSCaRbqr
         lsGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRkwYL/0xIZxGPkvpr72Q8mXXxtTEtUX9D//xwt9FKafRExlNR0ZwEgtSzm1/YnFBSouxb/tWf0js=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiybU68gYoh8DGD8XkwuSZSfORFiD0AlCCwk2OaFHnhrhvyoxM
	d3tdFQHryXVhb1+1+in9kFtaNDTAq0Zyqg8O4wIDlOouIA8iFQxsQgHs
X-Gm-Gg: AZuq6aLY664ZS6vremfDTG3BLGwg7nGWYH55Z6tetNKAU/rXMbMuxqrKHAIY/GpUoGN
	IB8lE7ooeterKe4Cv/E2Pk7MQFKzLH1sQ/WPdBSBQm1sL5BkQw60jHRFVI/2Nhg2oJHLiuG9QXX
	SHc4fm6HCNQeThLypxLtp3qmS+FA6oZPge+6hOUtE14crV1IhyCsBqJC6giysqdwmUiOw8SxSyE
	eyflNK1VYj65UUL9io6gogqZWLOzcgmDN36ziX5960O6PWud5fBg7xS3p5FMPLdhPevSJy2FMZr
	83SnA8vnJB9aNZBdn+FVoGMleQm0wcZ2JqCblLm4HkLhzeiJU9sa1SrXH8KvM7PK7t+dqRW1tt9
	QxK6vXLAR5xw/e5SJdA/1JFXQRdbBTI/emY0x+pOnHmEHsWh+TIjOSm/6nSjpyfu2YXreb+Jxwe
	PGHZM7gWS3Z8+jFmxogGvmi3o6KggKA5H1PhBjWoG6
X-Received: by 2002:a05:6871:2e89:b0:3ec:4f31:42a with SMTP id 586e51a60fabf-4093fc36735mr4474416fac.7.1769671792291;
        Wed, 28 Jan 2026 23:29:52 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4095749f332sm3238493fac.11.2026.01.28.23.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:29:51 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
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
	linux-doc@vger.kernel.org
Subject: [PATCH v9 00/32] fix dynamic debug classmaps
Date: Thu, 29 Jan 2026 00:28:46 -0700
Message-ID: <20260129072932.2190803-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

commit aad0214f302 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")

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

v9: fixes for lkp-robot reports
. fix warning on WARN in another arch
. fix section mis-ALIGN causing NULL ptr on i386

v8:
. CC's for tools/testing, DRM, others
. p22: change _ddebug_class_user.base name to offset, for p31
. p31: amend commit-msg to explain untested, speculative nature

v7:
. WARN_ONCE when classmap isn't found for a class'd callsite, JBaron
. reorder macro args to match kdoc, JBaron
. Doc formatting fixes, by Bagas

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

Jim Cromie (32):
  dyndbg: fix NULL ptr on i386 due to section alignment
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

 .../admin-guide/dynamic-debug-howto.rst       | 184 ++++-
 MAINTAINERS                                   |   3 +-
 include/asm-generic/vmlinux.lds.h             |  19 +-
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
 14 files changed, 1475 insertions(+), 462 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.52.0

