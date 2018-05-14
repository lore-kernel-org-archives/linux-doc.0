Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF05A7D062
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 13:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932236AbeENNmL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 09:42:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55334 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932122AbeENNmJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 May 2018 09:42:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5BF30404008D;
        Mon, 14 May 2018 13:42:08 +0000 (UTC)
Received: from firesoul.localdomain (ovpn-200-19.brq.redhat.com [10.40.200.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EA0F62166BAD;
        Mon, 14 May 2018 13:42:07 +0000 (UTC)
Received: from [192.168.5.1] (localhost [IPv6:::1])
        by firesoul.localdomain (Postfix) with ESMTP id E928330736C78;
        Mon, 14 May 2018 15:42:06 +0200 (CEST)
Subject: [bpf-next PATCH 0/5] bpf,
 doc: convert Documentation/bpf to RST-formatting
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Daniel Borkmann <borkmann@iogearbox.net>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     netdev@vger.kernel.org,
        Quentin Monnet <quentin.monnet@netronome.com>,
        linux-man@vger.kernel.org, linux-doc@vger.kernel.org
Date:   Mon, 14 May 2018 15:42:06 +0200
Message-ID: <152630528901.29210.9018565600000101307.stgit@firesoul>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Mon, 14 May 2018 13:42:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Mon, 14 May 2018 13:42:08 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'brouer@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel is moving files under Documentation to use the RST
(reStructuredText) format and Sphinx [1].  This patchset converts the
files under Documentation/bpf/ into RST format.  The Sphinx
integration is left as followup work.

[1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html

This patchset have been uploaded as branch bpf_doc10 on github[2], so
reviewers can see how GitHub renders this.

[2] https://github.com/netoptimizer/linux/tree/bpf_doc10/Documentation/bpf

---

Jesper Dangaard Brouer (5):
      bpf, doc: add basic README.rst file
      bpf, doc: rename txt files to rst files
      bpf, doc: convert bpf_design_QA.rst to use RST formatting
      bpf, doc: convert bpf_devel_QA.rst to use RST formatting
      bpf, doc: howto use/run the BPF selftests


 Documentation/bpf/README.rst        |   36 ++
 Documentation/bpf/bpf_design_QA.rst |  221 ++++++++++++
 Documentation/bpf/bpf_design_QA.txt |  156 ---------
 Documentation/bpf/bpf_devel_QA.rst  |  640 +++++++++++++++++++++++++++++++++++
 Documentation/bpf/bpf_devel_QA.txt  |  570 -------------------------------
 5 files changed, 897 insertions(+), 726 deletions(-)
 create mode 100644 Documentation/bpf/README.rst
 create mode 100644 Documentation/bpf/bpf_design_QA.rst
 delete mode 100644 Documentation/bpf/bpf_design_QA.txt
 create mode 100644 Documentation/bpf/bpf_devel_QA.rst
 delete mode 100644 Documentation/bpf/bpf_devel_QA.txt

--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
