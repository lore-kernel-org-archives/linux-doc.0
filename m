Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 40BFB7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Jan 2019 15:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfANPcP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 10:32:15 -0500
Received: from ms.lwn.net ([45.79.88.28]:36732 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbfANPcP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jan 2019 10:32:15 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 461046D6;
        Mon, 14 Jan 2019 15:32:15 +0000 (UTC)
Date:   Mon, 14 Jan 2019 08:32:14 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: fix coding-style.rst Sphinx warning
Message-ID: <20190114083214.54038927@lwn.net>
In-Reply-To: <bfeeb533-3909-30aa-a117-0b4179e8cfc3@infradead.org>
References: <bfeeb533-3909-30aa-a117-0b4179e8cfc3@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 13 Jan 2019 19:28:58 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix Sphinx warning in coding-style.rst:
> 
> Documentation/process/coding-style.rst:446: WARNING: Inline interpreted text or phrase reference start-string without end-string.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied, thanks.

jon
