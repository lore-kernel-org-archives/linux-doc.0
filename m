Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C3CC001DF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 00:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjHAAVj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 20:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjHAAVg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 20:21:36 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C785133
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:34 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-583da2ac09fso61477357b3.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 17:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690849293; x=1691454093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MiBo42sK/GMXkVAkei5JHweORvWMqcmgUZYS33J6fF0=;
        b=xCOyw96l+NGIsCoqla91ojMChbo7SK0mxjsBS5En4m6U8FZuat4rWttoEUC2kEUlRC
         Kc5Tdi3f/aC074kdK9WPVcbpEqFOD5snoJtJRh/GW8NPp7DdzGioQ2jCQ53aKAAMVNgV
         H5LOLNlPJaayXRR+pgE4o+eqbb3X+xSKM0jo1106+iKscpzsP1EGPa0ydb/aj4FLtxsY
         0donlqAlwXUUmCYafnPKmqmI1HPi+8LHmgKCNUbUmu3rVwJ7KhsLSWeNCX/OGzUbsggN
         aeRLetSPiTZb1U7EoSaftIT6N09FIkj+uoCbe5WsmP3ETqmIpdraN0k9VEsoVBooWVQW
         kbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849293; x=1691454093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiBo42sK/GMXkVAkei5JHweORvWMqcmgUZYS33J6fF0=;
        b=ZzY9bKrMY8hdA3I33CHb4rkRxrSAT135GuIVlYslxDvIBxSZ7VgNKubN9kprxyRTLe
         9sjipYjYm5vk7Jq5jnJJueoP2nHX50HLnQeRcBTD0Y4qGUE7L3GXODMGioTDLD64eDRk
         B2ALo+Sgv+nzHn6RAFqrcuDYXuQZcYLmdT7lZPaLfz5smsH7YY6Kr4ezXoVk4lAEYdqn
         OmA6VWGdTs6Tt2bKrMHel0NUCTHYrLxI09YRkNClLifZWM89zTLBc60xgggliqaMGg3V
         bMtUHQtk72PtSWa03uUeooxHHSoSbaoiu6Y6KwNpOKHGwBjVl7e1bF/9pHcXdmVrLwR7
         8RiQ==
X-Gm-Message-State: ABy/qLa4vnvz0uDX91xBLrlUw8LhVW/X38XlGYSbWMPyH4qbdQdl9vWv
        Bi1oTf/ibWU/DFPn8wdXCHh1FY7wptnk
X-Google-Smtp-Source: APBJJlGpUWg+0m6Di2ciPKp63ZPdDfCAbOAGMntPsJDwNxKLL6tSalkKPOVTHrd+Kt2b4p6aLGkz6Mdh0g5v
X-Received: from mizhang-super.c.googlers.com ([34.105.13.176]) (user=mizhang
 job=sendgmr) by 2002:a81:b710:0:b0:576:92da:cd3d with SMTP id
 v16-20020a81b710000000b0057692dacd3dmr79492ywh.8.1690849293487; Mon, 31 Jul
 2023 17:21:33 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Tue,  1 Aug 2023 00:21:22 +0000
In-Reply-To: <20230801002127.534020-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230801002127.534020-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230801002127.534020-3-mizhang@google.com>
Subject: [PATCH v3 2/6] KVM: Documentation: Update the field name gfns and its
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
        Zhi Wang <zhi.wang.linux@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
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
 Documentation/virt/kvm/x86/mmu.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 561efa8ec7d7..35e642303962 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -221,11 +221,14 @@ Shadow pages contain the following information:
     at __pa(sp2->spt).  sp2 will point back at sp1 through parent_pte.
     The spt array forms a DAG structure with the shadow page as a node, and
     guest pages as leaves.
-  gfns:
-    An array of 512 guest frame numbers, one for each present pte.  Used to
-    perform a reverse map from a pte to a gfn. When role.direct is set, any
-    element of this array can be calculated from the gfn field when used, in
-    this case, the array of gfns is not allocated. See role.direct and gfn.
+  shadowed_translation:
+    An array of 512 shadow translation entries, one for each present pte. Used
+    to perform a reverse map from a pte to a gfn as well as its access
+    permission. When role.direct is set, the shadow_translation array is not
+    allocated. This is because the gfn contained in any element of this array
+    can be calculated from the gfn field when used.  In addition, when
+    role.direct is set, KVM does not track access permission for each of the
+    gfn. See role.direct and gfn.
   root_count:
     A counter keeping track of how many hardware registers (guest cr3 or
     pdptrs) are now pointing at the page.  While this counter is nonzero, the
-- 
2.41.0.585.gd2178a4bd4-goog

