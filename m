Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC036D4F5;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=RRL8IWa14/7VPbAsIoQdD0e+lS+Lrb2zqhCeIN9GanyqFaUF+jZRGhY8ObONpD0wusLib7GZhyh0ZAYAcfFgsNI4dEm5/fzbYYMiFsGouLkinTP29kyT75xB/Ei/IzhaY/sa1xEW1oGBs9sqBJf44SaUNhRG+bGFtuem9bFiaFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=exjBpROHq5nt6ys/3V4S6O/quh/Jy14gJjvOKZLMHAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZeMmrnegfyxYKi8ypxIhybojRXBBc8QBpu5s+HtBvFfZBswSZR2lY1j2PdG5Zomh9vZMpZBQoVqFllRVyWxZTSxL44cwD92VHvbyKZCnklRLX9xK4uyLU5787INbJaynqeIZpY3bEwtu28IbRLCsYi7Xhp3PQFxRNNNyvJxwQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hsl1GMRw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hsl1GMRw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C46C19421;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=exjBpROHq5nt6ys/3V4S6O/quh/Jy14gJjvOKZLMHAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hsl1GMRweCxxcuyrSKMeI18gA591D6gGrSjKULWXkIVP0T4JZ8DE5Am27t4PyPvO9
	 PM9gACccKM4WSvM0nPbHuPBTIurBkHaTzyefsxZ8y4ZGqqpVcA3Rm8XWNPZw5c/vrp
	 6XY+23nSNynI8fq1IHXIhInRTA7i0JszdYhdceWbH657Fm6gocoOhq9jhoSoomROea
	 XJKx7ZaHNJR7OrBnbOXzEVhdWDFDmkvkrV7arSwNmmHO8EzJuGxuZMiOUn6C6iU3q0
	 Z8yg+WnRdWtXhkgYG6XOjsak0WmhOxhHGRp1gUIcObuwER3NBZDGpIVHIiaTSnbRge
	 kreUr3l3UChTQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043IB-0Vqe;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 01/15] docs: custom.css: prevent li marker to override text
Date: Thu, 15 Jan 2026 16:40:22 +0100
Message-ID: <f139d304fe4dab288152caf1fda921bd8d9dd7d5.1768488832.git.mchehab+huawei@kernel.org>
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

There's currently an issue with li marker: it is set to use
-1em, which actually makes it override the text. This is visible
on indexes that are deep enough.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx-static/custom.css | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 06cedbae095c..b6a7a5f6b6d4 100644
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

