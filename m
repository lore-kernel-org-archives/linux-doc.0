Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D92717E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 14:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754037AbeDJOmf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 10:42:35 -0400
Received: from mail-wm0-f54.google.com ([74.125.82.54]:34441 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754255AbeDJOm0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 10:42:26 -0400
Received: by mail-wm0-f54.google.com with SMTP id w2so22014900wmw.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=67Wkwkw0hpGtXBlmoHYDTV+DzLn/PgcUYtarTENyPLY=;
        b=CTHrEOscwj2NJ42hYjb1h6C3LxZAlRs1Il3TkWWZ8qMYHZeIcSMmp3bXzOqkm2A6jH
         VKyVo0eOhsvlRoa66/X2LKCd5325FeOwW6SONJXJy7LgPResnVjeHUYJQcmHrpCgAawR
         BaQIyRwn6zmqTk6eMS4DfOtPWdbgOVowCbGjA5uyOcP61zMHOOl4svkGzDzv837l5X+0
         jDHLuo5K7uXpRM0CJhIOkqb/WjwNJ73UzCHofB8hOoRr6FHvTJKV2b4+BANOq0MOxWXN
         hFda8f0vft6AseF/LFZXE28s5pSJckSzfEZaUU8JBH8jBzGYs4v+FM7mQMHVzAIspLIo
         vI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=67Wkwkw0hpGtXBlmoHYDTV+DzLn/PgcUYtarTENyPLY=;
        b=XAea3TW6vhocgaN4l1amTr/6VoGMaQrFHAttJ5AvCm+8akG3dkc8OkGjU4mH3nWTes
         cSmTZTqE0uXUGie0KD00CWwucJkBFm/3PZHu8kGv880kM5d5qkSoHh1g+Eqrn9aTROyP
         DbRzc7z3zPqEmz9VDs+2bnUHHAT0IUzj/mxADoKUv83BIGFSana/62M2GEeRpaEEvYLA
         iuEnntVeDygJLuAtfWiZ+iwbSItQaLnIB6RzOnUsygwroEB5DO8EVzTbncZnMfAk5QZa
         O9Q9uywdJREs7kmEI7OKh0CjjUEvMAM+rqs+zRbIxleOeucN/T5Jo/wIYr3kpLl0OyIl
         WEfQ==
X-Gm-Message-State: ALQs6tDUidSqGxm3wfNS6ocvsL31ZIieG0GA3za4v2XpJjbz411+GwX0
        hGgqrxK3pifRLiiUvG5LSIcPhw==
X-Google-Smtp-Source: AIpwx4+wPVnHpp80QQm3UiAjyBJR7x+dyPqO7z/FUjLpGURJRuvoXURVPw8r1u6R+fSWkQt9lFdKhw==
X-Received: by 10.80.183.144 with SMTP id h16mr3729428ede.96.1523371345420;
        Tue, 10 Apr 2018 07:42:25 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id i17sm1948907ede.13.2018.04.10.07.42.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 07:42:24 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org, Kaixu Xia <xiakaixu@huawei.com>,
        Martin KaFai Lau <kafai@fb.com>,
        Sargun Dhillon <sargun@sargun.me>, Thomas Graf <tgraf@suug.ch>,
        Gianluca Borello <g.borello@gmail.com>,
        Chenbo Feng <fengc@google.com>
Subject: [RFC bpf-next v2 6/8] bpf: add documentation for eBPF helpers (42-50)
Date:   Tue, 10 Apr 2018 15:41:55 +0100
Message-Id: <20180410144157.4831-7-quentin.monnet@netronome.com>
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

Cc: Kaixu Xia <xiakaixu@huawei.com>
Cc: Martin KaFai Lau <kafai@fb.com>
Cc: Sargun Dhillon <sargun@sargun.me>
Cc: Thomas Graf <tgraf@suug.ch>
Cc: Gianluca Borello <g.borello@gmail.com>
Cc: Chenbo Feng <fengc@google.com>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h | 158 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index af429ec79f50..15d9ccafebbe 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -701,6 +701,25 @@ union bpf_attr {
  * 	Return
  * 		0 on success, or a negative error in case of failure.
  *
+ * u64 bpf_perf_event_read(struct bpf_map *map, u64 flags)
+ * 	Description
+ * 		Read the value of a perf event counter. This helper relies on a
+ * 		*map* of type **BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The
+ * 		nature of the perf event counter is selected at the creation of
+ * 		the *map*. The *map* is an array whose size is the number of
+ * 		available CPU cores, and each cell contains a value relative to
+ * 		one core. The value to retrieve is indicated by *flags*, that
+ * 		contains the index of the core to look up, masked with
+ * 		**BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
+ * 		**BPF_F_CURRENT_CPU** to indicate that the value for the
+ * 		current CPU core should be retrieved.
+ *
+ * 		Note that before Linux 4.13, only hardware perf event can be
+ * 		retrieved.
+ * 	Return
+ * 		The value of the perf event counter read from the map, or a
+ * 		negative error code in case of failure.
+ *
  * int bpf_redirect(u32 ifindex, u64 flags)
  * 	Description
  * 		Redirect the packet to another net device of index *ifindex*.
@@ -939,6 +958,17 @@ union bpf_attr {
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
@@ -959,6 +989,37 @@ union bpf_attr {
  * 	Return
  * 		A pointer to the current task struct.
  *
+ * int bpf_probe_write_user(void *dst, const void *src, u32 len)
+ * 	Description
+ * 		Attempt in a safe way to write *len* bytes from the buffer
+ * 		*src* to *dst* in memory. It only works for threads that are in
+ * 		user context.
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
@@ -1043,6 +1104,103 @@ union bpf_attr {
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
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
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
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
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
+ * 		Retrieve the socket cookie generated by the kernel from a
+ * 		**struct sk_buff** with a known socket. If none has been set
+ * 		yet, generate a new cookie. This helper can be useful for
+ * 		monitoring per socket networking traffic statistics as it
+ * 		provides a unique socket identifier per namespace.
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
