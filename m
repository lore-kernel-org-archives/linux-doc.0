Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F79A7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 14:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753670AbeFDOK7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 10:10:59 -0400
Received: from ozlabs.org ([203.11.71.1]:54597 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753669AbeFDOK6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Jun 2018 10:10:58 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 40zxg24KjVz9s0w; Tue,  5 Jun 2018 00:10:53 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 819844285ef2b5d15466f5b5062514135ffba06c
In-Reply-To: <20180511061303.10728-2-alastair@au1.ibm.com>
To:     "Alastair D'Silva" <alastair@au1.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     mikey@neuling.org, arnd@arndb.de, linux-doc@vger.kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, corbet@lwn.net,
        vaibhav@linux.vnet.ibm.com, npiggin@gmail.com,
        linux-kernel@vger.kernel.org, fbarrat@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, andrew.donnellan@au1.ibm.com,
        pombredanne@nexb.com, felix@linux.vnet.ibm.com,
        sukadev@linux.vnet.ibm.com, Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [v5,1/7] powerpc: Add TIDR CPU feature for POWER9
Message-Id: <40zxg24KjVz9s0w@ozlabs.org>
Date:   Tue,  5 Jun 2018 00:10:53 +1000 (AEST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2018-05-11 at 06:12:57 UTC, "Alastair D'Silva" wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch adds a CPU feature bit to show whether the CPU has
> the TIDR register available, enabling as_notify/wait in userspace.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Reviewed-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
> Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/819844285ef2b5d15466f5b5062514

cheers
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
