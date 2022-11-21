Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F349C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 21:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiKUVq3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiKUVq2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 16:46:28 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682BA11834
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 13:46:27 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id z6so8170541qtv.5
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsVUUQVuDNOLSC3p+V3V0gNV/kXf5423lG9kL/Gcr1g=;
        b=Ru077cZF1I+WBmBQhe0d5QcSsYdFJPpyiCWfBeX9iJHc98dWl/npuTGVWMIXcnSgaA
         qe4GvR3VQ8LpP5ci3P+Il7vZ6sSzjOMgd5PKSORfu4rvw25yQGZARCFt8Hmdt9/AN9JK
         yrt8D7psw2raBvS0XW8vbPHoJCs5sCfw/Vp4Fvsy9OJve+HOEBhMP+WfqTywDvrXob2x
         V3vEIrVqZN8fQPiRcxxCy50YEaAasv16W66OoaeSoRdq86Rs/wpN/RBjKddij3JugSyh
         GpN/wyWDIPOZmnTocfjBfj+m9D53W80errAqpMFjQiqukUXLNCaJ/5I8FxYA/We7TfwI
         m9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsVUUQVuDNOLSC3p+V3V0gNV/kXf5423lG9kL/Gcr1g=;
        b=x1mXICnNpxrVenfev7vJqfLnAY3j+ZzYkEzx9N9Cvlpiuo0ReuuSmn4fglmhjMUSlC
         0ug9u+UjeZ8huz/qldoP8w2goG57LZWxzoSYJJ5paURUquZmz2CqUZxH8T3gPUF4ukJY
         zD8N1gqblXWm53ktjn+8lYcZARGp4ZOm0gVdKPCdNkSQjKmubd1hIME5Bik8kHYH7Wch
         Q7uXgVMp2ZzFCkRyL033lA/I8Ca6i+72K093nRlQYHBJucKJP4uEEwpPJLGa+BGsofbB
         FMPazgzx8NRPngm/UEGsb+EFOHsyz6e7Bz2OSEKhEmFtwbLoWAZB5yjs3+FQloULE4KU
         8czw==
X-Gm-Message-State: ANoB5pl60WqaQb4Ef4YeRmJHwr8MlbxLPgl0gSA0jv9N+Zi+uV7H0XQk
        CZpRzqjVYJuac7xMWhkQKPZlcIXByb2GFQ==
X-Google-Smtp-Source: AA0mqf5yQ6R6sQNc895fCf27ye93QVVKAJajUy41MIJxXMWhznIIb+p2m6R7oEXoe6oXQ+bTbThdCQ==
X-Received: by 2002:a05:622a:5088:b0:3a5:b02:a408 with SMTP id fp8-20020a05622a508800b003a50b02a408mr2800161qtb.205.1669067186305;
        Mon, 21 Nov 2022 13:46:26 -0800 (PST)
Received: from hurd ([2607:fad8:4:3::1003])
        by smtp.gmail.com with ESMTPSA id x13-20020a05620a448d00b006fa4ac86bfbsm8877203qkp.55.2022.11.21.13.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 13:46:26 -0800 (PST)
From:   Maxim Cournoyer <maxim.cournoyer@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] doc: add texinfodocs and infodocs targets
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
        <20221116190210.28407-2-maxim.cournoyer@gmail.com>
        <877czo9exw.fsf@meer.lwn.net>
Date:   Mon, 21 Nov 2022 16:46:25 -0500
In-Reply-To: <877czo9exw.fsf@meer.lwn.net> (Jonathan Corbet's message of "Mon,
        21 Nov 2022 14:26:51 -0700")
Message-ID: <87y1s4oua6.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

Jonathan Corbet <corbet@lwn.net> writes:

> Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:
>
>> Sphinx supports generating Texinfo sources and Info documentation,
>> which can be navigated easily and is convenient to search (via the
>> indexed nodes or anchors, for example).
>>
>> Signed-off-by: Maxim Cournoyer <maxim.cournoyer@gmail.com>
>> ---
>>  Documentation/Makefile                     | 11 +++++++++++
>>  Documentation/userspace-api/media/Makefile |  3 ++-
>>  Makefile                                   |  2 +-
>>  3 files changed, 14 insertions(+), 2 deletions(-)
>
> Wow, I thought that HTML output from Sphinx was slow, but texinfo is
> another thing altogether...

Are their timing really that much different?  Since the .doctrees is
reused, I'd expect the first target to take the most time, the second
one somewhat less.  In my case, I build HTML first and info after, and I
*think* info takes less time, although still takes too long to my taste.
Sadly, setting SPHINXOPTS=jN to attempt some parallelization doesn't
help any.

> Oh well, I guess for some folks it's worth waiting for, so I've applied
> this patch, thanks.n

Thank you!

-- 
Maxim
