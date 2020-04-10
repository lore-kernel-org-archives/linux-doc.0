Return-Path: <SRS0=nlb3=52=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24895C2D0EC
	for <linux-doc@archiver.kernel.org>; Fri, 10 Apr 2020 19:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED05F2083E
	for <linux-doc@archiver.kernel.org>; Fri, 10 Apr 2020 19:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIxtx7H7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDJTwT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Apr 2020 15:52:19 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45338 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgDJTwT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Apr 2020 15:52:19 -0400
Received: by mail-wr1-f66.google.com with SMTP id v5so3434253wrp.12
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2020 12:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yRE/K0sM82C5HUk6HMKL3mTsdxv6kZ32GYxlfuDmAwE=;
        b=GIxtx7H7RuqfEUEKVDvnbOTT6iehEkIzbz7T+t8JsHFsqgFtY194JKMPIUDRv6Rvdw
         X/UjPd4hB+OoDMO1brRQB+C+bfl45qdfsXHmiGLDVHq1Log0KovWCJYrnqAGm+4jkX9F
         gS5YM5uB4/zNTVmGPtgUWvGeMOFwuwG+qBosOA0UKwuyThPu3ObTDf1UKqN0glsOG/zk
         F8wAw/IVy9TYjVyHNFK2It6yyhldCusl09MTvFuJf5adELjZCNNrcN+JV6c3YDgsIdXv
         n9lSXa+eej+AIaXsWj8PhnuroP4cZoMFXKYmqxlVFXM97KU8Bb/ZIBb+frDz9v8cDLwR
         wlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yRE/K0sM82C5HUk6HMKL3mTsdxv6kZ32GYxlfuDmAwE=;
        b=jVObhOnPPD4fijZOrqf2XDs3rvCBSXazPmYuBxTneE4/63ie44MXtnfzBfVv8Ge9bV
         Q7zhUGtPZPhQL65tSRik2uqEcmLuJy/yT51uihpcat232epeYFIBuKMYdFKr2wAvJaZ/
         mTSdwxRQlsqDYVr7f+Q7MG6I2vbibrQnBPRJLDy/hgjeNGQChvFF2vwg4gP6n8YIw4aN
         HuiBbVy8wq2CcbJNGAPfT4w8I8odLTZGXIEzVq9SM6t6IVt5xIU/6d4iANjnI9O9rt8y
         J3TmduSnKJSKZn8nRBZ0VN0WyhqLyPaEacJkIuU0nfWExdC1AhOPXKOCOwbuFM0lIyJE
         vP3Q==
X-Gm-Message-State: AGi0PuYVzgqV/o2f9AtBMMBIz6izH3FAkqbVlKPQ5l9q+mnEhBoTLtlB
        8OLLrShismXgf96gb9bw5YQ=
X-Google-Smtp-Source: APiQypKa+u1pmKli4ePtq9z1OBIiD8KOYUuySmMcSJEy/lZ7o4+agQzXzTv+Y37bm8oEDLn+fa514A==
X-Received: by 2002:a05:6000:108f:: with SMTP id y15mr6461764wrw.423.1586548337916;
        Fri, 10 Apr 2020 12:52:17 -0700 (PDT)
Received: from 0339e8fc5325.v.cablecom.net ([45.87.212.59])
        by smtp.gmail.com with ESMTPSA id p190sm4065252wmp.38.2020.04.10.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 12:52:17 -0700 (PDT)
From:   Lothar Rubusch <l.rubusch@gmail.com>
To:     corbet@lwn.net, brendanhiggins@google.com
Cc:     linux-doc@vger.kernel.org, Lothar Rubusch <l.rubusch@gmail.com>
Subject: [PATCH] scripts: kernel-doc: naming unnamed variadics
Date:   Fri, 10 Apr 2020 19:52:01 +0000
Message-Id: <20200410195201.20920-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently the kernel-doc is able to document different types of function
or macro parameters, respectively. Provided an annotation starting with
'@' and the related parameter. Its explanation will appear in the API
docs.

Source        | kernel-doc syntax  | Documentation
--------------+--------------------+--------------------------
func(foo)     | @foo: some desc    | "foo: some desc"
func(foo...)  | @foo...: some desc | "foo: some desc"
func(...)     | @...: some desc    | "...: some desc:
func(...)     | <leave empty>      | "...: variable parameter"

This patch extends the kernel-doc possibilities by:

func(...)     | @...foo: some desc | "foo: some desc"

What is this good for?

