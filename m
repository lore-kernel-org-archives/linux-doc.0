Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60F217D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 22:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbeKHIYM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 03:24:12 -0500
Received: from ms.lwn.net ([45.79.88.28]:45958 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726896AbeKHIYM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Nov 2018 03:24:12 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2ECF0537;
        Wed,  7 Nov 2018 22:51:40 +0000 (UTC)
Date:   Wed, 7 Nov 2018 15:51:39 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH resend] Documentation/dev-tools: clean up kselftest.rst
Message-ID: <20181107155139.52fcbf35@lwn.net>
In-Reply-To: <67201746-13c6-2b05-7f3d-2b200e4d9af0@infradead.org>
References: <67201746-13c6-2b05-7f3d-2b200e4d9af0@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 4 Nov 2018 14:06:23 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> This is a small cleanup to kselftest.rst:
> 
> - Fix some language typos in the usage instructions.
> - Change one non-ASCII space to an ASCII space.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-doc@vger.kernel.org

Applied, thanks.

jon
