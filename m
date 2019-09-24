Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E10707D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Sep 2019 23:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411091AbfIXXCn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Sep 2019 19:02:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36031 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410730AbfIXXCn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Sep 2019 19:02:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id t14so1665182pgs.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2019 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=875aexvD7cUCg4vLDozHani2eFwWcaXl/i/C7NyBK9s=;
        b=hKzkVvwRGb4znyJN+vH3wu91+Ba0HRbUn/79qk0j4/Qc5P+f830chLC7pKfsie/kG/
         jGE6cuPi8mSCPtwYQuw6v1H1tHOfaaSx0YshnHQxAIL5Ohr7LPxY0xY/hmhQqICg6hBo
         pN2BU7ZrUdtJFDOfdOS3nkWJvNB1awluzkuYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=875aexvD7cUCg4vLDozHani2eFwWcaXl/i/C7NyBK9s=;
        b=mdBCv0r7xMQmgd1xZtfiKpvVUXAOOD1Cr1GCcEfSoltjtpWQyAbhFsql8LeYgNKTHh
         SUtM2od3s5BZUuDOUI1+s0cWwqQmHvv0xpX3BQ69PPt/dpbLuO5Lb0/Q1q64wejDtz4V
         cRqgOrs0TqsG7kikbeDKl7955lQy8zOWU5qyjiixq3CfUrma6QAynt+MhtSROEDciabW
         VdkGepG+vdlJxLpFoVfU2aGhuXTEr7IpbVBSL7TdeZZLi8kWH73vWBgoDRPbDvf870BA
         uN+DWQO4oFeBqk/aiu6edT9Vd5qYlbl810di4jGNJ4C3ZIKZJbWOR05RXW5zfpR9SG+w
         2k7g==
X-Gm-Message-State: APjAAAVIStkj9XYu+G6gRudFLWzzzyDbyR4PuX4TpURVaeLXAIsfsK/P
        obfWvxKhWRhQo48y6TYbSmeMPA==
X-Google-Smtp-Source: APXvYqy77rLagnu3Wdk8EcVrrG/YEwpXEWLr/l86uQs5tIglvvkz7LtqXowdfJ8AIHNk3Or6OKo/HA==
X-Received: by 2002:a63:4566:: with SMTP id u38mr5426355pgk.448.1569366132160;
        Tue, 24 Sep 2019 16:02:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q3sm3234073pgj.54.2019.09.24.16.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 16:02:10 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] docs: Programmatically render MAINTAINERS into ReST
Date:   Tue, 24 Sep 2019 16:02:06 -0700
Message-Id: <20190924230208.12414-1-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit log from Patch 2 repeated here for cover letter:

In order to have the MAINTAINERS file visible in the rendered ReST
output, this makes some small changes to the existing MAINTAINERS file
to allow for better machine processing, and adds a new Sphinx directive
"maintainers-include" to perform the rendering.

Features include:
- Per-subsystem reference links: subsystem maintainer entries can be
  trivially linked to both internally and external. For example:
  https://www.kernel.org/doc/html/latest/process/maintainers.html#secure-computing

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
        SCM:      git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git seccomp
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
 Documentation/sphinx/maintainers_include.py   | 194 ++++++++++++++++++
 MAINTAINERS                                   |  62 +++---
 6 files changed, 240 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/process/maintainers.rst
 create mode 100755 Documentation/sphinx/maintainers_include.py

-- 
2.17.1

