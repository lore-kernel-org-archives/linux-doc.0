Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DBD107E3B6
	for <lwn-linux-doc@archive.lwn.net>; Thu,  2 Aug 2018 22:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731119AbeHCAY3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 2 Aug 2018 20:24:29 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45677 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727007AbeHCAY3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Aug 2018 20:24:29 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id C7F5421609;
        Thu,  2 Aug 2018 18:31:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 02 Aug 2018 18:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :date:from:in-reply-to:message-id:references:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0LxIOttaHlvVsaOPf
        hbdOO1rqRp/bbgP4G+igpXzP7A=; b=A9Z+1x6Hj1xq2ejjnzrK/bLj+ZxQC35JW
        N5tGRDKZjNkuZl0VyGMhM7JK02ZwwPA0h0eLTjuL18PM2zMXId3A9787YdFeRLjt
        3dIsHHkf8+iCfgbeylI6ax71gWSRPi+414d/Yv6YYQ8UBEvjYqX52WiEyy1C1Afu
        a7e51SOfunHJIv4On7BbpLarBE9WVfegp4+cI4UJvVup3eD8CfHSDBC2nW0X6IaP
        EZH1peqC90ZOH4QyGb3JKlJOpzOKic4VVKgoG2C+3dVulOV2E1SU5pjXhXNoWg/L
        H26F3gQnrZdpf1Enrdtx+5B7S8Hiqxmd9Ciwef7s6KqynNKMh9GBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:in-reply-to:message-id
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=0LxIOttaHlvVsaOPfhbdOO1rqRp/bbgP4G+igpXzP7A=; b=U+xjlVHH
        qmzBtx2y0TXC9gvTZXEstV17NCsvpC2970t58CSUrtjwVF0SJK9/4M1gV/HTnYme
        HRL05HdEfHOk7Lhc/eeQeTQYEZb9uWn5aBJyN3BxxwdqWTgMGZEB8LVjpx+EajE7
        4TmoeQ38nyRHZjo9hUQ5wao1rNio3p54DCUixyd8keGEkgToUjJExK8NQ2DxAIpO
        iLHPy+64o1xBLInz60s1Y78iDKzi5mX5eDfzOoSvH3yQbxRJNbTjmS8HhTgXxjXW
        +cAEZ1O1tlI3h31Pl0VpCKfgpDydGQIBFPbfOrwOmYNRldrOdU0DLLC0QaRjG2YX
        +BgUaOidaUaz+Q==
X-ME-Proxy: <xmx:NIZjW0J3wGcnWBcTZDJu7mq8wMZo0nqCDFBdsKguyrisA-OE4V-mNg>
    <xmx:NIZjW88gqsPocAWt-kQ7KY8NDwAKDmbf9qlELwGIFDBqVpC_te3JsA>
    <xmx:NIZjW2Cjj4cOL0O1W3NAIKWP58KC9lhPxNrD3iWOno27Q8qJlLprMw>
    <xmx:NIZjW2rUnzxPa268nKtpxK14JcRX43pxWXE9XalrEw0SdpFVCCZBaw>
    <xmx:NIZjW_JUWNEtG4Q3Qgkvz7u10bM-yaEdcW2GYB8__M2N3LAvYJC-Kw>
    <xmx:NIZjWyS1lG7HefAC-rnSSlXpFsYYmzcq-qwu0rPkQwEMzkpmNa9P3A>
X-ME-Sender: <xms:NIZjW0HiZSLJ8mZOn37MD9pjhnN20Wcrp7tSOqUSE5Xtkl_yx7SHrA>
Received: from localhost (ppp121-44-199-247.bras1.syd2.internode.on.net [121.44.199.247])
        by mail.messagingengine.com (Postfix) with ESMTPA id E0CD610276;
        Thu,  2 Aug 2018 18:31:15 -0400 (EDT)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>
Cc:     "Tobin C. Harding" <me@tobin.cc>, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC bpf-next v2 2/3] docs: net: Use lowercase 'k' for kernel
Date:   Fri,  3 Aug 2018 08:30:59 +1000
Message-Id: <20180802223100.26236-3-me@tobin.cc>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180802223100.26236-1-me@tobin.cc>
References: <20180802223100.26236-1-me@tobin.cc>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The whole document uses a lowercase 'k' for 'kernel' except in one
instance.  The kernel community also favours a lowercase 'k'.

Use lowercase 'k' for kernel instead of uppercase 'K'.

Signed-off-by: Tobin C. Harding <me@tobin.cc>
---
 Documentation/networking/filter.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/filter.txt b/Documentation/networking/filter.txt
index 1fe4adf9c4c6..d12721e997f8 100644
--- a/Documentation/networking/filter.txt
+++ b/Documentation/networking/filter.txt
@@ -6,7 +6,7 @@ Introduction
 
 Linux Socket Filtering (LSF) is derived from the Berkeley Packet Filter.
 Though there are some distinct differences between the BSD and Linux
-Kernel filtering, but when we speak of BPF or LSF in Linux context, we
+kernel filtering, but when we speak of BPF or LSF in Linux context, we
 mean the very same mechanism of filtering in the Linux kernel.
 
 BPF allows a user-space program to attach a filter onto any socket and
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
