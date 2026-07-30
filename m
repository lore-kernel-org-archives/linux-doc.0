Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0D3B95FF;
	Thu, 30 Jul 2026 12:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416002; cv=none; b=RlDS4Jwa7OrCRsc+rJ8NLk/VN/b3nn4Jyi8dgvEHK4T/nXLvG7sfav2IsIzmYHDUwRKsnZaTxjk2iZTwvoatPBIIJC6UV0k1YHhAYSC4LGCYalZIRSzrCyOOJZNjDztKlz7fyrA466FZv84MiUVUMf1hU0ZqQ7HMeR0JZo1wCio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416002; c=relaxed/simple;
	bh=gHBhnbPTiu2htQ5iO0nPsJboBks9BRY6T1U21FcvhB8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQsvXKkDD5UmIeshscOqbzvsZV56gZqT81Ddf0/Uk3G1k1x6qv3bkDsrryFzCtYDVdGdBnVtk563OdmR3ENVg1q24P+8sC5XYwhNZR6HbWVCb0WXCXCsWoarVuUJd9teRtyXzEV2VA41A9FktdOMt5MZ3e7ZGkXbt99BxKv+FEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=O7hbkZt1; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="O7hbkZt1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785416001; x=1816952001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BM4tv1Sjsq/VOkdjB7lMeJNlgM53NSNy1Y/QSAWXW3c=;
  b=O7hbkZt1IdsBleLZu62DcW5MGtkXb3qhFTt9ieMyLIKiUVwKXQRrOZYo
   JVa+B2xxYLrpVQrqUwy8oZYUWM32Hr0sVdzyZ5F+Qiwo+xKp2KlI4dQvs
   qLhRgOk/9yS8CAPiu7LdzneHG6J+w+iJMcMTSR74lS/AMUo0G7X3vs8YE
   14mE5ZbHTWMYGTQSpoYq8T9QOe0G20g6oX8WqYTvcw7sld8s9w7YALgYB
   TML/1ELqqR0p9hX76BUushnsIzy4YIe26w86mwL+eoaBtXmmMrfM+BZWb
   9R1rN9XFNDUexXSB4jD6PgonHwFXmBVIxQixDlzFeu6Lq/JzMEjjOJwX2
   w==;
X-CSE-ConnectionGUID: mwMz7Cj7S/yV7qLpbEOgsA==
X-CSE-MsgGUID: zPlFwMkAR9ugZSg3uL++gA==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24687525"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:53:18 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:26734]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.185:2525] with esmtp (Farcaster)
 id ca809c40-ffd4-4901-88a9-e66ae5f10a07; Thu, 30 Jul 2026 12:53:18 +0000 (UTC)
X-Farcaster-Flow-ID: ca809c40-ffd4-4901-88a9-e66ae5f10a07
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:53:17 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:53:16 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 1/8] nitro_enclaves: Let 32-bit processes use the ioctl interface
Date: Thu, 30 Jul 2026 12:53:05 +0000
Message-ID: <20260730125312.71415-2-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260730125312.71415-1-graf@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D043UWA001.ant.amazon.com (10.13.139.45) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Neither the misc device nor an enclave fd sets .compat_ioctl, so every
NE ioctl answers -ENOTTY to a 32-bit process on a 64-bit kernel. Nothing
about the interface asks for that. Each ioctl argument is a fixed-width
type or a struct built out of fixed-width types, laid out the same
either way, and the one thing that does differ between a 32-bit and a
64-bit caller is the argument pointer, which is what compat_ptr_ioctl()
converts.

So point both file_operations at it. A 32-bit program that drives
enclaves works with no translation layer on either side, and the ioctl
added later in this series is reachable from such a program the day it
lands, instead of waiting for somebody to notice that it is not.

Fixes: 38907e124088 ("nitro_enclaves: Add logic for creating an enclave VM")
Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index c91300a73f50..8222fbe75800 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -67,6 +67,7 @@ static const struct file_operations ne_fops = {
 	.owner		= THIS_MODULE,
 	.llseek		= noop_llseek,
 	.unlocked_ioctl	= ne_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
 };
 
 static struct miscdevice ne_misc_dev = {
@@ -1569,6 +1570,7 @@ static const struct file_operations ne_enclave_fops = {
 	.llseek		= noop_llseek,
 	.poll		= ne_enclave_poll,
 	.unlocked_ioctl	= ne_enclave_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
 	.release	= ne_enclave_release,
 };
 
-- 
2.47.1

