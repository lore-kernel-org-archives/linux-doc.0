Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A476374DA
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="VlPE8Bz5"
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB5993;
	Fri, 27 Oct 2023 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=821; q=dns/txt; s=iport;
  t=1698420091; x=1699629691;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2j3j62roU9BtvsHaA8xSl04W6vi8cIw8T+FS/GCLhVw=;
  b=VlPE8Bz5Wxmdk30jJzNCMKWvpeEGFjBr7ofvmxx0MvgADg8rpxaylwAE
   1CB4zeyeVPTlFwDkTHJsY9o8HCupt+5BmQxld9XqCNt6FhLKy1tRM6wcQ
   JrEAAJKxUaNoBjYVvp2iAEf3Po1OZ9lGngOcWVCR4CbIDxEMjc4wgXOnA
   E=;
X-CSE-ConnectionGUID: 2TzUq/avRwKiuVzBIcQMqw==
X-CSE-MsgGUID: L4B7OTcHQeKYsy7kGiEcbw==
X-IronPort-AV: E=Sophos;i="6.03,256,1694736000"; 
   d="scan'208";a="9433787"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 15:21:29 +0000
Received: from localhost ([10.61.193.113])
	(authenticated bits=0)
	by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id 39RFLS5W001224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 27 Oct 2023 15:21:28 GMT
From: Ariel Miculas <amiculas@cisco.com>
To: linux-doc@vger.kernel.org
Cc: serge@hallyn.com, Ariel Miculas <amiculas@cisco.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: vfs: fix typo in struct xattr_handlers
Date: Fri, 27 Oct 2023 18:21:01 +0300
Message-ID: <20231027152101.226296-1-amiculas@cisco.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas@cisco.com
X-Outbound-SMTP-Client: 10.61.193.113, [10.61.193.113]
X-Outbound-Node: aer-core-1.cisco.com

The structure is called struct xattr_handler, singular, not plural.
Fixing the typo also makes it greppable with the whole word matching
flag.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 Documentation/filesystems/vfs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 99acc2e98673..276a219ff8d9 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -437,7 +437,7 @@ field.  This is a pointer to a "struct inode_operations" which describes
 the methods that can be performed on individual inodes.
 
 
-struct xattr_handlers
+struct xattr_handler
 ---------------------
 
 On filesystems that support extended attributes (xattrs), the s_xattr
-- 
2.42.0

