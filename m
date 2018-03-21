Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C172C7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 15:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752797AbeCUPfX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 11:35:23 -0400
Received: from ms.lwn.net ([45.79.88.28]:50210 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752592AbeCUPfU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Mar 2018 11:35:20 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BE2176E8;
        Wed, 21 Mar 2018 15:35:19 +0000 (UTC)
Date:   Wed, 21 Mar 2018 09:35:18 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Aishwarya Pant <aishpant@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Input: trackpoint: document sysfs interface
Message-ID: <20180321093518.1fb9572f@lwn.net>
In-Reply-To: <20180302173019.GA27660@mordor.localdomain>
References: <20180302173019.GA27660@mordor.localdomain>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2 Mar 2018 23:00:19 +0530
Aishwarya Pant <aishpant@gmail.com> wrote:

> Descriptions have been collected from git commit logs, code commits and
> the TrackPoint System Version 4.0 Engineering Specification.

Applied to the docs tree, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
