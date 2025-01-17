Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0E51A2C06;
	Fri, 17 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136795; cv=none; b=Tjz0wUOrVDnUSVNfSXLqjnEUVX81xSuSPo5JAgbgnr1tLaN6vWN/Yn9HntrDhHRCrJjfjtFYPw16QHwcfFqyDVq5UXiZ52HZmpUVmjnrZ4vW3dXD5v6mQGRy7LP/tCRRx74RX9NLG3DcWxnTpY9gmlwz7VGMP3x+Lb/GP0uZ/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136795; c=relaxed/simple;
	bh=/H+OLoZ2kSlBBHpxEGHakZW6kJ82w76RHhbP2QrkPCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSa8HlbUifwhJ5SK+q1dghUPKbhvD59K4QYWOCvn0DHgBO3knMDXfVd0LW07n31pXZfXn0Xpw1CH09Z2+t7IlQlA99bQnkfYS68CVJvk4YVux7BZIOFH7IY/0oNpg2/7T/xbpAlJ6L9QmNGeIe4r5pswD1J0Bf7Pr72F8MPcbUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dG+Xd8mZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dG+Xd8mZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A37C4AF09;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136795;
	bh=/H+OLoZ2kSlBBHpxEGHakZW6kJ82w76RHhbP2QrkPCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dG+Xd8mZFVXg4fa5H++CKRhsZ+liEdeBWougxx6Ap+TiFx0hAyU0ekKs92BE9oZRl
	 4Se7/zbmfVUHSwpGtM9EQz7Da0dVGB+EixQJvxd/j/hp0HPveGU9K1SVk55T06seZd
	 yKpb/a6gLZFljuBYuiVReDQIn0X8tej2/OcDXoZqHmHBUGiOvJ4rDmabSahbZFB4aw
	 VdXdW43VQUPmYrxSaJQdP22VbhqG4DxUHu6KKp1Kq2wpca5Jr+0DJHxWkMlPzNrcXd
	 DYbKuVjLyQa2juBlAhBK8NMycYn1+TaAh28f2Av3hOFRwC6PPkHORsn6uscxtiXTst
	 VcUDYVq2JUfrw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006AjX-1Yq4;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 01/10] scripts/get_abi.pl use label to better sort ABI symbols and files
Date: Fri, 17 Jan 2025 18:59:30 +0100
Message-ID: <dc7ed8c3a9a30f3c04e0fb286d65e438c58ec949.1737135484.git.mchehab+huawei@kernel.org>
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

Currently, not all symbols are in labeled alphabetic order. That's
because they are using the hash table key, which doesn't necessarely
are identical to the label displayed for each symbol/file.

Add labels to file as well and use labels instead of key names
to sort them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index de1c0354b50c..2311d4e3f3ef 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -108,6 +108,7 @@ sub parse_abi {
 	$data{$nametag}->{filepath} = $file;
 	$data{$nametag}->{is_file} = 1;
 	$data{$nametag}->{line_no} = 1;
+	$data{$nametag}->{label} = "abi_file_$fn";
 
 	my $type = $file;
 	$type =~ s,.*/(.*)/.*,$1,;
@@ -320,7 +321,7 @@ sub output_rest {
 
 	foreach my $what (sort {
 				($data{$a}->{type} eq "File") cmp ($data{$b}->{type} eq "File") ||
-				$a cmp $b
+				$data{$a}->{label} cmp $data{$b}->{label}
 			       } keys %data) {
 		my $type = $data{$what}->{type};
 
-- 
2.47.1

