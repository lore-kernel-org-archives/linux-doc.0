Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805D265CA8
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767806378; cv=none; b=gQH0tHvDx9IdfhHzaVXZAOIN/qnCDqguWjTKszRI+HweyjezzJxzQi5nRejp9ChbEBtSwugiRs3KAl6ooKK2MJgjKJCnG5GkOdLotP4Q4/nYGkTgFOnQsAnkb97a6+Ina9zrKABaxC4Fs+hgz4FHmrHMDr4nSF274GH6F00RkTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767806378; c=relaxed/simple;
	bh=Ttkg2XpXdV7mU4TtIvuypgDn9POxEKCuiqAdPxPROfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jq2sHdieO+jDWEoAdRznLBVRQVX5sUAyux47inveZK95DNI2Ujpu5UNYHre+KIOOTWsqQ0gflXOf8548s2tzp74Gj330pkcfWPSVUKOqjZHwNkpGi6WSIl66N13X5tT/usQySiSgR6fLO+0hevjGzaXlsWXe6tSyzSP6/LCorNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kO7SfeXs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kO7SfeXs"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b9387df58cso2694290b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 09:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767806372; x=1768411172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=smDhjw69opHcgwAO6wrw0z059aJcdcN+GUjt6JFpHNc=;
        b=kO7SfeXs2f8ATkvexijkqHklch7k6vtiQ/AU60KPkRUeAEO9VvjfG4gDmeau4Vb7XQ
         hoWiVJjje0cbzjXE9KM7+GaL2qMZRy2P4x1FXlrcrl9ajoK6T+REl5VHr74WuXN2MbFo
         Yf53aPkRKS47vlfBvp41ZZcwfIQ3TPUvmTfB0SkkgbohS8m90MOZ5aIpvtEk3BGLSuAG
         qTbqGm977NuLG03PdPOSSDayy9X+3YrrP5OQPCTPOoabaHw7XtBIgJJuPMJUATw04MXt
         +VZxikdE3hJ8LkvKpX/tYGNE+clUr1XrurQGc3yL9N1eHGdv41kSmrW/HeNFJ2hWhc2X
         VebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767806372; x=1768411172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smDhjw69opHcgwAO6wrw0z059aJcdcN+GUjt6JFpHNc=;
        b=vOjRq/NgfUe6DHb3SvYe8JT5YsevrYn4KyUq7DWNXmg3Vs8zmN7Up1roxSRZcbEBZG
         hWOa0NWJzxtbJL6KV9/bbUtOePUSBE7NpcToR/hUSFnEvgB2jh4mvgt571VFTT3+Thtk
         76g+vJv96EPK4jbmGYRUIrBXcvh4GLLYaSVn0k2EQPqsEIXmHZwpzFhdyMnPjfLtrxJ5
         Z4PxpRpKK/579nZAnH9I+5J8SVS6mYYRksDZqyhKYVzSlBtADgp1XvGcfpoe2uP/Xqma
         mgtjyXoXUav9/xZpYC05P9FkQlONSBHnpPuqyDN2PbE60tlLWFcZ0rKaUWtefN96ndlD
         iK3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmrXrDyKctEqv5Sl27M/xBc2WNf4/xm8IwowtdI5RBUTC4EeQNhx268A6+JjYYGqxEzxLjj1c/OR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2dIjPJ3daCq8XD26Ei1XYp5PBjCvsB9Rt1fOe9TYLdTw/rh5K
	11bRFQcm3D/UGfQDCLOqRkCUnDmFAnuNaDb7gmkmngOdM+cG7ldYnbYRrPVOOA==
X-Gm-Gg: AY/fxX6AKxL/0PlmGhKZTYCZ/OBj1s6X4jK7eguTBDwe1cMcyIMayYh5qD3XKWyAQ2B
	sZfJYdZX4y6DduOyqMGkXRljS7CzW1zhqQ0TYZ5seAv2Zs13Yoas3ieq2Y09OuLmnDjq/7y0z4X
	oYdVrf9ZyZ9M5OuUY7mQfst8XBQDdACFvAtZN+1DyrmkWlP59FrksVDIik8uqmjLxGLhG+odfhL
	LUJLUXnDFyVJRdw1h3LgTluLBfcOdtOir4sK7Y0x7AMobghSW4DUCJIkTIde5tAeqazOAlwUmgq
	30lc+eBlXf6T2HKM95B2ZW7gCkq//eWNlkUBoxQf5ki34mk4qDwETfmg/wdRdNshogXsUpehiHe
	O92HqzQLgpoe5dR01w/RPB+tZZKqNLDxdoBUXiw7N9/3Gtfk8/sfPMbMM1eGtrPbLnifR3rB1oV
	zf0d1leBpZPu/3CdT792JbNKWdspf33KsDhkNWzbudjuqA
