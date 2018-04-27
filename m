Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 64C217DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 23:18:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932444AbeD0XSA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 19:18:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:55446 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932342AbeD0XSA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 19:18:00 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A48034B7;
        Fri, 27 Apr 2018 23:17:59 +0000 (UTC)
Date:   Fri, 27 Apr 2018 17:17:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] Documentation: driver-api: fix device_connection.rst
 kernel-doc error
Message-ID: <20180427171758.3c5a55be@lwn.net>
In-Reply-To: <4dcdb5c8-1365-9a0a-81be-893b0d1ea731@infradead.org>
References: <4dcdb5c8-1365-9a0a-81be-893b0d1ea731@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 26 Apr 2018 18:29:41 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Using incorrect :functions: syntax (extra space) causes an odd kernel-doc
> warning, so fix that.
> 
> Documentation/driver-api/device_connection.rst:42: ERROR: Error in "kernel-doc" directive:

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