Using e.g. a macro with unnamed variadic argument ('...'), in the document
will always show three dots. In practice it is assigned to a specific
variable and represents some entity, not just three dots. In some cases
the name of the entity could make thinks more understandable than using
just the three variadic dots.

Currently this is limited to the only alternative to touch the sources,
and change the unnamed variadic i.e. "..." into a named variadic, e.g.
"foo...".

But shall we rather change the sources to work for the limitations of
our (documentation) scripts, or was it better to improve the scripts
directly to offer that flexibility? Please let the author know if this
feels rather some kind of documentation chindogu, or if it could be
useful?

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 scripts/kernel-doc | 69 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index f2d73f04e71d..ac5db78d36e9 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -469,18 +469,29 @@ sub dump_section {
     my $name = shift;
     my $contents = join "\n", @_;
 
+	my $name_orig = $name;
     if ($name =~ m/$type_param/) {
-	$name = $1;
-	$parameterdescs{$name} = $contents;
-	$sectcheck = $sectcheck . $name . " ";
+		if ($name_orig =~ /^@\.\.\.\w/) {
+			# in case of a '@...name' notation, obtain the variadic argument
+			# from the parsed function/macro, but in the documentation set
+			# the name, cut off the dots
+			$name = $name_orig;
+			$name =~ s/@//;
+		} else {
+			# in in case of named or unnamed variadic arguments
+			$name = $1;
+		}
+		$parameterdescs{$name} = $contents;
+		$sectcheck = $sectcheck . $name . " ";
         $parameterdesc_start_lines{$name} = $new_start_line;
         $new_start_line = 0;
     } elsif ($name eq "@\.\.\.") {
-	$name = "...";
-	$parameterdescs{$name} = $contents;
-	$sectcheck = $sectcheck . $name . " ";
-        $parameterdesc_start_lines{$name} = $new_start_line;
-        $new_start_line = 0;
+		# TODO is this condition actually ever reached?
+		$name = "...";
+		$parameterdescs{$name} = $contents;
+		$sectcheck = $sectcheck . $name . " ";
+		$parameterdesc_start_lines{$name} = $new_start_line;
+		$new_start_line = 0;
     } else {
 	if (defined($sections{$name}) && ($sections{$name} ne "")) {
 	    # Only warn on user specified duplicate section names.
@@ -1442,21 +1453,31 @@ sub push_parameter($$$$) {
 	}
 
 	$anon_struct_union = 0;
-	$param =~ s/[\[\)].*//;
 
+	$param =~ s/[\[\)].*//;
 	if ($type eq "" && $param =~ /\.\.\.$/)
 	{
-	    if (!$param =~ /\w\.\.\.$/) {
-	      # handles unnamed variable parameters
-	      $param = "...";
-	    }
-	    elsif ($param =~ /\w\.\.\.$/) {
-	      # for named variable parameters of the form `x...`, remove the dots
-	      $param =~ s/\.\.\.$//;
-	    }
-	    if (!defined $parameterdescs{$param} || $parameterdescs{$param} eq "") {
-		$parameterdescs{$param} = "variable arguments";
-	    }
+		if ($param =~ /\w\.\.\.$/) {
+			# for named variable parameters of the form `x...`, chop off dots
+			$param =~ s/\.\.\.$//;
+		}
+		else {
+			# has unnamed variadic '...', check with or without description naming
+			my $param_dotprefixed = (grep { $_ =~ /^\.\.\.\w/ } keys %parameterdescs)[0];
+			if (defined $param_dotprefixed) {
+				# handles unnamed variable parameters, but named description
+				$param = $param_dotprefixed;
+				$param =~ s/^\.\.\.//;
+				$parameterdescs{$param} = delete $parameterdescs{$param_dotprefixed};
+			}
+			else {
+				# handles unnamed variable parameters
+				$param = "...";
+			}
+		}
+		if (!defined $parameterdescs{$param} || $parameterdescs{$param} eq "") {
+			$parameterdescs{$param} = "variable arguments";
+		}
 	}
 	elsif ($type eq "" && ($param eq "" or $param eq "void"))
 	{
@@ -1527,6 +1548,14 @@ sub check_sections($$$$$) {
 				$err = 0;
 				last;
 			}
+
+			my $sects_nodots = $sects[$sx];
+			$sects_nodots =~ s/^\.\.\.//;
+			if ($prm_clean eq $sects_nodots) {
+				# variadic unnamed parameter, which hase a description name
+				$err = 0;
+				last;
+			}
 		}
 		if ($err) {
 			if ($decl_type eq "function") {
-- 
2.20.1

