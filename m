Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 67ECC7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Apr 2019 22:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbfDDWKE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Apr 2019 18:10:04 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:32887 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbfDDWKD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Apr 2019 18:10:03 -0400
Received: by mail-qk1-f202.google.com with SMTP id a188so3474100qkf.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2019 15:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=HMuZC7YhYbbRbZR+3/mPo9a63tVIDjyvayAQ1BEezrw=;
        b=BOYdV3QLi21QjMDlnUKvGYABbEqanEJfcJeRsukkvZphSbuvalPGxmKl1ZwesWtGNJ
         TTJ8+3NFmHoU5SmVWtyZMkKu8Nyw/t+NSbDeEz3hnSewQabz9l0TOlahbUKG4mlWW+y7
         E+UlRE3Dq9q0QgfZUw/dKPJIhCHc9qqFXPORwlb5KXQFkfpJrRmbLHnuf/2qz+1balrw
         W0KW7J/Co45M5GP60Z0dSf/SmsF0HJ5koZpxV+84qyBA97hNSw7rj5R/U+3z8Hv1l8hg
         uCfoyppCCi5h6KNouM/iEP8dlt2A3kMeawzxIGJ44E7EDJ0rNCnaqZhklLOMyyF1HyPk
         fMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=HMuZC7YhYbbRbZR+3/mPo9a63tVIDjyvayAQ1BEezrw=;
        b=sG/LPtVdCecVKHMXXypKgzlAUyNeW0OkPVuKIfiC/2ICy4+eLXgxBXkyY7IrtT+0eZ
         U226LyGcdvRf0dzLNY+KYfsWgquBY9/gBBvkIXD5Z9bP3kks5zrfZXFDt2mCNfPUcycw
         OWloZtEWkxJfi5lirh321RZsTPfjUNjJTpBca3hnnoTbxdr10+2REx+z017SLbIoWX0H
         vV9Rz9mP7keecXvlKjEd+DvRPBIAsVPtfLXQzXvNsqVlK9XiGk+Qh7LBeFuk749mwLT/
         Lz6rmc0CdTZEzAcU6z22icdKnkL1xBxmHdSTs21tgUoOyIKFD9dnU7YhZEQxbbzSDYAm
         m3YA==
X-Gm-Message-State: APjAAAVZ8m2oyRWljGM2OuUoJW8koUptyBpfbqIzsM48tkZhzH1GNF2/
        vo9nXo0/CH21sGpm/zD/MXurePQraoaBSktgX0mfqQ==
X-Google-Smtp-Source: APXvYqy2ky80xlMwOpOXMGTjrYk0Q3P0Z4woKg+c4LxenDRGrU/tuDoXYQsQZWjvMUl2LUV6LFTdSDNe8kgS8hF9kpSiLg==
X-Received: by 2002:a0c:ea90:: with SMTP id d16mr1127285qvp.27.1554415802221;
 Thu, 04 Apr 2019 15:10:02 -0700 (PDT)
Date:   Thu,  4 Apr 2019 15:06:35 -0700
Message-Id: <20190404220652.19765-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH v1 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From:   Brendan Higgins <brendanhiggins@google.com>
To:     corbet@lwn.net, frowand.list@gmail.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        robh@kernel.org, shuah@kernel.org, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch,
        gregkh@linuxfoundation.org, jdike@addtoit.com, joel@jms.id.au,
        julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com,
        mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at,
        rostedt@goodmis.org, wfg@linux.intel.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch set proposes KUnit, a lightweight unit testing and mocking
framework for the Linux kernel.

Unlike Autotest and kselftest, KUnit is a true unit testing framework;
it does not require installing the kernel on a test machine or in a VM
and does not require tests to be written in userspace running on a host
kernel. Additionally, KUnit is fast: From invocation to completion KUnit
can run several dozen tests in under a second. Currently, the entire
KUnit test suite for KUnit runs in under a second from the initial
invocation (build time excluded).

KUnit is heavily inspired by JUnit, Python's unittest.mock, and
Googletest/Googlemock for C++. KUnit provides facilities for defining
unit test cases, grouping related test cases into test suites, providing
common infrastructure for running tests, mocking, spying, and much more.

## What's so special about unit testing?

A unit test is supposed to test a single unit of code in isolation,
hence the name. There should be no dependencies outside the control of
the test; this means no external dependencies, which makes tests orders
of magnitudes faster. Likewise, since there are no external dependencies,
there are no hoops to jump through to run the tests. Additionally, this
makes unit tests deterministic: a failing unit test always indicates a
problem. Finally, because unit tests necessarily have finer granularity,
they are able to test all code paths easily solving the classic problem
of difficulty in exercising error handling code.

## Is KUnit trying to replace other testing frameworks for the kernel?

No. Most existing tests for the Linux kernel are end-to-end tests, which
have their place. A well tested system has lots of unit tests, a
reasonable number of integration tests, and some end-to-end tests. KUnit
is just trying to address the unit test space which is currently not
being addressed.

## More information on KUnit

There is a bunch of documentation near the end of this patch set that
describes how to use KUnit and best practices for writing unit tests.
For convenience I am hosting the compiled docs here:
https://google.github.io/kunit-docs/third_party/kernel/docs/
Additionally for convenience, I have applied these patches to a branch:
https://kunit.googlesource.com/linux/+/kunit/rfc/v5.1-rc2/v1
The repo may be cloned with:
git clone https://kunit.googlesource.com/linux
This patchset is on the kunit/rfc/v5.1-rc2/v1 branch.

## Changes Since Last Version

Last version was RFC v4. It seemed we were pretty much done with the RFC
phase, so I started the numbering over again. Sorry if anyone finds that
confusing.

 - Reduced usage of object oriented style of member functions as
   suggested by Frank.
 - Did a bunch of heavy clean up of the kunit_abort stuff as suggested
   by Frank and Stephen:
   - Biggest change was to reduce the usage of direct calls of member
     functions.
   - Added a better explanation of what abort is for and further
     explained the rationale for KUNIT_ASSERT_* vs. KUNIT_EXPECT_*
   - Dropped BUG() usage
   - Also moved try_catch interface to a new file since it seemed
     obscured by being mixed in with the code that used it.
 - Fixed some other minor issues pointed out by Stephen.
 - Updated email address of one of the contributors.
 - Dropped DT unittest port since it seemed like there was a lot more
   discussion to be had: it wasn't ready to leave the RFC phase.
   Instead, I added a KUnit test written by Iurii for PROC SYSCTL that
   was requested by Luis some time ago.

For reference, RFC v4 can be found here:
https://lkml.org/lkml/2019/2/14/1144

-- 
2.21.0.392.gf8f6787159e-goog

