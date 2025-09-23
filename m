Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70CC2E0
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 00:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674621; cv=pass; b=dkmIWpV1x3LjEuySYwKHfL8yuBJWIIfPJvZIWQOKOBXcIRbTMetEz33W2pvD/2LAMHB2+eIIIcTw8MeJZwSrTqqmuLahEjjXc/clnR316EmDYtnlrq0aZ0YA746mflqPI0A4VoAu0p4FniSbktogl0ePDQJTsIGzYJInVhlMGCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674621; c=relaxed/simple;
	bh=jVC0f54KxIaXPohvxMBE4QoFJdeV8vR0/DlR6lS19qY=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=SIgXJI7f6PpswjfHREVDLxqwlA3Th5dzy+KQqTJN/r6K90rkHOKY1265rB5XIJNAZm02MAOW+2JlYAYXRP2bt4JjtzDJ7/EiVbtBFhoMccEavosMdrPvKltHk+Lz7qiqEKZgKVhBC4+p1Ds+yRlpmZWvaT3OYAUdEApCCcmW3Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=MFjZ188Y; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="MFjZ188Y"
ARC-Seal: i=1; a=rsa-sha256; t=1758674618; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=BYLlbu3LG3NWZl0YImJy7tc+BBt31Gmluxl/EK962T4+spr6fLf5XBBngX18qILt+xCabDGJ2hmFXCG1DI3mSEeenWay9ockmo5C7PfrMCiapZ8RPbCh75ZubRIjkbG64eAfYzk24Cle/dZlCFjljDGuf59F3GOnCpgOod46D8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674618; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=jVC0f54KxIaXPohvxMBE4QoFJdeV8vR0/DlR6lS19qY=; 
	b=LeAHiVuz4tVoSj2obbJJ/0AdkhDEB9c0qp5vSxC4Bfli7C9KBk36RoV/60rkf3zNRVqGSOyluCb0Sl7tWWhJk2uL5DTcmuSCkUAJ1+zyNpqvfD5sYBOcYGRynB0zj+U7MhVFfW3nBb7H5+rUTyC4d4tprYy9XV5ekg8P9s6Hm1c=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a671490-98d8-11f0-9ce0-52540088df93_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671652882815.4961298202282;
	Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=MFjZ188YoQbqs8Nag56ps8YzfkMcscoiyR0MW9BcdWP00bhSz39u7CPqJ3RMX//IJMDdGBEf/owve2pi5UiOY18vQAdlpEQRC1TCtYGS1SX29nBGDw7b+IsYqTzIizXDI6e/7abqw01H8Ir1WAlaEVISOD9+5FK8taMKRGpwFK0=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=jVC0f54KxIaXPohvxMBE4QoFJdeV8vR0/DlR6lS19qY=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-doc@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a671490-98d8-11f0-9ce0-52540088df93.19978ffc459@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a671490-98d8-11f0-9ce0-52540088df93.19978ffc459
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a671490-98d8-11f0-9ce0-52540088df93.19978ffc459
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a671490-98d8-11f0-9ce0-52540088df93.19978ffc459
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a671490-98d8-11f0-9ce0-52540088df93.19978ffc459
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a671490-98d8-11f0-9ce0-52540088df93.19978ffc459@zeptomail.com>
X-ZohoMailClient: External

To: linux-doc@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director
