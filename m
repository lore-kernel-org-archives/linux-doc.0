Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 224557D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 22:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbeKHH6x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 02:58:53 -0500
Received: from ms.lwn.net ([45.79.88.28]:45802 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727605AbeKHH6x (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Nov 2018 02:58:53 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2CA3D2ED;
        Wed,  7 Nov 2018 22:26:28 +0000 (UTC)
Date:   Wed, 7 Nov 2018 15:26:27 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jason Baron <jbaron@akamai.com>
Subject: Re: [PATCH] Documentation: dynamic_debug: fix a couple of typos
Message-ID: <20181107152627.26756d97@lwn.net>
In-Reply-To: <73dabf1e-e6a5-2c4e-9495-289953fa510f@infradead.org>
References: <73dabf1e-e6a5-2c4e-9495-289953fa510f@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 19 Oct 2018 16:55:34 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix a few "typos" in dynamic-debug-howto.rst.
> 
> s/dyndbg_query/ddebug_query/
> s/sysfs/debugfs/
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jason Baron <jbaron@akamai.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org

Applied, thanks.

jon
