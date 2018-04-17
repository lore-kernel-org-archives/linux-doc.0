Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF5AC7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 14:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752067AbeDQOgE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 10:36:04 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33817 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753087AbeDQOfb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 10:35:31 -0400
Received: by mail-wr0-f193.google.com with SMTP id d19so36210944wre.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 07:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2WPKij4WVfcZ5/hFKHA90WbT8xlHY0Em1SJCF0WeHIw=;
        b=twumtMEOe+XsHZWENeMJqg8gg5gvJ1kUHBek+0WAbBIUUoNcnvVjA8hyl+8PjgYGzj
         OnfERBPuo1ddO0TvVGq49ePWl5tRlygXuJaburj8ODj6iSuF0z3QVG+EIUsu/ByVh+te
         vEARjZn0mUvNHP5I4bVH2JcvOqWwa89w2dOJC+B7B+yWhct1fZplAExSxSAH5qlHLwIQ
         KQdiH1/Lfm9FeYY1Q0wCxFd3rsDTWvEzv/Wck9N9wxs6JOUwGtBnINN+hgkw9Umh+TCh
         3NUkJMdY5f7bBURs3uqJ0NQSoQOOsmYyim9VJapm6HC+o7Sr+07f69dspymdGfFi405e
         iRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2WPKij4WVfcZ5/hFKHA90WbT8xlHY0Em1SJCF0WeHIw=;
        b=OL2zq+wWsZlSTUemRn0tE/IJ3XkwFtNF3LiwUJiWGy5BPfkLAAoPS4hX3u6t/seiho
         3/5wXcUKCiceeR63oBemgaytRU01E7s34umqb97LNdAYvyUMwQWu3+vttpiofJFbKJgv
         IzMGXDPHnZm6HiQrucbZjKBFz+cBs9UPj7FSntjT3MEsqOI1zMUXPT5nxigXa6Sm040y
         kgLcgBQyK2jTjK54jylbLg5Skvks4DbPP7vfKS8tnFKaPE891xbGd94qBjMWe9zHwnu/
         5Ddox9leSpXRkrLM0YNC/JnsRIvWEdMbCFyF+stAfRj9/76avrPsuIDb1ThiHgfxL25J
         wmKA==
X-Gm-Message-State: ALQs6tCPqzEDTREZCo1A3gslUgvcJnQ2IETUiQvjxZiyFTh+Vs54CVhJ
        2uyT5GUobY+6Ua3ZMIqLkyE5XA==
X-Google-Smtp-Source: AIpwx49aDAeW0+oxnFegbJ4+dhVe0i4woKfLcAT9jsE1/WbRQMlZWgnASO1TdRb4fswLSFOg9znC9g==
X-Received: by 10.80.179.175 with SMTP id s44mr235731edd.28.1523975730124;
        Tue, 17 Apr 2018 07:35:30 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id o16sm9340240edc.33.2018.04.17.07.35.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Apr 2018 07:35:29 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org, Lawrence Brakmo <brakmo@fb.com>,
        Yonghong Song <yhs@fb.com>, Josef Bacik <jbacik@fb.com>,
        Andrey Ignatov <rdna@fb.com>
Subject: [PATCH bpf-next v3 7/8] bpf: add documentation for eBPF helpers (51-57)
Date:   Tue, 17 Apr 2018 15:34:37 +0100
Message-Id: <20180417143438.7018-8-quentin.monnet@netronome.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180417143438.7018-1-quentin.monnet@netronome.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
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

Helpers from Lawrence:
- bpf_setsockopt()
- bpf_getsockopt()
- bpf_sock_ops_cb_flags_set()

Helpers from Yonghong:
- bpf_perf_event_read_value()
- bpf_perf_prog_read_value()

Helper from Josef:
- bpf_override_return()

Helper from Andrey:
- bpf_bind()

v3:
- bpf_perf_event_read_value(): Fix time of selection for perf event type
  in description. Remove occurences of "cores" to avoid confusion with
  "CPU".
- bpf_bind(): Remove last paragraph of description, which was off topic.

Cc: Lawrence Brakmo <brakmo@fb.com>
Cc: Yonghong Song <yhs@fb.com>
Cc: Josef Bacik <jbacik@fb.com>
Cc: Andrey Ignatov <rdna@fb.com>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