X-Google-Smtp-Source: AGHT+IGk3VZwDE/lNocDKTrmheVpB/dJskVwCoQ351Cwl656mI6EkUE/J2SR25sUuHffBBW1+p+c1g==
X-Received: by 2002:a05:6808:668c:10b0:45a:7773:9013 with SMTP id 5614622812f47-45a77739cc0mr200634b6e.21.1767799968204;
        Wed, 07 Jan 2026 07:32:48 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm3393292a34.15.2026.01.07.07.32.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:32:47 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
From: John Groves <John@Groves.net>
X-Google-Original-From: John Groves <john@groves.net>
To: John Groves <John@Groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: John Groves <jgroves@micron.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	venkataravis@micron.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH BUNDLE] famfs: Fabric-Attached Memory File System
Date: Wed,  7 Jan 2026 09:32:44 -0600
Message-ID: <20260107153244.64703-1-john@groves.net>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a coordinated patch submission for famfs (Fabric-Attached Memory
File System) across three repositories:

  1. Linux kernel (21 patches) - dax fsdev driver + fuse/famfs integration
  2. libfuse (4 patches) - famfs protocol support for fuse servers
  3. ndctl/daxctl (2 patches) - support for the new "famfs" devdax mode

Each series is posted as a reply to this cover message, with individual
patches replying to their respective series cover.

Overview
--------
Famfs exposes shared memory as a file system. It consumes shared memory
from dax devices and provides memory-mappable files that map directly to
the memory with no page cache involvement. Famfs differs from conventional
file systems in fs-dax mode in that it handles in-memory metadata in a
sharable way (which begins with never caching dirty shared metadata).

Famfs started as a standalone file system [1,2], but the consensus at
LSFMM 2024 and 2025 [3,4] was that it should be ported into fuse.

The key performance requirement is that famfs must resolve mapping faults
without upcalls. This is achieved by fully caching the file-to-devdax
metadata for all active files via two fuse client/server message/response
pairs: GET_FMAP and GET_DAXDEV.

Patch Series Summary
--------------------

Linux Kernel (V3, 21 patches):
  - dax: New fsdev driver (drivers/dax/fsdev.c) providing a devdax mode
    compatible with fs-dax. Devices can be switched among 'devdax', 'fsdev'
    and 'system-ram' modes via daxctl or sysfs.
  - fuse: Famfs integration adding GET_FMAP and GET_DAXDEV messages for
    caching file-to-dax mappings in the kernel.

libfuse (V2, 4 patches):
  - Updates fuse_kernel.h to kernel 6.19 baseline
  - Adds famfs DAX fmap protocol definitions
  - Adds API for kernel mount options
  - Implements famfs DAX fmap support for fuse servers

ndctl/daxctl (2 patches):
  - Adds daxctl support for the new "famfs" mode of devdax
  - Adds test/daxctl-famfs.sh for testing mode transitions

Changes Since V2 (kernel)
-------------------------
- Dax: Completely new fsdev driver replaces the dev_dax_iomap modifications.
  Uses MEMORY_DEVICE_FS_DAX type with order-0 folios for fs-dax compatibility.
- Dax: The "poisoned page" problem is properly fixed via fsdev_clear_folio_state()
  which clears stale mapping/compound state when fsdev binds.
- Dax: Added dax_set_ops() and driver unbind protection while filesystem mounted.
- Fuse: Famfs mounts require CAP_SYS_RAWIO (exposing raw memory devices).
- Fuse: Added DAX address_space_operations with noop_dirty_folio.
- Rebased to latest kernels, compatible with recent dax refactoring.

Testing
-------
The famfs user space [5] includes comprehensive smoke and unit tests that
exercise all three components together. The ndctl series includes a
dedicated test for famfs mode transitions.

References
----------
[1] https://lore.kernel.org/linux-cxl/cover.1708709155.git.john@groves.net/
[2] https://lore.kernel.org/linux-cxl/cover.1714409084.git.john@groves.net/
[3] https://lwn.net/Articles/983105/ (LSFMM 2024)
[4] https://lwn.net/Articles/1020170/ (LSFMM 2025)
[5] https://famfs.org (famfs user space)
[6] https://lore.kernel.org/linux-cxl/20250703185032.46568-1-john@groves.net/ (V2)

--
John Groves
