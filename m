Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD82942A;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=pY0EWBp7B1iMPkmLarvRaBkUs52b5EyE6mJGZ4jNQM8VHUFnq3nQwEsmHL3atW2AkRenbiBszSVwemXzBciR+fbfkGuxO1N+vf3o2vaC1wZnLvn7FKbhKXxjxeKH3nV3GQzmCqpP32jALPAUimplYFuiFE/yaynriA7T0L1+9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=vE+9+3UxmiGLqZ+P2f3eoFwC3xI72QmwbpGYU9Ci2HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4NPeMMYBf7FcZTd3ymyqCbPedcMpXJ1hSWSCGOMGQjMglW17iso8Sjg1uOXZ8WvmtYfbIaOJvIUQ+5KJeiLs4flVGM+rVph6R19fbsZxrUTxQBP/uRP2t9iou3vBCVActlOaO6xnpxpyZfITDx1WbrEktQN//KnHxJo2WFl3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKV1aLLa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKV1aLLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9AAC4AF15;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=vE+9+3UxmiGLqZ+P2f3eoFwC3xI72QmwbpGYU9Ci2HU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fKV1aLLakdCDqs2C3AO7AtssbF3hr6M/W6Rnux5ziktu24JGgbX8j1MqdH7x3cg1U
	 yGrXGfW0BVr/VTXQqhL8iyTP7zUX1jgUPZBFYSZA+jq7pVVKSF43+SYFimkw8wAwXR
	 KYTRmNDbtlpn5Mp8W1pkG5+9lw9bsmgvghWK5JWjSKAyUaF9rt08kYdEWBX2piJgT0
	 sb2qSJndvq3c20LmH2ON4gvPSaY6IYpfN4DHWA+HY1GZxgaSx/POR1t77h80N31PF1
	 AlB5FCB4UQrXMFBdGQkEn68KW5/pYHyuxuae/Q8CNZ6nthFWSVxGksviJsCJ8qOZdL
	 P5ME4IiTW/AxQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRM7-1DRX;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 27/38] scripts/get_abi.py: Rename title name for ABI files
Date: Tue, 28 Jan 2025 01:06:16 +0100
Message-ID: <a20f66b7f040cfbb7dc8d4448991ea757e581cad.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This makes them look better when generating cross-references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index faae51201504..1c9c6b23a6fb 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -327,7 +327,7 @@ class AbiParser:
         fdata.ftype = path.split("/")[0]
 
         fdata.nametag = {}
-        fdata.nametag["what"] = [f"File {path}/{basename}"]
+        fdata.nametag["what"] = [f"ABI file {path}/{basename}"]
         fdata.nametag["type"] = "File"
         fdata.nametag["path"] = fdata.ftype
         fdata.nametag["file"] = [fdata.file_ref]
-- 
2.48.1

