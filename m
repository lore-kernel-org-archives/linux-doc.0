Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2BD1D7E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 10:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751151AbeDSKCX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 06:02:23 -0400
Received: from www62.your-server.de ([213.133.104.62]:52769 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751042AbeDSKCV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 06:02:21 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1f96OR-0000y8-Bb; Thu, 19 Apr 2018 12:02:19 +0200
Subject: Re: [PATCH bpf-next v3 2/8] bpf: add documentation for eBPF helpers
 (01-11)
To:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-3-quentin.monnet@netronome.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <483eebbb-a5fb-968f-a1ef-7a25043e9123@iogearbox.net>
Date:   Thu, 19 Apr 2018 12:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180417143438.7018-3-quentin.monnet@netronome.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.99.3/24493/Thu Apr 19 06:26:34 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/17/2018 04:34 PM, Quentin Monnet wrote:
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
> v3:
> - bpf_map_lookup_elem(): Fix description of restrictions for flags
>   related to the existence of the entry.
> - bpf_trace_printk(): State that trace_pipe can be configured. Fix
>   return value in case an unknown format specifier is met. Add a note on
>   kernel log notice when the helper is used. Edit example.
> - bpf_tail_call(): Improve comment on stack inheritance.
> - bpf_clone_redirect(): Improve description of BPF_F_INGRESS flag.
> 
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Thanks for doing all this work, Quentin!

Just some small improvements while reading over it:

> ---
>  include/uapi/linux/bpf.h | 210 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 210 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index 45f77f01e672..02b7d522b3c0 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -381,6 +381,216 @@ union bpf_attr {
>   * intentional, removing them would break paragraphs for rst2man.
>   *
>   * Start of BPF helper function descriptions:
> + *
> + * void *bpf_map_lookup_elem(struct bpf_map *map, void *key)

const void *key

> + * 	Description
> + * 		Perform a lookup in *map* for an entry associated to *key*.
> + * 	Return
> + * 		Map value associated to *key*, or **NULL** if no entry was
> + * 		found.
> + *
> + * int bpf_map_update_elem(struct bpf_map *map, void *key, void *value, u64 flags)

const void *key, const void *value

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
> + * 		Flag value **BPF_NOEXIST** cannot be used for maps of types
> + * 		**BPF_MAP_TYPE_ARRAY** or **BPF_MAP_TYPE_PERCPU_ARRAY**  (all
> + * 		elements always exist), the helper would return an error.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_map_delete_elem(struct bpf_map *map, void *key)

const void *key

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
> + * 		limited to five).
> + *
> + * 		Each time the helper is called, it appends a line to the trace.
> + * 		The format of the trace is customizable, and the exact output
> + * 		one will get depends on the options set in
> + * 		*\/sys/kernel/debug/tracing/trace_options* (see also the
> + * 		*README* file under the same directory). However, it usually
> + * 		defaults to something like:
> + *
> + * 		::
> + *
> + * 			telnet-470   [001] .N.. 419421.045894: 0x00000001: <formatted msg>
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
> + * 			* ``<formatted msg>`` is the message formatted with
> + * 			  *fmt*.
> + *
> + * 		The conversion specifiers supported by *fmt* are similar, but
> + * 		more limited than for printk(). They are **%d**, **%i**,
> + * 		**%u**, **%x**, **%ld**, **%li**, **%lu**, **%lx**, **%lld**,
> + * 		**%lli**, **%llu**, **%llx**, **%p**, **%s**. No modifier (size
> + * 		of field, padding with zeroes, etc.) is available, and the
> + * 		helper will return **-EINVAL** (but print nothing) if it
> + * 		encounters an unknown specifier.
> + *
> + * 		Also, note that **bpf_trace_printk**\ () is slow, and should
> + * 		only be used for debugging purposes. For this reason, a notice
> + * 		bloc (spanning several lines) is printed to kernel logs and
> + * 		states that the helper should not be used "for production use"
> + * 		the first time this helper is used (or more precisely, when
> + * 		**trace_printk**\ () buffers are allocated). For passing values
> + * 		to user space, perf events should be preferred.
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

Perhaps: to change the underlying packet buffer (it's not the data itself but
a potential reallocation to e.g. unclone the skb which otherwise would lead to
a use-after-free if not forced to be invalidated from verifier).

> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.

I would add something like "if used in combination with direct packet access"
where it's the only place this comment is relevant.

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_l3_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 size)
> + * 	Description
> + * 		Recompute the IP checksum for the packet associated to *skb*.

Perhaps we could say something like 'L3 (e.g. IP)'. The helper itself has zero
knowledge of the underlying protocol used. It's solely replacing the csum and
updating skb->csum when necessary.

> + * 		Computation is incremental, so the helper must know the former
> + * 		value of the header field that was modified (*from*), the new
> + * 		value of this field (*to*), and the number of bytes (2 or 4)
> + * 		for this field, stored in *size*. Alternatively, it is possible
> + * 		to store the difference between the previous and the new values
> + * 		of the header field in *to*, by setting *from* and *size* to 0.

I would add that this works in combination with csum_diff() helper, allows for
more flexibility and to handle sizes larger than 2 or 4.

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

See prior comment, L4 (e.g. TCP, UDP or ICMP).

> + * 		*skb*. Computation is incremental, so the helper must know the
> + * 		former value of the header field that was modified (*from*),
> + * 		the new value of this field (*to*), and the number of bytes (2
> + * 		or 4) for this field, stored on the lowest four bits of
> + * 		*flags*. Alternatively, it is possible to store the difference
> + * 		between the previous and the new values of the header field in
> + * 		*to*, by setting *from* and the four lowest bits of *flags* to

Same reference for csum_diff().

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
> + * 		other words, to jump into another eBPF program. The same stack
> + * 		frame is used (but values on stack and in registers for the
> + * 		caller are not accessible to the callee). This mechanism allows
> + * 		for program chaining, either for raising the maximum number of
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

Nit: s/goes back/returns/

> + * 		fails, then the helper has no effect, and the caller continues
> + * 		to run its own instructions. A call can fail if the destination

Maybe: s/to run its own/to run its subsequent/

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
> + * 		net device of index *ifindex*. Both ingress and egress
> + * 		interfaces can be used for redirection. The **BPF_F_INGRESS**
> + * 		value in *flags* is used to make the distinction (ingress path
> + * 		is selected if the flag is present, egress path otherwise).
> + * 		This is the only flag supported for now.

Would probably make sense to describe the relation to bpf_redirect() helper
in one sentence, meaning, that bpf_clone_redirect() has the associated cost
duplicating the skb but the helper can be used out of the BPF prog whereas
this is not the case with bpf_redirect() which is therefore more efficient
but handled through an action code where the redirect happens after the BPF
prog returned.

> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
>   */
>  #define __BPF_FUNC_MAPPER(FN)		\
>  	FN(unspec),			\
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
