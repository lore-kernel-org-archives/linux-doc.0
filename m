Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D0CA7E677
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 17:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755929AbeDYRSL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 13:18:11 -0400
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38724 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755245AbeDYRRm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 13:17:42 -0400
Received: by mail-wm0-f47.google.com with SMTP id i3so8124601wmf.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DXFaOdjEx0V9l1dPncML4Jbs6uTiYQZp28bsE1/Fzsw=;
        b=uDSrH8Orxx3t1lJ7zPgUtIIraIZVxNRw6uf9Wf2qPIHb8AXqZ4n/oBhVmLThjz5g3C
         +IDtHUjbcN7GDKoJhYxWYjDH/9rrC0H3a2WAcPrr5wCiIPpLRIH1iy6UKxWW2/A3lb0K
         +O0Pi16ndIA4gD2V1JSBYhSSflBwQK6nqTvYn3UEjSpxrkntjHpDIsGProR1mnbJlVyc
         +U68nfKVvYDoym4A+q488gRhvzyi3+x2PZ7UmaY3Ags8Vi/0gI2i1jDjHJCsoA5Y3rID
         5pVG9U/80LbsTQuR2L4kvFW+JFz5Qa/Ofbxuuv2xQbmel0ncY3u6/9SLtIh85LHMBC4v
         t9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DXFaOdjEx0V9l1dPncML4Jbs6uTiYQZp28bsE1/Fzsw=;
        b=I1U9jGTG1vv58L83CW2TzUchZu/phSbA29ziGW/s9uHmQvYR/L5lbYSK9f0wlnQlI4
         yaGoEEPEst4ooirbsdMVv9rWsKzH+IDWELgBGUYS3jUvreQvfmZlyVeTM8nGV+6H1OaI
         yWYb4LMLFsGnAXU0yCKrMHXb0MI/6uCbxhsW42ubLoOZRj+bL6F8bRBw4nivkQpx2qNk
         6NG9frNLAKcODcO1WSeacGf/xjjG3gNg0jx/kfNNarSC6oIPFfkddFx9+8m/5GhOQY9F
         nzqIKpl+ftHrimKlBbimquH9wlENK1M4NyiKtA8fIZBKxMyPeNjU+b18bsDIWSk1fvpM
         hwrQ==
X-Gm-Message-State: ALQs6tCpGa1pFlme5NcOszRglm5xLFR5/x8WpxlbPepk8M41uvY9Isba
        ak2o9WriclbLi0BDLVW/sIn4DA==
X-Google-Smtp-Source: AIpwx48JS0bXIVp6rHqrRbpt3OYx9oYIj5bpHMBQkLtLZgl0Y+7wnWSmXFN86OqZnupJ1w9dFItVJQ==
X-Received: by 10.167.195.132 with SMTP id k4mr13086590edq.149.1524676660746;
        Wed, 25 Apr 2018 10:17:40 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id p36sm12277957eda.43.2018.04.25.10.17.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Apr 2018 10:17:40 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
        Sargun Dhillon <sargun@sargun.me>, Thomas Graf <tgraf@suug.ch>,
        Gianluca Borello <g.borello@gmail.com>,
        Chenbo Feng <fengc@google.com>
Subject: [PATCH bpf-next v4 06/10] bpf: add documentation for eBPF helpers (42-50)
Date:   Wed, 25 Apr 2018 18:16:57 +0100
Message-Id: <20180425171701.11048-7-quentin.monnet@netronome.com>
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

This patch contains descriptions for the following helper functions:

Helper from Kaixu:
- bpf_perf_event_read()

Helpers from Martin:
- bpf_skb_under_cgroup()
- bpf_xdp_adjust_head()

Helpers from Sargun:
- bpf_probe_write_user()
- bpf_current_task_under_cgroup()

Helper from Thomas:
- bpf_skb_change_head()

Helper from Gianluca:
- bpf_probe_read_str()

Helpers from Chenbo:
- bpf_get_socket_cookie()
- bpf_get_socket_uid()

v4:
- bpf_perf_event_read(): State that bpf_perf_event_read_value() should
  be preferred over this helper.
- bpf_skb_change_head(): Clarify comment about invalidated verifier
  checks.
- bpf_xdp_adjust_head(): Clarify comment about invalidated verifier
  checks.
- bpf_probe_write_user(): Add that dst must be a valid user space
  address.
- bpf_get_socket_cookie(): Improve description by making clearer that
  the cockie belongs to the socket, and state that it remains stable for
  the life of the socket.

v3:
- bpf_perf_event_read(): Fix time of selection for perf event type in
  description. Remove occurences of "cores" to avoid confusion with
  "CPU".

