Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3FF037E3B2
	for <lwn-linux-doc@archive.lwn.net>; Thu,  2 Aug 2018 06:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbeHBISq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 2 Aug 2018 04:18:46 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52471 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726187AbeHBISq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Aug 2018 04:18:46 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id B70DB21DB2;
        Thu,  2 Aug 2018 02:29:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 02 Aug 2018 02:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :date:from:in-reply-to:message-id:references:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0LxIOttaHlvVsaOPf
        hbdOO1rqRp/bbgP4G+igpXzP7A=; b=GpujMbHExdzi7SOVBgH+FE0Wvmd/qtPlW
        sXKgZ/Rfe9IplGh5LGiNvFJuH++3m07bUX/otjTV1dgbBt3zVusKCQQUPQRbfbBS
        XwTKSEEEC1gX4GFrCX1bSmmRzc4itcUiZe684z5ACz5XRsK/OsAWL2mNa9vNGtvK
        tu2n2EdjPjcHrlKXxdccnZb5AwiD4dSX5D6tgOcyJLVf/1vq9Fpz6sZye5rMU8y3
        6FRM/O37mYy6iDnXKODR0xbUz2/HRyudaS5r0Edc6ciH9iFofgKcIPoeoF9Mju/y
        cpCqLtYpeCy6FfrxvoTc241dX0hwTb/rO7FhUVvLmKcQsNST1Jilw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:in-reply-to:message-id
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=0LxIOttaHlvVsaOPfhbdOO1rqRp/bbgP4G+igpXzP7A=; b=aGvRtAYM
        Q0FPFf/OUEG+p8/gAfjTrLoBM4CpwsHn1GV4HFOJH12FwdcFU9+xCIuhbIVolY6f
        UWilw7dRz6O/vbfJmttlKnq8NxNlpMssdqTFQTsjdro/G0nOoONGrnP5sGG+sLNg
        4aKD5uBaND+/TLyP8WsLZPxte5HYGd2itGk2banv6UaYfwS+6X/PEXhAw/MYwenh
        NpiDHeqTxUb8RL1VjEzaE8mF4q95TPHhONrkE7QMoW3HtJ+px8s6UXuTxIHj3Tmd
        vnFswQkwvmQwF4Wcy3ERQEf+zJL2vXhmunq9e/iLM3Zw+syQdTFGq0SdWqYRW6JG
        CVHo4p+gR3E6lQ==
X-ME-Proxy: <xmx:tKRiW7a_3gSBRQJigMz5yJI8D1GzJ21Qd8MPzzWPxexhqMMnq1Xf4g>
    <xmx:tKRiW0kjw7IA3XFL7OtgSQyyANSLayyLjYNUiBPlqko8l0MzxnesVg>
    <xmx:tKRiWym698yj4Sh0Sn4_sAHRlTCuPNBMQVwmyW0dhdxGtNXXxYP8ig>
    <xmx:tKRiWyOi5AdFEqAeBFO1fKxQSrtS2ilwlnSJmFE_TB77NGPyuYQ3Tw>
    <xmx:tKRiW67Afzk8OyZgNxIX6UpOA-KtHBZVXS45Rm0MLVTZ4sVRErAmRA>
    <xmx:tKRiW3cV9gCST6knQhwB2uSiiT87ImwvkcgrRwwCj_1UQyJND9Pdrg>
X-ME-Sender: <xms:tKRiW8_dWE4kB3RILd3CG5oypcNNheZShHE5nTbLpNuulVSHu_k3CA>
Received: from localhost (124-169-17-12.dyn.iinet.net.au [124.169.17.12])
        by mail.messagingengine.com (Postfix) with ESMTPA id D76DEE4040;
        Thu,  2 Aug 2018 02:29:07 -0400 (EDT)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>
Cc:     "Tobin C. Harding" <me@tobin.cc>, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jay Schulist <jschlst@samba.org>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC bpf-next 2/3] docs: net: Use lowercase 'k' for kernel
Date:   Thu,  2 Aug 2018 16:28:47 +1000
Message-Id: <20180802062848.14332-3-me@tobin.cc>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180802062848.14332-1-me@tobin.cc>
References: <20180802062848.14332-1-me@tobin.cc>
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
