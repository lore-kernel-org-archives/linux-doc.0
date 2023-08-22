Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682E9EE49AF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Aug 2023 19:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjHVTne (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Aug 2023 15:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjHVTne (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Aug 2023 15:43:34 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EFEE50;
        Tue, 22 Aug 2023 12:43:29 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fef3c3277bso19489615e9.1;
        Tue, 22 Aug 2023 12:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692733407; x=1693338207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5opwAQVYw69XeJiRlx/U38+sviuO4BM13qFkT2jjLmM=;
        b=RhnmOl0eWGW3WwwymytkynPqmBPWq0a1Gp/RdGgGtyHfIjRrVMGJ7UGd/WB2g+wsce
         wrm6Om3SCD605u5QReLv2XrDeha4ovW4eNED8+oyXY9OjcYbIimSLMZeXaz2YsFR5M6c
         0JZH2mR1V/H8dnbROayroR/69opX3C8n37+IGSF1jN1xnZxtcequLHoJ4TtJ9pWdo003
         p7SOdSH6YCfZOHgFOxXXmJFjI/QJdw7Xq5Kj+x4YRmI2MX7K7Wf314mEgRKHSzIa0Fra
         cPU8Gfo45Vu0I5nAWeX6kvQgHA/pQU0dP++TEy5L/032USFWpKApiTMSGV1MQg60lU7y
         vtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692733407; x=1693338207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5opwAQVYw69XeJiRlx/U38+sviuO4BM13qFkT2jjLmM=;
        b=DkinWc+vsq5YxaJZPzNunNwem+4wL3O2yCmo0QCJ7oy3BmzlVVVZEJJjsvkSzvkIOO
         DRgTTsWXMd9lAj4bnU+vpO+ppWE7rVK7rsGUnu/YJB7pP78ODrTB+KgLpn4nk/1JuoKZ
         fyffDfX5KEOUk7u9IiRm8ISdgD1qqFqDkGyGnpE+qTAglfJDbzAXwkuqvHTMSk0JTbMZ
         czvpv70qB/xJM/vBqZAMMk/ekFHgEouhVy7bAiB+VrSGOIMCSkY94T7SWLDU9agUSlgz
         ahbIMAiRdm/1gEl6B92yzyww0HnuzEglJ1SQgS5Z7fABPwhjyZSO1YiXLRbAJpsbZJ1O
         k4kw==
X-Gm-Message-State: AOJu0Yw1ffF1++5FPcy5kjcCb/xnup7xubyodktnRRuihK8jCymk9Wu3
        s1W8e8BQ1mSIQ3QnOix60G1+JKFqjzPXDw==
X-Google-Smtp-Source: AGHT+IFn7IRwMgOVHjUy2wbii+3NxWjDCVb5gkGZ+IWnFNV3daOhzr07V9H49IUU7xYjXtDOjKrnMA==
X-Received: by 2002:adf:facd:0:b0:314:3ad6:2327 with SMTP id a13-20020adffacd000000b003143ad62327mr7126158wrs.12.1692733407322;
        Tue, 22 Aug 2023 12:43:27 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:3060:22e2:2970:3dc3])
        by smtp.gmail.com with ESMTPSA id f8-20020adfdb48000000b0031934b035d2sm16846067wrj.52.2023.08.22.12.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:43:26 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v3 08/12] tools/net/ynl: Implement nlattr array-nest decoding in ynl
Date:   Tue, 22 Aug 2023 20:43:00 +0100
Message-ID: <20230822194304.87488-9-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822194304.87488-1-donald.hunter@gmail.com>
References: <20230822194304.87488-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for the 'array-nest' attribute type that is used by several
netlink-raw families.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/net/ynl/lib/ynl.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 8ea055c56381..64f50f576136 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -490,6 +490,17 @@ class YnlFamily(SpecFamily):
                 decoded = NlAttr.formatted_string(decoded, attr_spec.display_hint)
         return decoded
 
+    def _decode_array_nest(self, attr, attr_spec):
+        decoded = []
+        offset = 0
+        while offset < len(attr.raw):
+            item = NlAttr(attr.raw, offset)
+            offset += item.full_len
+
+            subattrs = self._decode(NlAttrs(item.raw), attr_spec['nested-attributes'])
+            decoded.append({ item.type: subattrs })
+        return decoded
+
     def _decode(self, attrs, space):
         attr_space = self.attr_sets[space]
         rsp = dict()
@@ -509,6 +520,8 @@ class YnlFamily(SpecFamily):
                 decoded = True
             elif attr_spec["type"] in NlAttr.type_formats:
                 decoded = attr.as_scalar(attr_spec['type'], attr_spec.byte_order)
+            elif attr_spec["type"] == 'array-nest':
+                decoded = self._decode_array_nest(attr, attr_spec)
             else:
                 raise Exception(f'Unknown {attr_spec["type"]} with name {attr_spec["name"]}')
 
-- 
2.41.0

