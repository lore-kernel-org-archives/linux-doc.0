Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68F8A7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Apr 2018 15:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753411AbeDKPlL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 11:41:11 -0400
Received: from mail-wm0-f48.google.com ([74.125.82.48]:40948 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753254AbeDKPlI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Apr 2018 11:41:08 -0400
Received: by mail-wm0-f48.google.com with SMTP id x4so4567686wmh.5
        for <linux-doc@vger.kernel.org>; Wed, 11 Apr 2018 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G/tH5rWI8Uvmdv5Xl3aOTeLLxKtdQQnbf84a8ux7Teg=;
        b=QBNBx5s8L3mMpokLyrQZpxVH1hooZJKFNcm2WU2YDF+iyWxhpofC+b4xXefRLKFXdP
         lVIQnPbW1rap4LZILZYdoRmC6ohuAevAw9Ybu579VlzkIgA6eJw84rE8DfV9mOigS5/+
         ZXx1l/x96JQCrjZGnB1EIvXKSHQEP9Y/vVNQUuyIlcZSAc0+5+A2X1IuYZbNBeWjt3kr
         bFc8XI0gQiroZYizjkv3mP7pSjC5ttyr2XeoAfN94yWOXacDN4KTrHDxy0xdM79wGAPs
         s7J+/VwCd2W0YgN5LA4yDs9x6HFHoYSnPaQ0VLpmorR7oORNArUHUbRLoEN97XswtECn
         X1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=G/tH5rWI8Uvmdv5Xl3aOTeLLxKtdQQnbf84a8ux7Teg=;
        b=oemrrv66WHmVgb8LoTWj/+6BRXN7tz4smw+Y2AGFd83URXyrEvnE0KOpqMSlpJural
         ExEYqVg1tzeGx3pqh43AFzRZjfT+nX4bs6ETTmQpM6jxhyxRrKzU8JJP0W4hufMqi7oy
         MP+kInBwRoKNeIb4QEV7V2HaQa8YMwqt3BwskyDzrZ+Xs98auUlBDt1inHT9VRCs4qAU
         5hxSxTgMCE7kjUqo2B0MaPecFK1rv9aFHiEBt2lof+YlP6QVCx/qjpuceQYpg8msrtwB
         a3y+0jHeCMLrCf1FC0l+2xzNjFpuHyvmBm2zsYSWzN4Cvx1ATFu66jASJGYbTbOXa/wF
         nWvg==
X-Gm-Message-State: ALQs6tClgAGOepUMoTSlUHjxRPOi2OBRFpyqM36E/qPF5p1VOIu7TUFJ
        L/lF8X3RzRm2FwHZxc40geT/rA==
X-Google-Smtp-Source: AIpwx4/ZUJjQ5JgaeFk++Xa2ZRWDntnCblz3V9qcjRuUOAeeg7g0DraraxY3bz3pZdIlZzkjUdtpwA==
X-Received: by 10.80.243.132 with SMTP id g4mr10464247edm.104.1523461266760;
        Wed, 11 Apr 2018 08:41:06 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id a18sm925395edj.89.2018.04.11.08.41.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Apr 2018 08:41:06 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 1/8] bpf: add script and prepare bpf.h for new
 helpers documentation
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-2-quentin.monnet@netronome.com>
 <20180410181620.axzpwh2iawg2kgh3@ast-mbp.dhcp.thefacebook.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <8f999e0a-1c75-6443-ee1e-2913e3cf313e@netronome.com>
Date:   Wed, 11 Apr 2018 16:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180410181620.axzpwh2iawg2kgh3@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-10 11:16 UTC-0700 ~ Alexei Starovoitov
<alexei.starovoitov@gmail.com>
> On Tue, Apr 10, 2018 at 03:41:50PM +0100, Quentin Monnet wrote:
>> Remove previous "overview" of eBPF helpers from user bpf.h header.
>> Replace it by a comment explaining how to process the new documentation
>> (to come in following patches) with a Python script to produce RST, then
>> man page documentation.
>>
>> Also add the aforementioned Python script under scripts/. It is used to
>> process include/uapi/linux/bpf.h and to extract helper descriptions, to
>> turn it into a RST document that can further be processed with rst2man
>> to produce a man page. The script takes one "--filename <path/to/file>"
>> option. If the script is launched from scripts/ in the kernel root
>> directory, it should be able to find the location of the header to
>> parse, and "--filename <path/to/file>" is then optional. If it cannot
>> find the file, then the option becomes mandatory. RST-formatted
>> documentation is printed to standard output.
>>
>> Typical workflow for producing the final man page would be:
>>
>>     $ ./scripts/bpf_helpers_doc.py \
>>             --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>>     $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>>     $ man /tmp/bpf-helpers.7
>>
>> Note that the tool kernel-doc cannot be used to document eBPF helpers,
>> whose signatures are not available directly in the header files
>> (pre-processor directives are used to produce them at the beginning of
>> the compilation process).
>>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>  include/uapi/linux/bpf.h   | 406 ++------------------------------------------
>>  scripts/bpf_helpers_doc.py | 414 +++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 430 insertions(+), 390 deletions(-)
>>  create mode 100755 scripts/bpf_helpers_doc.py
>>

