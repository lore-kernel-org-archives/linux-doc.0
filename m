Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C67CC04A68
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 11:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbiG0LSd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Jul 2022 07:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiG0LSd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 07:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD2D6BC23
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658920708;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=7k3HVTGSRUsrBZNnvZlAI9Am+2qyRQXYx0CQhkFznuM=;
        b=gdlrH/kNSJqhIMBWQPeMb5VKNxqsSMZ78CFpwFhBmb5+hpNdXaQPY6me4G6ZCoCDblmEsD
        q2xDzz0AXd3+dzaAehE1QATMXiyuTBG2nRRaGw7XZlyp4mifDe6TXi3QOq/2SMWkzlflc7
        mIlqDW4qqxJRNyS+za20KqByWREJFBk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-F_84IFqsNmmODmvDdAlCLA-1; Wed, 27 Jul 2022 07:18:25 -0400
X-MC-Unique: F_84IFqsNmmODmvDdAlCLA-1
Received: by mail-wr1-f72.google.com with SMTP id t12-20020adfa2cc000000b0021e564cde06so2742242wra.17
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 04:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7k3HVTGSRUsrBZNnvZlAI9Am+2qyRQXYx0CQhkFznuM=;
        b=UhD8Oe5ME+AHaJUFFMzDK3zubrySvZtbfAk45qdz8Xno3ydy77jzAG2/lvd/cpI6vV
         KUV8+73M4pGim+UOpjX6vRaNf+Y6DeJni4NRaWjdcVlDWtYw+JFJXmALOEDDO6Dz7jrk
         k/JQmUj2g4byd+ffoUaeocjOWxAAuu4/pwcL5Duf9cO0zL3TyQ+n9cMHpVwXuUL7fWj/
         Qk+RnsdY9mQna5TQuXmT3S41MVoxnhewE/1j6gI8AcSV781KzJnxnmuws63Jd/wlxya0
         oWmyUXOXNSVhnfuMo9IMzM3GwbV99svHCBYHXMLvxnIf2C0ZP0DH5ekJ8cRTZ1GjryOz
         HBDA==
X-Gm-Message-State: AJIora9JiWD04DxPzYgIsk33fvQqruXRxXFqOjpjql8g2Ff9b8XRXSf5
        DFtO7x2uzc9GnkI4QRFWF1//U77njAAABlPFu0DVS3bc/8def8rKMrsS5JxS+ww8avElOGkbkZg
        iDicng/S6PYJEte95/QfF
X-Received: by 2002:adf:d1c6:0:b0:21e:4f40:9029 with SMTP id b6-20020adfd1c6000000b0021e4f409029mr14239247wrd.719.1658920704511;
        Wed, 27 Jul 2022 04:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sa2gsQ6BbGLQeaNowdO7UHKQMe23+XbkAKMQ7BtzS25GGP9sppnD4ZAGn8edtOiIsqQs3wjA==
X-Received: by 2002:adf:d1c6:0:b0:21e:4f40:9029 with SMTP id b6-20020adfd1c6000000b0021e4f409029mr14239232wrd.719.1658920704190;
        Wed, 27 Jul 2022 04:18:24 -0700 (PDT)
Received: from pc-4.home (2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
        by smtp.gmail.com with ESMTPSA id z18-20020a05600c0a1200b003a03185231bsm2137499wmp.31.2022.07.27.04.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 04:18:23 -0700 (PDT)
Date:   Wed, 27 Jul 2022 13:18:21 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>
Cc:     netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH net-next] Documentation: Describe net.ipv4.tcp_reflect_tos.
Message-ID: <4376126910096258f0a9da93ec53cad99a072afc.1658920560.git.gnault@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The tcp_reflect_tos option was introduced in Linux 5.10 but was still
undocumented.

Signed-off-by: Guillaume Nault <gnault@redhat.com>
---
 Documentation/networking/ip-sysctl.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 5879ef3bc2cb..70f009f75e74 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -636,6 +636,16 @@ tcp_recovery - INTEGER
 
 	Default: 0x1
 
+tcp_reflect_tos - BOOLEAN
+	For listening sockets, reuse the DSCP value of the initial SYN message
+	for outgoing packets. This allows to have both directions of a TCP
+	stream to use the same DSCP value, assuming DSCP remains unchanged for
+	the lifetime of the connection.
+
+	This options affects both IPv4 and IPv6.
+
+	Default: 0 (disabled)
+
 tcp_reordering - INTEGER
 	Initial reordering level of packets in a TCP stream.
 	TCP stack can then dynamically adjust flow reordering level
-- 
2.21.3

