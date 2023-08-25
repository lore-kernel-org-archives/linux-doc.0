Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5789EE49B6
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 12:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244857AbjHYM32 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 08:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244867AbjHYM3E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 08:29:04 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8863268C;
        Fri, 25 Aug 2023 05:28:37 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4013454fa93so7463935e9.0;
        Fri, 25 Aug 2023 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692966494; x=1693571294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3JNQ7Oh5owJGsNuRLVxCjomaWW15pCWkrYOkZcvBZo=;
        b=Lncl2MGerveCnauB8RSWWpOZRFMOIEx4RypcTwCXkIJiP0eOKIpXyKtb0DjPmRpGJt
         wuWPQpCLgMl4QHtHnbmXtHd6kTi/oWgLhIQd/KKxqY8gvYV3Ec4cJG0NJlyL2UjE1sEX
         2Zr9icGJPi/melNc3bdu18quAduAmL1FoO4dJOqyegiBc9627hJO3jPUEs/Vp1dP3iqc
         P0oXJP/0z7P/KBSIMYtozST0oLZ8XMzP1u76VwOOMj7v1H9eX5lqpMVYo+a/VzJ27KQM
         DYcHv4FhjXJdJIfIQPKexRCFtZRmw779C1NKLVutzTiZUOJZ5B1v5t4nl3byAqfU0qBS
         PG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966494; x=1693571294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3JNQ7Oh5owJGsNuRLVxCjomaWW15pCWkrYOkZcvBZo=;
        b=RC2Inzu4JMqwzOgOivbntDIzOPRNKPVMrFjVVpz0VngL6rv/g05u39zWszLqLEzKPe
         FyzzMgu5UivlXJE8XDGoIio1+AnP7D/Zp9ykyyrRxI0Sf/H2boFjx0g6y7RLJMtFL/2p
         xmC4kI8uMVM2KdywKjQ8MIl01Bv/+5CavzcPkPAJALA3PAciVkckRbgT5FgP0D4D6XK+
         xL/9jK6AMQbW4KL1D//thN5yFA9nQSqrdRqG8YDIv5rVyU0NSbL275RweNAng9pOMFsV
         C4S5soZd8/myM1tSoZlgtQ/KkO7CEbGAHRzmeH+AvrNqqwJOqoXQVLAsX/THpdTOfh50
         wCYQ==
X-Gm-Message-State: AOJu0Yy5nY/atRspia3JSN/SS6fyMvAdQ8rKI+2xMmgrC2mMyu9S7D2J
        BJcszSRy4LvfR8UVlEkZNApN1lX6TQkF8A==
X-Google-Smtp-Source: AGHT+IHvfQHUjSBj767WLXKMRLsZ5p3K49y34JnMzlJFnuZ6dNLmg2pkEVxpR7DIVqxlFb/8oCb/4Q==
X-Received: by 2002:a05:600c:218d:b0:401:38dc:8918 with SMTP id e13-20020a05600c218d00b0040138dc8918mr3659016wme.24.1692966493768;
        Fri, 25 Aug 2023 05:28:13 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:88fe:5215:b5d:bbee])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003fff96bb62csm2089561wmf.16.2023.08.25.05.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 05:28:13 -0700 (PDT)
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
Subject: [PATCH net-next v6 05/12] tools/ynl: Add mcast-group schema parsing to ynl
Date:   Fri, 25 Aug 2023 13:27:48 +0100
Message-ID: <20230825122756.7603-6-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825122756.7603-1-donald.hunter@gmail.com>
References: <20230825122756.7603-1-donald.hunter@gmail.com>
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
2.41.0

