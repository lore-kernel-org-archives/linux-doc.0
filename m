Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D06EE49A3
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 11:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240989AbjHXLUz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 07:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240983AbjHXLU1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 07:20:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE921981;
        Thu, 24 Aug 2023 04:20:22 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fee843b44cso44752715e9.1;
        Thu, 24 Aug 2023 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692876020; x=1693480820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkzaqjYN/HOcy5KlOajuUNuvh0OnrW3AlKCpAsfPAW0=;
        b=J43onzf3QCsCqpbICEk2r8qLd9GtiaDu9hTxWJd2R/iKlTVc2gmOUhMUlVK7Gp+98S
         vlPzsHuG134qYP5KBhQ+zu7A2ab52MquHkuv0ab2HWyJ2cx/3bV+iwWZKbGeQtskGgES
         6Y5MsB1eko3xDl1T2ezIAUS8HKMavhXP6YClEvX2z1QNRX7PAW3/f2Ki4iky27rx9zP1
         IZOv9l41glIgdpgZtdS0iaUhGlMKnhbgoFJHfIdNlGkVvAw/iSNM76bn+Hwgi7lE/r8L
         ixEzl8F+1jTddeGKE/O43qfD1vCsUcRgRrnFI2Kh3f0lZF06oQKds6tl0F/iDvlOoI//
         zx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692876020; x=1693480820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkzaqjYN/HOcy5KlOajuUNuvh0OnrW3AlKCpAsfPAW0=;
        b=TmLtqdH8/A1j9QXujbtQ9Cjj2aKGShR+1Ie4xY6RXELyu5B+/MBI9VL3wEhRia+OGo
         Skghd2mpW88lUiiLSI3mX0U4cCcbipJfAZb8PHYxgo91nv3vXmUJcrLXvcCVPmirMP+8
         J724536QKjdXZRjjA4oAg3kYjo/kxtMo9/I31AGYovsEg840yBzymXL7aaJFpLdLCDNB
         wQTxsf6NToqNlS88UeroaVPghdyU5iNxxqkiDM/euZcupKgmiKJkLls6LnHlO1sqlT0v
         5JHWogB5CTnzuEZFaRsWm4VhyyC/fW4oQdt5aMKvYpRajxTfnx3aWgpLBHcTT+a5hmLW
         B+5g==
X-Gm-Message-State: AOJu0Yznv5eJBjj/Ij+9bpoC38Hmxh7DB4szSsF/OzhMoXKxcsie4QuT
        IZ76BjpgCdr9Jay9uKmVVPehYhndi5fC8A==
X-Google-Smtp-Source: AGHT+IEke2NAoukpB1MdHJB6IME3DLYH3BeAlHvNbsMF0cZnMxhsUmHQjuRdCm2bsVSQ4Oxo/vL+PQ==
X-Received: by 2002:a5d:6a84:0:b0:317:ec04:ee0c with SMTP id s4-20020a5d6a84000000b00317ec04ee0cmr11028276wru.47.1692876020433;
        Thu, 24 Aug 2023 04:20:20 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:1a5:1436:c34c:226])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm21875295wru.54.2023.08.24.04.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:20:19 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net-next v5 05/12] tools/ynl: Add mcast-group schema parsing to ynl
Date:   Thu, 24 Aug 2023 12:19:56 +0100
Message-ID: <20230824112003.52939-6-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824112003.52939-1-donald.hunter@gmail.com>
References: <20230824112003.52939-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a SpecMcastGroup class to the nlspec lib.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 tools/net/ynl/lib/nlspec.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tools/net/ynl/lib/nlspec.py b/tools/net/ynl/lib/nlspec.py
index 0ff0d18666b2..37bcb4d8b37b 100644
--- a/tools/net/ynl/lib/nlspec.py
+++ b/tools/net/ynl/lib/nlspec.py
@@ -322,6 +322,26 @@ class SpecOperation(SpecElement):
             self.attr_set = self.family.attr_sets[attr_set_name]
 
 
+class SpecMcastGroup(SpecElement):
+    """Netlink Multicast Group
+
+    Information about a multicast group.
+
+    Value is only used for classic netlink families that use the
+    netlink-raw schema. Genetlink families use dynamic ID allocation
+    where the ids of multicast groups get resolved at runtime. Value
+    will be None for genetlink families.
+
+    Attributes:
+        name      name of the mulitcast group
+        value     integer id of this multicast group for netlink-raw or None
+        yaml      raw spec as loaded from the spec file
+    """
+    def __init__(self, family, yaml):
+        super().__init__(family, yaml)
+        self.value = self.yaml.get('value')
+
+
 class SpecFamily(SpecElement):
     """ Netlink Family Spec class.
 
@@ -343,6 +363,7 @@ class SpecFamily(SpecElement):
         ntfs       dict of all async events
         consts     dict of all constants/enums
         fixed_header  string, optional name of family default fixed header struct
+        mcast_groups  dict of all multicast groups (index by name)
     """
     def __init__(self, spec_path, schema_path=None, exclude_ops=None):
         with open(spec_path, "r") as stream:
@@ -384,6 +405,7 @@ class SpecFamily(SpecElement):
         self.ops = collections.OrderedDict()
         self.ntfs = collections.OrderedDict()
         self.consts = collections.OrderedDict()
+        self.mcast_groups = collections.OrderedDict()
 
         last_exception = None
         while len(self._resolution_list) > 0:
@@ -416,6 +438,9 @@ class SpecFamily(SpecElement):
     def new_operation(self, elem, req_val, rsp_val):
         return SpecOperation(self, elem, req_val, rsp_val)
 
+    def new_mcast_group(self, elem):
+        return SpecMcastGroup(self, elem)
+
     def add_unresolved(self, elem):
         self._resolution_list.append(elem)
 
@@ -512,3 +537,9 @@ class SpecFamily(SpecElement):
                 self.ops[op.name] = op
             elif op.is_async:
                 self.ntfs[op.name] = op
+
+        mcgs = self.yaml.get('mcast-groups')
+        if mcgs:
+            for elem in mcgs['list']:
+                mcg = self.new_mcast_group(elem)
+                self.mcast_groups[elem['name']] = mcg
-- 
2.39.2 (Apple Git-143)

