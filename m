Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF4FC433EF
	for <linux-doc@archiver.kernel.org>; Sat,  4 Dec 2021 18:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385464AbhLDS0t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Dec 2021 13:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385425AbhLDS0o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Dec 2021 13:26:44 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBFCC061354
        for <linux-doc@vger.kernel.org>; Sat,  4 Dec 2021 10:23:18 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id m25so6782155qtq.13
        for <linux-doc@vger.kernel.org>; Sat, 04 Dec 2021 10:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hNWUjIP6M+9jPI+vposr8tFgZkSkkk9G+fV/J+7EQZQ=;
        b=fRvrFl+ZUsP8YgYmwsY1wh4fbEH5xW0O3WGGtse/NvrWFVQOq6gipmotIYRvISTr6E
         DypH3yV9YKSQTU82KmCL2OxJ4EyfidtygXngmUoCjt4Y2EksD0A1SI/rHoVSZaXDC0qE
         sc6uVc0z8jSiKNSlTsH0zYzJefEV31IrwmegJuim79SUOnpUHYCCY+fyE2zSAfXdCFYQ
         M+LNFSwKkB9KiJAETFpfahVg2XOFrVdthRidPGv7kWy+iW7MHnEKT7Dnsf6Xd2f6wXDU
         qGczVbb49JYE80fT6RtKM9fl/BMxLbPWismHftnIlHvPyxCj7gEQdjiHTo8Ry7+Evv5D
         wSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hNWUjIP6M+9jPI+vposr8tFgZkSkkk9G+fV/J+7EQZQ=;
        b=cduRWw3/kaoQjbq73HUMx7GE7nmxQm5kmA3Fr7p+O+OJN1ikQEPFd5o7MkFJDvHQZc
         VoQbqd/pAOxyi79LnNzSpRVWQ7UIQ8HoB/cHmqYLsvwF9C5DR/oB/zdbjdJi4BSqb6OZ
         lKEkfy5Rij0OsZMIa6NX+45K9ZsBoIuC6fsfwqvrIpUlqCCx1PI9yMGwKArwruDeHSZs
         VZZtNCqbrQcyXfccUCAh847G2B2VG3UT0WOwnCzh8ePF1cAy6U7bD8lc2T265xZ/wk1H
         PnBRdt1x2qiwEUXpKZEPu1FuGd2P/uqTLi99NLq/Hlgg09Sp5NMAEmiflgz870rUSHrE
         Mx4w==
X-Gm-Message-State: AOAM532xfqRtQmQyPVz4cLFkFcvTEwdsVGjVu9GakmWyq1ow/MG90RIO
        TBRra3flqZMrX0mHI7Ky0P+syw==
X-Google-Smtp-Source: ABdhPJwWZZAgKMoQjM20Hfm2l8Xhw16kkBrBW0fQZy6x5UNzU69TTIE4oP7xryf8nJ8G1uuLy1Nyjw==
X-Received: by 2002:a05:622a:1a93:: with SMTP id s19mr28510554qtc.291.1638642198043;
        Sat, 04 Dec 2021 10:23:18 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id a24sm4394728qtp.95.2021.12.04.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 10:23:17 -0800 (PST)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, rientjes@google.com, pjt@google.com,
        weixugc@google.com, gthelen@google.com, mingo@redhat.com,
        corbet@lwn.net, will@kernel.org, rppt@kernel.org,
        keescook@chromium.org, tglx@linutronix.de, peterz@infradead.org,
        masahiroy@kernel.org, samitolvanen@google.com,
        dave.hansen@linux.intel.com, x86@kernel.org, frederic@kernel.org,
        hpa@zytor.com, aneesh.kumar@linux.ibm.com, jirislaby@kernel.org,
        songmuchun@bytedance.com, qydwhotmail@gmail.com
Subject: [PATCH v2 1/4] mm: change page type prior to adding page table entry
Date:   Sat,  4 Dec 2021 18:23:11 +0000
Message-Id: <20211204182314.1470076-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211204182314.1470076-1-pasha.tatashin@soleen.com>
References: <20211204182314.1470076-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In do_swap_page() we first insert the entry into user page table, and
later change the struct page to indicate that this is anonymous page.

In all other places we first configure the page metadata and then insert
entries into the page table.

While odd, the behaviour is benign. Page table check, however, will use
the information from struct page to verify the type of entry is
inserted.

Change the order in do_swap_page() to first update struct page, and later
insert pte entry into the page table.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/memory.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index ced3274c3deb..9eef54950910 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3635,9 +3635,6 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		pte = pte_mkuffd_wp(pte);
 		pte = pte_wrprotect(pte);
 	}
-	set_pte_at(vma->vm_mm, vmf->address, vmf->pte, pte);
-	arch_do_swap_page(vma->vm_mm, vma, vmf->address, pte, vmf->orig_pte);
-	vmf->orig_pte = pte;
 
 	/* ksm created a completely new copy */
 	if (unlikely(page != swapcache && swapcache)) {
@@ -3647,6 +3644,10 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		do_page_add_anon_rmap(page, vma, vmf->address, exclusive);
 	}
 
+	set_pte_at(vma->vm_mm, vmf->address, vmf->pte, pte);
+	arch_do_swap_page(vma->vm_mm, vma, vmf->address, pte, vmf->orig_pte);
+	vmf->orig_pte = pte;
+
 	swap_free(entry);
 	if (mem_cgroup_swap_full(page) ||
 	    (vma->vm_flags & VM_LOCKED) || PageMlocked(page))
-- 
2.34.1.400.ga245620fadb-goog

