Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20B3C7D8A4
	for <lwn-linux-doc@archive.lwn.net>; Fri,  3 May 2019 12:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbfECMe5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 3 May 2019 08:34:57 -0400
Received: from ms.lwn.net ([45.79.88.28]:47980 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfECMe4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 3 May 2019 08:34:56 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 490267DE;
        Fri,  3 May 2019 12:34:55 +0000 (UTC)
Date:   Fri, 3 May 2019 06:34:53 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: clarify other licenses in LICENSES/
Message-ID: <20190503063453.1378ff99@lwn.net>
In-Reply-To: <20190430114134.GA17027@kroah.com>
References: <20190430105130.24500-1-hch@lst.de>
        <20190430114134.GA17027@kroah.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 30 Apr 2019 13:41:34 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Apr 30, 2019 at 06:51:27AM -0400, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this series splits the others category into dual or deprecated,
> > and also fixes up some other minor bits in the documentation for
> > these non-preferred licenses.  
> 
> Looks good to me, thanks for doing this!
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I've applied the set, thanks.

jon
