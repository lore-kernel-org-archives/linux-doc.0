Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C3547DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 17:18:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755891AbeDYRRy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 13:17:54 -0400
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37104 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755793AbeDYRRj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 13:17:39 -0400
Received: by mail-wm0-f46.google.com with SMTP id l16so8177409wmh.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HgvQL2XBffPFwZHFaTTxwMyf5CGnInE7vDNRu6AN2SI=;
        b=kFe3o7kWBTfKrhg7VfC3b/CUXIFrimm7Gxlx12hrlKeFun6F9SqYAGUVyeNLzje6O0
         IWgccjpJ96iyIEo05/iSopyK5aFNiBABX985PHrDo2QP+NFXiCGcjQVoxKzzi0M4X64R
         BKBrH18csPLDrf+S9KExqNrdUlHAehvQWhimqOLZb+sG8k76KT+TcsiWo/Ie0GPXO01j
         eO+DAaa+5t5wMu6a2DFGmAphKIfahkb9Rrwg79Q14KSANaLytYePIq3t/E9l7PmrM+nQ
         eGCfAe1gCfKXr7m5B3dLE/62SWT64GFA6kQxXE0vhudfD+i3lsuFaa+NFOQcP+UPp+eH
         Cs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HgvQL2XBffPFwZHFaTTxwMyf5CGnInE7vDNRu6AN2SI=;
        b=rr+p9aAUD10ZiAmoX69gsGIi6qG7SteL1udOQYLYfDKzvD1/qbUyxCkq2QRzPp9C7f
         JPAWJMmoDJ2QReazksjafobznTvnkLTyn+6NquMgp4qZ7h15lIpmYva0NgwbwlgWlfnA
         7fV/wIOKA0UHls/XQzFVSDMXoTVaXLND5x24rLwNk15scZ8JVKuArTO3uCi2fOogN1aN
         7JLWsT40Fb9/pPTXFT32en1/eyp4tsVXuh83R4nTEuxIk68zGo4dx51jcs+TO2gRQloh
         BT9Go37OQmVirmU/9BAptdH/sdWH1n3wLE1waRoJtLOfFG1WJf2+DAgSGFyuWX7e3k4P
         aTGg==
X-Gm-Message-State: ALQs6tDNw624A1SDGXXog7AMoHyNgjUfk+guCZrLAT6iw5YoxCcuJVca
        nLIAZfka2f4PaGWJpXi4MHxFQQ==
X-Google-Smtp-Source: AIpwx4+2VZ9UOWyaq1wTq8VJNQ/2pN3VYxFqV7oOkAYWTGTfuvzcoJ19tLzwDXoHDTOi5+bZX5ZjjA==
X-Received: by 10.80.232.1 with SMTP id e1mr39903508edn.226.1524676657280;
        Wed, 25 Apr 2018 10:17:37 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id p36sm12277957eda.43.2018.04.25.10.17.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Apr 2018 10:17:35 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [PATCH bpf-next v4 04/10] bpf: add documentation for eBPF helpers (23-32)
Date:   Wed, 25 Apr 2018 18:16:55 +0100
Message-Id: <20180425171701.11048-5-quentin.monnet@netronome.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180425171701.11048-1-quentin.monnet@netronome.com>
References: <20180425171701.11048-1-quentin.monnet@netronome.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for eBPF helper functions to bpf.h user header file.
This documentation can be parsed with the Python script provided in
another commit of the patch series, in order to provide a RST document
that can later be converted into a man page.

The objective is to make the documentation easily understandable and
accessible to all eBPF developers, including beginners.

This patch contains descriptions for the following helper functions, all
written by Daniel:

- bpf_get_prandom_u32()
- bpf_get_smp_processor_id()
- bpf_get_cgroup_classid()
- bpf_get_route_realm()
- bpf_skb_load_bytes()
- bpf_csum_diff()
- bpf_skb_get_tunnel_opt()
- bpf_skb_set_tunnel_opt()
- bpf_skb_change_proto()
- bpf_skb_change_type()

