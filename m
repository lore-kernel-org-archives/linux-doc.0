Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E40697D082
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 15:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbeJEWVX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Oct 2018 18:21:23 -0400
Received: from imap.thunk.org ([74.207.234.97]:52226 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbeJEWVX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 5 Oct 2018 18:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org;
         s=ef5046eb; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=CUBBQ9y2ZRx5iC34O1PK7vaHtDLUQgGZzXYaCGHYE5M=; b=CHS528Z9AnhrWH8UdQK2bAkKvg
        4k8tbSka2AXmLDCuegZoLiIoiGCBlkSDjU5F5LUyz994F8U8fPYAme9Nn2s5/xmtaVOmM/gWk2ra+
        1pM39RIFFBJ62quOF2cFIs720M4NYWeUJLQ5llDFbA+QBCR3O3CeXGtCiOIamh/nL/Ds=;
Received: from root (helo=callcc.thunk.org)
        by imap.thunk.org with local-esmtp (Exim 4.89)
        (envelope-from <tytso@thunk.org>)
        id 1g8Rva-0002Jq-53; Fri, 05 Oct 2018 15:22:06 +0000
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 646347A51B1; Fri,  5 Oct 2018 11:22:05 -0400 (EDT)
Date:   Fri, 5 Oct 2018 11:22:05 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH 0/2] ext4: even more documentation fixes
Message-ID: <20181005152205.GA22801@thunk.org>
References: <153870117116.30837.1220267868954289184.stgit@magnolia>
 <007a23b2-1db3-36fb-3300-f94115d4f2b3@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <007a23b2-1db3-36fb-3300-f94115d4f2b3@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tytso@thunk.org
X-SA-Exim-Scanned: No (on imap.thunk.org); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 04, 2018 at 07:48:31PM -0700, Randy Dunlap wrote:
> Hi Darrick,
> 
> I don't see patch 2/2 anywhere (my inbox, email archives)...

Probably because it's moving a lot of files around, so the diffs were 276k.



> 
> -- 
> ~Randy
