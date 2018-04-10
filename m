Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 360357E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 14:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753801AbeDJOmb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 10:42:31 -0400
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36594 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754245AbeDJOmZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 10:42:25 -0400
Received: by mail-wm0-f44.google.com with SMTP id x82so23840407wmg.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NMz89HOupgm+cl30eXTtlQRn7yeSVT0hzXRCgnK8138=;
        b=y27gJVF/M/NZNYmdLWRycB/UP5dpmIJ1evNtf7jLza2NviATglaU1pSCglPr0mExn4
         9xTEEjzxj0+YDblOfh9IMyptQsD6sfJAxKLdlgI3yZKspjYZMGFPwWFnYEhUkIrLJqP+
         vdvKk9yNw5UStFAXJF9Ky3j76l9V8HGXL57DidRCX6w0stOeL7obComCUX2bc4AFfpNY
         0J1dcOxJHyTc89QXyULlUf5EMTBZGJUbQiF27SicDNDO4pUY+BzX2mAgGhkEaCu+4rR+
         wTbPY0qyft7Fa/gRUl/xxpvu/eKa+1Ij97byndcGFy30O+sHR1JcPNGBU+p4aFuUKFkt
         tVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NMz89HOupgm+cl30eXTtlQRn7yeSVT0hzXRCgnK8138=;
        b=achbF5nbjywMrHngnrn7PeCCh7PY+mgoWdcT98SKErucJT2bEaz9xru2JrfO32zRo1
         aeMmlRCv0YEOwh4EnsFrUsAv77iP5kn/E1v2yeL/D1KbvaM0i7PQ8dOJfy21qHyCvEog
         tzoTn2oCnViLtTHiHbyTtWfGn3n90S59QuZlMcNuAWbkjxuGwTTrV10nNIrp8mS5IKVg
         qrKIqmBmJYHwGw0UbUNJIvjzyvVeT/N48/TgCQUcGUERdy6QhH44kj9/S0NwWA95O5JJ
         G7PKLek1whFYw7lK/JlnMJjm50PEls/KJEjEYTixJMrv/M+Jb+ddtkI4b5/Kq/rmFSeV
         DI0w==
X-Gm-Message-State: ALQs6tA90BZpWIDRvFMcSQO5oiEH8vDzqxR+0yiElpl3pM9T23nNFSAT
        zfHv3PjuKGJfuVUEKt3CE3ycsu0J
X-Google-Smtp-Source: AIpwx4/CXTdCJYNswPo9j3yTkYXg/55JffoPxOVaYNocTr9VmkrfVqumfyYmC7bDUMDoVul9+amABw==
X-Received: by 10.80.201.203 with SMTP id c11mr3849640edi.0.1523371343923;
        Tue, 10 Apr 2018 07:42:23 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id i17sm1948907ede.13.2018.04.10.07.42.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 07:42:23 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [RFC bpf-next v2 5/8] bpf: add documentation for eBPF helpers (33-41)
Date:   Tue, 10 Apr 2018 15:41:54 +0100
Message-Id: <20180410144157.4831-6-quentin.monnet@netronome.com>
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

- bpf_get_hash_recalc()
- bpf_skb_change_tail()
- bpf_skb_pull_data()
- bpf_csum_update()
- bpf_set_hash_invalid()
- bpf_get_numa_node_id()
- bpf_set_hash()
- bpf_skb_adjust_room()
- bpf_xdp_adjust_meta()

Cc: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h | 155 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index d147d9dd6a83..af429ec79f50 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -939,9 +939,164 @@ union bpf_attr {
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
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
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
+ * 		For direct packet access, when testing that offsets to access
+ * 		are within packet boundaries (test on *skb*\ **->data_end**)
+ * 		fails, programs just bail out, or, in the direct read case, use
+ * 		**bpf_skb_load_bytes()** as an alternative to overcome this
+ * 		limitation. If such data sits in non-linear parts, it is
+ * 		possible to pull them in once with the new helper, retest and
+ * 		eventually access them.
+ *
+ * 		At the same time, this also makes sure the skb is uncloned,
+ * 		which is a necessary condition for direct write. As this needs
+ * 		to be an invariant for the write part only, the verifier
+ * 		detects writes and adds a prologue that is calling
+ * 		**bpf_skb_pull_data()** to effectively unclone the skb from the
+ * 		very beginning in case it is indeed cloned.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * s64 bpf_csum_update(struct sk_buff *skb, __wsum csum)
+ * 	Description
+ * 		Add the checksum *csum* into *skb*\ **->csum** in case the
+ * 		driver fed us an IP checksum. Return an error otherwise. This
+ * 		header is intended to be used in combination with
+ * 		**bpf_csum_diff()** helper, in particular when the checksum
+ * 		needs to be updated after data has been written into the packet
+ * 		through direct packet access.
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
+ * 		hash.
+ *
+ * int bpf_get_numa_node_id(void)
+ * 	Description
+ * 		Return the id of the current NUMA node. The primary use case
+ * 		for this helper is the selection of sockets for the local NUMA
+ * 		node, when the program is attached to sockets using the
+ * 		**SO_ATTACH_REUSEPORT_EBPF** option (see also **socket(7)**).
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
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
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
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
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
