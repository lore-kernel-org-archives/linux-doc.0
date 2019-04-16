Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF1A37D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 08:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbfDPI70 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 04:59:26 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:47158 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfDPI70 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 04:59:26 -0400
Received: from 79.184.254.18.ipv4.supernova.orange.pl (79.184.254.18) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.213)
 id 9e76c8fa0672b35f; Tue, 16 Apr 2019 10:59:23 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 25/57] docs: power: convert docs to ReST
Date:   Tue, 16 Apr 2019 10:59:23 +0200
Message-ID: <1616669.eeiCRjss8h@kreacher>
In-Reply-To: <cfab8842b681a84518b327980b08aee95d159605.1555382110.git.mchehab+samsung@kernel.org>
References: <cover.1555382110.git.mchehab+samsung@kernel.org> <cfab8842b681a84518b327980b08aee95d159605.1555382110.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tuesday, April 16, 2019 4:55:50 AM CEST Mauro Carvalho Chehab wrote:
> Convert the PM documents to ReST, in order to allow them to
> build with Sphinx.

And what exactly is the motivation for doing that?

There are plans for some of these files to be converted already, some of them need to be merged or split and it just is not worth it to convert some others.

Thanks,
Rafael



