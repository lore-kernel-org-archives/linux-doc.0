Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB670C77B7A
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jun 2023 03:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbjFLDIS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Jun 2023 23:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbjFLDIR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Jun 2023 23:08:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709F6E5E;
        Sun, 11 Jun 2023 20:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=KhOMNtlcjgZehppdSG2GsItKzclOm1yzvGrErxAo8fA=; b=1l8L/a3P+JrgjT49yhME4KdEL2
        r+BXcjTsGhewfNL0IZMBsq/BZSlaHT4UMXePUwFuUNFpK6T2t8PN0m3fsP7dcmSJ3UuYOmq9rXLue
        MVp+pM9YlCHknATOOvK6afrgvOGDazXxkuD/4NqlmgfK5j8eOw5u4PBFuhacVEa2Fcoro6oguD4wF
        PmdBj+M98VcthKkZEAIljZ+1O7cuGJEGv4o80aaw1VeKc4wlm/f4VoxqZab9bBDcNPuQmCJSNixTS
        Cy7ts6AiEJT9Zb7NbXbRNVsRj/DZCnBGcFlTfc40M5bVGOtH28WAq6UTfAAxmHLWdhiSiMGYkDJ3k
        BCyMcvng==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1q8Xuf-002P78-0N;
        Mon, 12 Jun 2023 03:08:13 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Alexander Graf <agraf@suse.de>,
        Andrew Jones <drjones@redhat.com>,
        Christoffer Dall <cdall@linaro.org>, kvm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 0/4] Documentation: KVM: multiple editing corrections
Date:   Sun, 11 Jun 2023 20:08:06 -0700
Message-ID: <20230612030810.23376-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix various issues in KVM documentation files (grammar, spelling,
punctuation, file path, wording, hyphenation, and the location of
module parameters).


 [PATCH 1/4] Documentation: KVM: make corrections to halt-polling.rst
 [PATCH 2/4] Documentation: KVM: make corrections to locking.rst
 [PATCH 3/4] Documentation: KVM: make corrections to ppc-pv.rst
 [PATCH 4/4] Documentation: KVM: make corrections to vcpu-requests.rst

 Documentation/virt/kvm/halt-polling.rst  |   10 +++++-----
 Documentation/virt/kvm/locking.rst       |   18 +++++++++---------
 Documentation/virt/kvm/ppc-pv.rst        |    8 ++++----
 Documentation/virt/kvm/vcpu-requests.rst |    6 +++---
 4 files changed, 21 insertions(+), 21 deletions(-)


Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: Andrew Jones <drjones@redhat.com>
Cc: Christoffer Dall <cdall@linaro.org>
Cc: kvm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
