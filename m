Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3991B7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Jan 2019 00:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfAOAZ7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 19:25:59 -0500
Received: from ms.lwn.net ([45.79.88.28]:38564 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727195AbfAOAZ7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jan 2019 19:25:59 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4C5C12E5;
        Tue, 15 Jan 2019 00:25:59 +0000 (UTC)
Date:   Mon, 14 Jan 2019 17:25:58 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-doc@vger.kernel.org, tglx@linutronix.de
Subject: Re: [PATCH] Documentation/dev-tools: Use gcc version number instead
 svn revision number
Message-ID: <20190114172558.3b1e50ec@lwn.net>
In-Reply-To: <20190114100807.7322-1-bigeasy@linutronix.de>
References: <20190114100807.7322-1-bigeasy@linutronix.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Jan 2019 11:08:07 +0100
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> svn commit 231296 matches commit d29e939c63b71 ("Add fuzzing coverage
> support") in the gcc git. The change is part of gcc 6.1.0.
> 
> Replace the svn commit number with a gcc version which everyone can
> easily compare.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Makes sense to me.  Applied, thanks.

jon
