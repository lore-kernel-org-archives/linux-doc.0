Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC830C5519F
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 02:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52123246CA
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 02:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgKSCMI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Nov 2020 21:12:08 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:45256 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726243AbgKSCMH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Nov 2020 21:12:07 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UFqkO0o_1605751923;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UFqkO0o_1605751923)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 19 Nov 2020 10:12:04 +0800
Subject: Re: [PATCH] docs/vm: remove unused 3 items explanation for
 /proc/vmstat
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        David Rientjes <rientjes@google.com>, Zi Yan <ziy@nvidia.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1605520282-51993-1-git-send-email-alex.shi@linux.alibaba.com>
 <20201118134629.31b3cdf8@lwn.net>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <4e4931f5-ee46-98c2-38f2-3e8d1f515b44@linux.alibaba.com>
Date:   Thu, 19 Nov 2020 10:10:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118134629.31b3cdf8@lwn.net>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



ÔÚ 2020/11/19 ÉÏÎç4:46, Jonathan Corbet Ð´µÀ:
> On Mon, 16 Nov 2020 17:51:22 +0800
> Alex Shi <alex.shi@linux.alibaba.com> wrote:
> 
>> Commit 5647bc293ab1 ("mm: compaction: Move migration fail/success
>> stats to migrate.c"), removed 3 items in /proc/vmstat. but the docs
>> still has their explanation. let's remove them.
>>
>> "compact_blocks_moved",
>> "compact_pages_moved",
>> "compact_pagemigrate_failed",
> 
> So a quick look says that the above-mentioned patch didn't remove those
> three items; two of them were, instead, renamed.  Rather than just taking
> out the old information, it seems we should actually update it to reflect
> current reality?
> 

I thought about the replacement, but there are couple of migration events
have no explanation:

#ifdef CONFIG_MIGRATION
        "pgmigrate_success",
        "pgmigrate_fail",
        "thp_migration_success",
        "thp_migration_fail",
        "thp_migration_split",
#endif

It's better to fill them together, also change current explanation accordinglly.
but I'm not so confident on this now...

Thanks
Alex
