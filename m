Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90453E022C;
	Wed, 11 Mar 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242444; cv=none; b=ob1XNyq2zhQoFMnDSeDp2mlmS8VlmdLEyNBYHN9pmzMrI++/xXVfsba5OygPcybCm/FwB7LTNx1xMGXEb0n3ji6d90RwZ9HAjgGcCxtQsAyXM+DNIbpuBqmxqo66+I4xWqCXr2vSfLUS3S75AIp7TI9jQumk7A5Y2PQvYtAGMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242444; c=relaxed/simple;
	bh=FnYIJorzH/gwO4Kzae+KJBouHZLAYJSRiiIs50hB7z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJUfWKzWUqQAqX1unpEmRIuwBybU0qRrDTyTmCi8bJwerm2esgo4FaXazujUkzVaUiU4EJ4oMc/S8NYpasuj2ltM7VnvC4WdypD3HEhrV6kZla2mO/uACf00Xi89S817azP4W6uyvy9mUviPrVfbTB/FhPL0x2CCYkTwvn+0cCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMs8WdrF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMs8WdrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B8AC19421;
	Wed, 11 Mar 2026 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242442;
	bh=FnYIJorzH/gwO4Kzae+KJBouHZLAYJSRiiIs50hB7z0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMs8WdrF+A/7MdZqNdWgDa3oz/dIhTzKq0zJsd1zdy22KzCFd7jKHplaAXPMux1FA
	 h0et+gKLE8I/agwNAP1z+81/pPx2AVOdBRa+/nbbCCAY6/bm4vgISsUsfRlJFsSBOy
	 5XtsgiTiKYWUboUsl3p04kiOLOxI913zhI8TbeaRcbZ8tMUKuQSiT4wF6QTqIRnrKW
	 T2FNgUfibXOevyMyeS5ONYTE+SYr26HA7HeminRVLty/lChaE/rRoqXqPgndoxwT6Z
	 2hwwgQpwXsiRNLvbVLT4kQdeIrruNOySrgLlAe42LDW8Gh5Kpsoelf4w+chQcR04sc
	 eg26MJm+GzKCw==
From: Sasha Levin <sashal@kernel.org>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] checkpatch: add support for Assisted-by tag
Date: Wed, 11 Mar 2026 11:20:39 -0400
Message-ID: <20260311152039.254244-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2c7e0149-c178-41b8-ac5e-270bfea8b1f8@acm.org>
References: <2c7e0149-c178-41b8-ac5e-270bfea8b1f8@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Assisted-by tag was introduced in Documentation/process/coding-assistants.rst
for attributing AI tool contributions to kernel patches. However, checkpatch.pl
did not recognize this tag, causing two issues:

  WARNING: Non-standard signature: Assisted-by:
  ERROR: Unrecognized email address: 'AGENT_NAME:MODEL_VERSION'

Fix this by:
1. Adding Assisted-by to the recognized $signature_tags list
2. Skipping email validation for Assisted-by lines since they use the
   AGENT_NAME:MODEL_VERSION format instead of an email address
3. Warning when the Assisted-by value doesn't match the expected format

Reported-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/checkpatch.pl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff79..70ea466390771 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -641,6 +641,7 @@ our $signature_tags = qr{(?xi:
 	Reviewed-by:|
 	Reported-by:|
 	Suggested-by:|
+	Assisted-by:|
 	To:|
 	Cc:
 )};
@@ -3105,6 +3106,13 @@ sub process {
 				}
 			}
 
+			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
+			if ($sign_off =~ /^Assisted-by:/i) {
+				if ($email !~ /^\S+:\S+/) {
+					WARN("BAD_SIGN_OFF",
+					     "Assisted-by: expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format\n" . $herecurr);
+				}
+			} else {
 			my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
 			my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
 			if ($suggested_email eq "") {
@@ -3189,6 +3197,7 @@ sub process {
 					}
 				}
 			}
+			}
 
 # Check for duplicate signatures
 			my $sig_nospace = $line;
-- 
2.51.0

