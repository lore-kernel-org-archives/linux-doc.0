Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D10ECAAA1
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 19:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiISTrT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 15:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiISTrQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 15:47:16 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A7028E36
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663616833; x=1695152833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KPyorXiXa3xTAe+xx6fVMoj0eQMHUSS1VMconXy/Yws=;
  b=ZDncCSEqX65/evN/pqneAQvoseIdPGz2eE5L7DfS3uv1OZ8mo0CKna4n
   oKGes5ytmV/ix7QtXmr/Kgmf9Erqcjg95uH0mQh+QooqTWoMkmQC1YqNf
   VIhpwevpAtYX34iyEchf9OZPi0rHQyJ0zpay9ujg8DwY8kqt2THpngMwN
   aFpYrgdc9R4qO5Qkbe1IKfDoRZTv9UedDOBN4ML4KI6EXS3HVPeCRTiMD
   LIuX7OucVY+ffpep/p873BCXzxXaVMLhbrD4/xPYXVXg/PNZuYWEpbL3d
   WFsYpDt8ck7XDODJvlILnfIql9JZV6d5gHatNkYGKtswRp7sxzfsUGG30
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="325800986"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="325800986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 12:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="649285825"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Sep 2022 12:47:11 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaMjX-0002CG-08;
        Mon, 19 Sep 2022 19:47:11 +0000
Date:   Tue, 20 Sep 2022 03:46:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Josef Bacik <josef@toxicpanda.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        David Sterba <dsterba@suse.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 6333/7934] fs/btrfs/extent-io-tree.c:165:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202209200314.tChS7q2Y-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
commit: caa49bdb937d60c059fc8cba02241ed0b10b073a [6333/7934] btrfs: temporarily export and move core extent_io_tree tree functions
config: alpha-randconfig-r026-20220919 (https://download.01.org/0day-ci/archive/20220920/202209200314.tChS7q2Y-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=caa49bdb937d60c059fc8cba02241ed0b10b073a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout caa49bdb937d60c059fc8cba02241ed0b10b073a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/btrfs/extent-io-tree.c:165: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Search @tree for an entry that contains @offset. Such entry would have
   fs/btrfs/extent-io-tree.c:217: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Search offset in the tree or fill neighbor rbtree node pointers.


vim +165 fs/btrfs/extent-io-tree.c

   163	
   164	/**
 > 165	 * Search @tree for an entry that contains @offset. Such entry would have
   166	 * entry->start <= offset && entry->end >= offset.
   167	 *
   168	 * @tree:       the tree to search
   169	 * @offset:     offset that should fall within an entry in @tree
   170	 * @node_ret:   pointer where new node should be anchored (used when inserting an
   171	 *	        entry in the tree)
   172	 * @parent_ret: points to entry which would have been the parent of the entry,
   173	 *               containing @offset
   174	 *
   175	 * Return a pointer to the entry that contains @offset byte address and don't change
   176	 * @node_ret and @parent_ret.
   177	 *
   178	 * If no such entry exists, return pointer to entry that ends before @offset
   179	 * and fill parameters @node_ret and @parent_ret, ie. does not return NULL.
   180	 */
   181	struct rb_node *tree_search_for_insert(struct extent_io_tree *tree, u64 offset,
   182					       struct rb_node ***node_ret,
   183					       struct rb_node **parent_ret)
   184	{
   185		struct rb_root *root = &tree->state;
   186		struct rb_node **node = &root->rb_node;
   187		struct rb_node *prev = NULL;
   188		struct tree_entry *entry;
   189	
   190		while (*node) {
   191			prev = *node;
   192			entry = rb_entry(prev, struct tree_entry, rb_node);
   193	
   194			if (offset < entry->start)
   195				node = &(*node)->rb_left;
   196			else if (offset > entry->end)
   197				node = &(*node)->rb_right;
   198			else
   199				return *node;
   200		}
   201	
   202		if (node_ret)
   203			*node_ret = node;
   204		if (parent_ret)
   205			*parent_ret = prev;
   206	
   207		/* Search neighbors until we find the first one past the end */
   208		while (prev && offset > entry->end) {
   209			prev = rb_next(prev);
   210			entry = rb_entry(prev, struct tree_entry, rb_node);
   211		}
   212	
   213		return prev;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
