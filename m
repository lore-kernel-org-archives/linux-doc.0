Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AFE237D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Mar 2019 05:07:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbfCFFHJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Mar 2019 00:07:09 -0500
Received: from ipmail06.adl2.internode.on.net ([150.101.137.129]:57678 "EHLO
        ipmail06.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbfCFFHI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Mar 2019 00:07:08 -0500
Received: from ppp59-167-129-252.static.internode.on.net (HELO dastard) ([59.167.129.252])
  by ipmail06.adl2.internode.on.net with ESMTP; 06 Mar 2019 15:37:06 +1030
Received: from dave by dastard with local (Exim 4.80)
        (envelope-from <david@fromorbit.com>)
        id 1h1Oll-0000UH-9c; Wed, 06 Mar 2019 16:07:05 +1100
Date:   Wed, 6 Mar 2019 16:07:05 +1100
From:   Dave Chinner <david@fromorbit.com>
To:     Jayashree <jaya@cs.utexas.edu>
Cc:     fstests@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, vijay@cs.utexas.edu, amir73il@gmail.com,
        tytso@mit.edu, fdmanana@gmail.com, chao@kernel.org
Subject: Re: [PATCH] Documenting the crash-recovery guarantees of Linux file
 systems
Message-ID: <20190306050705.GB23020@dastard>
References: <1551841140-3708-1-git-send-email-jaya@cs.utexas.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551841140-3708-1-git-send-email-jaya@cs.utexas.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 05, 2019 at 08:59:00PM -0600, Jayashree wrote:
>  In this file, we document the crash-recovery guarantees
>  provided by four Linux file systems - xfs, ext4, F2FS and btrfs. We also
>  present Dave Chinner's proposal of Strictly-Ordered Metadata Consistency
>  (SOMC), which is provided by xfs. It is not clear to us if other file systems
>  provide SOMC; we would be happy to modify the document if file-system
>  developers claim that their system provides (or aims to provide) SOMC.

I haven't had time to read this yet, but I will point out that
fstests assumes that filesystems that run
"_require_metadata_journaling" tests present SOMC semantics to
users. i.e. we are not testing POSIX semantics in fstests, we are
testing for SOMC crash-recovery semantics because POSIX does not
define a useful set of semantics.

That was the whole point of genericising that test infrastructure -
to make sure all the linux journalling filesystems behave the same
way in the same circumstances...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
