Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A037CEB64DC
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 19:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjGJTck (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 15:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGJTcj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 15:32:39 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26CCBC;
        Mon, 10 Jul 2023 12:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
        bh=sW06cBhhRnR5HgYpuPCKMqbbQq/9zSfLJGNErmehG0s=; b=qojOSJKQYqP5qtYklMNchy9w6G
        tPAmNGrt6ey5asAqJQ+tHFWPa2nDHmzSqZhk0JcU43/XPaITUQBYLByg+4jJl8dyOLDKioTOye7GY
        VUjuLAgglcI/FBKcIyySUuzrnEH5D5CqeWpwTtpD5ZAfuW01f25KQh3IeToNhC7A+vyZEESp4O2Vf
        IRYUuWRbBP/hq69PD1LKSSCgFpqnh1iPSNQBkLJ7df+q0qw51UCESCqii59pMSndGd1q5QQc8YFTC
        BByHWMr3QWe/LAWgnjV6OSyXr7vrLmFJRXoZJjuNJGYFJrDkTkbm8H+eHbkuY/Cb5jSDk9fxUjX1X
        9DJLSjMQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1qIwcG-00CZMS-0Q;
        Mon, 10 Jul 2023 19:32:14 +0000
Date:   Mon, 10 Jul 2023 12:32:12 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dyndbg: constify opt_array
Message-ID: <ZKxcvHNbY3ZOGjuR@bombadil.infradead.org>
References: <20230709-dyndbg-filename-v2-0-fd83beef0925@weissschuh.net>
 <20230709-dyndbg-filename-v2-1-fd83beef0925@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230709-dyndbg-filename-v2-1-fd83beef0925@weissschuh.net>
Sender: Luis Chamberlain <mcgrof@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 09, 2023 at 11:17:58PM +0200, Thomas Weiﬂschuh wrote:
> It is never modified, so mark it const.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
