Return-Path: <SRS0=2XaJ=CS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1D5C43461
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 17:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E39EA20C09
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 17:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599670821;
	bh=uLH29+h7YlpXp0k6oyJF5A9Uyq6qiCy/TfyqmVLAY+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZDEaKPNjit5w25AUwMICqfPY4F4iIel6T9AKblpjojQDKC/ORHGYElLA4Nt81SC1c
	 WqDgIkHS/k1psWKs2ciN1aQvYRrDjttR+/Nh0eMMdWfE1eGQlXqgiuSnQgqQHFk3cW
	 iBl/HsZjNb+APkQ+YNS8D+Iif+Nq9ok97knUt5zo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731187AbgIIRAE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Sep 2020 13:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:51814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730654AbgIIPvM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 Sep 2020 11:51:12 -0400
Received: from mail.kernel.org (ip5f5ad5d6.dynamic.kabel-deutschland.de [95.90.213.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55DC1221EC;
        Wed,  9 Sep 2020 14:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599660665;
        bh=uLH29+h7YlpXp0k6oyJF5A9Uyq6qiCy/TfyqmVLAY+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cuto1eLPmXEcxUzsMN+4nPrSLUx1ytHkkVH33ze4u155IWtpY2P1K9pdT90i5QOwI
         WPnIHRGyQew75QTkx9H9g2yPRVz1EfZ0RNmAjwXJURC5vPjgzaS95ovctuYQjTgsNP
         uFlHcaJJwMd1N+2Ncb82tqqTNpV6/nwOlcmIDcQE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kG0oR-00DUXH-Gh; Wed, 09 Sep 2020 16:11:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/30] docs: kvm: api.rst: add missing spaces
Date:   Wed,  9 Sep 2020 16:10:48 +0200
Message-Id: <b6b3679b6c2329dc9b16d397c289b5ade0184c63.1599660067.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599660067.git.mchehab+huawei@kernel.org>
References: <cover.1599660067.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are some warnings:

   Documentation/virt/kvm/api.rst:4354: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/virt/kvm/api.rst:4358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/virt/kvm/api.rst:4363: WARNING: Definition list ends without a blank line; unexpected unindent.

Produced by the lack of identation on a single line. That
caused the literal block to end prematurely.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index d2b733dc7892..24e8046ec083 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -4343,7 +4343,7 @@ Errors:
   #define KVM_STATE_NESTED_VMX_SMM_GUEST_MODE	0x00000001
   #define KVM_STATE_NESTED_VMX_SMM_VMXON	0x00000002
 
-#define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE 0x00000001
+  #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE 0x00000001
 
   struct kvm_vmx_nested_state_hdr {
 	__u64 vmxon_pa;
-- 
2.26.2

