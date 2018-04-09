Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6482E7E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 09:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751882AbeDIJBL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 05:01:11 -0400
Received: from www62.your-server.de ([213.133.104.62]:45382 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751630AbeDIJBK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 05:01:10 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1f5Sfk-0006UR-96; Mon, 09 Apr 2018 11:01:08 +0200
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
To:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
Date:   Mon, 9 Apr 2018 11:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180406111122.11038-1-quentin.monnet@netronome.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.99.3/24463/Mon Apr  9 06:21:19 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/06/2018 01:11 PM, Quentin Monnet wrote:
> eBPF helper functions can be called from within eBPF programs to perform
> a variety of tasks that would be otherwise hard or impossible to do with
> eBPF itself. There is a growing number of such helper functions in the
> kernel, but documentation is scarce. The main user space header file
> does contain a short commented description of most helpers, but it is
> somewhat outdated and not complete. It is more a "cheat sheet" than a
> real documentation accessible to new eBPF developers.
> 
> This commit attempts to improve the situation by replacing the existing
> overview for the helpers with a more developed description. Furthermore,
> a Python script is added to generate a manual page for eBPF helpers. The
> workflow is the following, and requires the rst2man utility:
> 
>     $ ./scripts/bpf_helpers_doc.py \
>             --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>     $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>     $ man /tmp/bpf-helpers.7
> 
> The objective is to keep all documentation related to the helpers in a
> single place, and to be able to generate from here a manual page that
> could be packaged in the man-pages repository and shipped with most
> distributions [1].
> 
> Additionally, parsing the prototypes of the helper functions could
> hopefully be reused, with a different Printer object, to generate
> header files needed in some eBPF-related projects.
> 
> Regarding the description of each helper, it comprises several items:
> 
> - The function prototype.
> - A description of the function and of its arguments (except for a
>   couple of cases, when there are no arguments and the return value
>   makes the function usage really obvious).
> - A description of return values (if not void).
> - A listing of eBPF program types (if relevant, map types) compatible
>   with the helper.
> - Information about the helper being restricted to GPL programs, or not.
> - The kernel version in which the helper was introduced.
> - The commit that introduced the helper (this is mostly to have it in
>   the source of the man page, as it can be used to track changes and
>   update the page).
> 
> For several helpers, descriptions are inspired (at times, nearly copied)
> from the commit logs introducing them in the kernel--Many thanks to
> their respective authors! They were completed as much as possible, the
> objective being to have something easily accessible even for people just
> starting with eBPF. There is probably a bit more work to do in this
> direction for some helpers.
> 
> Some RST formatting is used in the descriptions (not in function
> prototypes, to keep them readable, but the Python script provided in
> order to generate the RST for the manual page does add formatting to
> prototypes, to produce something pretty) to get "bold" and "italics" in
> manual pages. Hopefully, the descriptions in bpf.h file remains
> perfectly readable. Note that the few trailing white spaces are
> intentional, removing them would break paragraphs for rst2man.
> 
> The descriptions should ideally be updated each time someone adds a new
> helper, or updates the behaviour (compatibility extended to new program
> types, new socket option supported...) or the interface (new flags
> available, ...) of existing ones.
> 
> [1] I have not contacted people from the man-pages project prior to
>     sending this RFC, so I can offer no guaranty at this time that they
>     would accept to take the generated man page.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-man@vger.kernel.org
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Great work, thanks a lot for doing this!

[...]
> + * int bpf_probe_read(void *dst, u32 size, const void *src)
> + * 	Description
> + * 		For tracing programs, safely attempt to read *size* bytes from
> + * 		address *src* and store the data in *dst*.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + * 	For
> + * 		*Tracing programs*.
> + * 	GPL only
> + * 		Yes
> + * 	Since
> + * 		Linux 4.1
> + *
> + * .. commit 2541517c32be
>   *
>   * u64 bpf_ktime_get_ns(void)
> - *     Return: current ktime
> - *
> - * int bpf_trace_printk(const char *fmt, int fmt_size, ...)
> - *     Return: length of buffer written or negative error
> + * 	Description
> + * 		Return the time elapsed since system boot, in nanoseconds.
> + * 	Return
> + * 		Current *ktime*.
> + * 	For
> + * 		All program types, except
> + * 		**BPF_PROG_TYPE_CGROUP_DEVICE**.

I think we should probably always just list the actual program types instead,
since when new types get added to the kernel not supporting bpf_ktime_get_ns()
helper in this example, the above statement would be misleading (potentially
more misleading than the other way around when it's not yet mentioned to be
supported).

> + * 	GPL only
> + * 		Yes
> + * 	Since
> + * 		Linux 4.1
> + *
> + * .. commit d9847d310ab4
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
> + *
> + * 		The conversion specifiers supported by *fmt* are similar, but
> + * 		more limited than for printk(). They are **%d**, **%i**,
> + * 		**%u**, **%x**, **%ld**, **%li**, **%lu**, **%lx**, **%lld**,
> + * 		**%lli**, **%llu**, **%llx**, **%p**, **%s**. No modifier (size
> + * 		of field, padding with zeroes, etc.) is available, and the
> + * 		helper will silently fail if it encounters an unknown
> + * 		specifier.
> + *
> + * 		Also, note that **bpf_trace_printk**\ () is slow, and should
> + * 		only be used for debugging purposes. For passing values to user
> + * 		space, perf events should be preferred.
> + * 	Return
> + * 		The number of bytes written to the buffer, or a negative error
> + * 		in case of failure.
> + * 	For
> + * 		All types of programs.

Ditto, and various other places.

> + * 	GPL only
> + * 		Yes
> + * 	Since
> + * 		Linux 4.1
> + *
> + * .. commit 9c959c863f82
>   *
>   * u32 bpf_prandom_u32(void)
> - *     Return: random value
> - *
> - * u32 bpf_raw_smp_processor_id(void)
> - *     Return: SMP processor ID
> - *
[...]
> + * u32 bpf_get_smp_processor_id(void)
> + * 	Return
> + * 		The SMP (Symmetric multiprocessing) processor id.
> + * 	For
> + * 		*Networking programs*.

Ditto plus above is actually not correct. See tracing_func_proto():

        [...]
        case BPF_FUNC_get_smp_processor_id:
                return &bpf_get_smp_processor_id_proto;
        [...]

> + * 	GPL only
> + * 		No
> + * 	Since
> + * 		Linux 4.1
> + *
> + * .. commit c04167ce2ca0
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
[...]

Agree with Alexei that 'Description' but also 'Return' is the most useful
(the latter we can still improve a bit wrt errors). 'For' gets indeed quickly
out of hand but I do think that for BPF program developers 'Since' has good
value to quickly check when a helper could be available, but then again
this is actually tied to an individual kconfig and/or program type, and could
potentially require to add or (worst case) remove the info in a second commit
e.g. after the merge window similar with the commit sha. Probably best indeed
to stick to the signature, 'Description' and 'Return' initially.

We should probably also have the bpf_helpers_doc.py workflow in a separate
comment above this one such that developers don't have to look up the original
commit message, but have the required steps to render the rst/man page available
right where they need it.

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
