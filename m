Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 77FF57E86A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Apr 2018 18:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753904AbeDKSBf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 14:01:35 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:40452 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753883AbeDKSBb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Apr 2018 14:01:31 -0400
Received: by mail-wm0-f68.google.com with SMTP id x4so5274268wmh.5
        for <linux-doc@vger.kernel.org>; Wed, 11 Apr 2018 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XF9zPi9fw8oiGjHSljLObWsy0qKl3RTZbpMX8bUoqpw=;
        b=cdmmRqVsbmCriLMCddWFyeenZR4iywHsc306kpYu8ePdjz/2lg+3i1FFxTbx/9P8lr
         0Tu+A6fyYp/oE5H18BTlVD0LUBC30WFKev4YvWwZBB1jolqLaipKV2RDU+za1a5B1/YC
         dn9Oc+qFnkItUz1HsKYjwfSs+obQZbmCw5SWlKhrokNa49XoLhXv+8DzCu5xMBqVGUHM
         CP7fxxr6khHlPtZTcXTSC0h8KDeFgQ9P1G92y8SFi3WnZ/bJtWYkLYdU9vdXrh3GF9YT
         tZ7C6VVwyxlxFjBe9nFKt6BeWvhCPSWsgW+8gqSAatxctcN5/GQTdlvoIEZkTDNbRyEK
         BVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XF9zPi9fw8oiGjHSljLObWsy0qKl3RTZbpMX8bUoqpw=;
        b=SAhe/vwNRTcLlMnoR129Itbegik2cN7FTXyG2bVdxrqZe5GmrTwDxdbUfphel1MW+k
         X0580vbhXB4yV05fIivk+5uOwF6Nx8UEY0HyM9aE8ssbRcdpcITv+lCuXli3k8yI3Qlw
         T4uspUDJiSN/gE46fgJ0vPadS03E/XAYXyOa5I5Uw2HahoulqSqwEaQwVehlV4ob52G4
         7fVUCiiBoWkEpZxfAHA3C868Jc4lzZS0nb572/gue0LY1vfmIwiQhsseCEHJBSQrtqVH
         WjKtUEH5nYBhSxSwNMjc+zaU8fxwJeFp6oxqdZBOQyVBhNTk29XOsGs8tNaJ+40ozaGh
         R8ug==
X-Gm-Message-State: ALQs6tBrli5HcNdY4NyU7TeR0DPaywtwMcFPysuJS+HBE3/Hxe1un1DH
        +ASSoe4iec21GJY2rLXROCBoIg==
X-Google-Smtp-Source: AIpwx49O9rcZUq5QejsUQGrTyAkOCKWr9AGHX/gVN4sFAP5hnrYVYXPjJppDZdbPvD/Ho9wW7sUibA==
X-Received: by 10.80.230.19 with SMTP id y19mr10853744edm.160.1523469690489;
        Wed, 11 Apr 2018 11:01:30 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id n3sm1091262edl.27.2018.04.11.11.01.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Apr 2018 11:01:28 -0700 (PDT)
Subject: Re: [RFC bpf-next v2 7/8] bpf: add documentation for eBPF helpers
 (51-57)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     Yonghong Song <yhs@fb.com>, daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org,
        Lawrence Brakmo <brakmo@fb.com>, Josef Bacik <jbacik@fb.com>,
        Andrey Ignatov <rdna@fb.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-8-quentin.monnet@netronome.com>
 <cc54b41e-3f2f-e87f-042f-842c96308626@fb.com>
 <7e388b10-ccea-a2b0-e776-5420c8e7f521@netronome.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <ef91a007-9eec-8afa-cd7e-2f1f8da79343@netronome.com>
Date:   Wed, 11 Apr 2018 19:01:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <7e388b10-ccea-a2b0-e776-5420c8e7f521@netronome.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-11 16:44 UTC+0100 ~ Quentin Monnet <quentin.monnet@netronome.com>
> 2018-04-10 09:58 UTC-0700 ~ Yonghong Song <yhs@fb.com>
>> On 4/10/18 7:41 AM, Quentin Monnet wrote:
>>> Add documentation for eBPF helper functions to bpf.h user header file.
>>> This documentation can be parsed with the Python script provided in
>>> another commit of the patch series, in order to provide a RST document
>>> that can later be converted into a man page.
>>>
>>> The objective is to make the documentation easily understandable and
>>> accessible to all eBPF developers, including beginners.
>>>
>>> This patch contains descriptions for the following helper functions:
>>>
>>> Helpers from Lawrence:
>>> - bpf_setsockopt()
>>> - bpf_getsockopt()
>>> - bpf_sock_ops_cb_flags_set()
>>>
>>> Helpers from Yonghong:
>>> - bpf_perf_event_read_value()
>>> - bpf_perf_prog_read_value()
>>>
>>> Helper from Josef:
>>> - bpf_override_return()
>>>
>>> Helper from Andrey:
>>> - bpf_bind()
>>>
>>> Cc: Lawrence Brakmo <brakmo@fb.com>
>>> Cc: Yonghong Song <yhs@fb.com>
>>> Cc: Josef Bacik <jbacik@fb.com>
>>> Cc: Andrey Ignatov <rdna@fb.com>
>>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>>> ---

> [...]
> 
> Thanks Yonghong for the review!
> 
> I have a favor to ask of you. I got a bounce for Kaixu Xia's email
> address, and I don't know what alternative email address I could use. I
> CC-ed to have a review for helper bpf_perf_event_read() (in patch 6 of
> this series), which is rather close to bpf_perf_event_read_value().
> Would you mind having a look at that one too, please? The description is
> not long.

Well I read again the description I wrote, and actually the one for
bpf_perf_evnet_read() is nearly a subset of the one for
perf_event_read_value(). So the same comments that you raised earlier
apply, there's probably nothing more to review. But if you notice that
some important info is missing for bpf_perf_event_read(), I'm interested
too!

Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
