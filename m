Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748700;
	b=Xt1K4Fusu9SB+NtWOIQ74FWSbiFnekETwLbkjc9km+9//9TgouwlfUUzG2TgMeUQ/C3a
	 iirWguUF05SDk9L/1OZ127F9sKbGpcR5xbKfJS01LGfK5idGMm3wX2M9BAQGnfhVLghuS
	 kQOjW/AsOHXsrRMixIPW4wdrOiRO85Wyf6BOaCIr+5qFH9KYzdsbNMMsCWy3GlUK6vBWV
	 1Ddn0yuleCdmEastTW0HOPkYCW/yw6/KbTZd6cD/URe5WcW7Ph/53xMHFCaSC94RXIoDK
	 5apK6w/+yZy5sjUSAaJx5lzG3NYL8qHTVVI4DCB96sPztgHCyk0IS8FtslBsTF/YFgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748700;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0VKcGJjC0XIghfJ07Ncgp/GPkOnHkqrT2/GgddonycI=;
	b=drzbX4iuBJYm0SYKvKXqy6ol5aCbwKj4tMNzQtP8OxAYnTo/w2rD8VlLd3aIk86cIh2E
	 7XyHxCOE+WSSbg+q5s2L8SFB+zcFhTveTU16dZEiycJQpivnauYNsEw8TC+Xnyt2miGJT
	 d6rx31f0BkIKmAUScg6t5zJFCjFUH+t78y4x7FGOhrptN12r+n0ZCWfGOWumOiEoKB434
	 77zPmgJ7ezB1Ob9KVJ0XzEjhOrINYVYxGb8Zl5+moVXv6se5DtEXFiZsPHGpASMbJQZcQ
	 3uwciYxpz+bLkWnuJIWcOoznknxtLQuMwBeALQNjGPBrIz/KSzV+mftfSQ4fDzAFNmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dfEi8Wom;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ACF606A31F
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 09:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13ACF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dfEi8Wom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792748699; x=1824284699;
  h=date:from:to:cc:subject:message-id;
  bh=xaNiw2hwbrMV267XA8ufFNjJHn9wxf4xIJ159FYAzGU=;
  b=dfEi8WomIv/RXqZzYKh89ubfvtvBZ+wLsSemAUmI6ansZ1gGSRETCsPy
   GpI6GgZM3h1JwWERedr55PxIysWmxtQt4hmGELGL3gC4Rkt4XgZgH6VDz
   Opu8DXzTjUXE6Lvxh9mMEe3myPrnUqizYTPgrgPEzT9BmX7cvD6NH6gD1
   Er++pNp4iDZWXYPpvCRIgrvkjVdWbsBmKV0tpzWe2NxAhpraeX5F0hGaD
   X0bSV/s1sAKkck0Sbjr5GhnsSIZh8ZyhCXi6c+j6c+N91vRxc/eVxvI3B
   SC7d6PlBJaOZ3TrvzLtRqz8vl10i+SGEQ+SKQxkU9A57WjnmvPSI1mQUx
   A==;
X-CSE-ConnectionGUID: owBOAt09TY6Gir4//yV6fQ==
X-CSE-MsgGUID: UNjIS621Q1yBsEsAdlmdSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1601200"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1601200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:44:58 -0700
X-CSE-ConnectionGUID: hafQcMtLT5y+XKyFM1gZtg==
X-CSE-MsgGUID: pLkowOmmTGC6wbZzNKJZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3944056"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2026 02:44:58 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKBpW-000000000Zr-3Yum;
	Fri, 23 Oct 2026 09:44:54 +0000
Date: Fri, 23 Oct 2026 11:44:51 +0200
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [docs:docs-next 97/115] htmldocs:
 Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:361: WARNING:
 Inline emphasis start-string without end-string. [docutils]
Message-ID: <202610231144.X9spCoJF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git docs-next
head:   f857ff5bf007f3394b704e200096571cbffdcc3a
commit: 131006cc650ccf5cbd2d6ac1953a263eb25756ea [97/115] docs: core-api: include documentation from linux/uaccess.h
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.22.4, Python 3.13.5, on linux)
sphinx: sphinx-build 9.1.1
reproduce: (https://download.01.org/0day-ci/archive/20261023/202610231144.X9spCoJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231144.X9spCoJF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./include/linux/uaccess.h:532 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   * This is like copy_struct_from_user(), but the
   WARNING: ./include/linux/uaccess.h:556 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   * This is like copy_struct_to_user(), but the
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:363: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:361: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:373: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:376: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:453: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:451: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:472: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:777: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:779: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
