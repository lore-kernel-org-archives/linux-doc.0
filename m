Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334542D3EEE
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762156798; cv=none; b=ZAyyEiF0cJHQzJGfufUQVOsof0KXehrUnYS3pRMhb0A3gMG19VshE7TQc/x5bfil+Rj9Xsrk5xqwN1PBs847BsNxiOr/TctH10foqvpMfHNNnL8wF4BhkMXl3Q8D8XllF2mIp8TlXTHf+PcBYe+MDcH56E3knINuLEBL7YgpZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762156798; c=relaxed/simple;
	bh=IszVnDCPm0bboeFG4KrxgTH5HC9Vm0rG9lgMcCpXRTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syuU/gCkkG7R0jf1cRdBI8k3QzxNSLekvTrA7UTnd8brwn4KwLTemb+6DkqxBIENMz59v0FUwgkKZBhfEOovaGDDDAkLiG9jyZ78/VNik2zpiSXn3eF/HaKK9RQdikpHJUPhZbPX3AwoDELhn+rS+MfRFZqY1TmFqz8RErbPTaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QU8aCU5I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rElu7QUp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QU8aCU5I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rElu7QUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762156795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Ng1Pwu6FSvlmYcO+fW7tQgV+r8RIUxL6Vl3k5g+WGE=;
	b=QU8aCU5IFhrddf7g5Q5aoVjh8d+WFQl6/Ey3nOC66ylKYX6hziA8T+DHpRdpONrD4azw3G
	JtdFndE7WhoH+VL3AStM2aZg5Fo6WtijebjR7BWsnXmRvZNZMeRVZsghQpMwgvIqE4F3PO
	MUXYvWSjkAS87uU96z6R1V2nMUeIJX8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-9g5sSZfJNz-A3C3PRPJUbw-1; Mon, 03 Nov 2025 02:59:53 -0500
X-MC-Unique: 9g5sSZfJNz-A3C3PRPJUbw-1
X-Mimecast-MFC-AGG-ID: 9g5sSZfJNz-A3C3PRPJUbw_1762156792
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b5fcada9d24so413672466b.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 23:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762156792; x=1762761592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ng1Pwu6FSvlmYcO+fW7tQgV+r8RIUxL6Vl3k5g+WGE=;
        b=rElu7QUp8TqVy93pBeC1ARbNAPsj7jt7Fb+sRKoqZCd/Js80GcFbRezYmpfC7PmnG1
         oVyBpJCxZ66BXFa22KxQpYiWil0WrIivhSkm2hC0Wbec1zwmCFBOFo1bF78Gof2gsf6C
         gaZcQ6dZ+f0xV27GUSXihR5M0QpOmr5IhDirEuqaFwhZl/RdGwrNNe1m832c+dY4ODuD
         0BUWPDc3ykvRdX9nSx0Rr7JH8+kKogLGNhSuxnHnMYcpWkLoBBSu2XOSTBPtNj48a6nt
         eeA8Ciy93yBwB3Lgay4tcqUzArpiSpdcbnIDOxrZR7v0jM0VpLtSdUaJOqQGyKxbC9Wv
         2moA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156792; x=1762761592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ng1Pwu6FSvlmYcO+fW7tQgV+r8RIUxL6Vl3k5g+WGE=;
        b=HgvcmN62anIS2k2fwZllEA2g2ihlHS/voCbyj1NAgF4orJVvmyoL5ltA/Q7aW2GFyS
         RS+XAhxkekn+HdZ/O7rYvpf5PWrxJpdTSAQQ1Y2YLF5ffh2ZE467ArS9Dk06/sUDAeUD
         yFv/gRxtaEadOckWYCtOIZeCvCbAVXXAe5sj7LOe1BA0rcI87337voVOVGEmELUmTCIr
         o9TIuK6gUCO2q92TVTnBvVqSTN2z5nyMrOWFYMtAZ8up2phnDmjPToE/GCgsfGv91H/I
         wCD1gFDURCNBsHOiUmB1g3WJJZt+wvfA74/I+Z9mjzRq3JQ3sMGBI3VpiioH5TExiDnH
         uh+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE68fp4/12QViCMcW+pbVr1HAZ/3X/nW6wIipbj95wZd9R0i3pAe7FznyzmS6+UBC9wqOlaXNj7II=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGKn2gamtiquQKx20g4Iskkqb9CzzMDY/MshcOPbWDe4vcP23
	IxMgZGllyZE5VzFeMOdGi4DjY7crHqBOZZqkdoRrN6dz/UDtQ4Ksoy6vVbVDsLojeluGm0PGPiF
	zIsnMFR9zZyM5et/CeXaKngyMf4j6/Eu0GXqI+Gq+JAjb1IgBrv7dMtCHecqA6Q==
