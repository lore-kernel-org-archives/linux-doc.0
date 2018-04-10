Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 434FB7E89B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 14:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754242AbeDJOnC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 10:43:02 -0400
Received: from mail-wm0-f46.google.com ([74.125.82.46]:38180 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754233AbeDJOmX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 10:42:23 -0400
Received: by mail-wm0-f46.google.com with SMTP id i3so23828599wmf.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hZz/dR+F66MfzaEWkE61k3AbpNikwF6jPu5ikuiaGQo=;
        b=DnDsBQ0eKh8JXvAPZ7Fc/uYpbIh40HDr4BBHvYxHTVKjC19fz0QNffaCdrh5cnj51t
         NU1cELmAgV+YcGmBMCe80Wnjc5PGAwtjo6q/um2PaneCTbBsjsOtjj78as9zLVfjMiy3
         LfFQ9+8GTzh/3qrQkW6FkSaZ+aJQmRhsoXSWJXL/VhdBV+j+3RMfKL2/qys/F/5hNeY0
         +auqNaTpTHX1QgMq6gqfwXK6fB/e2bz1DMGuD1N4B9qJF3H3H4qoIf/8NkvzYqu4LXUA
         0PTrhHkAum5xJHVjI1YEBmyGQ1gLotawO4iY2WqRJ8ItYCIfylroZRX3c3RtHFATA4AU
         UeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hZz/dR+F66MfzaEWkE61k3AbpNikwF6jPu5ikuiaGQo=;
        b=erzHEuEYlq0Zk8RCJwoRzdeDfLdJwSbPgVFfVlVY6j76PL1SxLQ/sSvm7Hn/e6eymN
         w6NarUjCMgR2ASMdGyKIfPgaNB/A0RJi+i9ZMCxkYkXgHXRXG0j9yp0s7Bkl+h0RQ18r
         dG9jKkHEBPZFvEcQXmms2TiXTRuN5o1iYHuk03MxTvco6jRvhhGAYg7Ma45edv+n6ZT+
         vKbS4gFwnsXcalit428Ol9c/8azZnfKpQ6BIX7JSZJum82mpLtIm3L4+xa1aCfu7BsTR
         myLp3J2swrBKiQyfMprr5B7T3W6Cw7um6yghrTv7uN/avz2AUIX/88lLrEo0FYvaPq8B
         uzmg==
X-Gm-Message-State: ALQs6tADjb7b6QF9jkTh67r7e2tBO1iiPv8wViwqz/FjFJJrIZjPeX32
        eFftXZ4FzjDqlNaGgrWavEEB3A==
X-Google-Smtp-Source: AIpwx49euYuXxHh9bRmjVepirhIjei6PHt9ogxEqaVowzsB0VSzPF4AfUjnkgv9RJYQDIzs9gVGxYw==
X-Received: by 10.80.232.200 with SMTP id l8mr3758193edn.273.1523371341311;
        Tue, 10 Apr 2018 07:42:21 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id i17sm1948907ede.13.2018.04.10.07.42.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 07:42:20 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [RFC bpf-next v2 3/8] bpf: add documentation for eBPF helpers (12-22)
Date:   Tue, 10 Apr 2018 15:41:52 +0100
Message-Id: <20180410144157.4831-4-quentin.monnet@netronome.com>
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
writter by Alexei:

- bpf_get_current_pid_tgid()
- bpf_get_current_uid_gid()
- bpf_get_current_comm()
- bpf_skb_vlan_push()
- bpf_skb_vlan_pop()
- bpf_skb_get_tunnel_key()
- bpf_skb_set_tunnel_key()
- bpf_redirect()
- bpf_perf_event_output()
- bpf_get_stackid()
- bpf_get_current_task()

Cc: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h | 237 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 237 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 2bc653a3a20f..f3ea8824efbc 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -580,6 +580,243 @@ union bpf_attr {
  * 		performed again.
  * 	Return
  * 		0 on success, or a negative error in case of failure.
+ *
+ * u64 bpf_get_current_pid_tgid(void)
+ * 	Return
+ * 		A 64-bit integer containing the current tgid and pid, and
+ * 		created as such:
+ * 		*current_task*\ **->tgid << 32 \|**
+ * 		*current_task*\ **->pid**.
+ *
+ * u64 bpf_get_current_uid_gid(void)
+ * 	Return
+ * 		A 64-bit integer containing the current GID and UID, and
+ * 		created as such: *current_gid* **<< 32 \|** *current_uid*.
+ *
+ * int bpf_get_current_comm(char *buf, u32 size_of_buf)
+ * 	Description
+ * 		Copy the **comm** attribute of the current task into *buf* of
+ * 		*size_of_buf*. The **comm** attribute contains the name of
+ * 		the executable (excluding the path) for the current task. The
+ * 		*size_of_buf* must be strictly positive. On success, the
+ * 		helper makes sure that the *buf* is NUL-terminated. On failure,
+ * 		it is filled with zeroes.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
+ * 	Description
+ * 		Push a *vlan_tci* (VLAN tag control information) of protocol
+ * 		*vlan_proto* to the packet associated to *skb*, then update
+ * 		the checksum. Note that if *vlan_proto* is different from
+ * 		**ETH_P_8021Q** and **ETH_P_8021AD**, it is considered to
+ * 		be **ETH_P_8021Q**.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_vlan_pop(struct sk_buff *skb)
+ * 	Description
+ * 		Pop a VLAN header from the packet associated to *skb*.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_get_tunnel_key(struct sk_buff *skb, struct bpf_tunnel_key *key, u32 size, u64 flags)
+ * 	Description
+ * 		Get tunnel metadata. This helper takes a pointer *key* to an
+ * 		empty **struct bpf_tunnel_key** of **size**, that will be
+ * 		filled with tunnel metadata for the packet associated to *skb*.
+ * 		The *flags* can be set to **BPF_F_TUNINFO_IPV6**, which
+ * 		indicates that the tunnel is based on IPv6 protocol instead of
+ * 		IPv4.
+ *
+ * 		This is typically used on the receive path to perform a lookup
+ * 		or a packet redirection based on the value of *key*:
+ *
+ * 		::
+ *
+ * 			struct bpf_tunnel_key key = {};
+ * 			bpf_skb_get_tunnel_key(skb, &key, sizeof(key), 0);
+ * 			     lookup or redirect based on key ...
+ *
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_set_tunnel_key(struct sk_buff *skb, struct bpf_tunnel_key *key, u32 size, u64 flags)
+ * 	Description
+ * 		Populate tunnel metadata for packet associated to *skb.* The
+ * 		tunnel metadata is set to the contents of *key*, of *size*. The
+ * 		*flags* can be set to a combination of the following values:
+ *
+ * 		**BPF_F_TUNINFO_IPV6**
+ * 			Indicate that the tunnel is based on IPv6 protocol
+ * 			instead of IPv4.
+ * 		**BPF_F_ZERO_CSUM_TX**
+ * 			For IPv4 packets, add a flag to tunnel metadata
+ * 			indicating that checksum computation should be skipped
+ * 			and checksum set to zeroes.
+ * 		**BPF_F_DONT_FRAGMENT**
+ * 			Add a flag to tunnel metadata indicating that the
+ * 			packet should not be fragmented.
+ * 		**BPF_F_SEQ_NUMBER**
+ * 			Add a flag to tunnel metadata indicating that a
+ * 			sequence number should be added to tunnel header before
+ * 			sending the packet. This flag was added for GRE
+ * 			encapsulation, but might be used with other protocols
+ * 			as well in the future.
+ *
+ * 		Here is a typical usage on the transmit path:
+ *
+ * 		::
+ *
+ * 			struct bpf_tunnel_key key;
+ * 			     populate key ...
+ * 			bpf_skb_set_tunnel_key(skb, &key, sizeof(key), 0);
+ * 			bpf_clone_redirect(skb, vxlan_dev_ifindex, 0);
+ *
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_redirect(u32 ifindex, u64 flags)
+ * 	Description
+ * 		Redirect the packet to another net device of index *ifindex*.
+ * 		This helper is somewhat similar to **bpf_clone_redirect**\
+ * 		(), except that the packet is not cloned, which provides
+ * 		increased performance.
+ *
+ * 		For hooks other than XDP, *flags* can be set to
+ * 		**BPF_F_INGRESS**, which indicates the packet is to be
+ * 		redirected to the ingress interface instead of (by default)
+ * 		egress. Currently, XDP does not support any flag.
+ * 	Return
+ * 		For XDP, the helper returns **XDP_REDIRECT** on success or
+ * 		**XDP_ABORT** on error. For other program types, the values
+ * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
+ * 		error.
+ *
+ * int bpf_perf_event_output(struct pt_reg *ctx, struct bpf_map *map, u64 flags, void *data, u64 size)
+ * 	Description
+ * 		Write perf raw sample into a perf event held by *map* of type
+ * 		**BPF_MAP_TYPE_PERF_EVENT_ARRAY**. This perf event must
+ * 		have the following attributes: **PERF_SAMPLE_RAW** as
+ * 		**sample_type**, **PERF_TYPE_SOFTWARE** as **type**, and
+ * 		**PERF_COUNT_SW_BPF_OUTPUT** as **config**.
+ *
+ * 		The *flags* are used to indicate the index in *map* for which
+ * 		the value must be put, masked with **BPF_F_INDEX_MASK**.
+ * 		Alternatively, *flags* can be set to **BPF_F_CURRENT_CPU**
+ * 		to indicate that the index of the current CPU core should be
+ * 		used.
+ *
+ * 		The value to write, of *size*, is passed through eBPF stack and
+ * 		pointed by *data*.
+ *
+ * 		The context of the program *ctx* needs also be passed to the
+ * 		helper, and will get interpreted as a pointer to a **struct
+ * 		pt_reg**.
+ *
+ * 		On user space, a program willing to read the values needs to
+ * 		call **perf_event_open**\ () on the perf event (either for
+ * 		one or for all CPUs) and to store the file descriptor into the
+ * 		*map*. This must be done before the eBPF program can send data
+ * 		into it. An example is available in file
+ * 		*samples/bpf/trace_output_user.c* in the Linux kernel source
+ * 		tree (the eBPF program counterpart is in
+ * 		*samples/bpf/trace_output_kern.c*). It looks like the
+ * 		following snippet:
+ *
+ * 		::
+ *
+ * 			volatile struct perf_event_mmap_page *header;
+ * 			struct perf_event_attr attr = {
+ * 			        .sample_type = PERF_SAMPLE_RAW,
+ * 			        .type = PERF_TYPE_SOFTWARE,
+ * 			        .config = PERF_COUNT_SW_BPF_OUTPUT,
+ * 			};
+ * 			int page_size;
+ * 			int mmap_size;
+ * 			int key = 0;
+ * 			int pmu_fd;
+ * 			void *base;
+ * 			
+ * 			if (load_bpf_file(filename))
+ * 			        return -1;
+ * 			
+ * 			pmu_fd = sys_perf_event_open(&attr,
+ * 			                             -1, // pid
+ * 			                              0, // cpu
+ * 			                             -1, // group_fd
+ * 			                              0);
+ * 			
+ * 			assert(pmu_fd >= 0);
+ * 			assert(bpf_map_update_elem(map_fd[0], &key,
+ * 			                           &pmu_fd, BPF_ANY) == 0);
+ * 			assert(ioctl(pmu_fd, PERF_EVENT_IOC_ENABLE, 0) == 0);
+ * 			
+ * 			page_size = getpagesize();
+ * 			mmap_size = page_size * (page_cnt + 1);
+ * 			
+ * 			base = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE,
+ * 			            MAP_SHARED, fd, 0);
+ * 			if (base == MAP_FAILED)
+ * 			        return -1;
+ * 			
+ * 			header = base;
+ *
+ * 		**bpf_perf_event_output**\ () achieves better performance
+ * 		than **bpf_trace_printk**\ () for sharing data with user
+ * 		space, and is much better suitable for streaming data from eBPF
+ * 		programs.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_get_stackid(struct pt_reg *ctx, struct bpf_map *map, u64 flags)
+ * 	Description
+ * 		Walk a user or a kernel stack and return its id. To achieve
+ * 		this, the helper needs *ctx*, which is a pointer to the context
+ * 		on which the tracing program is executed, and a pointer to a
+ * 		*map* of type **BPF_MAP_TYPE_STACK_TRACE**.
+ *
+ * 		The last argument, *flags*, holds the number of stack frames to
+ * 		skip (from 0 to 255), masked with
+ * 		**BPF_F_SKIP_FIELD_MASK**. The next bits can be used to set
+ * 		a combination of the following flags:
+ *
+ * 		**BPF_F_USER_STACK**
+ * 			Collect a user space stack instead of a kernel stack.
+ * 		**BPF_F_FAST_STACK_CMP**
+ * 			Compare stacks by hash only.
+ * 		**BPF_F_REUSE_STACKID**
+ * 			If two different stacks hash into the same *stackid*,
+ * 			discard the old one.
+ *
+ * 		The stack id retrieved is a 32 bit long integer handle which
+ * 		can be further combined with other data (including other stack
+ * 		ids) and used as a key into maps. This can be useful for
+ * 		generating a variety of graphs (such as flame graphs or off-cpu
+ * 		graphs).
+ *
+ * 		For walking a stack, this helper is an improvement over
+ * 		**bpf_probe_read**\ (), which can be used with unrolled loops
+ * 		but is not efficient and consumes a lot of eBPF instructions.
+ * 		Instead, **bpf_get_stackid**\ () can collect up to
+ * 		**PERF_MAX_STACK_DEPTH** both kernel and user frames.
+ * 	Return
+ * 		The positive or null stack id on success, or a negative error
+ * 		in case of failure.
+ *
+ * u64 bpf_get_current_task(void)
+ * 	Return
+ * 		A pointer to the current task struct.
  */
 #define __BPF_FUNC_MAPPER(FN)		\
 	FN(unspec),			\
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
