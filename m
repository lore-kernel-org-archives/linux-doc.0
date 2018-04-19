Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0265C7DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 11:16:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752510AbeDSLQs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 07:16:48 -0400
Received: from www62.your-server.de ([213.133.104.62]:33368 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751047AbeDSLQr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 07:16:47 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1f97YS-0007MN-PM; Thu, 19 Apr 2018 13:16:44 +0200
Subject: Re: [PATCH bpf-next v3 4/8] bpf: add documentation for eBPF helpers
 (23-32)
To:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-5-quentin.monnet@netronome.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <6f1b43c7-5d79-7419-1053-d0b29c1e2bb9@iogearbox.net>
Date:   Thu, 19 Apr 2018 13:16:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180417143438.7018-5-quentin.monnet@netronome.com>
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
> written by Daniel:
> 
> - bpf_get_prandom_u32()
> - bpf_get_smp_processor_id()
> - bpf_get_cgroup_classid()
> - bpf_get_route_realm()
> - bpf_skb_load_bytes()
> - bpf_csum_diff()
> - bpf_skb_get_tunnel_opt()
> - bpf_skb_set_tunnel_opt()
> - bpf_skb_change_proto()
> - bpf_skb_change_type()
> 
> v3:
> - bpf_get_prandom_u32(): Fix helper name :(. Add description, including
>   a note on the internal random state.
> - bpf_get_smp_processor_id(): Add description, including a note on the
>   processor id remaining stable during program run.
> - bpf_get_cgroup_classid(): State that CONFIG_CGROUP_NET_CLASSID is
>   required to use the helper. Add a reference to related documentation.
>   State that placing a task in net_cls controller disables cgroup-bpf.
> - bpf_get_route_realm(): State that CONFIG_CGROUP_NET_CLASSID is
>   required to use this helper.
> - bpf_skb_load_bytes(): Fix comment on current use cases for the helper.
> 
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
>  include/uapi/linux/bpf.h | 152 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index c59bf5b28164..d748f65a8f58 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -483,6 +483,23 @@ union bpf_attr {
>   * 		The number of bytes written to the buffer, or a negative error
>   * 		in case of failure.
>   *
> + * u32 bpf_get_prandom_u32(void)
> + * 	Description
> + * 		Get a pseudo-random number. Note that this helper uses its own
> + * 		pseudo-random internal state, and cannot be used to infer the
> + * 		seed of other random functions in the kernel.

We should still add that this prng is not cryptographically secure.

> + * 	Return
> + * 		A random 32-bit unsigned value.
> + *
> + * u32 bpf_get_smp_processor_id(void)
> + * 	Description
> + * 		Get the SMP (Symmetric multiprocessing) processor id. Note that

Nit: s/Symmetric/symmetric/ ?

> + * 		all programs run with preemption disabled, which means that the
> + * 		SMP processor id is stable during all the execution of the
> + * 		program.
> + * 	Return
> + * 		The SMP id of the processor running the program.
> + *
>   * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
>   * 	Description
>   * 		Store *len* bytes from address *from* into the packet
> @@ -615,6 +632,27 @@ union bpf_attr {
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
>   *
> + * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
> + * 	Description
> + * 		Retrieve the classid for the current task, i.e. for the
> + * 		net_cls (network classifier) cgroup to which *skb* belongs.
> + *
> + * 		This helper is only available is the kernel was compiled with
> + * 		the **CONFIG_CGROUP_NET_CLASSID** configuration option set to
> + * 		"**y**" or to "**m**".
> + *
> + * 		Note that placing a task into the net_cls controller completely
> + * 		disables the execution of eBPF programs with the cgroup.

I'm not sure I follow the above sentence, what do you mean by that?

I would definitely also add here that this helper is limited to cgroups v1
only, and that it works on clsact TC egress hook but not the ingress one.

> + * 		Also note that, in the above description, the "network
> + * 		classifier" cgroup does not designate a generic classifier, but
> + * 		a particular mechanism that provides an interface to tag
> + * 		network packets with a specific class identifier. See also the

The "generic classifier" part is a bit strange to parse. I would probably
leave the first part out and explain that this provides a means to tag
packets based on a user-provided ID for all traffic coming from the tasks
belonging to the related cgroup.

> + * 		related kernel documentation, available from the Linux sources
> + * 		in file *Documentation/cgroup-v1/net_cls.txt*.
> + * 	Return
> + * 		The classid, or 0 for the default unconfigured classid.
> + *
>   * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
>   * 	Description
>   * 		Push a *vlan_tci* (VLAN tag control information) of protocol
> @@ -734,6 +772,16 @@ union bpf_attr {
>   * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
>   * 		error.
>   *
> + * u32 bpf_get_route_realm(struct sk_buff *skb)
> + * 	Description
> + * 		Retrieve the realm or the route, that is to say the
> + * 		**tclassid** field of the destination for the *skb*. This
> + * 		helper is available only if the kernel was compiled with
> + * 		**CONFIG_IP_ROUTE_CLASSID** configuration option.

Could mention that this is a similar user provided tag like in the net_cls
case with cgroups only that this applies to routes here (dst entries) which
hold this tag.

Also, should say that this works with clsact TC egress hook or alternatively
conventional classful egress qdiscs, but not on TC ingress. In case of clsact
TC egress hook this has the advantage that the dst entry has not been dropped
yet in the xmit path. Therefore, the dst entry does not need to be artificially
held via netif_keep_dst() for a classful qdisc until the skb is freed.

> + * 	Return
> + * 		The realm of the route for the packet associated to *sdb*, or 0

Typo: sdb

> + * 		if none was found.
> + *
>   * int bpf_perf_event_output(struct pt_reg *ctx, struct bpf_map *map, u64 flags, void *data, u64 size)
>   * 	Description
>   * 		Write raw *data* blob into a special BPF perf event held by
> @@ -770,6 +818,23 @@ union bpf_attr {
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
>   *
> + * int bpf_skb_load_bytes(const struct sk_buff *skb, u32 offset, void *to, u32 len)
> + * 	Description
> + * 		This helper was provided as an easy way to load data from a
> + * 		packet. It can be used to load *len* bytes from *offset* from
> + * 		the packet associated to *skb*, into the buffer pointed by
> + * 		*to*.
> + *
> + * 		Since Linux 4.7, usage of this helper has mostly been replaced
> + * 		by "direct packet access", enabling packet data to be
> + * 		manipulated with *skb*\ **->data** and *skb*\ **->data_end**
> + * 		pointing respectively to the first byte of packet data and to
> + * 		the byte after the last byte of packet data. However, it
> + * 		remains useful if one wishes to read large quantities of data
> + * 		at once from a packet.

I would add: s/at once from a packet/at once from a packet into the BPF stack/

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
>   * int bpf_get_stackid(struct pt_reg *ctx, struct bpf_map *map, u64 flags)
>   * 	Description
>   * 		Walk a user or a kernel stack and return its id. To achieve
> @@ -813,6 +878,93 @@ union bpf_attr {
>   * 		The positive or null stack id on success, or a negative error
>   * 		in case of failure.
>   *
> + * s64 bpf_csum_diff(__be32 *from, u32 from_size, __be32 *to, u32 to_size, __wsum seed)
> + * 	Description
> + * 		Compute a checksum difference, from the raw buffer pointed by
> + * 		*from*, of length *from_size* (that must be a multiple of 4),
> + * 		towards the raw buffer pointed by *to*, of size *to_size*
> + * 		(same remark). An optional *seed* can be added to the value.

Wrt seed, we should explicitly mention that this can be cascaded but also that
this helper works in combination with the l3/l4 csum ones where you feed in this
diff coming from bpf_csum_diff().

> + * 		This is flexible enough to be used in several ways:
> + *
> + * 		* With *from_size* == 0, *to_size* > 0 and *seed* set to
> + * 		  checksum, it can be used when pushing new data.
> + * 		* With *from_size* > 0, *to_size* == 0 and *seed* set to
> + * 		  checksum, it can be used when removing data from a packet.
> + * 		* With *from_size* > 0, *to_size* > 0 and *seed* set to 0, it
> + * 		  can be used to compute a diff. Note that *from_size* and
> + * 		  *to_size* do not need to be equal.
> + * 	Return
> + * 		The checksum result, or a negative error code in case of
> + * 		failure.
> + *
> + * int bpf_skb_get_tunnel_opt(struct sk_buff *skb, u8 *opt, u32 size)
> + * 	Description
> + * 		Retrieve tunnel options metadata for the packet associated to
> + * 		*skb*, and store the raw tunnel option data to the buffer *opt*
> + * 		of *size*.
> + * 	Return
> + * 		The size of the option data retrieved.
> + *
> + * int bpf_skb_set_tunnel_opt(struct sk_buff *skb, u8 *opt, u32 size)
> + * 	Description
> + * 		Set tunnel options metadata for the packet associated to *skb*
> + * 		to the option data contained in the raw buffer *opt* of *size*.

Also here the same remark with collect meta data I made earlier, and as a
particular example where this can be used in combination with geneve where
this allows for pushing and retrieving (bpf_skb_get_tunnel_opt() case)
arbitrary TLVs from the BPF program that allows for full customization.

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_skb_change_proto(struct sk_buff *skb, __be16 proto, u64 flags)
> + * 	Description
> + * 		Change the protocol of the *skb* to *proto*. Currently
> + * 		supported are transition from IPv4 to IPv6, and from IPv6 to
> + * 		IPv4. The helper takes care of the groundwork for the
> + * 		transition, including resizing the socket buffer. The eBPF
> + * 		program is expected to fill the new headers, if any, via
> + * 		**skb_store_bytes**\ () and to recompute the checksums with
> + * 		**bpf_l3_csum_replace**\ () and **bpf_l4_csum_replace**\
> + * 		().

Could mention the main use case for NAT64 out of an BPF program.

> + *
> + * 		Internally, the GSO type is marked as dodgy so that headers are
> + * 		checked and segments are recalculated by the GSO/GRO engine.
> + * 		The size for GSO target is adapted as well.
> + *
> + * 		All values for *flags* are reserved for future usage, and must
> + * 		be left at zero.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
> + * int bpf_skb_change_type(struct sk_buff *skb, u32 type)
> + * 	Description
> + * 		Change the packet type for the packet associated to *skb*. This
> + * 		comes down to setting *skb*\ **->pkt_type** to *type*, except
> + * 		the eBPF program does not have a write access to *skb*\
> + * 		**->pkt_type** beside this helper. Using a helper here allows
> + * 		for graceful handling of errors.
> + *
> + * 		The major use case is to change incoming *skb*s to
> + * 		**PACKET_HOST** in a programmatic way instead of having to
> + * 		recirculate via **redirect**\ (..., **BPF_F_INGRESS**), for
> + * 		example.
> + *
> + * 		Note that *type* only allows certain values. At this time, they
> + * 		are:
> + *
> + * 		**PACKET_HOST**
> + * 			Packet is for us.
> + * 		**PACKET_BROADCAST**
> + * 			Send packet to all.
> + * 		**PACKET_MULTICAST**
> + * 			Send packet to group.
> + * 		**PACKET_OTHERHOST**
> + * 			Send packet to someone else.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
>   * u64 bpf_get_current_task(void)
>   * 	Return
>   * 		A pointer to the current task struct.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
