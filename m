Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A45517D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 05:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbfDPFJk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 01:09:40 -0400
Received: from isilmar-4.linta.de ([136.243.71.142]:60178 "EHLO
        isilmar-4.linta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfDPFJk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 01:09:40 -0400
X-Greylist: delayed 514 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Apr 2019 01:09:39 EDT
Received: from light.dominikbrodowski.net (isilmar.linta [10.0.0.1])
        by isilmar-4.linta.de (Postfix) with ESMTPS id 906E7200941;
        Tue, 16 Apr 2019 05:01:04 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
        id 581062033D; Tue, 16 Apr 2019 06:58:01 +0200 (CEST)
Date:   Tue, 16 Apr 2019 06:58:01 +0200
From:   Dominik Brodowski <linux@dominikbrodowski.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 24/57] docs: pcmcia: convert it to ReST format
Message-ID: <20190416045801.GA13259@light.dominikbrodowski.net>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
 <e3c4827b8f33af90e4628de6590c6e040a20779c.1555382110.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3c4827b8f33af90e4628de6590c6e040a20779c.1555382110.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 15, 2019 at 11:55:49PM -0300, Mauro Carvalho Chehab wrote:
> Convert the pcmcia docs to ReST format. Most of the changes here
> are trivial, making Sphinx properly identify titles, lists and
> literal blocks.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik
