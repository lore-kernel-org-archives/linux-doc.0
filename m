Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD0C37DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 17:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751676AbeDJR4M (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 13:56:12 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:39777 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751546AbeDJR4L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 13:56:11 -0400
Received: by mail-pf0-f195.google.com with SMTP id c78so8913574pfj.6;
        Tue, 10 Apr 2018 10:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eMwgkJrCiSokOnKeGVhFfF2Xs+wUtWxDnzbmVBOz1Dc=;
        b=OTQHqu9/Xq+BasgT4eLDQ0HZMaVwMLipe82qOgPnXLXxlc12fg7Kjz56r3igaFOsG8
         vxB6VNiHqnimvRyeBa5OVbk/XdjQBKkkSAPEDqIk7mhndxzPp3rRQCJGlD5pDmbgXYCs
         61VEUpYMzC4OyI8hsYnSqVFQpjgcG8lzd0WQ7Da3TRxuhGt6Io151/Ic4tDsUhCJFP+U
         HeEVKTMMMjoP0pD6cKwfrwtoAuvZX1PR4uUHqvXS7BeqnBEV0SNWPD0tjWy78Bn2VSAD
         QsWYj/nBqviQrzkHzTtxcN+FEnt1B9wPKJ7qJshGLho7jSIDjiMJkcUnKYMqm65fQIDo
         KbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eMwgkJrCiSokOnKeGVhFfF2Xs+wUtWxDnzbmVBOz1Dc=;
        b=jg5T5sEw/dOuqzBq4btPOtcfw2eEvrd9VpxkjYV2trC2benAJ1lyHzpPoZ8nXg33qf
         nS4UmUf+toZwGzx4ip5VIegQhUa2G1cXUU4vSngvDk0TO9VigfsKVsfn5R9PNsudyPXa
         jqcX1uXV98U433KitwMaZWaZUMffniFVi3Qjv3EsFEb8SSmc1tuItGjyakwAkHV8nQlm
         uCMsXVj4hT1k5LrqF4P4rIXuv7nseuD1B9XDFBSimYeMG9cWPxceWMXOYiia0yAsveUO
         xZBw4SvjHwNJ2ggO3RtbYWBzB55PklMGj+1UcsTPo7mRc8wl+bt2DxfVASIqBBh7d8uH
         9uSw==
X-Gm-Message-State: ALQs6tC1kstBzWEV4LsapA8XMjBonmwhPic4q2vgX/ndfTpDwOi+m5FV
        BcUEUVZOd9jzuDpAeBVGDZk=
X-Google-Smtp-Source: AIpwx49MSletcks5v1buraIv/49V8RfyYOpcO9NZU/n9RdN/LSsM3riwnxMfpJAvXVALfIAm1I+LgQ==
X-Received: by 10.98.72.74 with SMTP id v71mr1137059pfa.241.1523382970108;
        Tue, 10 Apr 2018 10:56:10 -0700 (PDT)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:200::4:d349])
        by smtp.gmail.com with ESMTPSA id a1sm6407777pff.5.2018.04.10.10.56.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 10:56:08 -0700 (PDT)
Date:   Tue, 10 Apr 2018 10:56:07 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: [RFC bpf-next v2 2/8] bpf: add documentation for eBPF helpers
 (01-11)
