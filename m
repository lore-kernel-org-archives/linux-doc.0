Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB9FEB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 18:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjFZSUk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbjFZSUe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 14:20:34 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5187E7B
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:24 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b7dec879e6so7883535ad.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687803624; x=1690395624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qTMxx/LJnmIWvUmH+gdz70kQEF0zmvOjZ2b4ibjV0JA=;
        b=S4eXFyS5rCCSmx6iv7PwkGg0BQvm/qIBJWemgkd6QqmzpVRLetRiUZjak1W1mQyzZr
         mMKoaj7RIcwyjjYeEciNW4ODHuDXAB0C13yWbXWuat885LfNkeAe1aW17ajmWdoYdpXC
         lk8VuAdGvlhi04z5vwImriXcHwbtXGq5yiwmyAeXX64MSqe0tt/49ZE3I4ee91HgxP3c
         zZI/w6Nc73N8LQ4zawaNdpS2epI7IexAi7Wb/yi0aenclZFLqPugb8wyTg5JeBEyxrHx
         Xt5PuAKkhVJcUdmnZRtHtS5GOOJqKuDtYqs0xkgs9jrVWM7sdTirDlmdiNS+WWD/3Ss3
         DLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687803624; x=1690395624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTMxx/LJnmIWvUmH+gdz70kQEF0zmvOjZ2b4ibjV0JA=;
        b=f/i5s0piOQuwb9cktQIog0KkaIarX6WvMHg9ynXCFvek2XANbPaazkR86wR20fEtXo
         gPIOoRcp1mEKMjhggbJ7jRk5rzveshGasfX+x+Dm4Qhh72mYsRF/IwErt8uJjKsTi0Jp
         oTcGxsO29en4SDdN7heR6iTvmic99jmpY/ffViTHnhteo1fos5vwaiDawrUvbs0TiyA+
         V3ulNP8IfrzDnvikwBKx7TL7h6gGl9bxxJQgbTeN3EHAvf9Vpl5JV09eMdPLG91uTBcp
         /DFX9py+OPVrgSVQSXB2m0FrsiyyeIZKxHC3VN3K2UG+E98gFoGXvGkb/aA8hTL4/zS4
         lXWg==
X-Gm-Message-State: AC+VfDyO8EwsYQNauk0EL/kDl2a7lAfXS5RIBPKjTi4gWcG2SFi9i0+v
        mjpjPXfBt+aDpaZdJT2vRiODC49H8ifF
X-Google-Smtp-Source: ACHHUZ552kVkUSFqA9TwyT8wN0iazFX/dbob8KYbdGOsmC7IlUncgj9SPNf6gA/YueLd90akYh2M8MrAKzKf
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a17:902:b608:b0:1b5:bd8:5aaa with SMTP id
 b8-20020a170902b60800b001b50bd85aaamr1078296pls.1.1687803624119; Mon, 26 Jun
 2023 11:20:24 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Mon, 26 Jun 2023 18:20:12 +0000
In-Reply-To: <20230626182016.4127366-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230626182016.4127366-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230626182016.4127366-3-mizhang@google.com>
Subject: [PATCH v2 2/6] KVM: Documentation: Update the field name gfns and its
 description in kvm_mmu_page
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mingwei Zhang <mizhang@google.com>,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the field 'gfns' in kvm_mmu_page to 'shadowed_translation' to be
consistent with the code. Also update the corresponding 'gfns' in the
comments. The more detailed description of 'shadowed_translation' is
already inlined in the data structure definition, so no need to duplicate
the text but simply just update the names.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 561efa8ec7d7..4c9044b4dc6c 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -221,11 +221,12 @@ Shadow pages contain the following information:
     at __pa(sp2->spt).  sp2 will point back at sp1 through parent_pte.
     The spt array forms a DAG structure with the shadow page as a node, and
     guest pages as leaves.
-  gfns:
-    An array of 512 guest frame numbers, one for each present pte.  Used to
-    perform a reverse map from a pte to a gfn. When role.direct is set, any
+  shadowed_translation:
+    An array of 512 shadow translation entries, one for each present pte. Used
+    to perform a reverse map from a pte to a gfn. When role.direct is set, any
     element of this array can be calculated from the gfn field when used, in
-    this case, the array of gfns is not allocated. See role.direct and gfn.
+    this case, the array of shadowed_translation is not allocated. See
+    role.direct and gfn.
   root_count:
     A counter keeping track of how many hardware registers (guest cr3 or
     pdptrs) are now pointing at the page.  While this counter is nonzero, the
-- 
2.41.0.162.gfafddb0af9-goog

