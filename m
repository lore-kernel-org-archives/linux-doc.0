Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 44FB47DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Apr 2018 15:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752894AbeDKPol (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 11:44:41 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35437 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753411AbeDKPoi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Apr 2018 11:44:38 -0400
Received: by mail-wm0-f68.google.com with SMTP id r82so4685636wme.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Apr 2018 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N2gMiEp/g/RCKBWJGrk1tzpOKZUTisHWGsQEcyjJ1Gc=;
        b=n9xRT2wDh5UV8Ep7yV/PzfPYw0dxEyVI7W70IsVwewFXyUS9avTQdGDIydt8hBbp59
         a36Qb6UEZj68XFnmRuRKAY4m95jr6ysskV4yKqRTsHo7czNnd/4TFNwEWYP85B50ur0S
         O7/tvrVd+OV/eJ7Bwu4c/9+PF2ANZfWWSLveegk1peWSvdfHhTHH0J70FJ5enlqcOf4Y
         Cwg/PzOuRUGnehvFafav18MgAb0KKpJbNrOmSQlba0edz31HjyH6Y3fIbEBfuTZ5QQlb
         NiOvkl4faMuy0dm5Wyzyd5GowdEjc6uwYdFdFI+l/f2xWICgZudeaqwUlbTernrCJfyp
         vhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=N2gMiEp/g/RCKBWJGrk1tzpOKZUTisHWGsQEcyjJ1Gc=;
        b=S9etwuOwUrYDlW6Kneqsv17Vipg5dA7gME1n/vvRRLpc36mcCtE1FdwxwXRaBJENBB
         lHqxqCPhPYIXuOku/R6bffW8zTeY+DEHpwNK+WH72C2dq4avb7G5kkTiCAYlVmFqqO4L
         Yr74hEwKg92jwwcLfc4QQK1HxCHSr4jSkVOdnDEdDnzcaPAP27aoIc54JfV0efZ4Cjy2
         v+Col/PPPaB9RtQfXmkhchbl2GdEEUU+FbV6bl/S/RgcPY1y9Di0uOGpTncckgtBVogn
         LgAlzhEX4uF0P0jQMA5uBOAsILYnlaQmg6gZpMR9ekSLXvrPZeLy7GwtiaakM4epleuW
         /3VQ==
X-Gm-Message-State: ALQs6tAU/aZOPBQ9SPfsgjTHfoEvu/SLbhn+AQZ+/4v8jumXIzICZoRL
        805TIKlBqxvCa93Mb4qRpoM24zEv
X-Google-Smtp-Source: AIpwx4/hYilEEyqr1f6GFWTN6d97gF1kTh2/W/5BrSX9ao+WTjkukb0nOOGnJV9eDhZ5bphpx3olQg==
X-Received: by 10.80.177.81 with SMTP id l17mr10578278edd.65.1523461477634;
        Wed, 11 Apr 2018 08:44:37 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id g55sm996953eda.15.2018.04.11.08.44.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Apr 2018 08:44:37 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 7/8] bpf: add documentation for eBPF helpers (51-57)
To:     Yonghong Song <yhs@fb.com>, daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org,
        Lawrence Brakmo <brakmo@fb.com>, Josef Bacik <jbacik@fb.com>,
        Andrey Ignatov <rdna@fb.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-8-quentin.monnet@netronome.com>
 <cc54b41e-3f2f-e87f-042f-842c96308626@fb.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <7e388b10-ccea-a2b0-e776-5420c8e7f521@netronome.com>
