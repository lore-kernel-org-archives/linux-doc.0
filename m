Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A327AC4C
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816229; cv=none; b=s7xl8TPuMxG5XOhIvyjDXZ50ESBz3aV4Jz2jdt+AmlMrNya2WwjbHynyiZtWJZSt+jB9KLYVYBzXw4UKnnc1pExIWHQOv9tqQNO57rPpkpG+AjTliGaoEOt8m6KklpEdVYUzRHpIl7US73ROnAbbfPoZU2rtXS4+d6/hNVT4yfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816229; c=relaxed/simple;
	bh=500GhcBqtx50Qu/lYpLpli2EPz84QwQhaEWjlRDRYvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GIYreCEnUFDh/dZ2OHQs/Fx7Zv1U04JF21jUqIkCJqEHQ+klNzIC8a5QiMX+lNEoueqrZzO9lJqdadnsoF1dcfHRehuRHBlp6SX2vZiQZwx6pUqnwU90kaE7o+U7Cf/NlvQS/g7NGHPyS70wDNVTFpGuH114X8gDyrr0EzWtGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=t+M6O/gb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t+M6O/gb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Cxh1DlAaxIvTlbjwkVTma1SPKEFXNGTJ6tV8wDaY8V4=; b=t+M6O/gb6FU2jJ+W2yt43ebeXF
	8ouks9MPquQcJ3duI42aGXA7QnvwjIRAfHITUt/BCOQVUzxBRwS5O6nPNjL61/crfvLz/1TuwNmZG
	DntU3yBseq8AGzhQyzHzQJ3iBbS2eGvoSEm3d1QVy+9L8yUbErbEgnz+cMKjnaxTV2G8Xz0y/ep0R
	KzrxFJcp/U1c0FwueaREDffFVgnnI6BxJCEDBGxyMKOPJXcT3UqexD53LrOMs5unz+e5JouvX9Jij
	4i5wN84ao6GO9x0yxN/3LI9rD/yhXw+N4yiqn1cH5NmG5YCDIfdMhyJICu69Qe5D5I6+ymuq7nAM7
	tr8/rY5Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvVI-00000002iBe-13Bo;
	Tue, 26 May 2026 17:23:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build warnings
Date: Tue, 26 May 2026 10:23:41 -0700
Message-ID: <20260526172341.773398-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line to prevent documentation build warnings:

Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentation. [docutils]
Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
# for spi-nor/next

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>

 Documentation/driver-api/mtd/spi-nor.rst |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20260525.orig/Documentation/driver-api/mtd/spi-nor.rst
+++ linux-next-20260525/Documentation/driver-api/mtd/spi-nor.rst
@@ -211,6 +211,7 @@ section, after the ``---`` marker.
    must adapt `bs` accordingly.
 
    Warning: These tests may hard lock your device! Make sure:
+
    - The device is not hard locked already (#WP strapped to low and
      SR_SRWD bit set)
    - If you have a WPn pin, you may want to set `no-wp` in your DT for
