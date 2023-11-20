Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7654038DF2
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvzL5MLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4C6C433C7;
	Mon, 20 Nov 2023 22:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700518034;
	bh=pRfngoTn/pdZvbsfo9mWloDhdaSb2Q6x+sHbTJ55rNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvzL5MLNpEIN3tQ0N6BcoU9Mj9SfFdXhLBOhd2TNTS34OUXGaTq3TiT1TWrC5c+LU
	 tXZ5N7Y1isGMSYJc/mG9CA6ar7+ne+x+AzdTvlBZu90w85AWP9fRF/RuQYOn59lENs
	 1zAfnysjVWiCf/zgF0QaOjN5XlHwn9CyX2Csg3c1GqmWSO00YnOgYN3s7osciD2uqt
	 hcrzT6BSE+JHFN+jfAry+y38+mOdtx9qV1aV2MNI8eSgiPm2f2m0zpHYCAsvgSHtrU
	 P6BteFJPFRy+/am830pAdLJmr0w54OYj7qDCZFwyD/pjOKTfCq/6VnStNr5+HibpKv
	 y/oNLgucTcY4g==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Tadeusz Struk <tstruk@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stable@kernel.org,
	Tadeusz Struk <tstruk@gigaio.com>
Subject: Re: [PATCH v2] Documentation: PCI/P2PDMA: Remove reference to pci_p2pdma_map_sg()
Date: Mon, 20 Nov 2023 16:07:13 -0600
Message-Id: <170051800635.218334.12191403128072786783.b4-ty@google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113180325.444692-1-tstruk@gmail.com>
References: <6eb84bc5-dd58-4745-8e99-ccc97c10fb63@deltatee.com> <20231113180325.444692-1-tstruk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bjorn Helgaas <bhelgaas@google.com>


On Mon, 13 Nov 2023 19:03:25 +0100, Tadeusz Struk wrote:
> Update Documentation/driver-api/pci/p2pdma.rst doc and
> remove references to obsolete p2pdma mapping functions.
> 
> Fixes: 0d06132fc84b ("PCI/P2PDMA: Remove pci_p2pdma_[un]map_sg()")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Tadeusz Struk <tstruk@gigaio.com>
> ----
> 
> [...]

Applied to "p2pdma" for v6.8, thanks!

[1/1] Documentation: PCI/P2PDMA: Remove reference to pci_p2pdma_map_sg()
      commit: 9a000a72af75886e5de13f4edef7f0d788622e7d

Best regards,
-- 
Bjorn Helgaas <bhelgaas@google.com>