Date:   Wed, 11 Apr 2018 16:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <cc54b41e-3f2f-e87f-042f-842c96308626@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-10 09:58 UTC-0700 ~ Yonghong Song <yhs@fb.com>
> On 4/10/18 7:41 AM, Quentin Monnet wrote:
>> Add documentation for eBPF helper functions to bpf.h user header file.
>> This documentation can be parsed with the Python script provided in
>> another commit of the patch series, in order to provide a RST document
>> that can later be converted into a man page.
>>
>> The objective is to make the documentation easily understandable and
>> accessible to all eBPF developers, including beginners.
>>
>> This patch contains descriptions for the following helper functions:
>>
>> Helpers from Lawrence:
>> - bpf_setsockopt()
>> - bpf_getsockopt()
>> - bpf_sock_ops_cb_flags_set()
>>
>> Helpers from Yonghong:
>> - bpf_perf_event_read_value()
>> - bpf_perf_prog_read_value()
>>
>> Helper from Josef:
>> - bpf_override_return()
>>
>> Helper from Andrey:
>> - bpf_bind()
>>
>> Cc: Lawrence Brakmo <brakmo@fb.com>
>> Cc: Yonghong Song <yhs@fb.com>
>> Cc: Josef Bacik <jbacik@fb.com>
>> Cc: Andrey Ignatov <rdna@fb.com>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>   include/uapi/linux/bpf.h | 184
>> +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 184 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 15d9ccafebbe..7343af4196c8 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h

[...]

>> @@ -1255,6 +1277,168 @@ union bpf_attr {
>>    *         performed again.
>>    *     Return
>>    *         0 on success, or a negative error in case of failure.
>> + *
>> + * int bpf_perf_event_read_value(struct bpf_map *map, u64 flags,
>> struct bpf_perf_event_value *buf, u32 buf_size)
>> + *     Description
>> + *         Read the value of a perf event counter, and store it into
>> *buf*
>> + *         of size *buf_size*. This helper relies on a *map* of type
>> + *         **BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The nature of the perf
>> + *         event counter is selected at the creation of the *map*. The
> 
> The nature of the perf event counter is selected when *map* is updated
> with perf_event fd's.
> 

Thanks, I will fix it.

>> + *         *map* is an array whose size is the number of available CPU
>> + *         cores, and each cell contains a value relative to one
>> core. The
> 
> It is confusing to mix core/cpu here. Maybe just use perf_event
> convention, always using cpu?
> 

Right, I'll remove occurrences of "core".

>> + *         value to retrieve is indicated by *flags*, that contains the
>> + *         index of the core to look up, masked with
>> + *         **BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
>> + *         **BPF_F_CURRENT_CPU** to indicate that the value for the
>> + *         current CPU core should be retrieved.
>> + *
>> + *         This helper behaves in a way close to
>> + *         **bpf_perf_event_read**\ () helper, save that instead of
>> + *         just returning the value observed, it fills the *buf*
>> + *         structure. This allows for additional data to be
>> retrieved: in
>> + *         particular, the enabled and running times (in *buf*\
>> + *         **->enabled** and *buf*\ **->running**, respectively) are
>> + *         copied.
>> + *
>> + *         These values are interesting, because hardware PMU
>> (Performance
>> + *         Monitoring Unit) counters are limited resources. When
>> there are
>> + *         more PMU based perf events opened than available counters,
>> + *         kernel will multiplex these events so each event gets certain
>> + *         percentage (but not all) of the PMU time. In case that
>> + *         multiplexing happens, the number of samples or counter value
>> + *         will not reflect the case compared to when no multiplexing
>> + *         occurs. This makes comparison between different runs
>> difficult.
>> + *         Typically, the counter value should be normalized before
>> + *         comparing to other experiments. The usual normalization is
>> done
>> + *         as follows.
>> + *
>> + *         ::
>> + *
>> + *             normalized_counter = counter * t_enabled / t_running
>> + *
>> + *         Where t_enabled is the time enabled for event and
>> t_running is
>> + *         the time running for event since last normalization. The
>> + *         enabled and running times are accumulated since the perf
>> event
>> + *         open. To achieve scaling factor between two invocations of an
>> + *         eBPF program, users can can use CPU id as the key (which is
>> + *         typical for perf array usage model) to remember the previous
>> + *         value and do the calculation inside the eBPF program.
>> + *     Return
>> + *         0 on success, or a negative error in case of failure.
>> + *

[...]

Thanks Yonghong for the review!

I have a favor to ask of you. I got a bounce for Kaixu Xia's email
address, and I don't know what alternative email address I could use. I
CC-ed to have a review for helper bpf_perf_event_read() (in patch 6 of
this series), which is rather close to bpf_perf_event_read_value().
Would you mind having a look at that one too, please? The description is
not long.

Quentin


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
