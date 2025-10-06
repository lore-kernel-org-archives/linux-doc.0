Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F459A935
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 02:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759718877; cv=none; b=ImO4qMgVCKDA+e8gW4OefFbAsExKA/ZyMnqDaooKLMeDlsCmk9qngsfDtrCWanNaioquc4eTBBQM9MeOP8TskmOrvx38SOsGLEYmzDsPI2733QGa2TC47EFKYZweJFYct0+JPbd6abduB6pOyZNg0AIJPnM2UR0tA2wf4QhPnSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759718877; c=relaxed/simple;
	bh=Ub2lKr7A6xcLWfHcWmLtxa22K5+ob3Jo4n6a4VRVTz4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Jfa8svDLUes2lAx6kwvosBvLMDRgp/aWaVqzDLAfOFUtM7q/hrGLYR/s1iZXnH/u38tS+qSfDRNI2xAEbOqFYDeefza7TjoCRLultAAbaORe+THrObm60mZTnmAqCVLAFTivkaACWJYFh90gToA03fXQAdAjjd00rqpYZub6Fic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bp51uAsP; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bp51uAsP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32ec291a325so3451433a91.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Oct 2025 19:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759718875; x=1760323675; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub2lKr7A6xcLWfHcWmLtxa22K5+ob3Jo4n6a4VRVTz4=;
        b=bp51uAsPTZdDmOGIRQUxua4jzszvujmSFRx362d/Bu/eE1v4b/FNYfkeFc0rH0QoSS
         D6b5x7axC5PnoMpM3LUOPFOWJ7B1wv/aD25VuBQxL/78H6Qg8QuIObATfqZc0px+XlDW
         ZiSpASPTfETaY5ddWfX9MTPmbRFRFQMu1H/OWrDHgJliH+vRonKIvjVo+ybbGebGDUeR
         gxJFpJs1OPRVQt1aQesujFmFniWNrCyxomeskhG2dh2PTHt6EmCq+zdE+t+0txs41oWk
         GHmE5ahlvCDssh9gUHrzf7rKRgRHS+ARqsbM8ni2QDoYZcIoRpngCxAfwknZGSroRIEw
         pTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759718875; x=1760323675;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ub2lKr7A6xcLWfHcWmLtxa22K5+ob3Jo4n6a4VRVTz4=;
        b=Ux5UQghd62hK2XmG8uWu+OCdbpnGJ/CMNkGFsbV2GynKqflKQVEWAeQgDqaz/7T6Bo
         0KLhuDIc4/TQtuSSS1IWZHcjG0VarEP5dC/ULr5WBtgSuJqoHunzIIrZb9tqP89Ku8v9
         40SE/08QxFRAHRMc047G9xKFIju2DkqC262q8RfjWhleIbOVAHxx85O7lEptMY3XEsja
         swysh488KMsyQkTyNcGBR781g/Rnnpj1Aprhdl5sdwPo2JVZKS6Skck1PUKvvkfU8an8
         GU/1qWpU+ty4Y561kG1u0y9dShviUuJl4ZG3dqJtHYVLT8Xajq/hBwXgPEi1kIZ/QYmo
         M8fw==
X-Gm-Message-State: AOJu0Yw7o8+b066Rgplc246CK8CGj2YuA0+luKshgahDpxpUblPio+Zb
	l/dkSusiuQmDcEH0w6yrPe1Ys71knM2HoYlZ+Oqgvc3v/ibJGHwvm1/P
X-Gm-Gg: ASbGncsX4x2bkBDU5byxeOhv+JW64YDozkso0tm7i0lAsXrym3020yw71hstJzxIb9G
	LjjEC0AHJqWGDsZS6p9mxR39H/jqntNB3U5ryyvGEOSCB8u/5YgMMxPEz1/w0Odc/K2VN0vr30c
	IhPi2i+OPVOnqNYosa9dm5pP0A1Cyd5sd+66b+KI768zbKLoPk7zxCdTD8ptJgm6BRj0W4c/52m
	V47AzFh+sLAzgxRzEe2ria89iXNk/IFjdRczZhiv/7MkPnkvJr1TxtTOqF8xFZQXojTFl3K0nd8
	Zi0UtDTnzy5WBN13koEE4EepqOKQLlcTZisSYHK/KM06EboIhjJ9AMPVf1tqlRZWHBUa59aKjji
	na5ayqLzWwR7n124swP6GsL0tSZAiy564Vnk1EDs1Z4D+wk+cDJ21nvhvbSS4JWGX+k2mo2NwUz
	4n3LLMwe2Nl4YeKN3pVAtpeP8ItiQ=
X-Google-Smtp-Source: AGHT+IGPFsb+IILRHjK2iQSiHGmyOccSSNAS5XPowMdb5VGjJkSs++TZxv1AHwhFsz5Q3qzuxF2xSw==
X-Received: by 2002:a17:90b:3a85:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-339c27e1f9dmr10600233a91.32.1759718875457;
        Sun, 05 Oct 2025 19:47:55 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4924c47sm9063831a91.0.2025.10.05.19.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 19:47:55 -0700 (PDT)
Message-ID: <6e4fab41-e8ab-4a43-b942-3e9271deee0b@gmail.com>
Date: Mon, 6 Oct 2025 11:47:52 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Error at www.kernel.org/doc/html/next/ since next-20250919
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

Looks like documentations builds at www.kernel.org/doc/html/next/ against
linux-next have stopped working (again) since next-20250919.

There was a build regression report from Randy [1[ against said linux-next tag,
but a "fix" [2] to that particular regression was merged into Jon's docs-next
and had arrived at linux-next as of next-20250926.

[1]: https://lore.kernel.org/883df949-0281-4a39-8745-bcdcce3a5594@infradead.org/
[2]: https://lore.kernel.org/8917f862e0b8484c68408c274129c9f37a7aefb4.1758539031.git.mchehab+huawei@kernel.org/

So I'm wondering if your build system is doing something different from what
is assumed by said "fix" with regard to the way "sphinx-build" is installed.

Can you share relevant error/warning log messages from failed documentation builds?
And more importantly, how did you install Sphinx 7.4.7?

Thanks, Akira

