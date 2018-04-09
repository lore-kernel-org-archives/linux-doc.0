Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B6F27E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 13:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752211AbeDINZc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 09:25:32 -0400
Received: from mail-wm0-f45.google.com ([74.125.82.45]:38429 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751988AbeDINZa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 09:25:30 -0400
Received: by mail-wm0-f45.google.com with SMTP id i3so16753692wmf.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Apr 2018 06:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lFfTtbJqB5jEVZnaN3wia76ypDUSZqlC8iw5k+6RsUs=;
        b=pUxnTa4rqV51+T2UwNMdRhmlUVQnRNb6p/RTF6lrb7RNOW5vuvVu49SlyDciw3Rusl
         /TPM47tSW9aUu3ajpZ4dvdToyD1EvcR8xKtPMTU5EKscC+5TF3p5zePdaFp8RMv6ZJGp
         LucSHv1sFwVU4e9aP3Ew5a73N0OaFtW7jM4kbAS/ygnmOmpvSafzha1kJCZODpk0VqLd
         a119CQrjNXz/WZe0dfLMeban3jHJ8UKP8T7kuZ2lpdjAYO1Q0tlNrhDrJChg9BMJjpCu
         bhbxmtB3MPNDtwg1a0vXT6/uMDn/g0UWbZlgOypreBA722/In45DIJ6bPiF0GJVAdhPB
         XhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lFfTtbJqB5jEVZnaN3wia76ypDUSZqlC8iw5k+6RsUs=;
        b=o9CGosUl5p5hBqKBrKS7lXunOZ8JlIao+QQuJG82+e2IN7Pr0flHr3khDexW2J9Ubj
         cb8hsNUt9yK7MwvMO9HXqDo146JJfe11Xc9De/NDg+nUHAgZf1xQ5902pyXKMpEJ4bKX
         hEae1pp/b3qXkH+Wj74Np13+cYoCvcUFkr06VLnn+UptPsl90FUIlmi3TV8CpQva6U4R
         AktEC+nE1lCEBQvCd/f1/eJXByCrWu2INxct3qhK71yvKV715r97jc5nvVmzeMQnUXP1
         q7W5MAt3Y9x/xKDW5jeKodQe/LSD++AU0Km+9nB++PNBeEBBFWLCgE/dCQpRH/4C9HJ+
         56bw==
X-Gm-Message-State: ALQs6tCBPA0vmR0RsdlE3ngoktv584tTXX2TG1AlOz7WZcMepAsJnKwi
        ufiZokVO5dbRIXY3exxIdS0D/A==
X-Google-Smtp-Source: AIpwx49IY13yfs7pXu/3HKGJg6VvZrcZNYPhPkEM7x7piAr7hl+UOFL/M9MvWDrVlEiwQzPstZbKVA==
X-Received: by 10.80.203.12 with SMTP id g12mr21956321edi.239.1523280328849;
        Mon, 09 Apr 2018 06:25:28 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id b36sm329931edd.81.2018.04.09.06.25.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Apr 2018 06:25:28 -0700 (PDT)
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
To:     Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
From:   Quentin Monnet <quentin.monnet@netronome.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <16d4d67a-ab36-3e58-1082-52f0898546e5@netronome.com>
Date:   Mon, 9 Apr 2018 14:25:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-09 11:01 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> On 04/06/2018 01:11 PM, Quentin Monnet wrote:
>> eBPF helper functions can be called from within eBPF programs to perform
>> a variety of tasks that would be otherwise hard or impossible to do with
>> eBPF itself. There is a growing number of such helper functions in the
>> kernel, but documentation is scarce. The main user space header file
>> does contain a short commented description of most helpers, but it is
>> somewhat outdated and not complete. It is more a "cheat sheet" than a
>> real documentation accessible to new eBPF developers.
>>
>> This commit attempts to improve the situation by replacing the existing
>> overview for the helpers with a more developed description. Furthermore,
>> a Python script is added to generate a manual page for eBPF helpers. The
>> workflow is the following, and requires the rst2man utility:
>>
>>     $ ./scripts/bpf_helpers_doc.py \
>>             --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>>     $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>>     $ man /tmp/bpf-helpers.7
>>
>> The objective is to keep all documentation related to the helpers in a
>> single place, and to be able to generate from here a manual page that
>> could be packaged in the man-pages repository and shipped with most
>> distributions [1].
>>
>> Additionally, parsing the prototypes of the helper functions could
>> hopefully be reused, with a different Printer object, to generate
>> header files needed in some eBPF-related projects.
>>
>> Regarding the description of each helper, it comprises several items:
>>
>> - The function prototype.
>> - A description of the function and of its arguments (except for a
>>   couple of cases, when there are no arguments and the return value
>>   makes the function usage really obvious).
>> - A description of return values (if not void).
>> - A listing of eBPF program types (if relevant, map types) compatible
>>   with the helper.
>> - Information about the helper being restricted to GPL programs, or not.
>> - The kernel version in which the helper was introduced.
>> - The commit that introduced the helper (this is mostly to have it in
>>   the source of the man page, as it can be used to track changes and
>>   update the page).
>>
>> For several helpers, descriptions are inspired (at times, nearly copied)
>> from the commit logs introducing them in the kernel--Many thanks to
>> their respective authors! They were completed as much as possible, the
>> objective being to have something easily accessible even for people just
>> starting with eBPF. There is probably a bit more work to do in this
>> direction for some helpers.
>>
>> Some RST formatting is used in the descriptions (not in function
>> prototypes, to keep them readable, but the Python script provided in
>> order to generate the RST for the manual page does add formatting to
>> prototypes, to produce something pretty) to get "bold" and "italics" in
>> manual pages. Hopefully, the descriptions in bpf.h file remains
>> perfectly readable. Note that the few trailing white spaces are
>> intentional, removing them would break paragraphs for rst2man.
>>
>> The descriptions should ideally be updated each time someone adds a new
>> helper, or updates the behaviour (compatibility extended to new program
>> types, new socket option supported...) or the interface (new flags
>> available, ...) of existing ones.
>>
>> [1] I have not contacted people from the man-pages project prior to
>>     sending this RFC, so I can offer no guaranty at this time that they
>>     would accept to take the generated man page.
>>
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-man@vger.kernel.org
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> 
> Great work, thanks a lot for doing this!
> 
> [...]
>> + * int bpf_probe_read(void *dst, u32 size, const void *src)
>> + * 	Description
>> + * 		For tracing programs, safely attempt to read *size* bytes from
>> + * 		address *src* and store the data in *dst*.
>> + * 	Return
>> + * 		0 on success, or a negative error in case of failure.
>> + * 	For
>> + * 		*Tracing programs*.
>> + * 	GPL only
>> + * 		Yes
>> + * 	Since
>> + * 		Linux 4.1
>> + *
>> + * .. commit 2541517c32be
>>   *
>>   * u64 bpf_ktime_get_ns(void)
>> - *     Return: current ktime
>> - *
>> - * int bpf_trace_printk(const char *fmt, int fmt_size, ...)
>> - *     Return: length of buffer written or negative error
>> + * 	Description
>> + * 		Return the time elapsed since system boot, in nanoseconds.
>> + * 	Return
>> + * 		Current *ktime*.
>> + * 	For
>> + * 		All program types, except
>> + * 		**BPF_PROG_TYPE_CGROUP_DEVICE**.
> 
> I think we should probably always just list the actual program types instead,
> since when new types get added to the kernel not supporting bpf_ktime_get_ns()
> helper in this example, the above statement would be misleading (potentially
> more misleading than the other way around when it's not yet mentioned to be
> supported).

Agreed. I realise “All program types” is really awkward here.

>> + * 	GPL only
>> + * 		Yes
>> + * 	Since
>> + * 		Linux 4.1
>> + *
>> + * .. commit d9847d310ab4
>> + *

[...]

>> + * u32 bpf_get_smp_processor_id(void)
>> + * 	Return
>> + * 		The SMP (Symmetric multiprocessing) processor id.
>> + * 	For
>> + * 		*Networking programs*.
> 
> Ditto plus above is actually not correct. See tracing_func_proto():
> 
>         [...]
>         case BPF_FUNC_get_smp_processor_id:
>                 return &bpf_get_smp_processor_id_proto;
>         [...]

Thanks for the catch! I will fix on my side, even if we drop the "For"
section for now.

>> + * 	GPL only
>> + * 		No
>> + * 	Since
>> + * 		Linux 4.1
>> + *
>> + * .. commit c04167ce2ca0
>> + *
>> + * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
>> + * 	Description
>> + * 		Store *len* bytes from address *from* into the packet
>> + * 		associated to *skb*, at *offset*. *flags* are a combination of
>> + * 		**BPF_F_RECOMPUTE_CSUM** (automatically recompute the
>> + * 		checksum for the packet after storing the bytes) and
>> + * 		**BPF_F_INVALIDATE_HASH** (set *skb*\ **->hash**, *skb*\
>> + * 		**->swhash** and *skb*\ **->l4hash** to 0).
>> + *
>> + * 		A call to this helper is susceptible to change data from the
>> + * 		packet. Therefore, at load time, all checks on pointers
>> + * 		previously done by the verifier are invalidated and must be
>> + * 		performed again.
>> + * 	Return
> [...]
> 
> Agree with Alexei that 'Description' but also 'Return' is the most useful
> (the latter we can still improve a bit wrt errors). 'For' gets indeed quickly
> out of hand but I do think that for BPF program developers 'Since' has good
> value to quickly check when a helper could be available, but then again
> this is actually tied to an individual kconfig and/or program type, and could
> potentially require to add or (worst case) remove the info in a second commit
> e.g. after the merge window similar with the commit sha. Probably best indeed
> to stick to the signature, 'Description' and 'Return' initially.

I understand that the "For" section will be the hardest to maintain
up-to-date, however, I believe that--along with minimal kernel version
and GPL information--it would be useful for readers (Alexei, what is
your case against the "GPL only" section?). Daniel, your proposal for
the "Since" information in a second time sounds good! But I do not have
a solution right now for maintaining the "For" section on the long term.

Anyway, I am fine with keeping just signatures, descriptions and return
values for now. I will submit a new version with only those items.

> We should probably also have the bpf_helpers_doc.py workflow in a separate
> comment above this one such that developers don't have to look up the original
> commit message, but have the required steps to render the rst/man page available
> right where they need it.

Sure! I was considering adding some comments on top of the description,
but haven't done it for the RFC. I will do for the next version.

Thanks for the reviews!
Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
