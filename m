Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7121230E83B;
	Tue, 12 Aug 2025 15:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013985; cv=none; b=FE54RY2nOE/aLp53KExiZ+A13b9yG55j9aK4bv3Ty37Zef5mXxmXrp3AmhMj0xJflarQvBdknB1u8hYn1UPPKJlLC5bmF+Bagy0YYJDJNAhVoCKBjK7Opg6TNZBGHR8fW56mGz4S7pod1xz8ZMtp+CX4dt5IRTTAsHG1/k8ZeOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013985; c=relaxed/simple;
	bh=HRyoaqgBpGj0yMJpohLVQjmYgGi9rpud//gcUb4ofas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVYGJE1epv2OmLCm8ReXgbLQDXda81OEhJgbDTLPDwN8j8V+VUAlkmU/LMZniOuFHQIcVBOikGSSyS5Yiz/trmkZXUVdr29D4KLRndG2zOdUFn2pzWFh8TSYWh1/5gfEQ1LUUt6hKlgfSu5/vH/dLfGXjeLHORbzyV8ZnyWYRs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNb7H8C5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNb7H8C5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CB8C4AF0F;
	Tue, 12 Aug 2025 15:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755013984;
	bh=HRyoaqgBpGj0yMJpohLVQjmYgGi9rpud//gcUb4ofas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TNb7H8C5beQY8DOiQy9XZMW6/Xs+pz/Ftzlcrqu6Yo8ZdKB3foe+Rczw9ZpSM6CJH
	 k9skTAwcfPey60bbJdDfm8dm2tME6/+3xoAfoHEBu0I3Fyc4liuwxa9S57xnkmDIag
	 IkKqbbe5qMbn5vSaj585rbqYIubM+A0DhkKZB0fMHHcnGRhHAyrrWDc4AkPkk6mu7s
	 /KRrdZyvVX4CE9T595JZ6fLyuhoMQ4/jT8m6whAmCM2VYTV03Bc7eryz428uU07pfd
	 xbKEDmS2JD86OKYyFKrtHOU3k/ChYxeszOEf5gMfyfC40XpdRr2vWY0LROwq/jHBnB
	 PL28YPp9EbjHg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1ulrJ8-00000006kW6-1wrn;
	Tue, 12 Aug 2025 17:53:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/39] scripts: sphinx-pre-install: output Python and docutils version
Date: Tue, 12 Aug 2025 17:52:31 +0200
Message-ID: <96142ec916b9064c859b200639c3595115080322.1754992972.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1754992972.git.mchehab+huawei@kernel.org>
References: <cover.1754992972.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Specially when debugging issues, knowing the versions is
important. Add it to the script output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index 42f55e67256d..de5bcfd052b5 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -154,6 +154,20 @@ class SphinxDependencyChecker:
 
         cur_ver = sys.version_info[:3]
         if cur_ver >= MIN_PYTHON_VERSION:
+            ver = ver_str(cur_ver)
+            print(f"Python version: {ver}")
+
+            # This could be useful for debugging purposes
+            if SphinxDependencyChecker.which("docutils"):
+                result = SphinxDependencyChecker.run(["docutils", "--version"],
+                                                    capture_output=True, text=True)
+                ver = result.stdout.strip()
+                match = re.search(r"(\d+\.\d+\.\d+)", ver)
+                if match:
+                    ver = match.group(1)
+
+                print(f"Docutils version: {ver}")
+
             return
 
         python_ver = ver_str(cur_ver)
-- 
2.50.1