[...]

>> diff --git a/scripts/bpf_helpers_doc.py b/scripts/bpf_helpers_doc.py
>> new file mode 100755
>> index 000000000000..3a15ba3f0a83
>> --- /dev/null
>> +++ b/scripts/bpf_helpers_doc.py
>> @@ -0,0 +1,414 @@
>> +#!/usr/bin/python3
>> +#
>> +# Copyright (C) 2018 Netronome Systems, Inc.
>> +#
>> +# This software is licensed under the GNU General License Version 2,
>> +# June 1991 as shown in the file COPYING in the top-level directory of this
>> +# source tree.
> 
> please use SPDX instead.
> 

Same as for bpftool, our layers remain a bit cautious about it. I'd be
happy to change it for SPDX as a follow-up when I get the green light.

>> +#
>> +# THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS"
>> +# WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
>> +# BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
>> +# FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
>> +# OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME
>> +# THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
>> +

[...]

>> +class PrinterRST(Printer):
>> +    """
>> +    A printer for dumping collected information about helpers as a ReStructured
>> +    Text page compatible with the rst2man program, which can be used to
>> +    generate a manual page for the helpers.
>> +    @helpers: array of Helper objects to print to standard output
>> +    """
>> +    def print_header(self):
>> +        header = '''\
>> +.. Copyright (C) 2018 Netronome Systems, Inc.
> 
> I think would be good to capture copyrights of all authors that added
> the helpers being documented. Since a lot of text was copied from commit
> logs it's only fair to preserve the copyrights.
> Such man page file is automatically generated by the python script
> and script itself is copyrighted by Netronome. That's fine, but the text
> of man page is not netronome only.
> I'm not sure what would be the solution. May be something like:
> "
> Copyright (C) All BPF authors and contributors from 2011 to present
> See git log include/uapi/linux/bpf.h for details
> "
> ?

Seems fair indeed. I do not have a better suggestion myself, so I will
stick to yours.

Out of curiosity, why 2011 for the year? I thought you introduced eBPF
in the kernel in 2014 (bd4cf0ed331a), and I do not believe helpers have
any link with cBPF?

>> +.. 
>> +.. %%%LICENSE_START(VERBATIM)
>> +.. Permission is granted to make and distribute verbatim copies of this
>> +.. manual provided the copyright notice and this permission notice are
>> +.. preserved on all copies.
>> +.. 
>> +.. Permission is granted to copy and distribute modified versions of this
>> +.. manual under the conditions for verbatim copying, provided that the
>> +.. entire resulting derived work is distributed under the terms of a
>> +.. permission notice identical to this one.
>> +.. 
>> +.. Since the Linux kernel and libraries are constantly changing, this
>> +.. manual page may be incorrect or out-of-date.  The author(s) assume no
>> +.. responsibility for errors or omissions, or for damages resulting from
>> +.. the use of the information contained herein.  The author(s) may not
>> +.. have taken the same level of care in the production of this manual,
>> +.. which is licensed free of charge, as they might when working
>> +.. professionally.
>> +.. 
>> +.. Formatted or processed versions of this manual, if unaccompanied by
>> +.. the source, must acknowledge the copyright and authors of this work.
>> +.. %%%LICENSE_END
>> +.. 
>> +.. Please do not edit this file. It was generated from the documentation
>> +.. located in file include/uapi/linux/bpf.h of the Linux kernel sources
>> +.. (helpers description), and from scripts/bpf_helpers_doc.py in the same
>> +.. repository (header and footer).
>> +
>> +===========
>> +BPF-HELPERS
>> +===========
>> +-------------------------------------------------------------------------------
>> +list of eBPF helper functions
>> +-------------------------------------------------------------------------------
>> +
>> +:Manual section: 7
>> +
>> +DESCRIPTION
>> +===========
>> +
>> +The extended Berkeley Packet Filter (eBPF) subsystem consists in programs
>> +written in a pseudo-assembly language, then attached to one of the several
>> +kernel hooks and run in reaction of specific events. This framework differs
>> +from the older, "classic" BPF (or "cBPF") in several aspects, one of them being
>> +the ability to call special functions (or "helpers") from within a program. For
>> +security reasons, these functions are restricted to a white-list of helpers
>> +defined in the kernel.
> 
> 'for security reasons' sounds a bit odd. May be 'for safety reasons' ?
> Or drop that part.

I'll drop it and keep "These functions are restricted to a white-list of
helpers defined in the kernel."

>> +
>> +These helpers are used by eBPF programs to interact with the system, or with
>> +the context in which they work. For instance, they can be used to print
>> +debugging messages, to get the time since the system was booted, to interact
>> +with eBPF maps, or to manipulate network packets metadata. Since there are
> 
> s/packets metadata/packets/

Ok.

>> +several eBPF program types, and that they do not run in the same context, each
>> +program type can only call a subset of those helpers.
>> +
>> +Due to eBPF conventions, a helper can not have more than five arguments.
>> +
>> +This document is an attempt to list and document the helpers available to eBPF
>> +developers. They are sorted by chronological order (the oldest helpers in the
>> +kernel at the top).
>> +
>> +HELPERS
>> +=======
>> +'''
>> +        print(header)
>> +
>> +    def print_footer(self):
>> +        footer = '''
>> +NOTES
>> +=====
>> +
>> +On the performance side, eBPF programs move to the stack all arguments to pass
>> +to the helpers, and call directly into the compiled helper functions without
> 
> "move to the stack all arguments" ?! I'm not sure what you're trying to say.
> The arguments stay in registers for the call.
> 
>> +requiring any foreign-function interface. As a result, calling helpers
>> +introduce very little overhead.
> 
> not true. it's zero overhead. Literally. Very little is not the same as zero.

Not the same indeed :). I will fix with "no overhead".

I'm not too sure either what I meant when I wrote the thing about moving
arguments to the stack... In fact this "NOTES" section is short and not
really relevant. I will probably delete it and add a line in page header
about helpers being called with no overhead.

>> +
>> +EXAMPLES
>> +========
>> +
>> +Example usage for most of the eBPF helpers listed in this manual page are
>> +available within the Linux kernel sources, at the following locations:
>> +
>> +* *samples/bpf/*
>> +* *tools/testing/selftests/bpf/*
>> +
>> +IMPLEMENTATION
>> +==============
>> +
>> +This manual page is an effort to document the existing eBPF helper functions.
>> +But as of this writing, the BPF sub-system is under heavy development. New eBPF
>> +program or map types are added, along with new helper functions. Some helpers
>> +are occasionally made available for additional program types. So in spite of
>> +the efforts of the community, this page might not be up-to-date. If you want to
>> +check by yourself what helper functions exist in your kernel, or what types of
>> +programs they can support, here are some files among the kernel tree that you
>> +may be interested in:
>> +
>> +* *include/uapi/linux/bpf.h* contains the full list of all helper functions.
>> +* *net/core/filter.c* contains the definition of most network-related helper
>> +  functions, and the list of program types from which they can be used.
>> +* *kernel/trace/bpf_trace.c* is the equivalent for most tracing program-related
>> +  helpers.
>> +* *kernel/bpf/verifier.c* contains the functions used to check that valid types
>> +  of eBPF maps are used with a given helper function.
>> +* *kernel/bpf/* directory contains other files in which additional helpers are
>> +  defined (for cgroups, sockmaps, etc.).
>> +
>> +Compatibility between helper functions and program types can generally be found
>> +in the files where helper functions are defined. Look for the **struct
>> +bpf_func_proto** objects and for functions returning them: these functions
>> +contain a list of helpers that a given program type can call. Note that the
>> +**default:** label of the **switch ... case** used to filter helpers can call
>> +other functions, themselves allowing access to additional helpers. The
>> +requirement for GPL license is also in those **struct bpf_func_proto**.
> 
> I think here would be good to add that most networking helpers are non-GPL
> because they operate on packets which are abstract bytes on the wire,
> whereas most tracing helpers are GPL, since they inspect the guts of
> the linux kernel which is GPL itself.
> That's the main reason why adding extra 'gpl=yes/no' for each helper
> description is redundant.
> 

I removed information from the page header about licensing since v1, I
may reintroduce some of it and tell about the difference between
networking and tracing programs, as you suggest.

I understand this difference and I see that specifying GPL requirement
for each individual helper is redundant. And yet I still believe that
for newcomers, it remains easier to have the indication for the specific
helper they are reading about in the man page rather than to take a
guess ("Is this helper for networking only?"). But I do not intend to
add it back to this set anyway, so let's keep this for future
discussions :).

Thanks for the review!
Quentin


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
