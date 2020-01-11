Return-Path: <SRS0=X10t=3A=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB859C282DD
	for <linux-doc@archiver.kernel.org>; Sat, 11 Jan 2020 00:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBCDA2064C
	for <linux-doc@archiver.kernel.org>; Sat, 11 Jan 2020 00:20:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJNbyZmX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgAKAUL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Jan 2020 19:20:11 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46151 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbgAKAUL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Jan 2020 19:20:11 -0500
Received: by mail-pf1-f196.google.com with SMTP id n9so1892619pff.13
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2020 16:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:subject:cc:to:in-reply-to:references:message-id
         :mime-version:content-transfer-encoding;
        bh=XmDl8MlBs8zMpHbzwC/Bjnzdb8+0L6MEHqUg6wui8eM=;
        b=hJNbyZmXObUnnNReXzLTdAuenJ0Cs9Fy3IDYZ6wmGsmrCfWO/CaC/aROMb+knJte+7
         73WWSHAFx90sYAKfkzcPgTkafMXwmE+twWaKcW+kw+tUqeTw5wGZZo53mRiIrubkGkwv
         iNBDPHrQ8xtgfzHUWhpdo0W622Z6parTE2pfypw8im/z2EUMs41ye2BuF5xxRSPyqyqx
         Pba6HoFvucvSPF8pjCuSi+eoZzeKUKRVoOwAL1TQCsbVz0IjE00F8uz7MTSOVZfwrZ1K
         ppvyJPKSmsbnhN1j+2nD0ZffWePtX7TJvQS3d5IMhgLe0PyI/BcSMkmkfq1wLsfz8EcV
         nyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=XmDl8MlBs8zMpHbzwC/Bjnzdb8+0L6MEHqUg6wui8eM=;
        b=AJ9UrqhRb36eholYwYP7M3YJ9A18rZbXgQu1rhJkcWDLWQsckGYq+dDmz/aMDD/iEY
         jxtm0sUOVHy3JF0A/qzwTw5IH+36DlWXEwaEROMNKODlz9LHg5h08zRIjS8AMMWVPuVO
         hjafq34S7E6+T0azsHFmlnEwxlpy7sKNKhC0IxY+aSaqb4Y/G3H/a0WIqIzTGFVt6QN3
         Czy3QxEmYPfdV/092lugi4rDaiuH66GJd7FX8rKWGa9xLpqFcnD+j8nmkX6jpNmMa78G
         O/WS6oFf8hrpeVm7jBNgH88HL+2TK2w5LGOqwRnkZ0xBO97+dgz+Nvht0+KFX2OKDAFH
         M89A==
X-Gm-Message-State: APjAAAVUMmQ2SnK3jdVZIl9EiDU3QaY9BEdElwJIUGFjo84PX/0Qu1Vu
        lEe37FU1uUWY0pBG7N5Mx954zy6L4mk=
X-Google-Smtp-Source: APXvYqzjBGpO8kkPo5gF+67AjQ5pa7PPUpyL1EIgRCN2owS8u1ATduGjhglT2mSaECpWO5gFDTOwDQ==
X-Received: by 2002:aa7:8d8f:: with SMTP id i15mr7093588pfr.220.1578702010124;
        Fri, 10 Jan 2020 16:20:10 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
        by smtp.gmail.com with ESMTPSA id q6sm4289190pfh.127.2020.01.10.16.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:20:09 -0800 (PST)
Date:   Fri, 10 Jan 2020 16:20:09 -0800 (PST)
X-Google-Original-Date: Fri, 10 Jan 2020 15:58:58 PST (-0800)
From:   Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject:     Re: [PATCH] RISC-V: Typo fixes in image header and documentation.
CC:     Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, merker@debian.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
        mchehab+samsung@kernel.org
To:     corbet@lwn.net
In-Reply-To: <20200110101707.06800f3c@lwn.net>
References: <20200110101707.06800f3c@lwn.net> <20191210072947.7018340c@lwn.net>
  <4912c007ab6c19321c8c988ae2328efbfb3e582d.camel@wdc.com> <mhng-3a815562-1222-4737-a77c-6dab9948db79@palmerdabbelt-glaptop>
  <mhng-94b9cad5-0d14-480f-b428-8752630064d2@palmerdabbelt-glaptop>
Message-ID: <mhng-9fc36964-582a-4186-818c-e9f7efe05a38@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 10 Jan 2020 09:17:07 PST (-0800), corbet@lwn.net wrote:
> On Thu, 09 Jan 2020 15:42:27 -0800 (PST)
> Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
>> > I was assuming it was going through the risc-v tree since it touches arch
>> > code :)  I can go ahead and apply it.
>>
>> I don't see this in 5.5-rc5.
>
> It's in docs-next; I've not pushed it through straight to 5.5.  I can do
> that, I suppose, if it seems urgent?

I just wanted to make sure it didn't get lost.  The resolution of the thread
was a bit ambiguous and sometimes that results me losing patches, so I just
want to make sure everything is clear before I drop threads from my inbox
(which is essentially my TODO list).  I was just digging myself out of a big
email hole so I figured anything still sitting around would have landed in
Linus' tree by not, but maybe I wasn't as far behind as I thought I was :)

Thanks!

>
> Thanks,
>
> jon
