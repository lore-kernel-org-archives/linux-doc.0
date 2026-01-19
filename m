Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A22A1A3172;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=ETUkyUCrE/7wF/7Q4Ovih8BFv9/DPyYH9m841VkiSe/sW4mVEmHNmsE6tMW0yF3e2/0kt7OkCQZM3sUlwHLYXIZshgG6G7CnmmfwHnF/5fJsIEL6tVvlQVEV4twb8erCE7TJG+Ols+zK1OUxhxoV5tley7lDTM85QetVV/GRhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=TKR+6Sf3vzBuaU+H9wxtOvYytkyV04qz1b4yGIhER0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXiFY5fL/fNOy7boLdAicPZ7fCHMRFOIuNLpkPLrZZHRX7KSsWwOIio8xrhTnSMzktpUhqg6edFHCR2/8/KnObcJAZTrpIA65nPTJKeYghJyZvN5dGA+dpIh0jvXjQZLQd9K2fCnaZJHSPEQ9k+Qg7InfPXhKKqi/xi4En4qu3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKml/KHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKml/KHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24232C2BC87;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=TKR+6Sf3vzBuaU+H9wxtOvYytkyV04qz1b4yGIhER0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sKml/KHO/fdbULomu2DUJRk8Ii199it/B86L1dXvs/OsYeFms7ZIPWeWZRTD/69Hd
	 EQNkkb+TJlnXpNtKDktlpDyKN8Z5+pQbkegGonq3mOw0sN0nidEjCnS0RXQwbKfVji
	 0l7UMuHU2sv5aIKXwbrMeY/wzhyQP8oQ5j67vzFF9/5t+DjI/OK2bmZOURtl3t4rBS
	 8B+6rc5di+vJFNE3313/IJOUkeYmIqcxsgaDSJrQgtxGQ57QLpzDUyBTLeG8Tt56tP
	 D9Ka7XoFfAsdHEAQDs6VFNzZq3wUi8BvO1MBeqlhy8Q84tZWNOvN9lZ54OUQuKuT1Y
	 NFx4pLHYtuEjg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1Q-0T3M;
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
Subject: [PATCH 01/25] docs: custom.css: prevent li marker to override text
Date: Mon, 19 Jan 2026 17:23:04 +0100
Message-ID: <4f28c485b72ea27c0981cd950a1819597d6736b1.1768838938.git.mchehab+huawei@kernel.org>
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

There's currently an issue with li marker: it is set to use
-1em, which actually makes it override the text. This is visible
on indexes that are deep enough.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx-static/custom.css | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index e7ddf3eae7ed..6757b5a59f23 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -30,6 +30,9 @@ img.logo {
     margin-bottom: 20px;
 }
 
+/* The default is to use -1em, wich makes it override text */
+li { text-indent: 0em; }
+
 /*
  * Parameters for the display of function prototypes and such included
  * from C source files.
-- 
2.52.0

