Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A811EB5B
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHim8GjL"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF61FAC
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 05:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700056760; x=1731592760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XzC7zCOE4CH5Yyhze0M21STx/sgEyX4bX00oS5Repss=;
  b=lHim8GjLmukvDBTXnch/5U5d1TYbSbK4JhkKJ/gkC9XYqNpTYKLNXNvD
   vyQkrJC3ox/6ecbvnmhShjgnv8Y3JlyoBnKVwMm/l22FC7QI+C7XddWba
   Vn0skQxVRKXhwTaKn9wAA6r+xZR/XQzZWSG1MzrGWtt4Tt3VHr2qNymaw
   f09Xy/+UtPDCSHdMbsyMaxQnZWwKKj8+vrDtgDnVzayeB1RFrkXxF026s
   b+WH3k4dmFOuQlcpAALWsn4R6VFlTz1Zg3SaxsqkGIhBnfCREpB6pSyXA
   m5oWNlb2KRH9aUUOjCWe4KCwlo1nZxOY/NJ2PlQeyHRLq+UjdhjFgoujo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="375918792"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="375918792"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="758502871"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="758502871"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 05:59:19 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3GQG-0000NT-3A;
	Wed, 15 Nov 2023 13:59:16 +0000
Date: Wed, 15 Nov 2023 21:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sj:damon/next 39/42] htmldocs:
 Documentation/admin-guide/mm/damon/usage.rst:124: WARNING: undefined label:
 sysfs_schemes_quota_goals (if the link has no caption the label must precede
 a section header)
Message-ID: <202311152116.wp5LS1ON-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   1c0004773dde317766d90f066adee4e2bc22a0d6
commit: 520566dca2f1ac43c8782bb34f447ee3db88b931 [39/42] Docs/admin-guide/mm/damon/usage: update for quota goals
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311152116.wp5LS1ON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152116.wp5LS1ON-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/mm/damon/usage.rst:124: WARNING: undefined label: sysfs_schemes_quota_goals (if the link has no caption the label must precede a section header)

vim +124 Documentation/admin-guide/mm/damon/usage.rst

b18402726bd10e SeongJae Park 2022-03-22  123  
b18402726bd10e SeongJae Park 2022-03-22 @124  Reading ``state`` returns ``on`` if the kdamond is currently running, or
b18402726bd10e SeongJae Park 2022-03-22  125  ``off`` if it is not running.  Writing ``on`` or ``off`` makes the kdamond be
adc286e6bdd39e SeongJae Park 2022-05-09  126  in the state.  Writing ``commit`` to the ``state`` file makes kdamond reads the
adc286e6bdd39e SeongJae Park 2022-05-09  127  user inputs in the sysfs files except ``state`` file again.  Writing
520566dca2f1ac SeongJae Park 2023-10-31  128  ``commit_schemes_quota_goals`` to the ``state`` file makes kdamond reads the
520566dca2f1ac SeongJae Park 2023-10-31  129  DAMON-based operation schemes' :ref:`quota goals <sysfs_schemes_quota_goals>`
520566dca2f1ac SeongJae Park 2023-10-31  130  of the kdamond.  Writing ``update_schemes_stats`` to ``state`` file updates the
520566dca2f1ac SeongJae Park 2023-10-31  131  contents of stats files for each DAMON-based operation scheme of the kdamond.
520566dca2f1ac SeongJae Park 2023-10-31  132  For details of the stats, please refer to :ref:`stats section
520566dca2f1ac SeongJae Park 2023-10-31  133  <sysfs_schemes_stats>`.
ea7f03a441b58a SeongJae Park 2023-08-02  134  

:::::: The code at line 124 was first introduced by commit
:::::: b18402726bd10e122c65eecc244ca1cdcb868cc8 Docs/admin-guide/mm/damon/usage: document DAMON sysfs interface

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