X-Gm-Gg: ASbGncssN9kFkyMvW9Krewwi1du5HdbseHEJ7vypBma3fKtHeRoyD9U7+X0v9HC5l5b
	g0quWT14CSynJgOoPNByrpwwGyRh0leNG5UhZjd0QEN+XoEeqroUXd6D1deqQW11Kq/m5iCvtfT
	g8C6LtmuqBeEAMlQtFTAmq6xMCb+Qv6ZjDoLOYyZ/QchEFYChvhYJcSHV6oA+AG+9nfZ6hN38kp
	N5WXxpqTvBuo/z6MuNluE7Ejw7Q8BcDgpV1TpyN38Gp7ug0pTUpMT8uxPfwGjfAvCK2acdfJv3s
	X5dU4GUClIWJMkGTcn45y1XUujqguZ3dU4u9jIAruffJtZ2nr1vxxh6/CczEH0xrx33ezcjL7nE
	fMIrJlbhMTvCjTSGSlwvrhlkNZFSWZwxQ7T0M1ioU/Msnb7co
X-Received: by 2002:a17:907:6d1b:b0:b43:3dcf:b6c3 with SMTP id a640c23a62f3a-b707062eca7mr1059165566b.49.1762156792463;
        Sun, 02 Nov 2025 23:59:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEei0TEbbcqaHv2/H5u75E6cBldBAuSc4DG6tLxuw9RodARfK8Z6AgTqtkQDZxiwrECzBHCag==
X-Received: by 2002:a17:907:6d1b:b0:b43:3dcf:b6c3 with SMTP id a640c23a62f3a-b707062eca7mr1059163966b.49.1762156792088;
        Sun, 02 Nov 2025 23:59:52 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm312691066b.8.2025.11.02.23.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:59:51 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: extend DOCUMENTATION SCRIPTS to the full directories
Date: Mon,  3 Nov 2025 08:59:48 +0100
Message-ID: <20251103075948.26026-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Due to commit abd61d1ff8f0 ("scripts: sphinx-pre-install: move it to
tools/docs"), checkpatch.pl --self-test=patterns reported a non-matching
file entry in DOCUMENTATION SCRIPTS. Clearly, there are now multiple
documentation scripts, all located in Documentation/sphinx/ and tools/docs/
and Mauro is the maintainer of those.

Update the DOCUMENTATION SCRIPTS section to cover these directories. While
at it, also make the DOCUMENTATION section cover the subdirectories of
tools/docs/.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7031ee1e7cff..c9bdaaecc946 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7442,7 +7442,7 @@ F:	scripts/get_abi.py
 F:	scripts/kernel-doc*
 F:	scripts/lib/abi/*
 F:	scripts/lib/kdoc/*
-F:	tools/docs/*
+F:	tools/docs/
 F:	tools/net/ynl/pyynl/lib/doc_generator.py
 X:	Documentation/ABI/
 X:	Documentation/admin-guide/media/
@@ -7476,9 +7476,9 @@ DOCUMENTATION SCRIPTS
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
-F:	Documentation/sphinx/parse-headers.pl
+F:	Documentation/sphinx/
 F:	scripts/documentation-file-ref-check
-F:	tools/docs/sphinx-pre-install
+F:	tools/docs/
 
 DOCUMENTATION/ITALIAN
 M:	Federico Vaga <federico.vaga@vaga.pv.it>
-- 
2.51.1

