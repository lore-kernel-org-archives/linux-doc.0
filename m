Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F198E9271C
	for <linux-doc@archiver.kernel.org>; Thu,  5 Oct 2023 17:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjJERSg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Oct 2023 13:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjJERRr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Oct 2023 13:17:47 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0F34CF3
        for <linux-doc@vger.kernel.org>; Thu,  5 Oct 2023 10:10:44 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so1223482f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Oct 2023 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1696525843; x=1697130643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNrgw+yqYpdjuCEtrSz6iVPXz6l1oyQWLcHiTGD6UFI=;
        b=hV/n75Soqg9Z6J8DDQXTj3SsHDayMUGV5UBSSO0ja4dLzCYqIwc/cXv4p4jSI/m/Y4
         zphExXurQC+0pEChjmBREoQsDEyQqKVtf3kmPwvvc8K8sP02i4lyck/rwEw+ERUVMI/C
         +BNQwQ+cib04c1oANkx6gH1chGe3tENGvsJOnCJCpezC5OQs/JkIvhR/7oH+2LWajyg2
         13UVXPchS38/xmkfaNDEHK400K/bH4hUS5g5n14XVpqE6EELBzuHOVh8cloEjLi4L87Z
         N6G7ySNRDPXgUeDtPxCHoiARwOGfADVgALNAf+St/H2DNPhTYuHFdQheJxcKjJshRj9X
         Gv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696525843; x=1697130643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNrgw+yqYpdjuCEtrSz6iVPXz6l1oyQWLcHiTGD6UFI=;
        b=Yo8DDWTymPFAuCccsGoqrqj90oABD15JuZW6zIJyOhWbMMKnC8mVEpgo12d/lSUlaq
         Mum6cXRybzyxl7vfej4FLZ9kLjOo7vQd0Qc9rLS/JR3eVGiX0BETFV+BwgIQksqGutCz
         HNzt3mJKhFifx7oCwp0ThYJyAJlxBKqVJdWgqtaw4ZzkN7elm+YVu5ngKWmy81AoAP3p
         ymz0JMO+5PgotZKs7RBShAY5RysK6mK8enBCNyg8QdKpW1NXKE8DB1djxG55WB9J5MXf
         gwlF8doLvU9fBezzXhVu+oLb1jUbszDP4u2dmM6jJ14U1zGkEryL/6OYehAlt6Lg9tyy
         bSpg==
X-Gm-Message-State: AOJu0YwqCxX4jFib69O3leiqBww5vD2TcILM6AzLXrYL/+ctUYbo68lf
        MoJoWAu/lXoPzCYeZIACLiQYjA==
X-Google-Smtp-Source: AGHT+IFqvkrVzEF20ztaw/LQ53xt8fvGxgn7/DG6rZRMll52AtIpIyoMT19G8s4UykcFGhKaSeNtsg==
X-Received: by 2002:a05:6000:14e:b0:324:8700:6421 with SMTP id r14-20020a056000014e00b0032487006421mr5444658wrx.3.1696525842261;
        Thu, 05 Oct 2023 10:10:42 -0700 (PDT)
Received: from ?IPV6:2a02:8084:2562:c100:228:f8ff:fe6f:83a8? ([2a02:8084:2562:c100:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b00402f7b50517sm1935874wmc.40.2023.10.05.10.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 10:10:41 -0700 (PDT)
Message-ID: <093805eb-2ea3-4745-bbd0-fef54040bd1f@arista.com>
Date:   Thu, 5 Oct 2023 18:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 net-next 23/23] Documentation/tcp: Add TCP-AO
 documentation
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Ahern <dsahern@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org,
        Andy Lutomirski <luto@amacapital.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Bob Gilligan <gilligan@arista.com>,
        Dan Carpenter <error27@gmail.com>,
        David Laight <David.Laight@aculab.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Donald Cassidy <dcassidy@redhat.com>,
        Eric Biggers <ebiggers@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Francesco Ruggeri <fruggeri05@gmail.com>,
        "Gaillardetz, Dominik" <dgaillar@ciena.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Ivan Delalande <colona@arista.com>,
        Leonard Crestez <cdleonard@gmail.com>,
        "Nassiri, Mohammad" <mnassiri@ciena.com>,
        Salam Noureddine <noureddine@arista.com>,
        Simon Horman <simon.horman@corigine.com>,
        "Tetreault, Francois" <ftetreau@ciena.com>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20231004223629.166300-1-dima@arista.com>
 <20231004223629.166300-24-dima@arista.com> <87jzs2yp2y.fsf@meer.lwn.net>
From:   Dmitry Safonov <dima@arista.com>
In-Reply-To: <87jzs2yp2y.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

On 10/4/23 23:56, Jonathan Corbet wrote:
> Dmitry Safonov <dima@arista.com> writes:
> 
>> It has Frequently Asked Questions (FAQ) on RFC 5925 - I found it very
>> useful answering those before writing the actual code. It provides answers
>> to common questions that arise on a quick read of the RFC, as well as how
>> they were answered. There's also comparison to TCP-MD5 option,
>> evaluation of per-socket vs in-kernel-DB approaches and description of
>> uAPI provided.
>>
>> Hopefully, it will be as useful for reviewing the code as it was for writing.
> 
> It looks like useful information; I just have one request...
> 
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: linux-doc@vger.kernel.org
>> Signed-off-by: Dmitry Safonov <dima@arista.com>
>> Acked-by: David Ahern <dsahern@kernel.org>
[..]
>> +1. Introduction
>> +===============
>> +
>> +.. list-table:: Short and Limited Comparison of TCP-AO and TCP-MD5
>> +
>> +   * -
>> +     - TCP-MD5
>> +     - TCP-AO
>> +   * - Supported hashing algorithms
>> +     - MD5 (cryptographically weak).
>> +     - Must support HMAC-SHA1 (chosen-prefix attacks) and CMAC-AES-128
>> +       (only side-channel attacks). May support any hashing algorithm.
> 
> ...can you please avoid using list-table if possible?  It makes the
> plain-text version nearly impossible to read.

Sure, I also find it unpleasant to look in plain-text.
As long as you don't suggest something else, I'll go with plain table::
for the next version - that seems to look a bit better.

Originally I went with list-table as that seems quite spread over
Documentation/, but probably worth avoiding another entry there:

[dima@Mindolluin linux-master]$ git grep -ho '[^ ]*table::'
Documentation/ | sort | uniq -c
      4 acceptable::
      4 csv-table::
      1 executable::
    594 flat-table::
    133 list-table::
     41 table::


Thanks,
           Dmitry

