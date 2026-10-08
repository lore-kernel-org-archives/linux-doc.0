Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA344D487E
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482846; cv=none; b=TevoLJQPDbzs5xeF/BYQ6yoc8x7yI8SMGbKr5r5G3RdWzIrwyvwBik+SbALAuJZwRXoYZchS2lgWmm510KDgmX/DAmk3WyCm1+FTVkJk9d5SRu14SyPseXLlYrySj5EovH3nfcZRODi4B97eD24vo8MhSQFraIOj7gHqkmN/yJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482846; c=relaxed/simple;
	bh=VRTrMnRCtIFbD2EyB6N5w6LrzMeEzaYWJ1e5rAtXRnk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kh+iNs59FRf1XvFC2Jcv1ujCU+njODRt0l4zIH0e6uyX9yAxy2xPJa13ephSoelC+pB3DqOvAET3qNXy6ZZiGR/2wxwC+XAhefjbnEupcTykQwETZl7hAJv0X8FaLLNhF9i62MTx4mG09Gnld8FiPNaEinLS4vYCIq45V9LIAQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYZzvBf2; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYZzvBf2"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccd0887c542so1556812a12.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482843; x=1792087643; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vx1hsDBsieq23jav84qc39RHrlNeTK4K/qIOXf26Ahg=;
        b=PYZzvBf29MHLgDE7VSxoI1H+U/kczGOtiuSEIqBbnTFlUsiakEdJLEpD7lMSk4l7ad
         X4qwK6mqCGQgcjwFsh40xizPLxk4onropzLURQCsy6iiKwQe7sWLnqPQLqA67dG+F4ij
         HnpstnhUBZTez6xsaygbyIL2R88eKx5OyN3kZzeaKtQIEUME+sm2TMRj6XU8Fo91yhT4
         3FRSCdLPpjMxD11PUthED9Fn1blsbDAWHU1bitwx9sJZKvqwhblE1HvI9WjK2Pa1unld
         wtOUQ4an09pKPXUrreCbmmcO5nwc10NwO72gDLN85lGYLOiAgzPw+zFYyvlHAm9h7m81
         YgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482843; x=1792087643;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vx1hsDBsieq23jav84qc39RHrlNeTK4K/qIOXf26Ahg=;
        b=wqqyBFH+Cz2iO0A5C13IJ+qdsesG5aff3YQJrLw6aHAdxxRbHFq8cyA+x76nghZ8gL
         fgsqwvk4pM7IMGm3UZFnvf52PbzjsDZH+Af7HHSIEIpARULcfRLkCIJrAQvYIfblyjNJ
         yVPporOOHSpKyUotRiGhAS5ziVU8o51b9Z6rE0T5yWhZZdAca0W19fYv78nJiGU6HcP8
         Mx7d+S9JGi3m7R0PLEB6Wj4ewfqdLe3OEz9oyr+B+tA2pYkeKDsjTD5ZHoCfpqnYBD9B
         Y2EJ8tk6vvBflgoua7Piv81ISXV0gJyW049AJpr2Ijj7Z8rPrBgYs63B3gl6y9Ydi60m
         iEMg==
X-Forwarded-Encrypted: i=1; AKwUvBy3FcSOfAXHhe8MNoI7tJJjCFj1fs7UdWlBGsFW1mzpIP89PwfwFKXHXO3d1LTsagIwiz7t81Xfs/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBzUu8twCDQnSZQMLYipo6nnh6HpvNtCiEOzEBB54mg5L9M+Fo
	G0i/GgyArabI4eOkn85hibR9tbQ0Xi2n5r8SGyJ5b+X0TZL25qHodSTc
X-Gm-Gg: AYBFou28neNo3BI6hRWqhc3Q4z44VQ79EJ27GhjyMHXAdX2LkA7mJxg0FtPde/y9pI2
	gXp2Fp/jkS/7n+Tkg7XIw8qAN3GVSsePqnigqdg8OZc0Rqiy2rlbpi3gP7as/eCN+qjEFsIuxSW
	40RgcgegYHIFPrg5mdJ33zy8kIr5a/a0slodqoeGjEUD/jT0zJZy7ysSuYjuamHjsxHPVALQpks
	7ApHQaFajFVmV6DkVpDDnheWloDCAw/FfH+IaF4q6EFcVm2Zu4EPF5PMGutprgB1z8VN2sEi3zB
	S1s/6/bVp+weiQdaGqDGMxo8TbWGdC8DYIq57iznvwS/Jh5jA/wUUW1w7xubzz143pt91ra7yUv
	YFSVh0kvTbocH/rWPJkHn5ddFCnJ2L4TQYgPAcXj31iVE7x05BHDXOIYvcSx28hdqpDlftMOwoa
	7biEpkek2qc/4S+c3/yCUwAmvRuUpMPvpfp/O/oSK/0mD7zWa9Po+FaGdaXuovyWy15oNGYrZXu
	z3O69U37VeX263R
