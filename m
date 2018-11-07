Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D39A17D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 22:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbeKHIUc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 03:20:32 -0500
Received: from ms.lwn.net ([45.79.88.28]:45924 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727031AbeKHIUc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Nov 2018 03:20:32 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B6F04537;
        Wed,  7 Nov 2018 22:48:01 +0000 (UTC)
Date:   Wed, 7 Nov 2018 15:48:00 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] kernel-doc: extend $type_param to match members
 referenced by pointer
Message-ID: <20181107154800.50c5103d@lwn.net>
In-Reply-To: <1541609233-14182-3-git-send-email-rppt@linux.ibm.com>
References: <1541609233-14182-1-git-send-email-rppt@linux.ibm.com>
        <1541609233-14182-3-git-send-email-rppt@linux.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  7 Nov 2018 18:47:13 +0200
Mike Rapoport <rppt@linux.ibm.com> wrote:

> Currently, function parameter description can match '@type.member'
> expressions but fails to match '@type->member'.
> Extend the $type_param regex to allow matching both
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

That makes a lot of changes to the generated output but, as far as I can
tell, they're all correct.  A definite improvement.  Applied, thanks.

jon
