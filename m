Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7856FC001DF
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jul 2023 22:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjGFWv2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jul 2023 18:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbjGFWvQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 18:51:16 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3251BC2
        for <linux-doc@vger.kernel.org>; Thu,  6 Jul 2023 15:51:03 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-564fb1018bcso13233927b3.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Jul 2023 15:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688683862; x=1691275862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7OMVl3YxFVN2A+Ry/UxbO1YmCHHRZcxw7VDxaJg9ek4=;
        b=MUCpPcJ5Cgcqj6eW6sHdBBG776f5QGOT4kgvGYw/zAIra7r+ur1/6MP7Dq6MkoSZmq
         4xRE3PYyIXD4h8qZWQWCXhWmcWP1AwGUjGAf2ElqV4yAkcG0gjhOddOoakQQadmYz+QD
         Is/7A9d1hSTithrMC6POOEAOeFEch61LmagZDJM30S0vYIcKNDDe5/OQ3z3oRxh6zHQl
         utpA3lGtPFljt8j9Ntkp9LhkEyWfCZ3raeDW8NKQTH9gVvZpq5Wizvy5vkyeCh1Pwwja
         CGEW2G1lqZ2p9p/Ga+J136aVMeRPFS8hQNLl5QI5DDjAJCWHkUOphl3NTJbnSXMCQUoE
         o8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688683862; x=1691275862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OMVl3YxFVN2A+Ry/UxbO1YmCHHRZcxw7VDxaJg9ek4=;
        b=UreDdMNeuw6Nt7Df/MM1tKEqfWgGoB6gxlIe1wGu/qxsyH9X9x3Ug6V2CDQpLOQi+O
         h+Td77qxqSaBwxH7JN45mrCw8f4QOqUKqIQWJlV9HlW5AJEQEj2EytT4L5y6QeNLG4n+
         CxtbcqjW4PyEhoN3eQHLDvxVNPANtPPcw0dzSyTV8m3uEJ+pZup7Ybs6hps+6r5y5EiX
         a/5psz7TwGpniT/5N09raXGX6yuCE7mVG/ysS65v1jXXqbPz4YPgTccw6uAK/pM0MYOP
         3QXEsacaT5UESIYTVLc0ggb7iDglmr3k7kwijt9IgV+BsQJa6i0CmID7pTIVDHbE1uBe
         5zsg==
X-Gm-Message-State: ABy/qLZEDN0R2tLbz/MgM8REETb7rmjr2z7H5vVnr0+cB3Xb8x6p6n3/
        cnPlwvs88o7HLit1eNIC1dOgxpeaUL0/3egGsrDA
X-Google-Smtp-Source: APBJJlG1dkyvwdYp0IICzgcbHzfcY4HpHckyy/miTsDbBSll9Umrn8xTYfU/5fbclpora7Bohc9XblNeG3IvM415E6Ta
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:bec3:2b1c:87a:fca2])
 (user=axelrasmussen job=sendgmr) by 2002:a81:af07:0:b0:565:a33a:a49f with
 SMTP id n7-20020a81af07000000b00565a33aa49fmr25333ywh.6.1688683862421; Thu,
 06 Jul 2023 15:51:02 -0700 (PDT)
Date:   Thu,  6 Jul 2023 15:50:34 -0700
In-Reply-To: <20230706225037.1164380-1-axelrasmussen@google.com>
Mime-Version: 1.0
References: <20230706225037.1164380-1-axelrasmussen@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230706225037.1164380-7-axelrasmussen@google.com>
Subject: [PATCH v3 6/8] mm: userfaultfd: document and enable new UFFDIO_POISON feature
From:   Axel Rasmussen <axelrasmussen@google.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Geffon <bgeffon@google.com>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Peter Xu <peterx@redhat.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Shuah Khan <shuah@kernel.org>,
        Suleiman Souhlal <suleiman@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "T.J. Alumbaugh" <talumbau@google.com>,
        Yu Zhao <yuzhao@google.com>,
        ZhangPeng <zhangpeng362@huawei.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org,
        Axel Rasmussen <axelrasmussen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the userfaultfd API to advertise this feature as part of feature
flags and supported ioctls (returned upon registration).

Add basic documentation describing the new feature.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 Documentation/admin-guide/mm/userfaultfd.rst | 15 +++++++++++++++
 include/uapi/linux/userfaultfd.h             |  9 ++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
index 7c304e432205..4349a8c2b978 100644
--- a/Documentation/admin-guide/mm/userfaultfd.rst
+++ b/Documentation/admin-guide/mm/userfaultfd.rst
@@ -244,6 +244,21 @@ write-protected (so future writes will also result in a WP fault). These ioctls
 support a mode flag (``UFFDIO_COPY_MODE_WP`` or ``UFFDIO_CONTINUE_MODE_WP``
 respectively) to configure the mapping this way.
 
+Memory Poisioning Emulation
+---------------------------
+
+In response to a fault (either missing or minor), an action userspace can
+take to "resolve" it is to issue a ``UFFDIO_POISON``. This will cause any
+future faulters to either get a SIGBUS, or in KVM's case the guest will
+receive an MCE as if there were hardware memory poisoning.
+
+This is used to emulate hardware memory poisoning. Imagine a VM running on a
+machine which experiences a real hardware memory error. Later, we live migrate
+the VM to another physical machine. Since we want the migration to be
+transparent to the guest, we want that same address range to act as if it was
+still poisoned, even though it's on a new physical host which ostensibly
+doesn't have a memory error in the exact same spot.
+
 QEMU/KVM
 ========
 
diff --git a/include/uapi/linux/userfaultfd.h b/include/uapi/linux/userfaultfd.h
index b5f07eacc697..62151706c5a3 100644
--- a/include/uapi/linux/userfaultfd.h
+++ b/include/uapi/linux/userfaultfd.h
@@ -39,7 +39,8 @@
 			   UFFD_FEATURE_MINOR_SHMEM |		\
 			   UFFD_FEATURE_EXACT_ADDRESS |		\
 			   UFFD_FEATURE_WP_HUGETLBFS_SHMEM |	\
-			   UFFD_FEATURE_WP_UNPOPULATED)
+			   UFFD_FEATURE_WP_UNPOPULATED |	\
+			   UFFD_FEATURE_POISON)
 #define UFFD_API_IOCTLS				\
 	((__u64)1 << _UFFDIO_REGISTER |		\
 	 (__u64)1 << _UFFDIO_UNREGISTER |	\
@@ -49,12 +50,14 @@
 	 (__u64)1 << _UFFDIO_COPY |		\
 	 (__u64)1 << _UFFDIO_ZEROPAGE |		\
 	 (__u64)1 << _UFFDIO_WRITEPROTECT |	\
-	 (__u64)1 << _UFFDIO_CONTINUE)
+	 (__u64)1 << _UFFDIO_CONTINUE |		\
+	 (__u64)1 << _UFFDIO_POISON)
 #define UFFD_API_RANGE_IOCTLS_BASIC		\
 	((__u64)1 << _UFFDIO_WAKE |		\
 	 (__u64)1 << _UFFDIO_COPY |		\
+	 (__u64)1 << _UFFDIO_WRITEPROTECT |	\
 	 (__u64)1 << _UFFDIO_CONTINUE |		\
-	 (__u64)1 << _UFFDIO_WRITEPROTECT)
+	 (__u64)1 << _UFFDIO_POISON)
 
 /*
  * Valid ioctl command number range with this API is from 0x00 to
-- 
2.41.0.255.g8b1d071c50-goog

