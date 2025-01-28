Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2325A63E;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022796; cv=none; b=M3bkTkmTmLPhKhX5+1SBsJzKvNbKe/reLO0m4sN8TX7H5Jj2upnj7r5tmosHIeMW+PbBzBvLf63k0IhC3Y0VDnpZ3vXFDQNafdRXQ1mtZYjHba4eLw7DWoybbZdiXYUTQazFm5TYuANfUHKH3nbyNXbUV0VHzgQDMXI0UTDQqQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022796; c=relaxed/simple;
	bh=0f7tLKTuX4jKgrpwqlZrJAjeosOKAdyvIyBElssJbRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTgazBn40LK0I1uxbjn/pnyYtbwtSetJdCcjA+v1k5THT9NSJEV+Io2OnIK+Hj7de42q3kZ9dQ95aWEKmBvukMtr+CGFUMjDMNaeleMi8Uey9E0Qpccz6MMq7nGT194U5aIz/KyHw5wKmx09+RUzSiwmBbw0YVcDs7D5J/ITKrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Frsp8NPL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Frsp8NPL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF03C4AF0B;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=0f7tLKTuX4jKgrpwqlZrJAjeosOKAdyvIyBElssJbRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Frsp8NPL/mhQlbpT75V/1pHNOi0E8xaFgfwEu0FwigoJeNBJEEmZiuYxibq1m0lYW
	 gjOzOyg+jco7OTYIy1wpXpvPjO4wNsM6EYZKQdOnOnoEQUWATxxIO9Ku1b9eAc7SR5
	 ZR2F9CLAB4ASBxu+exkzFlrgAbCbAAxBk+Hi8u/oiow3Vw1mZ182AdZL4Z1R1O4F1s
	 juvHJaZpFGa2650Lb7/XXKZ2oG6jiEjUGwSvgXuMx8Y+rg7OZoJMhH3HrMCq3RgwVr
	 q052u2dYL6l0DntMhEyHiSX0burOZnrQkD6Kmv+kqlG+hPCgh+kjnyI6nIt/DRWbcB
	 GlOTwB5h7jR+A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRL9-3jvf;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 12/38] scripts/documentation-file-ref-check: don't check perl/python scripts
Date: Tue, 28 Jan 2025 01:06:01 +0100
Message-ID: <1d4edb4d2f5751b86f205785045cec7e9bc75a42.1738020236.git.mchehab+huawei@kernel.org>
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

Such scripts may have regular expressions, which would make the
parser confusing. Also, they shouldn't hardcode filenames there,
so skipping them is OK.

While here, also don't check references on extensions used for file
backup and patch rej/orig.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/documentation-file-ref-check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
index 68083f2f1122..408b1dbe7884 100755
--- a/scripts/documentation-file-ref-check
+++ b/scripts/documentation-file-ref-check
@@ -92,7 +92,7 @@ while (<IN>) {
 	next if ($f =~ m,^Next/,);
 
 	# Makefiles and scripts contain nasty expressions to parse docs
-	next if ($f =~ m/Makefile/ || $f =~ m/\.sh$/);
+	next if ($f =~ m/Makefile/ || $f =~ m/\.(sh|py|pl|~|rej|org|orig)$/);
 
 	# It doesn't make sense to parse hidden files
 	next if ($f =~ m#/\.#);
-- 
2.48.1

