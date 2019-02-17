Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 03BC17D04D
	for <lwn-linux-doc@archive.lwn.net>; Sun, 17 Feb 2019 22:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfBQWxg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 17 Feb 2019 17:53:36 -0500
Received: from ms.lwn.net ([45.79.88.28]:38042 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbfBQWxg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 17 Feb 2019 17:53:36 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0A294300;
        Sun, 17 Feb 2019 22:53:31 +0000 (UTC)
Date:   Sun, 17 Feb 2019 15:53:19 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Nicholas Mc Guire <hofrat@osadl.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] sysfs.txt: add note on available attribute macros
Message-ID: <20190217155319.7686ce91@lwn.net>
In-Reply-To: <1550215788-19883-1-git-send-email-hofrat@osadl.org>
References: <1550215788-19883-1-git-send-email-hofrat@osadl.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 15 Feb 2019 08:29:48 +0100
Nicholas Mc Guire <hofrat@osadl.org> wrote:

> The common cases of attributes wrappers should probably be using the
> __ATTR_XXX macros to make code more concise and readable but the current
> sysfs.txt does not point developers to those convenience macros. Further
> there is no note in sysfs.txt currently explaining why trying to set a
> sysfs file to mode 0666 will fail respectively revert to 0664.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

I've applied this, thanks.

jon
