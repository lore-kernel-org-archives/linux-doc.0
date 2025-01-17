Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473DB1A2630;
	Fri, 17 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136795; cv=none; b=UmAwpLVN/lzi9qY/HtxoXx1cBRo6MvdnyeyPKZUfHYD0D9LeRdGeZQy+oz7PgIfLWWu3nXXPq4H8yEeHlLyxPuMiWyMK1PLNjRNQKbbg1dl74OzfiAPlayxnVwwJ1nqy7p6isMOXsfBdcmrLFm0B13KRP7WnnMOoLGJys9EvbsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136795; c=relaxed/simple;
	bh=RS/ElkUzCP7P0hES8gHUtJQMDcscyac74hLr/hRb6wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7ytIX0qO+imXRUdZpc/HqL2fNPswE+NruVmxeMIT/7PoRQe4ikQM510MopW3fwUJ7Ngo0k7813ODISW5HzepUB3mkpSTMKX1XJvC2hl6isL40vwXmyEPAMjsaEocDI7ry5AFiTfgZ68x2rxycfgWvI/hbYX7eQmGl9SEEI5BOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqB8S6nb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqB8S6nb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC38C4CEDD;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136794;
	bh=RS/ElkUzCP7P0hES8gHUtJQMDcscyac74hLr/hRb6wI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IqB8S6nbi6MZcszQ5NcOdniXvDlQsxOxlaZbnFK9KjeQ3ksqrfxyq1EK7wZqXlWl/
	 1EC+97OihBdPM9ZJb4US4UT5h1MZ7MJsKGyYB1hjDNxAFq/zAEgA55SwXowqbyeS1I
	 jhWqiYEqbs+dASZ1Oc0zVh5fr69d7bkuv+d0Tg9xpa1nITeyYJ5TAevt9UDDbPbvDv
	 phJC7c7JdcSm2gzWcbWrWVkWc21m4mPzTB41EOX2+6Mm6l/Gxl2LXMcjZFrB7f8o+B
	 pnTs5LYiqUX3nQpyJY8IYpnDU9FpbHZCdSm6Ao/o6yh0if3tKdRZJdsHW1t3JSAQSL
	 9LH0WUU4cZjtg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006Ajr-27kb;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 06/10] ABI: sysfs-power: fix a what tag
Date: Fri, 17 Jan 2025 18:59:35 +0100
Message-ID: <e402648593ad90502b35a20f472dfba9a6c86721.1737135484.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737135484.git.mchehab+huawei@kernel.org>
References: <cover.1737135484.git.mchehab+huawei@kernel.org>
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
2.47.1

