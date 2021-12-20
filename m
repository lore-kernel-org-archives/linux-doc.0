Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4A2C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Dec 2021 20:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhLTURf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Dec 2021 15:17:35 -0500
Received: from mga14.intel.com ([192.55.52.115]:53046 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhLTURe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Dec 2021 15:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640031454; x=1671567454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBFgmP+RMvrI65By3GPfdMV9ExJhZN3mKMyAqOxmCFQ=;
  b=hL2wOHK96o2UbUPgvn1NnU9NsvcNaQSZTAue/VB4wzQLZVj5jtwXhwYR
   v5eXae690eO+36O3IjrOCNbjZYNvcxzXZh+9PB5VplD+E3jVeHAMn9Zst
   h5ARF6QVV0dD28tDFIQmuu26IOvO2UY2YggAc0HVPz+FsAth/xUCP9Ygk
   QWxWmpR8Kt7rtulibVOvoFz8U6gaTNDkxZrcJ57YqggvAmpr3HeeLszpE
   gXCL1LkOMcCUtw6u6i5lisqe03+eFoVYPvmyU/gMX+dDJLsjnofYKjtMi
   UWVnZCK2UoBvxtTuXgJ8PYRjgggHNzUH31A4CmoBWzjt2MFNlWP0Y5J4X
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240485116"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="240485116"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 12:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="467529068"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Dec 2021 12:17:21 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzP61-0008Bn-1d; Mon, 20 Dec 2021 20:17:21 +0000
Date:   Tue, 21 Dec 2021 04:16:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-doc@vger.kernel.org
Subject: [RFC PATCH] sysfs: __sysfs_add_file_to_group() can be static
Message-ID: <20211220201616.GA26722@70be3f45abc0>
References: <20211220064730.28806-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220064730.28806-1-zajec5@gmail.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

fs/sysfs/file.c:379:5: warning: symbol '__sysfs_add_file_to_group' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 file.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 30c798c38d89d..fe58c4fd4c60d 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -376,10 +376,10 @@ EXPORT_SYMBOL_GPL(sysfs_create_files);
  * @attr: attribute descriptor.
  * @group: group name.
  */
-int __sysfs_add_file_to_group(struct kobject *kobj,
-			      const struct attribute *attr,
-			      const struct bin_attribute *battr,
-			      const char *group)
+static int __sysfs_add_file_to_group(struct kobject *kobj,
+				     const struct attribute *attr,
+				     const struct bin_attribute *battr,
+				     const char *group)
 {
 	struct kernfs_node *parent;
 	kuid_t uid;
