Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794817660;
	b=ot9YhvHyj/0gONiCXOnePJxwR/uGCbshcMVfAE4ArhPFG4rTfw3VR+YVKqdFehpg2P4v
	 rBuTCn7g42Wso9rtvlFhLECAa8bAoNrRnyvky8WPqDBcK1wqrpXcUdY+7jd0Y5+aeKdaC
	 bHN3nxs7kIh43TGzh+8hgi+Pdrjgv1rnDlUbRKzBOgT3l6l6KC9671dgHWxOl1RXRo/CS
	 ZJxL18ClRneFOhaycPNIGJNct6rv32L6NP9wMqL3cePwnV+QCYV+g2zD9zROOkgvETA9n
	 7j3zWFpws6b0qCXBnkMT3u+/0ZZz6aaKpe7Uw7MS4tZN6Ze4TMm97WP9kQdpONe9uuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
	b=uFjHKNYw/nGW+QV4PV7mEo977QGHIRjG3F3I37SYCiWHLkQrAy6zXUOSDpKi9DnD1Req
	 wfHblILlO1mLBprnQDryNmNjI42fBCQ3K/eiGP+qEQ4RrAWiYI4yf42chMY5UhLWLryOA
	 vqxo7nhBncrZnDClLh1eLIv2lFtljfUM0mrGmCZ6BXUyTJ6L/oFbkv7v3PvQmQkgkR5nD
	 Cownd8Hwdcbl0rXVP+xlI6MJiTFgymNkYLW47gyMFkUUbkemKzNMPDPnsKfDf7dwiXiEl
	 ovqFgY961I7z2AegXOwo0ZRRQPhodwghJVShmydwufjvvXmqRCsK86N5GjK/S5wUvGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV4fspfO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436A4606A323
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436A4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV4fspfO
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e98798cbddso16674815ad.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 00:27:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794817660; cv=none;
        d=google.com; s=arc-20260327;
        b=aQvXuWCISYYGE3fKE+bpHTdFvmfx0Um0jLHOfNAHGd5lMXyX4pV3Rq1jttqHvF3rqD
         vic452+D17/q32j9S63LS0pSbDQR1Znx2LnT9vz01MU2yhS2+/QXSAns9wLaod5KTlod
         kou6m3/XntxMq1kbcfDMDKVNCiot+fwvwu9g/ayvXCnhac/zQobKXOvv6T7GNq2jJBSK
         fWZcQ8OFQnLLKv3SAFYu3Tx1kqaXjIa/X03ZfiOwF1i56syZb1ommMGUYZkyFdED6ykh
         61dCzibqCgUeSPMa3rHRvohdxLloy7RtLm2VuZVnto/tjlEUGdUXp8rpmagfYrV5Kr5C
         5X9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        fh=O8xPP3ePX12Pk2CJBBa6Dii+0ZRvetHj0+O5jfc2k7M=;
        b=oHboob9Xc/P1dtMOSBrWsg/SiabovddKNhjsZIwUlN+6ltRtCUpgUzP89FFgrgqv0x
         KPNNhRizR8/J25Ri7a2FpHG4TLnXiPv5KePpRKX9YLGqZAK3hqgQKHqFI7arm2NAblzk
         U9QHs2ZfqNHhhlaFPF1xpYgAWPeHrtvQ62Ff/TWfTUPONBL9rm0Yx4cAWq6HdtCLbvHd
         lP7THuuI698bf9yAwc607me2SzeDo4cJZ4ENyGrGgwxYGSJcrP9meX+m2TMUzERMBeQ4
         VJpZ/ZmcQIUN5Ii/nQMNxLIe2Mf9liu7NtBxiEbM7AnCRrnsClbmy9R/CY7VgW6kAA6a
         kBhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794817660; x=1795422460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        b=eV4fspfOaP2Tturg+lzdotzqI2Gm0GnlSyvDrPWhQ5MuFzcOcT15MPaLUk+9dY8ZGG
         eg1MBKaEe0/L+9cUmBdW3g7Vs8LwDFGf9f6aTF3LMOSQb1YNO86FlepwJUuwAcJ54q7j
         VSkBykJ9gdeE4FG6JocH1C9zUJB1zYUtldORv/MOdIX+MMgxSDRfOiM88fxkYen69e2k
         +Se5azRHXTBBtMDGpZbyhFGDmHVJP+H55A6osBbP0MLpC6/ABw+PqFOFrLinmeTWZWmg
         sCMMu+GpdOZqC0ROyrX8tECYVcNcJZ7LORkifra47mCFvS/3QOMbziy1RuwXRkggb/gw
         qVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794817660; x=1795422460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        b=jyGZCyif3ClDoIAyvw6woCEee3FeZ6F3uC+H9iyEyzUM9LNdqhGfloK23fW/DFKC8C
         DedX4eMj9imyyngW3OJzS4TJ4rPd+Blc8aR8aXoyZBiKMOiffZGBWUsAb6NVa33qR0Po
         qifxHZljw80pdiCBWLhq9mrR58x4gMklXXcfeHwRoODUYRUdYhGVZQLOrWnJRYe78otJ
         ce/hTLWcDTUMlin/BUjaGb56toKc737vdYMRN4ylzDh3JMdXnmoa9lPpg6+luNDliJnQ
         8ATq9728Z571wu5AR5/3lGy+L/Rf0NTkGf36zzuPq91viA+qJLukZlRksDVSYOhUdbEz
         /kqw==
