Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5233A010;
	Tue, 27 Jan 2026 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508824; cv=none; b=oevCO4kyJw0tyzdLfJisbK/c19s3QQrpF4lC9w81Ez2ilpj6LogcHLWLAKEHEf9X8Zm7eYpl+uZMVhviTcz9o6S8oxDSDs8tK0ahKNZ2N1vNZNmLnCUNkltEBueZqMRkGmaR8HarhisDeOAevORwql+6nehTIqagHEqGTYiFQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508824; c=relaxed/simple;
	bh=hIvi/x00utHlTyl9n0S6bmr97RufBc5sZd869/LJ4Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MouBTA20HrTHEyeoXggTl6NKb1V+JAUoMwN+qLmhIpYEiru/CDvfH8XRXYDflFFWLfR57WGQC5/JGC58W39PxMTCHaXiCczhcnYCe5v+Ho1O5UhdlymThn72STNAPseRfqzPkHHSCIr1pRk4dxz3Mrqlg2pCFhS04FDwt3AMDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ic4gfE4n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ic4gfE4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D71C16AAE;
	Tue, 27 Jan 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508824;
	bh=hIvi/x00utHlTyl9n0S6bmr97RufBc5sZd869/LJ4Pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ic4gfE4nv3XivmehOdrUGWq9WTTXdsGawoXY/K9TXfVKo8ZPNy8vp7NfKtSU3+QDg
	 6Vhjv9jPF/krOMTyw/h9XhEiXeJXfqyO6GoZCohQ4CiRFPKaQw+V2UBZlrBYWVku5w
	 DquyRQPoLFuBdfcOQJfATwNi1JnO7TSUxowfRQLfd/kaybW9IMMEzyIwoDg5/yq/O9
	 XXb1r2XkQmxjK15+Gly0r3DwEkrLvSUAM6KvTmce7laAGC7gMYTJyn3HRz4gyeMSgF
	 wja5k9DCC27qhzAPP5WpsPjoKACzSxw9r85SfASOp//ZWbYDaT2cwvUcSxIUXBd3Fe
	 bKJhtas5ojO4A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4s-0000000BVVj-2QEZ;
	Tue, 27 Jan 2026 11:13:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 13/14] docs: kdoc_parser: add support for LIST_HEAD
Date: Tue, 27 Jan 2026 11:13:32 +0100
Message-ID: <680aae024b4292f3dbc40bf1b9e556e95aef890a.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Convert LIST_HEAD into struct list_head when handling its
prototype.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 4507f6159a75..4be7728a5e62 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -222,6 +222,7 @@ var_xforms = [
     (KernRe(r"__ro_after_init"), ""),
     (KernRe(r'\s*__guarded_by\s*\([^\)]*\)', re.S), ""),
     (KernRe(r'\s*__pt_guarded_by\s*\([^\)]*\)', re.S), ""),
+    (KernRe(r"LIST_HEAD\(([\w_]+)\)"), r"struct list_head \1"),
     (KernRe(r"(?://.*)$"), ""),
     (KernRe(r"(?:/\*.*\*/)"), ""),
     (KernRe(r";$"), ""),
-- 
2.52.0