fix patch 7: Yonghong and Andrey
---
 include/uapi/linux/bpf.h | 178 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index dd79a1c82adf..350459c583de 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -1234,6 +1234,28 @@ union bpf_attr {
  * 	Return
  * 		0
  *
+ * int bpf_setsockopt(struct bpf_sock_ops_kern *bpf_socket, int level, int optname, char *optval, int optlen)
+ * 	Description
+ * 		Emulate a call to **setsockopt()** on the socket associated to
+ * 		*bpf_socket*, which must be a full socket. The *level* at
+ * 		which the option resides and the name *optname* of the option
+ * 		must be specified, see **setsockopt(2)** for more information.
+ * 		The option value of length *optlen* is pointed by *optval*.
+ *
+ * 		This helper actually implements a subset of **setsockopt()**.
+ * 		It supports the following *level*\ s:
+ *
+ * 		* **SOL_SOCKET**, which supports the following *optname*\ s:
+ * 		  **SO_RCVBUF**, **SO_SNDBUF**, **SO_MAX_PACING_RATE**,
+ * 		  **SO_PRIORITY**, **SO_RCVLOWAT**, **SO_MARK**.
+ * 		* **IPPROTO_TCP**, which supports the following *optname*\ s:
+ * 		  **TCP_CONGESTION**, **TCP_BPF_IW**,
+ * 		  **TCP_BPF_SNDCWND_CLAMP**.
+ * 		* **IPPROTO_IP**, which supports *optname* **IP_TOS**.
+ * 		* **IPPROTO_IPV6**, which supports *optname* **IPV6_TCLASS**.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
  * int bpf_skb_adjust_room(struct sk_buff *skb, u32 len_diff, u32 mode, u64 flags)
  * 	Description
  * 		Grow or shrink the room for data in the packet associated to
@@ -1281,6 +1303,162 @@ union bpf_attr {
  * 		performed again.
  * 	Return
  * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_perf_event_read_value(struct bpf_map *map, u64 flags, struct bpf_perf_event_value *buf, u32 buf_size)
+ * 	Description
+ * 		Read the value of a perf event counter, and store it into *buf*
+ * 		of size *buf_size*. This helper relies on a *map* of type
+ * 		**BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The nature of the perf event
+ * 		counter is selected when *map* is updated with perf event file
+ * 		descriptors. The *map* is an array whose size is the number of
+ * 		available CPUs, and each cell contains a value relative to one
+ * 		CPU. The value to retrieve is indicated by *flags*, that
+ * 		contains the index of the CPU to look up, masked with
+ * 		**BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
+ * 		**BPF_F_CURRENT_CPU** to indicate that the value for the
+ * 		current CPU should be retrieved.
+ *
+ * 		This helper behaves in a way close to
+ * 		**bpf_perf_event_read**\ () helper, save that instead of
+ * 		just returning the value observed, it fills the *buf*
+ * 		structure. This allows for additional data to be retrieved: in
+ * 		particular, the enabled and running times (in *buf*\
+ * 		**->enabled** and *buf*\ **->running**, respectively) are
+ * 		copied.
+ *
+ * 		These values are interesting, because hardware PMU (Performance
+ * 		Monitoring Unit) counters are limited resources. When there are
+ * 		more PMU based perf events opened than available counters,
+ * 		kernel will multiplex these events so each event gets certain
+ * 		percentage (but not all) of the PMU time. In case that
+ * 		multiplexing happens, the number of samples or counter value
+ * 		will not reflect the case compared to when no multiplexing
+ * 		occurs. This makes comparison between different runs difficult.
+ * 		Typically, the counter value should be normalized before
+ * 		comparing to other experiments. The usual normalization is done
+ * 		as follows.
+ *
+ * 		::
+ *
+ * 			normalized_counter = counter * t_enabled / t_running
+ *
+ * 		Where t_enabled is the time enabled for event and t_running is
+ * 		the time running for event since last normalization. The
+ * 		enabled and running times are accumulated since the perf event
+ * 		open. To achieve scaling factor between two invocations of an
+ * 		eBPF program, users can can use CPU id as the key (which is
+ * 		typical for perf array usage model) to remember the previous
+ * 		value and do the calculation inside the eBPF program.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_perf_prog_read_value(struct bpf_perf_event_data_kern *ctx, struct bpf_perf_event_value *buf, u32 buf_size)
+ * 	Description
+ * 		For en eBPF program attached to a perf event, retrieve the
+ * 		value of the event counter associated to *ctx* and store it in
+ * 		the structure pointed by *buf* and of size *buf_size*. Enabled
+ * 		and running times are also stored in the structure (see
+ * 		description of helper **bpf_perf_event_read_value**\ () for
+ * 		more details).
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_getsockopt(struct bpf_sock_ops_kern *bpf_socket, int level, int optname, char *optval, int optlen)
+ * 	Description
+ * 		Emulate a call to **getsockopt()** on the socket associated to
+ * 		*bpf_socket*, which must be a full socket. The *level* at
+ * 		which the option resides and the name *optname* of the option
+ * 		must be specified, see **getsockopt(2)** for more information.
+ * 		The retrieved value is stored in the structure pointed by
+ * 		*opval* and of length *optlen*.
+ *
+ * 		This helper actually implements a subset of **getsockopt()**.
+ * 		It supports the following *level*\ s:
+ *
+ * 		* **IPPROTO_TCP**, which supports *optname*
+ * 		  **TCP_CONGESTION**.
+ * 		* **IPPROTO_IP**, which supports *optname* **IP_TOS**.
+ * 		* **IPPROTO_IPV6**, which supports *optname* **IPV6_TCLASS**.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
+ * int bpf_override_return(struct pt_reg *regs, u64 rc)
+ * 	Description
+ * 		Used for error injection, this helper uses kprobes to override
+ * 		the return value of the probed function, and to set it to *rc*.
+ * 		The first argument is the context *regs* on which the kprobe
+ * 		works.
+ *
+ * 		This helper works by setting setting the PC (program counter)
+ * 		to an override function which is run in place of the original
+ * 		probed function. This means the probed function is not run at
+ * 		all. The replacement function just returns with the required
+ * 		value.
+ *
+ * 		This helper has security implications, and thus is subject to
+ * 		restrictions. It is only available if the kernel was compiled
+ * 		with the **CONFIG_BPF_KPROBE_OVERRIDE** configuration
+ * 		option, and in this case it only works on functions tagged with
+ * 		**ALLOW_ERROR_INJECTION** in the kernel code.
+ *
+ * 		Also, the helper is only available for the architectures having
+ * 		the CONFIG_FUNCTION_ERROR_INJECTION option. As of this writing,
+ * 		x86 architecture is the only one to support this feature.
+ * 	Return
+ * 		0
+ *
+ * int bpf_sock_ops_cb_flags_set(struct bpf_sock_ops_kern *bpf_sock, int argval)
+ * 	Description
+ * 		Attempt to set the value of the **bpf_sock_ops_cb_flags** field
+ * 		for the full TCP socket associated to *bpf_sock_ops* to
+ * 		*argval*.
+ *
+ * 		The primary use of this field is to determine if there should
+ * 		be calls to eBPF programs of type
+ * 		**BPF_PROG_TYPE_SOCK_OPS** at various points in the TCP
+ * 		code. A program of the same type can change its value, per
+ * 		connection and as necessary, when the connection is
+ * 		established. This field is directly accessible for reading, but
+ * 		this helper must be used for updates in order to return an
+ * 		error if an eBPF program tries to set a callback that is not
+ * 		supported in the current kernel.
+ *
+ * 		The supported callback values that *argval* can combine are:
+ *
+ * 		* **BPF_SOCK_OPS_RTO_CB_FLAG** (retransmission time out)
+ * 		* **BPF_SOCK_OPS_RETRANS_CB_FLAG** (retransmission)
+ * 		* **BPF_SOCK_OPS_STATE_CB_FLAG** (TCP state change)
+ *
+ * 		Here are some examples of where one could call such eBPF
+ * 		program:
+ *
+ * 		* When RTO fires.
+ * 		* When a packet is retransmitted.
+ * 		* When the connection terminates.
+ * 		* When a packet is sent.
+ * 		* When a packet is received.
+ * 	Return
+ * 		Code **-EINVAL** if the socket is not a full TCP socket;
+ * 		otherwise, a positive number containing the bits that could not
+ * 		be set is returned (which comes down to 0 if all bits were set
+ * 		as required).
+ *
+ * int bpf_bind(struct bpf_sock_addr_kern *ctx, struct sockaddr *addr, int addr_len)
+ * 	Description
+ * 		Bind the socket associated to *ctx* to the address pointed by
+ * 		*addr*, of length *addr_len*. This allows for making outgoing
+ * 		connection from the desired IP address, which can be useful for
+ * 		example when all processes inside a cgroup should use one
+ * 		single IP address on a host that has multiple IP configured.
+ *
+ * 		This helper works for IPv4 and IPv6, TCP and UDP sockets. The
+ * 		domain (*addr*\ **->sa_family**) must be **AF_INET** (or
+ * 		**AF_INET6**). Looking for a free port to bind to can be
+ * 		expensive, therefore binding to port is not permitted by the
+ * 		helper: *addr*\ **->sin_port** (or **sin6_port**, respectively)
+ * 		must be set to zero.
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
