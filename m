Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278213343B
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708012130; cv=pass; b=VmT/EkRT0G6ftiZKq36/YtcGW7xOTb+PDyY9ZbC+uNs91ChoCn/JBwvkqytDDCW7BoKIiT7fxwQ19VNxfd97XGnqVgL3Xg2IvoHMDOkSA/y1Oi+9TcR8uVyTR987G/vkmvjgqXgqxDTSxYiLb2GxokzSHw+iCe+GxepnRsDLt2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708012130; c=relaxed/simple;
	bh=+4O3D4o5CsfHbruLVlheO0dIe4wiYNfrvNQ9FVYTaoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sE5JDn2Jxbk/GETV8r69FrNAyV3QX3xG7iBUAf/qX6ej3sYUaIaC1bVdwfl/5IcUud7cX9dsh7GLAq4on+S8j+bgPMGmCMzRXPQMW4bh4xnOaHW0wugtrtkhpcrjz/TgSWowLLJiF2TEOUwyC3/smfQrCqyvp0Rt638c/agoJXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=okanakyuz.com; spf=none smtp.mailfrom=okanakyuz.com; dkim=pass (2048-bit key) header.d=okanakyuz.com header.i=@okanakyuz.com header.b=ZI5tZ5+F; arc=pass smtp.client-ip=23.83.223.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=okanakyuz.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=okanakyuz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=okanakyuz.com header.i=@okanakyuz.com header.b="ZI5tZ5+F"
X-Sender-Id: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1118F81F24
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 15:29:25 +0000 (UTC)
Received: from uk-fast-smtpout2.hostinger.io (unknown [127.0.0.6])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4C36681F05
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 15:29:24 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1708010964; a=rsa-sha256;
	cv=none;
	b=9fkIjxjmpKPPAok9AKQKZF0/FzJIwVx6bCmnIg/6+Szo2+JJxIBsT4eGcVQ54+anf12key
	GRGfzVWGBq0iUiZ9ZXt43i6MDiiVlHUdl2UDkLAtHy7KTpYgfQmIASG6thKx1ye0LsE94S
	2k4h883GX7v9YrjuSf7lI49u/Bxg2GRBMqF3iO1FDbn/WIoO9i93iHILGj3K0m3mWTDW7N
	Pz5LxmM058CxP2iJVqB5/ZcOM2lK4hmsEmo8hbEU2k9RazyFQD5Uax+mGafIxY3VNZye8V
	oOWAm3E3r9G8HX1Lx/OJGMur93boEQlLcFdQejzacLPV0wTqKW2inekKyY3IBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1708010964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=cbX2TFeKmQIH09gm5LYQHKCMm5YzJk5x0VxemUSMmNU=;
	b=5TEn/ssRXw3vSYsobv3Xapycx62Z75055/c2oY3L5AsXp19n/bW34Mj96WGpDxujOOgKlq
	7yQM76znlFDq6PsFCnbnAC+wDDOTTn8vO7D8YMlVuSL2dW8zloBu463dZwwPhM7FZ9klt9
	f2TopggpMxXaW6vtEt38HKfmq8fjeVJWHF9aIfE2c9l8Xior7jn3hea1aXP5fxVLVOcbcx
	/h3260rzbb/Uk/d0MmOqiBRj4wQHh/e/h2Q0081baf/FgyRTlnekv6f0tactgR0SMaQ8hG
	DViL0HMJxN1CeKzFRPxLJ0c4aQs7bliCrPyzpPp7yE/zMwDdDyWyI/UiAWrkhg==
ARC-Authentication-Results: i=1;
	rspamd-6bdc45795d-dx4t8;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=okanakyuz@okanakyuz.com
