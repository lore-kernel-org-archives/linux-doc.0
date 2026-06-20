Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ADD1F12E0
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781986652; cv=none; b=SQyRg8c8T5tTOIw84hkhitAKYtb3pSJWwOo7tmzXJ/uwK2Fiu4m6VWdaplzrIWo2yHpaH3jaUgbiJ9nVVvjoPuTnYCVNhR37cu+wtEWRoTPSr5ezGW4MSw+dQiKlLE/it3nRILTSgQ3IyAPee8ifHtdM0nwFGupaaABicCdebyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781986652; c=relaxed/simple;
	bh=67sqZVOmL2hmCHdypHied2CwQjDDthN3QlDNw2wH4C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZMFQnKhyjw6Ft6bH+y2D/IHfDaIwTF/dKXglVxQnz0ZTe5nmP2Fp6gnajVniXmcRbe+Nd2UGQwrXFFYSCP7x/rIF2NvymDCtIix/PU9+tjVA7vKN0K7PAsm9zchEUNP1AM1GeAiIbYOAAaCeXXb9hwfEtWgIqOorIfJ4PaTlwpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=QsxOb2md; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=bIhbsO1T; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="QsxOb2md";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="bIhbsO1T"
DKIM-Signature: a=rsa-sha256; b=QsxOb2mdPOHFjvaqVyr/Qi/6X8nR9In730yONRFvWCmrW7eXB8NoXfw097/Y3qoFtuuIr/6brUKdBLXOvxcVUK1V5wnrrYny1hQvBqOq9WA7+Wzb3yhtbso3AgnZWMofDmJcavnMUW72nwQKr5kZyuDLKEUcgEBTAuABso+JaoDgU71Rkes0DUUGHJmAUqc9go7sNXBBgWU/A0xAFSu5tHFZMcP5sG4O4Sb6ozFLHPl1Cenz7hhB85yfuBNopi/jFGKLTz1AzS4ltxDTaMdj3fJHtOYjsxKVjpz4HojhYTT1TnDHCmAW56QsgOnPce7oiiGPfm7ss6DlIM7NQYnl0g==; s=purelymail1; d=rcpassos.me; v=1; bh=67sqZVOmL2hmCHdypHied2CwQjDDthN3QlDNw2wH4C4=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=bIhbsO1TGguqq1g8Uiv53GrgJjOHLsaaXaIMVgt/WkXJvuSDZlEoF9eRNGlHbEkzcO9KhyeqJQpfwn8HZeOFPRAnsP6hTyLAquBPSxWZD1Wc/CCwl8oI2zrZp2xoEZ++HZ4rBwpIsxM7UR7qNxFMULq5EX5UUChVX4s0C20LAKAAOThzuYqI+wbyEcbawikimRnpnUfGJ1zLvKi4va0XFP9m560QYPJTHw/fbZ/pPo+k8hAqkajRpGiWMxBI185QJ731VwJ2eS3SEmd/3GNu6BJgu8Rmkko6OEgJxXYUdtIIQaqnK0bOjbtieq8xmjYGo0PCFOSvJ2ainRIdx5vQ8Q==; s=purelymail1; d=purelymail.com; v=1; bh=67sqZVOmL2hmCHdypHied2CwQjDDthN3QlDNw2wH4C4=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1982731664;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Jun 2026 20:17:29 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: [PATCH 1/3] Documentation: iio: fix Malformed table for ltc4283
Date: Sat, 20 Jun 2026 17:16:33 -0300
Message-ID: <20260620201732.94141-2-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620201732.94141-1-rafael@rcpassos.me>
References: <20260620201732.94141-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Longest line in the first column is 27 chars

Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---
 Documentation/hwmon/ltc4283.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/ltc4283.rst b/Documentation/hwmon/ltc4283.=
rst
index a650c595bc8f..44a58ac6ee81 100644
--- a/Documentation/hwmon/ltc4283.rst
+++ b/Documentation/hwmon/ltc4283.rst
@@ -256,7 +256,7 @@ these logs can be cleared by writing in the proper rese=
t_history attribute.
 ``/sys/kernel/debug/i2c/i2c-[X]/[X]-addr/``
 contains the following attributes:
=20
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=09=
=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 power1_failed_fault_log=09=09Set to 1 by a power1 fault occurring.
 power1_good_input_fault_log=09Set to 1 by a power1 good input fault occurr=
ing at PGIO3.
 in11_fet_short_fault_log=09Set to 1 when a FET-short fault occurs.
@@ -264,4 +264,4 @@ in11_fet_bad_fault_log=09=09Set to 1 when a FET-BAD fau=
lt occurs.
 in0_lcrit_fault_log=09=09Set to 1 by a VIN undervoltage fault occurring.
 in0_crit_fault_log=09=09Set to 1 by a VIN overvoltage fault occurring.
 curr1_crit_fault_log=09=09Set to 1 by an overcurrent fault occurring.
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =09=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.53.0

