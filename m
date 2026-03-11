Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CC91E7660;
	Wed, 11 Mar 2026 21:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266302; cv=none; b=efiZSuVG/qGCK1BPh8z/jxUW/fthAjOdmlYc1s2KweizQfvAlLLsMMI6LqOKMTV6EzkSIoN3GWuQ6wB9GH4pIuOjcpCa1jtx6PtoxJodwBC3yzMRAvVwjM8K3p6mCkryV46byvwnvTL7KnJx5yNtXXyx4IdoI0SPVAnAQjdlJJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266302; c=relaxed/simple;
	bh=2tk4mhPH7AaiH0ZsDLluAGPAGZhAiF9Qq+r3SPMJZN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JL0cYBUS/YX0e3vm3HxP8Mv4yvdikwsT6ibqCdzUUASHvAN5MxQWdFvFapBsgUc8RzG/Gjhg+g55VJtYPYKQssFHmQhfXM4Ut7PSw0EgeObztcd7pSPqFvgVZkX0NGOg1FQA85p6xq6guZYZylsgI4uH7Uqrz3Oqu0CgD0th8Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrzxQ5Ts; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrzxQ5Ts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7A9C4CEF7;
	Wed, 11 Mar 2026 21:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773266302;
	bh=2tk4mhPH7AaiH0ZsDLluAGPAGZhAiF9Qq+r3SPMJZN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CrzxQ5TsRJ/nO1br3qFMFEicAF659NKHBXf8GzgNNrzvvl0B4WRsxuajctkNcdVX4
	 ibYyCED5kcPhmIjy290fc+OWABZ5rUGg4gqLLUQSFM0ex7i9EUyieqbkbzYbQBIK/l
	 +wFOcWI9YH9gtzzD/yCokjdKujeIS9UcNiUL8siq8JlwD70EIf8espMJgFw741KYg7
	 GEWeOUbuuzr7kHhwIDdab7iQZsI0TzzHnUoD52pNoc3E2pWitVSW0RVPfDsnHJfKz0
	 g4ksy2o2mGClYTNSlHyvnU4jFc8Iyj3Op+/RAhDjSxBW6Ag+YDYgDf/Z5hMoZNtm8k
	 MZRsfiaonP7Gw==
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
Subject: [PATCH v2] checkpatch: add support for Assisted-by tag
Date: Wed, 11 Mar 2026 17:58:17 -0400
Message-ID: <20260311215818.518930-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <65ad15f96429d87225867e982cd1aab2@perches.com>
References: <65ad15f96429d87225867e982cd1aab2@perches.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Assisted-by tag was introduced in
Documentation/process/coding-assistants.rst for attributing AI tool
contributions to kernel patches. However, checkpatch.pl did not
recognize this tag, causing two issues:

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
Changes from v1:
 - Use next instead of wrapping the email validation block in an else
   clause, as suggested by Joe Perches.

 scripts/checkpatch.pl | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff79..27a43a4d9c438 100755
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
@@ -3105,6 +3106,15 @@ sub process {
 				}
 			}
 
+			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
+			if ($sign_off =~ /^Assisted-by:/i) {
+				if ($email !~ /^\S+:\S+/) {
+					WARN("BAD_SIGN_OFF",
+					     "Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format\n" . $herecurr);
+				}
+				next;
+			}
+
 			my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
 			my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
 			if ($suggested_email eq "") {
-- 
2.51.0

