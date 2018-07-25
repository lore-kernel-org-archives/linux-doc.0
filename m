Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2B27B7DE7F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Jul 2018 02:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388525AbeGYD7t (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Jul 2018 23:59:49 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56807 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388524AbeGYD7s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jul 2018 23:59:48 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 38C8721CF0;
        Tue, 24 Jul 2018 22:50:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 24 Jul 2018 22:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :date:from:in-reply-to:message-id:references:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0fs5vw0MOyoPuH8w6
        F2ofER+4qNOzOOmlznx3pD/zjU=; b=RnAs482qZWH4cGhxHiyKYofVcZvce+g1U
        e8FpMN5dc4s/Gw1Zv+1Wv2LzLgzBoE+bgP1EoN+6uRqzZgB9HTbE6r5z4TfkFyVn
        HaUWEphFLxvzU1Fx3IjOcCqWRTpqfSJY7oqJkxyVZFIoGTLv7orLdNNIN94KKNNj
        5B6rOLpKEsY2pEMXGJxqtnOUZ2Etg6jJc8kBs/eKRs4PYU9+xlKwgXv4b7sltPhF
        qA+O4gizn44tt7dTN6F7PL1HDBHPiIZrvxtZajsN20dgBLncUfOSR7OV6tyL8BdB
        YhkvBfwtRkstOR0Ud7DGbt/JUNLmTQYQaWIrrM1ySzEypxnnO1iLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:in-reply-to:message-id
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=0fs5vw0MOyoPuH8w6F2ofER+4qNOzOOmlznx3pD/zjU=; b=Ip5jFWet
        KYDIf//G35nPKly3cwpxkLWCGI0fqp8ggFvsc/YqF5nxMKLi0W+AeYERiY0CsIqy
        BXm1SccwhLVsDeh6ByAxO4S37k4/fqZsUzR0cBAoE6huTln47d2g82++dxZg1xzM
        HmJbpysh695eDnqaPBTXqPRWSUDo7xyP/ZSy8kBT3v7zzK2n/kzM6eMWUdgdyKw9
        hCHBx1xMn/9ULGlipWzYVNSyxXerVEYpNPpAp4o7gEPEhOxmacTP2CnJbPycGi1H
        FiDDpkfBnnqSkxysT1F/0ENY5blZV06v/H6Mf2z/6hNWXtTPpEIC+La+qS5rz7rk
        eFzuIKra7prV5w==
X-ME-Proxy: <xmx:a-VXW4ymliY5DqAbMg6fnIksNIzMrRZNC7h1hyLp9EuoF-W1jWjLfw>
    <xmx:a-VXW548jNWD210WAyZSRebYM9_Ac2IxHtWqL63f6x8Ru9Y07_qzWQ>
    <xmx:a-VXW_6ISijlDkwK0cKpJE2xlhkK3xm2Ae6VrjDwghEvkhL45-bD0A>
    <xmx:a-VXW6Kb1WMpXEDEFtbj4xWUzEER2et9KtqwXpi7-HxKgrQGqDI1Kw>
    <xmx:a-VXW5Efa4WfdkELdbdeyBGA_Sh0_AsWYlSq-mOlx1MqF43Xge57EA>
    <xmx:a-VXW0tN9IOu4dFbU8wRrbmw6MDACaNR6nqgZllq1wErRT7WvxIz3g>
X-ME-Sender: <xms:a-VXWzK_0oItLLv0eY8gOeQUbtMPSSBGl9xilNAdTfrqlG9jxLWSxA>
Received: from localhost (ppp121-44-239-245.bras2.syd2.internode.on.net [121.44.239.245])
        by mail.messagingengine.com (Postfix) with ESMTPA id 55F9E1026B;
        Tue, 24 Jul 2018 22:50:18 -0400 (EDT)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <me@tobin.cc>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] docs: Add rest label the_canonical_path_format
Date:   Wed, 25 Jul 2018 12:50:04 +1000
Message-Id: <20180725025005.14332-2-me@tobin.cc>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180725025005.14332-1-me@tobin.cc>
References: <20180725025005.14332-1-me@tobin.cc>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation to convert Documentation/network/netdev-FAQ.rst to
restructured text format we would like to be able to reference 'the
canonical patch format' section.

Add rest label: 'the_canonical_path_format'.

Signed-off-by: Tobin C. Harding <me@tobin.cc>
---
 Documentation/process/submitting-patches.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 908bb55be407..c0917107b90a 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -611,6 +611,7 @@ which stable kernel versions should receive your fix. This is the preferred
 method for indicating a bug fixed by the patch. See :ref:`describe_changes`
 for more details.
 
+.. _the_canonical_patch_format:
 
 14) The canonical patch format
 ------------------------------
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
