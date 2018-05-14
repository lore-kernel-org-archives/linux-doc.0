Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 919717D062
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 13:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932153AbeENNmR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 09:42:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35058 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752677AbeENNmN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 May 2018 09:42:13 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0B9C47D83F;
        Mon, 14 May 2018 13:42:13 +0000 (UTC)
Received: from firesoul.localdomain (ovpn-200-19.brq.redhat.com [10.40.200.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B33AD2026DEF;
        Mon, 14 May 2018 13:42:12 +0000 (UTC)
Received: from [192.168.5.1] (localhost [IPv6:::1])
        by firesoul.localdomain (Postfix) with ESMTP id 03E8630736C78;
        Mon, 14 May 2018 15:42:12 +0200 (CEST)
Subject: [bpf-next PATCH 1/5] bpf, doc: add basic README.rst file
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Daniel Borkmann <borkmann@iogearbox.net>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     netdev@vger.kernel.org,
        Quentin Monnet <quentin.monnet@netronome.com>,
        linux-man@vger.kernel.org, linux-doc@vger.kernel.org
Date:   Mon, 14 May 2018 15:42:12 +0200
Message-ID: <152630533196.29210.2648172365646303402.stgit@firesoul>
In-Reply-To: <152630528901.29210.9018565600000101307.stgit@firesoul>
References: <152630528901.29210.9018565600000101307.stgit@firesoul>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Mon, 14 May 2018 13:42:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Mon, 14 May 2018 13:42:13 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'brouer@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A README.rst file in a directory have special meaning for sites like
github, which auto renders the contents.  Plus search engines like
Google also index these README.rst files.

Auto rendering allow us to use links, for (re)directing eBPF users to
other places where docs live.  The end-goal would be to direct users
towards https://www.kernel.org/doc/html/latest but we haven't written
the full docs yet, so we start out small and take this incrementally.

This directory itself contains some useful docs, which can be linked
to from the README.rst file (verified this works for github).

Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
---
 Documentation/bpf/README.rst |   36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/bpf/README.rst

diff --git a/Documentation/bpf/README.rst b/Documentation/bpf/README.rst
new file mode 100644
index 000000000000..329469c33db8
--- /dev/null
+++ b/Documentation/bpf/README.rst
@@ -0,0 +1,36 @@
+=================
+BPF documentation
+=================
+
+This directory contains documentation for the BPF (Berkeley Packet
+Filter) facility, with a focus on the extended BPF version (eBPF).
+
+This kernel side documentation is still work in progress.  The main
+textual documentation is (for historical reasons) described in
+`Documentation/networking/filter.txt`_, which describe both classical
+and extended BPF instruction-set.
+The Cilium project also maintains a `BPF and XDP Reference Guide`_
+that goes into great technical depth about the BPF Architecture.
+
+The primary info for the bpf syscall is available in the `man-pages`_
+for `bpf(2)`_.
+
+
+
+Frequently asked questions (FAQ)
+================================
+
+Two sets of Questions and Answers (Q&A) are maintained.
+
+* QA for common questions about BPF see: bpf_design_QA_
+
+* QA for developers interacting with BPF subsystem: bpf_devel_QA_
+
+
+.. Links:
+.. _bpf_design_QA: bpf_design_QA.txt
+.. _bpf_devel_QA:  bpf_devel_QA.txt
+.. _Documentation/networking/filter.txt: ../networking/filter.txt
+.. _man-pages: https://www.kernel.org/doc/man-pages/
+.. _bpf(2): http://man7.org/linux/man-pages/man2/bpf.2.html
+.. _BPF and XDP Reference Guide: http://cilium.readthedocs.io/en/latest/bpf/

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
