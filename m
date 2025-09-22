Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC2A24167A
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535390; cv=none; b=LxTUMEi7dr/kyon3Z2coH2f4JNBTaU4EnVhS8TLqILTVoo9dUwwkzjGoDgO2THq/hmdnjPJDVoZJMREsnCMvyhNTMqpMAQTxnT6dw7mQeuw6nXn/FPfQk91c3tq9MhY0+dE+OG6CPruZHc0SJbBAjavXWXh+umDf2aDIRsw4Uco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535390; c=relaxed/simple;
	bh=1Z/FIrvKbz7+7KzkAOkAw8QtjVUi2Kn58A3/jKJj3TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMSbjc9Q7hMpAHKl1Gmc7xLefZv5yj/cMUscl4KjydOmH2Dk1vCfBJ/WrShxQ49o0QDXTRP9miKlHYe7VD31NPbKl2nBR06k6IfKtSMYy9Shp37ioDlRPgkICSzVRLh0mhbXyUDYSiF74hN3WfLRmcxXO4aR1kZGFeTVjULvLX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEnRLZPO; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEnRLZPO"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b5512bffbfaso3661542a12.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 03:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535388; x=1759140188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLN+Eh1NQwEjC26VvFwkCS0AGaveETF0mZj2seOGw3U=;
        b=FEnRLZPO3ZttIlJA5PIRijJIUesqOeqtyAcSbd/uRMbgs5VecyOJnreLC/ioKfQyg8
         okfMpOrm7QUmdNHvDpv8G6V9j+k1Tj19NtWBcgEDspapWxUahUthiRpCWukGgNkwo/lU
         jWaKGB74meRoEI7bnHpWpJ3x4ozlONWYbC8vmSQY4bIUlV7MYS48+CghpzLjSaZBIDAS
         xLERbMghCnG2w9QVn2ZelArOV/upBLhBed8XakyMfa05GN4OQMOwCDEJphYqKtMNt2+x
         kVOd8K0w10x/HYTAoyrJ6yajCI0M4XCzSQdh39TIFMoPgl0f1rR2qfIyYJNR+tRAcCo2
         gBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535388; x=1759140188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLN+Eh1NQwEjC26VvFwkCS0AGaveETF0mZj2seOGw3U=;
        b=lmuJ615PT/HfwRLLv+r57HvHTdYWcuBYIjz92GOZjFlr/cSZ2DQjAmbHpQCCWRxS8o
         JqPydfQ4N15MSqPUpe9TsSpPYk+BMIW9dW9l0n9o/pre4tcCIMMLUHHEnchbkdNPbb1P
         wpbCTJVHdqV2UUuL0BC3ox8Kh63nxAvpJzJjlrNVtJXsQOboI5sUwb4wS+km1Z3S6zkc
         jmNrutG6MngNN5iL5s6foo4zs6JAEtHWlvOCI/DNCKmnYY1Q0OATs3xOIZO8x+9SQIp8
         LPoOgH+zsEhus39KAB6ahmZa4hnKwZhBxU0LN7AZ7Xn5TI16WYVT3ifsuFoUTZyX66T+
         eJtA==
X-Forwarded-Encrypted: i=1; AJvYcCU6ubJFo4c6+zbkECTf86qvZbDcjtyNF4dK4GMPc5DbIAKhhCCmk9VRiADW9FHRz3AmWDHhWI+XBhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFIZT5HQcEmp9icc1BEvBpDLD1CCebyxxtc5GOj4g3P7ptQtk1
	g8SdQS//xJ7PvxoLxxoCc1d1//rz6Q8AyXhZ0g/rEsWBEtBlwnAfeMT4
X-Gm-Gg: ASbGncuSEbfsRG3m4o+GT7O+4ybKnaMsb+89VG1b7a3Sp/tIABR5r/DKNsO1VSa5jL8
	tGn0lqcIijtOHjdIL0Q9scUb4IWrmwsLwuu0Y2F0Eevs71g5b63EoURwZCdtQwUQKypa+11VjrQ
	N6DRbLa5ON+sB0JK5cyUAjvbIyIOU+KNBR7KdiON9d84DZoGK+c02/CM7yG7R4qbV8uPrlYjHYl
	ke2v6A8RBGhBsP97Y2HFW2F3x08TthJB5HThSTlvGo9TmvD3nzIzG9EFhisOWVmLycfXDP7JfI5
	2aScyBjXzO1woZonPoHtigN9qQBOjb6NteN+2ML8ydzF07fp1zkBOQck/znw+iBaYGs31eXfifI
	FGRTEAM0+OCoBuPtlfluqjw==
X-Google-Smtp-Source: AGHT+IGtm0n1I4e8NG5ZtmJGclD2BCxq19uF73e1qqljRkz9OTvu4KTJehS7N7z6k+2ok3CFb7xF+w==
X-Received: by 2002:a17:903:3d0b:b0:270:ea84:324a with SMTP id d9443c01a7336-270ea843533mr122257575ad.38.1758535387676;
        Mon, 22 Sep 2025 03:03:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2699ae52db1sm116728775ad.43.2025.09.22.03.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:03:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 599B14220596; Mon, 22 Sep 2025 17:03:02 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.og>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux AFS <linux-afs@lists.infradead.org>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next] Documentation: rxrpc: Demote three sections
Date: Mon, 22 Sep 2025 17:02:53 +0700
Message-ID: <20250922100253.39130-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=bagasdotme@gmail.com; h=from:subject; bh=1Z/FIrvKbz7+7KzkAOkAw8QtjVUi2Kn58A3/jKJj3TA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkX5XSSnAoPBt0yTZtl8i6/RWrZ///5h41qeM04jjjUG al+/yDRUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgImYMDL8FWDcVHxIw2Ltxley dzby/pHQUZ/xLHbZnOBlRgYKu/TmpjEyLPK+qX45y6dB2Xn9waX3/5i4Wt49pT9fXjR72f6Oc5Y PWAE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Three sections ("Socket Options", "Security", and "Example Client Usage")
use title headings, which increase number of entries in the networking
docs toctree by three, and also make the rest of sections headed under
"Example Client Usage".

Demote these sections back to section headings.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/rxrpc.rst | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/rxrpc.rst b/Documentation/networking/rxrpc.rst
index d63e3e27dd06be..8926dab8e2e60d 100644
--- a/Documentation/networking/rxrpc.rst
+++ b/Documentation/networking/rxrpc.rst
@@ -437,8 +437,7 @@ message type supported.  At run time this can be queried by means of the
 RXRPC_SUPPORTED_CMSG socket option (see below).
 
 
-==============
-SOCKET OPTIONS
+Socket Options
 ==============
 
 AF_RXRPC sockets support a few socket options at the SOL_RXRPC level:
@@ -495,8 +494,7 @@ AF_RXRPC sockets support a few socket options at the SOL_RXRPC level:
      the highest control message type supported.
 
 
-========
-SECURITY
+Security
 ========
 
 Currently, only the kerberos 4 equivalent protocol has been implemented
@@ -540,8 +538,7 @@ be found at:
 	http://people.redhat.com/~dhowells/rxrpc/listen.c
 
 
-====================
-EXAMPLE CLIENT USAGE
+Example Client Usage
 ====================
 
 A client would issue an operation by:
-- 
An old man doll... just what I always wanted! - Clara

