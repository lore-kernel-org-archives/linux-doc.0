Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 494287D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 09:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfDPJyz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 05:54:55 -0400
Received: from casper.infradead.org ([85.118.1.10]:50298 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfDPJyy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 05:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=m+HqsryJOHxHi5HC7brnx/gbWSM7ggJUaEJSloxwOLU=; b=RVlg9BxYE7MvUcaubDSXNV2cH8
        7vZJwSsncHngoS7gnfDhFCSloh5tYRUZm2jJosrrR6UOy1JRIogX4X2UX6vXuB08vtFcltWlBaoWM
        5Z/xggC3LVZAR5e3Qw5AYMl3k73URaUTVf7cAzWI78tiDoeEZ6A8skHa+IaFAprwjk8ClvpD+uJeB
        anjcZ59VQO/3MqeG/FaeNxTTNtims/frW3D83iXTJbP5fOth6Hj1nnZU6nH4p7d7cQmv4Z3btuQsH
        IrfWolqtwie8Ne0qLHSGKFuvTz4uU83c66pzJcsAt4KFvjhtuo8xBOL25fWuekkDtwaL+49aZg2rq
        8YRFsI3Q==;
Received: from 177.205.118.176.dynamic.adsl.gvt.net.br ([177.205.118.176] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hGKnj-0004Bi-UP; Tue, 16 Apr 2019 09:54:52 +0000
Date:   Tue, 16 Apr 2019 06:54:44 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH 02/57] docs: acpi: convert text files to ReST
Message-ID: <20190416065444.2460d3a3@coco.lan>
In-Reply-To: <CAJZ5v0hZK07zQzmD6J0J5dBUAecpE_31_W5Ade5UpWrsWBeU+Q@mail.gmail.com>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
        <10802a7ac16958a2786c2fc083fb5cb50eb7ebb9.1555382110.git.mchehab+samsung@kernel.org>
        <CAJZ5v0hZK07zQzmD6J0J5dBUAecpE_31_W5Ade5UpWrsWBeU+Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 16 Apr 2019 10:17:11 +0200
"Rafael J. Wysocki" <rafael@kernel.org> escreveu:

> On Tue, Apr 16, 2019 at 5:02 AM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> >
> > Most of the files are already in good shape, making easier to
> > convert them to ReST by adding proper title markups and
> > addressing some identation and markups to properly format the
> > document.  
> 
> There is concurrent work on this under way, please see
> https://marc.info/?t=155381845300002&r=2&w=2
> 
> I'd prefer that one to continue, honestly.

Agreed. I didn't notice the patchset.

Btw, please notice patch 11/57:

	Subject: [PATCH 11/57] docs: extcon: move it to acpi dir and convert it to ReST

IMO, it makes sense to move the extcon driver to ACPI, as it sounds
to be just another ACPI driver.

Thanks,
Mauro
