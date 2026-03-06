Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451E7FBAC;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811958; cv=none; b=BA7uSILwAi4kAxQuFZ9gMFbt11JURFW0DI42TgtAL38zewA2N+pl+a3r1yQZ6ijNGeEupi8QBjgxk7zXgKaEr7OoxlY9twJj/0/c6ImG+E4fTm9WyCEtEHvDejvzdR6YRVknVLNs9HnMnH+/vN+mslNGoizpydbcMfeNEHTstso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811958; c=relaxed/simple;
	bh=btvMeOMee755n720r21IH04ZmlM8pztBlnW5wyMsB0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GE31MOYoIQ+dO/MbfhQyve+KXuXk9OW9UdSGFpP2kc8+gapy9eVVtAndoJvrTjhFK69GTrnMe/l+bsfvUY2evkbJQMy5gNN9SnhquZ+8nOz6lP5WjBFo2Mp3wOWk7r2/eMt0Y4k/orxzFXo68hFdRjIhqefYMo93hoXcCpS6G5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iq6uElCi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iq6uElCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D71C2BC87;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811958;
	bh=btvMeOMee755n720r21IH04ZmlM8pztBlnW5wyMsB0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iq6uElCiwwArigPnQoNbWCPdyoc65aymmL5pu8nchbIMFZBxZSaTjjFEZWTalm3wk
	 mxpimZEJjL2V79XSLoTPpluxHh4o4dQ48dqfpWByRtH0M5X89kVDWzvdnw7fqJI/r5
	 h6FIB0F0faRBLZole36FvuxaabYWDDaeJFQ8s5CkxrjbM7lL1xjgwLF4DlFawHphxV
	 pSTRoRoaAl40HEoQAkI4rGIhelN23Yyx/T7HKyylgP5AGgQYZ/z1ZdpqfaUbwFCfrJ
	 jl/a3rnUFt5cfdByR3ZVPx6LScocm3iwVPgqtvJxYLloSWCCRzcUsNcKA1c2L6tvEW
	 oYZs1ebGV7Z7w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNE-00000007EXL-1asH;
	Fri, 06 Mar 2026 16:45:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 02/13] docs: sphinx-build-wrapper: don't allow "/" on file names
Date: Fri,  6 Mar 2026 16:45:40 +0100
Message-ID: <c1a83a50b0659a5bcf68ef14f9457cc188e91e3a.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
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
 tools/docs/sphinx-build-wrapper | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index e6418e22e2ff..d3f0dba13da1 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -625,7 +625,9 @@ class SphinxBuilder:
 
                 # Use shlex here, as it handles well parameters with commas
                 args = shlex.split(line)
-                fname = f"{output_dir}/{args[3]}.{args[2]}"
+                fname = f"{args[3]}.{args[2]}"
+                fname = fname.replace("/", " ")
+                fname = f"{output_dir}/{fname}"
 
                 if self.verbose:
                     print(f"Creating {fname}")
-- 
2.52.0

