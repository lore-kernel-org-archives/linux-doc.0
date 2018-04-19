Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42E477E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 10:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751565AbeDSK3L (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 06:29:11 -0400
Received: from www62.your-server.de ([213.133.104.62]:55504 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbeDSK3K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 06:29:10 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1f96oO-00042E-DT; Thu, 19 Apr 2018 12:29:08 +0200
Subject: Re: [PATCH bpf-next v3 3/8] bpf: add documentation for eBPF helpers
 (12-22)
To:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-4-quentin.monnet@netronome.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <f681be6f-4343-cbff-f95d-0c5d7528c78e@iogearbox.net>
Date:   Thu, 19 Apr 2018 12:29:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180417143438.7018-4-quentin.monnet@netronome.com>
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
> - bpf_get_current_pid_tgid()
> - bpf_get_current_uid_gid()
> - bpf_get_current_comm()
> - bpf_skb_vlan_push()
> - bpf_skb_vlan_pop()
> - bpf_skb_get_tunnel_key()
> - bpf_skb_set_tunnel_key()
> - bpf_redirect()
> - bpf_perf_event_output()
> - bpf_get_stackid()
> - bpf_get_current_task()
> 
> v3:
> - bpf_skb_get_tunnel_key(): Change and improve description and example.
> - bpf_redirect(): Improve description of BPF_F_INGRESS flag.
> - bpf_perf_event_output(): Fix first sentence of description. Delete
>   wrong statement on context being evaluated as a struct pt_reg. Remove
>   the long yet incomplete example.
> - bpf_get_stackid(): Add a note about PERF_MAX_STACK_DEPTH being
>   configurable.
> 
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
>  include/uapi/linux/bpf.h | 225 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index 02b7d522b3c0..c59bf5b28164 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -591,6 +591,231 @@ union bpf_attr {
>   * 		performed again.
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
> + *
> + * u64 bpf_get_current_pid_tgid(void)
> + * 	Return
> + * 		A 64-bit integer containing the current tgid and pid, and
> + * 		created as such:
> + * 		*current_task*\ **->tgid << 32 \|**
> + * 		*current_task*\ **->pid**.
> + *
> + * u64 bpf_get_current_uid_gid(void)
> + * 	Return
> + * 		A 64-bit integer containing the current GID and UID, and
> + * 		created as such: *current_gid* **<< 32 \|** *current_uid*.
> + *
> + * int bpf_get_current_comm(char *buf, u32 size_of_buf)
> + * 	Description
> + * 		Copy the **comm** attribute of the current task into *buf* of
> + * 		*size_of_buf*. The **comm** attribute contains the name of
> + * 		the executable (excluding the path) for the current task. The
> + * 		*size_of_buf* must be strictly positive. On success, the
> + * 		helper makes sure that the *buf* is NUL-terminated. On failure,
> + * 		it is filled with zeroes.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
> + * 	Description
> + * 		Push a *vlan_tci* (VLAN tag control information) of protocol
> + * 		*vlan_proto* to the packet associated to *skb*, then update
> + * 		the checksum. Note that if *vlan_proto* is different from
> + * 		**ETH_P_8021Q** and **ETH_P_8021AD**, it is considered to
> + * 		be **ETH_P_8021Q**.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_skb_vlan_pop(struct sk_buff *skb)
> + * 	Description
> + * 		Pop a VLAN header from the packet associated to *skb*.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_skb_get_tunnel_key(struct sk_buff *skb, struct bpf_tunnel_key *key, u32 size, u64 flags)
> + * 	Description
> + * 		Get tunnel metadata. This helper takes a pointer *key* to an
> + * 		empty **struct bpf_tunnel_key** of **size**, that will be
> + * 		filled with tunnel metadata for the packet associated to *skb*.
> + * 		The *flags* can be set to **BPF_F_TUNINFO_IPV6**, which
> + * 		indicates that the tunnel is based on IPv6 protocol instead of
> + * 		IPv4.
> + *
> + * 		The **struct bpf_tunnel_key** is an object that generalizes the
> + * 		principal parameters used by various tunneling protocols into a
> + * 		single struct. This way, it can be used to easily make a
> + * 		decision based on the contents of the encapsulation header,
> + * 		"summarized" in this struct. In particular, it holds the IP
> + * 		address of the remote end (IPv4 or IPv6, depending on the case)
> + * 		in *key*\ **->remote_ipv4** or *key*\ **->remote_ipv6**.

I would also mention the tunnel_id which is typically mapped to a vni, allowing
to make this id programmable together with bpf_skb_set_tunnel_key() helper.

> + * 		Let's imagine that the following code is part of a program
> + * 		attached to the TC ingress interface, on one end of a GRE
> + * 		tunnel, and is supposed to filter out all messages coming from
> + * 		remote ends with IPv4 address other than 10.0.0.1:
> + *
> + * 		::
> + *
> + * 			int ret;
> + * 			struct bpf_tunnel_key key = {};
> + * 			
> + * 			ret = bpf_skb_get_tunnel_key(skb, &key, sizeof(key), 0);
> + * 			if (ret < 0)
> + * 				return TC_ACT_SHOT;	// drop packet
> + * 			
> + * 			if (key.remote_ipv4 != 0x0a000001)
> + * 				return TC_ACT_SHOT;	// drop packet
> + * 			
> + * 			return TC_ACT_OK;		// accept packet

Lets also add a small sentence that this interface can be used with all
encap devs that can operate in 'collect metadata' mode, where instead of
having one netdevice per specific configuration, the 'collect metadata'
mode only requires a single device where the configuration can be extracted
from those BPF helpers. Could also mentioned this can be used together with
vxlan, geneve, gre and ipip tunnels.

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_skb_set_tunnel_key(struct sk_buff *skb, struct bpf_tunnel_key *key, u32 size, u64 flags)
> + * 	Description
> + * 		Populate tunnel metadata for packet associated to *skb.* The
> + * 		tunnel metadata is set to the contents of *key*, of *size*. The
> + * 		*flags* can be set to a combination of the following values:
> + *
> + * 		**BPF_F_TUNINFO_IPV6**
> + * 			Indicate that the tunnel is based on IPv6 protocol
> + * 			instead of IPv4.
> + * 		**BPF_F_ZERO_CSUM_TX**
> + * 			For IPv4 packets, add a flag to tunnel metadata
> + * 			indicating that checksum computation should be skipped
> + * 			and checksum set to zeroes.
> + * 		**BPF_F_DONT_FRAGMENT**
> + * 			Add a flag to tunnel metadata indicating that the
> + * 			packet should not be fragmented.
> + * 		**BPF_F_SEQ_NUMBER**
> + * 			Add a flag to tunnel metadata indicating that a
> + * 			sequence number should be added to tunnel header before
> + * 			sending the packet. This flag was added for GRE
> + * 			encapsulation, but might be used with other protocols
> + * 			as well in the future.
> + *
> + * 		Here is a typical usage on the transmit path:
> + *
> + * 		::
> + *
> + * 			struct bpf_tunnel_key key;
> + * 			     populate key ...
> + * 			bpf_skb_set_tunnel_key(skb, &key, sizeof(key), 0);
> + * 			bpf_clone_redirect(skb, vxlan_dev_ifindex, 0);

See above, maybe this can just reference bpf_skb_get_tunnel_key() from here.

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_redirect(u32 ifindex, u64 flags)
> + * 	Description
> + * 		Redirect the packet to another net device of index *ifindex*.
> + * 		This helper is somewhat similar to **bpf_clone_redirect**\
> + * 		(), except that the packet is not cloned, which provides
> + * 		increased performance.
> + *
> + * 		Save for XDP, both ingress and egress interfaces can be used

s/Save/Same/ ?

> + * 		for redirection. The **BPF_F_INGRESS** value in *flags* is used

(In XDP case, BPF_F_INGRESS cannot be used.)

> + * 		to make the distinction (ingress path is selected if the flag
> + * 		is present, egress path otherwise). Currently, XDP only
> + * 		supports redirection to the egress interface, and accepts no
> + * 		flag at all.
> + * 	Return
> + * 		For XDP, the helper returns **XDP_REDIRECT** on success or
> + * 		**XDP_ABORT** on error. For other program types, the values
> + * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
> + * 		error.
> + *
> + * int bpf_perf_event_output(struct pt_reg *ctx, struct bpf_map *map, u64 flags, void *data, u64 size)
> + * 	Description
> + * 		Write raw *data* blob into a special BPF perf event held by
> + * 		*map* of type **BPF_MAP_TYPE_PERF_EVENT_ARRAY**. This perf
> + * 		event must have the following attributes: **PERF_SAMPLE_RAW**
> + * 		as **sample_type**, **PERF_TYPE_SOFTWARE** as **type**, and
> + * 		**PERF_COUNT_SW_BPF_OUTPUT** as **config**.
> + *
> + * 		The *flags* are used to indicate the index in *map* for which
> + * 		the value must be put, masked with **BPF_F_INDEX_MASK**.
> + * 		Alternatively, *flags* can be set to **BPF_F_CURRENT_CPU**
> + * 		to indicate that the index of the current CPU core should be
> + * 		used.
> + *
> + * 		The value to write, of *size*, is passed through eBPF stack and
> + * 		pointed by *data*.
> + *
> + * 		The context of the program *ctx* needs also be passed to the
> + * 		helper.
> + *
> + * 		On user space, a program willing to read the values needs to
> + * 		call **perf_event_open**\ () on the perf event (either for
> + * 		one or for all CPUs) and to store the file descriptor into the
> + * 		*map*. This must be done before the eBPF program can send data
> + * 		into it. An example is available in file
> + * 		*samples/bpf/trace_output_user.c* in the Linux kernel source
> + * 		tree (the eBPF program counterpart is in
> + * 		*samples/bpf/trace_output_kern.c*).
> + *
> + * 		**bpf_perf_event_output**\ () achieves better performance
> + * 		than **bpf_trace_printk**\ () for sharing data with user
> + * 		space, and is much better suitable for streaming data from eBPF
> + * 		programs.

Would also mentioned that this helper can be used out of tc and XDP BPF
programs as well and allows for passing i) only custom structs, ii) only
packet payload, or iii) a combination of both to user space listeners.

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_get_stackid(struct pt_reg *ctx, struct bpf_map *map, u64 flags)
> + * 	Description
> + * 		Walk a user or a kernel stack and return its id. To achieve
> + * 		this, the helper needs *ctx*, which is a pointer to the context
> + * 		on which the tracing program is executed, and a pointer to a
> + * 		*map* of type **BPF_MAP_TYPE_STACK_TRACE**.
> + *
> + * 		The last argument, *flags*, holds the number of stack frames to
> + * 		skip (from 0 to 255), masked with
> + * 		**BPF_F_SKIP_FIELD_MASK**. The next bits can be used to set
> + * 		a combination of the following flags:
> + *
> + * 		**BPF_F_USER_STACK**
> + * 			Collect a user space stack instead of a kernel stack.
> + * 		**BPF_F_FAST_STACK_CMP**
> + * 			Compare stacks by hash only.
> + * 		**BPF_F_REUSE_STACKID**
> + * 			If two different stacks hash into the same *stackid*,
> + * 			discard the old one.
> + *
> + * 		The stack id retrieved is a 32 bit long integer handle which
> + * 		can be further combined with other data (including other stack
> + * 		ids) and used as a key into maps. This can be useful for
> + * 		generating a variety of graphs (such as flame graphs or off-cpu
> + * 		graphs).
> + *
> + * 		For walking a stack, this helper is an improvement over
> + * 		**bpf_probe_read**\ (), which can be used with unrolled loops
> + * 		but is not efficient and consumes a lot of eBPF instructions.
> + * 		Instead, **bpf_get_stackid**\ () can collect up to
> + * 		**PERF_MAX_STACK_DEPTH** both kernel and user frames. Note that
> + * 		this limit can be controlled with the **sysctl** program, and
> + * 		that it should be manually increased in order to profile long
> + * 		user stacks (such as stacks for Java programs). To do so, use:
> + *
> + * 		::
> + *
> + * 			# sysctl kernel.perf_event_max_stack=<new value>
> + *
> + * 	Return
> + * 		The positive or null stack id on success, or a negative error
> + * 		in case of failure.
> + *
> + * u64 bpf_get_current_task(void)
> + * 	Return
> + * 		A pointer to the current task struct.
>   */
>  #define __BPF_FUNC_MAPPER(FN)		\
>  	FN(unspec),			\
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