X-Received: by 2002:a17:90b:2243:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-3a8a1cea2c5mr5582516a91.62.1791482842628;
        Thu, 08 Oct 2026 11:07:22 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab31fccd1dsm268530a91.2.2026.10.08.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:07:21 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH v2 0/2] fuse: support per-inode open and release
 suppression
Date: Thu, 08 Oct 2026 11:06:43 -0700
Message-Id: <20261008-fuse-per-inode-no-open-v2-0-39c60fe97728@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPbx2oC/4WNQQ6CMBBFr0Jm7ZjSgIIr7mFYtHQKk0jbtEo0p
 He3cgGX7yX//R0SRaYEt2qHSBsn9q6APFUwLcrNhGwKgxTyUgtxRftKhIEisvOG0Hn0gRyaRpD
 UjdK6U1DGIZLl9xG+j4UXTk8fP8fPVv/s3+RWo0BNrZS9pa637TCvih/nya8w5py/lZaIQ7wAA
 AA=
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791482840; l=3230;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=VRTrMnRCtIFbD2EyB6N5w6LrzMeEzaYWJ1e5rAtXRnk=;
 b=4xlDZOqYR1DmUGgZwSQ7y/+HVBLKUTM/oO7OPIm1JRzOuAmiQzYTKCrh2oAARzLuSEoBW4sN4
 NuVzaOuGKGYBhcyA57F1mp4GqOnJ+RqxRAR03KPNMfZE4W2vhMcuESB
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

For FUSE filesystems serving immutable data, warm-cache workloads can
still spend much of their time sending OPEN/OPENDIR and RELEASE/RELEASEDIR
requests. Data, attributes, lookups and directory entries may already be
cached, but opening each object still requires a userspace round trip.

The existing connection-wide no-open support cannot distinguish these
objects from control files that need the server's open and release
callbacks.

This series adds negotiated per-inode suppression. A server negotiates
FUSE_PER_INODE_NO_OPEN during INIT and marks eligible inodes with
FUSE_ATTR_NO_OPEN in their attribute replies. The kernel then handles
opens locally for those inodes, using a zero file handle and the existing
no-open cache defaults. Subsequent requests identify the object by nodeid.

Release suppression follows how each handle was opened, so changing the
inode's hint does not create an unmatched release or lose the release of
a server-opened handle. Atomic O_TRUNC still sends OPEN to the server,
and CREATE retains its existing open and release lifecycle.

The second patch adds a raw /dev/fuse selftest without requiring libfuse
support for the new protocol flags. It covers capability negotiation,
files and directories, LOOKUP and READDIRPLUS attributes, hint changes
through GETATTR, hint preservation across STATX, atomic truncation and
CREATE. The cases also run with writeback caching enabled.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
Changes in v2:

- Preserve RELEASE after successful remote flock operations, including when
  OPEN was suppressed, to retain server-side lock cleanup.

- Document the flock exception and the requirement to accept RELEASE with
  a zero file handle and no preceding OPEN.

- Synchronize test-server requests before unmount to avoid racing with
  asynchronous RELEASE replies.

- Extend selftest coverage to 68 tests, including flock cleanup after
  SIGKILL, duplicated descriptors, hint updates, CREATE reopen, ioctl
  handles, and connection-wide ENOSYS precedence.

- Link to v1: https://lore.kernel.org/r/20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5@gmail.com

---
Stanislav Kinsburskii (2):
      fuse: add negotiated per-inode open and release suppression
      selftests: fuse: test per-inode open suppression

 Documentation/filesystems/fuse/fuse-no-open.rst    |  49 ++
 Documentation/filesystems/fuse/index.rst           |   1 +
 fs/fuse/file.c                                     |  26 +-
 fs/fuse/fuse_i.h                                   |  17 +-
 fs/fuse/inode.c                                    |   9 +
 fs/fuse/ioctl.c                                    |   3 +-
 include/uapi/linux/fuse.h                          |  13 +-
 .../testing/selftests/filesystems/fuse/.gitignore  |   1 +
 tools/testing/selftests/filesystems/fuse/Makefile  |   2 +
 .../selftests/filesystems/fuse/no_open_test.c      | 859 +++++++++++++++++++++
 10 files changed, 972 insertions(+), 8 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261007-fuse-per-inode-no-open-d40e2b4abb8a

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

