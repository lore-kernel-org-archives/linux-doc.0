Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E41547D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun, 25 Nov 2018 19:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbeKZGeP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Nov 2018 01:34:15 -0500
Received: from ms.lwn.net ([45.79.88.28]:57888 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbeKZGeP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Nov 2018 01:34:15 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D3E7097E;
        Sun, 25 Nov 2018 19:42:27 +0000 (UTC)
Date:   Sun, 25 Nov 2018 12:42:26 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] scripts/kernel-doc: Fix struct and struct field
 attribute processing
Message-ID: <20181125124226.0dcaab1e@lwn.net>
In-Reply-To: <20181122110604.21603-1-sakari.ailus@linux.intel.com>
References: <20181122110604.21603-1-sakari.ailus@linux.intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 22 Nov 2018 13:06:04 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> The kernel-doc attempts to clear the struct and struct member attributes
> from the API documentation it produces. It falls short of the job in the
> following respects:
> 
> - extra whitespaces are left where __attribute__((...)) was removed,
> 
> - only a single attribute is removed per struct,
> 
> - attributes (such as aligned) containing numbers were not removed,
> 
> - attributes are only cleared from struct fields, not structs themselves.
> 
> This patch addresses these issues by removing the attributes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

That does indeed seem to improve things.  I'm waiting for the pile of
regexes to fall over and hurt somebody, but I guess we're not there yet.
Applied, thanks.

jon
