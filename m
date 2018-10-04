Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0A33F7D08F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 06:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbeJDNG0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 09:06:26 -0400
Received: from ozlabs.org ([203.11.71.1]:38419 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727537AbeJDNG0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Oct 2018 09:06:26 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 42QjKL05sjz9s7h; Thu,  4 Oct 2018 16:14:44 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d90fe2acd9b2900790da01354dbca48dba37c20d
In-Reply-To: <b3ca67442a924acb9f4a3409264914ca9feaf7d5.1538148840.git.christophe.leroy@c-s.fr>
To:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [v3] powerpc: wire up memtest
Message-Id: <42QjKL05sjz9s7h@ozlabs.org>
Date:   Thu,  4 Oct 2018 16:14:44 +1000 (AEST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2018-09-28 at 15:39:20 UTC, Christophe Leroy wrote:
> Add call to early_memtest() so that kernel compiled with
> CONFIG_MEMTEST really perform memtest at startup when requested
> via 'memtest' boot parameter.
> 
> Tested-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d90fe2acd9b2900790da01354dbca4

cheers