Cc: Martin KaFai Lau <kafai@fb.com>
Cc: Sargun Dhillon <sargun@sargun.me>
Cc: Thomas Graf <tgraf@suug.ch>
Cc: Gianluca Borello <g.borello@gmail.com>
Cc: Chenbo Feng <fengc@google.com>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Acked-by: Martin KaFai Lau <kafai@fb.com>
[for bpf_skb_under_cgroup(), bpf_xdp_adjust_head()]
---
 include/uapi/linux/bpf.h | 172 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index d1207ba39280..f06225f3a01d 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -810,6 +810,35 @@ union bpf_attr {
  * 	Return
  * 		0 on success, or a negative error in case of failure.
  *
+ * u64 bpf_perf_event_read(struct bpf_map *map, u64 flags)
+ * 	Description
+ * 		Read the value of a perf event counter. This helper relies on a
+ * 		*map* of type **BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The nature of
+ * 		the perf event counter is selected when *map* is updated with
+ * 		perf event file descriptors. The *map* is an array whose size
+ * 		is the number of available CPUs, and each cell contains a value
+ * 		relative to one CPU. The value to retrieve is indicated by
+ * 		*flags*, that contains the index of the CPU to look up, masked
+ * 		with **BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
+ * 		**BPF_F_CURRENT_CPU** to indicate that the value for the
+ * 		current CPU should be retrieved.
+ *
+ * 		Note that before Linux 4.13, only hardware perf event can be
+ * 		retrieved.
+ *
+ * 		Also, be aware that the newer helper
+ * 		**bpf_perf_event_read_value**\ () is recommended over
+ * 		**bpf_perf_event_read*\ () in general. The latter has some ABI
+ * 		quirks where error and counter value are used as a return code
+ * 		(which is wrong to do since ranges may overlap). This issue is
+ * 		fixed with bpf_perf_event_read_value(), which at the same time
+ * 		provides more features over the **bpf_perf_event_read**\ ()
+ * 		interface. Please refer to the description of
+ * 		**bpf_perf_event_read_value**\ () for details.
+ * 	Return
+ * 		The value of the perf event counter read from the map, or a
+ * 		negative error code in case of failure.
+ *
  * int bpf_redirect(u32 ifindex, u64 flags)
  * 	Description
  * 		Redirect the packet to another net device of index *ifindex*.
@@ -1071,6 +1100,17 @@ union bpf_attr {
  * 	Return
  * 		0 on success, or a negative error in case of failure.
  *
+ * int bpf_skb_under_cgroup(struct sk_buff *skb, struct bpf_map *map, u32 index)
+ * 	Description
+ * 		Check whether *skb* is a descendant of the cgroup2 held by
+ * 		*map* of type **BPF_MAP_TYPE_CGROUP_ARRAY**, at *index*.
+ * 	Return
+ * 		The return value depends on the result of the test, and can be:
+ *
+ * 		* 0, if the *skb* failed the cgroup2 descendant test.
+ * 		* 1, if the *skb* succeeded the cgroup2 descendant test.
+ * 		* A negative error code, if an error occurred.
+ *
  * u32 bpf_get_hash_recalc(struct sk_buff *skb)
  * 	Description
  * 		Retrieve the hash of the packet, *skb*\ **->hash**. If it is
@@ -1091,6 +1131,37 @@ union bpf_attr {
  * 	Return
  * 		A pointer to the current task struct.
  *
+ * int bpf_probe_write_user(void *dst, const void *src, u32 len)
+ * 	Description
+ * 		Attempt in a safe way to write *len* bytes from the buffer
+ * 		*src* to *dst* in memory. It only works for threads that are in
+ * 		user context, and *dst* must be a valid user space address.
+ *
+ * 		This helper should not be used to implement any kind of
+ * 		security mechanism because of TOC-TOU attacks, but rather to
+ * 		debug, divert, and manipulate execution of semi-cooperative
+ * 		processes.
+ *
+ * 		Keep in mind that this feature is meant for experiments, and it
+ * 		has a risk of crashing the system and running programs.
+ * 		Therefore, when an eBPF program using this helper is attached,
+ * 		a warning including PID and process name is printed to kernel
+ * 		logs.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_current_task_under_cgroup(struct bpf_map *map, u32 index)
+ * 	Description
+ * 		Check whether the probe is being run is the context of a given
+ * 		subset of the cgroup2 hierarchy. The cgroup2 to test is held by
+ * 		*map* of type **BPF_MAP_TYPE_CGROUP_ARRAY**, at *index*.
+ * 	Return
+ * 		The return value depends on the result of the test, and can be:
+ *
+ * 		* 0, if the *skb* task belongs to the cgroup2.
+ * 		* 1, if the *skb* task does not belong to the cgroup2.
+ * 		* A negative error code, if an error occurred.
+ *
  * int bpf_skb_change_tail(struct sk_buff *skb, u32 len, u64 flags)
  * 	Description
  * 		Resize (trim or grow) the packet associated to *skb* to the
@@ -1182,6 +1253,107 @@ union bpf_attr {
  * 	Return
  * 		The id of current NUMA node.
  *
+ * int bpf_skb_change_head(struct sk_buff *skb, u32 len, u64 flags)
+ * 	Description
+ * 		Grows headroom of packet associated to *skb* and adjusts the
+ * 		offset of the MAC header accordingly, adding *len* bytes of
+ * 		space. It automatically extends and reallocates memory as
+ * 		required.
+ *
+ * 		This helper can be used on a layer 3 *skb* to push a MAC header
+ * 		for redirection into a layer 2 device.
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
+ * int bpf_xdp_adjust_head(struct xdp_buff *xdp_md, int delta)
+ * 	Description
+ * 		Adjust (move) *xdp_md*\ **->data** by *delta* bytes. Note that
+ * 		it is possible to use a negative value for *delta*. This helper
+ * 		can be used to prepare the packet for pushing or popping
+ * 		headers.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_probe_read_str(void *dst, int size, const void *unsafe_ptr)
+ * 	Description
+ * 		Copy a NUL terminated string from an unsafe address
+ * 		*unsafe_ptr* to *dst*. The *size* should include the
+ * 		terminating NUL byte. In case the string length is smaller than
+ * 		*size*, the target is not padded with further NUL bytes. If the
+ * 		string length is larger than *size*, just *size*-1 bytes are
+ * 		copied and the last byte is set to NUL.
+ *
+ * 		On success, the length of the copied string is returned. This
+ * 		makes this helper useful in tracing programs for reading
+ * 		strings, and more importantly to get its length at runtime. See
+ * 		the following snippet:
+ *
+ * 		::
+ *
+ * 			SEC("kprobe/sys_open")
+ * 			void bpf_sys_open(struct pt_regs *ctx)
+ * 			{
+ * 			        char buf[PATHLEN]; // PATHLEN is defined to 256
+ * 			        int res = bpf_probe_read_str(buf, sizeof(buf),
+ * 				                             ctx->di);
+ *
+ * 				// Consume buf, for example push it to
+ * 				// userspace via bpf_perf_event_output(); we
+ * 				// can use res (the string length) as event
+ * 				// size, after checking its boundaries.
+ * 			}
+ *
+ * 		In comparison, using **bpf_probe_read()** helper here instead
+ * 		to read the string would require to estimate the length at
+ * 		compile time, and would often result in copying more memory
+ * 		than necessary.
+ *
+ * 		Another useful use case is when parsing individual process
+ * 		arguments or individual environment variables navigating
+ * 		*current*\ **->mm->arg_start** and *current*\
+ * 		**->mm->env_start**: using this helper and the return value,
+ * 		one can quickly iterate at the right offset of the memory area.
+ * 	Return
+ * 		On success, the strictly positive length of the string,
+ * 		including the trailing NUL character. On error, a negative
+ * 		value.
+ *
+ * u64 bpf_get_socket_cookie(struct sk_buff *skb)
+ * 	Description
+ * 		If the **struct sk_buff** pointed by *skb* has a known socket,
+ * 		retrieve the cookie (generated by the kernel) of this socket.
+ * 		If no cookie has been set yet, generate a new cookie. Once
+ * 		generated, the socket cookie remains stable for the life of the
+ * 		socket. This helper can be useful for monitoring per socket
+ * 		networking traffic statistics as it provides a unique socket
+ * 		identifier per namespace.
+ * 	Return
+ * 		A 8-byte long non-decreasing number on success, or 0 if the
+ * 		socket field is missing inside *skb*.
+ *
+ * u32 bpf_get_socket_uid(struct sk_buff *skb)
+ * 	Return
+ * 		The owner UID of the socket associated to *skb*. If the socket
+ * 		is **NULL**, or if it is not a full socket (i.e. if it is a
+ * 		time-wait or a request socket instead), **overflowuid** value
+ * 		is returned (note that **overflowuid** might also be the actual
+ * 		UID value for the socket).
+ *
  * u32 bpf_set_hash(struct sk_buff *skb, u32 hash)
  * 	Description
  * 		Set the full hash for *skb* (set the field *skb*\ **->hash**)
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
