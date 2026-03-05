Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF07F3C2770;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723787; cv=none; b=sjCWx6ue7Y6mpuOYR+2K/EYNZygrOUzxkEyFVJE8nbAfnJRkoOPHvMU1gy9GnKqEbH8TYSMwinPf6vBCC3FUt0eEWgbqyPQqAQ656zAcblEdfSiM2FJQ+tNvZZpFesBgITRytnPByKaTtAJJIZHDmktRCjO7xrUV4mQLAckSX2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723787; c=relaxed/simple;
	bh=61zAS55bnxXfENb2njyTK755tLiXa/iuu9D4Kk7hvyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHqPD4ogb8Q4SEAtPtNw7xT0cOKCARd9Y65yzaP8lnFCqDWqOUCezgDh6/AQRmHbs4s5KVxSZuiMalKqqA5DraHmzWBXtexsC91J/snWh5LZb1sCWAv8InUrKodGQGcGOfr7ksFWu4DKh1lcDG1cijKx+6ULBYstkQxnvNryIoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDI2ZK5J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDI2ZK5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF11C19423;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723787;
	bh=61zAS55bnxXfENb2njyTK755tLiXa/iuu9D4Kk7hvyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nDI2ZK5J+yEHe7kETLYbaHRy1nzbhFgte3dZIiTXPJXvQSjQKshOM0GVPtWkHuwie
	 XfI+uLVtrOVo2/FPwDFKigmQkRgKytPKJytBpdlBSzTv7IYOQADYc9nYOv6P7eLdZK
	 EYUTomQKMCnbZVanL6CE9PlWmWZpK/SBOZnxknOxfjr5JLkpzWTrsnxtsfSp+LbykJ
	 +qDpxMDuG50feDnexee5og0NBey4tf7NhxhPspXNlIiThWl7R9pXQh811j2SMMroHd
	 lcJtcBbcM/GxAbcQ0uBwTn6A905sY9SILsHksEyZtLronN4TrwJPbLvOYn+y3rZb5q
	 8a+fjxQS+bk1A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR7-0000000HK6X-3PNt;
	Thu, 05 Mar 2026 16:16:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 04/11] docs: sphinx-build-wrapper: don't allow "/" on file names
Date: Thu,  5 Mar 2026 16:16:11 +0100
Message-ID: <7dc8baef622ed93490f6b2c58e3349d9e105d08d.1772722474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

When handling "DOC:" sections, slash characters may be there.
Prevent using it at the file names, as this is used for directory
separator.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index e6418e22e2ff..4572328e379d 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -625,6 +625,7 @@ class SphinxBuilder:
 
                 # Use shlex here, as it handles well parameters with commas
                 args = shlex.split(line)
+                name = args[1].replace("/", " ")
                 fname = f"{output_dir}/{args[3]}.{args[2]}"
 
                 if self.verbose:
-- 
2.52.0

