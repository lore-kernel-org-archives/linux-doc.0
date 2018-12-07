Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 743127D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 12:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbeLGMta (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 07:49:30 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41873 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbeLGMt2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Dec 2018 07:49:28 -0500
Received: by mail-wr1-f66.google.com with SMTP id x10so3679517wrs.8
        for <linux-doc@vger.kernel.org>; Fri, 07 Dec 2018 04:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ibxTSM7aAfMxp0mh34e5XoCF9bu27Z34+6gCZTrPT34=;
        b=ZtGj2HHQ1QdQqkzxKnkhyG6zbN40ooJhtxiFxmtMZB2G6JXMbNVeLRlBclZc1ByuBt
         rJkGbokdWxQ0B4Z/lVF47mJXfpvZg6onuNs38evpR6F0plHgzidl0tnlt5rJTh3WpIX0
         xXvr8J/Yp27UtUoFGtdUgpFJ6up0leTOytBXoBP3vyuv2whs8HO6r7g4e5dNAiOckiEq
         S4Jkfj+slyqpYESweAypsVAe8xa4+M+/i961soZgwCd01iqS8UtJC/jK7GFRWxJ15VKF
         iteVo2+659CaouRtxIESOgKb838vu10UoGWA0UJYtGjsBcL2ia6Cz6nFHafS5PeNz3tx
         ntcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ibxTSM7aAfMxp0mh34e5XoCF9bu27Z34+6gCZTrPT34=;
        b=L4rElb7T3USE9I607cvgfpxCm+FnUivkly3HkafDZIHXZySlKzeGya1WNzDUaOF4hI
         s4Qp7Wca2JH2uK2lNKEtCV2AOJG/s2iaBC3kFm5LTTQIUpaglQvvJ0iucFvZqqTdvM8A
         DhO/RrMPqceAyWU2I0kLgWPceldT3iDgPiMiQPDtbTTz4Xaqxx8hyjlNRUPLjPF7qOKi
         4IGmpSH0nvLo/2mkmaHkp4VwrSktRyVBizytw0CJm18dNDojC8SMDoQ9ionsN4HDvA/J
         bJRcZDQQuVKI3pGxamYzRsWZPPiwNYisZnStlSGjhaNP9Ta/Q61TX8r/1Vyf6hodCplE
         HIXg==
X-Gm-Message-State: AA+aEWZtr+wwnN7b8KHyP371fnkHIPZzZx3MMzfbVEY5WwlbiJY4uOsv
        THmIsGClr+une6tOGw72vq1uYg==
X-Google-Smtp-Source: AFSGD/XycEJqUK3+cMbWlXGqoLuR+oFh9trApfppGt82EltYcdXfLPRSVVY6b30XONttXSMdK4nsLQ==
X-Received: by 2002:adf:c846:: with SMTP id e6mr1624715wrh.243.1544186966936;
        Fri, 07 Dec 2018 04:49:26 -0800 (PST)
Received: from localhost.localdomain ([156.213.98.90])
        by smtp.gmail.com with ESMTPSA id i192sm4362949wmg.7.2018.12.07.04.49.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Dec 2018 04:49:26 -0800 (PST)
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
Subject: [PATCH 08/10] KVM: X86: Port ROE_MPROTECT_CHUNK to x86
Date:   Fri,  7 Dec 2018 14:48:01 +0200
Message-Id: <20181207124803.10828-9-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
References: <20181207124803.10828-1-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Apply d->memslot->partial_roe_bitmap to shadow page table entries
too.

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
---
 arch/x86/kvm/roe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/roe.c b/arch/x86/kvm/roe.c
index f787106be8..700f69823b 100644
--- a/arch/x86/kvm/roe.c
+++ b/arch/x86/kvm/roe.c
@@ -25,11 +25,14 @@ static bool __rmap_write_protect_roe(struct kvm *kvm,
 	struct rmap_iterator iter;
 	bool prot;
 	bool flush = false;
+	void *full_bmp =  memslot->roe_bitmap;
+	void *part_bmp = memslot->partial_roe_bitmap;
 
 	for_each_rmap_spte(rmap_head, &iter, sptep) {
 		int idx = spte_to_gfn(sptep) - memslot->base_gfn;
 
-		prot = !test_bit(idx, memslot->roe_bitmap) && pt_protect;
+		prot = !(test_bit(idx, full_bmp) || test_bit(idx, part_bmp));
+		prot = prot && pt_protect;
 		flush |= spte_write_protect(sptep, prot);
 	}
 	return flush;
-- 
2.19.2

