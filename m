Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9376C7DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 20:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932117AbeEHUxC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 16:53:02 -0400
Received: from ms.lwn.net ([45.79.88.28]:36954 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932105AbeEHUxB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 May 2018 16:53:01 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 94A122DD;
        Tue,  8 May 2018 20:53:00 +0000 (UTC)
Date:   Tue, 8 May 2018 14:52:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andrea Parri <andrea.parri@amarulasolutions.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Elena Reshetova <elena.reshetova@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: refcount-vs-atomic: Update reference to
 LKMM doc.
Message-ID: <20180508145258.0fa05a85@lwn.net>
In-Reply-To: <1525468309-5310-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1525468309-5310-1-git-send-email-andrea.parri@amarulasolutions.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  4 May 2018 23:11:49 +0200
Andrea Parri <andrea.parri@amarulasolutions.com> wrote:

> The LKMM project has moved to 'tools/memory-model/'.
> 
> Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
