Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6900C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 17 Nov 2022 14:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239502AbiKQOJR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Nov 2022 09:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239819AbiKQOJF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Nov 2022 09:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BC3725CB
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668694081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zGrIj2pM1BzFZs6WCK5CgY0yjmTq4asrD698aeXNCCY=;
        b=BM9ZfvoufdaJyyUZ+ZNAxHsamqn5FFDQnIOM3xIHQUt/G8HtYshmrnl155q6wjXIrTWtuH
        /lUUxF2LSHdlj9t9dXn12OxqaNRxwhBeze9fTuds9SNf/U4rz8ZLNEelodrvpTgJBgvc+A
        SnxGa8ZbwsbjA2M3At6Cf42REeLL0Uo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-ey4ApWvKO8ee9KlxsxDWsQ-1; Thu, 17 Nov 2022 09:07:58 -0500
X-MC-Unique: ey4ApWvKO8ee9KlxsxDWsQ-1
Received: by mail-wr1-f72.google.com with SMTP id w11-20020adfbacb000000b002418a90da01so745908wrg.16
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 06:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGrIj2pM1BzFZs6WCK5CgY0yjmTq4asrD698aeXNCCY=;
        b=wEk+dDWCUITsTTkk7fLs3fsKbNqkADo9Yny3//ZWGAT7PE6z3w4S6/jJ2Pdj7S28VW
         sga5SYRhV7e/glJFdvYX63d+i1rqVBvmrtzhcyxEGSNrC+wlL+KNWR70xa0V/yC8AqD2
         lAGzESfNIYuOir0eKBXIdryPX843hMKEleNeLfC9POB7fZAkh4qh2TVACZFDDYXVROm/
         G9Ks62jKddL7r9N7NSFI20kFNeOSKf7eozag1bGp10s4JiTWw297AijAiXJEgzslBZiH
         n08fRX9tBbQMtvA+0lnDJfro2HdZg3COruCBdi3A0uzyHX8IF2e52j6eT/FW5AUbS1L2
         N0uw==
X-Gm-Message-State: ANoB5pmGrkFTxoZS9TLDeyQkv8m0UnCXKX6/iRdS34oUdc3BcWtBp2VC
        6kKAs2fAjGDuHfAYMumFKqx8ROxwXyUZkTdFki4gbPVOHD/e41UYKt78QPVo7ztPt3Lgh55UIxq
        7hVzFBgdLOpao3aSFTAfY
X-Received: by 2002:adf:eb90:0:b0:236:b8b9:b018 with SMTP id t16-20020adfeb90000000b00236b8b9b018mr1625454wrn.596.1668694076829;
        Thu, 17 Nov 2022 06:07:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6knsrTmNyYBZxhCpyg3bioYb7jE45cBNWAW5b1372D0gU4XhaO6XTJQFI0I8yD/NLSv4Owgg==
X-Received: by 2002:adf:eb90:0:b0:236:b8b9:b018 with SMTP id t16-20020adfeb90000000b00236b8b9b018mr1625425wrn.596.1668694076481;
        Thu, 17 Nov 2022 06:07:56 -0800 (PST)
Received: from [192.168.0.4] ([78.18.25.12])
        by smtp.gmail.com with ESMTPSA id n128-20020a1ca486000000b003c70191f267sm5660132wme.39.2022.11.17.06.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 06:07:55 -0800 (PST)
Message-ID: <c08783f7-b621-f482-3963-d2bf13491a07@redhat.com>
Date:   Thu, 17 Nov 2022 14:07:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH bpf-next v1 1/1] docs: BPF_MAP_TYPE_XSKMAP
Content-Language: en-US
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     bpf@vger.kernel.org, linux-doc@vger.kernel.org, jbrouer@redhat.com,
        thoiland@redhat.com, donhunte@redhat.com, magnus.karlsson@gmail.com
References: <20221117105044.1935488-1-mtahhan@redhat.com>
 <m2cz9lybef.fsf@gmail.com>
