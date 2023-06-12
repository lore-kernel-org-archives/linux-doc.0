Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E963AC7EE23
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jun 2023 03:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbjFLDIc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Jun 2023 23:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233567AbjFLDIR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Jun 2023 23:08:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9C9E68;
        Sun, 11 Jun 2023 20:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=fOE6Ra8njD0psF8yweu+6OMqM09Aiea1FRmZ+yo9rtc=; b=LZsIqmVCqBomAQFE39iASpfFOt
        CM38Ky0Ly+ZCS3U2b0+G7kY6yDed/sgKixwmb66WOEZ/mtIUIuteGq1QXzuvUPi6ocyhXWwd1MjKn
        p+3o6x4wA7zkGWFjGGqZ/b66SZBJUiiWme3MPXPsuop5bl9VqA3N5jfnFRJSaB8PQi0DhIWUq7uak
        KYL6owcb0nwL5wkTT10qvsYRKyoknOs+huuLmrPdOmnjMAquvXrXMcdRBIgH0jCZS5P4MJuaP/Vr6
        NFhwJQYO9IinRb2Id/Yi7cgwDjMs1fIHKAFwClHuPUDaxTPrkFfjTGJnzFGKbd7jG7PvaxDS75lcC
        9qHE2iMA==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1q8Xug-002P78-2c;
        Mon, 12 Jun 2023 03:08:14 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Christoffer Dall <cdall@linaro.org>, kvm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 4/4] Documentation: KVM: make corrections to vcpu-requests.rst
Date:   Sun, 11 Jun 2023 20:08:10 -0700
Message-ID: <20230612030810.23376-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612030810.23376-1-rdunlap@infradead.org>
References: <20230612030810.23376-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Make corrections to punctuation and grammar.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Andrew Jones <drjones@redhat.com>
Cc: Christoffer Dall <cdall@linaro.org>
Cc: kvm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/virt/kvm/vcpu-requests.rst |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -- a/Documentation/virt/kvm/vcpu-requests.rst b/Documentation/virt/kvm/vcpu-requests.rst
--- a/Documentation/virt/kvm/vcpu-requests.rst
+++ b/Documentation/virt/kvm/vcpu-requests.rst
@@ -101,7 +101,7 @@ also be used, e.g. ::
 
 However, VCPU request users should refrain from doing so, as it would
 break the abstraction.  The first 8 bits are reserved for architecture
-independent requests, all additional bits are available for architecture
+independent requests; all additional bits are available for architecture
 dependent requests.
 
 Architecture Independent Requests
@@ -151,8 +151,8 @@ KVM_REQUEST_NO_WAKEUP
 
   This flag is applied to requests that only need immediate attention
   from VCPUs running in guest mode.  That is, sleeping VCPUs do not need
-  to be awaken for these requests.  Sleeping VCPUs will handle the
-  requests when they are awaken later for some other reason.
+  to be awakened for these requests.  Sleeping VCPUs will handle the
+  requests when they are awakened later for some other reason.
 
 KVM_REQUEST_WAIT
 
