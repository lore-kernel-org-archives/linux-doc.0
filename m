Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D81D7D913
	for <lwn-linux-doc@archive.lwn.net>; Thu, 23 May 2019 13:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730495AbfEWNsj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 23 May 2019 09:48:39 -0400
Received: from ms.lwn.net ([45.79.88.28]:34472 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730843AbfEWNsi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 23 May 2019 09:48:38 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1EF669A9;
        Thu, 23 May 2019 13:48:38 +0000 (UTC)
Date:   Thu, 23 May 2019 07:48:37 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Oleksandr Natalenko <oleksandr@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH 0/8] docs: Fixes for recent versions of Sphinx
Message-ID: <20190523074837.7ab98650@lwn.net>
In-Reply-To: <20190523073830.388b4868@coco.lan>
References: <20190522205034.25724-1-corbet@lwn.net>
        <20190523093944.mylk5l3ginkpelfi@butterfly.localdomain>
        <877eah7a2k.fsf@intel.com>
        <20190523101534.cenmf7rexa7gerot@butterfly.localdomain>
        <20190523073830.388b4868@coco.lan>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 23 May 2019 07:38:30 -0300
Mauro Carvalho Chehab <mchehab@kernel.org> wrote:

> It seems that this message is there since 1.8:
> 
> 	https://www.sphinx-doc.org/en/1.8/_modules/sphinx/application.html

...which is strange, since I didn't see it until I built with 2.0.  It was
annoying to see a new warning, but I figured we had some time still before
needing to rush out a last-minute fix for that one :)

jon
