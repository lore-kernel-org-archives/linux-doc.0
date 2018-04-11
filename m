Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2CFAE7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Apr 2018 15:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753931AbeDKPm1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 11:42:27 -0400
Received: from mail-wm0-f45.google.com ([74.125.82.45]:53018 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752807AbeDKPmZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Apr 2018 11:42:25 -0400
Received: by mail-wm0-f45.google.com with SMTP id g8so5116348wmd.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Apr 2018 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OfbXb9YaV/yvmIE+IhsoJR5i6xeeeMhvSanGcjXZSeM=;
        b=19TnHdlEBshIaX16TVbUluzhqWE/erf3w2s7UdlAWKoJd/pJe5gyTAWtjul5fb4Nch
         QycU48wq5Xzxs3dZZ/XGVC9U5HZklL9h3MQUfL+TTbPHh52xH8pnMzVN+UYu7+kafRbj
         qfiBHXCBXw6NYyWpa6iimNHQTfd1oUpTFVbZXOcQWp4ftX/exffgtDWD04TP4WhuMi4S
         cBT4eLuR3vsuBD2aJ6bbvGI3W11hDzSV9LPnJ/XPvbJtzAMOTZFenf7VoDdNnJOeUkrN
         Iq8J6GCVJDyf0SicFM6tHBxNSFuioSw9ES064fVIjjdzXezrNFZcUALloGdOSwwZbQ8h
         slnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OfbXb9YaV/yvmIE+IhsoJR5i6xeeeMhvSanGcjXZSeM=;
        b=srZ4Zyw+JXQi/8cJJQXQ8OexZYE6eTAkgFHK2lyMAtAms0yhqOY2zF0js6I5JJO46o
         Y9yT1tLxFE+pCevv0ciqC4gft6W4zcgHHizOyHlpw/MeZWtGdnZMuQ0tUIeDSgHU55Va
         c+a3NoJj9IHLzwhPe0sd4TP400sqkbRizig6OH28Hqacov+8iLf4m9JdliszgqiyJ+8N
         75J2KJzv5xKLgOVLen/oKfGkbFyQj+awGithsfnFpyhY3hcQoI1VDJ36abOzPwN5XbFC
         TJpvUyiosxv2FtqxYWdc3FEEj+IE2QDetdUvEN6EtYOmdT27fNkkK37UT0C/y1v9Qf0P
         sw8Q==
X-Gm-Message-State: ALQs6tBgncNXzGKajwe55sKlFhoAVDJuzxXTBV7vrEFDkluwWbezFXHt
        CsmrVYzfuNUrcSwnbartSWNtmg==
X-Google-Smtp-Source: AIpwx4/wiKVI9I+kSz0pWM9ZchysHIkLkIrs1bJYBXnP1f/VfgEF+y+WuQxigPJlYndTx8rOQmJ1qA==
X-Received: by 10.80.137.245 with SMTP id h50mr10567379edh.39.1523461344036;
        Wed, 11 Apr 2018 08:42:24 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id i6sm946232eda.16.2018.04.11.08.42.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Apr 2018 08:42:23 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 2/8] bpf: add documentation for eBPF helpers (01-11)
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-3-quentin.monnet@netronome.com>
 <20180410175605.2wqhaqx34a4o3gdi@ast-mbp.dhcp.thefacebook.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <6db57eb9-13eb-db70-3afa-64b7c074aa7f@netronome.com>
