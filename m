Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A880D7D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 16:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfADQGF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 11:06:05 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46296 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfADQGF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 11:06:05 -0500
Received: by mail-pf1-f195.google.com with SMTP id c73so18493207pfe.13
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 08:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cbxxsvn132nhquHnnhqNnUrFU6o6OmHe5S0O2xaS2xw=;
        b=Nspc6zdyXXNDyweqGhTVfiUWR5QKTH3aBRY2jdAw7THRoa0kYA6w37OanEFrDQ5TDS
         rK3u7ChR7KKjhprXb1LpaufWjU5GqgkiVfPXEu5ODi9K3Uk3Jzv0aaxfC3FEwYnYLSD9
         4HJVDV9qYwn4zMGQN/rSRnyPeiCMLldCUIbu6Y9oz8lTJfMHJe5wcbdT9Q7Qp5+wUYqy
         IcE/UJas9tKAEvgcn05DlxA9EAtIEjdNrL96dWlSYlPIc+6UrAMfWOW8xEFgXxce4O7T
         UpjghDEGT1Iv6QipiO36VvBadTajI3ks0YTHVXe5ddI8adoxQy9kJxo7RU6iYSch9Ws5
         Naqg==
X-Gm-Message-State: AA+aEWb2RDVfnrPTqTHd07VzUJr1p93bmqabTFL8ePvPA2t1+AV8W91g
        1efUYUdGtLms6kwAiTAZ9wU=
X-Google-Smtp-Source: AFSGD/VwdelhyFDyRLsZQWyi/UppdFNgK9gB/CsSKNnpSi0uqk84H9eH/sY353FBGWcVrgYbwzcJ6w==
X-Received: by 2002:a62:35c7:: with SMTP id c190mr54284997pfa.76.1546617963805;
        Fri, 04 Jan 2019 08:06:03 -0800 (PST)
Received: from ?IPv6:2620:15c:2cd:203:5cdc:422c:7b28:ebb5? ([2620:15c:2cd:203:5cdc:422c:7b28:ebb5])
        by smtp.gmail.com with ESMTPSA id w128sm84062328pfw.79.2019.01.04.08.06.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jan 2019 08:06:03 -0800 (PST)
Message-ID: <1546617961.163063.23.camel@acm.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into
 .dir-locals.el
From:   Bart Van Assche <bvanassche@acm.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Zhang Le <r0bertz@gentoo.org>, Li Yang <leo@zh-kernel.org>
Date:   Fri, 04 Jan 2019 08:06:01 -0800
In-Reply-To: <20190104021221.GS6310@bombadil.infradead.org>
References: <20190104003957.82220-1-bvanassche@acm.org>
         <20190104021221.GS6310@bombadil.infradead.org>
Content-Type: text/plain; charset="UTF-7"
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2019-01-03 at 18:12 -0800, Matthew Wilcox wrote:
+AD4 On Thu, Jan 03, 2019 at 04:39:57PM -0800, Bart Van Assche wrote:
+AD4 +AD4 +AEAAQA -571,50 +-571,11 +AEAAQA item, explaining its use.
+AD4 +AD4  9) You've made a mess of it
+AD4 +AD4  ---------------------------
+AD4 +AD4  
+AD4 +AD4 -That's OK, we all do.  You've probably been told by your long-time Unix
+AD4 +AD4 -user helper that +AGAAYA-GNU emacs+AGAAYA automatically formats the C sources for
+AD4 +AD4 -you, and you've noticed that yes, it does do that, but the defaults it
+AD4 +AD4 -uses are less than desirable (in fact, they are worse than random
+AD4 +AD4 -typing - an infinite number of monkeys typing into GNU emacs would never
+AD4 +AD4 -make a good program).
+AD4 
+AD4 I feel like this patch makes the mistake a lot of doc patches do ... it
+AD4 removes some of the whimsical humourous comments that have been with
+AD4 us for years.  I don't think this paragraph needs to be changed in
+AD4 the slightest.
+AD4 
+AD4 +AD4 -So, you can either get rid of GNU emacs, or change it to use saner
+AD4 +AD4 -values.  To do the latter, you can stick the following in your .emacs file:
+AD4 +AD4 -
+AD4 
+AD4 +AFs...+AF0
+AD4 +AD4 -
+AD4 +AD4 -This will make emacs go better with the kernel coding style for C
+AD4 +AD4 -files below +AGAAYAB+-/src/linux-trees+AGAAYA.
+AD4 +AD4 +-+AGAAYA-GNU emacs+AGAAYA automatically formats the C sources for you. However,
+AD4 +AD4 +-the defaults it uses are less than desirable. Use a version of emacs
+AD4 +AD4 +-that support directory local variables such that it automatically
+AD4 +AD4 +-picks up the settings from .dir-locals.el in the kernel top level
+AD4 +AD4 +-directory.
+AD4 
+AD4 How about:
+AD4 
+AD4 So, you can either get rid of GNU emacs, or change it to use saner
+AD4 defaults.  Versions of emacs since +AFs...+AF0 support directory local
+AD4 variables and will pick up the settings from .dir-locals.el in the
+AD4 kernel top level directory.

Hi Matthew,

Thanks for having taken a look. I had removed the first paragraph of section
9 since it seemed more negative than humouristic to me. Anyway, I will make
the change that you proposed.

Bart.
