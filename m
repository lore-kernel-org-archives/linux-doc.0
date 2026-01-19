Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32329AAEA;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=PQiDn8KH3UV3YspXTnz+RJ/lVUhmlzwnyW1NtfddAP8kBJ3xkd4WsKHx//839BQ/1z0Afw0TRDBnAkKfi3RIFfu9qmfni7ma9gRALHQEKiY/AWeaKp6jLNu0zRKnZN+Z5Zkm/yycdEHLSjB8Y8+woKJ5zrbm2UQ9NSIvX+P17P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=F1iY5tojuZW+LSnzsdjV0WpgMur3Wq5H16GM35OkDAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XrsHeTjliwZjTVjAD/aij2CFH5UDZPO5rG58OgisBdw0B1WonjJfPYI9VISO/G3nMTLtLsRY3FwX88q7ia1kBwz3plFvdt25786gJfJO5fTt8LBz+krsF+GgrT+3URiY64d5AQDUOmSfjGxMIU7LU9WqzotMX4uNR7lHFQH7wKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKYLUVTp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKYLUVTp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2008AC2BC86;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=F1iY5tojuZW+LSnzsdjV0WpgMur3Wq5H16GM35OkDAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKYLUVTpsDNrjnX6F8SLT7Cj9fyQQcqw/2LyzDlBedMwVf4N7dsQLBUGUenFGaoO2
	 H9CleZU7ccLfFoznE4yCQIylN3HMWYucKkf6E2GlAKDr17jYp5NYulkIAFgu5Q5lAk
	 4Q1J8T2yc+Nqw6R/VWrkuUJs9K9nl+M5Kohw5MSdexQBAQBMslCQE1XQuAF4IyQN4Q
	 wWD+cQw5Tgm8LSvJzGcUQ5twdLKed8a5h7KsZOSqxfPxU4DaT7dQi2ThmnDz5Wq2gM
	 NbAf5jJACFGQjJmTxoJvcH8JQxRQBdqfA5CXj9ByoJ1/t96LZdhlngPGzywNlvUEgr
	 SsbVv0bf13djg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1g-0uiw;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Petr Vorel <pvorel@suse.cz>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 05/25] docs: custom.css: add CSS for python
Date: Mon, 19 Jan 2026 17:23:08 +0100
Message-ID: <b5a3dfd551b887a2885b85b4c9433e757c77628a.1768838938.git.mchehab+huawei@kernel.org>
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

As we'll start adding python to documentation, add some CSS
templates to better display python code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx-static/custom.css | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 6757b5a59f23..db24f4344e6c 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -43,6 +43,15 @@ dl.function dt { margin-left: 10em; text-indent: -10em; }
 dt.sig-object { font-size: larger; }
 div.kernelindent { margin-left: 2em; margin-right: 4em; }
 
+/*
+ * Parameters for the display of function prototypes and such included
+ * from Python source files.
+ */
+dl.py { margin-top: 2em; background-color: #ecf0f3; }
+dl.py.class { margin-left: 2em; text-indent: -2em; padding-left: 2em; }
+dl.py.method, dl.py.attribute { margin-left: 2em; text-indent: -2em; }
+dl.py li, pre { text-indent: 0em; padding-left: 0 !important; }
+
 /*
  * Tweaks for our local TOC
  */
-- 
2.52.0

