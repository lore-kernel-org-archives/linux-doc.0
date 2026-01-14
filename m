Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925202F1FC7;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396652; cv=none; b=n9MQ4kyhQFZfbc+SLjW7lQocu/gEYHs3gLn9VMTn/QQe2w1WB81w410hdIYPBJT+L8gPN0H6Hpc7BpNM3XUXVZ2kAMOZF8Y6rzdBeTIN6wfju1HUnV/57dYKb2YSs+4YfgMTeW8ixmowYNKVnFsGtMUD68baFZF/4aC51RrLMHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396652; c=relaxed/simple;
	bh=wfHr9wNKFyYIJ5Okyj5woYiW9cOVx06PeOms6PzwjSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l128fFWYD6XW2nLp5tz2vFDlSVoDElZQ1aqIx2BTpdtoBQeP3/7uZtt2uVtTRGk9lZ1kNFUcsuOJrFQBuVdLW/DiT3VkxDj9TZmylfTbqO3FyfKhbYEgfjpq4I/xQ9xxxJUlYOODVApO/ZsCGIfgxkGI2X58NzGgG3ply4O98Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eu217KBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eu217KBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BDFC19423;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=wfHr9wNKFyYIJ5Okyj5woYiW9cOVx06PeOms6PzwjSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eu217KBbR/wsdAH7oSRVpqJz7AkvudzUzCXdVxwp+c6u6cPvE14CN8FNSzNXWvXWm
	 IUmN8wUmaD+fRZkv7nTb6cm6q9jm3p2cJN3IydnMWMS0I4i4XAH0NilGP4HtL7wMMC
	 HNEMJZo9jrfzOVA83EqPo/UvK5HJ31K9AZ0RLWpFemf3XDtmXkxPuoOo0ogE7WQ/u5
	 v++T/86HQFqUoqG7QWo2Dt5lV4ZEnVmAGaJpf9KtjjV21LQoRJJmRRRgBfdAHCknTJ
	 +rgbjjRiHSF8Qr/0ibNVbncbiX2gPMiivyCoyR4XnJraujnXYJU4pcRI2NyBRcZXw2
	 jddZYoLJ5MSgg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002mxg-39pF;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 03/13] docs: custom.css: add CSS for python
Date: Wed, 14 Jan 2026 14:17:16 +0100
Message-ID: <8d66988f05d06d10938e062ed4465bf303c51441.1768396023.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768396023.git.mchehab+huawei@kernel.org>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
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
index b6a7a5f6b6d4..794ed2ac8a48 100644
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

