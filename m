Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A6BC5517A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 01:01:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 144F120791
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 01:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933301;
	bh=YqWvLG/HlVMMTDoxlArrGqJGoB3hGxiNvQNMWzmgHsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ys6HIkV8r+ijmz4ot1xZ2aHzCerNFQsEnFZ9Sqb9Rmw5ljOGGtyWzXA0mLYSe98JI
	 kx7LX8T4Zjj/W54bMn0bWCFbTSdhyo0XHpMa7sYuXpeh212/g05LwSLRhMmkGIYbZo
	 WhNHdwc3vttoAMk4GRQN7FbPzKYRbFXiP/UMxWKg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730812AbgJ2BBk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 21:01:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731485AbgJ1WRX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:23 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95DF8247BF;
        Wed, 28 Oct 2020 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603895015;
        bh=YqWvLG/HlVMMTDoxlArrGqJGoB3hGxiNvQNMWzmgHsI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bpoeatvNSyNRCdqK1dq4YsN5UKoiMHbM/HVm4w394g+4AUxwntJqDbxhLLheG8E+5
         0hcyBUk6PSRUb3JT9SfETt3lqxxFWl66r9w0cCvBJ/MsvSFPhymuG4tN3xdzw9MBkd
         9YLd/DGT3edQaadPcfTBM+j0eKAbgQWy3Iwga0Uo=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXmMP-003hls-E5; Wed, 28 Oct 2020 15:23:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Peter Enderborg <peter.enderborg@sony.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 25/33] docs: Kconfig/Makefile: add a check for broken ABI files
Date:   Wed, 28 Oct 2020 15:23:23 +0100
Message-Id: <f97df0ea6dd59cf5fe1655c71eb34af71c67d20c.1603893146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

The files under Documentation/ABI should follow the syntax
as defined at Documentation/ABI/README.

Allow checking if they're following the syntax by running
the ABI parser script on COMPILE_TEST.

With that, when there's a problem with a file under
Documentation/ABI, it would produce a warning like:

	Warning: file ./Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats#14:
		What '/sys/bus/pci/devices/<dev>/aer_stats/aer_rootport_total_err_cor' doesn't have a description
	Warning: file ./Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats#21:
		What '/sys/bus/pci/devices/<dev>/aer_stats/aer_rootport_total_err_fatal' doesn't have a description

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Kconfig  | 10 ++++++++++
 Documentation/Makefile |  5 +++++
 lib/Kconfig.debug      |  2 ++
 scripts/get_abi.pl     | 14 +++++++++++---
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/Kconfig b/Documentation/Kconfig
index 66046fa1c341..e549a61f4d96 100644
--- a/Documentation/Kconfig
+++ b/Documentation/Kconfig
@@ -10,4 +10,14 @@ config WARN_MISSING_DOCUMENTS
 
 	   If unsure, select 'N'.
 
+config WARN_ABI_ERRORS
+	bool "Warn if there are errors at ABI files"
+	depends on COMPILE_TEST
+	help
+	   The files under Documentation/ABI should follow what's
+	   described at Documentation/ABI/README. Yet, as they're manually
+	   written, it would be possible that some of those files would
+	   have errors that would break them for being parsed by
+	   scripts/get_abi.pl. Add a check to verify them.
 
+	   If unsure, select 'N'.
diff --git a/Documentation/Makefile b/Documentation/Makefile
index 4e47dff8b315..61a7310b49e0 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -10,6 +10,11 @@ ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
 $(shell $(srctree)/scripts/documentation-file-ref-check --warn)
 endif
 
+# Check for broken ABI files
+ifeq ($(CONFIG_WARN_ABI_ERRORS),y)
+$(shell $(srctree)/scripts/get_abi.pl validate --dir $(srctree)/Documentation/ABI)
+endif
+
 # You can set these variables from the command line.
 SPHINXBUILD   = sphinx-build
 SPHINXOPTS    =
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d7a7bc3b6098..c789b39ed527 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2446,4 +2446,6 @@ config HYPERV_TESTING
 
 endmenu # "Kernel Testing and Coverage"
 
+source "Documentation/Kconfig"
+
 endmenu # Kernel hacking
diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 3cff7cdf1397..413349789145 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -50,7 +50,15 @@ my %symbols;
 sub parse_error($$$$) {
 	my ($file, $ln, $msg, $data) = @_;
 
-	print STDERR "file $file#$ln: $msg at\n\t$data";
+	$data =~ s/\s+$/\n/;
+
+	print STDERR "Warning: file $file#$ln:\n\t$msg";
+
+	if ($data ne "") {
+		print STDERR ". Line\n\t\t$data";
+	} else {
+	    print STDERR "\n";
+	}
 }
 
 #
@@ -110,7 +118,7 @@ sub parse_abi {
 
 			# Invalid, but it is a common mistake
 			if ($new_tag eq "where") {
-				parse_error($file, $ln, "tag 'Where' is invalid. Should be 'What:' instead", $_);
+				parse_error($file, $ln, "tag 'Where' is invalid. Should be 'What:' instead", "");
 				$new_tag = "what";
 			}
 
@@ -225,7 +233,7 @@ sub parse_abi {
 		}
 
 		# Everything else is error
-		parse_error($file, $ln, "Unexpected line:", $_);
+		parse_error($file, $ln, "Unexpected content", $_);
 	}
 	$data{$nametag}->{description} =~ s/^\n+// if ($data{$nametag}->{description});
 	if ($what) {
-- 
2.26.2

