Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E53EB64DA
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jul 2023 20:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbjGEUlL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233202AbjGEUlK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jul 2023 16:41:10 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C5C19A6
        for <linux-doc@vger.kernel.org>; Wed,  5 Jul 2023 13:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688589668; x=1720125668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2t+U+v5S5iDDlAA/C1t1HHtui8Mayz0uFr6zt8gdnuA=;
  b=JsFzP48x5BG6Gr6A2ia4BMpcrZAcOKWpsnxFAorRkkVLO+z14NWyo+4x
   VBEgXpkvtP/mqx/x6DG3d8TmjMkXfesjmFRBT98F6hZZ3vTKrd5/QNK47
   +/X7l0435oJoyjxs7yEsJtBR7AcrPvGwMTa7iEkIXorsQkPON8mtaRReY
   lPxB/fXZ2gByoXg0qkkBXjPXxNBlZzcS4sOLXzmdAhkhwNffabJ+xviRK
   ott3ClGv1iEdg26M5esFVr0nudzzTzFGl4PO7TpDcOUYcQGCai3Nd4x3/
   OxSasYif7vAWZ4WII6l9wmmExnpLjn+2NFs2JjVFsB22K7ZRsTHEpW7pv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427122232"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="427122232"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 13:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="832684313"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="832684313"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2023 13:41:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qH9JB-0000p4-2J;
        Wed, 05 Jul 2023 20:41:05 +0000
Date:   Thu, 6 Jul 2023 04:40:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
        linux-doc@vger.kernel.org
Subject: [tiwai-sound:topic/midi20-gadget 63/63] htmldocs:
 Documentation/usb/gadget-testing.rst:1019: WARNING: Malformed table.
Message-ID: <202307060422.HHYZIPqX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20-gadget
head:   be0c9761ecd79271d4a3efacaec6963a4010a297
commit: be0c9761ecd79271d4a3efacaec6963a4010a297 [63/63] usb: gadget: midi2: Add testing documentation
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060422.HHYZIPqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060422.HHYZIPqX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/usb/gadget-testing.rst:1019: WARNING: Malformed table.

vim +1019 Documentation/usb/gadget-testing.rst

  1003	
  1004		===============	===============================================
  1005		name		Function Block name string
  1006		direction	Direction of this FB
  1007				1: input, 2: output, or 3: bidirectional
  1008		first_group	The first UMP Group number (0-15)
  1009		num_groups	The number of groups in this FB (1-16)
  1010		ui_hint		UI-hint of this FB
  1011				0: unknown, 1: receiver, 2: sender, 3: both
  1012		midi_ci_verison	Supported MIDI-CI version number (8 bit)
  1013		is_midi1	Legacy MIDI 1.0 device (0-2)
  1014				0: MIDI 2.0 device,
  1015				1: MIDI 1.0 without restriction, or
  1016				2: MIDI 1.0 with low speed
  1017		sysex8_streams	Max number of SysEx8 streams (8 bit)
  1018		active		Bool flag for FB activity (0 or 1)
> 1019		=============	===============================================
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
