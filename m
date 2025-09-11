Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201430E832
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585911; cv=none; b=lB0LDWZlhwU48xumUWxJGeAy8UbfPllHG7lHwTlKQ6Zvu+NAI13kxOP5DBKb332FAUtV+bvZpSr+3M/+KI/uzLja33s9DIF6NNOXeyB8h/tRLme8OZatrPW7Jep1Oa1/0f1hJI26nogGwzdH2IjetzX4DA8Ecr6ZBCqE8L8hfDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585911; c=relaxed/simple;
	bh=b8kOCoUNiju/FWlmhh2Efh6jL8KK7YKRK8N0sSL+ihY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQJ9pW1BFLIOyW1irlQK4LnUGUnGrn7FTgSI+KKZ73Ae0CULbKLLtewTEprwheYH/k7sVQxCQjXhP4KR7UHeFRLwkIrm5OS3Y0IkdIsFgbzEWsQNuj1b1svnjKmuVz3rhA4i2SPQ7JenOmVei3NhrP5q98yTZSqRijtKLYjh1ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zd/CHr04; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zd/CHr04"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-721c6ffab58so4706706d6.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757585909; x=1758190709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8kOCoUNiju/FWlmhh2Efh6jL8KK7YKRK8N0sSL+ihY=;
        b=Zd/CHr04NiV8NK/uaWUmoo6yfow/Cm0ZQqeugNK/LjKfDLdzQSmpFAYY9SDXNibLYe
         IHyaFVfLCp0VKbQZ+lsvYirwfOp6F5tBBVsAsjb/3lrtPf9W2Vc++e19PWYXIrS7v3eP
         psh6KU0eZsU5vQ698A5+vN9NAkA6YdzJwTqvolvRWF8TI/3OC1lbSHrQGkqvrLvRpRIR
         5LrWSTomqCnvN8BOPQn9yW1VYHfGRf2+uJs++Kg/o73obEGTwlg8keD793Z8OG11Ot8w
         jjkqgYFTCmoQwkBoUXGSi9ffUqopG843/7ZrdJXLqVup9U8qQlF8mZXUdslGaeR+H5FT
         p+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757585909; x=1758190709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8kOCoUNiju/FWlmhh2Efh6jL8KK7YKRK8N0sSL+ihY=;
        b=SReJ4fuEL378vpA8eEBAM3/A0YD92fhRblTEIDpStFtRFxXt50XtCmCDw0MnfdPBIc
         37Z8j5J6cgWCy76EeiY9s6wJbXC+h6bH6tri9sO1PiSPJle+yve7adHjwxzI9skSguNR
         MSYUdfqgH0JLT+NNfZgC6JUftkKs2QlBEt0SXSoBbasZ7kFJKSiy52W4l94ZHdkY7seH
         Dy3OkavM5bQkuw87PvW5NcXNJPmGKQE+3Hd2dmaflEHnEwn2bhlA8fKQPG9qAGhaoXKJ
         WjDI/JyqFY4lSEnTn5UDhii1eUA5j8K8akPc4UiBZyhvB8mB7hSMM/kIJ7DErlcQ+vu/
         Gq4g==
X-Forwarded-Encrypted: i=1; AJvYcCXGumTulxz0bWGcmT60xvc21gBaathma61PXVI2dJ460JzF/wLfxkgj1EfGSX8UPDYcLgBC1bJT5xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMqUl2ETjLlCeWeTjkUI6nO4oEDU0BL5/xhqN7xTnwMl/+QT4
	WPCwmT0vIpyvNvk5n551e91H6FCzLNSBSUhUJsuTA6AU08WzNReKONLADouIkSNjgJDb65jkxAk
	YBuE84RX/lVw9ANphaIVTbmVTt/cfneLA29uzceql
X-Gm-Gg: ASbGnctnsEJ9Bd1kBlovJjRbp7sO2Htg+DLrVFPXJBbtTz1DBw1cqO2cyvtT3cN68ZB
	RyljwxGu6qAWgBstdeP4l+nE7jrP4+QGu753+GfXqm6pujV7BlosGCQTk4nxP2oXh8KIFyYv3NJ
	/Aby001IgaVAu9Akq+YX1/sg/rR3OXU07wlqIjSYBzVg+XotYZo0wAIyX0IdHDuTSxZ2XdNJ91Q
	/zxKQ8fvcUL0d9MUbvE1Apt+wmEJIE7IgI=
X-Google-Smtp-Source: AGHT+IEqQMhkVh/lYGalDwkpiYZ6f35/G1vtOQ2l6IDxuZ/NsAD8i3LfdKsGnA8/soxwk9WffOfYsUldgmrLaRipwNs=
X-Received: by 2002:ac8:5e49:0:b0:4b5:e822:36e0 with SMTP id
 d75a77b69052e-4b5f839047fmr204347991cf.12.1757585908196; Thu, 11 Sep 2025
 03:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908173408.79715-1-chia-yu.chang@nokia-bell-labs.com> <20250908173408.79715-9-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250908173408.79715-9-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 11 Sep 2025 03:18:17 -0700
X-Gm-Features: Ac12FXyMpCAA7q3vBOdalZhfapQxJhqhSZEIpQwkhEKdjvw-ONLg3xPKC40oLaw
Message-ID: <CANn89i+2=bNkkf89RysrYxb9DW0Vw9+jSg7FotqtaHZa7tmerA@mail.gmail.com>
Subject: Re: [PATCH v17 net-next 08/14] tcp: accecn: AccECN needs to know
 delivered bytes
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 10:34=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> AccECN byte counter estimation requires delivered bytes
> which can be calculated while processing SACK blocks and
> cumulative ACK. The delivered bytes will be used to estimate
> the byte counters between AccECN option (on ACKs w/o the
> option).
>
> Accurate ECN does not depend on SACK to function; however,
> the calculation would be more accurate if SACK were there.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
