Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6A8437DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 14:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753089AbeDQOf5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 10:35:57 -0400
Received: from mail-wr0-f169.google.com ([209.85.128.169]:37900 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752795AbeDQOfd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 10:35:33 -0400
Received: by mail-wr0-f169.google.com with SMTP id h3so23563525wrh.5
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ww8Tu/WSWu9YsV/w39QlPsXhplEEhsQ6VdCQBcNv7mY=;
        b=LEGwhn3H+9iG+2s9kMRva1oJmMyUEMi+4XlU7nc7DDeOnrn7oiNE3MKYR6vd+HY6kN
         7vJVLbAea9gmPZ7XB+RnyCLC/tqrBJPsYuoMmBBSyfXxJL5JdMOGw0ldJePsfKf/HhOl
         kDJljflqHf1g2+lHo7pxYnPIEZnRIbfLee0+TFBOiCsKRRDBx8tKcxiBh01S56atS0LF
         zzn/QpFTb3DBZ8KBoYJIvytZ2iosV6HiTu6PaiKeCZMJuFK3YqJnp7QLxkUeHV4n16y2
         5+M2e+P3SAMw0RkSo1/xLRUgR0HTUyZBlINpySTNxEQpJB374KOCGrCXGY48ZMsp/DwA
         PBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ww8Tu/WSWu9YsV/w39QlPsXhplEEhsQ6VdCQBcNv7mY=;
        b=jGnuPxn250Cv2vyBtPrWbbtnfR+kyWfb7IO2mTU+2TmLI2O1nOZRz3h4Ef6r8rhYXm
         xeKhn4GXjZnVx+DaPZdjnxqZ3dFp65lG+KBjDMaRS4NPBKe9CoTBcgWRI2vwRDRJOIN9
         dQrjyP1IF11dFSackY6V354MhpHuE2UwYShpkAEFutt4OTOCxva/42DxP/Y1Fwimlf2j
         sh9Pf2L4JH5xOP6N6937Pt0eQnWUs2fJI0N1sToMc13oBOiGjTiqPGEOklj27DKvWYE6
         DWwrD6cgcUBCwv9LNZz1yud37BjlOEsqnnuaAbr9rK7mLlg1NJAD9S/4z6v+MnMCn+9h
         Kwdg==
X-Gm-Message-State: ALQs6tC7NkMprW42XMgDMo+lqKFJyiCNNuWdbwYSo5/YMz3kIJOoQU9S
        0z9kkWj9TV09hHzaUCCfq9OZjA==
X-Google-Smtp-Source: AIpwx4+Jhqtk7MPzdFzVwPP+3YgZ/VokcVqOKuw97y+wndvcjSsCh29IDnfap0vIx3rXHOb1q0vKWg==
X-Received: by 10.80.181.227 with SMTP id a90mr3300861ede.55.1523975731907;
        Tue, 17 Apr 2018 07:35:31 -0700 (PDT)
Received: from reblochon.netronome.com (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id o16sm9340240edc.33.2018.04.17.07.35.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Apr 2018 07:35:31 -0700 (PDT)
From:   Quentin Monnet <quentin.monnet@netronome.com>
To:     daniel@iogearbox.net, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        quentin.monnet@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        John Fastabend <john.fastabend@gmail.com>
Subject: [PATCH bpf-next v3 8/8] bpf: add documentation for eBPF helpers (58-64)
Date:   Tue, 17 Apr 2018 15:34:38 +0100
Message-Id: <20180417143438.7018-9-quentin.monnet@netronome.com>
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

This patch contains descriptions for the following helper functions, all
written by John:

- bpf_redirect_map()
- bpf_sk_redirect_map()
- bpf_sock_map_update()
- bpf_msg_redirect_map()
- bpf_msg_apply_bytes()
- bpf_msg_cork_bytes()
- bpf_msg_pull_data()

v3:
- bpf_sk_redirect_map(): Improve description of BPF_F_INGRESS flag.
- bpf_msg_redirect_map(): Improve description of BPF_F_INGRESS flag.
- bpf_redirect_map(): Fix note on CPU redirection, not fully implemented
  for generic XDP but supported on native XDP.

Cc: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: John Fastabend <john.fastabend@gmail.com>
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h | 140 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 350459c583de..3d329538498f 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -1276,6 +1276,50 @@ union bpf_attr {
  * 	Return
  * 		0 on success, or a negative error in case of failure.
  *
+ * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+ * 	Description
+ * 		Redirect the packet to the endpoint referenced by *map* at
+ * 		index *key*. Depending on its type, his *map* can contain
+ * 		references to net devices (for forwarding packets through other
+ * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
+ * 		but this is only implemented for native XDP (with driver
+ * 		support) as of this writing).
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ * 	Return
+ * 		**XDP_REDIRECT** on success, or **XDP_ABORT** on error.
+ *
+ * int bpf_sk_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+ * 	Description
+ * 		Redirect the packet to the socket referenced by *map* (of type
+ * 		**BPF_MAP_TYPE_SOCKMAP**) at index *key*. Both ingress and
+ * 		egress interfaces can be used for redirection. The
+ * 		**BPF_F_INGRESS** value in *flags* is used to make the
+ * 		distinction (ingress path is selected if the flag is present,
+ * 		egress path otherwise). This is the only flag supported for now.
+ * 	Return
+ * 		**SK_PASS** on success, or **SK_DROP** on error.
+ *
+ * int bpf_sock_map_update(struct bpf_sock_ops_kern *skops, struct bpf_map *map, void *key, u64 flags)
+ * 	Description
+ * 		Add an entry to, or update a *map* referencing sockets. The
+ * 		*skops* is used as a new value for the entry associated to
+ * 		*key*. *flags* is one of:
+ *
+ * 		**BPF_NOEXIST**
+ * 			The entry for *key* must not exist in the map.
+ * 		**BPF_EXIST**
+ * 			The entry for *key* must already exist in the map.
+ * 		**BPF_ANY**
+ * 			No condition on the existence of the entry for *key*.
+ *
+ * 		If the *map* has eBPF programs (parser and verdict), those will
+ * 		be inherited by the socket being added. If the socket is
+ * 		already attached to eBPF programs, this results in an error.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
  * int bpf_xdp_adjust_meta(struct xdp_buff *xdp_md, int delta)
  * 	Description
  * 		Adjust the address pointed by *xdp_md*\ **->data_meta** by
@@ -1443,6 +1487,102 @@ union bpf_attr {
  * 		be set is returned (which comes down to 0 if all bits were set
  * 		as required).
  *
+ * int bpf_msg_redirect_map(struct sk_msg_buff *msg, struct bpf_map *map, u32 key, u64 flags)
+ * 	Description
+ * 		This helper is used in programs implementing policies at the
+ * 		socket level. If the message *msg* is allowed to pass (i.e. if
+ * 		the verdict eBPF program returns **SK_PASS**), redirect it to
+ * 		the socket referenced by *map* (of type
+ * 		**BPF_MAP_TYPE_SOCKMAP**) at index *key*. Both ingress and
+ * 		egress interfaces can be used for redirection. The
+ * 		**BPF_F_INGRESS** value in *flags* is used to make the
+ * 		distinction (ingress path is selected if the flag is present,
+ * 		egress path otherwise). This is the only flag supported for now.
+ * 	Return
+ * 		**SK_PASS** on success, or **SK_DROP** on error.
+ *
+ * int bpf_msg_apply_bytes(struct sk_msg_buff *msg, u32 bytes)
+ * 	Description
+ * 		For socket policies, apply the verdict of the eBPF program to
+ * 		the next *bytes* (number of bytes) of message *msg*.
+ *
+ * 		For example, this helper can be used in the following cases:
+ *
+ * 		* A single **sendmsg**\ () or **sendfile**\ () system call
+ * 		  contains multiple logical messages that the eBPF program is
+ * 		  supposed to read and for which it should apply a verdict.
+ * 		* An eBPF program only cares to read the first *bytes* of a
+ * 		  *msg*. If the message has a large payload, then setting up
+ * 		  and calling the eBPF program repeatedly for all bytes, even
+ * 		  though the verdict is already known, would create unnecessary
+ * 		  overhead.
+ *
+ * 		When called from within an eBPF program, the helper sets a
+ * 		counter internal to the BPF infrastructure, that is used to
+ * 		apply the last verdict to the next *bytes*. If *bytes* is
+ * 		smaller than the current data being processed from a
+ * 		**sendmsg**\ () or **sendfile**\ () system call, the first
+ * 		*bytes* will be sent and the eBPF program will be re-run with
+ * 		the pointer for start of data pointing to byte number *bytes*
+ * 		**+ 1**. If *bytes* is larger than the current data being
+ * 		processed, then the eBPF verdict will be applied to multiple
+ * 		**sendmsg**\ () or **sendfile**\ () calls until *bytes* are
+ * 		consumed.
+ *
+ * 		Note that if a socket closes with the internal counter holding
+ * 		a non-zero value, this is not a problem because data is not
+ * 		being buffered for *bytes* and is sent as it is received.
+ * 	Return
+ * 		0
+ *
+ * int bpf_msg_cork_bytes(struct sk_msg_buff *msg, u32 bytes)
+ * 	Description
+ * 		For socket policies, prevent the execution of the verdict eBPF
+ * 		program for message *msg* until *bytes* (byte number) have been
+ * 		accumulated.
+ *
+ * 		This can be used when one needs a specific number of bytes
+ * 		before a verdict can be assigned, even if the data spans
+ * 		multiple **sendmsg**\ () or **sendfile**\ () calls. The extreme
+ * 		case would be a user calling **sendmsg**\ () repeatedly with
+ * 		1-byte long message segments. Obviously, this is bad for
+ * 		performance, but it is still valid. If the eBPF program needs
+ * 		*bytes* bytes to validate a header, this helper can be used to
+ * 		prevent the eBPF program to be called again until *bytes* have
+ * 		been accumulated.
+ * 	Return
+ * 		0
+ *
+ * int bpf_msg_pull_data(struct sk_msg_buff *msg, u32 start, u32 end, u64 flags)
+ * 	Description
+ * 		For socket policies, pull in non-linear data from user space
+ * 		for *msg* and set pointers *msg*\ **->data** and *msg*\
+ * 		**->data_end** to *start* and *end* bytes offsets into *msg*,
+ * 		respectively.
+ *
+ * 		If a program of type **BPF_PROG_TYPE_SK_MSG** is run on a
+ * 		*msg* it can only parse data that the (**data**, **data_end**)
+ * 		pointers have already consumed. For **sendmsg**\ () hooks this
+ * 		is likely the first scatterlist element. But for calls relying
+ * 		on the **sendpage** handler (e.g. **sendfile**\ ()) this will
+ * 		be the range (**0**, **0**) because the data is shared with
+ * 		user space and by default the objective is to avoid allowing
+ * 		user space to modify data while (or after) eBPF verdict is
+ * 		being decided. This helper can be used to pull in data and to
+ * 		set the start and end pointer to given values. Data will be
+ * 		copied if necessary (i.e. if data was not linear and if start
+ * 		and end pointers do not point to the same chunk).
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ *
  * int bpf_bind(struct bpf_sock_addr_kern *ctx, struct sockaddr *addr, int addr_len)
  * 	Description
  * 		Bind the socket associated to *ctx* to the address pointed by
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
