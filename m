Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 350827D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 20:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730251AbfFGU50 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 16:57:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42961 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730233AbfFGU5Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jun 2019 16:57:25 -0400
Received: by mail-lf1-f68.google.com with SMTP id y13so2589559lfh.9
        for <linux-doc@vger.kernel.org>; Fri, 07 Jun 2019 13:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lYNEKon6hw5ozLF7/eHiScGkoKPZ0mKYiX3PiahFBLw=;
        b=F7Wmh3q5hTHJ7+8NfKn3Q9mrsjs4JGeQZci0PL3H7hbu3GM5K9yUsz+Y0lgGRdBSdw
         +328NWNP6IM8aUm8EjN2Pd17RWK8NOdSUoO5S7ntn/z5g5RWrIZMcumaXQai6X3CXyEz
         BTphLGtLKEzrV1gZxidM73Z5KN4zHh5E2v5y5RfDYyS3RAVcE44ehACnh+yYBOTkI6ex
         GAIvwDGuBk7jbRANq1zYREobgsZOOPeA3mYAQ+avOz6ivrRpqghggPfxfWeNmfqmhXz+
         mLgdz2EccWQ3t0kUo3VrJ9H6siVLFsY94ENBceRRT/iSvi2sqKJcgKc2W3kMsgQBPqQN
         zHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lYNEKon6hw5ozLF7/eHiScGkoKPZ0mKYiX3PiahFBLw=;
        b=hoT9nuw6NEeqOqyqcCsiBSiY2DFhaEMHRRYW/ZXcjbRQJlImVhfXkklAzy8Yh5kFJ7
         s1B0UWSkFDXgF7/atH5TbGSMt5vCpk+XnbtGuWAJfsMDDGapTJK4Bnt6Gi+Y8ZlpZAvI
         0917fNKCuxIONp2VjFS9PWcCXkqxYY+qO57+wBLqZsNendHi1A7o/8ZL8aTiJeBYuW97
         zNtALeNcvDK7Q5RYGJHXli8PrYSu2GtVQNEbABjQ0qDMR2fLk9U+43AMa3wTzISFOSS0
         O11z01MedA6z50fqG8sH3H78H0nhzwC8eez3x/r2dV4BCC6M5yF7e+J5ugEL//cL8jwW
         OmvQ==
X-Gm-Message-State: APjAAAWPxYVxwuhGff/d/rdX0WCmzKlD1AL2WS3AvfWeKDt13HinbxgA
        Gcgn9lv7N0fs3gWGgpCc684GRq15yQXbyy1iu8Cv7A==
X-Google-Smtp-Source: APXvYqxKaiD6kl9h8t32IOzlBaDqaa1v0jAvUNt4RxTlRdfOHLS4WOZr4SjmaRPEIRLtKJJjaaIYIUpiBZDJGi0LUrA=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr15902022lfc.60.1559941044041;
 Fri, 07 Jun 2019 13:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559171394.git.mchehab+samsung@kernel.org> <ab694e03ba6de8908d0a19a58408180eee3f795b.1559171394.git.mchehab+samsung@kernel.org>
In-Reply-To: <ab694e03ba6de8908d0a19a58408180eee3f795b.1559171394.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 22:57:16 +0200
Message-ID: <CACRpkdYmqGj3PC1firW2awWyi4OuzHwSrYo7n3Ph8j0==824qA@mail.gmail.com>
Subject: Re: [PATCH 16/22] docs: gpio: driver.rst: fix a bad tag
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 30, 2019 at 1:24 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> With ReST, [foo]_ means a reference to foo, causing this warning:
>
>     Documentation/driver-api/gpio/driver.rst:419: WARNING: Unknown target name: "devm".
>
> Fix it by using a literal for the name.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
