Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F7BF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Mar 2019 10:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbfCOKBA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Mar 2019 06:01:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35077 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728745AbfCOKBA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Mar 2019 06:01:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id t13so7402345lji.2
        for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2019 03:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IRyWw8QbRWfUF2+YRbdfIltzwHGtuOMVzW0EPZFZAwA=;
        b=O0n1ldfiyHVWyXno/ao0kVwE7Yc12Jyuns8qLM8i+6CBt0xiPTv2K2DEmQZioTjmKe
         yRvImMUD2aaUpvRRBs3LNiCk3aGNPeF9NpW7gdMLbIKKlcm7bib/JqJyyKKpJLNfgTET
         NHjCL+6vBlmSqYTbGhjTdmguj2fFvggzHr1zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IRyWw8QbRWfUF2+YRbdfIltzwHGtuOMVzW0EPZFZAwA=;
        b=CZqc6eOYdvwFE+l+NJ6it8VWbn35nzMO5A2PE5qIeYWzAbCBc1zqnOHvQqgtsXlkA6
         eZcM5iL4/tOd0tzGJsEdKdPe658qA4v4ZwlJ5IdCHfGdyAzcc81kuhG+PtEwg6PRbB2r
         0CoPq3+uLuRk8EdZVn8tV1gTGdbs5z7k85t2ZZJ8Na2I/8ZRODqL65hW7WS8PH+F46vx
         45/plQ0faPJOc3r+PewZL6cqsIObB2ON5XIfIAoeWbBhPH0jkFIoGEzW/4oHcZCLXPNr
         1ltr4pHK3SpXowx4k6aQ5Ex4CMk5V9SDbVoq0WGO8/DWxs6SwA9Ko9sE19DUBoh9LW2v
         74Bw==
X-Gm-Message-State: APjAAAUlOD4rMdFBVNXbyrN3vCWL5RR4gqakV7cZe+e9Madx1zTcFAUa
        M0WQBy1Ve2fJb5/wB0MEcSZFKtMuql0+9isb
X-Google-Smtp-Source: APXvYqwNbWhwjBsPGtuoTR/RxeubnIY+cGV5kfNrt80euc0Rlc3GO7eOh22u3Mo9o65slPSGL6nEgg==
X-Received: by 2002:a2e:8693:: with SMTP id l19mr1611975lji.65.1552644058918;
        Fri, 15 Mar 2019 03:00:58 -0700 (PDT)
Received: from [172.16.11.26] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id x10sm368552lff.45.2019.03.15.03.00.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Mar 2019 03:00:58 -0700 (PDT)
Subject: Re: [PATCH] doc: add translation disclaimer
To:     Federico Vaga <federico.vaga@vaga.pv.it>
References: <20190314204516.10890-1-federico.vaga@vaga.pv.it>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <78830124-9f65-354c-ed16-3f73f5ebe0b3@rasmusvillemoes.dk>
Date:   Fri, 15 Mar 2019 11:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190314204516.10890-1-federico.vaga@vaga.pv.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14/03/2019 21.45, Federico Vaga wrote:
> 
> diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
> index 7f77c52d33aa..d7a38fd28b50 100644
> --- a/Documentation/translations/index.rst
> +++ b/Documentation/translations/index.rst
> @@ -4,6 +4,48 @@
>  Translations
>  ============
>  
> +.. _translations_disclaimer:
> +
> +Disclaimer
> +----------
> +
> +Translation's purpose is to ease reading and understating in languages other

understanding, hopefully :)

> +If you need to communicate with the Linux community but you do not feel
> +comfortable to write in English, you can ask to the translation's
> +maintainers for help.
> +

s/to write/writing/, s/ask to/ask/

> +Translations
> +------------
> +

Do you really mean to add that heading a second time? I know it's on
another level, but it seems a bit odd.

Rasmus
