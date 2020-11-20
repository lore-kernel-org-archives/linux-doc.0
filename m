Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4A3C6379D
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 03:04:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C0952223F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 03:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jy+3wxEY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgKTDEY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 22:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgKTDEX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 22:04:23 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C9DC0617A7
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 19:04:22 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id b23so4586913pfp.15
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 19:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=7bRLqN/4G8Vg/p+SruLvrAF5HknNrILrTJkN47+Yh/M=;
        b=jy+3wxEYjXh2uJxBT5hnkLUqSwcMvOJq7K7163jGJqJndQn+hV52uzfcxnVzk2k7i2
         QxLzVlV42ZSMsgRw5im9AXWR981BWPgW8qyhodIrSmP+aJev97b6YM4FFBOUGTE1GkTB
         GZnlTAJyizj93ZLIANIIcRqmvuWnRQdXyBDWSuOIbY9l0eqtjfMZDhoZCsdagyRyzffj
         WS9ayYQfLKTj7PCL0EekOKJy19pub543GwDI6/9EjqPNJGDK7JoTv/CQ01J3lE9agX+I
         d0ja28FpMJ8VAORlvDNm5PQHGCluoL9XRDafZGPVjnjii9vA5/vU/DURLMI73BbKlz+y
         ZSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=7bRLqN/4G8Vg/p+SruLvrAF5HknNrILrTJkN47+Yh/M=;
        b=LZRgDLPgnHYKr0t0FQ0E/fJA/ivRYNG0CGCAweXG3mzhNTBGz2LNpQHzIeCAjP49AQ
         Jjga6kIPUdbk1qNaeilupkTshhC05vFX6Zejpj7SErkcyRXGYZ/MbMI0hwodkqBvbyxY
         c5r4iuv6lDfmC2ybf4KE2r4RqticF/1qnIPK4GvFurkZn3xwnzJJ6Bz5S5ow3JXDpHG4
         7C8q6GYa/MUmAwkIlOxQLuseESQgKmqx8ip6JlMOZ92236AW+7dQQje+v3Z1EIHpnbaH
         FFylOQMhhKvTiuKsCq3jQ3Wm3PoB3NbbfPLqNuMZ1zRtCe6TV9C3+a9vrdh9CxeKSbAs
         iR8g==
X-Gm-Message-State: AOAM531XVWjGSMqR4Q15apXdAY5X8AEDyHM1zgx2vpSvI1chLGREX9fJ
        k19x2lw02O6kErpHvz+wwmUMsaQhwUqiDnaVvg==
X-Google-Smtp-Source: ABdhPJychvoYkRk5RFftYRsayhMxGVviZlTyCQyVi0Xzz+20ZfzBXFAwD+Ni7rRNIeeqK17MbtDJdSLYdGMf/LyCvQ==
Sender: "lokeshgidra via sendgmr" <lokeshgidra@lg.mtv.corp.google.com>
X-Received: from lg.mtv.corp.google.com ([100.89.4.209]) (user=lokeshgidra
 job=sendgmr) by 2002:a05:6a00:c8:b029:18b:b0e:e51 with SMTP id
 e8-20020a056a0000c8b029018b0b0e0e51mr11622681pfj.37.1605841461865; Thu, 19
 Nov 2020 19:04:21 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:04:11 -0800
In-Reply-To: <20201120030411.2690816-1-lokeshgidra@google.com>
Message-Id: <20201120030411.2690816-3-lokeshgidra@google.com>
Mime-Version: 1.0
References: <20201120030411.2690816-1-lokeshgidra@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v6 2/2] Add user-mode only option to unprivileged_userfaultfd
 sysctl knob
From:   Lokesh Gidra <lokeshgidra@google.com>
To:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kaleshsingh@google.com,
        calin@google.com, surenb@google.com, jeffv@google.com,
        kernel-team@android.com, Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>, linux-mm@kvack.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With this change, when the knob is set to 0, it allows unprivileged
users to call userfaultfd, like when it is set to 1, but with the
restriction that page faults from only user-mode can be handled.
In this mode, an unprivileged user (without SYS_CAP_PTRACE capability)
must pass UFFD_USER_MODE_ONLY to userfaultd or the API will fail with
EPERM.

This enables administrators to reduce the likelihood that an attacker
with access to userfaultfd can delay faulting kernel code to widen
timing windows for other exploits.

The default value of this knob is changed to 0. This is required for
correct functioning of pipe mutex. However, this will fail postcopy
live migration, which will be unnoticeable to the VM guests. To avoid
this, set 'vm.userfault = 1' in /sys/sysctl.conf.

The main reason this change is desirable as in the short term is that
the Android userland will behave as with the sysctl set to zero. So
without this commit, any Linux binary using userfaultfd to manage its
memory would behave differently if run within the Android userland.
For more details, refer to Andrea's reply [1].

[1] https://lore.kernel.org/lkml/20200904033438.GI9411@redhat.com/

Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
Reviewed-by: Andrea Arcangeli <aarcange@redhat.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 15 ++++++++++-----
 fs/userfaultfd.c                        | 10 ++++++++--
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index f455fa00c00f..d06a98b2a4e7 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -873,12 +873,17 @@ file-backed pages is less than the high watermark in a zone.
 unprivileged_userfaultfd
 ========================
 
-This flag controls whether unprivileged users can use the userfaultfd
-system calls.  Set this to 1 to allow unprivileged users to use the
-userfaultfd system calls, or set this to 0 to restrict userfaultfd to only
-privileged users (with SYS_CAP_PTRACE capability).
+This flag controls the mode in which unprivileged users can use the
+userfaultfd system calls. Set this to 0 to restrict unprivileged users
+to handle page faults in user mode only. In this case, users without
+SYS_CAP_PTRACE must pass UFFD_USER_MODE_ONLY in order for userfaultfd to
+succeed. Prohibiting use of userfaultfd for handling faults from kernel
+mode may make certain vulnerabilities more difficult to exploit.
 
-The default value is 1.
+Set this to 1 to allow unprivileged users to use the userfaultfd system
+calls without any restrictions.
+
+The default value is 0.
 
 
 user_reserve_kbytes
diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 605599fde015..894cc28142e7 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -28,7 +28,7 @@
 #include <linux/security.h>
 #include <linux/hugetlb.h>
 
-int sysctl_unprivileged_userfaultfd __read_mostly = 1;
+int sysctl_unprivileged_userfaultfd __read_mostly;
 
 static struct kmem_cache *userfaultfd_ctx_cachep __read_mostly;
 
@@ -1966,8 +1966,14 @@ SYSCALL_DEFINE1(userfaultfd, int, flags)
 	struct userfaultfd_ctx *ctx;
 	int fd;
 
-	if (!sysctl_unprivileged_userfaultfd && !capable(CAP_SYS_PTRACE))
+	if (!sysctl_unprivileged_userfaultfd &&
+	    (flags & UFFD_USER_MODE_ONLY) == 0 &&
+	    !capable(CAP_SYS_PTRACE)) {
+		printk_once(KERN_WARNING "uffd: Set unprivileged_userfaultfd "
+			"sysctl knob to 1 if kernel faults must be handled "
+			"without obtaining CAP_SYS_PTRACE capability\n");
 		return -EPERM;
+	}
 
 	BUG_ON(!current->mm);
 
-- 
2.29.0.rc1.297.gfa9743e501-goog

