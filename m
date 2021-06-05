Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CF4C48BE8
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 13:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A64316141D
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 13:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhFENUl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Jun 2021 09:20:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:35324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhFENU1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A20EB6145F;
        Sat,  5 Jun 2021 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899118;
        bh=HY4ADwiftCI1A8ob2cFjNLvghYbjM2GrKGmwzrBsOJc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UxK8zmQPG4tYb5m4CKJ26E82Jnku4cqkeWio+nrPQioEU4moBZIJhnq07dNyN09xI
         +sdtDBbaBjfPj5xl6m29OIkqtGFj8A3XKNqNcOGT10u6TMDRBxgBVXqRxMBxob2+Z1
         95Ci4w77+TbGsYD5Ey72ysZjs078/j7DILTXrTQSggjx9WEqeeBfF2z0G/PfI4mp1O
         Xq3CwN6oMwACbHtce2veyHBhB4ipQSAJsqMY6i1l/vbiRuPiDdDpT8ByOXdu2gfeRl
         DDhBI8+aFw5sPIrIMRz/ACodWtEtE364qdSxHK3SvywkIIsPfrWgpmwIpjguY9sfaq
         RX7YKP9gNME9A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCC-008GGb-TV; Sat, 05 Jun 2021 15:18:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 33/34] docs: virt: kvm: s390-pv-boot.rst: avoid using ReSt :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:32 +0200
Message-Id: <75c730ab60a13cc941e6b96d897190030f70f85e.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/kvm/s390-pv-boot.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/s390-pv-boot.rst b/Documentation/virt/kvm/s390-pv-boot.rst
index ad1f7866c001..73a6083cb5e7 100644
--- a/Documentation/virt/kvm/s390-pv-boot.rst
+++ b/Documentation/virt/kvm/s390-pv-boot.rst
@@ -10,7 +10,7 @@ The memory of Protected Virtual Machines (PVMs) is not accessible to
 I/O or the hypervisor. In those cases where the hypervisor needs to
 access the memory of a PVM, that memory must be made accessible.
 Memory made accessible to the hypervisor will be encrypted. See
-:doc:`s390-pv` for details."
+Documentation/virt/kvm/s390-pv.rst for details."
 
 On IPL (boot) a small plaintext bootloader is started, which provides
 information about the encrypted components and necessary metadata to
-- 
2.31.1

