Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3ACC17D91A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 18:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732312AbfJASZl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 14:25:41 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43924 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732274AbfJASZj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Oct 2019 14:25:39 -0400
Received: by mail-pl1-f195.google.com with SMTP id f21so5897019plj.10
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2019 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=m8eYBBkYRVbOtZzQQIEHp8iS4j4fHlbVl2GeuXY9abc=;
        b=GCImDONAmbUHbQLrQB1XgH5tNRznUrOQk5MeIV9pELjG1VRjWfQ42k1ZyWikYSU8Wc
         Pjq3OvQ5baNwN33CS4tp1TQP5RACnCeFwaaamkAzAEuoAKTXDv9/l+d8uSIPw6oj6OTA
         qSy5q/jPfZzw+0cfYrH4F38I8Hg4p/EaDJ8m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m8eYBBkYRVbOtZzQQIEHp8iS4j4fHlbVl2GeuXY9abc=;
        b=tut4ww24CSgvxWHXNUJOPoTc6o9rpdi1OeTwQqvL8kqmFKGBK1IUyxJE0AHRdJdJuq
         bXdeW2xM1IIHHy1o6xpWkDORhU/1sUFDK4KW0Ghe+HP1S7wqpy808+STSrIeyx3ekh+o
         mAnr+IHvcLslUMzsy2PsmckqtSw+nY6D/jdGDyPCW0xqAChnCHMK8mYCQhslVluQUh0R
         ayUAmjPMhP21FftxQWrdUkE+Gw00Ak1MH9Vx3MgF3c3zALgFMEQOijWv1Ak/mEwaad7/
         4cN9bu0QGrlVKEDPUMR+jL/PMlTW6BflV/z0CPRn4sqCvONKvoqnmQ/0qxySrByLj0SC
         zufg==
X-Gm-Message-State: APjAAAVasSdJNjOlXnZSHqd5Gd0MlTyHj1cvC1H+F8hIg3LJ6K++ZkDU
        +fXz7onvIxNbnsl7CBrjMgvb3g==
X-Google-Smtp-Source: APXvYqxZou0NR60fIrMXL0icbnWrdfQ0MFD0ezaaocwIAUDTRdBtukN7GzFfirNw9FhjrJVC3NcSJQ==
X-Received: by 2002:a17:902:ab82:: with SMTP id f2mr27937294plr.220.1569954337120;
        Tue, 01 Oct 2019 11:25:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k15sm18909204pgt.66.2019.10.01.11.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 11:25:36 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] docs: Programmatically render MAINTAINERS into ReST
Date:   Tue,  1 Oct 2019 11:25:30 -0700
Message-Id: <20191001182532.21538-1-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v1: https://lore.kernel.org/lkml/20190924230208.12414-1-keescook@chromium.org

v2: fix python2 utf-8 issue thanks to Jonathan Corbet


Commit log from Patch 2 repeated here for cover letter:

In order to have the MAINTAINERS file visible in the rendered ReST
output, this makes some small changes to the existing MAINTAINERS file
to allow for better machine processing, and adds a new Sphinx directive
"maintainers-include" to perform the rendering.

Features include:
- Per-subsystem reference links: subsystem maintainer entries can be
  trivially linked to both internally and external. For example:
  https://www.kernel.org/doc/html/latest/process/maintainers.html#secure-computi
ng

- Internally referenced .rst files are linked so they can be followed
  when browsing the resulting rendering. This allows, for example, the
  future addition of maintainer profiles to be automatically linked.

- Field name expansion: instead of the short fields (e.g. "M", "F",
  "K"), use the indicated inline "full names" for the fields (which are
  marked with "*"s in MAINTAINERS) so that a rendered subsystem entry
  is more human readable. Email lists are additionally comma-separated.
  For example:

    SECURE COMPUTING
        Mail:     Kees Cook <keescook@chromium.org>
        Reviewer: Andy Lutomirski <luto@amacapital.net>,
                  Will Drewry <wad@chromium.org>
        SCM:      git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.g
it seccomp
        Status:   Supported
        Files:    kernel/seccomp.c include/uapi/linux/seccomp.h
                  include/linux/seccomp.h tools/testing/selftests/seccomp/*
                  tools/testing/selftests/kselftest_harness.h
                  userspace-api/seccomp_filter
        Content regex:  \bsecure_computing \bTIF_SECCOMP\b

---
Kees Cook (2):
  doc-rst: Reduce CSS padding around Field
  doc-rst: Programmatically render MAINTAINERS into ReST

 Documentation/conf.py                         |   3 +-
 Documentation/process/index.rst               |   1 +
 Documentation/process/maintainers.rst         |   1 +
 .../sphinx-static/theme_overrides.css         |  10 +
 Documentation/sphinx/maintainers_include.py   | 197 ++++++++++++++++++
 MAINTAINERS                                   |  62 +++---
 6 files changed, 243 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/process/maintainers.rst
 create mode 100755 Documentation/sphinx/maintainers_include.py

--
2.17.1

