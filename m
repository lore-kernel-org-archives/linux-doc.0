Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AB8C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 12:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFD0061288
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 12:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238751AbhDLM3Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Apr 2021 08:29:16 -0400
Received: from m32-153.88.com ([43.250.32.153]:58450 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240634AbhDLM3P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 08:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=nY28if++H9NBXccKe3DJjfKmfb+eUPQl6tqv9
        i927uo=; b=RuTYpswbgGXQHvM7r+OriOsOPRHvIHFyUZSkWOnGVJ7ul7uD1j1ul
        mNWecflKMii2bIpBTuNMQUILkdcMtQCMrDBCEWRrojyFEPdBOswvuw05zHwICKbW
        WuXd1Yqrrt3DsVoUaY4ux+i8XNqJhY/JNtZsb3WF7ayzWSx1TViPRY=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHkyMEPXRgdKtrAA--.54811S2;
        Mon, 12 Apr 2021 20:28:54 +0800 (CST)
Date:   Mon, 12 Apr 2021 20:28:52 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 5/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/contributing.rst
Message-ID: <20210412122852.GB6861@bobwxc.top>
References: <cover.1617699755.git.bobwxc@email.cn>
 <6b0eeced74f21696fd15edea9f24ef1f20736652.1617699755.git.bobwxc@email.cn>
 <20210408141024.GA8507@bobwxc.top>
 <874kgg1zls.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874kgg1zls.fsf@meer.lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHkyMEPXRgdKtrAA--.54811S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFW7Gr47uryrGry7GF15Jwb_yoWkuFg_Gw
        4vyrykC3y3tF10kFWfWF1UJFya9F48Grn8KF1Dt34aqa48Kw48XFyvqrn3Xay5JFs3uFnx
        Cr4DJr1fW343WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYAYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6ryUMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjxUf3C7UUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 08, 2021 at 10:59:43AM -0600, Jonathan Corbet wrote:
> Wu XiangCheng <bobwxc@email.cn> writes:
> 
> > Add new translation
> >   Documentation/translations/zh_CN/doc-guide/contributing.rst
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> > v4 only changed some word in [Patch 5/8] under Yanteng Si's advices.
> > Thanks!
> >
> >  .../zh_CN/doc-guide/contributing.rst          | 238 ++++++++++++++++++
> >  1 file changed, 238 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/contributing.rst
> 
> It's generally best not to send a new version of just one patch in a
> series; it makes things harder on the maintainer side.  If you could,
> please, send me a new version of the entire series (as a new email
> thread) with all the tags added; then this looks like it's about ready
> to merge.
> 
> Thanks,
> 
> jon

Hi Jonathan,

Sorry for making your work harder.

I'd like to send a new version. But there is a patch still on review, my
reviewer said he need to determine something. So may need more time for
the new version.

When it ready, I'll send you in new thread.

Thanks!

Wu X.C.

