Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FFC3EBF32;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811959; cv=none; b=X1P9GmwD2tFfMPlPVOcv7DKyYJoYDilDYo0Y8O5SbhhD/WRdaOghDWBUFY/g9/GOW33GAxrwcIlLTDf/solNUcGuZ454V2KNVLETkhaIZ7kKAakxz68G8ks8iFSbGX47ekjVD+pZltZEFpy5DNl8qG+6wXJpbIN/oPnGjhVvx1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811959; c=relaxed/simple;
	bh=J6aWOl4+bZyYo837nUHeE6Bf+UJ1MQRqQj8sRXyED9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNdvq7c02DpARn1ZnE151ZME5/TFm/o5DemrmmZjwlpFBnOYFycyaXsXg2Y9iUnxI12nXn2Gb5BXWFNmCUZ1FCC1NbksMiRk417yUlBzBGBkyspwKHnHodB2l/fmzqKUFr6dHLP3cbs7h7ipBgWboO5JrNKvHi3nYj/2NR82CMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddgTToKN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddgTToKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76ACFC2BCB4;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811959;
	bh=J6aWOl4+bZyYo837nUHeE6Bf+UJ1MQRqQj8sRXyED9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ddgTToKNEOaJKUD39fee/bXWQg6n2Jdc/bilzEvAT3fzSqHILrOd7zXtox37kZjOv
	 my2q3DtUUqJNs5MUjH9h30rbAZmctqcHxywl3pxUi1nQpnFmfB+AEILXX86fR6w/Bq
	 gG2Qy7GHsYDB2Nx3jssj3vAFVPXS3CFpFff/whSj/e3p4rq/SYIOAVCa58k38+4xhj
	 IJSyLOeVf+GHI0LgxSt6CYnuNjAfqXVtefJdhr720dKlATmJP49l1SBf5FSPLjXntO
	 AByLlxz9xNxhgpXRP4e8w9MZtvI8XEA8HEGMIbQjBoRfgs8d6+nWwsaS4Rhb8EVITp
	 x4icBeWi6MnOg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNF-00000007EgG-32Oo;
	Fri, 06 Mar 2026 16:45:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 09/13] docs: kdoc_output: pick a better default for modulename
Date: Fri,  6 Mar 2026 16:45:47 +0100
Message-ID: <8a5d91c93c0b9b34c2f60e389f4464742804d0d6.1772810752.git.mchehab+huawei@kernel.org>
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

Instead of placing the same data for modulename for all generated
man pages, use the directory from the filename used to produce
kernel docs as basis.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/kernel-doc                | 1 -
 tools/lib/python/kdoc/kdoc_output.py | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/docs/kernel-doc b/tools/docs/kernel-doc
index aed09f9a54dd..3a932f95bdf5 100755
--- a/tools/docs/kernel-doc
+++ b/tools/docs/kernel-doc
@@ -210,7 +210,6 @@ def main():
                         help="Enable debug messages")
 
     parser.add_argument("-M", "-modulename", "--modulename",
-                        default="Kernel API",
                         help="Allow setting a module name at the output.")
 
     parser.add_argument("-l", "-enable-lineno", "--enable_lineno",
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 7a181b40810d..c25f80a39cdc 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -589,7 +589,8 @@ class ManFormat(OutputFormat):
     ``modulename``
         Defines the module name to be used at the troff ``.TH`` output.
 
-        This argument is mandatory.
+        This argument is optional. If not specified, it will be filled
+        with the directory which contains the documented file.
 
     ``section``
         Usually a numeric value from 0 to 9, but man pages also accept
@@ -645,8 +646,8 @@ class ManFormat(OutputFormat):
         title = name.strip()
         module = self.modulename(args)
 
-        self.data += f'.TH "{name}" {self.section} "{self.date}" '
-        self.data += f'"{self.modulename}" "{self.manual}"\n'
+        self.data += f'.TH "{title}" {self.section} "{self.date}" '
+        self.data += f'"{module}" "{self.manual}"\n'
 
     def __init__(self, modulename=None, section="9", manual="Kernel API Manual"):
         """
-- 
2.52.0

