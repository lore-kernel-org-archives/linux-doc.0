Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00542FFDF4;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=IKmzSRsZuhETKmICiWz/0qyLfMVd2Fk1qhaRPzYh8tHb++x+sBGjxwRTk8eQCVhTGmHvacXJAksLkrIOFRLIoIJB8OPcLykSIOjVmZWaeeMu4m15OjCEodjurRkyonYQxgq4h0aTzzi0oxttIFy9EpbcyNlK0tTD5x7ASf9OQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=h35GQjTzKETww/de+/JJ266keYt1cW4CrK3wQ0G4aa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9jmikhAEJEztej14y5pLm0sPc7Ul6yOzWSzcqpBiiNOm83N3u47qViwyUoc0ybV9s5huc0fWqEoExRV1z7KvbfIpGyF/mYLsJfNRzHRUSVnvU+70tw+j3s1EviLGAgNW0fM/vANfklsBswlyc5dQzO2veTN/VdAh35cvwqeg2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E37Hqwbx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E37Hqwbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62956C4AF17;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=h35GQjTzKETww/de+/JJ266keYt1cW4CrK3wQ0G4aa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E37Hqwbxae1udtLLjQm1oGeg1wmu6Fn7z8E/b5/iR2Vt9rfKUIwICBuTNEqb5hAP6
	 NPcGI9ZIC9ydUZwaPoanNNMfGLaVnfSqMrgcXFCsj1CcC+1YUO5/nGxji9dC8iNnnV
	 lJS1cW51uPFMap1AqGEb0WhH447y92LbYJHzcZhg6I1nt+/LRmGY8g4LkFRYRaRNDx
	 vPUyHlGpb5lTMTh3d/qGuhijAEyfyUvLbRYOquKdsgSoX22it/L+6PKEP9gpTm4hMX
	 FuEUB80nuI3/tCcGqpaIW0OyooxVA7IozPROiMeehx5djny0jrkRVToBcKbHPFSJ1N
	 jNTJKnO2EoyDw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2s-2ti8;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 23/25] docs: jobserver: do some documentation improvements
Date: Mon, 19 Jan 2026 17:23:26 +0100
Message-ID: <18a9c1406bdead680e3ee5768c97ae8b2138e8ea.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Make Sphinx handle better jobserver class documentation

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/jobserver.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index 616411087725..8da1973e5c87 100755
--- a/tools/lib/python/jobserver.py
+++ b/tools/lib/python/jobserver.py
@@ -11,20 +11,23 @@ Interacts with the POSIX jobserver during the Kernel build time.
 A "normal" jobserver task, like the one initiated by a make subrocess would do:
 
     - open read/write file descriptors to communicate with the job server;
-    - ask for one slot by calling:
+    - ask for one slot by calling::
+
         claim = os.read(reader, 1)
-    - when the job finshes, call:
+
+    - when the job finshes, call::
+
         os.write(writer, b"+")  # os.write(writer, claim)
 
 Here, the goal is different: This script aims to get the remaining number
 of slots available, using all of them to run a command which handle tasks in
 parallel. To to that, it has a loop that ends only after there are no
 slots left. It then increments the number by one, in order to allow a
-call equivalent to make -j$((claim+1)), e.g. having a parent make creating
+call equivalent to ``make -j$((claim+1))``, e.g. having a parent make creating
 $claim child to do the actual work.
 
 The end goal here is to keep the total number of build tasks under the
-limit established by the initial make -j$n_proc call.
+limit established by the initial ``make -j$n_proc`` call.
 
 See:
     https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html#POSIX-Jobserver
@@ -40,13 +43,14 @@ class JobserverExec:
     Claim all slots from make using POSIX Jobserver.
 
     The main methods here are:
+
     - open(): reserves all slots;
     - close(): method returns all used slots back to make;
-    - run(): executes a command setting PARALLELISM=<available slots jobs + 1>
+    - run(): executes a command setting PARALLELISM=<available slots jobs + 1>.
     """
 
     def __init__(self):
-        """Initialize internal vars"""
+        """Initialize internal vars."""
         self.claim = 0
         self.jobs = b""
         self.reader = None
@@ -54,7 +58,7 @@ class JobserverExec:
         self.is_open = False
 
     def open(self):
-        """Reserve all available slots to be claimed later on"""
+        """Reserve all available slots to be claimed later on."""
 
         if self.is_open:
             return
@@ -118,7 +122,7 @@ class JobserverExec:
         self.is_open = True
 
     def close(self):
-        """Return all reserved slots to Jobserver"""
+        """Return all reserved slots to Jobserver."""
 
         if not self.is_open:
             return
-- 
2.52.0

