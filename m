Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 370537D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 17:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbfAGRwq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 12:52:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51994 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728555AbfAGRwp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Jan 2019 12:52:45 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A68C62D7EC;
        Mon,  7 Jan 2019 17:52:45 +0000 (UTC)
Received: from turbo.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 14BC9105705A;
        Mon,  7 Jan 2019 17:52:42 +0000 (UTC)
From:   Christophe de Dinechin <dinechin@redhat.com>
To:     kvm@vger.kernel.org
Cc:     =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Eric Skultety <eskultet@redhat.com>, trivial@kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/virtual/kvm: Update URL for AMD SEV API specification
Date:   Mon,  7 Jan 2019 18:52:38 +0100
Message-Id: <20190107175238.3026-1-dinechin@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 07 Jan 2019 17:52:45 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The URL of [api-spec] in Documentation/virtual/kvm/amd-memory-encryption.rst
is no longer valid, replaced space with underscore.

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 Documentation/virtual/kvm/amd-memory-encryption.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virtual/kvm/amd-memory-encryption.rst b/Documentation/virtual/kvm/amd-memory-encryption.rst
index 71d6d257074f..659bbc093b52 100644
--- a/Documentation/virtual/kvm/amd-memory-encryption.rst
+++ b/Documentation/virtual/kvm/amd-memory-encryption.rst
@@ -242,6 +242,6 @@ References
 ==========
 
 .. [white-paper] http://amd-dev.wpengine.netdna-cdn.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
-.. [api-spec] http://support.amd.com/TechDocs/55766_SEV-KM%20API_Specification.pdf
+.. [api-spec] http://support.amd.com/TechDocs/55766_SEV-KM_API_Specification.pdf
 .. [amd-apm] http://support.amd.com/TechDocs/24593.pdf (section 15.34)
 .. [kvm-forum]  http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
-- 
2.17.2

