Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 09F7B7E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 00:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753634AbeDMA2r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Apr 2018 20:28:47 -0400
Received: from mail-pl0-f41.google.com ([209.85.160.41]:41405 "EHLO
        mail-pl0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753628AbeDMA2p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Apr 2018 20:28:45 -0400
Received: by mail-pl0-f41.google.com with SMTP id bj1-v6so5018548plb.8;
        Thu, 12 Apr 2018 17:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cs1OdMkl8AJsOhDnoFXonLZiDj185SXdrWs8tXu0h28=;
        b=cQ24hHyIWpZWlfAACAR4chliXjhxWRxuEJPSTUaXJDOf6ApPMhLY9+7YBrKWSs4yDE
         yEMP9vy65b7Ezv/PzvOHe58a71ttz020ztSvQpd1D4gBNI21fgrO2mWN2atgedB3xs6K
         afQfazHXJWhrM14Puwr2r5KNMyOwN1b/jshqIRe5m7wNMYyMERqiC72593seOwGcZzbq
         fW8BCc4BwHQu8woinxIVMYI13XkYkew0ZcIaQ2Qfe5rJh1gGERT6PVJHQF+LsY2+5IpC
         uAMbPWefW9lUe0K0r91jLfWdaJaYkS7lFpeEDcTZ32/PYvtpkKqzCn21PYCdpNvzisnc
         DQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cs1OdMkl8AJsOhDnoFXonLZiDj185SXdrWs8tXu0h28=;
        b=lS/CfOar6GTzZyJYCCzV4rNqKpMmoLCae9VkV+nc8hhsxpayNHuCxn7CqFF3EVLwKk
         KTSh1ytHOjj8dgmmzAv76jaE5PwI6WEX/Y1mq+bO1ry7HVWv/Gp3xBLbqNlITJYysFGu
         dN1kwNtqMkIWlG1U7LhFI0iFSL8o764G2knHv6I9JHza3xJxLESo0LfsqowjdmJs5PE6
         yNhdEVjjjSn7onJzhMQ3IG4fWkdNbNWvei+VtdEZtP+kzqWEA2G+iT60SoSU9fc2G2GU
         EUIY5jV6FnoGHU0JTNPyTrrY+gKUR0KRHz32M92MyWoLnd/iN2IIh0+CWOwFxfu52ZKk
         BRRw==
X-Gm-Message-State: ALQs6tBKiAxsLsTALeDXP+i6hGhD/IE37Qzyu42LXXXWuZyav6jDfev5
        4HF2uqx5wb8JNnXHs6U1n+Q=
X-Google-Smtp-Source: AIpwx4+YTwIgaZYzAP+4Eo5QNOXy1y8fOzrhGHNatZoZe+z1svZD87eVjqXMaW+scwDLgRrAZzb6EQ==
X-Received: by 2002:a17:902:8d82:: with SMTP id v2-v6mr3107718plo.101.1523579324353;
        Thu, 12 Apr 2018 17:28:44 -0700 (PDT)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:200::6:6dac])
        by smtp.gmail.com with ESMTPSA id c62sm12427936pfk.179.2018.04.12.17.28.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Apr 2018 17:28:43 -0700 (PDT)
Date:   Thu, 12 Apr 2018 17:28:40 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: [RFC bpf-next v2 4/8] bpf: add documentation for eBPF helpers
 (23-32)
Message-ID: <20180413002838.atu7shp5cuubx32p@ast-mbp.dhcp.thefacebook.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-5-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410144157.4831-5-quentin.monnet@netronome.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 10, 2018 at 03:41:53PM +0100, Quentin Monnet wrote:
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
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
>  include/uapi/linux/bpf.h | 125 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index f3ea8824efbc..d147d9dd6a83 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -473,6 +473,14 @@ union bpf_attr {
>   * 		The number of bytes written to the buffer, or a negative error
>   * 		in case of failure.
>   *
> + * u32 bpf_prandom_u32(void)
> + * 	Return
> + * 		A random 32-bit unsigned value.

there is no such helper.
It's called bpf_get_prandom_u32().
I'd also add a note that it's using its own random state and cannot be
used to infer seed of other random functions in the kernel.

> + *
> + * u32 bpf_get_smp_processor_id(void)
> + * 	Return
> + * 		The SMP (Symmetric multiprocessing) processor id.

probably worth adding a note to explain that all bpf programs run
with preemption disabled, so processor id is stable for the run of the program.

> + *
>   * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
>   * 	Description
>   * 		Store *len* bytes from address *from* into the packet
> @@ -604,6 +612,13 @@ union bpf_attr {
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
>   *
> + * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
> + * 	Description
> + * 		Retrieve the classid for the current task, i.e. for the
> + * 		net_cls (network classifier) cgroup to which *skb* belongs.

please add that kernel should be configured with CONFIG_NET_CLS_CGROUP=y|m
and mention Documentation/cgroup-v1/net_cls.txt
Otherwise 'network classifier' is way too generic.
I'd also mention that placing a task into net_cls controller
disables all of cgroup-bpf.

> + * 	Return
> + * 		The classid, or 0 for the default unconfigured classid.
> + *
>   * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
>   * 	Description
>   * 		Push a *vlan_tci* (VLAN tag control information) of protocol
> @@ -703,6 +718,14 @@ union bpf_attr {
>   * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
>   * 		error.
>   *
> + * u32 bpf_get_route_realm(struct sk_buff *skb)
> + * 	Description
> + * 		Retrieve the realm or the route, that is to say the
> + * 		**tclassid** field of the destination for the *skb*.

Similarly this only works if CONFIG_IP_ROUTE_CLASSID is on.

> + * 	Return
> + * 		The realm of the route for the packet associated to *sdb*, or 0
> + * 		if none was found.
> + *
>   * int bpf_perf_event_output(struct pt_reg *ctx, struct bpf_map *map, u64 flags, void *data, u64 size)
>   * 	Description
>   * 		Write perf raw sample into a perf event held by *map* of type
> @@ -779,6 +802,21 @@ union bpf_attr {
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
> + * 		Since Linux 4.7, this helper is deprecated in favor of
> + * 		"direct packet access", enabling packet data to be manipulated
> + * 		with *skb*\ **->data** and *skb*\ **->data_end** pointing
> + * 		respectively to the first byte of packet data and to the byte
> + * 		after the last byte of packet data.

I wouldn't call it deprecated.
It's still useful when programmer wants to read large quantities of
data from the packet

> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
>   * int bpf_get_stackid(struct pt_reg *ctx, struct bpf_map *map, u64 flags)
>   * 	Description
>   * 		Walk a user or a kernel stack and return its id. To achieve
> @@ -814,6 +852,93 @@ union bpf_attr {
>   * 		The positive or null stack id on success, or a negative error
>   * 		in case of failure.
>   *
> + * s64 bpf_csum_diff(__be32 *from, u32 from_size, __be32 *to, u32 to_size, __wsum seed)
> + * 	Description
> + * 		Compute a checksum difference, from the raw buffer pointed by
> + * 		*from*, of length *from_size* (that must be a multiple of 4),
> + * 		towards the raw buffer pointed by *to*, of size *to_size*
> + * 		(same remark). An optional *seed* can be added to the value.
> + *
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
> -- 
> 2.14.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
