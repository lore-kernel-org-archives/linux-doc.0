Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1BEFD7D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Jul 2018 16:57:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbeGQRbK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Jul 2018 13:31:10 -0400
Received: from outbound.smtp.vt.edu ([198.82.183.121]:43956 "EHLO
        omr2.cc.vt.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729688AbeGQRbK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jul 2018 13:31:10 -0400
Received: from mr6.cc.vt.edu (mr6.cc.vt.edu [IPv6:2607:b400:92:8500:0:af:2d00:4488])
        by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id w6HGvbHu018483
        for <linux-doc@vger.kernel.org>; Tue, 17 Jul 2018 12:57:37 -0400
Received: from mail-qk0-f197.google.com (mail-qk0-f197.google.com [209.85.220.197])
        by mr6.cc.vt.edu (8.14.7/8.14.7) with ESMTP id w6HGvVhR031897
        for <linux-doc@vger.kernel.org>; Tue, 17 Jul 2018 12:57:37 -0400
Received: by mail-qk0-f197.google.com with SMTP id w14-v6so1354615qkw.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Jul 2018 09:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:mime-version:date:message-id;
        bh=LtVku/iuck+D5WG5Ro4sIvNmREvameSM9cOdfPJuUAE=;
        b=H9fvSbbSn/k1iRRNrrxQu+Qv5LgHCly0dW+e6zanzSwrA+2kpdw/ASwNt+Ia1xt0Mu
         +yg1FtUz8Ac//iMfDHm+SEJCb7AYi2mihPAdXuV562n9hpNapy+gdL0iw7s0e3/KPNGa
         LMd5n2hrxnhQfZ1mGYqGAyFjru53rAIBwbG3nXjKhqtW7PGgprmzzarhirklgii2+b4p
         HzhqtbXbJ5CHwg9o0K4uSEGAc+KbfvXqNFkySvafwsDIqXmkAIRGqI62v9eywvCtHeZ+
         C/clArAA9L0jXs6lqRRQDi+pDbkJtFmcDAoLY5CyP/Gsvn+Uuazj1HeDIbuJ/oW2NSF9
         +ifg==
X-Gm-Message-State: AOUpUlExOIaeny5wCSfFHC4S/OmimqnQBdfP6KrHtYgsB9px8T+WRYAk
        m5tdYcAV6ArTdZxAkKntY/a4FI7gXyR5dxTL1MgDa/Gp++5p9wiOuHiISkVuoKRzn5JYjXVNZKJ
        Vtdg4ZX+VU5nJD5OxRMyY5P+eULi6J44=
X-Received: by 2002:a37:6393:: with SMTP id x141-v6mr2341550qkb.318.1531846651692;
        Tue, 17 Jul 2018 09:57:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdpiNgvm6shMF4qL/Yf2bto6cOEuUd7mdXbqGEQORhoVFUWKjpsRzFTyyZn/mpKw+qbW7RMnQ==
X-Received: by 2002:a37:6393:: with SMTP id x141-v6mr2341537qkb.318.1531846651542;
        Tue, 17 Jul 2018 09:57:31 -0700 (PDT)
Received: from turing-police.cc.vt.edu ([2607:b400:24:0:40a6:3022:e8ef:6dd0])
        by smtp.gmail.com with ESMTPSA id k38-v6sm1341653qtc.45.2018.07.17.09.57.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jul 2018 09:57:30 -0700 (PDT)
X-Mailer: exmh version 2.8.0 04/21/2017 with nmh-1.7+dev
From:   valdis.kletnieks@vt.edu
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>
cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: PATCH scripts/kernel-doc
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date:   Tue, 17 Jul 2018 12:57:29 -0400
Message-ID: <50400.1531846649@turing-police.cc.vt.edu>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a warning whinge from Perl introduced by "scripts: kernel-doc: parse next structs/unions"

Unescaped left brace in regex is deprecated here (and will be fatal in Perl 5.32), passed through in regex; marked by <-- HERE in m/({ <-- HERE [^\{\}]*})/ at ./scripts/kernel-doc line 1155.
Unescaped left brace in regex is deprecated here (and will be fatal in Perl 5.32), passed through in regex; marked by <-- HERE in m/({ <-- HERE )/ at ./scripts/kernel-doc line 1179.

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
---
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0057d8eafcc1..31a34ced55a3 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1152,7 +1152,7 @@ sub dump_struct($$) {
 	}
 
 	# Ignore other nested elements, like enums
-	$members =~ s/({[^\{\}]*})//g;
+	$members =~ s/(\{[^\{\}]*})//g;
 
 	create_parameterlist($members, ';', $file, $declaration_name);
 	check_sections($file, $declaration_name, $decl_type, $sectcheck, $struct_actual);
@@ -1176,7 +1176,7 @@ sub dump_struct($$) {
 			$declaration .= "\t" x $level;
 		}
 		$declaration .= "\t" . $clause . "\n";
-		$level++ if ($clause =~ m/({)/ && !($clause =~m/}/));
+		$level++ if ($clause =~ m/(\{)/ && !($clause =~m/}/));
 	}
 	output_declaration($declaration_name,
 			   'struct',

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
