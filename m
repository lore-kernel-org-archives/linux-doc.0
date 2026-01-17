Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492241DB13A;
	Sat, 17 Jan 2026 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692427; cv=none; b=LuBfB095MDfli8E2EUZWDHqaBwQKxLY8bnut38au70j68Dhmu46Hc9+vapcMqKXaYS/J5C77nq84dcrXb0TrM6b6A+JzjRjJA2XuQlGYVUwhv6tZtGCMjQzlqEtKje+l/FnbmK/WZ59IS38l3l6mCtMIYVK218nnIb2vKKPSsHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692427; c=relaxed/simple;
	bh=f7Ev6Xnxytx2v9T3qmkkLEL+29JxlcX99DxE/ZQvG6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AZmMMrNQtgetobej+FpSdwdqzw7PMrB6MWmsl6MJA+/Y2LYS7DJH7JcpBv2ECpskKpROvatO0g8OWnpQgIrqtV4iZ+x99M0Bpi6Cd01WJo2A/LDNyCJvBolnTs/x+jSb7XawlW8c6iHh2WyOTIQMPOBTls5UROe1kQnptEqsi9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZMMtlRwo; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZMMtlRwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768692418;
	bh=f7Ev6Xnxytx2v9T3qmkkLEL+29JxlcX99DxE/ZQvG6w=;
	h=From:Subject:Date:To:Cc:From;
	b=ZMMtlRwozxVhj+nPCjxI0ML3s9DNzQRkmiPfGiZPDc/LHwCw0UVoRyRPDN+OaBFeV
	 4c5gprjSakM8oxwiU90LUGUUj1eb+9lsMTpjQq3HBq03SflcNienr0Hxc2uZi7rpJq
	 wVXXKnWV/ZsUOGIt0tGjgbIfceqwhjSrw0aju2+k=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] tools/docs: sphinx-build-wrapper: avoid spurious rust
 docs generation
Date: Sun, 18 Jan 2026 00:26:20 +0100
Message-Id: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqAMAxA4atIZgO2+H8VcZCaahYriRWheHeL4
 ze8l0BJmBTGIoHQzcrhyDBlAW5fjo2Q12ywlW0rYzpcg1PUMwqHqChRL+y9X2xX94NtHOTwFPL
 8/NNpft8PLhMVimQAAAA=
X-Change-ID: 20260117-docs-spurious-rust-8ffa2748925c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768692417; l=878;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=f7Ev6Xnxytx2v9T3qmkkLEL+29JxlcX99DxE/ZQvG6w=;
 b=yMWOM4qk8UweBTXOmh/Jl9S7hSW+lWBHnAZCQsmMdj5Dxbm5DZ1vSPBnLF511uOy49WAL+Jkt
 BghA+wLhXhYCKDdTcY0jrwWe8eDD9g/FzHs44h/3QcXFkydxsptJwsW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently the rust docs are generated for each entry of SPHINXDIRS,
even those not mentioning the rust directory.

Only generate the rust docs only once and only when requested.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      tools/docs: sphinx-build-wrapper: generate rust docs only once
      tools/docs: sphinx-build-wrapper: make 'rustdoc' a local variable
      tools/docs: sphinx-build-wrapper: compute sphinxdirs_list earlier
      tools/docs: sphinx-build-wrapper: only generate rust docs when requested

 tools/docs/sphinx-build-wrapper | 80 +++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 39 deletions(-)
---
base-commit: e1a8301cd941b8029893500e6857d7978873483f
change-id: 20260117-docs-spurious-rust-8ffa2748925c

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

