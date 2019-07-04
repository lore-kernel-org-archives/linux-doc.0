Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CB7577D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Jul 2019 00:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfGDAhD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Jul 2019 20:37:03 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:42978 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfGDAhD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Jul 2019 20:37:03 -0400
Received: by mail-vk1-f202.google.com with SMTP id y198so450750vky.9
        for <linux-doc@vger.kernel.org>; Wed, 03 Jul 2019 17:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=3dkcwHp7UkbBjeC+jKJgdEez1r7JnE/QFVNxh/Av3lE=;
        b=P/9Q0U57X0Mjr2pSdVR3fq5Q9Stk+yaqd+YUm9sq0ou6AVsZSt/1N/33ozuhbgY2vA
         l95M1OTPG7AMpCdkXNxZwoF74wXCpWnPckCjmlCUOfpVWb6OUe1dqoKeBMLQ2rRoWAC+
         fNHaGobDGBWH78hBlHjYyz8R5pV2r1lKhN6q853RMfM6pw8GA8VVYjvcvo3uf8gDuuir
         ENB2mZWRXg62IrhKkC86LfkNF4vHPkE6nmhUv9Xome467fLx+E9J0pgZrqEdzyy++0mz
         884zs7eBSkOyiHbrPJJuzc+Z2DaP9Fz7PcxSltbsQgqsrKy/bR2ai8bDNYsLrfqN7e+f
         Qiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=3dkcwHp7UkbBjeC+jKJgdEez1r7JnE/QFVNxh/Av3lE=;
        b=LmIFQDOpT53XhBpdkEgzRk/+DO3WtaiLttvV66jHh7tbNwrUpFfimluoNECrK+gaLR
         RkZyxClbsljrSv73+klEfKQvC9sZooaOtcCi38/DfmE3y5VVGz3m4Jr+s91RYrqhTtxN
         WBtNSIrfb3gQRUWC4Hb2IQGbuOUgk8vI6JrQF3bUMvjQUdP/rfK33AIAYDTtQ6Qo15nj
         HdIwXoaMj4ZG0EYbIe0+96r9lCj71pV90IPmPYAAr/uo3gKSDphOCLOQNpOSp48gqiG9
         qVfSKxOYqf3EyE/30w80uo26Yik52+tgzCEq/9wkm8VMZ0c4InpeoGfwSMmuSe36NGfn
         3HBw==
X-Gm-Message-State: APjAAAVtKYiXq5xG4DkuN30gJEvweWdbqwPlDbMvGm8OpkI95mhrRUwg
        aA341rUNoecEmzUKGALGnh5bn3kG6PoMG42hPkBPTA==
X-Google-Smtp-Source: APXvYqxifi+9P2uuB2xECPxDjII80enpIo8mSlNTAxiC8KmAvRxtyVWjtDGXaCnqTdPCo5Xn7dOc4Z0daGhonP28ve9Qzg==
X-Received: by 2002:a1f:5945:: with SMTP id n66mr6468396vkb.58.1562200621022;
 Wed, 03 Jul 2019 17:37:01 -0700 (PDT)
Date:   Wed,  3 Jul 2019 17:35:57 -0700
Message-Id: <20190704003615.204860-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v6 00/18] kunit: introduce KUnit, the Linux kernel unit
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

This is a pretty straightforward follow-up to Stephen and Luis' comments
on PATCH v5: There is nothing that really changes any functionality or
usage with the minor exception that I renamed `struct kunit_module` to
`struct kunit_suite`. Nevertheless, a good deal of clean ups and fixes.
See "Changes Since Last Version" section below.

As for our current status, right now we got Reviewed-bys on all patches
except:

- [PATCH v6 08/18] objtool: add kunit_try_catch_throw to the noreturn
  list

However, it would probably be good to get reviews/acks from the
subsystem maintainers on:

- [PATCH v6 06/18] kbuild: enable building KUnit
- [PATCH v6 08/18] objtool: add kunit_try_catch_throw to the noreturn
  list
- [PATCH v6 15/18] Documentation: kunit: add documentation for KUnit
- [PATCH v6 17/18] kernel/sysctl-test: Add null pointer test for
  sysctl.c:proc_dointvec()

Other than that, I think we should be good to go.

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
This patchset is on the kunit/rfc/v5.2-rc7/v6 branch.

## Changes Since Last Version

Aside from renaming `struct kunit_module` to `struct kunit_suite`, there
isn't really anything in here that changes any functionality:

- Rebased on v5.2-rc7
- Got rid of spinlocks.
  - Now update success field using WRITE_ONCE. - Suggested by Stephen
  - Other instances replaced by mutex. - Suggested by Stephen and Luis
- Renamed `struct kunit_module` to `struct kunit_suite`. - Inspired by
  Luis.
- Fixed a broken example of how to use kunit_tool. - Pointed out by Ted
- Added descriptions to unit tests. - Suggested by Luis
- Labeled unit tests which tested the API. - Suggested by Luis
- Made a number of minor cleanups. - Suggested by Luis and Stephen.

[1] https://google.github.io/kunit-docs/third_party/kernel/docs/usage.html#kunit-on-non-uml-architectures
[2] https://google.github.io/kunit-docs/third_party/kernel/docs/
[3] https://kunit.googlesource.com/linux/+/kunit/rfc/v5.2-rc7/v6

-- 
2.22.0.410.gd8fdbe21b5-goog

