Return-Path: <SRS0=MbD/=6I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7136DC54FD0
	for <linux-doc@archiver.kernel.org>; Fri, 24 Apr 2020 15:27:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DFE420700
	for <linux-doc@archiver.kernel.org>; Fri, 24 Apr 2020 15:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgDXP1J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Apr 2020 11:27:09 -0400
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:35284 "EHLO
        2.mo69.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgDXP1I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Apr 2020 11:27:08 -0400
Received: from player694.ha.ovh.net (unknown [10.108.35.59])
        by mo69.mail-out.ovh.net (Postfix) with ESMTP id BFFDA8A5DD
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 17:27:06 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player694.ha.ovh.net (Postfix) with ESMTPSA id B3E1C11A58320;
        Fri, 24 Apr 2020 15:26:59 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH] docs: virt/kvm: close inline string literal
Date:   Fri, 24 Apr 2020 17:26:37 +0200
Message-Id: <20200424152637.120876-1-steve@sk2.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 381117119294557646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This fixes

	Documentation/virt/kvm/amd-memory-encryption.rst:76: WARNING: Inline literal start-string without end-string.

Fixes: 2da1ed62d55c ("KVM: SVM: document KVM_MEM_ENCRYPT_OP, let userspace detect if SEV is available")
Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/virt/kvm/amd-memory-encryption.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/amd-memory-encryption.rst b/Documentation/virt/kvm/amd-memory-encryption.rst
index c3129b9ba5cb..57c01f531e61 100644
--- a/Documentation/virt/kvm/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/amd-memory-encryption.rst
@@ -74,7 +74,7 @@ should point to a file descriptor that is opened on the ``/dev/sev``
 device, if needed (see individual commands).
 
 On output, ``error`` is zero on success, or an error code.  Error codes
-are defined in ``<linux/psp-dev.h>`.
+are defined in ``<linux/psp-dev.h>``.
 
 KVM implements the following commands to support common lifecycle events of SEV
 guests, such as launching, running, snapshotting, migrating and decommissioning.
-- 
2.25.3

