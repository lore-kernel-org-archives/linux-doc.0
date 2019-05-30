Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BCD697D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 May 2019 14:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfE3Oku (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 May 2019 10:40:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:56918 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbfE3Oku (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 30 May 2019 10:40:50 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9981B72D;
        Thu, 30 May 2019 14:40:49 +0000 (UTC)
Date:   Thu, 30 May 2019 08:40:48 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, linux-doc@vger.kernel.org
Subject: Re: [lwn:docs-next 19/19] htmldocs:
 include/linux/generic-radix-tree.h:1: warning: 'Generic radix trees/sparse
 arrays' not found
Message-ID: <20190530084048.7f5fbcf4@lwn.net>
In-Reply-To: <201905301152.nK61DkP1%lkp@intel.com>
References: <201905301152.nK61DkP1%lkp@intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 30 May 2019 11:14:54 +0800
kbuild test robot <lkp@intel.com> wrote:

> tree:   git://git.lwn.net/linux-2.6 docs-next
> head:   b0d60bfbb60cef1efd699a65e29a94487f8c7b1f
> commit: b0d60bfbb60cef1efd699a65e29a94487f8c7b1f [19/19] kernel-doc: always name missing kerneldoc sections
> reproduce: make htmldocs
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):

So, for anybody watching at home, the issue is stuff like this:

> >> include/linux/generic-radix-tree.h:1: warning: 'Generic radix trees/sparse arrays' not found  
[...]
> >> drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
> >> drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
> >> drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
> >> drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found  

These warnings are not new, but the text has changed.  They all used to
just read "no structured comments found"; now we know exactly what
kernel-doc was told to look for and didn't find.

Thanks,

jon
