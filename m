Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E5C087D2EE
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 Aug 2018 16:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729166AbeH2USM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 Aug 2018 16:18:12 -0400
Received: from smtprelay0051.hostedemail.com ([216.40.44.51]:50147 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728976AbeH2USM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Aug 2018 16:18:12 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 2DC64837F24C;
        Wed, 29 Aug 2018 16:20:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: boys92_5bdea87dac84a
X-Filterd-Recvd-Size: 1353
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Wed, 29 Aug 2018 16:20:31 +0000 (UTC)
Message-ID: <58648986219ce0173ff45d34def0da9f9f34b55f.camel@perches.com>
Subject: Re: [PATCH] [RFC] Drop all 00-INDEX files from Documentation/
From:   Joe Perches <joe@perches.com>
To:     Henrik Austad <henrik@austad.us>, linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Date:   Wed, 29 Aug 2018 09:20:30 -0700
In-Reply-To: <1535545728-8402-1-git-send-email-henrik@austad.us>
References: <1535545728-8402-1-git-send-email-henrik@austad.us>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2018-08-29 at 14:28 +0200, Henrik Austad wrote:
> The 00-INDEX files are supposed to give a summary of all files present
> in a directory, but these files are horribly out of date and their
> usefulness is brought into question.
> 
> A few years back it was mentioned that these files were no longer
> needed, and they have since then grown further out of date, so perhaps
> it is time to just throw them out.

Good idea.

.rst is becoming more common and these 00-INDEX files
are unnecessary and occasionally misleading.

