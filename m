Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 387BC7E6B0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 17:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755086AbeDYRSO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 13:18:14 -0400
Received: from mail-wm0-f52.google.com ([74.125.82.52]:40617 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755826AbeDYRRk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 13:17:40 -0400
Received: by mail-wm0-f52.google.com with SMTP id j5so8162671wme.5
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QKRWuwlQdl2aAfpMDhbnTns7vZBrD9zhemlZUt1PDI8=;
        b=HoHK6HQKFLrRrtX+GeYS2DWGXRBYSlgFPGGZ6JksLzYYNzMm4YtlLyV2nLPUj24dZy
         4k1xU7282ZPHAREWHw1gixCuzGCmkPBGRXNmKwrSQXSsh1spdnwrx94Lj9f0Qauww06I
         vRw0q+WBe+oOuHzV09pX7uCRQu1fU6qR6m6hJLjvtiRnAq+muUBkzwKF6oXHm3F+rjEA
         oDsw4XcbZ+L0oGmARYzMsp/hYLSFjxFpyM7dYXPbzkYXZrOIzKZO4exOVNt7EOTAT/rS
         w9arPoWUrkRdgFVnmo6ng1ZN6psAECncU+0W1XC/rk8i9NJxDn/DadQ4mFtZ1tIi9FTe
         dDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QKRWuwlQdl2aAfpMDhbnTns7vZBrD9zhemlZUt1PDI8=;
        b=Y32V5RR597Ljp+I3cQSyZv2MpuIZMsv5VXSW5t4q1y2kOtM0uXZRKa+7V8JCcp8SUt
         W0FtKWrlfcoxNLmMqgk+z02+njxG1e2fPoH1j72O10bWhYDpqFeCvvWSmcWOnlU296kj
         D3HbJxpHUlbY45o3F2TOAYIMAArA+BLjCIMxD0YMwsV9Tkpy4O9OZSrC1SGdmEJwky/X
         8UPVNQ7O08ZftKbpAMfr0G8JZ5gMpcIGT/wqFAPP9K7/3GOq7A5QC8mcwQjQMGHWYP33
         RT2dtsWCr4k6cwU/PREYsqaCX+9uh4P2xfU5LMSJ3kbl67hRqKs/7eYapFsimnsyk26O
         vFow==
X-Gm-Message-State: ALQs6tBbomhADsR/3LSqANFit2VSQJZdDIaOm58XECGfF5sDV7VMh1bh
        CpXXd0o4IQo2sdfbiwHrw/WDUu5s
X-Google-Smtp-Source: AIpwx48kW3K+YdFyLw7yWB5DiRCzoNbysne/yVkQGbg/L7ZyHRHHZ9zD6kQQhvmUSXeQjLjwrxsgDA==
X-Received: by 10.80.159.193 with SMTP id c59mr39173361edf.277.1524676659093;
        Wed, 25 Apr 2018 10:17:39 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id p36sm12277957eda.43.2018.04.25.10.17.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Apr 2018 10:17:38 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [PATCH bpf-next v4 05/10] bpf: add documentation for eBPF helpers (33-41)
Date:   Wed, 25 Apr 2018 18:16:56 +0100
Message-Id: <20180425171701.11048-6-quentin.monnet@netronome.com>
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

- bpf_get_hash_recalc()
- bpf_skb_change_tail()
- bpf_skb_pull_data()
- bpf_csum_update()
- bpf_set_hash_invalid()
- bpf_get_numa_node_id()
- bpf_set_hash()
- bpf_skb_adjust_room()
- bpf_xdp_adjust_meta()

v4:
- bpf_skb_change_tail(): Clarify comment about invalidated verifier
  checks.
- bpf_skb_pull_data(): Clarify the motivation for using this helper or
  bpf_skb_load_bytes(), on non-linear buffers. Fix RST formatting for
  *skb*. Clarify comment about invalidated verifier checks.
- bpf_csum_update(): Fix description of checksum (entire packet, not IP
  checksum). Fix a typo: "header" instead of "helper".
- bpf_set_hash_invalid(): Mention bpf_get_hash_recalc().
- bpf_get_numa_node_id(): State that the helper is not restricted to
  programs attached to sockets.
- bpf_skb_adjust_room(): Clarify comment about invalidated verifier
  checks.
- bpf_xdp_adjust_meta(): Clarify comment about invalidated verifier
  checks.

Cc: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
Acked-by: Alexei Starovoitov <ast@kernel.org>
---
 include/uapi/linux/bpf.h | 164 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 28681cef14d4..d1207ba39280 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -1071,9 +1071,173 @@ union bpf_attr {
  * 	Return
  * 		0 on success, or a negative error in case of failure.
  *
+ * u32 bpf_get_hash_recalc(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the hash of the packet, *skb*\ **->hash**. If it is
+ * 		not set, in particular if the hash was cleared due to mangling,
+ * 		recompute this hash. Later accesses to the hash can be done
+ * 		directly with *skb*\ **->hash**.
+ *
+ * 		Calling **bpf_set_hash_invalid**\ (), changing a packet
+ * 		prototype with **bpf_skb_change_proto**\ (), or calling
+ * 		**bpf_skb_store_bytes**\ () with the
+ * 		**BPF_F_INVALIDATE_HASH** are actions susceptible to clear
+ * 		the hash and to trigger a new computation for the next call to
+ * 		**bpf_get_hash_recalc**\ ().
+ * 	Return
+ * 		The 32-bit hash.
+ *
  * u64 bpf_get_current_task(void)
  * 	Return
  * 		A pointer to the current task struct.
+ *
+ * int bpf_skb_change_tail(struct sk_buff *skb, u32 len, u64 flags)
+ * 	Description
+ * 		Resize (trim or grow) the packet associated to *skb* to the
+ * 		new *len*. The *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		The basic idea is that the helper performs the needed work to
+ * 		change the size of the packet, then the eBPF program rewrites
+ * 		the rest via helpers like **bpf_skb_store_bytes**\ (),
+ * 		**bpf_l3_csum_replace**\ (), **bpf_l3_csum_replace**\ ()
+ * 		and others. This helper is a slow path utility intended for
+ * 		replies with control messages. And because it is targeted for
+ * 		slow path, the helper itself can afford to be slow: it
+ * 		implicitly linearizes, unclones and drops offloads from the
+ * 		*skb*.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_skb_pull_data(struct sk_buff *skb, u32 len)
+ * 	Description
+ * 		Pull in non-linear data in case the *skb* is non-linear and not
+ * 		all of *len* are part of the linear section. Make *len* bytes
+ * 		from *skb* readable and writable. If a zero value is passed for
+ * 		*len*, then the whole length of the *skb* is pulled.
+ *
+ * 		This helper is only needed for reading and writing with direct
+ * 		packet access.
+ *
+ * 		For direct packet access, testing that offsets to access
+ * 		are within packet boundaries (test on *skb*\ **->data_end**) is
+ * 		susceptible to fail if offsets are invalid, or if the requested
+ * 		data is in non-linear parts of the *skb*. On failure the
+ * 		program can just bail out, or in the case of a non-linear
+ * 		buffer, use a helper to make the data available. The
+ * 		**bpf_skb_load_bytes**\ () helper is a first solution to access
+ * 		the data. Another one consists in using **bpf_skb_pull_data**
+ * 		to pull in once the non-linear parts, then retesting and
+ * 		eventually access the data.
+ *
+ * 		At the same time, this also makes sure the *skb* is uncloned,
+ * 		which is a necessary condition for direct write. As this needs
+ * 		to be an invariant for the write part only, the verifier
+ * 		detects writes and adds a prologue that is calling
+ * 		**bpf_skb_pull_data()** to effectively unclone the *skb* from
+ * 		the very beginning in case it is indeed cloned.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * s64 bpf_csum_update(struct sk_buff *skb, __wsum csum)
+ * 	Description
+ * 		Add the checksum *csum* into *skb*\ **->csum** in case the
+ * 		driver has supplied a checksum for the entire packet into that
+ * 		field. Return an error otherwise. This helper is intended to be
+ * 		used in combination with **bpf_csum_diff**\ (), in particular
+ * 		when the checksum needs to be updated after data has been
+ * 		written into the packet through direct packet access.
+ * 	Return
+ * 		The checksum on success, or a negative error code in case of
+ * 		failure.
+ *
+ * void bpf_set_hash_invalid(struct sk_buff *skb)
+ * 	Description
+ * 		Invalidate the current *skb*\ **->hash**. It can be used after
+ * 		mangling on headers through direct packet access, in order to
+ * 		indicate that the hash is outdated and to trigger a
+ * 		recalculation the next time the kernel tries to access this
+ * 		hash or when the **bpf_get_hash_recalc**\ () helper is called.
+ *
+ * int bpf_get_numa_node_id(void)
+ * 	Description
+ * 		Return the id of the current NUMA node. The primary use case
+ * 		for this helper is the selection of sockets for the local NUMA
+ * 		node, when the program is attached to sockets using the
+ * 		**SO_ATTACH_REUSEPORT_EBPF** option (see also **socket(7)**),
+ * 		but the helper is also available to other eBPF program types,
+ * 		similarly to **bpf_get_smp_processor_id**\ ().
+ * 	Return
+ * 		The id of current NUMA node.
+ *
+ * u32 bpf_set_hash(struct sk_buff *skb, u32 hash)
+ * 	Description
+ * 		Set the full hash for *skb* (set the field *skb*\ **->hash**)
+ * 		to value *hash*.
+ * 	Return
+ * 		0
+ *
+ * int bpf_skb_adjust_room(struct sk_buff *skb, u32 len_diff, u32 mode, u64 flags)
+ * 	Description
+ * 		Grow or shrink the room for data in the packet associated to
+ * 		*skb* by *len_diff*, and according to the selected *mode*.
+ *
+ * 		There is a single supported mode at this time:
+ *
+ * 		* **BPF_ADJ_ROOM_NET**: Adjust room at the network layer
+ * 		  (room space is added or removed below the layer 3 header).
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
+ * int bpf_xdp_adjust_meta(struct xdp_buff *xdp_md, int delta)
+ * 	Description
+ * 		Adjust the address pointed by *xdp_md*\ **->data_meta** by
+ * 		*delta* (which can be positive or negative). Note that this
+ * 		operation modifies the address stored in *xdp_md*\ **->data**,
+ * 		so the latter must be loaded only after the helper has been
+ * 		called.
+ *
+ * 		The use of *xdp_md*\ **->data_meta** is optional and programs
+ * 		are not required to use it. The rationale is that when the
+ * 		packet is processed with XDP (e.g. as DoS filter), it is
+ * 		possible to push further meta data along with it before passing
+ * 		to the stack, and to give the guarantee that an ingress eBPF
+ * 		program attached as a TC classifier on the same device can pick
+ * 		this up for further post-processing. Since TC works with socket
+ * 		buffers, it remains possible to set from XDP the **mark** or
+ * 		**priority** pointers, or other pointers for the socket buffer.
+ * 		Having this scratch space generic and programmable allows for
+ * 		more flexibility as the user is free to store whatever meta
+ * 		data they need.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
  */
 #define __BPF_FUNC_MAPPER(FN)		\
 	FN(unspec),			\
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
