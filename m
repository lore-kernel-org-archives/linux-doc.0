Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FC157D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 09:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbfAUJAG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 04:00:06 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41243 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbfAUJAG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jan 2019 04:00:06 -0500
Received: by mail-wr1-f65.google.com with SMTP id x10so22263755wrs.8
        for <linux-doc@vger.kernel.org>; Mon, 21 Jan 2019 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vs+bNFu0yF1CxUiI9KZwr438wTX73TGD5F830H4iAIA=;
        b=oQMSxgeWwvX3fxnLAJIhrPzeISSSa757Vq1K2z2xXFfbGMJNm+mNFmdOPlzRygbHlM
         5zGbjPbW/hSEvWy7F/KCTZPeDnl5hL7P+Eii3cu15r4wxdMTY/0ArkUF1lrhPq5GTHH5
         41MAsV9b64OSoAX8RNfLkmyk8/yZ/7splCiI41pnzF41mDlZ23BPaAhUKQYcLqO5RvrO
         liU9DxfBLkv4OPAlj3EIOvJxvWAiT60VeLXoQLD+nF5QpktvP0XtDD2hWckJMVWt8cYH
         W9VbmZW81UdFbBnNEYvZOG3QTqFEgACaCl4c0Xu8L/9eZnihyWQvBa2cjjWc3oeG0thY
         CXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vs+bNFu0yF1CxUiI9KZwr438wTX73TGD5F830H4iAIA=;
        b=NUQ9KvJe+wuVujYnh/mkY7WteMxDsqAqOAwRy4fC0J+owLHh/LNfqN3fqZgi65ImOS
         8sxyF+XaX88n3UkV4UTrPhvOyTrWWQV8q6DIA/+8dB1iuhKacWqrJvSsY4/CrWu2UAJH
         Z2CZINgrkNeUs2w/740tN6znDID44D4BIy/cXyM8WkRxRv5UGz/3KFthEFA0IOgpY92k
         ZaFtnhXX7TNsKEYjhWoq1IlJUS37e7Okt1ngAQ2HD98B5+Y3ckTN8av4McLLUH6R4A+f
         EqfXTReaDH9ZGkwSOnOoiJbXFMagRGmVQRgP5G8NEF7hUAF6XkExMe6rCJDsZerHnYGG
         YueA==
X-Gm-Message-State: AJcUukeG32mLrXgWaR3/EXOPQx/HoOCDx5MKuBxYOtIl+Gy+s8A9usYI
        6cxcaxgDKHSpl7Okudf58YkxaQv6ty8=
X-Google-Smtp-Source: ALg8bN5FZlmXzIT2hTz+cxotHPasI5Ywv/1TMW+F1EmUBuKhIt3uhvjkzNB2etOELjfHhmG1GUQ/rQ==
X-Received: by 2002:adf:f605:: with SMTP id t5mr24033912wrp.229.1548027665620;
        Sun, 20 Jan 2019 15:41:05 -0800 (PST)
Received: from localhost.localdomain ([156.212.82.83])
        by smtp.gmail.com with ESMTPSA id e9sm76576753wro.16.2019.01.20.15.41.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Jan 2019 15:41:05 -0800 (PST)
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
Subject: [RESEND PATCH V8 01/11] KVM: State whether memory should be freed in kvm_free_memslot
Date:   Mon, 21 Jan 2019 01:39:30 +0200
Message-Id: <20190120233940.15282-2-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
References: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The conditions upon which kvm_free_memslot are kind of ad-hock,
it will be hard to extend memslot with allocatable data that needs to be
freed, so I replaced the current mechanism by clear flag that states if
the memory slot should be freed.

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>
---
 virt/kvm/kvm_main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1f888a103f..2f37b4b6a2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -548,9 +548,10 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
  * Free any memory in @free but not in @dont.
  */
 static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *free,
-			      struct kvm_memory_slot *dont)
+			      struct kvm_memory_slot *dont,
+			      enum kvm_mr_change change)
 {
-	if (!dont || free->dirty_bitmap != dont->dirty_bitmap)
+	if (change == KVM_MR_DELETE)
 		kvm_destroy_dirty_bitmap(free);
 
 	kvm_arch_free_memslot(kvm, free, dont);
@@ -566,7 +567,7 @@ static void kvm_free_memslots(struct kvm *kvm, struct kvm_memslots *slots)
 		return;
 
 	kvm_for_each_memslot(memslot, slots)
-		kvm_free_memslot(kvm, memslot, NULL);
+		kvm_free_memslot(kvm, memslot, NULL, KVM_MR_DELETE);
 
 	kvfree(slots);
 }
@@ -1061,14 +1062,14 @@ int __kvm_set_memory_region(struct kvm *kvm,
 
 	kvm_arch_commit_memory_region(kvm, mem, &old, &new, change);
 
-	kvm_free_memslot(kvm, &old, &new);
+	kvm_free_memslot(kvm, &old, &new, change);
 	kvfree(old_memslots);
 	return 0;
 
 out_slots:
 	kvfree(slots);
 out_free:
-	kvm_free_memslot(kvm, &new, &old);
+	kvm_free_memslot(kvm, &new, &old, change);
 out:
 	return r;
 }
-- 
2.19.2

