Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2182E7E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 14:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754113AbeDJOnA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 10:43:00 -0400
Received: from mail-wm0-f43.google.com ([74.125.82.43]:34863 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754241AbeDJOmY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 10:42:24 -0400
Received: by mail-wm0-f43.google.com with SMTP id r82so24054304wme.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ASmv4p2IdMLn+mXO1E+VZl1AmB9piIOVe3cA8mNlPPU=;
        b=xOZZHrfCdPLgUji8WMjIl0m9GmYIHAtdQsOYYSsnlK5LxZatz3c20ROvqCEjQNiEbE
         COjIvcC3Rb+CHrjKDwYLwt+5p5qL5mwTPZXq+yADQmK7kezHuw8kT7TFHPekkHAY+Wpe
         I6qk0LnNW9TALsL/ICaedIhrblwM6b7zRrJ46b+L+qoLSwhMgw5jaklXyXUmr/cmk0kM
         z/n7GsPK1z+PAkx3Timz9sHxiwgUpO046pG6E1+6hbhSyFxsaX/DLypj1tTNnJv57jm8
         CdOAi0q3nSM0aXBvX60qA443jkKm76HIEjr4rYzoq73mr6rp/ZsXdrKQ49NQDqjnX20s
         YKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ASmv4p2IdMLn+mXO1E+VZl1AmB9piIOVe3cA8mNlPPU=;
        b=Oc62QnGPTRO2uHkomcJru/Zg3IyheQ0HkZP2Cc9T1WXEUqW9wLagIsktk+8NIiF67J
         OOsIIzjMxqa/gyMzept5rBR4LRXnujvDavlrQzspA7a77dRQx9tudSoUb62ZK77nCPnz
         tbkjBMGs6ocGJBty16y6mFLwdH/BJfNPnje8ziVSgX68ziaQFXUqRJCcXZAp/LWscWmG
         ttsngTML+IQZSX7ikwUCS2lrBGnnoq+XSaAfi7fbE7yX6U9Wgqe7d8CMqqdPftYX4wcv
         QOqwg5qyvioTRYEswqcBpjj+jfEgYmJEEnv7lSchyNUOe88wmC5tdD9dvuyGhF+VPSoo
         B3hg==
X-Gm-Message-State: ALQs6tB4e1vS5eG1kqj5dyj9shcq1tiCaRzqMcTTbg/VUbTbbqFAj6+u
        nhdhXRE9YUhA3sqF8D4d190V9Q==
X-Google-Smtp-Source: AIpwx49xg7koWQgYwxGNqj0rPUV+mO9U1krFjSpmK0NZB+vExWUIMdnHFsp0vqKWCVV33KZyH/gc5Q==
X-Received: by 10.80.175.196 with SMTP id h62mr3832082edd.102.1523371342476;
        Tue, 10 Apr 2018 07:42:22 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id i17sm1948907ede.13.2018.04.10.07.42.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 07:42:21 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [RFC bpf-next v2 4/8] bpf: add documentation for eBPF helpers (23-32)
Date:   Tue, 10 Apr 2018 15:41:53 +0100
Message-Id: <20180410144157.4831-5-quentin.monnet@netronome.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180410144157.4831-1-quentin.monnet@netronome.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
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

Cc: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h | 125 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index f3ea8824efbc..d147d9dd6a83 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -473,6 +473,14 @@ union bpf_attr {
  * 		The number of bytes written to the buffer, or a negative error
  * 		in case of failure.
  *
+ * u32 bpf_prandom_u32(void)
+ * 	Return
+ * 		A random 32-bit unsigned value.
+ *
+ * u32 bpf_get_smp_processor_id(void)
+ * 	Return
+ * 		The SMP (Symmetric multiprocessing) processor id.
+ *
  * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
  * 	Description
  * 		Store *len* bytes from address *from* into the packet
@@ -604,6 +612,13 @@ union bpf_attr {
  * 	Return
  * 		0 on success, or a negative error in case of failure.
  *
+ * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the classid for the current task, i.e. for the
+ * 		net_cls (network classifier) cgroup to which *skb* belongs.
+ * 	Return
+ * 		The classid, or 0 for the default unconfigured classid.
+ *
  * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
  * 	Description
  * 		Push a *vlan_tci* (VLAN tag control information) of protocol
@@ -703,6 +718,14 @@ union bpf_attr {
  * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
  * 		error.
  *
+ * u32 bpf_get_route_realm(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the realm or the route, that is to say the
+ * 		**tclassid** field of the destination for the *skb*.
+ * 	Return
+ * 		The realm of the route for the packet associated to *sdb*, or 0
+ * 		if none was found.
+ *
  * int bpf_perf_event_output(struct pt_reg *ctx, struct bpf_map *map, u64 flags, void *data, u64 size)
  * 	Description
  * 		Write perf raw sample into a perf event held by *map* of type
@@ -779,6 +802,21 @@ union bpf_attr {
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
+ * 		Since Linux 4.7, this helper is deprecated in favor of
+ * 		"direct packet access", enabling packet data to be manipulated
+ * 		with *skb*\ **->data** and *skb*\ **->data_end** pointing
+ * 		respectively to the first byte of packet data and to the byte
+ * 		after the last byte of packet data.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
  * int bpf_get_stackid(struct pt_reg *ctx, struct bpf_map *map, u64 flags)
  * 	Description
  * 		Walk a user or a kernel stack and return its id. To achieve
@@ -814,6 +852,93 @@ union bpf_attr {
  * 		The positive or null stack id on success, or a negative error
  * 		in case of failure.
  *
+ * s64 bpf_csum_diff(__be32 *from, u32 from_size, __be32 *to, u32 to_size, __wsum seed)
+ * 	Description
+ * 		Compute a checksum difference, from the raw buffer pointed by
+ * 		*from*, of length *from_size* (that must be a multiple of 4),
+ * 		towards the raw buffer pointed by *to*, of size *to_size*
+ * 		(same remark). An optional *seed* can be added to the value.
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
+ * 	Return
+ * 		The checksum result, or a negative error code in case of
+ * 		failure.
+ *
+ * int bpf_skb_get_tunnel_opt(struct sk_buff *skb, u8 *opt, u32 size)
+ * 	Description
+ * 		Retrieve tunnel options metadata for the packet associated to
+ * 		*skb*, and store the raw tunnel option data to the buffer *opt*
+ * 		of *size*.
+ * 	Return
+ * 		The size of the option data retrieved.
+ *
+ * int bpf_skb_set_tunnel_opt(struct sk_buff *skb, u8 *opt, u32 size)
+ * 	Description
+ * 		Set tunnel options metadata for the packet associated to *skb*
+ * 		to the option data contained in the raw buffer *opt* of *size*.
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
+ * 		().
+ *
+ * 		Internally, the GSO type is marked as dodgy so that headers are
+ * 		checked and segments are recalculated by the GSO/GRO engine.
+ * 		The size for GSO target is adapted as well.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
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
