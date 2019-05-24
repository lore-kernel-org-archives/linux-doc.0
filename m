Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 171627D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri, 24 May 2019 23:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbfEXXt4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 24 May 2019 19:49:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39346 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbfEXXtz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 May 2019 19:49:55 -0400
Received: by mail-pf1-f194.google.com with SMTP id z26so6194955pfg.6
        for <linux-doc@vger.kernel.org>; Fri, 24 May 2019 16:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JWprfXxnZYwrSMlSa8B0jYY+Kk48KO4t7l+blfnMKTI=;
        b=FtBgIcfyzP/9kJsM+zqDbKcy6VZwEKAANCQ1/eZQrD6rviA4awDDcac9F6JHAeC8Ww
         /QISOXT5+haCwcCXiDtBTzmrbvUPQt/eQFfssAfxoublccYDf4cZJhSHGojIabZd0IPc
         VxKmmE96CtJBAuxlrRyraOLObouJSFe2WI5dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JWprfXxnZYwrSMlSa8B0jYY+Kk48KO4t7l+blfnMKTI=;
        b=B1O/maSh8qHatJMStbPwWg8Jx0uz9qFTaxt302Z5oSaqAuPGJlAcmk+0TVrGDmEa9Z
         xiA3Bxj8f372N7TKmebeSYind2QmHa838B0MjVE7bSQpEGbijrBs+61tfMhOTAJ1u3Uc
         3NdJAOz63u8nJFSigOw8csq4tb2769Djfd0vcMNTM8DVrOdS3maHtWg6TWJYsaHOQ3zv
         feVfrD7xrmGdyPjaosuiZukGdE7uL9BsSOkY+YLgH0VWwOEOLhoA5mrcgsyH+flt9ejK
         eMqNAJCJ1ZnVjLcPDuQPkPZt3Z0FuXT2iE148KhBbsgd9FPcR35FqQNFJqUqopN02gX8
         XT4A==
X-Gm-Message-State: APjAAAUBizvRxluHiL7/8nbN//wBQNNlGR+UIlM4pFZbxEIHPrF7+5B4
        RBg9zeoafB4YyHB8PjLpDX34xQ==
X-Google-Smtp-Source: APXvYqz7Pfyyr4nOlV734fVH1bvjX4jHzTMPj1aZT0g/Pt0V2GglxzMFOH0INg1fPuB6UlDmRBFhmw==
X-Received: by 2002:a63:495e:: with SMTP id y30mr65431636pgk.185.1558741794604;
        Fri, 24 May 2019 16:49:54 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id q4sm3297595pgb.39.2019.05.24.16.49.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 24 May 2019 16:49:53 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Paul Mackerras <paulus@ozlabs.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH RFC 1/5] powerpc: Use regular rcu_dereference_raw API
Date:   Fri, 24 May 2019 19:49:29 -0400
Message-Id: <20190524234933.5133-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524234933.5133-1-joel@joelfernandes.org>
References: <20190524234933.5133-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

rcu_dereference_raw already does not do any tracing. There is no need to
use the _notrace variant of it and this series removes that API, so let us
use the regular variant here.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 arch/powerpc/include/asm/kvm_book3s_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 21b1ed5df888..c15c9bbf0206 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -546,7 +546,7 @@ static inline void note_hpte_modification(struct kvm *kvm,
  */
 static inline struct kvm_memslots *kvm_memslots_raw(struct kvm *kvm)
 {
-	return rcu_dereference_raw_notrace(kvm->memslots[0]);
+	return rcu_dereference_raw(kvm->memslots[0]);
 }
 
 extern void kvmppc_mmu_debugfs_init(struct kvm *kvm);
-- 
2.22.0.rc1.257.g3120a18244-goog

