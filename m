Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 41C5A7DE76
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 09:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752296AbeC0JJz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 05:09:55 -0400
Received: from mail-qt0-f195.google.com ([209.85.216.195]:36160 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752257AbeC0JJw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 05:09:52 -0400
Received: by mail-qt0-f195.google.com with SMTP id f16so10523155qth.3;
        Tue, 27 Mar 2018 02:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kerfeK2JoO7+oQrs2Rs90drlJqT4/y+dgPYmSKQcDZY=;
        b=jWxmfNgQyd8Yx05hgSKhoslediHVNu+0mVF/KvCud81pLdxYwYXSFuAD9xXUCpH9Il
         csmkmEPH8KUavZ8X/MUpG4F6dYeBUlXYRElYJ5h4MXT4+c7C9hvrF9tvcstaQGz/47Fj
         vFswmpgFvZF21X+4PU+b5Q8Tff5cSabuLePUrLhuatThHZUezBMwEHt33zFHQrnI7Ua2
         qcWD57vmkY+77wEioHnuL2ZScGQb0Wjh5Zngyj6cnry3MIgOILmeOcPPWCcWcMPRXojo
         XTOPp9qoEnRSBVnVz9N3vsAYCytS4ZM0Av7gcICrjpYxeDl6HQ15jPX+8DCq85hs9ruQ
         NHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=kerfeK2JoO7+oQrs2Rs90drlJqT4/y+dgPYmSKQcDZY=;
        b=k1UpCV9mWRzpUVk0MmxPrd0177tX0QOpORZOB4oeSqHV5yDrmNBaJ0V0dv4dgfysBE
         KJMoKQhdtkDu+puB4tBNa+C+is8LxdtVJ72EJDeI63t9eSY7OhlOPE4JxamTXwwkxtR9
         l/ilBUlXZFzKlhuCy0f+LL8FA32CgJbSC9h4hbPhGvmtfXjJvu/QcHtrU2gmieLVZIJ3
         WmRa0ZEIuKIhNDcAtksOHw7KZEBnuYMMsdrtJbFrn3XpufpbWGewXRCM/9R8XftryMJS
         MbHCRxuX4Av/DdKiD7/rPSPM9oZe+eDDkwkhj7Asmp87q0BYfdT+8PdQHJxZl3bYWXTn
         74tw==
X-Gm-Message-State: AElRT7EYuto5a7VSyt/d8K9x4aai4ngeCCiEBVhQlzrUOFppK7IPKRcB
        kaFZhJki6tpeumXuSTVSuxU=
X-Google-Smtp-Source: AIpwx480/vPTNT29I0MFNOkBFW6odoqsuBrxGUTrfBRhNOY/EK/7CGRyd4jbKhbJzHItsDN2Wm+k4A==
X-Received: by 10.200.57.117 with SMTP id t50mr18948853qtb.22.1522141791504;
        Tue, 27 Mar 2018 02:09:51 -0700 (PDT)
Received: from localhost.localdomain (50-39-100-161.bvtn.or.frontiernet.net. [50.39.100.161])
        by smtp.gmail.com with ESMTPSA id r51sm557475qtr.23.2018.03.27.02.09.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Mar 2018 02:09:50 -0700 (PDT)
From:   Ram Pai <linuxram@us.ibm.com>
To:     mpe@ellerman.id.au, mingo@redhat.com, akpm@linux-foundation.org
Cc:     linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        dave.hansen@intel.com, benh@kernel.crashing.org, paulus@samba.org,
        khandual@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        bsingharora@gmail.com, hbabu@us.ibm.com, mhocko@kernel.org,
        bauerman@linux.vnet.ibm.com, ebiederm@xmission.com,
        linuxram@us.ibm.com, corbet@lwn.net, arnd@arndb.de
Subject: [PATCH v13 2/3] mm, powerpc, x86: introduce an additional vma bit for powerpc pkey
Date:   Tue, 27 Mar 2018 02:09:27 -0700
Message-Id: <1522141768-25485-3-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1522141768-25485-1-git-send-email-linuxram@us.ibm.com>
References: <1522141768-25485-1-git-send-email-linuxram@us.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently only 4bits are allocated in the vma flags to hold 16
keys. This is sufficient for x86. PowerPC  supports  32  keys,
which needs 5bits. This patch allocates an  additional bit.

cc: Dave Hansen <dave.hansen@intel.com>
cc: Michael Ellermen <mpe@ellerman.id.au>
cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Balbir Singh <bsingharora@gmail.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 fs/proc/task_mmu.c |    1 +
 include/linux/mm.h |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 6b996d0..6d83bb7 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -685,6 +685,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 		[ilog2(VM_PKEY_BIT1)]	= "",
 		[ilog2(VM_PKEY_BIT2)]	= "",
 		[ilog2(VM_PKEY_BIT3)]	= "",
+		[ilog2(VM_PKEY_BIT4)]	= "",
 #endif /* CONFIG_ARCH_HAS_PKEYS */
 	};
 	size_t i;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ad207ad..d534f46 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -231,9 +231,10 @@ extern int overcommit_kbytes_handler(struct ctl_table *, int, void __user *,
 #ifdef CONFIG_ARCH_HAS_PKEYS
 # define VM_PKEY_SHIFT	VM_HIGH_ARCH_BIT_0
 # define VM_PKEY_BIT0	VM_HIGH_ARCH_0	/* A protection key is a 4-bit value */
-# define VM_PKEY_BIT1	VM_HIGH_ARCH_1
+# define VM_PKEY_BIT1	VM_HIGH_ARCH_1	/* on x86 and 5-bit value on ppc64   */
 # define VM_PKEY_BIT2	VM_HIGH_ARCH_2
 # define VM_PKEY_BIT3	VM_HIGH_ARCH_3
+# define VM_PKEY_BIT4	VM_HIGH_ARCH_4
 #endif /* CONFIG_ARCH_HAS_PKEYS */
 
 #if defined(CONFIG_X86)
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
