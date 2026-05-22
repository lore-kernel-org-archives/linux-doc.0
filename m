Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6CF2D839C;
	Fri, 22 May 2026 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472743; cv=none; b=h5Dw+Au50Qq8BqQfQyLPVUHyyhBWF6kJpl8Qq1qK0ndHFnXsWev+ksoZg2WTwgpv9c+jZ9pshSInWX3LeqdkcntvJJXJYGlrYCRoCelA7XLHJzvxNNSXVwgpMHhayykjlSTpVmHwjlztyWCJCkrZAB4uHbtVpauWatIn3ogbncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472743; c=relaxed/simple;
	bh=Tz9TJtuJuplhHjilsZjAm/P8Nuqusyn1jja1lo1ESgs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sek0TN7N20YKS2PGV8HIHRP8qa0zvdhAe5rF300IJVLyfe7UUzHmAVSDrtKxaK/nCSyKB/6mgUX4bLp1OEQYarSnPoE3fqF52pvlEkXV6WmYNrpNq9+VmmeiMHbVr5B2y6UYYy/HmXqWmFuTVUbfYDHn5DyUPvLnjnS3+6s/QhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Higw7MlK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Higw7MlK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E261F00A3F;
	Fri, 22 May 2026 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779472741;
	bh=ulTeLZZui4DXY5+bPBSyvsoljPtiPS3qEpLr1gm+xqU=;
	h=From:Subject:Date:To:Cc;
	b=Higw7MlK+QiJ3tTZk76VtzSP4xJarhtLKV0ktTGRxnWu0WHKaoMRJIqDw3HwZqvd4
	 Q86cwJBHR+E89nj1Cm2WD207PwLbaKmPUWE3tktlsILdhCvoqUMs5hw+KUsjU75+y1
	 /8pcNkRYGSgEUC3fHIXDyKH3XTGBk7mntEH4+gn9CEzwQFftWED2UswKDDKvi3C3W6
	 DrHz/Q03CbsY+na2xMT6a7aiY1JPJydDVeiFy7bSFnM/XXMN/W3ZGVT2ypctOHtVBn
	 fqVSH6LlaEHz080dDCHAa0GcNc/I2J0xSNjkz4MCIMrSLF/ww2eS+uoj1zmHHxiUeQ
	 nYvc1Qrn0QITA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] arm64: Fixes and cleanups for
 cpu-feature-registers.rst
Date: Fri, 22 May 2026 18:58:36 +0100
Message-Id: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEyZEGoC/yXMTQqEMAxA4atI1ga0agWvIi5sTZ0M+EOiIoh3n
 zouv8V7FygJk0KTXCB0sPIyR+RpAv7TzyMhD9FgMmOzyuTYy2RL9OuOYRMUGhWdJ2eGoixqGyC
 Gq1Dg8z9tu9e6uy/57TnBff8AKCmDhXYAAAA=
X-Change-ID: 20260521-arm64-cpu-ftr-regs-bceb2d34376f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Tz9TJtuJuplhHjilsZjAm/P8Nuqusyn1jja1lo1ESgs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJlg0aL13XInKmE8AjuzI7PVsxSiKfTjhU9It
 8VnYbccg5qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCZYAAKCRAk1otyXVSH
 0K9WB/9heBgyBlfdjtOv6yWMMddPKSY0wOSpogauWmTUeCc8Vr8kEReSzpU9RUkwxJ6n6BoLoVC
 eVnTK/dUOvrmSnNWSHM6qecCEvI7cAyhaDpgTg2G5S18NgZlcRmhTNUR8y4bAO//d/RwGHekGOP
 /9J4b18SdU4nCK6UJW64E5UNAHUIFqJoFNdavU/QM8L/VwIpi/DUgM1LCNgSpqpYVdfd87HoZTk
 qE6msWukmVxPrR+nAJHd7wMgSEoLK6Opa1AFrNTO9ZLxK27Uq+kKC4Ky/GXon2HKgBBwGvdiAvU
 QrNBwLMJ+cMB0uuwcAvlp2cZo0ssEreoDfbhqQne7+dx2XhB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Peter Maydell noticed some missing updates to cpu-feature-registers.rst,
while looking at these a number of other other omissions and some
maintainability problems were observed.  Several registers and many
bitfields have not been added.  

Following discussion with Catalin we remove the numbering of the
registers in the first patch so that when we add the registers we can
add them in a roughly sorted order, then fix up the missing
documentation before sorting the existing entries in the file.

This whole area should have much better tooling, rather than having to
update multiple places and manually cross check several different places
including rarely used documentation we should be marking up the sysreg
descriptions and then either generating the data or validating against
manually updated copies.  Manually updated copies seem like a good idea
for the ABI documentation since while it's more work that would force
review.  I did start on some sketches, it seemed like it might make
sense to tackle along with using the MRS but the libraries for that
seem not to be progressing at any great rate, I'll dig the sketches out.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (3):
      arm64: Don't number registers in cpu-feature-registers.rst
      arm64: Document missing bitfields in cpu-feature-registers.rst
      arm64: Sort registers in cpu-feature-registers.rst

 Documentation/arch/arm64/cpu-feature-registers.rst | 281 ++++++++++++++++-----
 1 file changed, 214 insertions(+), 67 deletions(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260521-arm64-cpu-ftr-regs-bceb2d34376f

Best regards,
--  
Mark Brown <broonie@kernel.org>

