Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D1BD57D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 16:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfADQcl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 11:32:41 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40262 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfADQcl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 11:32:41 -0500
Received: by mail-pf1-f196.google.com with SMTP id i12so18535417pfo.7
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 08:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d4h99nhIalOat/BOM1eShspSo8bU6HfXJ3HkIWa/dOA=;
        b=Q/yXBYXuGXjDAicTgXnDToB9NXpEFBoFsycZP2LbtasciqOlaMmDh2mWXMqQQI5qsD
         pSezpLkF1+dgpG7aNnroegIxj4VeOHfTCVssc7+De16vyt04IG/6dTqtjPScIEddKeoj
         eG5x2BCeG8Elw6srdDcHwnBO9OpSE34htft2HYJ2PU231tRUyQvBX6f9VsCX7RVimQPP
         fNdve+9hEArtjU7VU+6Lf4NXBY+hG99Z6iuNVYVnhz9c1/eAMjLQ8acg8nT4iS1U5azr
         c7oI+yW0GGfOn5zqkXOJqtIOUXSfixDpkNc8SZ9xe8O1ClDZsvadei2V0RvvALe3+fl3
         qyWw==
X-Gm-Message-State: AJcUukfAUkLBENIV9fNWaGwM4gdfW2j2fhhsIqcA8DdPTNrWym4X9fnj
        4yvc/EZw0BRPPDwRd9g+6pw=
X-Google-Smtp-Source: ALg8bN7p6WDJUAtRbYY9+m4MU/05RDymFZBL3vkQmXdVsPbp3PSrGT0TkkReCGh/z0r3+K61koUmWg==
X-Received: by 2002:a62:55c4:: with SMTP id j187mr52780127pfb.129.1546619559925;
        Fri, 04 Jan 2019 08:32:39 -0800 (PST)
Received: from ?IPv6:2620:15c:2cd:203:5cdc:422c:7b28:ebb5? ([2620:15c:2cd:203:5cdc:422c:7b28:ebb5])
        by smtp.gmail.com with ESMTPSA id g185sm81140883pfc.174.2019.01.04.08.32.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jan 2019 08:32:39 -0800 (PST)
Message-ID: <1546619558.163063.34.camel@acm.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into
 .dir-locals.el
From:   Bart Van Assche <bvanassche@acm.org>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>, Zhang Le <r0bertz@gentoo.org>,
        Li Yang <leo@zh-kernel.org>
Date:   Fri, 04 Jan 2019 08:32:38 -0800
In-Reply-To: <4009470.9o5kGc7Prg@harkonnen>
References: <20190104003957.82220-1-bvanassche@acm.org>
         <4009470.9o5kGc7Prg@harkonnen>
Content-Type: text/plain; charset="UTF-7"
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2019-01-04 at 10:44 +-0100, Federico Vaga wrote:
+AD4 On Friday, January 4, 2019 1:39:57 AM CET Bart Van Assche wrote:
+AD4 +AD4 For new kernel developers who use emacs it is tedious to follow the
+AD4 +AD4 instructions in Documentation/process/coding-style.rst for configuring
+AD4 +AD4 emacs. Make it easier for emacs users by moving these settings into the
+AD4 +AD4 top-level .dir-locals.el file. Emacs supports directory-local variables
+AD4 +AD4 since version 23.1, released in 2009. See also
+AD4 +AD4 https://lists.gnu.org/archive/html/info-gnu-emacs/2009-07/msg00000.html
+AD4 +AD4 
+AD4 +AD4 The settings in .dir-locals.el are not identical to those in
+AD4 +AD4 Documentation/process/coding-style.rst. The most important difference
+AD4 +AD4 is that +ACI(arglist-cont-nonempty c-lineup-gcc-asm-reg
+AD4 +AD4 c-lineup-arglist-tabs-only)+ACI (which is not a valid alist) has been
+AD4 +AD4 changed into +ACI(arglist-cont-nonempty . c-lineup-arglist)+ACI. I have
+AD4 +AD4 verified with several large and nontrivial kernel source files that
+AD4 +AD4 the settings in .dir-locals.el format code according to what checkpatch
+AD4 +AD4 expects.
+AD4 
+AD4 Isn't it better if we collect such configuration files into a dedicated 
+AD4 directory (where exactly?) instead of putting them in the top-level one? Then, 
+AD4 the developer has to copy/link the configuration file into the top-level 
+AD4 directory.

I don't think so. The reason we have the checkpatch script and the
coding-style.rst document in the kernel tree is to promote coding style
uniformity. Placing the .dir-locals.el at the top level serves the same
purpose. Additionally, if the .dir-locals.el file is not at the top level
many kernel developers will overlook it.

+AD4 If we accept emacs configuration files in the top-level directory we will have 
+AD4 to accept also the ones from other editors (of course, when they support local 
+AD4 configurations).

I am aware of this and I'm fine with this.

+AD4 In addition, probably, there are people who do not want to use local
+AD4 configurations.

I expect that only a minority will not want to use the .dir-locals.el file.
Anyone who wants to override any of the settings from .dir-locals.el
can do that by using one of the methods explained in the emacs manual, e.g.
by adding a .dir-locals-2.el file. See also
https://www.gnu.org/software/emacs/manual/html+AF8-node/emacs/Directory-Variables.html.

+AD4 +AD4 The Italian and Chinese translations of the modified paragraphs have
+AD4 +AD4 been generated by Google Translate.
+AD4 
+AD4 Thanks for the Italian translation but unfortunately Google Translate is not 
+AD4 up to the task :) Any one can understand the translation that Google did but 
+AD4 it is incorrect.
+AD4 
+AD4 I can give you a correct translation once it has been agreed on the English 
+AD4 version.

Thank you for this offer. I will leave out the Italian translation.

Bart.
