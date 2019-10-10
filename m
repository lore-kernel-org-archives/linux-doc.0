Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 023407D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Oct 2019 20:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfJJUPy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Oct 2019 16:15:54 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58964 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfJJUPy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Oct 2019 16:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ibBfORQt4qP+G10WENft2iIqPbfGngZa7O3IEjhT+O8=; b=SqqJJlSTc4s2HbSV0bZDzhYby
        QUNiz7NDOcbCoM+/hYRwYkpyPgiXheiUVCYxNUWtxhy8FqsmIP8Fzgw+iTUwz2Q/Z85z19bb2h96v
        5cXVS7D+2gSB5G8ivTTtELIKYvl6j0mchjh5u+Se4XSXuewO37xiEfyv03sJTMSYto7dytvWtxOzk
        GBjPoIPn8qSxJVfoJMdcX0bBQthXwwBW2haR0Ww00o9gF+ffnQQrmXc+Ymq8TF0Jt2Uzpd/riXAMA
        jjmLfhjVuRgfFGHimgSkkDHxaBWH46/9fHZNs3/vvwhRjmHuu8V8IUxyTZErqHHp2uEaz7TDUNtp8
        LwVgnvEdA==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iIeqm-0004Yn-CK; Thu, 10 Oct 2019 20:15:53 +0000
Subject: Re: Sphinx parallel build errors
To:     Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook> <20191010124832.23bc4362@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
Date:   Thu, 10 Oct 2019 13:15:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191010124832.23bc4362@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/10/19 11:48 AM, Jonathan Corbet wrote:
> On Wed, 9 Oct 2019 19:30:56 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
>> I'm wondering if it's actually the addition of
>> the MAINTAINERS file parsing -- that's a really big parse and maybe that
>> pushed things over the edge?
> 
> That does seem like a likely culprit, doesn't it?  Watching a build here,
> though, I don't see that any one of the sphinx-build processes balloons to
> a horrific size, which is what I would expect if one file were causing the
> problem.
> 
> In general, the sphinx build doesn't really begin to approach the memory
> requirements of, say, firefox or my mail client on my system.
> 
> Randy, I'd be curious to know if you see the same behavior with current
> mainline.  Also, can you see how many sphinx-build processes you have
> running?

Yes, I see oom-kills when building docs for 5.4-rc2.
But only after I ran 'gimp *.jpg' for 22 photos.

I can see anywhere from 1 to 4 sphinx-build processes running.

> Thanks,
> 
> jon

-- 
~Randy
