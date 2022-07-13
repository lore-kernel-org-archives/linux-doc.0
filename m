Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC97C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jul 2022 23:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbiGMXqa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jul 2022 19:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiGMXq3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 19:46:29 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49DA4D4D3
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 16:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657755988; x=1689291988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vqewqu+V5/PEFIJYsEWdExeBWYsfJPF7XlXLCyGl8wY=;
  b=ZAiTlc5A8ACrWj/Ip43Gqof53fJbdEOHgRLu9vzyBgi3FfLNs/9aEjx1
   CprdSes19fSUpQieX2rAwZEdxS5n9pDZs48sHSdEwTE3P2FBsvW2u2fLY
   8c256YK3Wfd4+NXztaWbgSpsHhzX2DOBNVtl9VYg+M54F9HztVlQ82vcJ
   EOqheyH2SPTTQN2qn8QUwN9nTyt4SOVNyl96402oRBkjKFbQmEMk8ojaT
   Ly6H2wtkGQmG91rLapZKngUTJTYNnDkMKI2hGVKWnJz9Vb8Fje0CliwRG
   CJpOoXv/WUvzd/aPUjXaSG8SzL3X0gGFAD1k5Ymbbu5JBq4KDTpHQAjW2
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="311019013"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="311019013"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 16:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="595890020"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2022 16:46:26 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oBm3m-0003v3-1b;
        Wed, 13 Jul 2022 23:46:26 +0000
Date:   Thu, 14 Jul 2022 07:45:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Xiubo Li <xiubli@redhat.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        David Howells <dhowells@redhat.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 9878/10347] htmldocs:
 Documentation/filesystems/netfs_library.rst:384: WARNING: Inline emphasis
 start-string without end-string.
Message-ID: <202207140742.GTPk4U8i-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4662b7adea50bb62e993a67f611f3be625d3df0d
commit: 157be6ddd9e43835f36264b7bd41a918680ad841 [9878/10347] netfs: do not unlock and put the folio twice
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/netfs_library.rst:384: WARNING: Inline emphasis start-string without end-string.
>> Documentation/filesystems/netfs_library:609: fs/netfs/buffered_read.c:318: WARNING: Inline emphasis start-string without end-string.

vim +384 Documentation/filesystems/netfs_library.rst

   309	
   310	 * ``init_request()``
   311	
   312	   [Optional] This is called to initialise the request structure.  It is given
   313	   the file for reference.
   314	
   315	 * ``free_request()``
   316	
   317	   [Optional] This is called as the request is being deallocated so that the
   318	   filesystem can clean up any state it has attached there.
   319	
   320	 * ``begin_cache_operation()``
   321	
   322	   [Optional] This is called to ask the network filesystem to call into the
   323	   cache (if present) to initialise the caching state for this read.  The netfs
   324	   library module cannot access the cache directly, so the cache should call
   325	   something like fscache_begin_read_operation() to do this.
   326	
   327	   The cache gets to store its state in ->cache_resources and must set a table
   328	   of operations of its own there (though of a different type).
   329	
   330	   This should return 0 on success and an error code otherwise.  If an error is
   331	   reported, the operation may proceed anyway, just without local caching (only
   332	   out of memory and interruption errors cause failure here).
   333	
   334	 * ``expand_readahead()``
   335	
   336	   [Optional] This is called to allow the filesystem to expand the size of a
   337	   readahead read request.  The filesystem gets to expand the request in both
   338	   directions, though it's not permitted to reduce it as the numbers may
   339	   represent an allocation already made.  If local caching is enabled, it gets
   340	   to expand the request first.
   341	
   342	   Expansion is communicated by changing ->start and ->len in the request
   343	   structure.  Note that if any change is made, ->len must be increased by at
   344	   least as much as ->start is reduced.
   345	
   346	 * ``clamp_length()``
   347	
   348	   [Optional] This is called to allow the filesystem to reduce the size of a
   349	   subrequest.  The filesystem can use this, for example, to chop up a request
   350	   that has to be split across multiple servers or to put multiple reads in
   351	   flight.
   352	
   353	   This should return 0 on success and an error code on error.
   354	
   355	 * ``issue_read()``
   356	
   357	   [Required] The helpers use this to dispatch a subrequest to the server for
   358	   reading.  In the subrequest, ->start, ->len and ->transferred indicate what
   359	   data should be read from the server.
   360	
   361	   There is no return value; the netfs_subreq_terminated() function should be
   362	   called to indicate whether or not the operation succeeded and how much data
   363	   it transferred.  The filesystem also should not deal with setting folios
   364	   uptodate, unlocking them or dropping their refs - the helpers need to deal
   365	   with this as they have to coordinate with copying to the local cache.
   366	
   367	   Note that the helpers have the folios locked, but not pinned.  It is
   368	   possible to use the ITER_XARRAY iov iterator to refer to the range of the
   369	   inode that is being operated upon without the need to allocate large bvec
   370	   tables.
   371	
   372	 * ``is_still_valid()``
   373	
   374	   [Optional] This is called to find out if the data just read from the local
   375	   cache is still valid.  It should return true if it is still valid and false
   376	   if not.  If it's not still valid, it will be reread from the server.
   377	
   378	 * ``check_write_begin()``
   379	
   380	   [Optional] This is called from the netfs_write_begin() helper once it has
   381	   allocated/grabbed the folio to be modified to allow the filesystem to flush
   382	   conflicting state before allowing it to be modified.
   383	
 > 384	   It may unlock and discard the folio it was given and set the caller's folio
   385	   pointer to NULL.  It should return 0 if everything is now fine (*foliop
   386	   left set) or the op should be retried (*foliop cleared) and any other error
   387	   code to abort the operation.
   388	
   389	 * ``done``
   390	
   391	   [Optional] This is called after the folios in the request have all been
   392	   unlocked (and marked uptodate if applicable).
   393	
   394	
   395	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