X-Sender-Id: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
X-MailChannels-Auth-Id: hostingeremail
X-Ruddy-Harbor: 6984111523b62a61_1708010964829_699144811
X-MC-Loop-Signature: 1708010964829:1298361503
X-MC-Ingress-Time: 1708010964829
Received: from uk-fast-smtpout2.hostinger.io (uk-fast-smtpout2.hostinger.io
 [31.220.23.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.153.71 (trex/6.9.2);
	Thu, 15 Feb 2024 15:29:24 +0000
From: Okan Akyuz <okanakyuz@okanakyuz.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=okanakyuz.com;
	s=hostingermail-a; t=1708010962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cbX2TFeKmQIH09gm5LYQHKCMm5YzJk5x0VxemUSMmNU=;
	b=ZI5tZ5+FAniwcDdqXIV+E1OcmYk+pNteOtrqb7CrD/3jH70hAvQGOk8HWEBGoUpx+AzDSW
	t5rxiA0Uewd6B0lxilNIN0DDIS842Ea1RwyEEhz1Jlokf8I5MxTiQ+PeWEw1sEcspCK44H
	IPGoLVI8KZYprahKaPoyUEpQPARxX2zFoxANOBFf0d/5OmsEOEmetQ3NqOstl/HdU4Q/HR
	t2s3caEKs9o6Rwkohu8/KSX5mmY5E9tV7Uf8zmMm2KP32yIaLR/6pQCU1eVrUoRtZIkxI+
	qv05TCcKiVsA3Ja/I4PS50fugC5z+91mKMol9pFl7778HbT1btIGxwWD6GSRgQ==
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	okanakyuz@okanakyuz.com
Subject: [PATCH] The datasheet URL has been changed.
Date: Thu, 15 Feb 2024 18:19:57 +0300
Message-ID: <20240215151957.20855-1-okanakyuz@okanakyuz.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-Envelope: MS4xfELWMjXxd9QwZl2hd/DXq0dhbDsJyXzaJU1n2KAVlPPQQWWAaX4bocHs95nVwUzgkes8cSg6c3/XcyXMdZ9Ssxin/55zpWCdg+I7z41lRicNDzc99Uq3 3W0vvCsyii0gCRm7ZSp+xmVg9RNmg7CIh5E9JS0MZodQ4iW9EVXPUeZoEImWpArh64clFdpdvy0ueMiZlFLy5jj4MDCCSXSmUuGRUijxUv+rm/+3yd2a0ZJ8 Ha1SDJxk/KVBEiLAArZU+zzIUrOPk1SbXA3v2dOat5VEx0V8GFv52hlbwY6BLVddBzzMqBEaVUHI3AfzOvin/of//dE/I5wp5/RGeku8Uj74ewwjmVOrdAiP Dy+AvZBDHNrgZRRt34622uWpjltK3K1aUC3hOUEAOvi+Qg1byN+Y2v/2OiJfYkz65xnnQiQkC2rgDLK1KtZtDB9ADHrnJA==
X-CM-Analysis: v=2.4 cv=Rp/DLjmK c=1 sm=1 tr=0 ts=65ce2dd2 a=geHYaF3j5ifCImHjKwHHfg==:117 a=geHYaF3j5ifCImHjKwHHfg==:17 a=-tA9vPf7AAAA:8 a=UXzzSC1OAAAA:8 a=gAnH3GRIAAAA:8 a=2_2egfEcOiK7PuE5XgAA:9 a=vtdtr2SZiqPAgdHKmkdM:22 a=NXyddzfXndtU_1loVILY:22 a=oVHKYsEdi7-vN-J5QA_j:22
X-AuthUser: okanakyuz@okanakyuz.com

The URL for the datasheet was not functional. It has been replaced
with the active one from the manufacturer's website.

Signed-off-by: Okan Akyuz <okanakyuz@okanakyuz.com>
---
 Documentation/hwmon/max6620.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max6620.rst
index 84c1c44d3de4..d70173bf0242 100644
--- a/Documentation/hwmon/max6620.rst
+++ b/Documentation/hwmon/max6620.rst
@@ -11,7 +11,7 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6620.pdf
 
 Authors:
     - L\. Grunenberg <contact@lgrunenberg.de>
-- 
2.43.0

