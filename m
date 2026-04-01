Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6DA337BBD;
	Wed,  1 Apr 2026 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036869; cv=none; b=Bc0omQIJ+OgK8ZqpMEXPnVvh9lgUufvhsgcRFt9poXBjzyQKvYNHxuXtWdPLjurgijS+q/bFa6WaIMzWPgm6jJk6gqyd6OJ3LQwQHFnne5vGS7MeEp4PTjuW3qeXVQ3RnBOVZaXOJ2W6Qz94Akux+h0bznSr0DslHaNTzDUCwys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036869; c=relaxed/simple;
	bh=oHACDhC+fZQ3tsbDQTIB2DTSoCEJP78r6wVQx/nRDIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uFgPnchaHb2fVGWxhlmiKU80/HZGndw/ff40+U6xPCIyc53z10TXd8UKL8ZBXeSV7d457yKlF4LZcMHPUIcOCnHvc/44oRuEyDXZ650ny0LHd6cyYnDv75V7qPnlfkRLWMG0S9bcxQQLyf68U8O5ypSY3eY+e7suDYwqaVXlQn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3jaSwZE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3jaSwZE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 681D6C4CEF7;
	Wed,  1 Apr 2026 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775036868;
	bh=oHACDhC+fZQ3tsbDQTIB2DTSoCEJP78r6wVQx/nRDIY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=W3jaSwZE0aXIN5yI/C4LR42EXdnDXP7M5k1CHLUupp7SpMKSheIoQwDHVqiaqc6z+
	 HrDnZZrqQGa8kMjQzIpvxOsIrW1gNka2MBGRhg5yAPPCT9G6FgstcjifE1zVls88Xv
	 Zy6h8qmoZ5O7sy5VFH9nDcmmot/DQIuGebhMIZfCHBzRr2JpGY8bQQGx41FWyOf6Ib
	 ZOqC6UBkSdfJ8QhBwjKToVoJhInlBXnZIGRA2yU5qQdlxDJCOtA+FLM5CSJN4i81Ib
	 1Jc/s92rNCLokaGmFD3rDpRMEYCfLf6w8vJ6YijnjJiCnKjIwBXjSoxjxzixwmyAl/
	 MvPn5AUyAJ3aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55919D3515C;
	Wed,  1 Apr 2026 09:47:48 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+cryolitia.uniontech.com@kernel.org>
Date: Wed, 01 Apr 2026 17:47:47 +0800
Subject: [PATCH RESEND] checkpatch: Suppress warnings when Reported-by: is
 followed by Link:
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-checkpatch-v1-1-57da0c7aeb30@uniontech.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwND3eSM1OTsgsSS5AzdJEvzFIPkpFTz1FRLJaCGgqLUtMwKsGHRSkG
 uwa5+LkqxEPHi0qSs1OQSkElKtbUAvrdnm3YAAAA=
X-Change-ID: 20260401-checkpatch-b97d0cbe7ee9
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, zhanjun@uniontech.com, 
 niecheng1@uniontech.com, kernel@uniontech.com, Petr Vorel <pvorel@suse.cz>, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036867; l=1810;
 i=cryolitia@uniontech.com; s=20260401; h=from:subject:message-id;
 bh=YxanUXAo1zZz/4EvE63HKWNGGvJyrkveItkRihtZCV4=;
 b=D766Pb878qsWoWtRl0Y0dX3lM14ATdLtp1TaIGcCCH6ilanTBA4wKyOB419peRrrBVysnR6RU
 kqnOeWaKfSZCzh3anOpxpDemFvfIqvkNOvBuErAtYFvPCTQzK05soEm
X-Developer-Key: i=cryolitia@uniontech.com; a=ed25519;
 pk=kF6wBkp7j9167keuk8Q9RvPgMRPuHlJztbLy0vbJ3K0=
X-Endpoint-Received: by B4 Relay for cryolitia@uniontech.com/20260401 with
 auth_id=710
X-Original-From: Cryolitia PukNgae <cryolitia@uniontech.com>
Reply-To: cryolitia@uniontech.com

From: Cryolitia PukNgae <cryolitia@uniontech.com>

> The tag should be followed by a Closes: tag pointing to the report,
> unless the report is not available on the web. The Link: tag can be
> used instead of Closes: if the patch fixes a part of the issue(s)
> being reported.

Accroding to Documentation/process/submitting-patches.rst , Link: is
also acceptable to followed a Reported-by:, if the patch fixes a part
of the issue(s) being reported.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff7..b8a098061181 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3223,10 +3223,10 @@ sub process {
 			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . "\n");
-				} elsif ($rawlines[$linenr] !~ /^closes:\s*/i) {
+					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . "\n");
+				} elsif ($rawlines[$linenr] !~ /^(closes|link):\s*/i) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
 				}
 			}
 		}

---
base-commit: 9147566d801602c9e7fc7f85e989735735bf38ba
change-id: 20260401-checkpatch-b97d0cbe7ee9

Best regards,
--  
Cryolitia PukNgae <cryolitia@uniontech.com>


