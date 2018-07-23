Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 298EF7D071
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 15:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388381AbeGWQ2m (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 12:28:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:34778 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387831AbeGWQ2m (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Jul 2018 12:28:42 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EF2BF30A;
        Mon, 23 Jul 2018 15:26:57 +0000 (UTC)
Date:   Mon, 23 Jul 2018 09:26:56 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andreas Ziegler <andreas.ziegler@fau.de>
Cc:     Changbin Du <changbin.du@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation: trace: improve probe documentation
Message-ID: <20180723092656.70333488@lwn.net>
In-Reply-To: <1531739158-31133-1-git-send-email-andreas.ziegler@fau.de>
References: <1531739158-31133-1-git-send-email-andreas.ziegler@fau.de>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Jul 2018 13:05:56 +0200
Andreas Ziegler <andreas.ziegler@fau.de> wrote:

> This series improves the documentation for uprobes and
> kprobes.
> 
> The filename for enabling/disabling single events is 'enable',
> not 'enabled'. kprobetrace.rst lists the files present in the
> per-event directories but missed 'trigger' so far.

I've applied the pair, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