v4:
- bpf_get_prandom_u32(): Warn that the prng is not cryptographically
  secure.
- bpf_get_smp_processor_id(): Fix a typo (case).
- bpf_get_cgroup_classid(): Clarify description. Add notes on the helper
  being limited to cgroup v1, and to egress path.
- bpf_get_route_realm(): Add comparison with bpf_get_cgroup_classid().
  Add a note about usage with TC and advantage of clsact. Fix a typo in
  return value ("sdb" instead of "skb").
- bpf_skb_load_bytes(): Make explicit loading large data loads it to the
  eBPF stack.
- bpf_csum_diff(): Add a note on seed that can be cascaded. Link to
  bpf_l3|l4_csum_replace().
- bpf_skb_get_tunnel_opt(): Add a note about usage with "collect
  metadata" mode, and example of this with Geneve.
- bpf_skb_set_tunnel_opt(): Add a link to bpf_skb_get_tunnel_opt()
  description.
- bpf_skb_change_proto(): Mention that the main use case is NAT64.
  Clarify comment about invalidated verifier checks.

v3:
- bpf_get_prandom_u32(): Fix helper name :(. Add description, including
  a note on the internal random state.
- bpf_get_smp_processor_id(): Add description, including a note on the
  processor id remaining stable during program run.
- bpf_get_cgroup_classid(): State that CONFIG_CGROUP_NET_CLASSID is
  required to use the helper. Add a reference to related documentation.
  State that placing a task in net_cls controller disables cgroup-bpf.
- bpf_get_route_realm(): State that CONFIG_CGROUP_NET_CLASSID is
  required to use this helper.
- bpf_skb_load_bytes(): Fix comment on current use cases for the helper.

Cc: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
Acked-by: Alexei Starovoitov <ast@kernel.org>
---
 include/uapi/linux/bpf.h | 197 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 368d83cf02d8..28681cef14d4 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -495,6 +495,27 @@ union bpf_attr {
  * 		The number of bytes written to the buffer, or a negative error
  * 		in case of failure.
  *
+ * u32 bpf_get_prandom_u32(void)
+ * 	Description
+ * 		Get a pseudo-random number.
+ *
+ * 		From a security point of view, this helper uses its own
+ * 		pseudo-random internal state, and cannot be used to infer the
+ * 		seed of other random functions in the kernel. However, it is
+ * 		essential to note that the generator used by the helper is not
+ * 		cryptographically secure.
+ * 	Return
+ * 		A random 32-bit unsigned value.
+ *
+ * u32 bpf_get_smp_processor_id(void)
+ * 	Description
+ * 		Get the SMP (symmetric multiprocessing) processor id. Note that
+ * 		all programs run with preemption disabled, which means that the
+ * 		SMP processor id is stable during all the execution of the
+ * 		program.
+ * 	Return
+ * 		The SMP id of the processor running the program.
+ *
  * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
  * 	Description
  * 		Store *len* bytes from address *from* into the packet
@@ -647,6 +668,32 @@ union bpf_attr {
  * 	Return
  * 		0 on success, or a negative error in case of failure.
  *
+ * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the classid for the current task, i.e. for the net_cls
+ * 		cgroup to which *skb* belongs.
+ *
+ * 		This helper can be used on TC egress path, but not on ingress.
+ *
+ * 		The net_cls cgroup provides an interface to tag network packets
+ * 		based on a user-provided identifier for all traffic coming from
+ * 		the tasks belonging to the related cgroup. See also the related
+ * 		kernel documentation, available from the Linux sources in file
+ * 		*Documentation/cgroup-v1/net_cls.txt*.
+ *
+ * 		The Linux kernel has two versions for cgroups: there are
+ * 		cgroups v1 and cgroups v2. Both are available to users, who can
+ * 		use a mixture of them, but note that the net_cls cgroup is for
+ * 		cgroup v1 only. This makes it incompatible with BPF programs
+ * 		run on cgroups, which is a cgroup-v2-only feature (a socket can
+ * 		only hold data for one version of cgroups at a time).
+ *
+ * 		This helper is only available is the kernel was compiled with
+ * 		the **CONFIG_CGROUP_NET_CLASSID** configuration option set to
+ * 		"**y**" or to "**m**".
+ * 	Return
+ * 		The classid, or 0 for the default unconfigured classid.
+ *
  * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
  * 	Description
  * 		Push a *vlan_tci* (VLAN tag control information) of protocol
@@ -786,6 +833,30 @@ union bpf_attr {
  * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
  * 		error.
  *
+ * u32 bpf_get_route_realm(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the realm or the route, that is to say the
+ * 		**tclassid** field of the destination for the *skb*. The
+ * 		indentifier retrieved is a user-provided tag, similar to the
+ * 		one used with the net_cls cgroup (see description for
+ * 		**bpf_get_cgroup_classid**\ () helper), but here this tag is
+ * 		held by a route (a destination entry), not by a task.
+ *
+ * 		Retrieving this identifier works with the clsact TC egress hook
+ * 		(see also **tc-bpf(8)**), or alternatively on conventional
+ * 		classful egress qdiscs, but not on TC ingress path. In case of
+ * 		clsact TC egress hook, this has the advantage that, internally,
+ * 		the destination entry has not been dropped yet in the transmit
+ * 		path. Therefore, the destination entry does not need to be
+ * 		artificially held via **netif_keep_dst**\ () for a classful
+ * 		qdisc until the *skb* is freed.
+ *
+ * 		This helper is available only if the kernel was compiled with
+ * 		**CONFIG_IP_ROUTE_CLASSID** configuration option.
+ * 	Return
+ * 		The realm of the route for the packet associated to *skb*, or 0
+ * 		if none was found.
+ *
  * int bpf_perf_event_output(struct pt_reg *ctx, struct bpf_map *map, u64 flags, void *data, u64 size)
  * 	Description
  * 		Write raw *data* blob into a special BPF perf event held by
@@ -831,6 +902,23 @@ union bpf_attr {
  * 	Return
  * 		0 on success, or a negative error in case of failure.
  *
+ * int bpf_skb_load_bytes(const struct sk_buff *skb, u32 offset, void *to, u32 len)
+ * 	Description
+ * 		This helper was provided as an easy way to load data from a
+ * 		packet. It can be used to load *len* bytes from *offset* from
+ * 		the packet associated to *skb*, into the buffer pointed by
+ * 		*to*.
+ *
+ * 		Since Linux 4.7, usage of this helper has mostly been replaced
+ * 		by "direct packet access", enabling packet data to be
+ * 		manipulated with *skb*\ **->data** and *skb*\ **->data_end**
+ * 		pointing respectively to the first byte of packet data and to
+ * 		the byte after the last byte of packet data. However, it
+ * 		remains useful if one wishes to read large quantities of data
+ * 		at once from a packet into the eBPF stack.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
  * int bpf_get_stackid(struct pt_reg *ctx, struct bpf_map *map, u64 flags)
  * 	Description
  * 		Walk a user or a kernel stack and return its id. To achieve
@@ -874,6 +962,115 @@ union bpf_attr {
  * 		The positive or null stack id on success, or a negative error
  * 		in case of failure.
  *
+ * s64 bpf_csum_diff(__be32 *from, u32 from_size, __be32 *to, u32 to_size, __wsum seed)
+ * 	Description
+ * 		Compute a checksum difference, from the raw buffer pointed by
+ * 		*from*, of length *from_size* (that must be a multiple of 4),
+ * 		towards the raw buffer pointed by *to*, of size *to_size*
+ * 		(same remark). An optional *seed* can be added to the value
+ * 		(this can be cascaded, the seed may come from a previous call
+ * 		to the helper).
+ *
+ * 		This is flexible enough to be used in several ways:
+ *
+ * 		* With *from_size* == 0, *to_size* > 0 and *seed* set to
+ * 		  checksum, it can be used when pushing new data.
+ * 		* With *from_size* > 0, *to_size* == 0 and *seed* set to
+ * 		  checksum, it can be used when removing data from a packet.
+ * 		* With *from_size* > 0, *to_size* > 0 and *seed* set to 0, it
+ * 		  can be used to compute a diff. Note that *from_size* and
+ * 		  *to_size* do not need to be equal.
+ *
+ * 		This helper can be used in combination with
+ * 		**bpf_l3_csum_replace**\ () and **bpf_l4_csum_replace**\ (), to
+ * 		which one can feed in the difference computed with
+ * 		**bpf_csum_diff**\ ().
+ * 	Return
+ * 		The checksum result, or a negative error code in case of
+ * 		failure.
+ *
+ * int bpf_skb_get_tunnel_opt(struct sk_buff *skb, u8 *opt, u32 size)
+ * 	Description
+ * 		Retrieve tunnel options metadata for the packet associated to
+ * 		*skb*, and store the raw tunnel option data to the buffer *opt*
+ * 		of *size*.
+ *
+ * 		This helper can be used with encapsulation devices that can
+ * 		operate in "collect metadata" mode (please refer to the related
+ * 		note in the description of **bpf_skb_get_tunnel_key**\ () for
+ * 		more details). A particular example where this can be used is
+ * 		in combination with the Geneve encapsulation protocol, where it
+ * 		allows for pushing (with **bpf_skb_get_tunnel_opt**\ () helper)
+ * 		and retrieving arbitrary TLVs (Type-Length-Value headers) from
+ * 		the eBPF program. This allows for full customization of these
+ * 		headers.
+ * 	Return
+ * 		The size of the option data retrieved.
+ *
+ * int bpf_skb_set_tunnel_opt(struct sk_buff *skb, u8 *opt, u32 size)
+ * 	Description
+ * 		Set tunnel options metadata for the packet associated to *skb*
+ * 		to the option data contained in the raw buffer *opt* of *size*.
+ *
+ * 		See also the description of the **bpf_skb_get_tunnel_opt**\ ()
+ * 		helper for additional information.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_change_proto(struct sk_buff *skb, __be16 proto, u64 flags)
+ * 	Description
+ * 		Change the protocol of the *skb* to *proto*. Currently
+ * 		supported are transition from IPv4 to IPv6, and from IPv6 to
+ * 		IPv4. The helper takes care of the groundwork for the
+ * 		transition, including resizing the socket buffer. The eBPF
+ * 		program is expected to fill the new headers, if any, via
+ * 		**skb_store_bytes**\ () and to recompute the checksums with
+ * 		**bpf_l3_csum_replace**\ () and **bpf_l4_csum_replace**\
+ * 		(). The main case for this helper is to perform NAT64
+ * 		operations out of an eBPF program.
+ *
+ * 		Internally, the GSO type is marked as dodgy so that headers are
+ * 		checked and segments are recalculated by the GSO/GRO engine.
+ * 		The size for GSO target is adapted as well.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_change_type(struct sk_buff *skb, u32 type)
+ * 	Description
+ * 		Change the packet type for the packet associated to *skb*. This
+ * 		comes down to setting *skb*\ **->pkt_type** to *type*, except
+ * 		the eBPF program does not have a write access to *skb*\
+ * 		**->pkt_type** beside this helper. Using a helper here allows
+ * 		for graceful handling of errors.
+ *
+ * 		The major use case is to change incoming *skb*s to
+ * 		**PACKET_HOST** in a programmatic way instead of having to
+ * 		recirculate via **redirect**\ (..., **BPF_F_INGRESS**), for
+ * 		example.
+ *
+ * 		Note that *type* only allows certain values. At this time, they
+ * 		are:
+ *
+ * 		**PACKET_HOST**
+ * 			Packet is for us.
+ * 		**PACKET_BROADCAST**
+ * 			Send packet to all.
+ * 		**PACKET_MULTICAST**
+ * 			Send packet to group.
+ * 		**PACKET_OTHERHOST**
+ * 			Send packet to someone else.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
  * u64 bpf_get_current_task(void)
  * 	Return
  * 		A pointer to the current task struct.
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
