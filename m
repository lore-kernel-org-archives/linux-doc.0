Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F15C7E434
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731447AbeITWJd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:09:33 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36121 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731404AbeITWIE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:04 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1-v6so4676060pgo.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=xgMgBw7rqdztgQH4xJtoHpikGmKBxPLvzemE+0cuWuw=;
        b=Ax500h3T9Nx2HsBskl7y253iwaQudCZ4HzE80JhA1TBdwbGRo7qjzPyMVLupCR1HO1
         YJXwKOP8zKhbO6NoTH3IYs5+LNdJrmdu2+ofpkPnyvpdWwfinBSrkcDeKkweUXvX7LG7
         PCgnVdcZWLQdWFfK2YlDziyQzGVDmiAaGyACY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xgMgBw7rqdztgQH4xJtoHpikGmKBxPLvzemE+0cuWuw=;
        b=AIzBxhGtkqsUqAc4NRUVMc3tnvljtEEkEjpMNQWYv0R4gDEu6Pc0i3ndP+ngxS6XCP
         WwbcuJ5IT85VbUXgJIK0Rpd9eKvyLI/sLb7CNXtyyG1dwTMV8MU8v9MLz6STUlW6I4JA
         zEQpD95EwhacKG9FzdR2DXbmxHJiZmLX1mXt5D2h2/CI4+ssbX1MEj6Rribx84eAcQjt
         AcIRJXH3CXIHs7J/Ay+myBkeZIPxJlooTploSFQGcHBxVQbdIx4+ZYIKiaSameyBkysJ
         0McA8Ik/NndqPxsnjJFOSGynsJPcDLMcEP6TQX2c1BYRXMzNa44bYolAH04HR+y0TpeK
         7oBw==
X-Gm-Message-State: APzg51BchaiPJRVXoJ4H15x7PBVlDOkED+mQ2GuETldmBLtPwYUE7bwy
        SNf033fMtRHd2s/qPrCjt+ZcqQ==
X-Google-Smtp-Source: ANB0VdZpHxgFsVV6/7Hmecc4ahDpXi/NxwKCZXnG860SImP2370ZGtuE26l2sPv6BaShWPRyHiMl+Q==
X-Received: by 2002:a62:12c7:: with SMTP id 68-v6mr42161882pfs.216.1537460628253;
        Thu, 20 Sep 2018 09:23:48 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id d22-v6sm59911971pfm.48.2018.09.20.09.23.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Sep 2018 09:23:43 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH security-next v2 00/26] LSM: Explict LSM ordering
Date:   Thu, 20 Sep 2018 09:23:12 -0700
Message-Id: <20180920162338.21060-1-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
- add "lsm.order=" and CONFIG_LSM_ORDER instead of overloading "security="
- reorganize introduction of ordering logic code

Updated cover letter:

This refactors the LSM registration and initialization infrastructure
to more centrally support different LSM types. What was considered a
"major" LSM is kept for legacy use of the "security=" boot parameter,
and now overlaps with the new class of "exclusive" LSMs for the future
blob sharing (to be added later). The "minor" LSMs become more well
defined as a result of the refactoring.

Instead of continuing to (somewhat improperly) overload the kernel's
initcall system, this changes the LSM infrastructure to store a
registration structure (struct lsm_info) table instead, where metadata
about each LSM can be recorded (name, flags, order, enable flag, init
function). This can be extended in the future to include things like
required blob size for the coming "blob sharing" LSMs.

The "major" LSMs had to individually negotiate which of them should be
enabled. This didn't provide a way to negotiate combinations of other
LSMs (as will be needed for "blob sharing" LSMs). This is solved by
providing the LSM infrastructure with all the details needed to make
the choice (exposing the per-LSM "enabled" flag, if used, the LSM
characteristics, and ordering expectations).

As a result of the refactoring, the "minor" LSMs are able to remove
the open-coded security_add_hooks() calls for "capability", "yama",
and "loadpin", and to redefine "integrity" properly as a general LSM.
(Note that "integrity" actually defined _no_ hooks, but needs the early
initialization).

With all LSMs being proessed centrally, it was possible to implement
a new boot parameter "lsm.order=" to provide explicit ordering, which
is helpful for the future "blob sharing" LSMs. Matching this is the
new CONFIG_LSM_ORDER, which replaces CONFIG_DEFAULT_SECURITY, as it
provides a higher granularity of control.

To better show LSMs activation some debug reporting was added (enabled
with the "lsm.debug" boot commandline option).

Finally, I added a WARN() around LSM initialization failures, which
appear to have always been silently ignored. (Realistically any LSM init
failures would have only been due to catastrophic kernel issues that
would render a system unworkable anyway, but it'd be better to expose
the problem as early as possible.)

-Kees

Kees Cook (26):
  LSM: Correctly announce start of LSM initialization
  vmlinux.lds.h: Avoid copy/paste of security_init section
  LSM: Rename .security_initcall section to .lsm_info
  LSM: Remove initcall tracing
  LSM: Convert from initcall to struct lsm_info
  vmlinux.lds.h: Move LSM_TABLE into INIT_DATA
  LSM: Convert security_initcall() into DEFINE_LSM()
  LSM: Record LSM name in struct lsm_info
  LSM: Provide init debugging infrastructure
  LSM: Don't ignore initialization failures
  LSM: Introduce LSM_FLAG_LEGACY_MAJOR
  LSM: Provide separate ordered initialization
  LSM: Plumb visibility into optional "enabled" state
  LSM: Lift LSM selection out of individual LSMs
  LSM: Introduce lsm.enable= and lsm.disable=
  LSM: Prepare for reorganizing "security=" logic
  LSM: Refactor "security=" in terms of enable/disable
  LSM: Build ordered list of ordered LSMs for init
  LSM: Introduce CONFIG_LSM_ORDER
  LSM: Introduce "lsm.order=" for boottime ordering
  LoadPin: Initialize as ordered LSM
  Yama: Initialize as ordered LSM
  LSM: Introduce enum lsm_order
  capability: Mark as LSM_ORDER_FIRST
  LSM: Separate idea of "major" LSM from "exclusive" LSM
  LSM: Add all exclusive LSMs to ordered initialization

 .../admin-guide/kernel-parameters.txt         |   7 +
 arch/arc/kernel/vmlinux.lds.S                 |   1 -
 arch/arm/kernel/vmlinux-xip.lds.S             |   1 -
 arch/arm64/kernel/vmlinux.lds.S               |   1 -
 arch/h8300/kernel/vmlinux.lds.S               |   1 -
 arch/microblaze/kernel/vmlinux.lds.S          |   2 -
 arch/powerpc/kernel/vmlinux.lds.S             |   2 -
 arch/um/include/asm/common.lds.S              |   2 -
 arch/xtensa/kernel/vmlinux.lds.S              |   1 -
 include/asm-generic/vmlinux.lds.h             |  25 +-
 include/linux/init.h                          |   2 -
 include/linux/lsm_hooks.h                     |  43 ++-
 include/linux/module.h                        |   1 -
 security/Kconfig                              |  42 +--
 security/apparmor/lsm.c                       |  16 +-
 security/commoncap.c                          |   8 +-
 security/integrity/iint.c                     |   5 +-
 security/loadpin/loadpin.c                    |  10 +-
 security/security.c                           | 304 ++++++++++++++----
 security/selinux/hooks.c                      |  16 +-
 security/smack/smack_lsm.c                    |   8 +-
 security/tomoyo/tomoyo.c                      |   7 +-
 security/yama/yama_lsm.c                      |   7 +-
 23 files changed, 348 insertions(+), 164 deletions(-)

-- 
2.17.1

