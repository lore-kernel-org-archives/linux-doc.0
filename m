Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 94DFD7E8C1
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 14:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754239AbeDJOnD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 10:43:03 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36200 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754000AbeDJOmV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 10:42:21 -0400
Received: by mail-wm0-f67.google.com with SMTP id x82so23840052wmg.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6eZ6TWyJ1ORNNJX1bQauBCIt5U/Xdl1xMOVtoscXZTI=;
        b=Uvv2o6+4uE1KzBR2TWObpWMYZ3JPJjgshULqh0shwJ850bkjNZUdHFShFbJGwBBwXb
         sSqM5c9Gw8/a+dekXkMInYNROJAWKrGgFWhcDcmiZvHM16BojpeQq8APNk4wo8HxKtNe
         r7JwQM6Xv0MpKb7/zt4SPD68/84bXrbye6j+7LwmCvx31+Veg+xcf7gGzT25kKnWIVNk
         sdC2porQKeIHBWTYPQfSFdJ0sAAK422Peoh4LIEG81p44LCp3XY9E7UFYdTBp8mndvOu
         5095BGaDqrc68hEI+6LrntwedqSOpMiwea5odg3jvsY9C/SalH6EZDSwdOys7tTqjo4P
         TWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6eZ6TWyJ1ORNNJX1bQauBCIt5U/Xdl1xMOVtoscXZTI=;
        b=c8bPzVutyTdlReXpu7UjHy33wgNL3hRhxRTksxP49/2mziEYLb5RCubITRRFUoT4Rc
         uo9hce90+3NyTL6LUBiLVGEXyo5+0D8myXsvgU/XumuCB/jQw0bg5oY+sLFT1ZKlfQws
         ILtT+C8gLpCs/sdE2TcnfJWJIV9EFIjp9XTKrZjB/tcIad9m4TTmIBelbxLLw/ZH47uw
         0+/I9uxYG5L1fj0t59MwUkgKjav/KzcvtBQdXpisYwpNiyANd3VNvL8h/MR7bZcUB9Mt
         C3WJIUTl+iu+92HG756XX/vhym9gL0wO6K+ZB1a1i846wpHUi1HXsxJUa3rbJmlOuqms
         sezA==
X-Gm-Message-State: ALQs6tA8XNnK3qT1ts6jZVGyhvUSYpHi69+e5fnrpMAAbtIHs//oPJrj
        1Z9TVGIxSdUT4ze3/dqiUyN4pw==
X-Google-Smtp-Source: AIpwx4+Wk3xIWURllJD+x9lsgjHZfjiSYvNXY1ftDGViEYdwUuI6tURSOu1NvgUMSQW4pq2edbP96A==
X-Received: by 10.80.138.213 with SMTP id k21mr3653971edk.181.1523371340054;
        Tue, 10 Apr 2018 07:42:20 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id i17sm1948907ede.13.2018.04.10.07.42.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 07:42:19 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [RFC bpf-next v2 2/8] bpf: add documentation for eBPF helpers (01-11)
Date:   Tue, 10 Apr 2018 15:41:51 +0100
Message-Id: <20180410144157.4831-3-quentin.monnet@netronome.com>
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
written by Alexei:

- bpf_map_lookup_elem()
- bpf_map_update_elem()
- bpf_map_delete_elem()
- bpf_probe_read()
- bpf_ktime_get_ns()
- bpf_trace_printk()
- bpf_skb_store_bytes()
- bpf_l3_csum_replace()
- bpf_l4_csum_replace()
- bpf_tail_call()
- bpf_clone_redirect()

