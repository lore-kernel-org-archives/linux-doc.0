Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7561626B08D
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737186; cv=none; b=G3mHanH+sZLG4CG0gUwgT6sGhCOe11mmt5V3XVx//Q0fMT/zaKTHdD+ZxRjZPu/7qoK2g+YYw8w1vQgWgsHw3aKhXLq/pNip5kect5OKCtZcRgG7hAif7SnTW8lgIxXc+d2hx84YqVkp9I0SK+iouWIjxpwC11y5/DoAFxvaUjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737186; c=relaxed/simple;
	bh=FxL3V0jtFjsgAS59v3HWejoNkoAFlD1rvXtnG6y2Zbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rr7Xr4IuEzhhyi2PBhA+coZwF5/3SiQaFKsZP/vT/vjijEE1ZhgaptqlLy6TO+/90vY3EYAfm1xF+77oCR5BNUYgJx/ErSq6nLpvYw+6tku99gsE2tkIU949eZWu/Q9uwmogWDHuLnEKrakSbReQu6yOKZLl/efnd0WDA+Vd+AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qKs+eHDZ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qKs+eHDZ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476af5479feso60076761cf.2
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 03:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737183; x=1748341983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxL3V0jtFjsgAS59v3HWejoNkoAFlD1rvXtnG6y2Zbc=;
        b=qKs+eHDZHhvDRHj5mo37u7KOUKF3tshjX8o4I1L9RFvJ+3OFvZkVQTK7izR+7WQYOX
         NQehIm62FXCPEnDoQVfQzEpKLJwqHuY2Eh9iAxS2bGsqB6RvC4El2xs9FdvR9jYX4MfH
         QxobEUG/RELT02qjFrD8s1SF1LfgXFMNODB/Tjd4c14nmvs3c3Fyvl99hsQd32V1VxR+
         2IHCOVGs9reylrlGkTFAIZQn9okrQy4S/i8DLAWPDNEFienfdOk8p9NGQnEoodSmX6cZ
         2Oy7aRROrY1Yxb/dCjCptN427ITLw08tkW5XTf+7qDhJnvO889FAxWG7nHP8MYfjbWjS
         T2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737183; x=1748341983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxL3V0jtFjsgAS59v3HWejoNkoAFlD1rvXtnG6y2Zbc=;
        b=ths/uESQs+MsTV0qRtOyviQBPUKULWxouGhgC2Fwod7DeFZNPHBr2vs0xnpbLwvZRb
         J4nAz6iWpeglpdRkPekGXD2onPzLPdvMVMBKmi+5C71hswYv1ZlJe0cVNPTbmbnyk/a2
         yeYYnLith7s6v5+yyYbVJu3ZiqRSnoBhJfqw0LTzG9TEBNW1NPX6RHmOY8UBTspoIGkR
         uaCR49X63DKUhxvBEKBfzvUHABGHuxZ4iAttrileY/3FS7kXX8TwgwKJlCe6DwjaPjY+
         vZtbQ/qF3sdd4YrS+CSPXMfD2ovaSIwBieGl4/YEKFb53LPRKZdN3SOX8SCUQ5K2ewjO
         B6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6sKjlm5BS6rp42EMZcmMlFmqrGKYHZ3KSQtRGcVxdGyn3Pq016XV0DILcPH7i/5ACxt8aMsAWVoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyziM4T/cvicA+tM58W7tovqYP3w/+N/znDYQjm0a3OxVSpmL6T
	RZMn2dJFl4phfR3uF7E2L7RPYfuVBtAz5hWIsQsJ1FLWQ4uCvzZMtxdY3u24R71SRqG39wVjY2F
	Kklheqd12UMlh28MEvf7PoMVfKTqOhRKr0wpwC2tj/0tx1i5IxvXlBYTP
X-Gm-Gg: ASbGncvjNp2UjyUJEyeapiX23aTBSL3e8hLe7vt9PdN0klBLRyFlK2qofEKqslbsZ28
	634lvvIilbPtYGAHl7xcoga69zK75AEdi2YBxMgaBB/qZRr7PHzb3B0sZGuGuBr1NVL/jUdaIRh
	lpQQAE5t7d2SqUuFYv8vLE4lrnZLksbAhm6jPjuIOAo6GP
X-Google-Smtp-Source: AGHT+IG9FNIYzv6dcarBeI5m4jU9YZIIxiM6brGC8IDm3JalGai8YqmQwl+Av8YyyDW0xxEWATAg7Oa4qlrNCUjkEMA=
X-Received: by 2002:a05:622a:2619:b0:476:9ac6:2f6c with SMTP id
 d75a77b69052e-494b079cfc3mr302490111cf.18.1747737171816; Tue, 20 May 2025
 03:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514135642.11203-1-chia-yu.chang@nokia-bell-labs.com>
 <20250514135642.11203-10-chia-yu.chang@nokia-bell-labs.com> <ba1b1b36-cd7f-4b36-9cee-7444c219b4f5@redhat.com>
In-Reply-To: <ba1b1b36-cd7f-4b36-9cee-7444c219b4f5@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 May 2025 03:32:40 -0700
X-Gm-Features: AX0GCFt1sJuWIW2WMnPNpQ3xQRDj0A9NooFrWJ-MWgR_JsUGZDwn2hf4HU1-mHo
Message-ID: <CANn89iLkyC-MfGUTvcV=zr+LYKzMsyv1im1Oft6EAXYb2x0jGw@mail.gmail.com>
Subject: Re: [PATCH v7 net-next 09/15] tcp: accecn: AccECN option
To: Paolo Abeni <pabeni@redhat.com>
Cc: chia-yu.chang@nokia-bell-labs.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 2:31=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 5/14/25 3:56 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> > This patch uses the existing 1-byte holes in the tcp_sock_write_txrx
> > group for new u8 members, but adds a 4-byte hole in tcp_sock_write_rx
> > group after the new u32 delivered_ecn_bytes[3] member. Therefore, the
> > group size of tcp_sock_write_rx is increased from 96 to 112.
>
> Note that I'm still concerned by the relevant increase of the cacheline
> groups size. My fear is that this change could defeat some/most of the
> benefist from the cacheline reorg for all tcp users.
>
> Some additional feedback from Eric and/or Neal more than welcome!

I have been trapped lately with production issues, sorry for the delay.

I am still working on an idpf bug, hopefully done today.

Then, I am OOO tomorrow, and can have a look at the whole series on Thursda=
y.

Thanks.
