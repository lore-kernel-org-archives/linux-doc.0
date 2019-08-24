Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E6F137D90D
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Aug 2019 01:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfHXBeh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Aug 2019 21:34:37 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:44690 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfHXBeh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Aug 2019 21:34:37 -0400
Received: by mail-vk1-f202.google.com with SMTP id a5so4508687vki.11
        for <linux-doc@vger.kernel.org>; Fri, 23 Aug 2019 18:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=u6vmmnwRUzLKD5y/rsoe3hBquEKZMDYQLdEtGhcWv3g=;
        b=HVklJPxbqbRBtpBK3hdl+VswNRV4P2EWUoTQ6/jzlla/43tMUYx52ieNsrWja1cMAd
         aJXK63eT0AeMDFxYtZyBESJGuF52uPkRIRazyPmUFSSpZlHx/sV1I2pC8wcJoG/Jy+z7
         0ebrqRvPPaqx+epAoYNiv2Z6F0OPXUrzfluIz3B0PZsRxGAjoAWPYO3kBtG4yhrHecAA
         fwkXjbrqFMOaTYkIzZof+8WI+OZNq8YRk4OSEiBdVc0hDOjOiYENTJZIZIQpFAlgeRT6
         5UwDu9vDrX9VEXJMCDM32wr6kC4xm78SHY7UBAnZUT4L8JjxDdyUQ0eJ2Gew4CMdHuAQ
         esXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=u6vmmnwRUzLKD5y/rsoe3hBquEKZMDYQLdEtGhcWv3g=;
        b=fW/10l7s+NjXS2Sy0fwt6wLE8YO8kr5ZVRc6YJtnPydzFVRFca2k60HJM/m0DVutDv
         8+TiJgv5ltbzaesaRiZpgogHshHoiNBhPI2oDCsORPwHx/d7jv88m+L1SgGZJZbtqY20
         NdNUBIY2XvapD91iBVaIHzA2JJAAOx13ez98YmUwJ2iI/0oXjcl9vdPU13RVHwARmfuu
         4Vfyjw+8ZlQXQzjZp5OFSxaB5ESGB6Af6+c1+bvIPiKm9BfwlEnMoig0r24/JQodp8wY
         7mo3O1320Dcv5iUTMIqlen1vucNygXkYYMAAk63zePEnS1lOC9WkRbKvJRZpzLKu9rVD
         9NYQ==
X-Gm-Message-State: APjAAAWvYdOA0QhO00+/s3lv7iLOms+5dKdLHNNH0dwcyKWICeDHMl1G
        Oi/HuN9OHsaerPe6CEnIqCzgk+0JcmOZnaZ8u9+eGQ==
X-Google-Smtp-Source: APXvYqwBNX0MXCogqcD2ZWv4/PeYSKyopYGJC89lxHpR6CjYFzzu83jqcycsHbnwRnQxtUoBH+I61TfjBVcTRyxmbsVxMw==
X-Received: by 2002:a67:dd91:: with SMTP id i17mr4328220vsk.21.1566610475582;
 Fri, 23 Aug 2019 18:34:35 -0700 (PDT)
Date:   Fri, 23 Aug 2019 18:34:07 -0700
Message-Id: <20190824013425.175645-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

## TL;DR

This revision addresses comments from Shuah by fixing a couple
checkpatch warnings and fixing some comment readability issues. No API
or major structual changes have been made since v13.

## Background

This patch set proposes KUnit, a lightweight unit testing and mocking
framework for the Linux kernel.

Unlike Autotest and kselftest, KUnit is a true unit testing framework;
it does not require installing the kernel on a test machine or in a VM
(however, KUnit still allows you to run tests on test machines or in VMs
if you want[1]) and does not require tests to be written in userspace
running on a host kernel. Additionally, KUnit is fast: From invocation
to completion KUnit can run several dozen tests in about a second.
Currently, the entire KUnit test suite for KUnit runs in under a second
from the initial invocation (build time excluded).

KUnit is heavily inspired by JUnit, Python's unittest.mock, and
Googletest/Googlemock for C++. KUnit provides facilities for defining
unit test cases, grouping related test cases into test suites, providing
common infrastructure for running tests, mocking, spying, and much more.

### What's so special about unit testing?

A unit test is supposed to test a single unit of code in isolation,
hence the name. There should be no dependencies outside the control of
the test; this means no external dependencies, which makes tests orders
of magnitudes faster. Likewise, since there are no external dependencies,
there are no hoops to jump through to run the tests. Additionally, this
makes unit tests deterministic: a failing unit test always indicates a
problem. Finally, because unit tests necessarily have finer granularity,
they are able to test all code paths easily solving the classic problem
of difficulty in exercising error handling code.

### Is KUnit trying to replace other testing frameworks for the kernel?

No. Most existing tests for the Linux kernel are end-to-end tests, which
have their place. A well tested system has lots of unit tests, a
reasonable number of integration tests, and some end-to-end tests. KUnit
is just trying to address the unit test space which is currently not
being addressed.

### More information on KUnit

There is a bunch of documentation near the end of this patch set that
describes how to use KUnit and best practices for writing unit tests.
For convenience I am hosting the compiled docs here[2].

Additionally for convenience, I have applied these patches to a
branch[3]. The repo may be cloned with:
git clone https://kunit.googlesource.com/linux
This patchset is on the kunit/rfc/v5.3/v15 branch.

## Changes Since Last Version

- Moved comment from inline in macro to kernel-doc to address checkpatch
  warning.
- Demoted BUG() to WARN_ON.
- Formatted some kernel-doc comments to make them more readible.

[1] https://google.github.io/kunit-docs/third_party/kernel/docs/usage.html#kunit-on-non-uml-architectures
[2] https://google.github.io/kunit-docs/third_party/kernel/docs/
[3] https://kunit.googlesource.com/linux/+/kunit/rfc/v5.3/v15

-- 
2.23.0.187.g17f5b7556c-goog