From:   Maryam Tahhan <mtahhan@redhat.com>
In-Reply-To: <m2cz9lybef.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/11/2022 13:10, Donald Hunter wrote:
> mtahhan@redhat.com writes:
> 
>> From: Maryam Tahhan <mtahhan@redhat.com>
>>
>> Add documentation for BPF_MAP_TYPE_XSKMAP
>> including kernel version introduced, usage
>> and examples.
>>
>> Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
>> ---
>>   Documentation/bpf/map_xskmap.rst | 161 +++++++++++++++++++++++++++++++
>>   1 file changed, 161 insertions(+)
>>   create mode 100644 Documentation/bpf/map_xskmap.rst
>>
>> diff --git a/Documentation/bpf/map_xskmap.rst b/Documentation/bpf/map_xskmap.rst
>> new file mode 100644
>> index 000000000000..5699a89851ef
>> --- /dev/null
>> +++ b/Documentation/bpf/map_xskmap.rst
>> @@ -0,0 +1,161 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +.. Copyright (C) 2022 Red Hat, Inc.
>> +
>> +===================
>> +BPF_MAP_TYPE_XSKMAP
>> +===================
>> +
>> +.. note::
>> +   - ``BPF_MAP_TYPE_XSKMAP`` was introduced in kernel version 4.18
>> +
>> +The ``BPF_MAP_TYPE_XSKMAP`` is used as a backend map for XDP BPF helper
>> +call ``bpf_redirect_map()`` and XDP_REDIRECT action, like 'devmap' and 'cpumap'.
> 
> ``XDP_REDIRECT``
> 
>> +This map type redirects raw XDP frames to AF_XDP sockets (XSKs). An AF_XDP socket
>> +binds to a single netdev queue. A mapping of XSKs to queues is shown below:
>> +
>> +.. code-block:: none
>> +
>> +    +---------------------------------------------------+
>> +    |     xsk A      |     xsk B       |      xsk C     |<---+ Userspace
>> +    =========================================================|==========
>> +    |    Queue 0     |     Queue 1     |     Queue 2    |    |  Kernel
>> +    +---------------------------------------------------+    |
>> +    |                  Netdev eth0                      |    |
>> +    +---------------------------------------------------+    |
>> +    |                            +=============+        |    |
>> +    |                            | key |  xsk  |        |    |
>> +    |  +---------+               +=============+        |    |
>> +    |  |         |               |  0  | xsk A |        |    |
>> +    |  |         |               +-------------+        |    |
>> +    |  |         |               |  1  | xsk B |        |    |
>> +    |  | eBPF    |-- redirect -->+-------------+-------------+
>> +    |  | prog    |               |  2  | xsk C |        |
>> +    |  |         |               +-------------+        |
>> +    |  |         |                                      |
>> +    |  |         |                                      |
>> +    |  +---------+                                      |
>> +    |                                                   |
>> +    +---------------------------------------------------+
>> +
>> +.. note::
>> +    An AF_XDP socket that is bound to a certain <netdev/queue_id> will *only*
>> +    accept XDP frames from that <netdev/queue_id>. If an XDP program tries to redirect
>> +    from a <netdev/queue_id> other than what the socket is bound to, the frame will
>> +    not be received on the socket.
>> +
>> +Typically an XSKMAP is created per netdev. This map contains an array of XSK File
>> +Descriptors (FDs). The number of array elements is typically set or adjusted using
>> +the ``max_entries`` map parameter. For AF_XDP ``max_entries`` is equal to the number
>> +of queues supported by the netdev.
> 
> Should it mention that both key and value size must be 4 bytes?
> 
>> +
>> +Usage
>> +=====
>> +
>> +Kernel BPF
>> +----------
>> +.. c:function::
>> +     long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
>> +
>> + Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
>> + For ``BPF_MAP_TYPE_XSKMAP`` this map contains references to AF_XDP socket FDs
>> + for sockets attached to a netdev's queues.
>> +
>> + .. note::
>> +    If the map is empty at an index, the packet is dropped. This means that it is
>> +    mandatory to have an XDP program loaded (and one AF_XDP socket in the XSKMAP)
> 
> mandatory -> necessary
> 
> 'and at least one AF_XDP socket'

I can update the wording...

