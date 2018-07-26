Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 794247D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 07:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbeGZJEk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 05:04:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37178 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbeGZJEk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jul 2018 05:04:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id v9-v6so671349ljk.4
        for <linux-doc@vger.kernel.org>; Thu, 26 Jul 2018 00:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wH6jEE4tEDnjxHiTEgkraSPGXLtShOquLCetIgdPezU=;
        b=RQXK6BmI/Q5NcCGqejkVGiVn171f1Bz4I34XaMGpNUg7DHmi9RJjh5b8xvORl6E/WW
         DCbG0xPVFKAl5AXCG5cFM83GdXZ34NhtoAHKEkLLMCEFm4ZuiB56/Muz4SWwM0OsoUYE
         hbOBHnDpeyKknlij2HCAxOEgdcR5YEIF6H6M8LjY5gdQOtQo6KXLuZubaxmTdICxnpds
         FNKntaZJUJjAMfx7UnoWOKqrPRqcVgsyK/aMTnqytzcwIn+D+jzQCOzWb8WKOnmuyc3p
         t+P4t6mGCi2tQfyu1OEmm8xlFCuYB1QQ499ZNRupwQ3Qlfiij9xcBxPN2TOQrQ0UWz9L
         yRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wH6jEE4tEDnjxHiTEgkraSPGXLtShOquLCetIgdPezU=;
        b=PSv8qcp+PhvMjfmO4oxhV2Mej3zlQfphunuFNKp1D5Euh0PR8y20P15/VDCJDw/CFN
         krgvFkEiDB9cBA/Yu2yEDycTwQZCWPnI+MuhdXig5CUI51jF/L8y8w1Da1gt1OslizU2
         N+wSVRrSYBcq0Qox5zDAN/NisBKGmoPrMzYqISfpX8JYYlQu0pYL4mXM8nQnBqTE0Zmj
         RiK/GiV2XBtgWTQtFDbADLdD3b5zzQgnByVvnJqxp28D+XXgFbl61qHwe2zwEPTrOnGB
         MwJDZL/xQQysjB7CJY37l/wM72CLH+JCs9dj2X7doTVvX+qntFuxkvbkqLhQtjqAFTGC
         8K1w==
X-Gm-Message-State: AOUpUlHiS0XY6xNu3ZHiBh/jfrkEe+OCfzNgmkIQCPySfxSczSFTRTnH
        ViheBePUZE4FhC4yb90+jd9g6Q==
X-Google-Smtp-Source: AAOMgpcDBljV9GJhVKSz50InkqrzH6DDxoJFEhBUIbgFfLQjulabORqqdsIQM2fK4rCg1jOOVeuXEw==
X-Received: by 2002:a2e:9dc7:: with SMTP id x7-v6mr732346ljj.142.1532591343186;
        Thu, 26 Jul 2018 00:49:03 -0700 (PDT)
Received: from [192.168.0.126] ([31.173.87.248])
        by smtp.gmail.com with ESMTPSA id c83-v6sm88218lfg.18.2018.07.26.00.48.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 00:49:01 -0700 (PDT)
Subject: Re: [PATCH 1/4] docs: bpf: Rename README.rst to index.rst
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180725022926.8993-1-me@tobin.cc>
 <20180725022926.8993-2-me@tobin.cc>
 <0141716c-e909-1429-68fe-6da71d4c6677@cogentembedded.com>
 <20180725222823.GD6067@eros>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b19e7506-30d1-7935-ceff-b9aa665dbe49@cogentembedded.com>
Date:   Thu, 26 Jul 2018 10:48:50 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725222823.GD6067@eros>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/26/2018 1:28 AM, Tobin C. Harding wrote:

>>> Recently bpf/ docs were converted to us RST format.  'README.rst' was
>>
>>     s/us/use/?
> 
> Thanks for the review Sergei, will fix and re-spin.

    Perhaps could be fixed while applying...

>>> created but in order to fit in with the Sphinx build system this file
>>> should be named 'index.rst'.  Rename file, fixes to integrate into Sphinx
>>> build system in following patches.
>>>
>>> docs: Rename Documentation/bpf/README.rst to Documentation/bpf/index.rst
>>>
>>> Signed-off-by: Tobin C. Harding <me@tobin.cc>
>> [...]
>>
>> MBR, Sergei
> 
> What does MBR stand for please (not master boot record I'm guessing)?

    My best regards. :-)

> 	Tobin

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
