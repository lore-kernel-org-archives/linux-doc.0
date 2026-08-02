Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CA73932D3;
	Sun,  2 Aug 2026 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679900; cv=none; b=UdsWztA+/gzVVqgRi3d2/z0+0r4meNUHUFmx6Q1v/86kULgrUh3HcEsqzPnexnosRbYsvI5NP/dI+0ehjPwTyqUfoBKb1SGrcOQ7TRtxReu8lIR3hqLZ19o4vX9aODdof6UfY0JQ/3TZNlKef86l2pMXFhr2Q0hfu+y9VpotLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679900; c=relaxed/simple;
	bh=VHCNYdSDXQWPDgWPZRDdi7VBJYiSQANCYMrvMgh969s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lb0UoOnFyLjjrilyo2kYU3zrQqi0dP3h87yUNI5JPib4+mUmSehh6Jo4I2rCsLtVjLmXlRp3nrY+wVaR5R36yhILDKyFHyCHRuieGF0W8cNn1H3J0S3ximDSdJHIsWF6V/j/KTyDL6WWTWe2/X9YYlJ8QkpPAn4jL3SuA9nS+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIxIvXSm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIxIvXSm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 448DCC19425;
	Sun,  2 Aug 2026 14:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785679900;
	bh=VHCNYdSDXQWPDgWPZRDdi7VBJYiSQANCYMrvMgh969s=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TIxIvXSmvnW81Z3SD5E17lMTX29BMRCdAUgIFYi/8PQ5/PUmgQLdkJGiKXU6RaWka
	 WXJ/ggPar41lYgWqeXKI+rcCaZrWGNLYWTQoi6psjOA1WMl3735RPDRjO0X+Nf53ps
	 xKY2djP9nPPyl2a6DPf2511P+JZXkkpwX15VjZRFMv5x7TNkk1uYmvbbqb6/XGamL1
	 A7DXz0Sp/+MZKkYgLPGNhRmp82tiL8DPPO2hYKoRewVRPREhCqa/8Z4bzjnjjrvxDP
	 PvTzYi5vETAlKaCfP+Dy6/yhQrR3eFVAfpBEZnMg71rzsGWE1tRjmizinRgrTZrm4b
	 8BHQs3e8GMzmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D4BC55175;
	Sun,  2 Aug 2026 14:11:40 +0000 (UTC)
From: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
Date: Sun, 02 Aug 2026 19:41:39 +0530
Subject: [PATCH] docs: kernel-parameters: Remove smsc-ircc2 IrDA parameters
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-docs-remove-smsc-ircc2-params-v1-1-91b302e90cce@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORvoapHpr4iHLku3DLqORIcw9
 u9WPb7L28FYhQ1uzQ7Km5iUpaI9NUBTXEZGGarBO39xnfM4FDJUzmVjtGyEokQe16gxG0a69iF
 xakM4Qz1W5STv339//G2vfmZ6flM4jg9hV08KgQAAAA==
X-Change-ID: 20260802-docs-remove-smsc-ircc2-params-ac9b4fef1443
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Anuj Bolewar <bolewara@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785679899; l=1844;
 i=bolewara@gmail.com; s=20260802; h=from:subject:message-id;
 bh=btfNVB8ib3tu4wleNIK7XhSVR3Xyj+ZA0X1ZtsVXCSo=;
 b=APrjjc8n5oH/TQnB/gfCuIGoHR/nASyOm00vdwQsAW4DEGMK8R7yd+hwwQZNRxPKBjWrSdfOH
 +BHiTfzb3N2D71qzw9MQY9Dxuag1QLQjtYASTbQjZcnA4YEBfWvQ4V9
X-Developer-Key: i=bolewara@gmail.com; a=ed25519;
 pk=XxcXxqFWk9xQziyNEfhS6NRJQR1shqHRRYzkbaYamm0=
X-Endpoint-Received: by B4 Relay for bolewara@gmail.com/20260802 with
 auth_id=907
X-Original-From: Anuj Bolewar <bolewara@gmail.com>
Reply-To: bolewara@gmail.com

From: Anuj Bolewar <bolewara@gmail.com>

The smsc-ircc2 module parameters reference drivers/net/irda/
smsc-ircc2.c, which was removed along with the entire IrDA stack in
commit d64c2a76123f ("staging: irda: remove the irda network stack
and drivers").

Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
---
The IrDA stack and drivers were removed from the kernel in commit
d64c2a76123f ("staging: irda: remove the irda network stack and
drivers"). Remove the now-obsolete smsc-ircc2 module parameters from
the kernel parameter documentation.
---
 Documentation/admin-guide/kernel-parameters.txt | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f2..72afae6ea85 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7006,17 +7006,6 @@ Kernel parameters
 			take as long as they take.  Specifying 300,000
 			for this value provides a 5-minute timeout.
 
-	smsc-ircc2.nopnp	[HW] Don't use PNP to discover SMC devices
-	smsc-ircc2.ircc_cfg=	[HW] Device configuration I/O port
-	smsc-ircc2.ircc_sir=	[HW] SIR base I/O port
-	smsc-ircc2.ircc_fir=	[HW] FIR base I/O port
-	smsc-ircc2.ircc_irq=	[HW] IRQ line
-	smsc-ircc2.ircc_dma=	[HW] DMA channel
-	smsc-ircc2.ircc_transceiver= [HW] Transceiver type:
-				0: Toshiba Satellite 1800 (GP data pin select)
-				1: Fast pin select (default)
-				2: ATC IRMode
-
 	smt=		[KNL,MIPS,S390,EARLY] Set the maximum number of threads
 			(logical CPUs) to use per physical CPU on systems
 			capable of symmetric multithreading (SMT). Will

---
base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
change-id: 20260802-docs-remove-smsc-ircc2-params-ac9b4fef1443

Best regards,
--  
Anuj Bolewar <bolewara@gmail.com>


