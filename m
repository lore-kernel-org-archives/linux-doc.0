Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3CFCA7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 21:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfCGVNF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 16:13:05 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41321 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726351AbfCGVMd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 16:12:33 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 335483556;
        Thu,  7 Mar 2019 16:12:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 07 Mar 2019 16:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=w2fXLe4ZgTkW2x4QyojPjWlfikwMYKP+enATmuiNyAs=; b=Cv+/mBIl
        6AJ2oPpwVUFnwz8xlfOR0Z6dsrSFVdMQ4hcVLTKE5nZL/uMA737r2K9u06JcORnu
        qh6+oqpRAwRHPp5VAnAzZ/LUCNX5flbGSnWX1r7RFoCW0e0sLCh46dvs4EIgBh7J
        URcer0MeBN9VPbJq9L2DjpgEqWdaRJu1SdivJPCP2tBw9Vcdf4PTfXj1J/l24UIF
        jHx5ddRydrR6aWKRqP+AAYsG2vf6p6U8NsPHAD5LxbdWXYSAPRuxFki9oTMgEYVw
        HV66GTNqG1ztWtqpiDZK/eCxRUfCu0F6yWUg8l2i2cy60NCEJd26qcySJcYGXW6A
        Yaft0lveWAXsKQ==
X-ME-Sender: <xms:P4mBXGPrOz88WQCW0xk6Q1DQc2ruB7dw-zP0QZT8j2gHXNZr3_Zrng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfeekgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfvfhosghi
    nhcuvedrucfjrghrughinhhgfdcuoehtohgsihhnsehkvghrnhgvlhdrohhrgheqnecukf
    hppeduvdegrdduieelrdehrdduheeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgs
    ihhnsehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:P4mBXH_n6dImpnc4YAhqSUsbarQjmU-3MVT2Pj82fkTmguzT2KCcYA>
    <xmx:P4mBXP0PgJi13C5M_xbaSo30rvpU6OVheJ9_cPy-SDIljbZmWLLJSQ>
    <xmx:P4mBXBKQ1Y0N-4IDDhxXQ6cWKh2cCaGd2m3DO2EPzFlYL3oAprsblw>
    <xmx:P4mBXE6LL2rRvWS_AJAM10dF0jk3_i-IBMyH2PUFH0amMnWUpNJ5oA>
Received: from eros.localdomain (124-169-5-158.dyn.iinet.net.au [124.169.5.158])
        by mail.messagingengine.com (Postfix) with ESMTPA id 79AA510344;
        Thu,  7 Mar 2019 16:12:29 -0500 (EST)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] docs: Use reference to link to rst file
Date:   Fri,  8 Mar 2019 08:11:48 +1100
Message-Id: <20190307211153.28400-5-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190307211153.28400-1-tobin@kernel.org>
References: <20190307211153.28400-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Current document includes the path to an RST doc file.  Since this is an
RST file we can make this a link.  Keeps the path as the link title
since that what the original author wrote.

Use reference to link to rst file.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/vm/numa.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/vm/numa.rst b/Documentation/vm/numa.rst
index 185d8a568168..5cae13e9a08b 100644
--- a/Documentation/vm/numa.rst
+++ b/Documentation/vm/numa.rst
@@ -109,8 +109,8 @@ System administrators and application designers can restrict a task's migration
 to improve NUMA locality using various CPU affinity command line interfaces,
 such as taskset(1) and numactl(1), and program interfaces such as
 sched_setaffinity(2).  Further, one can modify the kernel's default local
-allocation behavior using Linux NUMA memory policy.
-[see Documentation/admin-guide/mm/numa_memory_policy.rst.]
+allocation behavior using Linux NUMA memory policy. [see
+:ref:`Documentation/admin-guide/mm/numa_memory_policy.rst <numa_memory_policy>`].
 
 System administrators can restrict the CPUs and nodes' memories that a non-
 privileged user can specify in the scheduling or NUMA commands and functions
-- 
2.21.0