Date:   Wed, 11 Apr 2018 16:42:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180410175605.2wqhaqx34a4o3gdi@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-10 10:56 UTC-0700 ~ Alexei Starovoitov
<alexei.starovoitov@gmail.com>
> On Tue, Apr 10, 2018 at 03:41:51PM +0100, Quentin Monnet wrote:
>> Add documentation for eBPF helper functions to bpf.h user header file.
>> This documentation can be parsed with the Python script provided in
>> another commit of the patch series, in order to provide a RST document
>> that can later be converted into a man page.
>>
>> The objective is to make the documentation easily understandable and
>> accessible to all eBPF developers, including beginners.
>>
>> This patch contains descriptions for the following helper functions, all
>> written by Alexei:
>>
>> - bpf_map_lookup_elem()
>> - bpf_map_update_elem()
>> - bpf_map_delete_elem()
>> - bpf_probe_read()
>> - bpf_ktime_get_ns()
>> - bpf_trace_printk()
>> - bpf_skb_store_bytes()
>> - bpf_l3_csum_replace()
>> - bpf_l4_csum_replace()
>> - bpf_tail_call()
>> - bpf_clone_redirect()
>>
>> Cc: Alexei Starovoitov <ast@kernel.org>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>  include/uapi/linux/bpf.h | 199 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 199 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 45f77f01e672..2bc653a3a20f 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -381,6 +381,205 @@ union bpf_attr {
>>   * intentional, removing them would break paragraphs for rst2man.
>>   *
>>   * Start of BPF helper function descriptions:
>> + *
>> + * void *bpf_map_lookup_elem(struct bpf_map *map, void *key)
>> + * 	Description
>> + * 		Perform a lookup in *map* for an entry associated to *key*.
>> + * 	Return
>> + * 		Map value associated to *key*, or **NULL** if no entry was
>> + * 		found.
>> + *
>> + * int bpf_map_update_elem(struct bpf_map *map, void *key, void *value, u64 flags)
>> + * 	Description
>> + * 		Add or update the value of the entry associated to *key* in
>> + * 		*map* with *value*. *flags* is one of:
>> + *
>> + * 		**BPF_NOEXIST**
>> + * 			The entry for *key* must not exist in the map.
>> + * 		**BPF_EXIST**
>> + * 			The entry for *key* must already exist in the map.
>> + * 		**BPF_ANY**
>> + * 			No condition on the existence of the entry for *key*.
>> + *
>> + * 		These flags are only useful for maps of type
>> + * 		**BPF_MAP_TYPE_HASH**. For all other map types, **BPF_ANY**
>> + * 		should be used.
> 
> I think that's not entirely accurate.
> The flags work as expected for all other map types as well
> and for lru map, sockmap, map in map the flags have practical use cases.
> 

Ok, I missed that. I have to go back and check how the flags are used
for those maps. I will cook up something cleaner for the next version of
the set.

>> + * 	Return
>> + * 		0 on success, or a negative error in case of failure.
>> + *

[...]

>> + *
>> + * int bpf_trace_printk(const char *fmt, u32 fmt_size, ...)
>> + * 	Description
>> + * 		This helper is a "printk()-like" facility for debugging. It
>> + * 		prints a message defined by format *fmt* (of size *fmt_size*)
>> + * 		to file *\/sys/kernel/debug/tracing/trace* from DebugFS, if
>> + * 		available. It can take up to three additional **u64**
>> + * 		arguments (as an eBPF helpers, the total number of arguments is
>> + * 		limited to five). Each time the helper is called, it appends a
>> + * 		line that looks like the following:
>> + *
>> + * 		::
>> + *
>> + * 			telnet-470   [001] .N.. 419421.045894: 0x00000001: BPF command: 2
>> + *
>> + * 		In the above:
>> + *
>> + * 			* ``telnet`` is the name of the current task.
>> + * 			* ``470`` is the PID of the current task.
>> + * 			* ``001`` is the CPU number on which the task is
>> + * 			  running.
>> + * 			* In ``.N..``, each character refers to a set of
>> + * 			  options (whether irqs are enabled, scheduling
>> + * 			  options, whether hard/softirqs are running, level of
>> + * 			  preempt_disabled respectively). **N** means that
>> + * 			  **TIF_NEED_RESCHED** and **PREEMPT_NEED_RESCHED**
>> + * 			  are set.
>> + * 			* ``419421.045894`` is a timestamp.
>> + * 			* ``0x00000001`` is a fake value used by BPF for the
>> + * 			  instruction pointer register.
>> + * 			* ``BPF command: 2`` is the message formatted with
>> + * 			  *fmt*.
> 
> the above depends on how trace_pipe was configured. It's a default
> configuration for many, but would be good to explain this a bit better.
> 

I did not know about that. Would you have a pointer about how to
configure trace_pipe, please?

>> + *
>> + * 		The conversion specifiers supported by *fmt* are similar, but
>> + * 		more limited than for printk(). They are **%d**, **%i**,
>> + * 		**%u**, **%x**, **%ld**, **%li**, **%lu**, **%lx**, **%lld**,
>> + * 		**%lli**, **%llu**, **%llx**, **%p**, **%s**. No modifier (size
>> + * 		of field, padding with zeroes, etc.) is available, and the
>> + * 		helper will silently fail if it encounters an unknown
>> + * 		specifier.
> 
> This is not true. bpf_trace_printk will return -EINVAL for unknown specifier.
> 

Correct, sorry about that. I never check the return value of
bpf_trace_printk(), and it's hard to realise it failed without resorting
to another bpf_trace_printk() :). I'll fix it, what about:

