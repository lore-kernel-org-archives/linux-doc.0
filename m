Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 868107D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Aug 2019 17:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfHFRXJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Aug 2019 13:23:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:45048 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfHFRXJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Aug 2019 13:23:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 577612C0;
        Tue,  6 Aug 2019 17:23:08 +0000 (UTC)
Date:   Tue, 6 Aug 2019 11:23:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH] kernel-doc: ignore __printf attribute
Message-ID: <20190806112307.16bdbe0b@lwn.net>
In-Reply-To: <77cf8297-7de3-4ad1-d497-4ad941012b75@infradead.org>
References: <77cf8297-7de3-4ad1-d497-4ad941012b75@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 5 Aug 2019 09:29:50 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Ignore __printf() function attributes just as other __attribute__
> strings are ignored.
> 
> Fixes this kernel-doc warning message:
> include/kunit/kunit-stream.h:58: warning: Function parameter or member '2' not described in '__printf'
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Tested-by: Brendan Higgins <brendanhiggins@google.com>

Applied, thanks.

jon
