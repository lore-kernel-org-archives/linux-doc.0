Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DC2757E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 18:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752041AbeDJSQ0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 14:16:26 -0400
Received: from mail-pl0-f45.google.com ([209.85.160.45]:38563 "EHLO
        mail-pl0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751963AbeDJSQZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 14:16:25 -0400
Received: by mail-pl0-f45.google.com with SMTP id c7-v6so4782363plr.5;
        Tue, 10 Apr 2018 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KBAxCMbnVfKuAnrUigilN+3lns2CKUGjQE5BSedQ5a0=;
        b=fDxmKN+IqCR/lkvQQGqbSw28z4wMmxDm8qpxlU8U4oaAJPRUExiQapKEp7lMTnHhGa
         2WoOPwCIu7Wogpt5ye14DACIraRx7OXPohqTRrxI41+9KfNowUgirQ+/NNCGb+TWF6g/
         ESepclismc6lo96W7nd+p0BoU4dOIK5qUspcJe/GXBKLJBL90rGeCw6IMp5xRKwU01Fl
         lsCtCEQloBk0Utq5lnTJYrpytwnIx6oEDNVhe/UI6zgPsOktxpzMSWsMyOvlbtKvHJwk
         lnQC29AAuopAgQaL2NQbOOe3Ofi7bqfeorQpmKVGjUYlj/CqTdNl9dx+vF69TNXUPzVk
         YIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KBAxCMbnVfKuAnrUigilN+3lns2CKUGjQE5BSedQ5a0=;
        b=egRD2QbnixigMhzrYUizzLYNqadkRGI16SgXcKxCQeb+L0bxRJ2wAl0U9ixx/2vIzo
         LkHcv07if6Np0sUhrufToC2/LdNNm57o7OImBhO2ZGDgNDTA7Gqs5sO9nSYgqsEZrMbq
         FSrF1sKnaW5EI7IB1uRXWAz3ln+uxYiwTleFins0C+WBGSelWyzc9uUkMmMOmbxlwgl8
         z5XEogtrayU8hWdvmU1CFUxdtQRXTVFKJI8lyNQ1IYgIbWtqD1IEjFF7Kc3yrhpXHy3H
         8BVuHxMQ0WANreyE9ilbCr8A5oRWy4SEmWbFxX3kWadI6x3dpNVDTaP4a+zWxKtAHEmI
         Nxkw==
X-Gm-Message-State: ALQs6tBHF49rTPcJQr9rQ6+/2MTIHgPqY1NxFrlJAFcFp/iUXurKK8Dm
        YTt3yvtEv4njkG+luiw7APc=
X-Google-Smtp-Source: AIpwx489cHX5Wab2AdtflpxJsv/ru4uKjvXOu0kMPy5qGc90lV9c9ZN5FQjHZVJhyRrdJHqt59HLIw==
X-Received: by 2002:a17:902:274a:: with SMTP id j10-v6mr1512196plg.28.1523384183868;
        Tue, 10 Apr 2018 11:16:23 -0700 (PDT)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:200::4:d349])
        by smtp.gmail.com with ESMTPSA id x14sm6382086pgo.82.2018.04.10.11.16.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 11:16:22 -0700 (PDT)
Date:   Tue, 10 Apr 2018 11:16:21 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: [RFC bpf-next v2 1/8] bpf: add script and prepare bpf.h for new
 helpers documentation
