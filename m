Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3EE537D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Aug 2019 21:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfH3Vpu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 30 Aug 2019 17:45:50 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44272 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfH3Vpr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Aug 2019 17:45:47 -0400
Received: by mail-ed1-f65.google.com with SMTP id a21so9520734edt.11
        for <linux-doc@vger.kernel.org>; Fri, 30 Aug 2019 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cBz0MMX0JgyAHjwyE8I1352iGkSxJIlsmG5ztl+6roE=;
        b=SaLyfj4vRd7n2LDFFQRahUDf4PcSzy7K79IMAxpqyV4LzQALLJ5uUvekBkwAr72dpS
         7ayWBlDt0ahoDU1k002ECX1qUVqL8sw5R3Hl6b11PWdt/YaebFSUeHs6b3Gl3Jxo5ok2
         Zph2ANDm+Cdq46G6qrE6+s+NoOVsjK6AaoCS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cBz0MMX0JgyAHjwyE8I1352iGkSxJIlsmG5ztl+6roE=;
        b=nFc4wvKczAivSlse5mp9DCoRh63/IE4wFdCqhrzacVsDH7fgrN8DNS/8xOsp+W46yQ
         AADI+ENhcOGYWPsRNf0s6zvWKGQ6JSOxeo52FYFKWIG9nVg3qmD+k+z5ankJnkAL5a+d
         J+rHqeaB9kOLouXaEo/V5DqooI51swEQCSJJUD30TaKCWj81WNYZ2LgxjJGwwVEp1wXl
         exOkiessGdRCHDYQkLG0P2x6st0EOfdfLy2GSCkPrSfmmhjeCkWtUzTM9zv3lwIf3uyL
         xWR8nNiPbBf4vHazVJpNDGCmb9gXSmhFOBjnBi5YzsBWnTlBtc/cTEtowy80UMuEOjG+
         gMLA==
X-Gm-Message-State: APjAAAXQhfrx92zQuAdAc0BAZVPuNZ5NrpOdRPCsgppO4LpehQy4itep
        5TFNAemC0/kimVHTpSQCp22yoA==
X-Google-Smtp-Source: APXvYqyUMuKdzY/FFg+N2C4z43XxYZzTyHfyt1kARxcF6rQuLUR39CDEOTIT5F3KhAgvAnwKa2ylTg==
X-Received: by 2002:aa7:c490:: with SMTP id m16mr18062490edq.156.1567201545118;
        Fri, 30 Aug 2019 14:45:45 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-35.cgn.fibianet.dk. [5.186.115.35])
        by smtp.gmail.com with ESMTPSA id qx4sm920543ejb.11.2019.08.30.14.45.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 14:45:44 -0700 (PDT)
Subject: Re: [PATCH v2] vsprintf: introduce %dE for error constants
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Juergen Gross <jgross@suse.com>, Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        metux IT consult Enrico Weigelt <lkml@metux.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190827211244.7210-1-uwe@kleine-koenig.org>
 <20190828113216.p2yiha4xyupkbcbs@pathway.suse.cz>
 <74303921-aa95-9962-2254-27e556af54f4@kleine-koenig.org>
 <20190829081249.3zvvsa4ggb5pfozl@pathway.suse.cz>
 <45cd5b50-9854-fce7-5f08-f7660abb8691@suse.com>
 <a83449cf-3a4a-f3e0-210a-dc7c39505355@rasmusvillemoes.dk>
 <002dc2a7-40a3-f52a-c8fa-5dbb42e6dd7b@kleine-koenig.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <7eb732b3-eca5-34c0-ed1f-6814deab60d9@rasmusvillemoes.dk>
Date:   Fri, 30 Aug 2019 23:45:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <002dc2a7-40a3-f52a-c8fa-5dbb42e6dd7b@kleine-koenig.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/08/2019 19.39, Uwe Kleine-König wrote:
> On 8/29/19 11:09 AM, Rasmus Villemoes wrote:

>> still prefer making it %pE, both because it's easier to convert integers
>> to ERR_PTRs than having to worry about the type of PTR_ERR() being long
>> and not int, and because alphanumerics after %p have been ignored for a
>> long time (10 years?) whether or not those characters have been
>> recognized as a %p extension, so nobody relies on %pE putting an E after
>> the %p output. It also keeps the non-standard extensions in the same
>> "namespace", so to speak.
>>
>> Oh, 'E' is taken, well, make it 'e' then.
> 
> I like having %pe to print error valued pointers. Then maybe we could
> have both %de for ints and %pe for pointers. :-)

Oh no. And actually, come to think of it, we don't even need to extend
%p at all (taking away yet another letter for future expansion...), we
should simply make %p DTRT when passed an ERR_PTR - currently, if it's
some %p<extension> that would normally derefence it, there's sanity
checking in place which makes it print (efault), while if it's plain %p,
it just does the hashing, making it impossible to figure out that it was
an errno value (or which it was).

I've cooked up what I mean, sending in separate thread.

Rasmus


