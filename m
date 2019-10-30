Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 731547D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Oct 2019 21:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfJ3VUn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Oct 2019 17:20:43 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39027 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbfJ3VUn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Oct 2019 17:20:43 -0400
Received: by mail-wm1-f65.google.com with SMTP id g19so3755736wmh.4
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2019 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bCCM/FRoxM1DGbV5FxJ1654B4s7XPuP0KBkaEzbQ0SY=;
        b=PuXwjRWNfCoqyRl5oJCDjBnOlOIRRgdN/Xgp5hp3Wxb2ael/Lh0d275xwjLeKVPsRI
         VIiO8Hzrk2+vc2BTt9xYZNLrPTs7ZoWtWAoPUjBEZncq484dRQp6Cem5Ik3FLG5UZ9IP
         w/y8qAAXlxawyFz1zAz6bLXyr+gxa1MWaXwW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bCCM/FRoxM1DGbV5FxJ1654B4s7XPuP0KBkaEzbQ0SY=;
        b=Kb/ppcHLRkFQDpFQ2G5Ub8M8fZVJUyDZc201pItqkRZJHNAr4kR4mKUy2k/yWG+khw
         gdipUbrANkhY5USN750tqQA63imi2ihlAnq5VU34sEuKWMKUrTJF/M9UUiacxmT0tHHO
         6I8l4y8emhkp8cAegMXv2W9cNAX65S7L9NQfLOrYIVCHl+60MOY1ARhEzTn+tXMLWWH+
         ffqVeD9vamuYIpAbTfxieBIomtwQnFm2e4vhD/VLkUJK7+EtdAxE9fhJjA7ooDe+r8GV
         iwAzG0sdslVz2CELGMAsp3POT3cDfjEeNfx4tcmShrThffT2JVYq/kOwGQ+oxjGnQzjG
         cpCQ==
X-Gm-Message-State: APjAAAUl3DPNGsMDTeBVM/Lubrc/UFt9mNsLkDTOK/7JSxuE3K/Q2oYS
        QmFEn6qrOxzBy2yfxeX62u9MR+61fOgsFzZzvJs=
X-Google-Smtp-Source: APXvYqwROwpaZauInXlhIjgsmtXjnhsKpId2vAlwGj1dJvD8ZIAWJhbyb2tRHdsIYLrdSAze54Dlmw==
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr1410088wmj.36.1572470440796;
        Wed, 30 Oct 2019 14:20:40 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk. [5.186.115.54])
        by smtp.gmail.com with ESMTPSA id h124sm1393305wmf.30.2019.10.30.14.20.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 14:20:40 -0700 (PDT)
Subject: Re: [PATCH 01/16] dyndbg: drop trim_prefix, obsoleted by __FILE__s
 relative path
To:     Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
        linux-kernel@vger.kernel.org
Cc:     greg@kroah.com, clang-built-linux@googlegroups.com,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
References: <20191029200001.9640-1-jim.cromie@gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <07db7036-b46f-c157-5737-e3d96c808f14@rasmusvillemoes.dk>
Date:   Wed, 30 Oct 2019 22:20:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029200001.9640-1-jim.cromie@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/10/2019 21.00, Jim Cromie wrote:
> Regarding:
> commit 2b6783191da7 ("dynamic_debug: add trim_prefix() to provide source-root relative paths")
> commit a73619a845d5 ("kbuild: use -fmacro-prefix-map to make __FILE__ a relative path")
> 
> 2nd commit broke dynamic-debug's "file $fullpath" query form, but
> nobody noticed because 1st commit trimmed prefixes from control-file
> output, so the click-copy-pasting of fullpaths into new queries had
> ceased; that query form became unused.
> 
> So remove the function and callers; its purpose was to strip the
> prefix from __FILE__, which is now gone.

I agree with the intent, but I wonder if this is premature. I mean, the
-fmacro-prefix-map is only for gcc 8+, so this ends up printing the full
paths when the compiler is just a little old (and the kernel was built
out-of-tree).

I don't think keeping the current workaround for a year or two more
should hurt; when int skip = strlen(__FILE__) -
strlen("lib/dynamic_debug.c"); evaluates to 0 (in-tree build, or build
with new enough gcc), I'm pretty sure gcc optimizes the rest of the
function away (it should know that strncmp(x, y, 0) gives 0, and even if
it didn't, the conditional assigns 0 to skip which it already is, so gcc
just needs to know that strncmp() is pure).

> 
> Also drop "file $fullpath" from docs, and tweak example to cite column
> 1 of control-file as valid "file $input".

That part certainly makes sense, since the $fullpath hasn't actually
been in the control file for a long time.

Rasmus

