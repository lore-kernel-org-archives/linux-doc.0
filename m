Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFC112B8A
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AD4268D;
	Mon, 23 Oct 2023 02:57:48 -0700 (PDT)
Received: from unicom146.biz-email.net
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id TLD00040;
        Mon, 23 Oct 2023 17:57:40 +0800
Received: from localhost.localdomain (10.73.41.161) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.32; Mon, 23 Oct 2023 17:57:39 +0800
From: Tom Yang <yangqixiao@inspur.com>
To: <Liam.Howlett@oracle.com>, <corbet@lwn.netcorbet@lwn.net>
CC: <maple-tree@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tom Yang
	<yangqixiao@inspur.com>
Subject: [PATCH] Documentation: maple_tree: fix word spelling error
Date: Mon, 23 Oct 2023 17:57:37 +0800
Message-ID: <20231023095737.21823-1-yangqixiao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.73.41.161]
tUid: 20231023175740783259553f3d11df68746afd8735c465
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The "first" is spelled "fist".

Signed-off-by: Tom Yang <yangqixiao@inspur.com>
---
 Documentation/core-api/maple_tree.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index 45defcf15da7..96f3d5f076b5 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -175,7 +175,7 @@ will return the previous entry which occurs before the entry at index.
 mas_find() will find the first entry which exists at or above index on
 the first call, and the next entry from every subsequent calls.
 
-mas_find_rev() will find the fist entry which exists at or below the last on
+mas_find_rev() will find the first entry which exists at or below the last on
 the first call, and the previous entry from every subsequent calls.
 
 If the user needs to yield the lock during an operation, then the maple state
-- 
2.31.1

