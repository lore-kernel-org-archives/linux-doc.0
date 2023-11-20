Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="USDqxjmK"
Received: from pv50p00im-ztdg10011201.me.com (pv50p00im-ztdg10011201.me.com [17.58.6.39])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF19AB8
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 01:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1700471565; bh=ZAp7SrtTUyF1qnNZ4F6YnfdHeWOZun6+Mu4sUrQKB9s=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=USDqxjmKUEm9/GIa5/4gC7hnYIXIHuPzCL5aPL+cvlzihWOeqnr13DtbuVMn3Kq/7
	 BS5bRt2u1ynmcBaOLzombkAuXxPBmaMe+7YyY5r5woQXglMxiftAcbSyyQnJaysl/2
	 Eg5+fDzx5L2TPpVM6HWLU6Fl34yq1pPuwp/5v5lnWibSpMx+OtLC+4nr7aOf4DPFMC
	 EanaowXwvtzrITBT4+ajum2cJeeI0bMW7mhiqzR1i202nBhp7iwjB5svqVmewWXLYH
	 imYOYaNcnvNM1hxuZV9gfjQCFwC9VqNQXOZtfoGfA2Jgv6D1vLq3mLB083RVlNbxUQ
	 9XDpzcbb1DwlQ==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPSA id 0C45C680248;
	Mon, 20 Nov 2023 09:12:40 +0000 (UTC)
From: sxwjean@me.com
To: cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	iamjoonsoo.kim@lge.com,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	42.hyeyoo@gmail.com
Cc: corbet@lwn.net,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Documentation: kernel-parameters: remove slab_max_order
Date: Mon, 20 Nov 2023 17:12:11 +0800
Message-Id: <20231120091214.150502-2-sxwjean@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120091214.150502-1-sxwjean@me.com>
References: <20231120091214.150502-1-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SzJMVYm1M10MaJEJRLI9Y8E7DGdxcrov
X-Proofpoint-ORIG-GUID: SzJMVYm1M10MaJEJRLI9Y8E7DGdxcrov
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311200061

From: Xiongwei Song <xiongwei.song@windriver.com>

Since slab allocator has already been removed. There is no users about
it, so remove it.

Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 65731b060e3f..c7709a11f8ce 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5887,12 +5887,6 @@
 			own.
 			For more information see Documentation/mm/slub.rst.
 
-	slab_max_order=	[MM, SLAB]
-			Determines the maximum allowed order for slabs.
-			A high setting may cause OOMs due to memory
-			fragmentation.  Defaults to 1 for systems with
-			more than 32MB of RAM, 0 otherwise.
-
 	slub_debug[=options[,slabs][;[options[,slabs]]...]	[MM, SLUB]
 			Enabling slub_debug allows one to determine the
 			culprit if slab objects become corrupted. Enabling
-- 
2.34.1