Cc: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h | 199 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 45f77f01e672..2bc653a3a20f 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -381,6 +381,205 @@ union bpf_attr {
  * intentional, removing them would break paragraphs for rst2man.
  *
  * Start of BPF helper function descriptions:
+ *
+ * void *bpf_map_lookup_elem(struct bpf_map *map, void *key)
+ * 	Description
+ * 		Perform a lookup in *map* for an entry associated to *key*.
+ * 	Return
+ * 		Map value associated to *key*, or **NULL** if no entry was
+ * 		found.
+ *
+ * int bpf_map_update_elem(struct bpf_map *map, void *key, void *value, u64 flags)
+ * 	Description
+ * 		Add or update the value of the entry associated to *key* in
+ * 		*map* with *value*. *flags* is one of:
+ *
+ * 		**BPF_NOEXIST**
+ * 			The entry for *key* must not exist in the map.
+ * 		**BPF_EXIST**
+ * 			The entry for *key* must already exist in the map.
+ * 		**BPF_ANY**
+ * 			No condition on the existence of the entry for *key*.
+ *
+ * 		These flags are only useful for maps of type
+ * 		**BPF_MAP_TYPE_HASH**. For all other map types, **BPF_ANY**
+ * 		should be used.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_map_delete_elem(struct bpf_map *map, void *key)
+ * 	Description
+ * 		Delete entry with *key* from *map*.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_probe_read(void *dst, u32 size, const void *src)
+ * 	Description
+ * 		For tracing programs, safely attempt to read *size* bytes from
+ * 		address *src* and store the data in *dst*.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * u64 bpf_ktime_get_ns(void)
+ * 	Description
+ * 		Return the time elapsed since system boot, in nanoseconds.
+ * 	Return
+ * 		Current *ktime*.
+ *
+ * int bpf_trace_printk(const char *fmt, u32 fmt_size, ...)
+ * 	Description
+ * 		This helper is a "printk()-like" facility for debugging. It
+ * 		prints a message defined by format *fmt* (of size *fmt_size*)
+ * 		to file *\/sys/kernel/debug/tracing/trace* from DebugFS, if
+ * 		available. It can take up to three additional **u64**
+ * 		arguments (as an eBPF helpers, the total number of arguments is
+ * 		limited to five). Each time the helper is called, it appends a
+ * 		line that looks like the following:
+ *
+ * 		::
+ *
+ * 			telnet-470   [001] .N.. 419421.045894: 0x00000001: BPF command: 2
+ *
+ * 		In the above:
+ *
+ * 			* ``telnet`` is the name of the current task.
+ * 			* ``470`` is the PID of the current task.
+ * 			* ``001`` is the CPU number on which the task is
+ * 			  running.
+ * 			* In ``.N..``, each character refers to a set of
+ * 			  options (whether irqs are enabled, scheduling
+ * 			  options, whether hard/softirqs are running, level of
+ * 			  preempt_disabled respectively). **N** means that
+ * 			  **TIF_NEED_RESCHED** and **PREEMPT_NEED_RESCHED**
+ * 			  are set.
+ * 			* ``419421.045894`` is a timestamp.
+ * 			* ``0x00000001`` is a fake value used by BPF for the
+ * 			  instruction pointer register.
+ * 			* ``BPF command: 2`` is the message formatted with
+ * 			  *fmt*.
+ *
+ * 		The conversion specifiers supported by *fmt* are similar, but
+ * 		more limited than for printk(). They are **%d**, **%i**,
+ * 		**%u**, **%x**, **%ld**, **%li**, **%lu**, **%lx**, **%lld**,
+ * 		**%lli**, **%llu**, **%llx**, **%p**, **%s**. No modifier (size
+ * 		of field, padding with zeroes, etc.) is available, and the
+ * 		helper will silently fail if it encounters an unknown
+ * 		specifier.
+ *
+ * 		Also, note that **bpf_trace_printk**\ () is slow, and should
+ * 		only be used for debugging purposes. For passing values to user
+ * 		space, perf events should be preferred.
+ * 	Return
+ * 		The number of bytes written to the buffer, or a negative error
+ * 		in case of failure.
+ *
+ * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
+ * 	Description
+ * 		Store *len* bytes from address *from* into the packet
+ * 		associated to *skb*, at *offset*. *flags* are a combination of
+ * 		**BPF_F_RECOMPUTE_CSUM** (automatically recompute the
+ * 		checksum for the packet after storing the bytes) and
+ * 		**BPF_F_INVALIDATE_HASH** (set *skb*\ **->hash**, *skb*\
+ * 		**->swhash** and *skb*\ **->l4hash** to 0).
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_l3_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 size)
+ * 	Description
+ * 		Recompute the IP checksum for the packet associated to *skb*.
+ * 		Computation is incremental, so the helper must know the former
+ * 		value of the header field that was modified (*from*), the new
+ * 		value of this field (*to*), and the number of bytes (2 or 4)
+ * 		for this field, stored in *size*. Alternatively, it is possible
+ * 		to store the difference between the previous and the new values
+ * 		of the header field in *to*, by setting *from* and *size* to 0.
+ * 		For both methods, *offset* indicates the location of the IP
+ * 		checksum within the packet.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_l4_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 flags)
+ * 	Description
+ * 		Recompute the TCP or UDP checksum for the packet associated to
+ * 		*skb*. Computation is incremental, so the helper must know the
+ * 		former value of the header field that was modified (*from*),
+ * 		the new value of this field (*to*), and the number of bytes (2
+ * 		or 4) for this field, stored on the lowest four bits of
+ * 		*flags*. Alternatively, it is possible to store the difference
+ * 		between the previous and the new values of the header field in
+ * 		*to*, by setting *from* and the four lowest bits of *flags* to
+ * 		0. For both methods, *offset* indicates the location of the IP
+ * 		checksum within the packet. In addition to the size of the
+ * 		field, *flags* can be added (bitwise OR) actual flags. With
+ * 		**BPF_F_MARK_MANGLED_0**, a null checksum is left untouched
+ * 		(unless **BPF_F_MARK_ENFORCE** is added as well), and for
+ * 		updates resulting in a null checksum the value is set to
+ * 		**CSUM_MANGLED_0** instead. Flag **BPF_F_PSEUDO_HDR**
+ * 		indicates the checksum is to be computed against a
+ * 		pseudo-header.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_tail_call(void *ctx, struct bpf_map *prog_array_map, u32 index)
+ * 	Description
+ * 		This special helper is used to trigger a "tail call", or in
+ * 		other words, to jump into another eBPF program. The contents of
+ * 		eBPF registers and stack are not modified, the new program
+ * 		"inherits" them from the caller. This mechanism allows for
+ * 		program chaining, either for raising the maximum number of
+ * 		available eBPF instructions, or to execute given programs in
+ * 		conditional blocks. For security reasons, there is an upper
+ * 		limit to the number of successive tail calls that can be
+ * 		performed.
+ *
+ * 		Upon call of this helper, the program attempts to jump into a
+ * 		program referenced at index *index* in *prog_array_map*, a
+ * 		special map of type **BPF_MAP_TYPE_PROG_ARRAY**, and passes
+ * 		*ctx*, a pointer to the context.
+ *
+ * 		If the call succeeds, the kernel immediately runs the first
+ * 		instruction of the new program. This is not a function call,
+ * 		and it never goes back to the previous program. If the call
+ * 		fails, then the helper has no effect, and the caller continues
+ * 		to run its own instructions. A call can fail if the destination
+ * 		program for the jump does not exist (i.e. *index* is superior
+ * 		to the number of entries in *prog_array_map*), or if the
+ * 		maximum number of tail calls has been reached for this chain of
+ * 		programs. This limit is defined in the kernel by the macro
+ * 		**MAX_TAIL_CALL_CNT** (not accessible to user space), which
+ * 		is currently set to 32.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_clone_redirect(struct sk_buff *skb, u32 ifindex, u64 flags)
+ * 	Description
+ * 		Clone and redirect the packet associated to *skb* to another
+ * 		net device of index *ifindex*. The only flag supported for now
+ * 		is **BPF_F_INGRESS**, which indicates the packet is to be
+ * 		redirected to the ingress interface instead of (by default)
+ * 		egress.
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
