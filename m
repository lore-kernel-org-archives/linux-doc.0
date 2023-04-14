Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B116C77B6E
	for <linux-doc@archiver.kernel.org>; Fri, 14 Apr 2023 16:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjDNQb6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Apr 2023 12:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjDNQb5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Apr 2023 12:31:57 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376B5BB80
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 09:31:25 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5068e99960fso10249a12.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1681489881; x=1684081881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5b/9r03boRV4UanYn1RNmzB2JpdCWtq18uHUNH61CVs=;
        b=pIQNUABRqfz5G9IJM9lizr0vPl0WgB7n4aWZwZUe/kF73YAamGDV377CeXdl3tawD9
         kq34tFZFPldbRMdqDikQFALSsSWfziPQZwMO6nLRKUytsmCwRnBk7q4JsWELm6ADvBrs
         wZwK5QNA4bcVQ9oZFNH1ueUmNoKf/StC9Cqds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681489881; x=1684081881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5b/9r03boRV4UanYn1RNmzB2JpdCWtq18uHUNH61CVs=;
        b=Fq4RE+poIQHmcz5E6cOytO5Ucnkx0Nl2vJ0O9AL710h/7QDWykzzZcy33i2ZgBfawn
         3h5IEu6cexLOFil4KEaWIOZKazJj90utPU/O5pvDRPi6lF1DrZnn9E861pKSnB68QpIK
         JZzLrx6WeKVaCClS1DphHQU+Gj19+UnRbnQA9S53AlzyubLOy70naqSlk7Op71tPjbPE
         k4seGG2wSkC/yGEissiyGmmeuMBHwbHqmi9fNIlD2jel4yFaDdDWrN0ZD/WCppPP70KH
         a8NTdrCoHNf+wtXLWsnUu1lkivcCGLvata2T8DiEmaoQ3pyUMj382Rs9oh4TVfP5OMG9
         aVMw==
X-Gm-Message-State: AAQBX9fxXN6tDFADMKveXXrypvGWyDBTlJsJ7PMnkZiFcOZhcoaTKuAz
        C9I+SlQpZYdfGDgISuTGv9U6+h/vmOh20uz1SwlZEw==
X-Google-Smtp-Source: AKy350bUZ57++7VK4dP3v5BNCxqMSaz7hr9w88c5ysZKzOGWRszBmAlziDfG3+QYYunvZFtN+5iKSE1BeEKmHbt6GFA=
X-Received: by 2002:a50:8d43:0:b0:4fc:fc86:5f76 with SMTP id
 t3-20020a508d43000000b004fcfc865f76mr3343019edt.6.1681489880762; Fri, 14 Apr
 2023 09:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk>
 <ZDBEng1KEEG5lOA6@boxer> <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk> <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
 <87ile011kz.fsf@toke.dk>
In-Reply-To: <87ile011kz.fsf@toke.dk>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Fri, 14 Apr 2023 18:36:04 +0200
Message-ID: <CAHApi-=ODe-WtJ=m6bycQhKoQxb+kk2Yk9Fx5SgBsWUuWT_u-A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> In addition, presumably when using this mode, the other XDP actions
> (XDP_PASS, XDP_REDIRECT to other targets) would stop working unless we
> add special handling for that in the kernel? We'll definitely need to
> handle that somehow...

I am not familiar with all the details here. Do you know a reason why
these cases would stop working / why special handling would be needed?
For example, if I have a UMEM that uses hugepages and XDP_PASS is
returned, then the data is just copied into an SKB right? SKBs can
also be created directly from hugepages AFAIK. So I don't understand
what the issue would be. Can someone explain this concern?
