Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E5F667D161
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 08:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbfAUIaA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 03:30:00 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55882 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfAUIaA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jan 2019 03:30:00 -0500
Received: by mail-wm1-f67.google.com with SMTP id y139so9784905wmc.5
        for <linux-doc@vger.kernel.org>; Mon, 21 Jan 2019 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=juz3/8ubyO70o/WwTakdDVvsVYAiN+8d71XTlXhc8d0=;
        b=gnuyvR2bnuLilcd7+9IZF+J+o8w0XrNB/1Xkz7HCGSUq9qPW+NOUi/WjYSQqOIbFY6
         zLE2d9gMubbXqFn/RyND6TvDIfdb/L+z0gY/VXI5CSIrtblIhzSkrwfO9Z3V+IZ3pvOf
         OgWoTmijDHQtTrwB5UKFvw62XDi3VPUnfQJz+ZgdTCd6RSzSyBC7iwapfZxpAHiNfiBX
         pBvS382M8jVHkBZVPVELstfsb3pvL6o7J+IpQFEUIL3qZGuiRXIiQ8eWV08tqCEpZ3k+
         StfsIH+p6gK7RZjheXduzukbYDmmTJja/NEELPCmFu5nVOPQKZ38nUuJFdcfezgwc4gg
         o3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=juz3/8ubyO70o/WwTakdDVvsVYAiN+8d71XTlXhc8d0=;
        b=UE99CSnZ9R0qv4M4+4O31Wwj2ersbbpNnsHNTqswnDK3vCrKs/LAVGrpKqDjLtkN72
         Q4LLbqN61YJTZgUFYuBQQNt245hJX9TuH1fGu9zk4i1xD1dKkX65xDUbjigAGQja71cy
         +ki2ey7pEuviUn1bFozPr37fC+rwjEDVD4wUhv9g8BCS9P7cJzMcJRmvLjFbjoaUCKVH
         amNQFMamHi7gUYcVkKjN67bIm1tRlKbWTuAfSQxwPrM1SpXLfOQdNW1PX6RnL+8NyyMv
         FRUcIXhcAZ/SFoaXTfVGNsxXHXJkxDI5ef0k7IzdgWAgknaBbp9H8zGRMHw/Gcow7HA4
         ilTw==
X-Gm-Message-State: AJcUukdrBybyu2+MjfXXLZwMfX6WLyZ1fiowne8ETg+Y7jFL+8HU75uo
        3HX5tyhF4dwPzkdr9av7TsGcfQ==
X-Google-Smtp-Source: ALg8bN4jEjW9am+Xzj8QcDzzmQ0pxFo+cktjow7q+YKP8Hur7vhk7wc+PrdAJwB7Juu+8w+lON7BAA==
X-Received: by 2002:a1c:2c6:: with SMTP id 189mr22057938wmc.21.1548027673915;
        Sun, 20 Jan 2019 15:41:13 -0800 (PST)
Received: from localhost.localdomain ([156.212.82.83])
        by smtp.gmail.com with ESMTPSA id e9sm76576753wro.16.2019.01.20.15.41.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Jan 2019 15:41:13 -0800 (PST)
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
Subject: [RESEND PATCH V8 03/11] KVM: X86: Add helper function to convert SPTE to GFN
Date:   Mon, 21 Jan 2019 01:39:32 +0200
Message-Id: <20190120233940.15282-4-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
References: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
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
index 098df7d135..bbfe3f2863 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -1053,6 +1053,13 @@ static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index)
 
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

