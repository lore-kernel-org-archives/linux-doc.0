Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BF0C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BBCE64E56
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhBHP0A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 10:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhBHPXn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 10:23:43 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5D8C061786;
        Mon,  8 Feb 2021 07:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=LjEEo6m8ROQquxZPtvT/XQS4NjsfoVA9p6+PvfWjl5c=; b=ToamOf01PHBDaLe/4ABUrATAdV
        izah7uxP7+json81b25ecRYKJoNotGQntDKkn0zpTcfSDLqEL2tVGylVa5qhkxIW6UxExzeCmKAuB
        snkv+HbOBqWXVlvgFXnbthMQgbeJTxuzGDfZUaA5iUdotYC4nf+fKQmGyd708t3ij+vy+y3+egCpD
        BNBcyZsblbWkHAIW9jIffxvE8C20FTP8KNKZXJvunI51BmVT12Juhq4Mh6bXfsxuHl6cp1D9tCfGb
        9iPu+uJ1t5HwL9XybcJSGya7SISk7O3ysjjTgjCR0HIhJpa2oklxN8aLfmkcHysBJcpqmDpIW+zeh
        bW2Noe4w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l98NA-0068lP-W4; Mon, 08 Feb 2021 15:22:45 +0000
Date:   Mon, 8 Feb 2021 15:22:44 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Kalesh Singh <kaleshsingh@google.com>
Cc:     jannh@google.com, jeffv@google.com, keescook@chromium.org,
        surenb@google.com, minchan@kernel.org, hridya@google.com,
        rdunlap@infradead.org, christian.koenig@amd.com,
        kernel-team@android.com, Alexey Dobriyan <adobriyan@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        NeilBrown <neilb@suse.de>, Anand K Mistry <amistry@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Michel Lespinasse <walken@google.com>,
        Bernd Edlinger <bernd.edlinger@hotmail.de>,
        Andrei Vagin <avagin@gmail.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/2] procfs/dmabuf: Add inode number to /proc/*/fdinfo
Message-ID: <20210208152244.GS308988@casper.infradead.org>
References: <20210208151437.1357458-1-kaleshsingh@google.com>
 <20210208151437.1357458-2-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208151437.1357458-2-kaleshsingh@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 08, 2021 at 03:14:28PM +0000, Kalesh Singh wrote:
> -	seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\n",
> +	seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\ninode_no:\t%lu\n",

You changed it everywhere but here ...

