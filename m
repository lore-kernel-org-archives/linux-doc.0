Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCAAC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Apr 2022 11:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbiDFLPk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Apr 2022 07:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbiDFLOz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Apr 2022 07:14:55 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8656848B45B
        for <linux-doc@vger.kernel.org>; Wed,  6 Apr 2022 00:38:31 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id t2so2975353qtw.9
        for <linux-doc@vger.kernel.org>; Wed, 06 Apr 2022 00:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=k8Y4vodv0CNZ+E6YurJoB84BdG8m95GYx1pVvi6XuRk=;
        b=ZUiuk+yoDjKUvKKUvY5vWf33mUW8G0iYGuWhNH2AZ01Od9XDrYbPaXx6dL/tTJCiwt
         oqiYLfhgp8Hyn5i7RJWGb7gBBMkyjU8GEFE4KEz3ZU5v7G4bGN1AcZj5fm5ewfrlJ2Xx
         QGKK51ivW1ObjO8KYKSTq3SB54Eo4BzeXb4rHb6oJlP2hTY+KCQ0PyIhcSHIB8WAMbU4
         2MqJZtgNfoznyV/mfUJVcT4gs4NNJ8rC1CATm6hIm6PU0j67d1A7OP+hLMdJQSHIB4zO
         Q+BprlHZ0ea8ByfxPpGu0XC+J4UfOqRvmVUy1K5PVEWh4TnKH8zhYeONq1Fi9k7s7jvv
         YDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=k8Y4vodv0CNZ+E6YurJoB84BdG8m95GYx1pVvi6XuRk=;
        b=gd/lUWzvIXFDn6CFRYuFCUxosQZ+NqBJIcpl3UjTm9lJHNuaIsvFsYFvVZAEZF+AM6
         0gabhYyYu9GUi/uV5gl9tspajVWyF3cbUvq91bOjS2cfhiHApUoXo15KZQVrAg40Ro5N
         0C07E+din4WktiRa9Q/qwdQBx/VlvqjFomMfPbhROZPknFe4qi4dOhPnIU5dbXoLZkO1
         lIWkqZcWFcOzifEBV2u9oV8XQpTItiup330SxUvoMiZfdznAsjxpxsSdkCoz5/+VO8zD
         6AhlRFfXi/eHVlu7ogBkpXJarKVlCojoBup4hhJeRJhG6nNMkdiS/BfXJVrD0w4DYqO2
         MWQg==
X-Gm-Message-State: AOAM533xCEKzHqKejCdEfZSjXl8emSCVfHKtMJVlsJkWfkMEGRbNhh+0
        mUqiJze/DZvGM+P7ftT5uY3CUD1WUIM=
X-Google-Smtp-Source: ABdhPJwaChJrKUWeDTWZSRdclMkM5hs99GWYg2242KcFATAm2Mf0JMLBFJGVV4H9nOyc120MEW9fhg==
X-Received: by 2002:ac8:7f4d:0:b0:2e1:f94c:32a8 with SMTP id g13-20020ac87f4d000000b002e1f94c32a8mr6264417qtk.663.1649230710193;
        Wed, 06 Apr 2022 00:38:30 -0700 (PDT)
Received: from vps.qemfd.net (vps.qemfd.net. [173.230.130.29])
        by smtp.gmail.com with ESMTPSA id g9-20020a05620a108900b0067b13036bd5sm9390258qkk.52.2022.04.06.00.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 00:38:29 -0700 (PDT)
Sender: Nick Black <dankamongmen@gmail.com>
Received: from schwarzgerat.orthanc (schwarzgerat.danknet [192.168.128.2])
        by vps.qemfd.net (Postfix) with ESMTP id D07CA2B108;
        Wed,  6 Apr 2022 03:38:28 -0400 (EDT)
Received: by schwarzgerat.orthanc (Postfix, from userid 1000)
        id C142960055D; Wed,  6 Apr 2022 03:38:28 -0400 (EDT)
Date:   Wed, 6 Apr 2022 03:38:28 -0400
From:   nick black <nickblack@linux.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] af_xdp: use standard hierarchy for FAQs
Message-ID: <Yk1DdMnwCf0ThFhY@schwarzgerat.orthanc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

af_xdp: use standard hierarchy for FAQs

The formatting of the AF_XDP FAQ section led to nasty
HTML. Adopt the scheme used in netdev-FAQ.rst, which
exploits the standard rst hierarchy.

Signed-off-by: nick black <nickblack@linux.com>
---
 Documentation/networking/af_xdp.rst | 110 ++++++++++++++--------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git Documentation/networking/af_xdp.rst Documentation/networking/af_xdp.rst
index 60b217b436be..f049d7d61c04 100644
--- Documentation/networking/af_xdp.rst
+++ Documentation/networking/af_xdp.rst
@@ -560,60 +560,62 @@ code in tools/lib/bpf/xsk.[ch].
 FAQ
 =======
 
