Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F7D4F8B0
	for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 12:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7tw5wnd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3366af69d4bso404766f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 04:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702901625; x=1703506425; darn=vger.kernel.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQkXJYJc/Sg6AJczIV0BB5z+pNvPL2oyiY2izXL+Fek=;
        b=W7tw5wndDZqCAS6M1DJx3MIa1ufYiEoFUJivUQthY5LgZ7IbzJSe4TPqnFDFCIjCAj
         5dIRquBXp2MfQJo0HOEeg/i4LulukxvM7qhanFrKlfpn7O6pyQs/xnflD7P/G/+hDdd+
         WvwvgZfP66Y6aAOxPYbyRgXWVX3gaB9cUZ7mluF1KZgVEKV+DrI82nPTU8ui9G8z4PZh
         g4brLTAcWlbTsNNQb/vC45ASf+jjyXprT5OZxzFtN6Ulh4/ePPEbqPlTIFQWxZzTvLoX
         oTMuC3SGxy3aiGyNsUA6gXQf3RMgXamNYiObn1n3+5y/PquPeYyjRXCliygjty0f7/wu
         r3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901625; x=1703506425;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MQkXJYJc/Sg6AJczIV0BB5z+pNvPL2oyiY2izXL+Fek=;
        b=GacfLHZ6dMcCLtBTfat3fjCLQqudiCqV4V59KZBGqVs0DIOtP2trQVJnYZWUFMYXhq
         KKyf7oTYjUMUs9Yjr/beo5mMhtf/smLdH43HnZFyzuypaZidr5dx/HILATGNmJLj88jr
         /JXqWubl++R7Sr2zK/QfvzQmAGBeezaVACp4VG3gJVnrlC+hqLIqZmKbh/MfEknDQkPp
         suTb+0dOxb0Vgti/CEER0KMFcFG0IuH/799UnbdAhqMPr1dO2BloQtvbeaL6mtVQ4+bP
         QW5eCEh1COZbJTgjWnAmhsdS731tfsqRnCpBRyNHJTUAgcyyuSz83StMglWgL85ze/NX
         YICA==
X-Gm-Message-State: AOJu0YyPuBRUt5/x9MRmM2TwxRgkfb5t3T3XIV0TeayQdkvRTXTtXxuJ
	VoI3+rLEAxSXUu8a8rSyyOfgXVRJBLXUOHUSQMkDMa2Jhg==
X-Received: by 2002:a5d:678c:0:b0:336:6426:4e1f with SMTP id
 v12-20020a5d678c000000b0033664264e1fmt1089424wru.34.1702901625226; Mon, 18
 Dec 2023 04:13:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231218114222.283705-1-tomas.mudrunka@gmail.com> <c22997c9-6d99-4e1f-9015-b7f80be2a720@kernel.org>
In-Reply-To: <c22997c9-6d99-4e1f-9015-b7f80be2a720@kernel.org>
From: =?UTF-8?B?VG9tw6HFoSBNdWRydcWIa2E=?= <tomas.mudrunka@gmail.com>
Date: Mon, 18 Dec 2023 13:13:34 +0100
Message-ID: <CAH2-hcJe40e7LhrmQb5XjGpRfrUEp3RukqWUqn1p8UQSNkpisg@mail.gmail.com>
Subject: Re: [PATCH] /proc/sysrq-trigger can now pause processing for one second
Cc: Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Bah, what's wrong with:
>   echo e > /proc/sysrq-trigger
>   sleep 2
>   echo i > /proc/sysrq-trigger
> ?

Your bash, or even ssh session being killed during the first line, not
getting to the two subsequent lines.

Tomas
