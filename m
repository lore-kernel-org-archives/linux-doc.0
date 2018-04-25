Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 733687E677
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 17:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755311AbeDYRTO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 13:19:14 -0400
Received: from mail-wm0-f48.google.com ([74.125.82.48]:39464 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755703AbeDYRRe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 13:17:34 -0400
Received: by mail-wm0-f48.google.com with SMTP id b21so8166785wme.4
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IyNlqo9BWy4nX02eUTkozmtF+EzXdffeETnPBZbu4qo=;
        b=jMGCE8p4ZiuCAvGEzHx0GagAroBfnpFnlBMgvJMBDxt0hjCqh4aicHvA1dqP/lZ2Zs
         hUfdihKm3nINUZczFxzsZt6ASjhQY5yv8XwF2YUbOzegnJK7P7ecTEm8JzboFF+zrP3g
         XVUr/zqVhsiFhK9g5fcMhIyqwnrYRNhDGhg19XcER5PAwb0ohsVC35dJcOY64uTY3ctS
         BEV8Qvah6/NDUyAAO8jgTOimF9JsGrWbll0oDe5a6b2cLRmfuw9tmVAoOux9wEoceifm
         c+LVH3C74hUQJskR3Y7cQAtVb2XAiDvzpFL62R3oecMOaGTTAkh0wg+241B35jezijiD
         guGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IyNlqo9BWy4nX02eUTkozmtF+EzXdffeETnPBZbu4qo=;
        b=Ii0RRpRw5gacXuHxdJjvksP9qj5/A+xtSLqDTX7va9GG6cFo9Kqaj5I4ujuYZGXBFy
         1MCFlVO6UnlVipB4FYw9xG4sWiGEDhBtwrv+3PHjYZJzWNmxivb0Wh6GO7Tyj85oRE2M
         VEawIMItQIjO6oI9hiAOabMHj96icWYyYIu/rJ9XEpjMNMopTPoWQxiS5Dvj9FLyVRmq
         QW3T8xuQT6CvVo9Ro9xIS+E6eAD7foT15ViRQOdjI+dfGUJS1nTPWViiRXURS66Im4zW
         99sOiBSR9hz/wOr0Aa6D8uL2DjofCeZzuu0goOmnArcjfkUiU4b+UMIxsbiNWtdTiduR
         3z2w==
X-Gm-Message-State: ALQs6tDUaE0t7bLnePWjVdaqHLD84l5ZY7eieBpcp3AewSkBui1v3Z//
        UOjmGm9tkqTgN0KjTD+QS9Ke4w==
X-Google-Smtp-Source: AIpwx4/64X2Q8ZwHwlKnaOTpSVekt2TERfk3XPAJWqEqfNt5uPEwuWruarfvv2KOEfR4tj4veujjPA==
X-Received: by 10.80.245.25 with SMTP id t25mr39401896edm.42.1524676653267;
        Wed, 25 Apr 2018 10:17:33 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id p36sm12277957eda.43.2018.04.25.10.17.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Apr 2018 10:17:32 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: [PATCH bpf-next v4 02/10] bpf: add documentation for eBPF helpers (01-11)
Date:   Wed, 25 Apr 2018 18:16:53 +0100
Message-Id: <20180425171701.11048-3-quentin.monnet@netronome.com>
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

v4:
- bpf_map_lookup_elem(): Add "const" qualifier for key.
- bpf_map_update_elem(): Add "const" qualifier for key and value.
- bpf_map_lookup_elem(): Add "const" qualifier for key.
- bpf_skb_store_bytes(): Clarify comment about invalidated verifier
  checks.
- bpf_l3_csum_replace(): Mention L3 instead of just IP, and add a note
  about bpf_csum_diff().
- bpf_l4_csum_replace(): Mention L4 instead of just TCP/UDP, and add a
  note about bpf_csum_diff().
- bpf_tail_call(): Bring minor edits to description.
- bpf_clone_redirect(): Add a note about the relation with
  bpf_redirect(). Also clarify comment about invalidated verifier
  checks.

v3:
- bpf_map_lookup_elem(): Fix description of restrictions for flags
  related to the existence of the entry.
- bpf_trace_printk(): State that trace_pipe can be configured. Fix
  return value in case an unknown format specifier is met. Add a note on
  kernel log notice when the helper is used. Edit example.
- bpf_tail_call(): Improve comment on stack inheritance.
- bpf_clone_redirect(): Improve description of BPF_F_INGRESS flag.

Cc: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
Acked-by: Alexei Starovoitov <ast@kernel.org>
---
 include/uapi/linux/bpf.h | 230 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 230 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index df28a60d314c..6ac56df3ea8d 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -393,6 +393,236 @@ union bpf_attr {
  * intentional, removing them would break paragraphs for rst2man.
  *
  * Start of BPF helper function descriptions:
+ *
+ * void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
+ * 	Description
+ * 		Perform a lookup in *map* for an entry associated to *key*.
+ * 	Return
+ * 		Map value associated to *key*, or **NULL** if no entry was
+ * 		found.
+ *
+ * int bpf_map_update_elem(struct bpf_map *map, const void *key, const void *value, u64 flags)
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
+ * 		Flag value **BPF_NOEXIST** cannot be used for maps of types
+ * 		**BPF_MAP_TYPE_ARRAY** or **BPF_MAP_TYPE_PERCPU_ARRAY**  (all
+ * 		elements always exist), the helper would return an error.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_map_delete_elem(struct bpf_map *map, const void *key)
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
+ * 		limited to five).
+ *
+ * 		Each time the helper is called, it appends a line to the trace.
+ * 		The format of the trace is customizable, and the exact output
+ * 		one will get depends on the options set in
+ * 		*\/sys/kernel/debug/tracing/trace_options* (see also the
+ * 		*README* file under the same directory). However, it usually
+ * 		defaults to something like:
+ *
+ * 		::
+ *
+ * 			telnet-470   [001] .N.. 419421.045894: 0x00000001: <formatted msg>
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
+ * 			* ``<formatted msg>`` is the message formatted with
+ * 			  *fmt*.
+ *
+ * 		The conversion specifiers supported by *fmt* are similar, but
+ * 		more limited than for printk(). They are **%d**, **%i**,
+ * 		**%u**, **%x**, **%ld**, **%li**, **%lu**, **%lx**, **%lld**,
+ * 		**%lli**, **%llu**, **%llx**, **%p**, **%s**. No modifier (size
+ * 		of field, padding with zeroes, etc.) is available, and the
+ * 		helper will return **-EINVAL** (but print nothing) if it
+ * 		encounters an unknown specifier.
+ *
+ * 		Also, note that **bpf_trace_printk**\ () is slow, and should
+ * 		only be used for debugging purposes. For this reason, a notice
+ * 		bloc (spanning several lines) is printed to kernel logs and
+ * 		states that the helper should not be used "for production use"
+ * 		the first time this helper is used (or more precisely, when
+ * 		**trace_printk**\ () buffers are allocated). For passing values
+ * 		to user space, perf events should be preferred.
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
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_l3_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 size)
+ * 	Description
+ * 		Recompute the layer 3 (e.g. IP) checksum for the packet
+ * 		associated to *skb*. Computation is incremental, so the helper
+ * 		must know the former value of the header field that was
+ * 		modified (*from*), the new value of this field (*to*), and the
+ * 		number of bytes (2 or 4) for this field, stored in *size*.
+ * 		Alternatively, it is possible to store the difference between
+ * 		the previous and the new values of the header field in *to*, by
+ * 		setting *from* and *size* to 0. For both methods, *offset*
+ * 		indicates the location of the IP checksum within the packet.
+ *
+ * 		This helper works in combination with **bpf_csum_diff**\ (),
+ * 		which does not update the checksum in-place, but offers more
+ * 		flexibility and can handle sizes larger than 2 or 4 for the
+ * 		checksum to update.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_l4_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 flags)
+ * 	Description
+ * 		Recompute the layer 4 (e.g. TCP, UDP or ICMP) checksum for the
+ * 		packet associated to *skb*. Computation is incremental, so the
+ * 		helper must know the former value of the header field that was
+ * 		modified (*from*), the new value of this field (*to*), and the
+ * 		number of bytes (2 or 4) for this field, stored on the lowest
+ * 		four bits of *flags*. Alternatively, it is possible to store
+ * 		the difference between the previous and the new values of the
+ * 		header field in *to*, by setting *from* and the four lowest
+ * 		bits of *flags* to 0. For both methods, *offset* indicates the
+ * 		location of the IP checksum within the packet. In addition to
+ * 		the size of the field, *flags* can be added (bitwise OR) actual
+ * 		flags. With **BPF_F_MARK_MANGLED_0**, a null checksum is left
+ * 		untouched (unless **BPF_F_MARK_ENFORCE** is added as well), and
+ * 		for updates resulting in a null checksum the value is set to
+ * 		**CSUM_MANGLED_0** instead. Flag **BPF_F_PSEUDO_HDR** indicates
+ * 		the checksum is to be computed against a pseudo-header.
+ *
+ * 		This helper works in combination with **bpf_csum_diff**\ (),
+ * 		which does not update the checksum in-place, but offers more
+ * 		flexibility and can handle sizes larger than 2 or 4 for the
+ * 		checksum to update.
+ *
+ * 		A call to this helper is susceptible to change the underlaying
+ * 		packet buffer. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again, if the helper is used in combination with
+ * 		direct packet access.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_tail_call(void *ctx, struct bpf_map *prog_array_map, u32 index)
+ * 	Description
+ * 		This special helper is used to trigger a "tail call", or in
+ * 		other words, to jump into another eBPF program. The same stack
+ * 		frame is used (but values on stack and in registers for the
+ * 		caller are not accessible to the callee). This mechanism allows
+ * 		for program chaining, either for raising the maximum number of
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
+ * 		and it never returns to the previous program. If the call
+ * 		fails, then the helper has no effect, and the caller continues
+ * 		to run its subsequent instructions. A call can fail if the
+ * 		destination program for the jump does not exist (i.e. *index*
+ * 		is superior to the number of entries in *prog_array_map*), or
+ * 		if the maximum number of tail calls has been reached for this
+ * 		chain of programs. This limit is defined in the kernel by the
+ * 		macro **MAX_TAIL_CALL_CNT** (not accessible to user space),
+ * 		which is currently set to 32.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_clone_redirect(struct sk_buff *skb, u32 ifindex, u64 flags)
+ * 	Description
+ * 		Clone and redirect the packet associated to *skb* to another
+ * 		net device of index *ifindex*. Both ingress and egress
+ * 		interfaces can be used for redirection. The **BPF_F_INGRESS**
+ * 		value in *flags* is used to make the distinction (ingress path
+ * 		is selected if the flag is present, egress path otherwise).
+ * 		This is the only flag supported for now.
+ *
+ * 		In comparison with **bpf_redirect**\ () helper,
+ * 		**bpf_clone_redirect**\ () has the associated cost of
+ * 		duplicating the packet buffer, but this can be executed out of
+ * 		the eBPF program. Conversely, **bpf_redirect**\ () is more
+ * 		efficient, but it is handled through an action code where the
+ * 		redirection happens only after the eBPF program has returned.
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
