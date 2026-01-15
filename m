Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B53A9018;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=u1C/Jx9TncEoteNMYYshYNtXamM4XcrWIdBsF3dVZqzy+kCokyhb5aVaFZGPCGbTBvt90Bn4OIaeM5nKmPxugbOQngVWTQ75Fu4KA+7SChBFOn2cdKKKM+uQcU9+Gor5AKswF3VmwYaVbCNUgWMYHHlTH9QxN2Eu+tWQRIlrRZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=wfHr9wNKFyYIJ5Okyj5woYiW9cOVx06PeOms6PzwjSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cthT9BdN/sof0BRPTRECtRHDy9z5NliFlYR+mjmVDrFAIG12ZESKkvuYalXAIxdp9c4cQGXLrBGVOEgqLR/ZFQDT0+UfBJjc+COVQc8O+HEmlxZwRUN/IN1NBOaULREyh7vjN37kVrlg789mGTdmEtYVA1QDBfrgSYLxNnbwlpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdNlmbUB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdNlmbUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE4FC4AF09;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=wfHr9wNKFyYIJ5Okyj5woYiW9cOVx06PeOms6PzwjSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cdNlmbUBY1jWaSe1zerRKj86aUUd3m8zgcyfc+oBz8C79/xnal35X2MkAFT5q8jZa
	 u9OrGo7J9tMWl4BlGVIy6L5YwydqkQg7gHyma8ygvitQ3V5ZS4JLPML0ihe2eeKcTA
	 ogRvXS/DkQkVCiresOdHu3GADkPGFJ13pA0zzaw2yENi/qCi5i5hi8ogLhtnhKwzQH
	 yOWIp04RRxI735NIxw3mzNm3Vf8ZYyjBIzRik0RNU55Z09iMnH9dOXyVyzXhjxNb+m
	 HsZua/Rbg8dVuESiJ/D5qYEoYypZKWh4SoEas+w6HHSa6iB6uVPX6Me1B+bk4p8OJW
	 OQBVsr15R2EBg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043IR-0xIu;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 05/15] docs: custom.css: add CSS for python
Date: Thu, 15 Jan 2026 16:40:26 +0100
Message-ID: <3a7f2f28cfdc0ff95ed8997b407d6f1d5375b04b.1768488832.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768488832.git.mchehab+huawei@kernel.org>
References: <cover.1768488832.git.mchehab+huawei@kernel.org>
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

