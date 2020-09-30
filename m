Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6338DC47420
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:28:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30FAC2075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472520;
	bh=0+EnP3ZDT+KyhPuJqAeV8ARJRg4AwySdCsA/hCoxFaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=T0RIFxXbyZvhOxp+xiwnM2yZghQeH+BVYpHlbCoyak5zNjqSETVnhU57AJvg/V8iM
	 FK1v5Wy/Ph22o92/jODcQj/lqSUqqgkEtSB08duChW5/AJTFuY+ESfszljG0hD/xO4
	 sNVZf219HXdvSSx71sI1XEzAGeacG3lrvkLv3Fw0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730218AbgI3N2Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:28:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:38752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730104AbgI3NZV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:21 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC9522085B;
        Wed, 30 Sep 2020 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472320;
        bh=0+EnP3ZDT+KyhPuJqAeV8ARJRg4AwySdCsA/hCoxFaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FWF0j2dndVvWbHwfw9+pgQI2o3ygiMwAtVE7Xj0Jp5FEkxTZyiyfbRZd0aI1BxSSL
         G7SQPdipCr017pjyVThLeh/rcLfPl6qw3nFbJpwlkeb++RfyT/qmeB9vYAsoaN4rur
         1MTrZOHUYdJN+ZfhjYIENZsp1U/rjGh0pK62sNEs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6f-001XJB-Qu; Wed, 30 Sep 2020 15:25:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/52] scripts: kernel-doc: don't mangle with parameter list
Date:   Wed, 30 Sep 2020 15:24:32 +0200
Message-Id: <7fcbd109b395c0f31031257a52dcd508850e15a6.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While kernel-doc needs to parse parameters in order to
identify its name, it shouldn't be touching the type,
as parsing it is very difficult, and errors happen.

One current error is when parsing this parameter:

	const u32 (*tab)[256]

Found at ./lib/crc32.c, on this function:

	u32 __pure crc32_be_generic (u32 crc, unsigned char const *p, size_t len, const u32 (*tab)[256], u32 polynomial);

The current logic mangles it, producing this output:

	const u32 ( *tab

That's something that it is not recognizeable.

So, instead, let's push the argument as-is, and use it
when printing the function prototype and when describing
each argument.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index a0344c78c641..f549837d874d 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -655,10 +655,10 @@ sub output_function_man(%) {
 	$type = $args{'parametertypes'}{$parameter};
 	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
 	    # pointer-to-function
-	    print ".BI \"" . $parenth . $1 . "\" " . $parameter . " \") (" . $2 . ")" . $post . "\"\n";
+	    print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" . $post . "\"\n";
 	} else {
 	    $type =~ s/([^\*])$/$1 /;
-	    print ".BI \"" . $parenth . $type . "\" " . $parameter . " \"" . $post . "\"\n";
+	    print ".BI \"" . $parenth . $type . "\" " . " \"" . $post . "\"\n";
 	}
 	$count++;
 	$parenth = "";
@@ -929,7 +929,7 @@ sub output_function_rst(%) {
 	    # pointer-to-function
 	    print $1 . $parameter . ") (" . $2 . ")";
 	} else {
-	    print $type . " " . $parameter;
+	    print $type;
 	}
     }
     if ($args{'typedef'}) {
@@ -954,7 +954,7 @@ sub output_function_rst(%) {
 	$type = $args{'parametertypes'}{$parameter};
 
 	if ($type ne "") {
-	    print "``$type $parameter``\n";
+	    print "``$type``\n";
 	} else {
 	    print "``$parameter``\n";
 	}
@@ -1472,7 +1472,7 @@ sub create_parameterlist($$$$) {
 	    # Treat preprocessor directive as a typeless variable just to fill
 	    # corresponding data structures "correctly". Catch it later in
 	    # output_* subs.
-	    push_parameter($arg, "", $file);
+	    push_parameter($arg, "", "", $file);
 	} elsif ($arg =~ m/\(.+\)\s*\(/) {
 	    # pointer-to-function
 	    $arg =~ tr/#/,/;
@@ -1481,7 +1481,7 @@ sub create_parameterlist($$$$) {
 	    $type = $arg;
 	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
 	    save_struct_actual($param);
-	    push_parameter($param, $type, $file, $declaration_name);
+	    push_parameter($param, $type, $arg, $file, $declaration_name);
 	} elsif ($arg) {
 	    $arg =~ s/\s*:\s*/:/g;
 	    $arg =~ s/\s*\[/\[/g;
@@ -1506,26 +1506,28 @@ sub create_parameterlist($$$$) {
 	    foreach $param (@args) {
 		if ($param =~ m/^(\*+)\s*(.*)/) {
 		    save_struct_actual($2);
-		    push_parameter($2, "$type $1", $file, $declaration_name);
+
+		    push_parameter($2, "$type $1", $arg, $file, $declaration_name);
 		}
 		elsif ($param =~ m/(.*?):(\d+)/) {
 		    if ($type ne "") { # skip unnamed bit-fields
 			save_struct_actual($1);
-			push_parameter($1, "$type:$2", $file, $declaration_name)
+			push_parameter($1, "$type:$2", $arg, $file, $declaration_name)
 		    }
 		}
 		else {
 		    save_struct_actual($param);
-		    push_parameter($param, $type, $file, $declaration_name);
+		    push_parameter($param, $type, $arg, $file, $declaration_name);
 		}
 	    }
 	}
     }
 }
 
-sub push_parameter($$$$) {
+sub push_parameter($$$$$) {
 	my $param = shift;
 	my $type = shift;
+	my $org_arg = shift;
 	my $file = shift;
 	my $declaration_name = shift;
 
@@ -1589,8 +1591,8 @@ sub push_parameter($$$$) {
 	# "[blah" in a parameter string;
 	###$param =~ s/\s*//g;
 	push @parameterlist, $param;
-	$type =~ s/\s\s+/ /g;
-	$parametertypes{$param} = $type;
+	$org_arg =~ s/\s\s+/ /g;
+	$parametertypes{$param} = $org_arg;
 }
 
 sub check_sections($$$$$) {
-- 
2.26.2