Message-ID: <20180410175605.2wqhaqx34a4o3gdi@ast-mbp.dhcp.thefacebook.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-3-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410144157.4831-3-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 10, 2018 at 03:41:51PM +0100, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions, all
> written by Alexei:
> 
> - bpf_map_lookup_elem()
> - bpf_map_update_elem()
> - bpf_map_delete_elem()
> - bpf_probe_read()
> - bpf_ktime_get_ns()
> - bpf_trace_printk()
> - bpf_skb_store_bytes()
> - bpf_l3_csum_replace()
> - bpf_l4_csum_replace()
> - bpf_tail_call()
> - bpf_clone_redirect()
> 
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
>  include/uapi/linux/bpf.h | 199 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index 45f77f01e672..2bc653a3a20f 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -381,6 +381,205 @@ union bpf_attr {
>   * intentional, removing them would break paragraphs for rst2man.
>   *
>   * Start of BPF helper function descriptions:
> + *
> + * void *bpf_map_lookup_elem(struct bpf_map *map, void *key)
> + * 	Description
> + * 		Perform a lookup in *map* for an entry associated to *key*.
> + * 	Return
> + * 		Map value associated to *key*, or **NULL** if no entry was
> + * 		found.
> + *
> + * int bpf_map_update_elem(struct bpf_map *map, void *key, void *value, u64 flags)
> + * 	Description
> + * 		Add or update the value of the entry associated to *key* in
> + * 		*map* with *value*. *flags* is one of:
> + *
> + * 		**BPF_NOEXIST**
> + * 			The entry for *key* must not exist in the map.
> + * 		**BPF_EXIST**
> + * 			The entry for *key* must already exist in the map.
> + * 		**BPF_ANY**
> + * 			No condition on the existence of the entry for *key*.
> + *
> + * 		These flags are only useful for maps of type
> + * 		**BPF_MAP_TYPE_HASH**. For all other map types, **BPF_ANY**
> + * 		should be used.

I think that's not entirely accurate.
The flags work as expected for all other map types as well
and for lru map, sockmap, map in map the flags have practical use cases.

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_map_delete_elem(struct bpf_map *map, void *key)
> + * 	Description
> + * 		Delete entry with *key* from *map*.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_probe_read(void *dst, u32 size, const void *src)
> + * 	Description
> + * 		For tracing programs, safely attempt to read *size* bytes from
> + * 		address *src* and store the data in *dst*.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * u64 bpf_ktime_get_ns(void)
> + * 	Description
> + * 		Return the time elapsed since system boot, in nanoseconds.
> + * 	Return
> + * 		Current *ktime*.
> + *
> + * int bpf_trace_printk(const char *fmt, u32 fmt_size, ...)
> + * 	Description
> + * 		This helper is a "printk()-like" facility for debugging. It
> + * 		prints a message defined by format *fmt* (of size *fmt_size*)
> + * 		to file *\/sys/kernel/debug/tracing/trace* from DebugFS, if
> + * 		available. It can take up to three additional **u64**
> + * 		arguments (as an eBPF helpers, the total number of arguments is
> + * 		limited to five). Each time the helper is called, it appends a
> + * 		line that looks like the following:
> + *
> + * 		::
> + *
> + * 			telnet-470   [001] .N.. 419421.045894: 0x00000001: BPF command: 2
> + *
> + * 		In the above:
> + *
> + * 			* ``telnet`` is the name of the current task.
> + * 			* ``470`` is the PID of the current task.
> + * 			* ``001`` is the CPU number on which the task is
> + * 			  running.
> + * 			* In ``.N..``, each character refers to a set of
> + * 			  options (whether irqs are enabled, scheduling
> + * 			  options, whether hard/softirqs are running, level of
> + * 			  preempt_disabled respectively). **N** means that
> + * 			  **TIF_NEED_RESCHED** and **PREEMPT_NEED_RESCHED**
> + * 			  are set.
> + * 			* ``419421.045894`` is a timestamp.
> + * 			* ``0x00000001`` is a fake value used by BPF for the
> + * 			  instruction pointer register.
> + * 			* ``BPF command: 2`` is the message formatted with
> + * 			  *fmt*.

the above depends on how trace_pipe was configured. It's a default
configuration for many, but would be good to explain this a bit better.

> + *
> + * 		The conversion specifiers supported by *fmt* are similar, but
> + * 		more limited than for printk(). They are **%d**, **%i**,
> + * 		**%u**, **%x**, **%ld**, **%li**, **%lu**, **%lx**, **%lld**,
> + * 		**%lli**, **%llu**, **%llx**, **%p**, **%s**. No modifier (size
> + * 		of field, padding with zeroes, etc.) is available, and the
> + * 		helper will silently fail if it encounters an unknown
> + * 		specifier.

This is not true. bpf_trace_printk will return -EINVAL for unknown specifier.

> + *
> + * 		Also, note that **bpf_trace_printk**\ () is slow, and should
> + * 		only be used for debugging purposes. For passing values to user
> + * 		space, perf events should be preferred.

please mention the giant dmesg warning that people will definitely
notice when they try to use this helper.

> + * 	Return
> + * 		The number of bytes written to the buffer, or a negative error
> + * 		in case of failure.
> + *
> + * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
> + * 	Description
> + * 		Store *len* bytes from address *from* into the packet
> + * 		associated to *skb*, at *offset*. *flags* are a combination of
> + * 		**BPF_F_RECOMPUTE_CSUM** (automatically recompute the
> + * 		checksum for the packet after storing the bytes) and
> + * 		**BPF_F_INVALIDATE_HASH** (set *skb*\ **->hash**, *skb*\
> + * 		**->swhash** and *skb*\ **->l4hash** to 0).
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_l3_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 size)
> + * 	Description
> + * 		Recompute the IP checksum for the packet associated to *skb*.
> + * 		Computation is incremental, so the helper must know the former
> + * 		value of the header field that was modified (*from*), the new
> + * 		value of this field (*to*), and the number of bytes (2 or 4)
> + * 		for this field, stored in *size*. Alternatively, it is possible
> + * 		to store the difference between the previous and the new values
> + * 		of the header field in *to*, by setting *from* and *size* to 0.
> + * 		For both methods, *offset* indicates the location of the IP
> + * 		checksum within the packet.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_l4_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 flags)
> + * 	Description
> + * 		Recompute the TCP or UDP checksum for the packet associated to
> + * 		*skb*. Computation is incremental, so the helper must know the
> + * 		former value of the header field that was modified (*from*),
> + * 		the new value of this field (*to*), and the number of bytes (2
> + * 		or 4) for this field, stored on the lowest four bits of
> + * 		*flags*. Alternatively, it is possible to store the difference
> + * 		between the previous and the new values of the header field in
> + * 		*to*, by setting *from* and the four lowest bits of *flags* to
> + * 		0. For both methods, *offset* indicates the location of the IP
> + * 		checksum within the packet. In addition to the size of the
> + * 		field, *flags* can be added (bitwise OR) actual flags. With
> + * 		**BPF_F_MARK_MANGLED_0**, a null checksum is left untouched
> + * 		(unless **BPF_F_MARK_ENFORCE** is added as well), and for
> + * 		updates resulting in a null checksum the value is set to
> + * 		**CSUM_MANGLED_0** instead. Flag **BPF_F_PSEUDO_HDR**
> + * 		indicates the checksum is to be computed against a
> + * 		pseudo-header.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_tail_call(void *ctx, struct bpf_map *prog_array_map, u32 index)
> + * 	Description
> + * 		This special helper is used to trigger a "tail call", or in
> + * 		other words, to jump into another eBPF program. The contents of
> + * 		eBPF registers and stack are not modified, the new program
> + * 		"inherits" them from the caller. This mechanism allows for

