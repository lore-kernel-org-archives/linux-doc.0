Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0FAB7D912
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 07:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbfAUHiI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 02:38:08 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37270 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbfAUHiH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jan 2019 02:38:07 -0500
Received: by mail-wm1-f65.google.com with SMTP id g67so9684056wmd.2
        for <linux-doc@vger.kernel.org>; Sun, 20 Jan 2019 23:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mena-vt-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ibxTSM7aAfMxp0mh34e5XoCF9bu27Z34+6gCZTrPT34=;
        b=lcJa/9GoZ/Y6WfC0bylBfI5oCVTUbuuQaazcglM7FxSXk53oJ3EwA7gQ6DK+WxiFMb
         Tlrgwvc736fHcfg+YAswmtczDWnSSBMIcGSSXYg6i0MRH/ZIX2y9cpGSxmZ+J63hsT4/
         QTQXtg0gQ8OgWOCw2BrEXgDSkegRbpVoC0R+6nlx8MG5HL4zfx/R+JZ6gMYPKE+l1tLJ
         AXI8c4Qwl9aiXZE+hXoOGirioCNsW/YzcD/4+02Q9kHE3d1EMNxtT20zPoj7Mcuv0039
         pK40Sk4UGAAo1eF1IXEqWJ3/lN+mYFSzRQBsmUcXjgxuNNvUwayW8QCEFaj6ijFFXHa+
         HtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ibxTSM7aAfMxp0mh34e5XoCF9bu27Z34+6gCZTrPT34=;
        b=dUZ5ClMSX8ldJ+HOTs7RObyDPvIJ/93lU/oemZQs+m84LqaIKd9GRGdfwJ2Q2bQNg5
         GO79MnNVwksRG1UbezC0WFdaE80NEx7K6WYHDjeH/NaFGb1r5cgu7COsmI+2APmF2Uaz
         woVJF4PyCEYOsbHOyYAa1sapysZaAPls+ZGl1aw+Bv9ssgm7FOpI7kEsu6WGpPxGCyf0
         iL6R4cEE200wb7ocYC7UnhAGva9zbUvIllQ6wPwifkWiRX8ekBe3qPiylIAy6AHyv+Ll
         xUnb9bAl6piRCZie1P4UfJUTd9sqU79K5amp7Rv4TV5/JDcteUVOFGEgiLCak/2CEu75
         zWFg==
X-Gm-Message-State: AJcUukfA74eJHZ8s7Rtm/TIm1M2T7Gmw6pPL9xnZkxFTuQvsR9UlxfjB
        52VRNYgE8y7k+0Usp+iYv4u9h6/0mR8=
X-Google-Smtp-Source: ALg8bN6p9RWZDpkENLmzoXwCtF9v6nAyN1W721G5G6yv2ozcu7srm3C8FwlQtG+MKjShLdYSf4N48A==
X-Received: by 2002:a1c:9a4c:: with SMTP id c73mr23491864wme.35.1548027691743;
        Sun, 20 Jan 2019 15:41:31 -0800 (PST)
Received: from localhost.localdomain ([156.212.82.83])
        by smtp.gmail.com with ESMTPSA id e9sm76576753wro.16.2019.01.20.15.41.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Jan 2019 15:41:31 -0800 (PST)
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
Subject: [RESEND PATCH V8 08/11] KVM: X86: Port ROE_MPROTECT_CHUNK to x86
Date:   Mon, 21 Jan 2019 01:39:37 +0200
Message-Id: <20190120233940.15282-9-ahmedsoliman@mena.vt.edu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
References: <20190120233940.15282-1-ahmedsoliman@mena.vt.edu>
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