X-Forwarded-Encrypted: i=1; AL+hErEBSrK1NqKM3yJZXPGyYUO6zM9BMFjh0ctkqNCjqjPRUwN4bOE3yiNFNMX5Mu6RyKP7ZH2qZSRCFeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+65Hjuu8gLn2r+c+mFi6OOd2D81KVagL5zlJ3Pjewb/APcX7FD
	x5znPMNSRsSgmDJj7izwFoAKrqcJ+D9wDxjxsaxrO0V9qCBka628NpOKTxX+l8/4eJe2hfV/qan
	VNQ0Dc0nd1BhHJOaOTygm4uRF6oib8fh/90mM
X-Gm-Gg: AZFdTZfYkOeoYHcaD+JHMRvamSdx+FmuXprjCG5M/A4WucZ3Ol1QNXIVFDTu4DF0BqM
	5xLf7YRDEuwHc9t2klm9IkxS1GDPjm3ArFWRngPQdTs8Yo2QbF5sc0ylIDXikQ5hwPcJf24FMIE
	5eUzNNi+ZxlDEiGy0QYATUpc5xq7w79TPrbqDZtW5S6U4/A/6HhAkTr/x3YudmW2r6g1bYhPQsR
	b8gJs+h/63qFlvT5fi8nauyek1+EcmMZcOvDRR9NTYB99ICtq2/RvhLtFvfA+lNKNWiBAFTgqTu
	ysXmz5/vK443cLnZrQMVt/ziSGwmrWJgdUFh69uqAmS3+58OfSqQk7pf6keSGKrEs99wW7b+goO
	0zoOOOfZ3jX6wnUOP8VQfpMrAMIimmGVCToFg4yzm6OkzdzueJ0IYtp2LCzHJ/KG75+uZ3+IiCV
	2z
X-Received: by 2002:a17:902:fc84:b0:2ee:2aac:eceb with SMTP id
 d9443c01a7336-2ee2aad0a49mr55123265ad.58.1794817659577; Mon, 16 Nov 2026
 00:27:39 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115143708.492883-1-eugene.shalygin@gmail.com> <a0f9b726-d877-42cd-aebe-7cd727a6c98c@roeck-us.net>
In-Reply-To: <a0f9b726-d877-42cd-aebe-7cd727a6c98c@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 16 Nov 2026 09:27:28 +0100
X-Gm-Features: AclHuK8jSUb0JrTmkDLUkrzHNIZwBcVR0yyCUnDLxAyLPU1aaUOqfBrZCTrwjn8
Message-ID: <CAB95QASOtvS=XMYFn_RK96Kxhh9wydhfAK8Vv=OzBpHvGL92Vw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hwmon: add three more board models
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 03:46, Guenter Roeck <linux@roeck-us.net> wrote:
> Series applied.

Thank you, Guenter!
