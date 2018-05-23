Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8951A7DF8A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 12:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932872AbeEWMSH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 08:18:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53442 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932787AbeEWMRq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 May 2018 08:17:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0AA64818BAF0;
        Wed, 23 May 2018 12:17:46 +0000 (UTC)
Received: from asgard.redhat.com (ovpn-200-41.brq.redhat.com [10.40.200.41])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A08B420A8471;
        Wed, 23 May 2018 12:17:43 +0000 (UTC)
Date:   Wed, 23 May 2018 14:18:37 +0200
From:   Eugene Syromiatnikov <esyr@redhat.com>
To:     netdev@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Olsa <jolsa@kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: [PATCH bpf-next v2 3/3] bpf: add ability to configure BPF JIT
 kallsyms export at the boot time
Message-ID: <20180523121837.GA31550@asgard.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 23 May 2018 12:17:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 23 May 2018 12:17:46 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'esyr@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch introduces two configuration options,
BPF_JIT_KALLSYMS_BOOTPARAM and BPF_JIT_KALLSYMS_BOOTPARAM_VALUE, that
allow configuring the initial value of net.core.bpf_jit_kallsyms sysctl
knob. This enables export of addresses of JIT'ed BPF programs that
created during the early boot.

Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 10 +++++++++
 init/Kconfig                                    | 30 +++++++++++++++++++++++++
 kernel/bpf/core.c                               | 14 ++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5adc6d0..10e7502 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -452,6 +452,16 @@
 			2 - JIT hardening is enabled for all users.
 			Default value is set via kernel config option.
 
+	bpf_jit_kallsyms=
+			Format: { "0" | "1" }
+			Sets initial value of net.core.bpf_jit_kallsyms
+			sysctl knob.
+			0 - Addresses of JIT'ed BPF programs are not exported
+			    to kallsyms.
+			1 - Export of addresses of JIT'ed BPF programs is
+			    enabled for privileged users.
+			Default value is set via kernel config option.
+
 	bttv.card=	[HW,V4L] bttv (bt848 + bt878 based grabber cards)
 	bttv.radio=	Most important insmod options are available as
 			kernel args too.
diff --git a/init/Kconfig b/init/Kconfig
index b661497..b5405ca 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1464,6 +1464,36 @@ config BPF_JIT_HARDEN_BOOTPARAM_VALUE
 
 	  If you are unsure how to answer this question, answer 0.
 
+config BPF_JIT_KALLSYMS_BOOTPARAM
+	bool "BPF JIT kallsyms export boot parameter"
+	default n
+	help
+	  This option adds a kernel parameter 'bpf_jit_kallsyms' that allows
+	  configuring default state of the net.core.bpf_jit_kallsyms sysctl
+	  knob.  If this option is selected, the default value of the
+	  net.core.bpf_jit_kallsyms sysctl knob can be set on the kernel command
+	  line.  The purpose of this option is to allow enabling BPF JIT
+	  kallsyms export for the BPF programs created during the early boot,
+	  so they can be traced later.
+
+	  If you are unsure how to answer this question, answer N.
+
+config BPF_JIT_KALLSYMS_BOOTPARAM_VALUE
+	int "BPF JIT kallsyms export boot parameter default value"
+	depends on BPF_JIT_HARDEN_BOOTPARAM
+	range 0 1
+	default 0
+	help
+	  This option sets the default value for the kernel parameter
+	  'bpf_jit_kallsyms' that configures default value of the
+	  net.core.bpf_jit_kallsyms sysctl knob at boot.  If this option is set
+	  to 0 (zero), the net.core.bpf_jit_kallsyms will default to 0, which
+	  will lead to disabling of exporting of addresses of JIT'ed BPF
+	  programs.  If this option is set to 1 (one), addresses of privileged
+	  BPF programs are exported to kallsyms.
+
+	  If you are unsure how to answer this question, answer 0.
+
 config USERFAULTFD
 	bool "Enable userfaultfd() system call"
 	select ANON_INODES
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 9edb7a8..003d708 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -321,7 +321,21 @@ __setup("bpf_jit_harden=", bpf_jit_harden_setup);
 int bpf_jit_harden   __read_mostly;
 #endif /* CONFIG_BPF_JIT_HARDEN_BOOTPARAM */
 
+#ifdef CONFIG_BPF_JIT_KALLSYMS_BOOTPARAM
+int bpf_jit_kallsyms __read_mostly = CONFIG_BPF_JIT_KALLSYMS_BOOTPARAM_VALUE;
+
+static int __init bpf_jit_kallsyms_setup(char *str)
+{
+	unsigned long enabled;
+
+	if (!kstrtoul(str, 0, &enabled))
+		bpf_jit_kallsyms = !!enabled;
+	return 1;
+}
+__setup("bpf_jit_kallsyms=", bpf_jit_kallsyms_setup);
+#else /* !CONFIG_BPF_JIT_KALLSYMS_BOOTPARAM */
 int bpf_jit_kallsyms __read_mostly;
+#endif /* CONFIG_BPF_JIT_KALLSYMS_BOOTPARAM */
 
 static __always_inline void
 bpf_get_prog_addr_region(const struct bpf_prog *prog,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
