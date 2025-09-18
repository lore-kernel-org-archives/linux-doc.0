Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739EA2FBDFD;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196506; cv=none; b=jkXN/+hk8mwqtgysZfV7P/EbZwU7XG0mrycfXtwkrckGkGg22CUkXcugG1zl3AeoTPFClM9kNlbuqDmyXMLgJN1Y4Q4WcJPtUrLWAtfrtrsHK+ns5aVUe2/WyItJwUQyz+CFOjIOajeIKyGirP7z1vtTcNnPB6LlGlwPvW53yd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196506; c=relaxed/simple;
	bh=AH2lL83LG/MCK6GW00LCQjiXUczLYQf3wfFtphqsZ6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1zmmvLGp23VpKbkW1EmfLhb4ed94P/IrQ8s78c7/pAY34dd1rgmEdSdp5KT4dSElT1SKC/pnNpUV/H3s3XzkO0XkyyZjDKzpYS2jLETleN5ipxnZhMrq9ubicQ1hAI3tIbeYHJ1rk0Azb5TaNZzOb/z+czgSnauBaRCcwAaT6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFy9/200; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFy9/200"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B45AC4CEFF;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=AH2lL83LG/MCK6GW00LCQjiXUczLYQf3wfFtphqsZ6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oFy9/2009MSF9lVwB/c4IGmRbx5k6u06iBl+gT4pj/Y5KLN7agcfAl8aEcWFEkJy9
	 sIx1LBjcoaNWMJiHZyIevKcOJj6WyvYN7Oy2mGcrl56bkNzr9idPsBM36a5jLfZnbe
	 rxRzS8rf+wKTAz1HwnRtdCoeR73H8kWvgRVsDfLFI0NnDYygil1C50yxkC70kp9P73
	 1JJbNZ/0rQ0kte8O4qpuQ13nKOkqW3WkPhjZUaCtiVxqU7kXi7JRDgg+Rr7uDnhUW0
	 vnJhrZuAeZYc4S8vh/8+6V6jjPgnZIBiuL/w+h2RnkvQ50p7VXVUCKa467TDeNCDdD
	 tvtjSOYPtFDug==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE7-0000000CroN-3vuf;
	Thu, 18 Sep 2025 13:55:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 08/24] tools/docs: sphinx-pre-install: drop a debug print
Date: Thu, 18 Sep 2025 13:54:42 +0200
Message-ID: <27f76a4df2b80c38d277d58a92c85c614544e013.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The version print at the lib was added for debugging purposes.
Get rid of it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-pre-install | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 954ed3dc0645..fa12e01fc7fe 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -285,7 +285,6 @@ class AncillaryMethods:
         cur_ver = sys.version_info[:3]
         if cur_ver >= MIN_PYTHON_VERSION:
             ver = ver_str(cur_ver)
-            print(f"Python version: {ver}")
 
             # This could be useful for debugging purposes
             if SphinxDependencyChecker.which("docutils"):
-- 
2.51.0

