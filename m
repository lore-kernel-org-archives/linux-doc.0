Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2604C7DD50
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Sep 2018 02:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbeIDHIf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Sep 2018 03:08:35 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58133 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbeIDHIe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Sep 2018 03:08:34 -0400
X-Originating-IP: 50.39.174.102
Received: from localhost (50-39-174-102.bvtn.or.frontiernet.net [50.39.174.102])
        (Authenticated sender: josh@joshtriplett.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AFC09E0002;
        Tue,  4 Sep 2018 02:45:37 +0000 (UTC)
Date:   Mon, 3 Sep 2018 19:45:35 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Henrik Austad <henrik@austad.us>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC v2] Drop all 00-INDEX files from Documentation/
Message-ID: <20180904024534.GA29802@localhost>
References: <1536012923-16275-1-git-send-email-henrik@austad.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536012923-16275-1-git-send-email-henrik@austad.us>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[Trimming to author, linux-doc, and LKML for response.]

On Tue, Sep 04, 2018 at 12:15:23AM +0200, Henrik Austad wrote:
> The 00-INDEX files are supposed to give a summary of all files present
> in a directory, but these files are horribly out of date and their
> usefulness is brought into question. Often a simple "ls" would reveal
> the same information as the filenames are generally quite descriptive as
> a short introduction to what the file covers (it should not surprise
> anyone what Documentation/sched/sched-design-CFS.txt covers)
> 
> A few years back it was mentioned that these files were no longer really
> needed, and they have since then grown further out of date, so perhaps
> it is time to just throw them out.
[...]
> As a starting point, remove all index-files and references to 00-INDEX and
> see where the discussion is going.

Yes please.

I was *briefly* tempted, reading through the files, to suggest ensuring
that the one-line descriptions from the 00-INDEX files end up in the
documents themselves, but the more I think about it, I don't think even
that is worth anyone's time to do.

Reviewed-by: Josh Triplett <josh@joshtriplett.org>