Message-ID: <20180410181620.axzpwh2iawg2kgh3@ast-mbp.dhcp.thefacebook.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-2-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410144157.4831-2-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 10, 2018 at 03:41:50PM +0100, Quentin Monnet wrote:
> Remove previous "overview" of eBPF helpers from user bpf.h header.
> Replace it by a comment explaining how to process the new documentation
> (to come in following patches) with a Python script to produce RST, then
> man page documentation.
> 
> Also add the aforementioned Python script under scripts/. It is used to
> process include/uapi/linux/bpf.h and to extract helper descriptions, to
> turn it into a RST document that can further be processed with rst2man
> to produce a man page. The script takes one "--filename <path/to/file>"
> option. If the script is launched from scripts/ in the kernel root
> directory, it should be able to find the location of the header to
> parse, and "--filename <path/to/file>" is then optional. If it cannot
> find the file, then the option becomes mandatory. RST-formatted
> documentation is printed to standard output.
> 
> Typical workflow for producing the final man page would be:
> 
>     $ ./scripts/bpf_helpers_doc.py \
>             --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>     $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>     $ man /tmp/bpf-helpers.7
> 
> Note that the tool kernel-doc cannot be used to document eBPF helpers,
> whose signatures are not available directly in the header files
> (pre-processor directives are used to produce them at the beginning of
> the compilation process).
> 
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
>  include/uapi/linux/bpf.h   | 406 ++------------------------------------------
>  scripts/bpf_helpers_doc.py | 414 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 430 insertions(+), 390 deletions(-)
>  create mode 100755 scripts/bpf_helpers_doc.py
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index c5ec89732a8d..45f77f01e672 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -365,396 +365,22 @@ union bpf_attr {
>  	} raw_tracepoint;
>  } __attribute__((aligned(8)));
>  
> -/* BPF helper function descriptions:
> - *
> - * void *bpf_map_lookup_elem(&map, &key)
> - *     Return: Map value or NULL
> - *
> - * int bpf_map_update_elem(&map, &key, &value, flags)
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_map_delete_elem(&map, &key)
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_probe_read(void *dst, int size, void *src)
> - *     Return: 0 on success or negative error
> - *
> - * u64 bpf_ktime_get_ns(void)
> - *     Return: current ktime
> - *
> - * int bpf_trace_printk(const char *fmt, int fmt_size, ...)
> - *     Return: length of buffer written or negative error
> - *
> - * u32 bpf_prandom_u32(void)
> - *     Return: random value
> - *
> - * u32 bpf_raw_smp_processor_id(void)
> - *     Return: SMP processor ID
> - *
> - * int bpf_skb_store_bytes(skb, offset, from, len, flags)
> - *     store bytes into packet
> - *     @skb: pointer to skb
> - *     @offset: offset within packet from skb->mac_header
> - *     @from: pointer where to copy bytes from
> - *     @len: number of bytes to store into packet
> - *     @flags: bit 0 - if true, recompute skb->csum
> - *             other bits - reserved
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_l3_csum_replace(skb, offset, from, to, flags)
> - *     recompute IP checksum
> - *     @skb: pointer to skb
> - *     @offset: offset within packet where IP checksum is located
> - *     @from: old value of header field
> - *     @to: new value of header field
> - *     @flags: bits 0-3 - size of header field
> - *             other bits - reserved
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_l4_csum_replace(skb, offset, from, to, flags)
> - *     recompute TCP/UDP checksum
> - *     @skb: pointer to skb
> - *     @offset: offset within packet where TCP/UDP checksum is located
> - *     @from: old value of header field
> - *     @to: new value of header field
> - *     @flags: bits 0-3 - size of header field
> - *             bit 4 - is pseudo header
> - *             other bits - reserved
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_tail_call(ctx, prog_array_map, index)
> - *     jump into another BPF program
> - *     @ctx: context pointer passed to next program
> - *     @prog_array_map: pointer to map which type is BPF_MAP_TYPE_PROG_ARRAY
> - *     @index: 32-bit index inside array that selects specific program to run
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_clone_redirect(skb, ifindex, flags)
> - *     redirect to another netdev
> - *     @skb: pointer to skb
> - *     @ifindex: ifindex of the net device
> - *     @flags: bit 0 - if set, redirect to ingress instead of egress
> - *             other bits - reserved
> - *     Return: 0 on success or negative error
> - *
> - * u64 bpf_get_current_pid_tgid(void)
> - *     Return: current->tgid << 32 | current->pid
> - *
> - * u64 bpf_get_current_uid_gid(void)
> - *     Return: current_gid << 32 | current_uid
> - *
> - * int bpf_get_current_comm(char *buf, int size_of_buf)
> - *     stores current->comm into buf
> - *     Return: 0 on success or negative error
> - *
> - * u32 bpf_get_cgroup_classid(skb)
> - *     retrieve a proc's classid
> - *     @skb: pointer to skb
> - *     Return: classid if != 0
> - *
> - * int bpf_skb_vlan_push(skb, vlan_proto, vlan_tci)
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_skb_vlan_pop(skb)
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_skb_get_tunnel_key(skb, key, size, flags)
> - * int bpf_skb_set_tunnel_key(skb, key, size, flags)
> - *     retrieve or populate tunnel metadata
> - *     @skb: pointer to skb
> - *     @key: pointer to 'struct bpf_tunnel_key'
> - *     @size: size of 'struct bpf_tunnel_key'
> - *     @flags: room for future extensions
> - *     Return: 0 on success or negative error
> - *
> - * u64 bpf_perf_event_read(map, flags)
> - *     read perf event counter value
> - *     @map: pointer to perf_event_array map
> - *     @flags: index of event in the map or bitmask flags
> - *     Return: value of perf event counter read or error code
> - *
> - * int bpf_redirect(ifindex, flags)
> - *     redirect to another netdev
> - *     @ifindex: ifindex of the net device
> - *     @flags:
> - *	  cls_bpf:
> - *          bit 0 - if set, redirect to ingress instead of egress
> - *          other bits - reserved
> - *	  xdp_bpf:
> - *	    all bits - reserved
> - *     Return: cls_bpf: TC_ACT_REDIRECT on success or TC_ACT_SHOT on error
> - *	       xdp_bfp: XDP_REDIRECT on success or XDP_ABORT on error
> - * int bpf_redirect_map(map, key, flags)
> - *     redirect to endpoint in map
> - *     @map: pointer to dev map
> - *     @key: index in map to lookup
> - *     @flags: --
> - *     Return: XDP_REDIRECT on success or XDP_ABORT on error
> - *
> - * u32 bpf_get_route_realm(skb)
> - *     retrieve a dst's tclassid
> - *     @skb: pointer to skb
> - *     Return: realm if != 0
> - *
> - * int bpf_perf_event_output(ctx, map, flags, data, size)
> - *     output perf raw sample
> - *     @ctx: struct pt_regs*
> - *     @map: pointer to perf_event_array map
> - *     @flags: index of event in the map or bitmask flags
> - *     @data: data on stack to be output as raw data
> - *     @size: size of data
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_get_stackid(ctx, map, flags)
> - *     walk user or kernel stack and return id
> - *     @ctx: struct pt_regs*
> - *     @map: pointer to stack_trace map
> - *     @flags: bits 0-7 - numer of stack frames to skip
> - *             bit 8 - collect user stack instead of kernel
> - *             bit 9 - compare stacks by hash only
> - *             bit 10 - if two different stacks hash into the same stackid
> - *                      discard old
> - *             other bits - reserved
> - *     Return: >= 0 stackid on success or negative error
> - *
> - * s64 bpf_csum_diff(from, from_size, to, to_size, seed)
> - *     calculate csum diff
> - *     @from: raw from buffer
> - *     @from_size: length of from buffer
> - *     @to: raw to buffer
> - *     @to_size: length of to buffer
> - *     @seed: optional seed
> - *     Return: csum result or negative error code
> - *
> - * int bpf_skb_get_tunnel_opt(skb, opt, size)
> - *     retrieve tunnel options metadata
> - *     @skb: pointer to skb
> - *     @opt: pointer to raw tunnel option data
> - *     @size: size of @opt
> - *     Return: option size
> - *
> - * int bpf_skb_set_tunnel_opt(skb, opt, size)
> - *     populate tunnel options metadata
> - *     @skb: pointer to skb
> - *     @opt: pointer to raw tunnel option data
> - *     @size: size of @opt
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_skb_change_proto(skb, proto, flags)
> - *     Change protocol of the skb. Currently supported is v4 -> v6,
> - *     v6 -> v4 transitions. The helper will also resize the skb. eBPF
> - *     program is expected to fill the new headers via skb_store_bytes
> - *     and lX_csum_replace.
> - *     @skb: pointer to skb
> - *     @proto: new skb->protocol type
> - *     @flags: reserved
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_skb_change_type(skb, type)
> - *     Change packet type of skb.
> - *     @skb: pointer to skb
> - *     @type: new skb->pkt_type type
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_skb_under_cgroup(skb, map, index)
> - *     Check cgroup2 membership of skb
> - *     @skb: pointer to skb
> - *     @map: pointer to bpf_map in BPF_MAP_TYPE_CGROUP_ARRAY type
> - *     @index: index of the cgroup in the bpf_map
> - *     Return:
> - *       == 0 skb failed the cgroup2 descendant test
> - *       == 1 skb succeeded the cgroup2 descendant test
> - *        < 0 error
> - *
> - * u32 bpf_get_hash_recalc(skb)
> - *     Retrieve and possibly recalculate skb->hash.
> - *     @skb: pointer to skb
> - *     Return: hash
> - *
> - * u64 bpf_get_current_task(void)
> - *     Returns current task_struct
> - *     Return: current
> - *
> - * int bpf_probe_write_user(void *dst, void *src, int len)
> - *     safely attempt to write to a location
> - *     @dst: destination address in userspace
> - *     @src: source address on stack
> - *     @len: number of bytes to copy
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_current_task_under_cgroup(map, index)
> - *     Check cgroup2 membership of current task
> - *     @map: pointer to bpf_map in BPF_MAP_TYPE_CGROUP_ARRAY type
> - *     @index: index of the cgroup in the bpf_map
> - *     Return:
> - *       == 0 current failed the cgroup2 descendant test
> - *       == 1 current succeeded the cgroup2 descendant test
> - *        < 0 error
> - *
> - * int bpf_skb_change_tail(skb, len, flags)
> - *     The helper will resize the skb to the given new size, to be used f.e.
> - *     with control messages.
> - *     @skb: pointer to skb
> - *     @len: new skb length
> - *     @flags: reserved
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_skb_pull_data(skb, len)
> - *     The helper will pull in non-linear data in case the skb is non-linear
> - *     and not all of len are part of the linear section. Only needed for
> - *     read/write with direct packet access.
> - *     @skb: pointer to skb
> - *     @len: len to make read/writeable
> - *     Return: 0 on success or negative error
> - *
> - * s64 bpf_csum_update(skb, csum)
> - *     Adds csum into skb->csum in case of CHECKSUM_COMPLETE.
> - *     @skb: pointer to skb
> - *     @csum: csum to add
> - *     Return: csum on success or negative error
> - *
> - * void bpf_set_hash_invalid(skb)
> - *     Invalidate current skb->hash.
> - *     @skb: pointer to skb
> - *
> - * int bpf_get_numa_node_id()
> - *     Return: Id of current NUMA node.
> - *
> - * int bpf_skb_change_head()
> - *     Grows headroom of skb and adjusts MAC header offset accordingly.
> - *     Will extends/reallocae as required automatically.
> - *     May change skb data pointer and will thus invalidate any check
> - *     performed for direct packet access.
> - *     @skb: pointer to skb
> - *     @len: length of header to be pushed in front
> - *     @flags: Flags (unused for now)
> - *     Return: 0 on success or negative error
> - *
> - * int bpf_xdp_adjust_head(xdp_md, delta)
> - *     Adjust the xdp_md.data by delta
> - *     @xdp_md: pointer to xdp_md
> - *     @delta: An positive/negative integer to be added to xdp_md.data
> - *     Return: 0 on success or negative on error
> - *
> - * int bpf_probe_read_str(void *dst, int size, const void *unsafe_ptr)
> - *     Copy a NUL terminated string from unsafe address. In case the string
> - *     length is smaller than size, the target is not padded with further NUL
> - *     bytes. In case the string length is larger than size, just count-1
> - *     bytes are copied and the last byte is set to NUL.
> - *     @dst: destination address
> - *     @size: maximum number of bytes to copy, including the trailing NUL
> - *     @unsafe_ptr: unsafe address
> - *     Return:
> - *       > 0 length of the string including the trailing NUL on success
> - *       < 0 error
> - *
> - * u64 bpf_get_socket_cookie(skb)
> - *     Get the cookie for the socket stored inside sk_buff.
> - *     @skb: pointer to skb
> - *     Return: 8 Bytes non-decreasing number on success or 0 if the socket
> - *     field is missing inside sk_buff
> - *
> - * u32 bpf_get_socket_uid(skb)
> - *     Get the owner uid of the socket stored inside sk_buff.
> - *     @skb: pointer to skb
> - *     Return: uid of the socket owner on success or overflowuid if failed.
> - *
> - * u32 bpf_set_hash(skb, hash)
> - *     Set full skb->hash.
> - *     @skb: pointer to skb
> - *     @hash: hash to set
> - *
> - * int bpf_setsockopt(bpf_socket, level, optname, optval, optlen)
> - *     Calls setsockopt. Not all opts are available, only those with
> - *     integer optvals plus TCP_CONGESTION.
> - *     Supported levels: SOL_SOCKET and IPPROTO_TCP
> - *     @bpf_socket: pointer to bpf_socket
> - *     @level: SOL_SOCKET or IPPROTO_TCP
> - *     @optname: option name
> - *     @optval: pointer to option value
> - *     @optlen: length of optval in bytes
> - *     Return: 0 or negative error
> - *
> - * int bpf_getsockopt(bpf_socket, level, optname, optval, optlen)
> - *     Calls getsockopt. Not all opts are available.
> - *     Supported levels: IPPROTO_TCP
> - *     @bpf_socket: pointer to bpf_socket
> - *     @level: IPPROTO_TCP
> - *     @optname: option name
> - *     @optval: pointer to option value
> - *     @optlen: length of optval in bytes
> - *     Return: 0 or negative error
> - *
> - * int bpf_sock_ops_cb_flags_set(bpf_sock_ops, flags)
> - *     Set callback flags for sock_ops
> - *     @bpf_sock_ops: pointer to bpf_sock_ops_kern struct
> - *     @flags: flags value
> - *     Return: 0 for no error
> - *             -EINVAL if there is no full tcp socket
> - *             bits in flags that are not supported by current kernel
> - *
> - * int bpf_skb_adjust_room(skb, len_diff, mode, flags)
> - *     Grow or shrink room in sk_buff.
> - *     @skb: pointer to skb
> - *     @len_diff: (signed) amount of room to grow/shrink
> - *     @mode: operation mode (enum bpf_adj_room_mode)
> - *     @flags: reserved for future use
> - *     Return: 0 on success or negative error code
> - *
> - * int bpf_sk_redirect_map(map, key, flags)
> - *     Redirect skb to a sock in map using key as a lookup key for the
> - *     sock in map.
> - *     @map: pointer to sockmap
> - *     @key: key to lookup sock in map
> - *     @flags: reserved for future use
> - *     Return: SK_PASS
> - *
> - * int bpf_sock_map_update(skops, map, key, flags)
> - *	@skops: pointer to bpf_sock_ops
> - *	@map: pointer to sockmap to update
> - *	@key: key to insert/update sock in map
> - *	@flags: same flags as map update elem
> - *
> - * int bpf_xdp_adjust_meta(xdp_md, delta)
> - *     Adjust the xdp_md.data_meta by delta
> - *     @xdp_md: pointer to xdp_md
> - *     @delta: An positive/negative integer to be added to xdp_md.data_meta
> - *     Return: 0 on success or negative on error
> - *
> - * int bpf_perf_event_read_value(map, flags, buf, buf_size)
> - *     read perf event counter value and perf event enabled/running time
> - *     @map: pointer to perf_event_array map
> - *     @flags: index of event in the map or bitmask flags
> - *     @buf: buf to fill
> - *     @buf_size: size of the buf
> - *     Return: 0 on success or negative error code
> - *
> - * int bpf_perf_prog_read_value(ctx, buf, buf_size)
> - *     read perf prog attached perf event counter and enabled/running time
> - *     @ctx: pointer to ctx
> - *     @buf: buf to fill
> - *     @buf_size: size of the buf
> - *     Return : 0 on success or negative error code
> - *
> - * int bpf_override_return(pt_regs, rc)
> - *	@pt_regs: pointer to struct pt_regs
> - *	@rc: the return value to set
> - *
> - * int bpf_msg_redirect_map(map, key, flags)
> - *     Redirect msg to a sock in map using key as a lookup key for the
> - *     sock in map.
> - *     @map: pointer to sockmap
> - *     @key: key to lookup sock in map
> - *     @flags: reserved for future use
> - *     Return: SK_PASS
> - *
> - * int bpf_bind(ctx, addr, addr_len)
> - *     Bind socket to address. Only binding to IP is supported, no port can be
> - *     set in addr.
> - *     @ctx: pointer to context of type bpf_sock_addr
> - *     @addr: pointer to struct sockaddr to bind socket to
> - *     @addr_len: length of sockaddr structure
> - *     Return: 0 on success or negative error code
> +/* The description below is an attempt at providing documentation to eBPF
> + * developers about the multiple available eBPF helper functions. It can be
> + * parsed and used to produce a manual page. The workflow is the following,
> + * and requires the rst2man utility:
> + *
> + *     $ ./scripts/bpf_helpers_doc.py \
> + *             --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
> + *     $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
> + *     $ man /tmp/bpf-helpers.7
> + *
> + * Note that in order to produce this external documentation, some RST
> + * formatting is used in the descriptions to get "bold" and "italics" in
> + * manual pages. Also note that the few trailing white spaces are
> + * intentional, removing them would break paragraphs for rst2man.
> + *
> + * Start of BPF helper function descriptions:
>   */
>  #define __BPF_FUNC_MAPPER(FN)		\
>  	FN(unspec),			\
> diff --git a/scripts/bpf_helpers_doc.py b/scripts/bpf_helpers_doc.py
> new file mode 100755
> index 000000000000..3a15ba3f0a83
> --- /dev/null
> +++ b/scripts/bpf_helpers_doc.py
> @@ -0,0 +1,414 @@
> +#!/usr/bin/python3
> +#
> +# Copyright (C) 2018 Netronome Systems, Inc.
> +#
> +# This software is licensed under the GNU General License Version 2,
> +# June 1991 as shown in the file COPYING in the top-level directory of this
> +# source tree.

