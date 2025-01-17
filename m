Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473831A262D;
	Fri, 17 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136795; cv=none; b=H48JCh08uc2AkRJj1KbHumAGOwEotUyEO65NL2qH+KUhuM0nUg4WMYeWatlSDksdX1Xw0Zn4ABMMK2EcpPD88qdZxlGu2GC1fjv4PLzfTOhXt+i8XzBkpRvKXJQc/dsVc7QNvPIF3uW3mHiQS7rCEb8tJthjeUO5F/boB7d8Z9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136795; c=relaxed/simple;
	bh=ceilUjRXkpDjjzvZIWDIPF1HxMNskgMsU9ZZ7pdFzYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZbfccJqVIrK2wdbvpq6zV6UKhNaThxukUdERv+JapJW/pr4JOv4TSlsw4Gq6nm3bsc0dUPMh8K47Fj1jTIk4xQbsvi4CJ/N7Qn9ZGh/IZDBnS4FK9s4WoyJKY5+ExQbCLYjXcI3lERs+67+2Rpd7x8fP69qudhkg7cl2yr4Bdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhQ+o/4D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhQ+o/4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BBDC4CEE3;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136794;
	bh=ceilUjRXkpDjjzvZIWDIPF1HxMNskgMsU9ZZ7pdFzYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhQ+o/4DkdFCwDD3EW9mbhhMkmE4WjyE3MqlJ29wzj/6wBPzwuT5eIGp6E+QXfLfE
	 2XmGaNxCxskVCb1Cf5EJeFO91su3U0HtOhBbYXh+9950V0gsVO+BNIRX2ts1lscsOC
	 QJg9mGG56jqMgmhcECQIGNp9dJU1Ycs2JQ5smERW8h2UYZzvkkmN+tGjAhIC2vpTVq
	 TJWU/GIUTHUll/UoSfcFC2iQjOIM9lYoJ4q8H5g9OtWlpYRsJNuuMBhBcSpy21cyF7
	 XffeJcy7m2g2wYBEXxg8Yl6FHIwGaHgKD8MbaOvRWOdZVdwkmwWeqqL2dwC0Lw5Z2Y
	 CHZgXa9hr1KSg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006Ak7-2Z5z;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 10/10] [RFC BOILERPLATE] scripts/get_abi.py: add support for undefined ABIs
Date: Fri, 17 Jan 2025 18:59:39 +0100
Message-ID: <89e3c065815db72901294bdda8ca7f05ab86b881.1737135484.git.mchehab+huawei@kernel.org>
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

For this RFC, let's keep here a boilerplate, just as a reminder.

This patch contains just an skeleton for the argparse stuff. The plan
is to implement such functionality here to be able to fully replace
all get_abi.pl functionality.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 6a461f7cef32..221338c0d893 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -618,6 +618,27 @@ class AbiSearch:
         args.parser.search_symbols(args.expression)
 
 
+class AbiUndefined:
+    """
+    Initialize an argparse subparser for logic to check undefined ABI at
+    the current machine's sysfs
+    """
+
+    def __init__(self, subparsers):
+        """Initialize argparse subparsers"""
+
+        parser = subparsers.add_parser("undefined",
+                                formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+                                description="check undefined ABIs on local machine")
+
+        parser.set_defaults(func=self.run)
+
+    def run(self, args):
+        """Run subparser"""
+
+        args.parser.parse_abi()
+
+
 def main():
     """Main program"""
 
@@ -633,6 +654,7 @@ def main():
     AbiRest(subparsers)
     AbiValidate(subparsers)
     AbiSearch(subparsers)
+    AbiUndefined(subparsers)
 
     args = parser.parse_args()
 
-- 
2.47.1

