Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 941467D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 17:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbfFGRuu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 13:50:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:57950 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728595AbfFGRuu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 13:50:50 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CB8C9737;
        Fri,  7 Jun 2019 17:50:48 +0000 (UTC)
Date:   Fri, 7 Jun 2019 11:50:47 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "George G. Davis" <george_davis@mentor.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andi Kleen <ak@linux.intel.com>, Jann Horn <jannh@google.com>,
        Nadav Amit <namit@vmware.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] treewide: trivial: fix s/poped/popped/ typo
Message-ID: <20190607115047.2d6e1eb5@lwn.net>
In-Reply-To: <1559766612-12178-2-git-send-email-george_davis@mentor.com>
References: <1559766612-12178-1-git-send-email-george_davis@mentor.com>
        <1559766612-12178-2-git-send-email-george_davis@mentor.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 5 Jun 2019 16:30:10 -0400
"George G. Davis" <george_davis@mentor.com> wrote:

> Fix a couple of s/poped/popped/ typos.
> 
> Cc: Jiri Kosina <trivial@kernel.org>
> Signed-off-by: George G. Davis <george_davis@mentor.com>

I've applied this one, thanks.

jon
