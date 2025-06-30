Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF49292B54
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306883; cv=none; b=VIjSCiJE1ts4Nyo9xzXnzr3U7Q2jaHZkUuLMmMkFYv7GkfTaY9wL49KHi+G5e/8kTiO++PG1HkBs0kRrvXGd/8LZ4XEuEa04YsCOdo/ajRm4pH5h4bzgWTqJYmss3+hC7kcUJkA2wKPz6hOxpapy1KKEjk+IJazV42I8pEI+7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306883; c=relaxed/simple;
	bh=qVtw/kDHiHkFv04qJA7qjJFyOqXjhJ6l7YGufGNTzVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7ccR0wIQ8wj5ZAkh8/+LaRN7IphJD66aoRcMW74s2Be3no5RmGYfsD4c0f7oBzOLHVPoSUN7yW9IMrSY8H3RHemRqGVVMhrq7PUL5OJiAprt2GcT6fnIJKn8SLVerMZSFiXTLgiV2txfxW/CAB50++AxukM5tNAvSxtxn0oMc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=flynMZJJ; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="flynMZJJ"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a774209cf0so27749981cf.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 11:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751306881; x=1751911681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVtw/kDHiHkFv04qJA7qjJFyOqXjhJ6l7YGufGNTzVw=;
        b=flynMZJJjnrQLrIiqirCbprIJqX7wHdgKZgEUcYqS4+qPUSppPKHTX5TVYTJBhMtaC
         n2x5SHoRqc3SvJGeC9pThOE7jeedr3xpDCJ3J83pkmcBhP9CahEpv7KUSCd7ADzWM8QW
         XzghAfzjB3HTgcwA46x4rjKitrIl1TWrvPwDa2lN+uSnSspW7NGYjtC2GQxGW5kVy0op
         yKyWvY5G+Jhg5d15xSkec7IalYYrDPycctyJGPRjW44kG0VxzlRrmQ7pvGaBBsc3zRCr
         CQJbbTZqnUP7FiGhnkfHm236KIe4/sJ9At8qLsRtXQICp5LEG3NsT2zUycWwZXEm+1pX
         7Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306881; x=1751911681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVtw/kDHiHkFv04qJA7qjJFyOqXjhJ6l7YGufGNTzVw=;
        b=J88kRTFhVG8nWCVmha9V3MRozHk5Ib/+DbevY+X/lEi/4cbICLdd6ongjKnwQlMig4
         fuQrJIMzXJk5VLjQs7DwYNAcfmyMu+YRca9hQvV1URMg4FsX4+BqvURU672zNSIG3MhE
         vsaEY7E1dS1iE0AR8T68nZaLNDAcQQRignA2fo8zaBsqaHwHg8Fso24hkQvh33QxiCKS
         2Li7AWeKKT126ImkSMH99UD29Ec7j58Ft+RvxQJU4fsXjG4uRvbUcISHzB+gvqhFZxFp
         cODBrO9BG/7Zl1cGC0yzkTy6vj8yPxftCqZGxTxdtzqcgConAzUdBVRlmt47I6zwgYxx
         gxVg==
X-Forwarded-Encrypted: i=1; AJvYcCVJt3TYqHSe+kzW9eMl4lpfa7HL2AzkpZsMgNa2yCuwE65KD+fSy+XgSLxlBywLWz4pL5w754F154s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgZt9AOsd7Vh5TBxN5MJLANZ4cVir2fptlzyZ9d9VJRBLnbUR
	tu3Z7Bw9lx4K2uz07UKFMFSqbCzNRIaVFEJ0jjMnscBGFS3Vxew6Ra8/luZMaojhAg5/4QPHe7w
	nv10CX7Z/LVgTC84KPVOBE0EjtK4aiKS51iH1fWdA
X-Gm-Gg: ASbGncvyoBYVBRy97ZYTGGwROiJAUMhIBxCZSvA0zxcZTWmJgMe8c/2xb5psd07uM36
	0nk2AAp6IBcsfo/AmDSyhZPBHlz3ZiF9ZS7HsyqtSvG9pIyB1wQBTvriS3+FUP1ZfGXP6Sb5NPu
	0bO+nsKV9s6sopv2LZ5JgzqdZMenYCGbwk4djTArLDhXqP
X-Google-Smtp-Source: AGHT+IFZisuQr0XUMCY/TsPmXwCpvRIsc7yuC7ge4dGerQJstZ0mmexa2XR/n1CqsdanZlcKCX5a5a78//KhVZUXy0Q=
X-Received: by 2002:a05:622a:1a27:b0:494:993d:ec2f with SMTP id
 d75a77b69052e-4a7fcab93bcmr226452571cf.12.1751306880178; Mon, 30 Jun 2025
 11:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621193737.16593-1-chia-yu.chang@nokia-bell-labs.com>
 <20250621193737.16593-10-chia-yu.chang@nokia-bell-labs.com>
 <CANn89i+6o9sZMgEgP9ZxARVAw9f2KFVqTYPcM_8ZXRHw+-=esA@mail.gmail.com>
 <PAXPR07MB79849370D58D173C7FC3FB3BA37AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <PAXPR07MB7984466101FF3A5B5EEE1638A346A@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To: <PAXPR07MB7984466101FF3A5B5EEE1638A346A@PAXPR07MB7984.eurprd07.prod.outlook.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 30 Jun 2025 11:07:46 -0700
X-Gm-Features: Ac12FXxKoE1lXTXBoA4A1s6rxCjheG7xASzXjbQdiAPnxiDiotSbIGAhM9k6RZM
Message-ID: <CANn89i+BH3aNfm9qBggWo4+GKeCNdU2rcVL_QOcJBrrYyZ3XCg@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 09/15] tcp: accecn: AccECN option
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
Cc: "pabeni@redhat.com" <pabeni@redhat.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"horms@kernel.org" <horms@kernel.org>, "dsahern@kernel.org" <dsahern@kernel.org>, 
	"kuniyu@amazon.com" <kuniyu@amazon.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "dave.taht@gmail.com" <dave.taht@gmail.com>, 
	"jhs@mojatatu.com" <jhs@mojatatu.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"stephen@networkplumber.org" <stephen@networkplumber.org>, 
	"xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>, "jiri@resnulli.us" <jiri@resnulli.us>, 
	"davem@davemloft.net" <davem@davemloft.net>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"donald.hunter@gmail.com" <donald.hunter@gmail.com>, "ast@fiberby.net" <ast@fiberby.net>, 
	"liuhangbin@gmail.com" <liuhangbin@gmail.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "ij@kernel.org" <ij@kernel.org>, 
	"ncardwell@google.com" <ncardwell@google.com>, 
	"Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>, 
	"g.white@cablelabs.com" <g.white@cablelabs.com>, 
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>, 
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>, "cheshire@apple.com" <cheshire@apple.com>, 
	"rs.ietf@gmx.at" <rs.ietf@gmx.at>, 
	"Jason_Livingood@comcast.com" <Jason_Livingood@comcast.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 11:05=E2=80=AFAM Chia-Yu Chang (Nokia)
<chia-yu.chang@nokia-bell-labs.com> wrote:

>
> On top of my previous reply, I will like to specify that the following EC=
N functions will also be included in new /include/net/tcp_ecn.h
>
> void tcp_ecn_queue_cwr(), void tcp_ecn_accept_cwr(), and void tcp_ecn_wit=
hdraw_cwr()

Sure !

>
> This is because these functions are also been modified due to the introdu=
ction of Accurate ECN.
>
> Does it make sense to you? Or only AccECN function shall be included in t=
he new header?
