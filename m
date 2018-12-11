Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BA08D7D8BA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Dec 2018 16:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbeLKQ34 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Dec 2018 11:29:56 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33264 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbeLKQ34 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Dec 2018 11:29:56 -0500
Received: by mail-pf1-f196.google.com with SMTP id c123so7388373pfb.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Dec 2018 08:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id;
        bh=gzbxHecU86LFLkoFtvtJbFFqdwZzwuGxgACWUAu+Sow=;
        b=nlcyGlKRTqTbq8+IqXBHRqittXZfjRRwenzH80RsKpkqfJtTJNrQgXGnnLbcZUMhYr
         wvTmkOaaCn434bSQn7aCr/wxuJHQKqxuIbeWcUIJDYE57yOeW1/AB3NLcFPtzL1kP4Ml
         YPY0npu+udLAC11iErcC+8C7cCojqyC8fEA0bJB9HSrpyIbO4IGRXiDPeGmI7T7B3pTc
         fV7/bES0gkdi+IYjwD3lfkFnUhYNhJk0SSd1IRGUH8vXf8KQX5HtgHjCFkNWVWzqcX6/
         A6roqauT34wp6klDiUXjgRIlt6o+5UCDN++fDfLvXtXxh+nIPu8/8+BUrwW2tUWxvuMo
         i/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
        bh=gzbxHecU86LFLkoFtvtJbFFqdwZzwuGxgACWUAu+Sow=;
        b=e/2iRhifKwP/0TxnSf7y/jbpkk8/exkGbQsnH8NA3PDjwxCShZ9gDh0L813xwQz1zI
         hbTTVWzgTwWQaN2yVk+tDbO9TH1lJ6x+AnXpOxnpO7XuKHjwYFq8JyTbHm6cDqatGc02
         773CJWZMahXGRGyk+D3CLbdL9K6GshtZvt8ni10kPBSTfon0Kp3oy51ODJqbX08xvnnp
         PvAZ2px6O1IiebcrkMRfEOt8cFp1Opd+nbuI3t+rkwP/7GLJif2BebX305sS53Mp1xkU
         0pcvgQPPGk+O7LVbeA9QNER4nHzCU8WVVe45lObckEh7J2+RTAsQCBJID37JAxOTmwVx
         SjFw==
X-Gm-Message-State: AA+aEWZD5SIDtLWBFLuetJ7WgTgi7XkVqa2L0/3Y2Y1NSczsJ3WcilQL
        wB8TJ4//p6VSC22dXQdijNVN8w==
X-Google-Smtp-Source: AFSGD/X4jMEyWNxSR2E0mKM7M07cpiLlL+IqKW6i6KevEKdtwNAhn/64cIvGL8dbmcdvJMK78BwZcg==
X-Received: by 2002:a63:4745:: with SMTP id w5mr15452249pgk.377.1544545794727;
        Tue, 11 Dec 2018 08:29:54 -0800 (PST)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id c13sm20690787pfo.121.2018.12.11.08.29.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 08:29:53 -0800 (PST)
Date:   Tue, 11 Dec 2018 08:29:53 -0800 (PST)
X-Google-Original-Date: Tue, 11 Dec 2018 08:22:07 PST (-0800)
Subject:     Re: [PATCH 2/3] kbuild: generate asm-generic wrappers if mandatory headers are missing
In-Reply-To: <CAK7LNAS7hh4f8mYoZc7RUWStnchhftUN0nU5MJ_trjyNJx50Lw@mail.gmail.com>
CC:     Christoph Hellwig <hch@infradead.org>,
        linux-kbuild@vger.kernel.org, sam@ravnborg.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, michal.lkml@markovi.net
From:   Palmer Dabbelt <palmer@sifive.com>
To:     yamada.masahiro@socionext.com
Message-ID: <mhng-f63eb098-71bf-411a-9583-388234647f1e@palmer-si-x1c4>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 11 Dec 2018 04:59:26 PST (-0800), yamada.masahiro@socionext.com wrote:
> Hi Christoph,
>
>
> On Fri, Dec 7, 2018 at 12:04 AM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Wed, Dec 05, 2018 at 08:28:05PM +0900, Masahiro Yamada wrote:
>> > Some time ago, Sam pointed out a certain degree of overwrap between
>> > generic-y and mandatory-y. (https://lkml.org/lkml/2017/7/10/121)
>> >
>> > I a bit tweaked the meaning of mandatory-y; now it defines the minimum
>> > set of ASM headers that all architectures must have.
>> >
>> > If arch does not have specific implementation of a mandatory header,
>> > Kbuild will let it fallback to the asm-generic one by automatically
>> > generating a wrapper. This will allow to drop lots of redundant
>> > generic-y defines.
>> >
>> > Previously, "mandatory" was used in the context of UAPI, but I guess
>> > this can be extended to kernel space ASM headers.
>>
>> How useful is it to keep the generic-y behavior around at all vs making
>> everything useful mandatory?
>
>
> What I can tell is not all architectures
> support kvm_para.h, ucontext.h
>
> I guess they will stay as arch-specific generic-y,
> but I am not an expert in this area.
>
>
> kvm_para.h is missing csky, nds32, riscv.

It looks like RISC-V missed it and everyone else copied us.  I don't see any 
reason why the generic version wouldn't work on RISC-V, as it just has failures 
for all the calls.

> ucontext.h is missing in alpha, arm, m68k, parisc, sparc, xtensa
>
>
>
> bpf_perf_event.h could be promoted to mandatory-y ?
> All architectures have it.
