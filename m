Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA7AEE49B2
	for <linux-doc@archiver.kernel.org>; Tue, 22 Aug 2023 19:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjHVTn2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Aug 2023 15:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjHVTn2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Aug 2023 15:43:28 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9986ECCB;
        Tue, 22 Aug 2023 12:43:25 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso2227563f8f.3;
        Tue, 22 Aug 2023 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692733404; x=1693338204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiVZqxrHrDEjKqHpG0E1vsVFPxLq4d+wLTQ19ytIU5Y=;
        b=cV1kKrCRLl2TekAIBnKCavK5csQO+42bLDfstruE5YxPptoOvYIv/ljIr3TtcIemiY
         AQrK5wu/9xU227a6smdRAorbhPGhl+PKpQcVhH6MyPC/pn4KlnrvSW9ZIQMbFmqP+POy
         9sCYSuhk599Oj9RgyHtjzJyd4Vsz1VghuHkbtlcbISzpznJXOu6RYy1C4eG4JLFFrlOh
         LKXAAo+M7YsQTv/GwRiaSzaVOPNpioxOnmUxmnzmJLklHCXjorJLyul4E3eGHpxokF6E
         NE279QdMZdskr5j5vTQdHDf8dIukCo/DjutEhBVc9LfWpT0HwQ8HdBa+7Ee8QF1eir3P
         M+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692733404; x=1693338204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiVZqxrHrDEjKqHpG0E1vsVFPxLq4d+wLTQ19ytIU5Y=;
        b=Qdm5A9FBA9TkH5laL2b06hrlOZLEpuRBj/iGXZzK/TeMKJ02BnWl03sKyWo1NS7w8q
         JzBlQVq8BW1yXwUnkrQZb9u/9DRBZCm1bLp/rnG3muIZPXXErxJhauFgQRYFahrbc2YQ
         epRGvBXzg/ThjjL1O55AjPAn2wybZLXHHleXEZMG5fZL+xSB/tVVA1/OoBKuSGhR/sgW
         gAv9qEae4mr25wQTKAYQSCX2bAamtu6IGZBVus6CAZn2cSwHVm8XfA3BX1R1uUVQrZL4
         S6QQZxScBkuNU6/MSUsNFzyfMivZ/UheDO7YZW0fnJKj+jjcZttT3/2kowC1OC/MaU7m
         QHrg==
X-Gm-Message-State: AOJu0YxSY2jlVUmiRH20lTQ8gMgx3cRlS4TJkoau/FRXNl//MBUdarwK
        7oSIDUB77BnUiVmDso6J6x70/glfWWHwmg==
X-Google-Smtp-Source: AGHT+IHQkprzI+3o8F8w7P9tySzKFhlmbN7IeFiU80bxD3eYlDwMxxOQYBjqPn3FNxnP9FUEUFTbGg==
X-Received: by 2002:adf:ec8a:0:b0:313:f61c:42ab with SMTP id z10-20020adfec8a000000b00313f61c42abmr8108198wrn.56.1692733403631;
        Tue, 22 Aug 2023 12:43:23 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:3060:22e2:2970:3dc3])
        by smtp.gmail.com with ESMTPSA id f8-20020adfdb48000000b0031934b035d2sm16846067wrj.52.2023.08.22.12.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:43:23 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v3 05/12] tools/ynl: Add mcast-group schema parsing to ynl
Date:   Tue, 22 Aug 2023 20:42:57 +0100
Message-ID: <20230822194304.87488-6-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822194304.87488-1-donald.hunter@gmail.com>
References: <20230822194304.87488-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a SpecMcastGroup class to the nlspec lib.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
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

