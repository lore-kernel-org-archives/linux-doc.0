Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6A517D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Aug 2019 12:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfH1MtW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Aug 2019 08:49:22 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40812 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfH1MtU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Aug 2019 08:49:20 -0400
Received: by mail-lf1-f67.google.com with SMTP id u29so2052022lfk.7
        for <linux-doc@vger.kernel.org>; Wed, 28 Aug 2019 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zlkz8KUfDT8cC4jOhmIeSJINsnWdWSyOo+2Oixz/yYs=;
        b=CEH/2rsPg2RAJzBYTHoa+XO5U2t7zjT6RLrxTXq1QnhwFU+qH7obrd3ZUvIGEJTKh9
         jACanixwWe4ptM6SADDhk04KKtwebYbPeXduxEKbP/CxbjYK1beusXiHESDfbZj/ioT2
         8GxAB6JIyk3PzqIhR/zXF51yfSVgc48MEJi+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zlkz8KUfDT8cC4jOhmIeSJINsnWdWSyOo+2Oixz/yYs=;
        b=cqSwRzdx0tTSKxbQ7Md5fRGZlz+1VDrEi7YiV/DSeOHlS4w6CzfNIyl4TzZMVfTtwS
         03FlVyCmn1OWPHEUQYMc3TuQDlmyiN5TjezZxCvmYlESspF9pOo1MjvrO/b4dWMvcDnO
         gINCp82ubXpLRn1bqo7tnx7KS6kVJBTNLKTnu0zaEFIJEsOHk5UFdTjtXRLicFL2wg09
         b8WCOxMLpg5gzNeMSPFajNcHU6I0eJeUGeVTKJb5x/t0g/TISJ0c8iUHxyMjtaaajuOD
         axBJeGNnyJWXb1vWMrCbWESgzU/lvmM/NUh9jSPDulaRtKCzPQBpgSKMRkjrs41zEwE5
         3ShA==
X-Gm-Message-State: APjAAAWZ88aH1NOVwcsu7LRToCUuOXzxtcnj/9NpB7nSnlULwVgIX1wJ
        sQIe8A5Qh3y5sZLN8gNvFbI6hw==
X-Google-Smtp-Source: APXvYqyuyR7dqvFwYw4L2nqcfsgayKXert43eSrWPgU+L10hsDn9DiY2Z/FGPBUwry5rRf6lR4ufwQ==
X-Received: by 2002:a19:6d02:: with SMTP id i2mr2502485lfc.191.1566996557855;
        Wed, 28 Aug 2019 05:49:17 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id b30sm814534lfq.59.2019.08.28.05.49.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 05:49:17 -0700 (PDT)
Subject: Re: [PATCH v2] vsprintf: introduce %dE for error constants
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Steven Rostedt <rostedt@goodmis.org>, Enrico@kleine-koenig.org,
        Weigelt@kleine-koenig.org,
        Andrew Morton <akpm@linux-foundation.org>,
        metux IT consult <lkml@metux.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190827211244.7210-1-uwe@kleine-koenig.org>
 <20190828113216.p2yiha4xyupkbcbs@pathway.suse.cz> <87o9097bff.fsf@intel.com>
 <20190828120246.GA31416@jagdpanzerIV>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <087e8e18-8044-27ef-b0bd-8a1093f53b32@rasmusvillemoes.dk>
Date:   Wed, 28 Aug 2019 14:49:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828120246.GA31416@jagdpanzerIV>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/08/2019 14.02, Sergey Senozhatsky wrote:
> On (08/28/19 14:54), Jani Nikula wrote:
> [..]
>>> I personally think that this feature is not worth the code, data,
>>> and bikeshedding.
>>
>> The obvious alternative, I think already mentioned, is to just add
>> strerror() or similar as a function. I doubt there'd be much opposition
>> to that. Folks could use %s and strerr(ret). And a follow-up could add
>> the special format specifier if needed.
> 
> Yeah, I'd say that strerror() would be a better alternative
> to vsprintf() specifier. (if we decide to add such functionality).

Please no. The .text footprint of the changes at the call sites to do
pr_err("...%s...", errcode(err)) instead of the current
pr_err("...%d...", err) would very soon dwarf whatever is necessary to
implement %pE or %dE. Also that would prevent any kind of graceful
fallback in case err doesn't have a known value - errcode() would have
to return some fixed "huh, unknown error number" string, so we'd lose
the actual number.

Rasmus
