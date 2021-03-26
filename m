Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40BDC433E0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 03:32:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFF7C61A2A
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 03:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhCZDcI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 23:32:08 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41943 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230317AbhCZDbx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 23:31:53 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id B21895C00DB;
        Thu, 25 Mar 2021 23:31:50 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Thu, 25 Mar 2021 23:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=g1S8SNbwAETilyK1SFhSpTqwUzJ0rMB
        SQLrVniR6uq8=; b=hMkfJ/BvXtkRp7vDuh1SAS97D0775HsZj3W1+vv2U/eFqzJ
        SbWKqLknovB2IElBpnUf8VAD8Txys6hupH16TNdejm6j0oHIcmzfvYgDo48LWBuU
        nUPYsHJ84vn3XMA0S/X23DutrmmmhVQFvX9fvLZfkhVBjk12lPLsCZBkFepp/xjm
        t3yQget/Fv858nQMXFtnn8wSkfUGuePwSkxkFAgsWFIHznNSHK/CPemPyriDkhHW
        cUYYnEwMOn/X9SvS3cr6kC7OtHIuao/TsfV3wbo3B7fVrK/u/Tb/qdZlLDbOtKLx
        H7vp31lWgmggl7xZ+FRUTUmNXKj6KE9wJox9w5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=g1S8SN
        bwAETilyK1SFhSpTqwUzJ0rMBSQLrVniR6uq8=; b=XxVVei/MAGNcgL/Q6M2yMh
        2XZ8vUfAFNHRtuBaoK563JEgFlW/r9icfW8yrfCJL4Iy4G+u8naN5JkMcUHrXmug
        IrQWblW6gs+wTeDhGCiZQxnHnYgaKgQCSi/PRkWXgkQYDLrBG1I+5KScQ3lg1Gc/
        9fDEZGa3m2WCUzVFeaGJrsgl9eRcCQufqurIHzpG1tkTAz8/dU8FrI9I0ovLl9Vx
        V1Wgf3Za6vLNczu71iA4lygDkSiuqXxLgUJmdfgzRSjEAottdCBKqLH9Tbuq+Wfq
        qPi9v0c4iVjy5paxW1CTPmdgog6fKeGkUMZrrghYFcUOOQYDC0YFM+MICCkE18rA
        ==
X-ME-Sender: <xms:pFVdYD4TIBqpBMl3XE15u1gS8n2aENUHhkypfTCCmrl9nbXZrvXejA>
    <xme:pFVdYI4BELpcH7mF_M2RbWsFiMDHog1Ypvw2lq5gq5Qgvsj1J-ppqNAPdksntsH6b
    0k3ZfdmbTwynp3OVTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekleehtefhhefftddtleeiveefieehueduieefueegueei
    leeitdeujeehheehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:pFVdYKeVfiSrEYZpSj62-8qqDnlbsCSoqtOHKyarWGjaJjF4Upbj3g>
    <xmx:pFVdYEIuMVHWhPGeX_Smr4IPHHhy0x9mViFq9DUvP22RvPEF5M9yZQ>
    <xmx:pFVdYHLCm96QZK-uZ6w4-Il0-ilB7_-1hJHQ9dF983hec6kyEtHRXw>
    <xmx:plVdYP_D0IWJMRtGWfhkSI39T0RtCKr_Ge2zCzHIZkQpO5ZKB4e3OQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D6A8113004C1; Thu, 25 Mar 2021 23:31:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <1a648811-9809-49cd-92c1-9b72a136075d@www.fastmail.com>
In-Reply-To: <87pmznyskc.fsf@meer.lwn.net>
References: <20210324150731.4512-1-siyanteng@loongson.cn>
 <e3a1546e-070b-c9d4-0dc9-e8bc6d67b1ab@linux.alibaba.com>
 <87pmznyskc.fsf@meer.lwn.net>
Date:   Fri, 26 Mar 2021 11:31:27 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        "Alex Shi" <alex.shi@linux.alibaba.com>,
        "Yanteng Si" <siyanteng@loongson.cn>
Cc:     "Huacai Chen" <chenhuacai@gmail.com>,
        "Harry Wei" <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, "yanteng si" <siyanteng01@gmail.com>,
        "Wu XiangCheng" <bobwxc@email.cn>
Subject: Re: [PATCH 0/8] docs/zh_CN: add cpu-freq translation
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Fri, Mar 26, 2021, at 2:52 AM, Jonathan Corbet wrote:
> Alex Shi <alex.shi@linux.alibaba.com> writes:
> 
> > Cc Wu Xiangcheng,
> >
> > Hi Yanteng,
> >
> > Thanks for your work! believe we active translators could review
> > for each other. :)
> 
> I'd very much like to second that.  Alex has been doing a great job of
> reviewing these patches, but I think he deserves some help.

Hi all,

I'm going too help with revewing as well.

However when reviewing these translations I found there are some inconsistencies
in word choices.

Probably for Chinese translations we need a general golssary to help translators?
We can pick up a general computer dictionary as baseline and make some linux
addtion entries. 

Thanks. 

- Jiaxun

> 
> Thanks,
> 
> jon
>

-- 
- Jiaxun
