Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E1B387D9ED
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 12:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfGQM20 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 08:28:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53862 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbfGQM2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 08:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tF9E3YYjNi7GpzOM3AGA1djd9rfPhKKGBsx+uvtD5d8=; b=J6dHaJt0LL0khZXpLtfMzXMIRH
        jLX2MwF21nHHIwyKh5k79uMhiuhfQqbPcdom+w+TKwAZXC+SuBNLzku6ZClYp9enpb6T+58Bk54IL
        2Tl6fWe1Ls8bK6OGY9Qzd2fQBeJ9tbgGZfv5atA4f2F63lCcS7t3vHwVC2xAQRkS9c2DE2avFK7Ze
        mOQ/WpIARPqavWUj9MSZCGC/1nWH/4ggtw1VPPAaPYsdYqIYM6qMHP5JURcyRzp8rLBThjabJLY0+
        DvhIzJ4HnfVbBzkLvuS9bJDe9Uj7dewL6BJLlObHxLuO4/8VakPNbFpprOegNZva0eoZTONSlvRJi
        pecH4ERA==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnj2m-0006fd-Um; Wed, 17 Jul 2019 12:28:24 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnj2k-00052q-6o; Wed, 17 Jul 2019 09:28:22 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v4 15/15] docs: Kconfig/Makefile: add a check for broken ABI files
Date:   Wed, 17 Jul 2019 09:28:19 -0300
Message-Id: <07123ef8670c71cbbf29710033c610aa3be038ff.1563365880.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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
index e145e4db508b..638c4c11d102 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -9,6 +9,11 @@ ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
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
index a858b55e8ac7..4cf6a8f68409 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2146,4 +2146,6 @@ config IO_STRICT_DEVMEM
 
 source "arch/$(SRCARCH)/Kconfig.debug"
 
+source "Documentation/Kconfig"
+
 endmenu # Kernel hacking
diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 6a4d387ebf3b..e80f9ab2ed26 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -47,7 +47,15 @@ my %data;
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
@@ -104,7 +112,7 @@ sub parse_abi {
 
 			# Invalid, but it is a common mistake
 			if ($new_tag eq "where") {
-				parse_error($file, $ln, "tag 'Where' is invalid. Should be 'What:' instead", $_);
+				parse_error($file, $ln, "tag 'Where' is invalid. Should be 'What:' instead", "");
 				$new_tag = "what";
 			}
 
@@ -205,7 +213,7 @@ sub parse_abi {
 		}
 
 		# Everything else is error
-		parse_error($file, $ln, "Unexpected line:", $_);
+		parse_error($file, $ln, "Unexpected content", $_);
 	}
 	$data{$nametag}->{description} =~ s/^\n+//;
 	close IN;
-- 
2.21.0

