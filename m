Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 938697DBD4
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 16:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389030AbfJCQ5s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 12:57:48 -0400
Received: from ms.lwn.net ([45.79.88.28]:33156 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405828AbfJCQtd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Oct 2019 12:49:33 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2DF5C2D4;
        Thu,  3 Oct 2019 16:49:33 +0000 (UTC)
Date:   Thu, 3 Oct 2019 10:49:32 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jeremy MAURO <jeremy.mauro@gmail.com>, j.mauro@criteo.com,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION SCRIPTS),
        linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 2/2] scripts/sphinx-pre-install: Add a new path for
 the debian package "fonts-noto-cjk"
Message-ID: <20191003104932.5067387b@lwn.net>
In-Reply-To: <20191002104504.515c6b7d@coco.lan>
References: <20191002073636.68ad85de@coco.lan>
        <20191002133543.10909-1-j.mauro@criteo.com>
        <20191002104504.515c6b7d@coco.lan>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2 Oct 2019 10:45:04 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Em Wed,  2 Oct 2019 15:35:42 +0200
> Jeremy MAURO <jeremy.mauro@gmail.com> escreveu:
> 
> > The latest debian version "bullseye/sid" has changed the path of the file
> > "notoserifcjk-regular.ttc", with the previous change and this change we
> > keep the backward compatibility and add the latest debian version
> > 
> > Signed-off-by: Jeremy MAURO <j.mauro@criteo.com>  
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Both patches applied, thanks.

jon
