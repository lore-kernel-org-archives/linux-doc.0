Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3683F386546;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=MlcRQglACMX3/en4kZgJyw97PsFays/RWy+lWJYRVgZcOjhYDy9fFnBRB4YigKXtv85ILtzK42JkI3Qnprh1221nlbOjBjuTyOPvUghjbf2CH8mTPbCIy4ftg4B9QU4yjKXLyCNrz1bk8MTHGymGZk9nyylr62Ia/h2s1hhnSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=B3aCLA38CLRmLj2OdM/72Kjt2RpUr22KLeSB8xmgElM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hswivOg7ufV4mLDjwG5/vzIa65aqM24T8Dtofv4F/lXy3eBQ1+FeCBpeaBG2GUDxndcES+v71fxZXrP3vE+A2nRSOzIAKFWGUKJavE3V3f1HcZlwtz0j8HMRg17d9Yg3lCi7K3bn5P7UGCFG03MLLQv+YWXXQSB0Y6jBhUPrci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXUliePc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXUliePc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E70C2BCB5;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=B3aCLA38CLRmLj2OdM/72Kjt2RpUr22KLeSB8xmgElM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TXUliePctSuleXNB7lIswmJ1RU+MZlluUMK1L/UPs4CyQ42Rskp0zqGMNkYO5cslR
	 9Ywlxei5OOXHwaEHroPkEfTOZMKttfq2j0+W7qJdajHMGfT/6/u63s9/KSpza9pIB3
	 vD1skDameln38d42o/LooEo/A83gu9fl70Zo7mls8EsxebowBqC6zd0mhqydK8SsVW
	 6hxc7gxIYi+NhW8tBVzoKbVQWZ4alf25EGjYy2O31laKXfjPgHUvN45+NEDb58DimZ
	 R6T1TV0UPmdZKS926fIuCfSgz3mwaDRY/o5Ik5kc/Fj0ZX1UQ6soATUHvsUFnsY1dk
	 lAKICe2WbEuiA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWo-2W7X;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 09/10] docs: kdoc_output: raise an error if full_proto not available for var
Date: Mon, 23 Mar 2026 10:10:52 +0100
Message-ID: <0c3d9dd25889784b999efdb354ade48264c0e03c.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This is mandatory, but if it is missing, we need to know what
symbol had problems.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 2bfcd356654b..de107ab4a281 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -513,7 +513,9 @@ class RestFormat(OutputFormat):
     def out_var(self, fname, name, args):
         oldprefix = self.lineprefix
         ln = args.declaration_start_line
-        full_proto = args.other_stuff["full_proto"]
+        full_proto = args.other_stuff.get("full_proto")
+        if not full_proto:
+            raise KeyError(f"Can't find full proto for {name} variable")
 
         self.lineprefix = "  "
 
-- 
2.53.0