> 
>> +    to be able to get any traffic to user space through the socket.
>> +
>> +.. c:function::
>> +    void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
>> +
>> + XSK FD entries can be retrieved using the ``bpf_map_lookup_elem()`` helper.
> 
> Unless I'm mistaken, it returns a pointer to the ``struct xdp_sock``.

It does. I will update it

> 
>> +
>> +Userspace
>> +---------
>> +.. note::
>> +    AF_XDP socket entries can only be updated/deleted from user space and not from
>> +    an eBPF program. Trying to call these functions from a kernel eBPF program will
>> +    result in the program failing to load and a verifier warning.
>> +
>> +.. c:function::
>> +   int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags)
>> +
>> + AF_XDP socket entries can be added or updated using the ``bpf_map_update_elem()``
>> + helper. The ``key`` parameter is equal to the queue_id of the queue the AF_XDP
>> + socket is attaching to. And the ``value`` parameter is the file descriptor (fd))
> 
> Extra ')' at end of line.
> 
>> + value of that socket.
>> +
>> + Under the hood, the AF_XDP map update function uses the XSK FD value to retrieve the
>> + associated ``struct xdp_sock`` instance.
>> +
>> + The flags argument can be one of the following:
>> +  - BPF_ANY: Create a new element or update an existing element.
>> +  - BPF_NOEXIST: Create a new element only if it did not exist.
>> +  - BPF_EXIST: Update an existing element.
>> +
>> +.. c:function::
>> +    int bpf_map_lookup_elem(int fd, const void *key, void *value)
>> +
>> + AF_XDP socket entries can be retrieved using the ``bpf_map_lookup_elem()``
>> + helper.
> 
> returns the ``struct xdp_sock`` or negative error in case of failure.

I guess I can be more explicit here.

> 
>> +
>> +.. c:function::
>> +    int bpf_map_delete_elem(int fd, const void *key)
>> +
>> + AF_XDP socket entries can be deleted using the ``bpf_map_delete_elem()``
>> + helper. This helper will return 0 on success, or negative error in case of
>> + failure.
> 
> Should we note that entries are automatically deleted when the xdp_sock
> is released?
> 
>> +
>> +Examples
>> +========
>> +Kernel
>> +------
>> +
>> +The following code snippet shows how to declare a ``BPF_MAP_TYPE_XSKMAP`` called
>> +``xsks_map`` and how to redirect packets to an AF_XDP socket.
>> +
>> +.. code-block:: c
>> +
>> +   struct {
>> +        __uint(type, BPF_MAP_TYPE_XSKMAP);
>> +        __type(key_size, int);
> 
> Should be key and __u32

yes.
> 
>> +        __type(value_size, int);
> 
> Should be value and __u32
> 
yes.

>> +        __uint(max_entries, 64);
>> +    } xsks_map SEC(".maps");
>> +
>> +
>> +    SEC("xdp")
>> +    int xsk_redir_prog(struct xdp_md *ctx)
>> +    {
>> +        int index = ctx->rx_queue_id;
> 
> Should be __u32 and ctx->rx_queue_index

hmm, yep.

> 
>> +
>> +        if (bpf_map_lookup_elem(&xsks_map, &index))
>> +            return bpf_redirect_map(&xsks_map, index, 0);
>> +        return XDP_PASS;
>> +    }
>> +
>> +Userspace
>> +---------
>> +
>> +The following code snippet shows how to update an XSK map with an AF_XDP socket
>> +entry.
>> +
>> +.. code-block:: c
>> +
>> +    int update_xsks_map(struct bpf_map *xsks_map, int queue_id, int xsk_fd)
>> +    {
>> +        int ret;
>> +
>> +        ret = bpf_map_update_elem(bpf_map__fd(xsks_map), &queue_id, &xsk_fd, 0);
>> +        if (ret < 0) {
>> +            fprintf(stderr, "Failed to update xsks_map: %s\n",
>> +                strerror(errno));
>> +        }
>> +
>> +        return ret;
>> +    }
>> +
>> +.. note::
>> +    The most comprehensive resource for using XSKMAPs is `libxdp`_.
>> +
>> +.. _libxdp: https://github.com/xdp-project/xdp-tools/tree/master/lib/libxdp
> 

