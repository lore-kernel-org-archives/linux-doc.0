Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE7F77D0D8
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 22:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfADWjN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 17:39:13 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39284 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbfADWjN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 17:39:13 -0500
Received: by mail-pl1-f196.google.com with SMTP id 101so18014781pld.6
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 14:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UnTc67cQ0buHqQjnVXp21T5/l6QzSz2FFMcQhKvMTNY=;
        b=LJ7x7l7Crh4Dfu0snH5dgbQRrB9fyf9P7g0wgeyh8HgecoHGOwz20icb3jIgfP6Wub
         z4/MREuhMtKSQT9lJ+9B5d8IoKgiiqqLPQP/qguJZe35qaDnpxKjPETGN6kevcI4bJ7Q
         hN5sYd/AvLjg4TnaGX7bj2TLIy0ztzy/70s21ehm6mjGPS0jjkZwi7BhOqHRqABV2Xt5
         yFh/2Gm8fLmsMwLOFha3NmfNqxqV4EdvhgJ/ldaYrkF/r+2xPGmkrZhH20WhOvlI4BUM
         GB3UqWplBPZ8H6p5UkXBbosV6JbtBRITwfu2yZHBDwsbF8T2ZAB7gvB1EMekir2gUJkz
         B5yQ==
X-Gm-Message-State: AJcUukd7WyULKeE8dJgI9Q8vx0+1KlMLPPaCvFIxgh3ST6LO+wZiQyCP
        G8Y+G1UrEMtBqETcbXDSA38=
X-Google-Smtp-Source: ALg8bN51Sk+fslBWJmvxHAV45E/Yh7aUHX1adFBysvMzW0jX89cX4Tptq7Hk1Y0EG3Xygd2RMZf9SQ==
X-Received: by 2002:a17:902:bf44:: with SMTP id u4mr42893697pls.5.1546641552394;
        Fri, 04 Jan 2019 14:39:12 -0800 (PST)
Received: from ?IPv6:2620:15c:2cd:203:5cdc:422c:7b28:ebb5? ([2620:15c:2cd:203:5cdc:422c:7b28:ebb5])
        by smtp.gmail.com with ESMTPSA id m3sm70035336pfi.102.2019.01.04.14.39.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jan 2019 14:39:11 -0800 (PST)
Message-ID: <1546641550.83374.8.camel@acm.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Use directory-local
 variables for emacs
From:   Bart Van Assche <bvanassche@acm.org>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison@she-devel.com>,
        Joe Perches <joe@perches.com>, Li Yang <leo@zh-kernel.org>
Date:   Fri, 04 Jan 2019 14:39:10 -0800
In-Reply-To: <1951386.HLNclI27qt@harkonnen>
References: <20190104210834.89231-1-bvanassche@acm.org>
         <1951386.HLNclI27qt@harkonnen>
Content-Type: text/plain; charset="UTF-7"
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2019-01-04 at 23:10 +-0100, Federico Vaga wrote:
+AD4 On Friday, January 4, 2019 10:08:33 PM CET Bart Van Assche wrote:
+AD4 +AD4 In emacs 23.1 support for directory-local variables was added (see also
+AD4 +AD4 https://lists.gnu.org/archive/html/info-gnu-emacs/2009-07/msg00000.html).
+AD4 +AD4 Simplify the settings in coding-style.rst by using that feature.
+AD4 +AD4 Additionally, do not inherit any settings from emacs' linux coding style
+AD4 +AD4 to minimize dependencies on the version of emacs that is being used.
+AD4 +AD4 
+AD4 +AD4 I have verified with several large and nontrivial kernel source files
+AD4 +AD4 that the new settings format code according to what checkpatch expects.
+AD4 +AD4 
+AD4 +AD4 Signed-off-by: Bart Van Assche +ADw-bvanassche+AEA-acm.org+AD4
+AD4 +AD4 Cc: Matthew Wilcox +ADw-willy+AEA-infradead.org+AD4
+AD4 +AD4 Cc: Geyslan G. Bem +ADw-geyslan+AEA-gmail.com+AD4
+AD4 +AD4 Cc: Tiago Natel de Moura +ADw-tiago4orion+AEA-gmail.com+AD4
+AD4 +AD4 Cc: Alison Chaiken +ADw-alison+AEA-she-devel.com+AD4
+AD4 +AD4 Cc: Joe Perches +ADw-joe+AEA-perches.com+AD4
+AD4 +AD4 Cc: Federico Vaga +ADw-federico.vaga+AEA-vaga.pv.it+AD4
+AD4 +AD4 Cc: Li Yang +ADw-leo+AEA-zh-kernel.org+AD4
+AD4 +AD4 ---
+AD4 +AD4  Documentation/process/coding-style.rst +AHw 57 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----------
+AD4 +AD4  1 file changed, 37 insertions(+-), 20 deletions(-)
+AD4 +AD4 
+AD4 +AD4 Changes compared to v1:
+AD4 +AD4 - Removed top-level .dir-locals.el file again and updated coding-style.rst
+AD4 +AD4 instead. - Restored the humourous paragraph about emacs.
+AD4 +AD4 - Left out Italian and Chinese translations.
+AD4 
+AD4 Since now there are only code changes, I think you can apply them on both 
+AD4 Italian and Chinese translations.

Good point.

+AD4 As a general comment, I personally think that it worth to mention the fact 
+AD4 that the user can take this code (actually part of it) and put it in a .dir-
+AD4 locals.el file in the top-level directory.

I'm not sure we should recommend this. Settings in +AH4-/.emacs are not affected
by git clean -f -x but .dir-locals.el is removed by that command.

Thanks,

Bart.
