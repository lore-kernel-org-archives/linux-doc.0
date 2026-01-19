Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B872ECD1B;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=tJ6b5R+D0RtsKoMd5HuEzP9nDCQ4P5/bo8FZqp5Uhrr3kcllrLyduiwecvMfg8LcbU7661VKQ2PvTHXRjM6UrcOMURVwMaGdzkMhH8KTZLhfNPcMDwTUjPgw1QPUoCtfKS79GrftpupQAkNtRwDwL+5bSDFexaMKSpxNnYfpVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=tNwPLQqH9SM9VjmePHUTFyoY/BU3+KBoEbLstSF4Kg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dEHauqV+v0zT6N0VJuPmO5t+ZBsQkthRaPP2O2B78UOAB4ZaOyim3n51Wdp57DTUKKhcSNwFzZeU+ELFqDYGlv4DkAwiKpXmMUzzK7Rga1i0KRUNJMyLdRE4b9SAnukXX+5F3i1Dg4RDDJ5A3gdgN9AFziNgzdvrxc0NR0Gpi2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKnmkQ+T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKnmkQ+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A22C2BCB3;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=tNwPLQqH9SM9VjmePHUTFyoY/BU3+KBoEbLstSF4Kg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UKnmkQ+Txf9E4pMu9SH7MCRYL0OUcVgnrZLC4oacf5LzLsn++og1QgUBsi2f0wmV0
	 DWZiINaVqzTMSqwtVJjb+Uxmg11rz+TKyzAUzDA+qyemlNBSZpiby4uW8yIzFkUoOt
	 egwTnfKAIvMjB2McW0zFH/8KLBVuE5mqGy5YGw27XAn5AY2zLMWq8YGechxfw9F8wu
	 h92W2wqO0Q/YX2RYqi7CX3L1TSooR7ePVwaxohx96LLqdRRRdagrx8mjMxTBxGZ9bY
	 /NRHrOyS+nOf2+u2GztDObBi9x5SuByIQSIFYu+1o0GPLl3QZLMyItHlFXpHmwsJgM
	 VftZgcLQxaOGw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1Y-0h1Q;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 03/25] docs: conf: don't rely on cwd to get documentation location
Date: Mon, 19 Jan 2026 17:23:06 +0100
Message-ID: <34c38718dfade91ff6f7afca5e9c1705ba253c97.1768838938.git.mchehab+huawei@kernel.org>
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

Instead of relying that Sphinx will be called from Documentation/
dir, pick the location based on __file__.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 10322b1a28a7..f0367c48adc6 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -13,10 +13,11 @@ from  textwrap import dedent
 
 import sphinx
 
-# If extensions (or modules to document with autodoc) are in another directory,
-# add these directories to sys.path here. If the directory is relative to the
-# documentation root, use os.path.abspath to make it absolute, like shown here.
-sys.path.insert(0, os.path.abspath("sphinx"))
+# Location of Documentation/ directory
+kern_doc_dir = os.path.dirname(os.path.abspath(__file__))
+
+# Add location of Sphinx extensions
+sys.path.insert(0, os.path.join(kern_doc_dir, "sphinx"))
 
 # Minimal supported version
 needs_sphinx = "3.4.3"
@@ -32,9 +33,6 @@ else:
     # Include patterns that don't contain directory names, in glob format
     include_patterns = ["**.rst"]
 
-# Location of Documentation/ directory
-kern_doc_dir = os.path.abspath(".")
-
 # Exclude of patterns that don't contain directory names, in glob format.
 exclude_patterns = []
 
-- 
2.52.0

