Return-Path: <SRS0=NuvG=DE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E205C2D0A8
	for <linux-doc@archiver.kernel.org>; Sun, 27 Sep 2020 02:14:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C93E921D95
	for <linux-doc@archiver.kernel.org>; Sun, 27 Sep 2020 02:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgI0COp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Sep 2020 22:14:45 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:44668 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgI0COp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Sep 2020 22:14:45 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0UAAO-Kc_1601172880;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UAAO-Kc_1601172880)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 27 Sep 2020 10:14:40 +0800
Subject: Re: [PATCH] Documentation: Chinese translation of
 Documentation/arm64/perf.rst
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Bailu Lin <bailu.lin@vivo.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Harry Wei <harryxiyou@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@vivo.com,
        Wang Qing <wangqing@vivo.com>
References: <20200926102242.3652-1-bailu.lin@vivo.com>
 <747aff97-8b24-5ac2-e46a-fe34b398deb6@linux.alibaba.com>
 <20200926141547.0ef26bdb@lwn.net>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <8d7eec7d-5a62-9cc6-75de-10490b999e7a@linux.alibaba.com>
Date:   Sun, 27 Sep 2020 10:12:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200926141547.0ef26bdb@lwn.net>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

		

ÔÚ 2020/9/27 ÉÏÎç4:15, Jonathan Corbet Ð´µÀ:
> On Sat, 26 Sep 2020 22:35:51 +0800
> Alex Shi <alex.shi@linux.alibaba.com> wrote:
> 
>> Why your patch repeatly has encoding issue which fails on 'git am'
>> Could you like to check the problem before send out?
>> Could you please fix your editor issue by Documentation/process/email-clients.rst
>> or send patch by git send-email.
>>
>> And please don't waste other time on meaningless issue again!
> 
> The way to be sure you have solved this kind of problem is to first email
> the patch to you, then be sure that what you receive can be applied.
> Please get to the point where that works, then I'll be glad to apply your
> translations.
> 

CC Qing,

There are few documents of how to join the community development
  https://www.kernel.org/doc/html/latest/translations/zh_CN/index.html
Shortly, sth could be summaried as following in pariticular documents.

1, setup well your email client, to be sure all your patch from your email system
could be applied by 'git am'. Current email client often cover the endcoding issue
but git will failed on that.

2, 'make help' show couple of doc related options:
  htmldocs        - HTML
  latexdocs       - LaTeX
  pdfdocs         - PDF
  epubdocs        - EPUB
  xmldocs         - XML
  linkcheckdocs   - check for broken external links
                    (will connect to external hosts)
  refcheckdocs    - check for references to non-existing files under
                    Documentation
  cleandocs       - clean all generated files

Do 'make linkcheckdocs/refcheckdocs/htmldocs', and check if the result works as
expected, of course it would be better if you can make/check all type docs, but
at least finish above 3 kinds of checks.

3, As to related docs, sending them as a couple series could help people retrieve
easy.

looking forward for your new translation docs.

Thanks
Alex

> Thanks,
> 
> jon
> 
