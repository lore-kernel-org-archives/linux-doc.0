Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BE8157D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Apr 2019 22:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfDHWFf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Apr 2019 18:05:35 -0400
Received: from ms.lwn.net ([45.79.88.28]:38274 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbfDHWFf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 8 Apr 2019 18:05:35 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B55BE301;
        Mon,  8 Apr 2019 22:05:34 +0000 (UTC)
Date:   Mon, 8 Apr 2019 16:05:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org, Martin Kepplinger <martink@posteo.de>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: kernel-docs: Remove entry for vfs.txt
Message-ID: <20190408160533.709f31e3@lwn.net>
In-Reply-To: <20190406101528.23500-1-j.neuschaefer@gmx.net>
References: <20190406101528.23500-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat,  6 Apr 2019 12:15:27 +0200
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> It's unnecessary to point to an external mirror of the Documentation
> directory.
> 
> Jonathan Corbet writes in favor of removing this entry, instead of
> moving it under "Docs at the Linux Kernel tree":
> 
> > We don't want to turn kernel-docs.rst into yet another out-of-date
> > index for the rest of Documentation/, and the removal of the external
> > URL takes away the only bit of additional information that this entry
> > offers.  
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Applied, thanks.

jon