-Q: I am not seeing any traffic on the socket. What am I doing wrong?
-
-A: When a netdev of a physical NIC is initialized, Linux usually
-   allocates one RX and TX queue pair per core. So on a 8 core system,
-   queue ids 0 to 7 will be allocated, one per core. In the AF_XDP
-   bind call or the xsk_socket__create libbpf function call, you
-   specify a specific queue id to bind to and it is only the traffic
-   towards that queue you are going to get on you socket. So in the
-   example above, if you bind to queue 0, you are NOT going to get any
-   traffic that is distributed to queues 1 through 7. If you are
-   lucky, you will see the traffic, but usually it will end up on one
-   of the queues you have not bound to.
-
-   There are a number of ways to solve the problem of getting the
-   traffic you want to the queue id you bound to. If you want to see
-   all the traffic, you can force the netdev to only have 1 queue, queue
-   id 0, and then bind to queue 0. You can use ethtool to do this::
-
-     sudo ethtool -L <interface> combined 1
-
-   If you want to only see part of the traffic, you can program the
-   NIC through ethtool to filter out your traffic to a single queue id
-   that you can bind your XDP socket to. Here is one example in which
-   UDP traffic to and from port 4242 are sent to queue 2::
-
-     sudo ethtool -N <interface> rx-flow-hash udp4 fn
-     sudo ethtool -N <interface> flow-type udp4 src-port 4242 dst-port \
-     4242 action 2
-
-   A number of other ways are possible all up to the capabilities of
-   the NIC you have.
-
-Q: Can I use the XSKMAP to implement a switch betwen different umems
-   in copy mode?
-
-A: The short answer is no, that is not supported at the moment. The
-   XSKMAP can only be used to switch traffic coming in on queue id X
-   to sockets bound to the same queue id X. The XSKMAP can contain
-   sockets bound to different queue ids, for example X and Y, but only
-   traffic goming in from queue id Y can be directed to sockets bound
-   to the same queue id Y. In zero-copy mode, you should use the
-   switch, or other distribution mechanism, in your NIC to direct
-   traffic to the correct queue id and socket.
-
-Q: My packets are sometimes corrupted. What is wrong?
-
-A: Care has to be taken not to feed the same buffer in the UMEM into
-   more than one ring at the same time. If you for example feed the
-   same buffer into the FILL ring and the TX ring at the same time, the
-   NIC might receive data into the buffer at the same time it is
-   sending it. This will cause some packets to become corrupted. Same
-   thing goes for feeding the same buffer into the FILL rings
-   belonging to different queue ids or netdevs bound with the
-   XDP_SHARED_UMEM flag.
+I am not seeing any traffic on the socket. What am I doing wrong?
+-----------------------------------------------------------------
+
+When a netdev of a physical NIC is initialized, Linux usually
+allocates one RX and TX queue pair per core. So on a 8 core system,
+queue ids 0 to 7 will be allocated, one per core. In the AF_XDP
+bind call or the xsk_socket__create libbpf function call, you
+specify a specific queue id to bind to and it is only the traffic
+towards that queue you are going to get on you socket. So in the
+example above, if you bind to queue 0, you are NOT going to get any
+traffic that is distributed to queues 1 through 7. If you are
+lucky, you will see the traffic, but usually it will end up on one
+of the queues you have not bound to.
+
+There are a number of ways to solve the problem of getting the
+traffic you want to the queue id you bound to. If you want to see
+all the traffic, you can force the netdev to only have 1 queue, queue
+id 0, and then bind to queue 0. You can use ethtool to do this::
+
+  sudo ethtool -L <interface> combined 1
+
+If you want to only see part of the traffic, you can program the
+NIC through ethtool to filter out your traffic to a single queue id
+that you can bind your XDP socket to. Here is one example in which
+UDP traffic to and from port 4242 are sent to queue 2::
+
+  sudo ethtool -N <interface> rx-flow-hash udp4 fn
+  sudo ethtool -N <interface> flow-type udp4 src-port 4242 dst-port \
+  4242 action 2
+
+A number of other ways are possible all up to the capabilities of
+the NIC you have.
+
+Can I use the XSKMAP to implement a switch betwen different umems in copy mode?
+-------------------------------------------------------------------------------
+
+The short answer is no, that is not supported at the moment. The
+XSKMAP can only be used to switch traffic coming in on queue id X
+to sockets bound to the same queue id X. The XSKMAP can contain
+sockets bound to different queue ids, for example X and Y, but only
+traffic goming in from queue id Y can be directed to sockets bound
+to the same queue id Y. In zero-copy mode, you should use the
+switch, or other distribution mechanism, in your NIC to direct
+traffic to the correct queue id and socket.
+
+My packets are sometimes corrupted. What is wrong?
+--------------------------------------------------
+
+Care has to be taken not to feed the same buffer in the UMEM into
+more than one ring at the same time. If you for example feed the
+same buffer into the FILL ring and the TX ring at the same time, the
+NIC might receive data into the buffer at the same time it is
+sending it. This will cause some packets to become corrupted. Same
+thing goes for feeding the same buffer into the FILL rings
+belonging to different queue ids or netdevs bound with the
+XDP_SHARED_UMEM flag.
 
 Credits
 =======
-- 
2.35.1

