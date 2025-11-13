Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A831BCAC
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 21:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069060; cv=none; b=Gc0Fx585gdMlnMp4FyM+QQOMgqGEOhmkqZwU7ZACaDnQMo38ucnA7CByJk1LcpCsDkyJo/UlWxE4/4+R2v68ByeiI0cSDaWe1GwbF/5EJ/8Dotowa0Tky9n6NEX99KrdazzSZ7WRkVEjoJUOxP/9w/UCv/4KKSU/hl5zyBsgsbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069060; c=relaxed/simple;
	bh=5Z8Xe21L3UoBM+LMhnArgXor5BtOvKXTU4+rF1FkC80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BBrDFMhL/mfWqCqVBsu69+S97btMFC+P2rNEwTgFnVr9ruwwTHdeEbjjSsj64qe/yE+xqlbbOnglLirYkoQsJueOQqIFTzGW9YZ+FMKqMULdsIzU/KOBLFo6MMaiQPIJof1U+GqeyLnSBrn6k4jVgLy1QFIOjbEvZ1kcNb4GTl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h47AA1po; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h47AA1po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069059; x=1794605059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Z8Xe21L3UoBM+LMhnArgXor5BtOvKXTU4+rF1FkC80=;
  b=h47AA1poJjdfV3yJFV7gd0vlQV84ltUGEuL5jIC7QfO4scyLx0t9CF09
   a3JBfWKEQwG3OUFfkCMZ7WyAVkhaeB0SOJqbPt/Ze/S1LGUjrA9u4UYj0
   EJyYksLkRqyo+SKKYL6PRRKHYJfliROJg9ZxeXoBSsjDs6XwfhJOaubcg
   tCdx8uLBY/DLBYtRT4eCQ3rrE1HyMfqVJoLn3TkJQcthQds1cPG8Tesng
   8OQlvpHFN2dMyHXwFOEeGyc0SwetUDSS7zp+Elff43KjddrQwBscg2U2c
   KymNwGNKZrYxOKibtvtZrSRvsoXguPR+0uYxo0bBbVLfFUJr7dtkUYps9
   g==;
X-CSE-ConnectionGUID: RY91Rc15RFGLepRVkkVC4g==
X-CSE-MsgGUID: TbZLRD4RQZuRTl8Xn5mOmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65202017"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65202017"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:24:16 -0800
X-CSE-ConnectionGUID: 2lgXCh9TRSOdZEycMd5gkA==
X-CSE-MsgGUID: g/AS3Z2nQc68SGpcy+JCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189435653"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2025 13:24:15 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJend-0000000017k-0ydL;
	Thu, 13 Nov 2025 21:24:13 +0000
Date: Thu, 13 Nov 2025 22:23:51 +0100
From: kernel test robot <lkp@intel.com>
To: doubled <doubled@leap-io-kernel.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Shi <alexs@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 407/8066] htmldocs: Warning:
 Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file
 that doesn't exist: Documentation/translations/zh_CN/scsi/aha152x.rst
Message-ID: <202511130315.WOiKJQTu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b179ce312bafcb8c68dc718e015aee79b7939ff0
commit: f7c2e7108e0cf87d04d2f28078b5fefe1af47383 [407/8066] docs/zh_CN: Add scsi-parameters.rst translation
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511130315.WOiKJQTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130315.WOiKJQTu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/aha152x.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/aic7xxx.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/aic79xx.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/g_NCR5380.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/g_NCR5380.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/g_NCR5380.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/st.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/st.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
