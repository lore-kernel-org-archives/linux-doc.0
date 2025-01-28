Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDD8BEA;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022796; cv=none; b=PbfaAnZ7taCKh+oatX5fIDFMbrcqp7A1LrDMTuNgmWkXty7JCbjmMmk6LjXqLsjuJUQqQqrpyZd4p2IfkmGBBeK7Fusfb+Dh0Dxdu3/OJ7yZYvH0c9ZsiiwTdLyIlQE1BuQZuNEkEWF9pffSZN+qGMuxGGqXFMtnOFoljsV3kXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022796; c=relaxed/simple;
	bh=Tj1nz2RZBql0geo5lraeHUCDCc6IdX7LSdJsN5wj1mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qbz4l0MPdoRNtKmog/83sfsZ03iIsxOAZEm6JuJDaXjjfYn24QA8GRZr4AbGnoV1UbH2ebJW3KmPjj/yX3am86jzB1B+zzPWegEJt01PKSXAkrUkVAGxaTxspQvx2uRph9SBg1R9qHdIUYaIZ4zSEbbotvngfIJOAzrd9CGnCKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4ZHg6+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4ZHg6+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41DCC4CEEC;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=Tj1nz2RZBql0geo5lraeHUCDCc6IdX7LSdJsN5wj1mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y4ZHg6+t5NgU4UAHHiPaxTzU0WBl145Am6lLM2yyq1wq3GpqJ/k6+Dz6DOqkbv6gR
	 9gkLbYQ1/d29lI70OOXjRe6cjr3tuCmWiaXUZVEAX0Pga48uLsMq0z09VklcnOFB6a
	 2x6Ai4YcKcL41rWQ/gTY5Y3oo6Y0pYuDtHhC11Ji0MRGffCrn1CcEDuWHANmsIk4du
	 bLkn6BKHGuCUMKdSvjPWg7g0qcO2UpWEQijicNUwc3TZtcp/Biq7GrxEZkLNL9IBrQ
	 hdM/a+FqhZ6bbDI/e0j+X8yDCbnwqOYrnSMI+7KsWNJ8O3SM4oUSGXQjI60EsU2lFF
	 KgnPPcmOx9MWg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRL5-3d6t;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 11/38] ABI: sysfs-power: fix a what tag
Date: Tue, 28 Jan 2025 01:06:00 +0100
Message-ID: <d16ea4aa5c884dcd011650347ab8acd95cc0cf63.1738020236.git.mchehab+huawei@kernel.org>
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

There is one What tag that it is using semicolon instead of colon.

Fix it to comply with ABI description and produce right results when
converted to html/pdf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-power | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
index a3942b1036e2..2192478e83cf 100644
--- a/Documentation/ABI/testing/sysfs-power
+++ b/Documentation/ABI/testing/sysfs-power
@@ -131,7 +131,7 @@ Description:
 		CAUTION: Using it will cause your machine's real-time (CMOS)
 		clock to be set to a random invalid time after a resume.
 
-What;		/sys/power/pm_trace_dev_match
+What:		/sys/power/pm_trace_dev_match
 Date:		October 2010
 Contact:	James Hogan <jhogan@kernel.org>
 Description:
-- 
2.48.1

