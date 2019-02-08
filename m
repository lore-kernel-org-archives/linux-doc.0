Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6AB07D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Feb 2019 19:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfBHTrN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Feb 2019 14:47:13 -0500
Received: from ms.lwn.net ([45.79.88.28]:56240 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbfBHTrN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Feb 2019 14:47:13 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C16199AE;
        Fri,  8 Feb 2019 19:47:12 +0000 (UTC)
Date:   Fri, 8 Feb 2019 12:47:11 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Shayenne Moura <shayenneluzmoura@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/doc: Remove solved KMS cleanup task
Message-ID: <20190208124711.030102e0@lwn.net>
In-Reply-To: <20190208153539.esik2dy7xvoi4p4e@smtp.gmail.com>
References: <20190208153539.esik2dy7xvoi4p4e@smtp.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 8 Feb 2019 13:35:39 -0200
Shayenne Moura <shayenneluzmoura@gmail.com> wrote:

> Remove KMS cleanup task from documentation solved by patchset
> https://patchwork.freedesktop.org/series/54310/
> 
> Signed-off-by: Shayenne Moura <shayenneluzmoura@gmail.com>

This seems like a worthy change, but Documentation/gpu is managed by the
DRM maintainers.  Could I ask you to resend the patch to them instead?
You can find the relevant addresses in the MAINTAINERS file or with
scripts/get_maintainer.pl.

Thanks,

jon
