Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A7C6A7E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 19:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750761AbeDMTs0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 15:48:26 -0400
Received: from ms.lwn.net ([45.79.88.28]:44800 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750839AbeDMTsZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Apr 2018 15:48:25 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EF0602D8;
        Fri, 13 Apr 2018 19:48:24 +0000 (UTC)
Date:   Fri, 13 Apr 2018 13:48:23 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Steffen Maier <maier@linux.ibm.com>, linux-doc@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH v2] Documentation: ftrace: clarify filters with dynamic
 ftrace and graph
Message-ID: <20180413134823.5718d6de@lwn.net>
In-Reply-To: <20180413115403.757b8c27@gandalf.local.home>
References: <20180413095745.4662eb8f@gandalf.local.home>
        <20180413153915.26931-1-maier@linux.ibm.com>
        <20180413115403.757b8c27@gandalf.local.home>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 13 Apr 2018 11:54:03 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Jon, you want to take it in your tree?

Sure, I'll grab it.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
