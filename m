Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABF8C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 23 Feb 2022 23:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244861AbiBWXdX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 18:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244854AbiBWXdX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 18:33:23 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B5A593AC
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 15:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645659174; x=1677195174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=evvuPzzPFoleOyltwLCvUfu8LLaqRuMlSoaYQp+lJpc=;
  b=VohryubCI9SmbQApa/RHqkbcKon6oThoYhcqsyfOe7/xjKtGktUSwdou
   LElUVwx8OYk9sb2X7YDBQt4H1791aM+FT9REVxN+bYAkx4g9WLAA+8eXn
   U9N2EzCFSd/yUr9FMdNfXb8Y95iVMFHLoZZwTrzBbu8vYIscypOH/AL23
   tSxYcgl8mB9rlK4ZUJ2phDjGVW3spts2CoTD9WTJamox4BUdTi7LXS/mH
   rBAwtxPGYGMdJofcp9tS9xIwdet/tVZUS7CR+R3009AOvozueeB0Z8lLR
   R/E3NXE1XPOxKWgznA9opTDdGYvfyglBMJB+vknpkmiDNkuV+SdbjndOg
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="312823638"
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="312823638"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 15:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="637616914"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2022 15:32:52 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nN17r-0001wu-GM; Wed, 23 Feb 2022 23:32:51 +0000
Date:   Thu, 24 Feb 2022 07:32:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Filipe Manana <fdmanana@suse.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        David Sterba <dsterba@suse.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 5106/7526] fs/btrfs/tree-log.c:6755: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202202240705.t3QbMnlt-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   196d330d7fb1e7cc0d85641c89ce4602cb36f12e
commit: 4f847b757f9c206d86986d302a94382c14721031 [5106/7526] btrfs: pass the dentry to btrfs_log_new_name() instead of the inode
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220224/202202240705.t3QbMnlt-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4f847b757f9c206d86986d302a94382c14721031
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4f847b757f9c206d86986d302a94382c14721031
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/display/amdgpu_dm/ fs/btrfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/btrfs/tree-log.c:6755: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Update the log after adding a new name for an inode.


vim +6755 fs/btrfs/tree-log.c

  6753	
  6754	/**
> 6755	 * Update the log after adding a new name for an inode.
  6756	 *
  6757	 * @trans:              Transaction handle.
  6758	 * @old_dentry:         The dentry associated with the old name and the old
  6759	 *                      parent directory.
  6760	 * @old_dir:            The inode of the previous parent directory for the case
  6761	 *                      of a rename. For a link operation, it must be NULL.
  6762	 * @parent:             The dentry associated with the directory under which the
  6763	 *                      new name is located.
  6764	 *
  6765	 * Call this after adding a new name for an inode, as a result of a link or
  6766	 * rename operation, and it will properly update the log to reflect the new name.
  6767	 */
  6768	void btrfs_log_new_name(struct btrfs_trans_handle *trans,
  6769				struct dentry *old_dentry, struct btrfs_inode *old_dir,
  6770				struct dentry *parent)
  6771	{
  6772		struct btrfs_inode *inode = BTRFS_I(d_inode(old_dentry));
  6773		struct btrfs_log_ctx ctx;
  6774	
  6775		/*
  6776		 * this will force the logging code to walk the dentry chain
  6777		 * up for the file
  6778		 */
  6779		if (!S_ISDIR(inode->vfs_inode.i_mode))
  6780			inode->last_unlink_trans = trans->transid;
  6781	
  6782		/*
  6783		 * if this inode hasn't been logged and directory we're renaming it
  6784		 * from hasn't been logged, we don't need to log it
  6785		 */
  6786		if (!inode_logged(trans, inode) &&
  6787		    (!old_dir || !inode_logged(trans, old_dir)))
  6788			return;
  6789	
  6790		/*
  6791		 * If we are doing a rename (old_dir is not NULL) from a directory that
  6792		 * was previously logged, make sure the next log attempt on the directory
  6793		 * is not skipped and logs the inode again. This is because the log may
  6794		 * not currently be authoritative for a range including the old
  6795		 * BTRFS_DIR_INDEX_KEY key, so we want to make sure after a log replay we
  6796		 * do not end up with both the new and old dentries around (in case the
  6797		 * inode is a directory we would have a directory with two hard links and
  6798		 * 2 inode references for different parents). The next log attempt of
  6799		 * old_dir will happen at btrfs_log_all_parents(), called through
  6800		 * btrfs_log_inode_parent() below, because we have previously set
  6801		 * inode->last_unlink_trans to the current transaction ID, either here or
  6802		 * at btrfs_record_unlink_dir() in case the inode is a directory.
  6803		 */
  6804		if (old_dir)
  6805			old_dir->logged_trans = 0;
  6806	
  6807		btrfs_init_log_ctx(&ctx, &inode->vfs_inode);
  6808		ctx.logging_new_name = true;
  6809		/*
  6810		 * We don't care about the return value. If we fail to log the new name
  6811		 * then we know the next attempt to sync the log will fallback to a full
  6812		 * transaction commit (due to a call to btrfs_set_log_full_commit()), so
  6813		 * we don't need to worry about getting a log committed that has an
  6814		 * inconsistent state after a rename operation.
  6815		 */
  6816		btrfs_log_inode_parent(trans, inode, parent, LOG_INODE_EXISTS, &ctx);
  6817	}
  6818	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
