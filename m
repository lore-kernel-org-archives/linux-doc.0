Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B26017D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 21:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730955AbfJIVhx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 17:37:53 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49744 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbfJIVhx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 17:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MhyxE9zBIIhY8OiSfA4AvqqI7W7cYlVr3qfwPxHgOW8=; b=F9EWuJeTiYZA2rHH9YbjclEUF
        Q3IyphguSrQA1f31AZkJj1UXRVjclkntzyu3wbpr7CKL202hrtZiaF6uriusuK4iuymYvLTrE+quE
        UxgIb1Y/dpGH4UJMGdF8ki+33g6yF48kdODwvnIdIitrl9VjBCI0zFbkd+yzLalZ+j/PJ7YlIh2EG
        XytEOPwe0JdgIcLGJkNJunSqOA9i+0E29kFeAZYLf/mQGfanIG9/QMX0n2raourfDm4UjiuWEtULM
        JMCE4wo+E/H01lZ+Tixbu3J+k6wT07YtC7ezRzInuyLXbTcUFIxYN9wuQcNQ5Af21AqvIU9Mp4KD6
        VdlmGyT1A==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iIJeZ-0000RD-Sw; Wed, 09 Oct 2019 21:37:51 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: Sphinx parallel build errors
Message-ID: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
Date:   Wed, 9 Oct 2019 14:37:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Sphinx parallel build error:
OSError: [Errno 12] Cannot allocate memory

I have had this error 4 times in the last 3 days.

The first time it oom-killed Thunderbird.  No big deal.
The second time it oom-killed gimp, which had 24 photos open.
Still no big deal.  Just a nuisance.

My little laptop has only 8 GB of RAM.

Is there a way that I can limit the amount of parallelism?

thanks.
-- 
~Randy
