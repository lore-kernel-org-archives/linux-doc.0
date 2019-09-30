Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DC89D7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Sep 2019 20:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbfI3UwJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Sep 2019 16:52:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:50740 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729503AbfI3UwJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 30 Sep 2019 16:52:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C90A39A9;
        Mon, 30 Sep 2019 17:13:22 +0000 (UTC)
Date:   Mon, 30 Sep 2019 11:13:21 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: Why no section for "Kernel/Linux Documentation" here :
 https://patchwork.kernel.org/
Message-ID: <20190930111321.30b90efd@lwn.net>
In-Reply-To: <20190930155826.GC27688@Slackware>
References: <20190930155826.GC27688@Slackware>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 30 Sep 2019 21:28:26 +0530
Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:

>  Why that page missing a section "Kernel Documentation" ?? OR am I
>  missing the title there....not sure...there must be some reason.

Many kernel subsystems do not use patchwork; documentation has always been
one of them.  Perhaps that should change someday; let's see how the
workflow discussions go.

jon
