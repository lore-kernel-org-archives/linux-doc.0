Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C14C27D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 15:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752105AbeCUP2H (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 11:28:07 -0400
Received: from ms.lwn.net ([45.79.88.28]:50102 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752539AbeCUP2H (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Mar 2018 11:28:07 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CA190536;
        Wed, 21 Mar 2018 15:28:06 +0000 (UTC)
Date:   Wed, 21 Mar 2018 09:28:05 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Aishwarya Pant <aishpant@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] HID: ntrig: document sysfs interface
Message-ID: <20180321092805.279a8dde@lwn.net>
In-Reply-To: <20180302053017.GA23123@mordor.localdomain>
References: <20180302053017.GA23123@mordor.localdomain>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2 Mar 2018 11:00:17 +0530
Aishwarya Pant <aishpant@gmail.com> wrote:

> Add sysfs documentation for N-Trig touchscreens under Documentation/ABI.
> Descriptions have been collected from code comments.

Applied to the docs tree, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