"inherits" is a technically correct, but misleading statement,
since callee program cannot access caller's registers and stack.

> + * 		program chaining, either for raising the maximum number of
> + * 		available eBPF instructions, or to execute given programs in
> + * 		conditional blocks. For security reasons, there is an upper
> + * 		limit to the number of successive tail calls that can be
> + * 		performed.
> + *
> + * 		Upon call of this helper, the program attempts to jump into a
> + * 		program referenced at index *index* in *prog_array_map*, a
> + * 		special map of type **BPF_MAP_TYPE_PROG_ARRAY**, and passes
> + * 		*ctx*, a pointer to the context.
> + *
> + * 		If the call succeeds, the kernel immediately runs the first
> + * 		instruction of the new program. This is not a function call,
> + * 		and it never goes back to the previous program. If the call
> + * 		fails, then the helper has no effect, and the caller continues
> + * 		to run its own instructions. A call can fail if the destination
> + * 		program for the jump does not exist (i.e. *index* is superior
> + * 		to the number of entries in *prog_array_map*), or if the
> + * 		maximum number of tail calls has been reached for this chain of
> + * 		programs. This limit is defined in the kernel by the macro
> + * 		**MAX_TAIL_CALL_CNT** (not accessible to user space), which
> + * 		is currently set to 32.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_clone_redirect(struct sk_buff *skb, u32 ifindex, u64 flags)
> + * 	Description
> + * 		Clone and redirect the packet associated to *skb* to another
> + * 		net device of index *ifindex*. The only flag supported for now
> + * 		is **BPF_F_INGRESS**, which indicates the packet is to be
> + * 		redirected to the ingress interface instead of (by default)
> + * 		egress.

imo the above sentence is prone to misinterpretation.
Can you rephrase it to say that both redirect to ingress and redirect to egress
are supported and flag is used to indicate which path to take ?

> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
>   */
>  #define __BPF_FUNC_MAPPER(FN)		\
>  	FN(unspec),			\
> -- 
> 2.14.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
