Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A19E47D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Jun 2019 18:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfFQSLU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Jun 2019 14:11:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:45226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbfFQSLU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 Jun 2019 14:11:20 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1BAF208C4;
        Mon, 17 Jun 2019 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560795079;
        bh=k/6IUap+LJ3ImKD1Dt0WyP5prD5549EXDjA7xO8kXVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PQ8yE8qayeS6FAihpMEK+9X7BTnf5UzlCr2WoM5lREbZitC7xzhPQRRR/abvR9Djh
         uRrdOkm6g4/14fkiM35lNnR9nPFjK8r49QHmbZdCE3PO+mUoWfJDeGEdniCo2w2JQT
         MLN+Hw3g6+CqaO+CQ72C5ItP51r42RqociYZHBpM=
Date:   Mon, 17 Jun 2019 20:11:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        ksummit-discuss@lists.linuxfoundation.org
Subject: Re: [PATCH RFC] scripts: add a script to handle
 Documentation/features
Message-ID: <20190617181116.GA17114@kroah.com>
References: <20190617142117.76478570@coco.lan>
 <98ce589a7c50e2693ab6be158e03afde19aed81e.1560794401.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98ce589a7c50e2693ab6be158e03afde19aed81e.1560794401.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 17, 2019 at 03:05:07PM -0300, Mauro Carvalho Chehab wrote:
> The Documentation/features contains a set of parseable files.
> It is not worth converting them to ReST format, as they're
> useful the way it is. It is, however, interesting to parse
> them and produce output on different formats:
> 
> 1) Output the contents of a feature in ReST format;
> 
> 2) Output what features a given architecture supports;
> 
> 3) Output a matrix with features x architectures.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
> 
> As commented at KS mailing list, converting the Documentation/features
> file to ReST may not be the best way to handle it. 
> 
> This script allows validating the features files and to  generate ReST files 
> on three different formats.
> 
> The goal is to support it via a sphinx extension, in order to be able to add
> the features inside the Kernel documentation.
> 
>  scripts/get_feat.pl | 470 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 470 insertions(+)
>  create mode 100755 scripts/get_feat.pl
> 
> diff --git a/scripts/get_feat.pl b/scripts/get_feat.pl
> new file mode 100755
> index 000000000000..c5a267b12f49
> --- /dev/null
> +++ b/scripts/get_feat.pl
> @@ -0,0 +1,470 @@
> +#!/usr/bin/perl
> +

No SPDX line :(

