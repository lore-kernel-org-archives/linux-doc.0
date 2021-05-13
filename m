Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D024C43462
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 18:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54CD1613F1
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 18:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhEMSuD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 14:50:03 -0400
Received: from m32-153.88.com ([43.250.32.153]:8385 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231789AbhEMSuC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 14:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=2Xt2/UG1Aq1+kyFNzp7sHIcjWTIa/I7eWM9Gn
        lvd7dc=; b=k8neiH/2c26RjnBoYkA+knCa+j/zjNlxKOQA9I+k/Eq15T8ZoRpNG
        XjrUCp4xIxLbdLrqr4UuQgayXemOnkkfbdnyvOr19N46+vjp9alDHs6gi+AZB1xw
        ebYr6IOQeZlKV0hBmwAEkxGKKQyXzvypFVO7Cojv8MwVqd6SqoNjE4=
Received: from bobwxc.top (unknown [112.96.109.117])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgB3xliOdJ1gI0kvAA--.55033S2;
        Fri, 14 May 2021 02:48:48 +0800 (CST)
Date:   Fri, 14 May 2021 02:48:46 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs: kernel-hacking: Fix two ref links
Message-ID: <20210513184845.GB16187@bobwxc.top>
References: <e81dbd91c0afab466d6274ea7c27d20baea75141.1618933932.git.bobwxc@email.cn>
 <2b855d05ab1da0635b88bfb8e65cac36260fba64.1618933932.git.bobwxc@email.cn>
 <87wns263wi.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wns263wi.fsf@meer.lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgB3xliOdJ1gI0kvAA--.55033S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZryUWw1DXw4rtry5uw4kWFg_yoWkKFb_W3
        ykCFZ3G3sIqr4Sk3WDGF4DWrn2ka12kF4vy3WUJrW5ta4Yyw48JFykCry5Ar43uFs7uFsY
        kanxZrZagFnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbn8YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU-KZXDUUU
        U
X-Originating-IP: [112.96.109.117]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 13, 2021 at 09:37:33AM -0600, Jonathan Corbet wrote:
> Wu XiangCheng <bobwxc@email.cn> writes:
> 
> > Fix a abnormal funxtion ref link in locking.rst
> > Convert a path to bare path
> >
> > Fixes: b1735296cef9 ("docs: locking: Drop :c:func: throughout")
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> > v2:
> > * No change.
> >
> > v1:
> > <https://lore.kernel.org/linux-doc/6a15b17d46f5db190fb10afc57ea59132b33c701.1618761749.git.bobwxc@email.cn/>
> >
> >  Documentation/kernel-hacking/locking.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
> > index ed1284c6f078..9bcd70aa8411 100644
> > --- a/Documentation/kernel-hacking/locking.rst
> > +++ b/Documentation/kernel-hacking/locking.rst
> > @@ -1323,7 +1323,7 @@ from user context, and can sleep.
> >  
> >     -  put_user()
> >  
> > --  kmalloc(GP_KERNEL) <kmalloc>`
> > +-  :c:func:`kmalloc(GFP_KERNEL) <kmalloc>`
> 
> So this makes no sense at all.  We are trying to get rid of :c:func:;
> why are you adding it back?
> 
> Thanks,
> 
> jon

OK, this patch is obsolete.

Thanks,
Wu X.C.

