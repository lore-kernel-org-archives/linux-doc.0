Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464402BE033;
	Sun, 12 Jul 2026 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783884816; cv=none; b=ciFV1z8ke4H9NkcZex3FUzGKHR69SOlRn/eEdkk6Mx5a5iiwvq65R4EVf+rBerVNoh3Z+nikIql2oUNQ7XVDSvksRiCKsRW8Ku1DGGpO2eSGhAGeKaYcwAPqBSy5l+TTKWbBW4HcskDf8P7QpamcMX6L9hrSPdKFww2UjetKRUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783884816; c=relaxed/simple;
	bh=QFKalSKwIi7ekI2DPNRqSKWoIx9BDEHFio9J7E9UmZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kRxgbr4kjZW+8nKKFKg/XhiqXWX81fB2NMWFNR4WucTufTxEkgiyZ7eRZ86KqbqQvCWFirqlUhRjUYjdrq7TfKgm6VSQFNtnVBTtqrClJHX/8nTyuBrC/y0+rrtNBFpBniDptZ8NakenqJ3biI6tBufeLbuxcrR8DyzO1cM9Ayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRgPnzno; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRgPnzno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5771F000E9;
	Sun, 12 Jul 2026 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783884813;
	bh=gyuURlUoCp/s/g0oxdLk+8I+A6XzSyGAveEBSGo5ERc=;
	h=From:To:Cc:Subject:Date;
	b=NRgPnzno+xayBlPZWhbhoeGIqtd1ILhKqQNSZCwwZqRjQRl/mhgZUyrRhQiUYmk/o
	 FjoTF6YWmqIJqay81Lzeq/XulBNppRP7M9b+nhKqyT/ZqvFo7Rk+JXnwLu2zjJXELZ
	 uiOANn0+6nZ48DkE7FPAYo6Mjtj14OlpKetMlRpqwUxlYfTXuN7yQ0+UDBTfw8lDLj
	 Nvit8Cj/GAqBDJcu1lq64EGcaG9Blkt/bi1Ts6gDUlbiuHOGzMAeRCcyURPz1+a9Wl
	 hYmBqkm6hC6qsNY1RYu6nV+RjlEf7D593RM4eNqx2qoTliyGCrVjG5NN6rb/C+aYxM
	 YnxG56CZRo/EQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wizvg-00000004KW0-0mv1;
	Sun, 12 Jul 2026 21:33:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 0/1] fixes for maintainers_include
Date: Sun, 12 Jul 2026 21:33:28 +0200
Message-ID: <cover.1783884625.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This v2 replaces v1 series:
	[PATCH 0/2] A couple of fixes for maintainers_include.py

It basically fixes an issue reported by Manuel that entries
are printed duplicated.

In reality, the output maintainer entries are not properly
named per subsystem, so they appear to be duplicated.

Fixing the name output solves the issue and keeps the list
alphabetically sorted, as expected.

Mauro Carvalho Chehab (1):
  docs: maintainers_include: fix entry names

 Documentation/sphinx/maintainers_include.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.55.0