"No modifier (size of field, padding with zeroes, etc.) is available,
and the helper will return **-EINVAL** (but print nothing) if it
encounters an unknown specifier."

(I would like to keep the "print nothing" idea, at the beginning I spent
some time myself trying to figure out why my bpf_trace_prink() seemed to
be never called--I was simply trying to print with "%#x".)

>> + *
>> + * 		Also, note that **bpf_trace_printk**\ () is slow, and should
>> + * 		only be used for debugging purposes. For passing values to user
>> + * 		space, perf events should be preferred.
> 
> please mention the giant dmesg warning that people will definitely
> notice when they try to use this helper.

This is a good idea, I will mention it.

>> + * 	Return
>> + * 		The number of bytes written to the buffer, or a negative error
>> + * 		in case of failure.
>> + *

[...]

>> + * int bpf_tail_call(void *ctx, struct bpf_map *prog_array_map, u32 index)
>> + * 	Description
>> + * 		This special helper is used to trigger a "tail call", or in
>> + * 		other words, to jump into another eBPF program. The contents of
>> + * 		eBPF registers and stack are not modified, the new program
>> + * 		"inherits" them from the caller. This mechanism allows for
> 
> "inherits" is a technically correct, but misleading statement,
> since callee program cannot access caller's registers and stack.
> 

I can replace this sentence by:

"The same stack frame is used (but values on stack and in registers for
the caller are not accessible to the callee)."

>> + * 		program chaining, either for raising the maximum number of
>> + * 		available eBPF instructions, or to execute given programs in
>> + * 		conditional blocks. For security reasons, there is an upper
>> + * 		limit to the number of successive tail calls that can be
>> + * 		performed.
>> + *
>> + * 		Upon call of this helper, the program attempts to jump into a
>> + * 		program referenced at index *index* in *prog_array_map*, a
>> + * 		special map of type **BPF_MAP_TYPE_PROG_ARRAY**, and passes
>> + * 		*ctx*, a pointer to the context.
>> + *
>> + * 		If the call succeeds, the kernel immediately runs the first
>> + * 		instruction of the new program. This is not a function call,
>> + * 		and it never goes back to the previous program. If the call
>> + * 		fails, then the helper has no effect, and the caller continues
>> + * 		to run its own instructions. A call can fail if the destination
>> + * 		program for the jump does not exist (i.e. *index* is superior
>> + * 		to the number of entries in *prog_array_map*), or if the
>> + * 		maximum number of tail calls has been reached for this chain of
>> + * 		programs. This limit is defined in the kernel by the macro
>> + * 		**MAX_TAIL_CALL_CNT** (not accessible to user space), which
>> + * 		is currently set to 32.
>> + * 	Return
>> + * 		0 on success, or a negative error in case of failure.
>> + *
>> + * int bpf_clone_redirect(struct sk_buff *skb, u32 ifindex, u64 flags)
>> + * 	Description
>> + * 		Clone and redirect the packet associated to *skb* to another
>> + * 		net device of index *ifindex*. The only flag supported for now
>> + * 		is **BPF_F_INGRESS**, which indicates the packet is to be
>> + * 		redirected to the ingress interface instead of (by default)
>> + * 		egress.
> 
> imo the above sentence is prone to misinterpretation.
> Can you rephrase it to say that both redirect to ingress and redirect to egress
> are supported and flag is used to indicate which path to take ?
> 

I could replace with the following:

"Clone and redirect the packet associated to *skb* to another net device
of index *ifindex*. Both ingress and egress interfaces can be used for
redirection. The **BPF_F_INGRESS** value in *flags* is used to make the
distinction (ingress path is selected if the flag is present, egress
path otherwise). This is the only flag supported for now."

I think I wrote similar things about other helpers using BPF_F_INGRESS
flag, I will also update them accordingly.

>> + *
>> + * 		A call to this helper is susceptible to change data from the
>> + * 		packet. Therefore, at load time, all checks on pointers
>> + * 		previously done by the verifier are invalidated and must be
>> + * 		performed again.
>> + * 	Return
>> + * 		0 on success, or a negative error in case of failure.
>>   */
>>  #define __BPF_FUNC_MAPPER(FN)		\
>>  	FN(unspec),			\
>> -- 
>> 2.14.1
>>



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
