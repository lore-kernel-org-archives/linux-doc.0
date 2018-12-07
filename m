Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8768C7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 12:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbeLGMtE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 07:49:04 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40676 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbeLGMtE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Dec 2018 07:49:04 -0500
Received: by mail-wr1-f68.google.com with SMTP id p4so3689474wrt.7
        for <linux-doc@vger.kernel.org>; Fri, 07 Dec 2018 04:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qskwDCENsUJ4XJZgk7mw/D1NJ3EoY/jK2YNM77334Jg=;
        b=eBzgdhktIQ137s6FC7u+gCPBBBDYqLbuh6vzpN/BbPDS8ZmYTwukPjotz750UMPraN
         9HElqnTsb3BVtqBDTmatcs6c5vRRC6ySaruowAOc/ZDEVkf8Ba0b6lh1zZwRFTrY9hhr
         5MsheYQX6J4rTN0AyUyjB6thGWbLL3fcwC++9dqW6NJncg/te3AAKOIsfaPNXs4ON0TN
         O2EPUrg5aM3H2zIUOwdZgzNB7y3LJeDGitoPb514EJhQFRWIAT6hVpiuu7F8dMDWc4tM
         d3pVVADpadqjuH41NgKjOei5dzGkHqnjGFJpWPZyxQVktCEUlB44/Gy6K2LTYgOP5nv7
         2MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qskwDCENsUJ4XJZgk7mw/D1NJ3EoY/jK2YNM77334Jg=;
        b=L8XCNYas5XN4D/MHAxGtH+PC+v/3OKLMCADX97BGP0EvtU1CfOQoANN9ulTYk4mToy
         sv/avMSWzfw+lS883RZJToNlJNR4LGesW5/M1IIq8SDOkSr+BFMflPtTBNfhkUQpx6pN
         hG0+tiLsVIdpln9SLTwmK4DtECZ71OIHBC6256FM6F5bTBJ+CinbyQzsPwvmzkDI6Wvr
         MsaWoiRepD1TZi1/lkn2Od9jsR7zJ6WQjmpFniDfLpF3vgQJG9BjhVpkLxaOnJD0FIS/
         bepZhUzF0pfHCTzADKNBkhELSwQ2Og9f+g+ALDDvU+tnSske/GEGsM+NoTfBDflUYAU3
         oxXg==
X-Gm-Message-State: AA+aEWbF2CO/0iDKrlBYaKmJc3NmmbaqkQdZ8/oCTdVATCN3+vBB0Gnx
        XYWPrRbXSZyhOFhEc+sI/qh4tA==
X-Google-Smtp-Source: AFSGD/XonZe40VF9RnZ4mhjjnNirD7PlzbAwQIiqaTMt5AApa7uw7RM0qOskDpWMLKRL1BmCis9VEA==
X-Received: by 2002:adf:a4d9:: with SMTP id h25mr1582875wrb.167.1544186942211;
        Fri, 07 Dec 2018 04:49:02 -0800 (PST)
Received: from localhost.localdomain ([156.213.98.90])
        by smtp.gmail.com with ESMTPSA id i192sm4362949wmg.7.2018.12.07.04.48.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Dec 2018 04:49:01 -0800 (PST)
From:   Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
To:     Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahmedsoliman0x666@gmail.com, ovich00@gmail.com,
        kernel-hardening@lists.openwall.com, nigel.edwards@hpe.com,
        Boris Lukashev <blukashev@sempervictus.com>,
        Igor Stoppa <igor.stoppa@gmail.com>
Cc:     Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
Subject: [PATCH 03/10] KVM: X86: Add helper function to convert SPTE to GFN
Date:   Fri,  7 Dec 2018 14:47:56 +0200
Message-Id: <20181207124803.10828-4-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
References: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
---
 arch/x86/kvm/mmu.c | 7 +++++++
 arch/x86/kvm/mmu.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
index b67d743c33..a300e4acb8 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -1024,6 +1024,13 @@ static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index)
 
 	return sp->gfn + (index << ((sp->role.level - 1) * PT64_LEVEL_BITS));
 }
+gfn_t spte_to_gfn(u64 *spte)
+{
+	struct kvm_mmu_page *sp;
+
+	sp = page_header(__pa(spte));
+	return kvm_mmu_page_get_gfn(sp, spte - sp->spt);
+}
 
 static void kvm_mmu_page_set_gfn(struct kvm_mmu_page *sp, int index, gfn_t gfn)
 {
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index c7b333147c..49d7f2f002 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -211,4 +211,5 @@ void kvm_mmu_gfn_allow_lpage(struct kvm_memory_slot *slot, gfn_t gfn);
 bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn);
 int kvm_arch_write_log_dirty(struct kvm_vcpu *vcpu);
+gfn_t spte_to_gfn(u64 *sptep);
 #endif
-- 
2.19.2

