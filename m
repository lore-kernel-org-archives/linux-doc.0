Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F6087D062
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 13:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932352AbeENNmu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 09:42:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35092 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932155AbeENNme (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 May 2018 09:42:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4F38F7D83F;
        Mon, 14 May 2018 13:42:33 +0000 (UTC)
Received: from firesoul.localdomain (ovpn-200-19.brq.redhat.com [10.40.200.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 021362166BAD;
        Mon, 14 May 2018 13:42:33 +0000 (UTC)
Received: from [192.168.5.1] (localhost [IPv6:::1])
        by firesoul.localdomain (Postfix) with ESMTP id 47F5130736C78;
        Mon, 14 May 2018 15:42:32 +0200 (CEST)
Subject: [bpf-next PATCH 5/5] bpf, doc: howto use/run the BPF selftests
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Daniel Borkmann <borkmann@iogearbox.net>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     netdev@vger.kernel.org,
        Quentin Monnet <quentin.monnet@netronome.com>,
        linux-man@vger.kernel.org, linux-doc@vger.kernel.org
Date:   Mon, 14 May 2018 15:42:32 +0200
Message-ID: <152630535224.29210.11623921130132517306.stgit@firesoul>
In-Reply-To: <152630528901.29210.9018565600000101307.stgit@firesoul>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Mon, 14 May 2018 13:42:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Mon, 14 May 2018 13:42:33 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'brouer@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I always forget howto run the BPF selftests. Thus, lets add that info
to the QA document.

Documentation was based on Cilium's documentation:
 http://cilium.readthedocs.io/en/latest/bpf/#verifying-the-setup

Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
---
 Documentation/bpf/bpf_devel_QA.rst |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_devel_QA.rst
index 2254bdeae990..0e7c1d946e83 100644
--- a/Documentation/bpf/bpf_devel_QA.rst
+++ b/Documentation/bpf/bpf_devel_QA.rst
@@ -417,6 +417,33 @@ submitted by the BPF maintainers to the stable maintainers.
 Testing patches
 ===============
 
+Q: How to run BPF selftests
+---------------------------
+A: After you have booted into the newly compiled kernel, navigate to
+the BPF selftests_ suite in order to test BPF functionality (current
+working directory points to the root of the cloned git tree)::
+
+  $ cd tools/testing/selftests/bpf/
+  $ make
+
+To run the verifier tests::
+
+  $ sudo ./test_verifier
+
+The verifier tests print out all the current checks being
+performed. The summary at the end of running all tests will dump
+information of test successes and failures::
+
+  Summary: 418 PASSED, 0 FAILED
+
+In order to run through all BPF selftests, the following command is
+needed::
+
+  $ sudo make run_tests
+
+See the kernels selftest `Documentation/dev-tools/kselftest.rst`_
+document for further documentation.
+
 Q: Which BPF kernel selftests version should I run my kernel against?
 ---------------------------------------------------------------------
 A: If you run a kernel ``xyz``, then always run the BPF kernel selftests
@@ -607,5 +634,7 @@ when:
 .. _netdev FAQ: ../networking/netdev-FAQ.txt
 .. _samples/bpf/: ../../samples/bpf/
 .. _selftests: ../../tools/testing/selftests/bpf/
+.. _Documentation/dev-tools/kselftest.rst:
+   https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html
 
 Happy BPF hacking!

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
