Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 90B527D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 22:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbeHKAkJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 20:40:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:33392 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbeHKAkJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 10 Aug 2018 20:40:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 906502DD;
        Fri, 10 Aug 2018 22:08:25 +0000 (UTC)
Date:   Fri, 10 Aug 2018 16:08:24 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] Documentation: add ioctl number entry for v4l2-subdev.h
Message-ID: <20180810160824.7394a0e7@lwn.net>
In-Reply-To: <7f05c67a-c8a7-e3a0-c76f-3b8acffdf41f@infradead.org>
References: <7f05c67a-c8a7-e3a0-c76f-3b8acffdf41f@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 7 Aug 2018 08:28:25 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Update ioctl-number.txt for ioctl's that are defined in
> <media/v4l2-subdev.h>.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied, thanks.

jon
