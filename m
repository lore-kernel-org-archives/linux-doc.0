Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B5B3C7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 18 Oct 2018 18:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbeJSC22 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Oct 2018 22:28:28 -0400
Received: from ms.lwn.net ([45.79.88.28]:44966 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbeJSC21 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Oct 2018 22:28:27 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CBD3497E;
        Thu, 18 Oct 2018 18:26:07 +0000 (UTC)
Date:   Thu, 18 Oct 2018 12:25:55 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] docs: Introduce deprecated APIs list
Message-ID: <20181018122555.6eb6b25f@lwn.net>
In-Reply-To: <20181017234532.GA26162@beast>
References: <20181017234532.GA26162@beast>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 17 Oct 2018 16:45:32 -0700
Kees Cook <keescook@chromium.org> wrote:

> As discussed in the "API replacement/deprecation" thread[1], this makes
> an effort to document what things shouldn't get (re)added to the kernel,
> by introducing Documentation/process/deprecated.rst.
> 
> [1] https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2018-September/005282.html
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied, thanks.

jon
