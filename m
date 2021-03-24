Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC946C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 11:01:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96C0F61A0A
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 11:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhCXLAa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Mar 2021 07:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhCXLAB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Mar 2021 07:00:01 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFE2C061763
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 04:00:01 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id kt15so22633822ejb.12
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 04:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vq6UvNXDWrZTNsMJP/Ia1HW3F97MuZUnuthiX1bxGtU=;
        b=cqmCCRie2CdDl1S1YgCHBGW+OkgqMG5N0dTNLJPsxgsJ7/+26XxfT7PFvafVoyNfjB
         6nloQCQBP0YfyDSQVs9bDrEpT2pjWCzI/zmmZi1GXEHnXHH4yFsFeilTi1UifygghMZF
         pclqUkLGeig18HyqBW3ow5NRhiCIExL3m4Yxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vq6UvNXDWrZTNsMJP/Ia1HW3F97MuZUnuthiX1bxGtU=;
        b=dBnVB88N73AEiK/b6FH2dfXTc3A+ea4mDYQ7yV9cyy3B+wmjq4Q6wUcqe2q1ghmvHB
         q8sDHN8adFz76oD9J/BpYUadET6j02tiySAMIKI2n0J/Pr1Uwkmn4Qdh03CE6RDuys5M
         PaVYt0fcLEvIMaCuM09XZTLt+il0m4X6sT1oDR6SHZTyoOmzNnTBHdlaw1TA77Lvhf9d
         Z+DzW5XgmXIu08H4FD0NUvAjrMiLzkB1OeI98yEe8WRz9lzQgDPtTCgbNGLRXw38trxb
         FuQGUkC9RdFZ0ARR5CgRd6+QPEwN3frCZz5D6E0vIzhmeAfJpl3ZteOZ4FQL9GcrMPWD
         nDfQ==
X-Gm-Message-State: AOAM532YQxT6FqsM+ICiq15fzE0RNMMqaXkNhFmjSDhvzqKMcvxWNfL3
        7ecNdC1ocEIzscpMzm720HWj7Q==
X-Google-Smtp-Source: ABdhPJyfh90JecszOnCBMD0SmB+1HexRYEBzI5l+UU/eO0GM01GwpxlKrXSd47LJXxk7YIAsaQZESg==
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr2972817ejq.1.1616583599964;
        Wed, 24 Mar 2021 03:59:59 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id l10sm951179edr.87.2021.03.24.03.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 03:59:59 -0700 (PDT)
Subject: Re: [PATCH v2] editorconfig: Add automatic editor configuration file
To:     Jonathan Corbet <corbet@lwn.net>, Danny Lin <danny@kdrag0n.dev>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <16043769.gqpzGLO8mG@pinwheel>
 <20200703073143.423557-1-danny@kdrag0n.dev> <20200703062950.5e8c1785@lwn.net>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9486d1ab-580a-0819-10c9-a62354a255e1@rasmusvillemoes.dk>
Date:   Wed, 24 Mar 2021 11:59:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20200703062950.5e8c1785@lwn.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/07/2020 14.29, Jonathan Corbet wrote:

[doing a bit of necromancy here]

> On Fri,  3 Jul 2020 00:31:43 -0700
> Danny Lin <danny@kdrag0n.dev> wrote:
> 
>> EditorConfig is a standard for defining basic editor configuration in
>> projects. There is support available for 47 code editors as of writing,
>> including both built-in and extension support. Many notable projects
>> have adopted the standard already, including zsh, htop, and qemu.
>>
>> While this isn't a full-fledged C code style specifier, it does set some
>> basic ground rules that make it more convenient for contributors to use
>> any editor of their choice and not have to worry about indentation, line
>> endings, encoding, final newlines, etc. This should make it
>> significantly easier to conform to the kernel's general code style when
>> used in combination with clang-format.
>>
>> For more information, check the official EditorConfig website:
>> https://editorconfig.org/
>>
>> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
>> ---
> 
> So I worry a bit that not everybody will welcome the addition of a dotfile
> that may be magically interpreted by their editor.

I would suppose that one would have to enable editorconfig support
explicitly in one's editor, so this would have no effect for people that
haven't done so (though there are almost certainly exceptions).

> I also worry that the
> file itself could become a battleground for people wanting to argue about
> style issues.

I don't think so, not any more than the coding-style document is, and
that seems to be pretty solid (but as doc maintainer, you'd know better).

> 
> Perhaps I worry a bit too much...?

As someone who regularly needs to submit patches to random upstream
projects to fix bugs or implement minor features, I for one would really
welcome more widespread use of editorconfig. While I mostly work with
the linux kernel (and other projects using the same C style), so my
default C style setting is "linux", even for the kernel this would be
helpful to me when I poke around in none-C files (shell scripts, for
example).

Rasmus
