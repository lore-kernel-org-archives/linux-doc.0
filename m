Return-Path: <SRS0=SFNS=4G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE88C34026
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 13:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C66D22B48
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 13:05:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgBRNE7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Feb 2020 08:04:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:49568 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbgBRNE7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 18 Feb 2020 08:04:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A54CDB297;
        Tue, 18 Feb 2020 13:04:57 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id DAE34DA7BA; Tue, 18 Feb 2020 14:04:40 +0100 (CET)
Date:   Tue, 18 Feb 2020 14:04:39 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org, David Sterba <dsterba@suse.com>
Subject: Re: [PATCH 03/44] docs: filesystems: convert affs.txt to ReST
Message-ID: <20200218130439.GK2902@suse.cz>
Reply-To: dsterba@suse.cz
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
 <b44c56befe0e28cbc0eb1b3e281ad7d99737ff16.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b44c56befe0e28cbc0eb1b3e281ad7d99737ff16.1581955849.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 17, 2020 at 05:11:49PM +0100, Mauro Carvalho Chehab wrote:
> - Add a SPDX header;
> - Adjust document title;
> - Add table markups;
> - Mark literal blocks as such;
> - Some whitespace fixes and new line breaks;
> - Add it to filesystems/index.rst.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: David Sterba <dsterba@suse.com>
