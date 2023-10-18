Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31B8F55
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 02:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D23AB;
	Tue, 17 Oct 2023 19:30:55 -0700 (PDT)
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id NCW00150;
        Wed, 18 Oct 2023 10:30:50 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 10:30:50 +0800
Received: from localhost.localdomain.com (10.73.42.143) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 10:30:49 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <corbet@lwn.net>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] Documentation/sphinx: Remove the repeated word "the" in comments.
Date: Wed, 18 Oct 2023 10:30:46 +0800
Message-ID: <20231018023046.30022-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.73.42.143]
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20231018103050c876d00e3408e7fe296df976a12430e7
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Remove the repeated word "the" in comments.

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 Documentation/sphinx/cdomain.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index de5d132d94c5..4eb150bf509c 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -151,7 +151,7 @@ class CObject(Base_CObject):
     def handle_func_like_macro(self, sig, signode):
         u"""Handles signatures of function-like macros.
 
-        If the objtype is 'function' and the the signature ``sig`` is a
+        If the objtype is 'function' and the signature ``sig`` is a
         function-like macro, the name of the macro is returned. Otherwise
         ``False`` is returned.  """
 
-- 
2.31.1

