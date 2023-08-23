Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F0DEE49B0
	for <linux-doc@archiver.kernel.org>; Wed, 23 Aug 2023 11:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbjHWLma (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 07:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234437AbjHWLm3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 07:42:29 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D0CE5D;
        Wed, 23 Aug 2023 04:42:27 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bbad32bc79so92302301fa.0;
        Wed, 23 Aug 2023 04:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692790946; x=1693395746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLnNqJMl/isE73N1mbjQXGEF/pmHif2ExuIghaJq2uU=;
        b=ohbDB2jnaSsJgE2pKnFRR9ntbLHRu5f7KXnY/nnJDe+2u+DKbATg9g+ME56IZ1zBBC
         QQoTFoO8uxCcYsi6rCYHNSLATPXMlBqOGMJEL6XxPV2TCvRjrVSJatYBKIxxjwJ4Luvu
         CKtxJgYYipLFEYb5DXFNG0mUl1tR5QakUI8bBLSW/r2GEdDQEx8Gx/v47NxOYaUjXwX9
         O7zjsUmXPfE7f6wKROnTnDnJBnUxwOvmWk755ch8Ctg2+WJuhiHIhXzc188vq3OzcZe7
         8gccjgKxUCdLrkABYMr34r6+8l+b4LZAKaoUBGhmIa3nd3/udkmqcigO7KDBDaUCJcJq
         gclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692790946; x=1693395746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLnNqJMl/isE73N1mbjQXGEF/pmHif2ExuIghaJq2uU=;
        b=C5216WCkpxLmbnZRt8/FxSMksBvz7qerB/9nlOtavjmfO0sbraV6ZRdRQeqja5DMh2
         tAIO5Sd9/qq4HsF9N7uNCN/Ypb85OHWAjzUfsYhOfMpfVkpndI2sCI9Wc4MEy4ResV0N
         ZdcncLEwIXfQORHhwA43XSl/1IbsDXNio36+IyMwYFw5V/NoIB+FHKeyYcaq1C6vhkPo
         Gme3jFY56nN8T8XYrYL69yv6IDJEqADGAipaucmHVNltrTuqYmrb5lANvaHn0gRYR5Az
         y7gx232JmHohK/stdxbgefXUQ6FZ3w2GVXOJJaNYusI00TkxExBkzzuq2siwvemFsxV9
         Q0ug==
X-Gm-Message-State: AOJu0Ywr69WTe6mjPrPeSI89WvJdoK3osOf5R7bjaXOTaOkmBNBFIyH1
        6IFBnaCackHTIRAi9Cbmpi+hrxJbNkXA0w==
X-Google-Smtp-Source: AGHT+IFlgyzgm19EzkncOXfutufQ2rkyHKFajShPAf7umaLS10m5YWBrM7ctPo2zqN6sLfR3B0ejWQ==
X-Received: by 2002:a2e:b707:0:b0:2b9:f1ad:9503 with SMTP id j7-20020a2eb707000000b002b9f1ad9503mr9127580ljo.35.1692790945610;
        Wed, 23 Aug 2023 04:42:25 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:e4cf:1132:7b40:4262])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003fed9b1a1f4sm559508wms.1.2023.08.23.04.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:42:25 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v4 10/12] doc/netlink: Add spec for rt addr messages
Date:   Wed, 23 Aug 2023 12:41:59 +0100
Message-ID: <20230823114202.5862-11-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823114202.5862-1-donald.hunter@gmail.com>
References: <20230823114202.5862-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add schema for rt addr with support for:
     - newaddr, deladdr, getaddr (dump)

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/netlink/specs/rt_addr.yaml | 179 +++++++++++++++++++++++
 1 file changed, 179 insertions(+)
 create mode 100644 Documentation/netlink/specs/rt_addr.yaml

diff --git a/Documentation/netlink/specs/rt_addr.yaml b/Documentation/netlink/specs/rt_addr.yaml
new file mode 100644
index 000000000000..cbee1cedb177
--- /dev/null
+++ b/Documentation/netlink/specs/rt_addr.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+
+name: rt-addr
+protocol: netlink-raw
+protonum: 0
+
+doc:
+  Address configuration over rtnetlink.
+
+definitions:
+  -
+    name: ifaddrmsg
+    type: struct
+    members:
+      -
+        name: ifa-family
+        type: u8
+      -
+        name: ifa-prefixlen
+        type: u8
+      -
+        name: ifa-flags
+        type: u8
+        enum: ifa-flags
+        enum-as-flags: true
+      -
+        name: ifa-scope
+        type: u8
+      -
+        name: ifa-index
+        type: u32
+  -
+    name: ifa-cacheinfo
+    type: struct
+    members:
+      -
+        name: ifa-prefered
+        type: u32
+      -
+        name: ifa-valid
+        type: u32
+      -
+        name: cstamp
+        type: u32
+      -
+        name: tstamp
+        type: u32
+
+  -
+    name: ifa-flags
+    type: flags
+    entries:
+      -
+        name: secondary
+      -
+        name: nodad
+      -
+        name: optimistic
+      -
+        name: dadfailed
+      -
+        name: homeaddress
+      -
+        name: deprecated
+      -
+        name: tentative
+      -
+        name: permanent
+      -
+        name: managetempaddr
+      -
+        name: noprefixroute
+      -
+        name: mcautojoin
+      -
+        name: stable-privacy
+
+attribute-sets:
+  -
+    name: addr-attrs
+    attributes:
+      -
+        name: ifa-address
+        type: binary
+        display-hint: ipv4
+      -
+        name: ifa-local
+        type: binary
+        display-hint: ipv4
+      -
+        name: ifa-label
+        type: string
+      -
+        name: ifa-broadcast
+        type: binary
+        display-hint: ipv4
+      -
+        name: ifa-anycast
+        type: binary
+      -
+        name: ifa-cacheinfo
+        type: binary
+        struct: ifa-cacheinfo
+      -
+        name: ifa-multicast
+        type: binary
+      -
+        name: ifa-flags
+        type: u32
+        enum: ifa-flags
+        enum-as-flags: true
+      -
+        name: ifa-rt-priority
+        type: u32
+      -
+        name: ifa-target-netnsid
+        type: binary
+      -
+        name: ifa-proto
+        type: u8
+
+
+operations:
+  fixed-header: ifaddrmsg
+  enum-model: directional
+  list:
+    -
+      name: newaddr
+      doc: Add new address
+      attribute-set: addr-attrs
+      do:
+        request:
+          value: 20
+          attributes: &ifaddr-all
+            - ifa-family
+            - ifa-flags
+            - ifa-prefixlen
+            - ifa-scope
+            - ifa-index
+            - ifa-address
+            - ifa-label
+            - ifa-local
+            - ifa-cacheinfo
+    -
+      name: deladdr
+      doc: Remove address
+      attribute-set: addr-attrs
+      do:
+        request:
+          value: 21
+          attributes:
+            - ifa-family
+            - ifa-flags
+            - ifa-prefixlen
+            - ifa-scope
+            - ifa-index
+            - ifa-address
+            - ifa-local
+    -
+      name: getaddr
+      doc: Dump address information.
+      attribute-set: addr-attrs
+      dump:
+        request:
+          value: 22
+          attributes:
+            - ifa-index
+        reply:
+          value: 20
+          attributes: *ifaddr-all
+
+mcast-groups:
+  list:
+    -
+      name: rtnlgrp-ipv4-ifaddr
+      value: 5
+    -
+      name: rtnlgrp-ipv6-ifaddr
+      value: 9
-- 
2.41.0

