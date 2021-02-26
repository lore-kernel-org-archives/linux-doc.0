Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C20C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 10:22:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2497E64ED2
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 10:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhBZKWm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Feb 2021 05:22:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbhBZKWj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 05:22:39 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A84C061574
        for <linux-doc@vger.kernel.org>; Fri, 26 Feb 2021 02:21:58 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id s24so9111407iob.6
        for <linux-doc@vger.kernel.org>; Fri, 26 Feb 2021 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BXuN/OhxLOmuaTvPo1WVoYs9rPWwpwpRK9bD5YtTbxw=;
        b=sVoNMIIsZ776rwWAnr8L8GdvZDCzUg03yC42iOm0Z6DeoOlP0NB36bLz/RzHXbdGlF
         YnDNujXlXA4UKCUXumklH2ADESPGAlS/dmSl/7tN+etJZjTqgxeTkfM6dR2x7agNThCv
         rWpIx//iN7rnjn1R8A688uHAR9wqno8poMG33exGhHNaJ9jJMOfZDEo6DH/NDA6Gr88u
         sP+2USWyYC+O1ydYU2Q+nw0KONLfiLXuvnSMmHQt9kdTRx160klMuNCm+N5W1t0/z8CM
         U8vFlgYZQ3ZMLSTcyoGmqhbZiY1KdkmhIvC6/HU93nCSCZYQF/px3rb0UDznNRPy531U
         aTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BXuN/OhxLOmuaTvPo1WVoYs9rPWwpwpRK9bD5YtTbxw=;
        b=OlzsMmRvZppNlocAeW2VIg1j1zDJnPeyExAIEcbHlz0PfmwyEj/rBG7kZ9NqS8NZIB
         VTFGi1URlvEt0j/Ks6g7NBY+0ZzfGXhpMAON0bXjLX9H7SmEEpIKbe9r/yXEXl/jCkkF
         7rIDFYaGPQ+A0xMWnYfbccks+mWb409eZQVk1FtzurutR0xjhHN0iDwEgHM1mOHW4aSG
         cgGLYrhgArBWC0cwyhFrd3LSHXvyXufJl3J7TEqr2IMvlI31zYndVcB8MRCkdyRyS+8c
         9SOFKQYVCpMp0baj1b1GoBbtxFFUglr/GmndyhbBy5j7kzUyOVCvkgW3t7fZVDS6FCwU
         DDgw==
X-Gm-Message-State: AOAM533Sr7TIpBHN7LLDy+MH4UlYe4FqQyVpgqTFaSj4IDuD+EoGdBF2
        wBmyOtQ5HZ+qSd99Z6136ttBI99dKKnMRdCjhJo=
X-Google-Smtp-Source: ABdhPJxHg/mCi+jiPGWb2f9Y4GoIjLJjCng9e51bf04oXLvrgft9yXBzLnHgEXmvmYXGGx0Xq1rjsXtlj+QRqfUnuyk=
X-Received: by 2002:a02:866d:: with SMTP id e100mr2140392jai.139.1614334918103;
 Fri, 26 Feb 2021 02:21:58 -0800 (PST)
MIME-Version: 1.0
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Fri, 26 Feb 2021 11:21:47 +0100
Message-ID: <CAKXUXMzstVLAj7KBHxOdW4BYBg_paDOdJfutx4rPYxU+jfcKUg@mail.gmail.com>
Subject: Yet another kernel-doc parsing issue
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Aditya,

here is another example of expressions that kernel-doc cannot properly parse:

include/rdma/ib_cm.h:571: warning: cannot understand function
prototype: 'const char *__attribute_const__ ibcm_reject_msg(int
reason); '
include/rdma/iw_cm.h:224: warning: cannot understand function
prototype: 'const char *__attribute_const__ iwcm_reject_msg(int
reason); '
include/rdma/rdma_cm.h:348: warning: cannot understand function
prototype: 'const char *__attribute_const__ rdma_reject_msg(struct
rdma_cm_id *id,                                                 int
reason); '

It is probably easy to extend the current patterns of attributes in
kernel-doc by just __attribute_const__, but that is of course only a
quick hotfix for kernel-doc. You can start with that.

But maybe you can come up with a better general solution? I see that
there are multiple tools in the kernel that need to maintain a list of
attributes for their internal C parsers, maybe you find a way to
refactor them that they share a common file for recording the valid
and supported attributes.


Best regards,

Lukas
