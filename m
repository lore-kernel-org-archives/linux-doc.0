Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367323AE87
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865053; cv=none; b=mKOMvVvp7B/vTPJbFQYT2/7kSGDsqc2Fe+P++uqsbKeFCUCDvb/ofmrxnG4HnGTz5XdxUeDGkqRV3TcXM/krKvpATyI0I8J+APCfRlBq+FKr6+9eKvTpdzGx2jXE0uC03f7GuC6Uu4efCN3NOIUv2cnnYwWwaN08UDQ9DGlossM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865053; c=relaxed/simple;
	bh=2Ru/KnN7m2/UNKZBdjvYEm0is6y/YS598qRiX4BTtk4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ECrU1FXwTNxxAUJg4JLXlEahB9tLdDahdK4U/+oy6ldt5+K7i8taabvvTdeDXhNbJpN9nuEA4INUs/CLSXN7lKtHx7gpCl2bs9b/K6L50iwHUXvIIgWGEbNfsLglMc3Bexkg3u8JG1L3X2a+FSn6dOKCHIleN0JmoGlvKCk5CBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com; spf=pass smtp.mailfrom=qtec.com; dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b=Rj6TktD+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b="Rj6TktD+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so5391091e87.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1776865049; x=1777469849; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ru/KnN7m2/UNKZBdjvYEm0is6y/YS598qRiX4BTtk4=;
        b=Rj6TktD+ozJJQLa05elinNYPCapDUGE263cLwXP3sDBapP8WLT6SmEZgFydluxD1+5
         eHmwOXLk9mbOqSMxHjFUJb0FNVdL3jhq1iPnIS7eIMQTjlfheMzqdS45ZX0ncgQdJTLZ
         kIi5mYzvmBk/UHaZZ65xWxtGVExetefDXwyT9PQt+7vxHnruNQTXdkeZ4ZJmlGwn9Bbd
         rurdwnwvCos4wlBNPoTKnvtIToAHhhemCxOmVnWLYfdW9nC8HmMWmkI5jR4iql3+0UaI
         iNJyMrFWF1jtOmjM/3XI9Ky5Q5J42hsxutb+2hkTmjEs7TejiMMJqZ56sF8f9DZn0yAO
         O+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865049; x=1777469849;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ru/KnN7m2/UNKZBdjvYEm0is6y/YS598qRiX4BTtk4=;
        b=m80qD4+JLNR3cDKM6jOUQS+TirEzuSKbE/OFbv2wMRWiX0O4m7v9Kfg1EAphymfkBC
         R+RyMdGsNkIfmmWN2P038o9q4JEdwY6Jt/gUoYhOjHft6p/rLj8cpZG5NfWGToAKFlRH
         raHKw/dJSIt6bqsiYmWKmGTG5eeHZKYby/mfXGWRfSD0AuE8RCHf+MMLPvF8YM/XDgAl
         12O7jerDnTKrvseYHYSdg24/BDO6f/8fQeer/gSDBXGYwSiqjxzbNlZVKkqsMV1sE9js
         +22H+ZAeyaTVRl7bu4GP/p28iESPoWBUPKd/ARKwn4oRqiBqH48R6MVz5l3+paH8QBec
         mTtQ==
X-Gm-Message-State: AOJu0YzbsmuzpIx79aXKv4V94rlbEwq55Chxl+SIwCNLK45fr3jyUgaZ
	xQ4cS7UGGrc4Wz0YaRi5R5Mu+sIY1LujLnXvKkMjGlnRU7/eLNhpfJkQujZrKdDNoaITb7i2L9c
	aTo5Y8mO7hEXOBFqygDGk9m2aDXUABum9pjLl4hsvMUaSHZGe3iXgnAAkkFZ9odEYuFvGwNoUWt
	ItiPBwfIuLCe/RO0dTVO47sixU39oYt8YLe6s=
X-Gm-Gg: AeBDieseei4DcM1mCTVyNnq3N8Eu4mfgkEPQ1WPUKaygMMrfHXx1CStZraRH655/JC4
	fUJnYyANl3A7N1goGYAgwibv5E7JGz6dL6uwnxa2G/CpJwBcd81hfMHTPAATd9Vdw2k/JxT1R3Z
	reOxmP/jMZDmOSbYL9Ww6jZBTPVRCM86ebaGkOVTpFbFCwk2qgoG/pI+TvJFsAiigfB8yQXcNW1
	s447wU7WVUqhx2Qs9n8feuHyIjQSGssy8SPON+GzqT35RT0DN5N18S1NlCCAr8CI5OVHy/H4GWA
	n9sR1eYR4zlbW83kjz3sesiQZgKjuGJ5lT7B/gltYFL+UCzjJoPB+myJ7AlP7X9WVAhkz7myBPo
	uG1DGsNHIjYOEjAab1D7MIlcW1KkchoVhB6Wx/jq0To4FEx0ex5FmT1bXoryB0S+Pp9de6Ga9Zk
	bgnPyPtR+JSeLH4dy/CHd2BMWDLGuROgeFVL9arSM53ASp3fQPrubaNsQso932Vw/hxVfB7wPdL
	maS
X-Received: by 2002:a05:6512:12c6:b0:5a4:12a4:856f with SMTP id 2adb3069b0e04-5a4172e7bb4mr6349835e87.30.1776865048593;
        Wed, 22 Apr 2026 06:37:28 -0700 (PDT)
Received: from [192.168.2.46] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm36880561fa.26.2026.04.22.06.37.27
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:37:27 -0700 (PDT)
Message-ID: <35f1379c-41eb-422b-9441-393af5bddf31@qtec.com>
Date: Wed, 22 Apr 2026 15:37:27 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-doc@vger.kernel.org
From: Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: Incorrect auto formatting of struct
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi

I've just noticed that between v6.16 and v6.17 the documentation has started to
highlight struct that are not structs, e.g `struct inside`:

https://www.kernel.org/doc/html/v6.17/driver-api/media/v4l2-device.html

Previously it did not highlight this as a struct:

https://www.kernel.org/doc/html/v6.16/driver-api/media/v4l2-device.html

I couldn't find anything about whether this is intentional and thus needs doc
fixes, or if it was already reported, it's not that easy to search for.


Regards Daniel
