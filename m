Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1761BC63798
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B678120719
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604043827;
	bh=2+N6GeH05UJ8t6Le36bks3yJn48E875VzqLlsZelWQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=AOja8Fzh39KNZDceLAUsiHa9vJhdU4MPpfzEQ9SWa3qPoit72BydfHlftpP51QdcD
	 ElyI3g2E8ZBrE+iLQFjDVEDGH98PheocA13FpDFx2reY3ekIIBf/k9eUBVC+sLK8Bi
	 SlWBd4u+mdYlDSGOVVImg/P6XTzWJFlvd+KcjZrc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgJ3Hnn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:43:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbgJ3HlE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:41:04 -0400
Received: from mail.kernel.org (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EA8922246;
        Fri, 30 Oct 2020 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043662;
        bh=2+N6GeH05UJ8t6Le36bks3yJn48E875VzqLlsZelWQA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GsgA3LkNg6PuQmOai9oByL/j4mE0aV41uh2sjy0FEhes7Nww+fHsEdBYJCKSubRfO
         BQh90m2/5T4O3+RNQRpv4lJYKFbPUM1o+l+PRewmmovERI+IO6toojmz7GfEBv/iEp
         RQHXazH2Lb8P9pYmP7mbRxOyJVix11ROhborb8/w=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kYP1w-004OfL-A2; Fri, 30 Oct 2020 08:41:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Oded Gabbay <oded.gabbay@gmail.com>, Tom Rix <trix@redhat.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/39] scripts: get_abi.pl: Allow optionally record from where a line came from
Date:   Fri, 30 Oct 2020 08:40:22 +0100
Message-Id: <befc387011c5e3c6febd285b7f27610e41c90260.1604042072.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604042072.git.mchehab+huawei@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The get_abi.pl reads a lot of files and can join them on a
single output file. Store where each "What:" output came from,
in order to be able to optionally display it.

This is useful for the Sphinx extension, with can now be
able to blame what ABI file has issues, and on what line
the What: description with problems begin.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 0c403af86fd5..6a4d387ebf3b 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -10,6 +10,7 @@ use Fcntl ':mode';
 my $help;
 my $man;
 my $debug;
+my $enable_lineno;
 my $prefix="Documentation/ABI";
 
 #
@@ -19,6 +20,7 @@ my $description_is_rst = 0;
 
 GetOptions(
 	"debug|d+" => \$debug,
+	"enable-lineno" => \$enable_lineno,
 	"rst-source!" => \$description_is_rst,
 	"dir=s" => \$prefix,
 	'help|?' => \$help,
@@ -67,6 +69,7 @@ sub parse_abi {
 	$data{$nametag}->{file} = $name;
 	$data{$nametag}->{filepath} = $file;
 	$data{$nametag}->{is_file} = 1;
+	$data{$nametag}->{line_no} = 1;
 
 	my $type = $file;
 	$type =~ s,.*/(.*)/.*,$1,;
@@ -126,6 +129,8 @@ sub parse_abi {
 			if ($tag ne "" && $new_tag) {
 				$tag = $new_tag;
 
+				$data{$what}->{line_no} = $ln;
+
 				if ($new_what) {
 					@{$data{$what}->{label}} = @labels if ($data{$nametag}->{what});
 					@labels = ();
@@ -221,6 +226,12 @@ sub output_rest {
 		my $file = $data{$what}->{file};
 		my $filepath = $data{$what}->{filepath};
 
+		if ($enable_lineno) {
+			printf "#define LINENO %s%s#%s\n\n",
+			       $prefix, $data{$what}->{file},
+			       $data{$what}->{line_no};
+		}
+
 		my $w = $what;
 		$w =~ s/([\(\)\_\-\*\=\^\~\\])/\\$1/g;
 
@@ -369,6 +380,10 @@ sub search_symbols {
 	}
 }
 
+# Ensure that the prefix will always end with a slash
+# While this is not needed for find, it makes the patch nicer
+# with --enable-lineno
+$prefix =~ s,/?$,/,;
 
 #
 # Parses all ABI files located at $prefix dir
@@ -395,7 +410,8 @@ abi_book.pl - parse the Linux ABI files and produce a ReST book.
 
 =head1 SYNOPSIS
 
-B<abi_book.pl> [--debug] [--man] [--help] --[(no-)rst-source] [--dir=<dir>] <COMAND> [<ARGUMENT>]
+B<abi_book.pl> [--debug] [--enable-lineno] [--man] [--help]
+	       [--(no-)rst-source] [--dir=<dir>] <COMAND> [<ARGUMENT>]
 
 Where <COMMAND> can be:
 
@@ -425,6 +441,10 @@ selecting between a rst-compliant source ABI (--rst-source), or a
 plain text that may be violating ReST spec, so it requres some escaping
 logic (--no-rst-source).
 
+=item B<--enable-lineno>
+
+Enable output of #define LINENO lines.
+
 =item B<--debug>
 
 Put the script in verbose mode, useful for debugging. Can be called multiple
-- 
2.26.2