please use SPDX instead.

> +#
> +# THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS"
> +# WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
> +# BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> +# FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
> +# OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME
> +# THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
> +
> +# In case user attempts to run with Python 2.
> +from __future__ import print_function
> +
> +import argparse
> +import re
> +import sys, os
> +
> +class NoHelperFound(BaseException):
> +    pass
> +
> +class ParsingError(BaseException):
> +    def __init__(self, line='<line not provided>', reader=None):
> +        if reader:
> +            BaseException.__init__(self,
> +                                   'Error at file offset %d, parsing line: %s' %
> +                                   (reader.tell(), line))
> +        else:
> +            BaseException.__init__(self, 'Error parsing line: %s' % line)
> +
> +class Helper(object):
> +    """
> +    An object representing the description of an eBPF helper function.
> +    @proto: function prototype of the helper function
> +    @desc: textual description of the helper function
> +    @ret: description of the return value of the helper function
> +    """
> +    def __init__(self, proto='', desc='', ret=''):
> +        self.proto = proto
> +        self.desc = desc
> +        self.ret = ret
> +
> +    def proto_break_down(self):
> +        """
> +        Break down helper function protocol into smaller chunks: return type,
> +        name, distincts arguments.
> +        """
> +        arg_re = re.compile('^((const )?(struct )?(\w+|...))( (\**)(\w+))?$')
> +        res = {}
> +        proto_re = re.compile('^(.+) (\**)(\w+)\(((([^,]+)(, )?){1,5})\)$')
> +
> +        capture = proto_re.match(self.proto)
> +        res['ret_type'] = capture.group(1)
> +        res['ret_star'] = capture.group(2)
> +        res['name']     = capture.group(3)
> +        res['args'] = []
> +
> +        args    = capture.group(4).split(', ')
> +        for a in args:
> +            capture = arg_re.match(a)
> +            res['args'].append({
> +                'type' : capture.group(1),
> +                'star' : capture.group(6),
> +                'name' : capture.group(7)
> +            })
> +
> +        return res
> +
> +class HeaderParser(object):
> +    """
> +    An object used to parse a file in order to extract the documentation of a
> +    list of eBPF helper functions. All the helpers that can be retrieved are
> +    stored as Helper object, in the self.helpers() array.
> +    @filename: name of file to parse, usually include/uapi/linux/bpf.h in the
> +               kernel tree
> +    """
> +    def __init__(self, filename):
> +        self.reader = open(filename, 'r')
> +        self.line = ''
> +        self.helpers = []
> +
> +    def parse_helper(self):
> +        proto    = self.parse_proto()
> +        desc     = self.parse_desc()
> +        ret      = self.parse_ret()
> +        return Helper(proto=proto, desc=desc, ret=ret)
> +
> +    def parse_proto(self):
> +        # Argument can be of shape:
> +        #   - "void"
> +        #   - "type  name"
> +        #   - "type *name"
> +        #   - Same as above, with "const" and/or "struct" in front of type
> +        #   - "..." (undefined number of arguments, for bpf_trace_printk())
> +        # There is at least one term ("void"), and at most five arguments.
> +        p = re.compile('^ \* ((.+) \**\w+\((((const )?(struct )?(\w+|\.\.\.)( \**\w+)?)(, )?){1,5}\))$')
> +        capture = p.match(self.line)
> +        if not capture:
> +            raise NoHelperFound
> +        self.line = self.reader.readline()
> +        return capture.group(1)
> +
> +    def parse_desc(self):
> +        p = re.compile('^ \* \tDescription$')
> +        capture = p.match(self.line)
> +        if not capture:
> +            # Helper can have empty description and we might be parsing another
> +            # attribute: return but do not consume.
> +            return ''
> +        # Description can be several lines, some of them possibly empty, and it
> +        # stops when another subsection title is met.
> +        desc = ''
> +        while True:
> +            self.line = self.reader.readline()
> +            if self.line == ' *\n':
> +                desc += '\n'
> +            else:
> +                p = re.compile('^ \* \t\t(.*)')
> +                capture = p.match(self.line)
> +                if capture:
> +                    desc += capture.group(1) + '\n'
> +                else:
> +                    break
> +        return desc
> +
> +    def parse_ret(self):
> +        p = re.compile('^ \* \tReturn$')
> +        capture = p.match(self.line)
> +        if not capture:
> +            # Helper can have empty retval and we might be parsing another
> +            # attribute: return but do not consume.
> +            return ''
> +        # Return value description can be several lines, some of them possibly
> +        # empty, and it stops when another subsection title is met.
> +        ret = ''
> +        while True:
> +            self.line = self.reader.readline()
> +            if self.line == ' *\n':
> +                ret += '\n'
> +            else:
> +                p = re.compile('^ \* \t\t(.*)')
> +                capture = p.match(self.line)
> +                if capture:
> +                    ret += capture.group(1) + '\n'
> +                else:
> +                    break
> +        return ret
> +
> +    def run(self):
> +        # Advance to start of helper function descriptions.
> +        offset = self.reader.read().find('* Start of BPF helper function descriptions:')
> +        if offset == -1:
> +            raise Exception('Could not find start of eBPF helper descriptions list')
> +        self.reader.seek(offset)
> +        self.reader.readline()
> +        self.reader.readline()
> +        self.line = self.reader.readline()
> +
> +        while True:
> +            try:
> +                helper = self.parse_helper()
> +                self.helpers.append(helper)
> +            except NoHelperFound:
> +                break
> +
> +        self.reader.close()
> +        print('Parsed description of %d helper function(s)' % len(self.helpers),
> +              file=sys.stderr)
> +
> +###############################################################################
> +
> +class Printer(object):
> +    """
> +    A generic class for printers. Printers should be created with an array of
> +    Helper objects, and implement a way to print them in the desired fashion.
> +    @helpers: array of Helper objects to print to standard output
> +    """
> +    def __init__(self, helpers):
> +        self.helpers = helpers
> +
> +    def print_header(self):
> +        pass
> +
> +    def print_footer(self):
> +        pass
> +
> +    def print_one(self, helper):
> +        pass
> +
> +    def print_all(self):
> +        self.print_header()
> +        for helper in self.helpers:
> +            self.print_one(helper)
> +        self.print_footer()
> +
> +class PrinterRST(Printer):
> +    """
> +    A printer for dumping collected information about helpers as a ReStructured
> +    Text page compatible with the rst2man program, which can be used to
> +    generate a manual page for the helpers.
> +    @helpers: array of Helper objects to print to standard output
> +    """
> +    def print_header(self):
> +        header = '''\
> +.. Copyright (C) 2018 Netronome Systems, Inc.

I think would be good to capture copyrights of all authors that added
the helpers being documented. Since a lot of text was copied from commit
logs it's only fair to preserve the copyrights.
Such man page file is automatically generated by the python script
and script itself is copyrighted by Netronome. That's fine, but the text
of man page is not netronome only.
I'm not sure what would be the solution. May be something like:
"
Copyright (C) All BPF authors and contributors from 2011 to present
See git log include/uapi/linux/bpf.h for details
"
?

> +.. 
> +.. %%%LICENSE_START(VERBATIM)
> +.. Permission is granted to make and distribute verbatim copies of this
> +.. manual provided the copyright notice and this permission notice are
> +.. preserved on all copies.
> +.. 
> +.. Permission is granted to copy and distribute modified versions of this
> +.. manual under the conditions for verbatim copying, provided that the
> +.. entire resulting derived work is distributed under the terms of a
> +.. permission notice identical to this one.
> +.. 
> +.. Since the Linux kernel and libraries are constantly changing, this
> +.. manual page may be incorrect or out-of-date.  The author(s) assume no
> +.. responsibility for errors or omissions, or for damages resulting from
> +.. the use of the information contained herein.  The author(s) may not
> +.. have taken the same level of care in the production of this manual,
> +.. which is licensed free of charge, as they might when working
> +.. professionally.
> +.. 
> +.. Formatted or processed versions of this manual, if unaccompanied by
> +.. the source, must acknowledge the copyright and authors of this work.
> +.. %%%LICENSE_END
> +.. 
> +.. Please do not edit this file. It was generated from the documentation
> +.. located in file include/uapi/linux/bpf.h of the Linux kernel sources
> +.. (helpers description), and from scripts/bpf_helpers_doc.py in the same
> +.. repository (header and footer).
> +
> +===========
> +BPF-HELPERS
> +===========
> +-------------------------------------------------------------------------------
> +list of eBPF helper functions
> +-------------------------------------------------------------------------------
> +
> +:Manual section: 7
> +
> +DESCRIPTION
> +===========
> +
> +The extended Berkeley Packet Filter (eBPF) subsystem consists in programs
> +written in a pseudo-assembly language, then attached to one of the several
> +kernel hooks and run in reaction of specific events. This framework differs
> +from the older, "classic" BPF (or "cBPF") in several aspects, one of them being
> +the ability to call special functions (or "helpers") from within a program. For
> +security reasons, these functions are restricted to a white-list of helpers
> +defined in the kernel.

'for security reasons' sounds a bit odd. May be 'for safety reasons' ?
Or drop that part.

> +
> +These helpers are used by eBPF programs to interact with the system, or with
> +the context in which they work. For instance, they can be used to print
> +debugging messages, to get the time since the system was booted, to interact
> +with eBPF maps, or to manipulate network packets metadata. Since there are

s/packets metadata/packets/

> +several eBPF program types, and that they do not run in the same context, each
> +program type can only call a subset of those helpers.
> +
> +Due to eBPF conventions, a helper can not have more than five arguments.
> +
> +This document is an attempt to list and document the helpers available to eBPF
> +developers. They are sorted by chronological order (the oldest helpers in the
> +kernel at the top).
> +
> +HELPERS
> +=======
> +'''
> +        print(header)
> +
> +    def print_footer(self):
> +        footer = '''
> +NOTES
> +=====
> +
> +On the performance side, eBPF programs move to the stack all arguments to pass
> +to the helpers, and call directly into the compiled helper functions without

"move to the stack all arguments" ?! I'm not sure what you're trying to say.
The arguments stay in registers for the call.

> +requiring any foreign-function interface. As a result, calling helpers
> +introduce very little overhead.

not true. it's zero overhead. Literally. Very little is not the same as zero.

> +
> +EXAMPLES
> +========
> +
> +Example usage for most of the eBPF helpers listed in this manual page are
> +available within the Linux kernel sources, at the following locations:
> +
> +* *samples/bpf/*
> +* *tools/testing/selftests/bpf/*
> +
> +IMPLEMENTATION
> +==============
> +
> +This manual page is an effort to document the existing eBPF helper functions.
> +But as of this writing, the BPF sub-system is under heavy development. New eBPF
> +program or map types are added, along with new helper functions. Some helpers
> +are occasionally made available for additional program types. So in spite of
> +the efforts of the community, this page might not be up-to-date. If you want to
> +check by yourself what helper functions exist in your kernel, or what types of
> +programs they can support, here are some files among the kernel tree that you
> +may be interested in:
> +
> +* *include/uapi/linux/bpf.h* contains the full list of all helper functions.
> +* *net/core/filter.c* contains the definition of most network-related helper
> +  functions, and the list of program types from which they can be used.
> +* *kernel/trace/bpf_trace.c* is the equivalent for most tracing program-related
> +  helpers.
> +* *kernel/bpf/verifier.c* contains the functions used to check that valid types
> +  of eBPF maps are used with a given helper function.
> +* *kernel/bpf/* directory contains other files in which additional helpers are
> +  defined (for cgroups, sockmaps, etc.).
> +
> +Compatibility between helper functions and program types can generally be found
> +in the files where helper functions are defined. Look for the **struct
> +bpf_func_proto** objects and for functions returning them: these functions
> +contain a list of helpers that a given program type can call. Note that the
> +**default:** label of the **switch ... case** used to filter helpers can call
> +other functions, themselves allowing access to additional helpers. The
> +requirement for GPL license is also in those **struct bpf_func_proto**.

I think here would be good to add that most networking helpers are non-GPL
because they operate on packets which are abstract bytes on the wire,
whereas most tracing helpers are GPL, since they inspect the guts of
the linux kernel which is GPL itself.
That's the main reason why adding extra 'gpl=yes/no' for each helper
description is redundant.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
