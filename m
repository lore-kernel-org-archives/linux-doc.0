Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AA9C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 03:17:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94279206F7
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 03:17:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KZStvtZJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgJ3DRo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 23:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgJ3DRn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 23:17:43 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51629C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 20:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=z+9sW2gjIBnOP0LtEyQf9EeeoznFSw4KGlnczbiGLjU=; b=KZStvtZJ7NG/zmeITa+hk/4FV6
        S26UUbG8kl/GN8Bln7o9ITxZ+Ytubq5QEi8+QDdHlqD2nv7XvB/WXlcDXVKkfitrjQrSdhOCh3W4T
        p8Akt1CXp/ZUJgKSPG4n7zjyxZ5BvSThcv9Xlo9+N4MCZqSZ+MyWW8GKYJOJYP2h/aWrQlO1bB4SO
        H4NtIiO30+319GLPotMSnfCHVZ2CPsN0bxoipcbATswQYqhDrcFFEG0pcImWYgxcWaY1leJae/bCx
        Yg+3Z4pgDrahgokaZAG0KeQ7etZ5m5RpmKINyVBcvv2NQ3LHbahT3niJDIDSTktbFBHS/YDOrsA6z
        12Cuv9YA==;
Received: from [2601:1c0:6280:3f0::371c]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kYKv3-0001dK-GR; Fri, 30 Oct 2020 03:17:38 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: excess bolding in html
Message-ID: <31362b3b-469f-1f74-d929-b6faa7ae4e30@infradead.org>
Date:   Thu, 29 Oct 2020 20:17:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I have noticed a few cases of excess bolding in generated html (seen in both
Firefox and Opera web browsers).

(1) https://www.kernel.org/doc/html/latest/kernel-hacking/locking.html#futex-api-reference

In the description of struct hrtimer_sleeper * futex_setup_timer:

Both the Return line and the next following line are all bold, while the third (final)
line is not bold (as expected):

Return

Initialized hrtimer_sleeper structure or NULL if no timeout
    value given 

(2) https://www.kernel.org/doc/html/latest/filesystems/api-summary.html

In the description of int seq_open():

Both the Note line and the following line are all bold, while the final line
is not bold (as expected):

Note

seq_open() will allocate a struct seq_file and store its
    pointer in file->private_data. This pointer should not be modified. 



I looked at scripts/kernel-doc briefly but did not see where this is
happening, so if anyone out there wants a small project to fix,
please go for it.


-- 
~Randy

