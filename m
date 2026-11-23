Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393279;
	b=VkNqFk/RgM42LZaeNMSG+Qc9BcE9q6Ypt63Eg4ukpLiImT1UmSU6DncWdgJi4ykv/S+Q
	 g3IQF60LSggfX6wT4VN+9RUPPH1vKEGpWURXmyRnkZ+oTkLg3BlTSkGA4wjqkKFPflljW
	 NIk2KLLtBVU/N/hS4Lv5cpZ636vZLZnBkbfFlGJu3cFS04t9Toqr4CS1wfmj1Pz16yyQ+
	 s6kMORiH2ZQfiGQvIbFAqEvsQH+bLlJl71WygQZFN/HQ8LyFe14K78id8wSVZ7TlvK1Nm
	 nDSQk/jJiS5wcuTZGMCUAKnwbgkY/A2TqtuNQEmT9Fud5XwbDe+eKj2yiC/NhjVB5fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
	b=w68tKt9iwcK9Z9d0a2iyiVCPJ+aUeUjTRJwIKo4kr3vHdaEVe8HZpsclxrJVUz7B2/qd
	 OBhMtKkXzm49/4cNwnEtk5g5bU/zhNv1Kx4LaYRsWEB8qZASGHRREUslifq+mLYdhTYt1
	 MVwhe+RMMroX50u9JzKJTMFemFwdXNr2M9N6Oo2WVFBzg/86Qv50X6T0Wo6jX1QIEcBII
	 fxgtsV+WloxNz3+yPW9n4FWqc6aqYGLUK1PNh4pz1240ZCFMK9Tem1jSPtKyTc+y04/xl
	 0kU1Xt4AIoaKlYXkWnejVVntAR4db/LCRHUiRaCuXA6IpVnCGA4Ygt+HCivObP1pdmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui7qLXEe;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242BA606A31D
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 00:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242BA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui7qLXEe
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso970060a12.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795393278; x=1795998078; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
        b=Ui7qLXEe5JZSNGGNnJt8YRoCIU9BozHUuGdwiGGRpRdbVOmZeySJsVDdurWv9z6VuZ
         VmOigNcxpt4gus56H5t3tfeT+jMthzm64QEJc2zAee84tuc3roRSTwD3Kv0m4dUfr0F+
         4ugqeQMPjbgSS4cdMlpNKVGn/lbd6gTEqFW9TDBlFLcgP5yn4h8g99RzjC8XXY/+LFBY
         IwZpe4ZfiOfxC/PDMkHtsl7/7xATK8AceJkZH0IS98SuaBuBBITDhuqsEsnfsOQEZ/PP
         u3myvmJEKPylm9aDUWQ7+IckA8eVXYDNm+iIKJa0jJHfttZyD/rjsrlkR7z95OGmKQPn
         RqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795393278; x=1795998078;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF23iyWwR5yZnzbUCvNMaMixSGrIyVPB1oghCsOfI4k=;
        b=NIh4zdENyACsURbodP62lxQvHW0nLG7JOQtOaW7DO7df3AMGaaXBbUo4MO25zkvoDM
         3ZMG2Xp6pWE2OyuMQdA5Vc1mTBwaMO1j35umfYTkeDS/v9S88D/OBLq3qjxaBz66BPPB
         gx6dDCNSCj+LT3Lz5m6PfZHGy7SuuwGuSnUoh7QuPwLROtqLt7NXhApPhveItVvm6lEW
         64srQbtDF2kybt1Yhu1d36AS0kRuRx2bYwRx8pEiP5ZpJBKOgKK/BRXV/qLJoXiuAD3N
         llANYgw9wUP9C6+kYcSRMHJaXdtSkro0/nonn0jmgzleMkc5JkyhY8AEJ7w9oaaeDdeX
         bUpA==
X-Forwarded-Encrypted: i=1; AL+hErGWSXFqfiyJujHEC1hxv8wEReJ7BBvrF/RlguoMJNG5mSvYyZDPFBjMpsUWMmXRsZw8JwNePFZtfMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+eSUdOGpejZr0FATge6QDBQFnoQBhiOSilejJfaXB+WLIUXqq
	2Bx4lPC/O/fIzYOELTrcbcP5Q9nlNFJANq5ksox+5+giW2SvZk4JoFl2
X-Gm-Gg: AZFdTZdplIP2QBlZmtwIP2L0AhnyBj7uDVTPKwgQuD26l7uSJApitAyw6GE/0jlNb5w
	tZMGHfoMj+qr3ApI+uT9ckzZ5l1sRz9VH+q3x/kZRI1m37mgyhvSMATuvjfyjrNRojAoCqxkmg0
	f4j1wYDe1NVdtZrs+iT2IWwmbTcx2tdF2Y0jaQkbl6/lRAWs9LikaRESRc+Y7aAGfA6t0M1zh0F
	PUlqhUoRpsTUONHiYagkvDi9qIwRI/Td9+K5jsIhfKYRCqKqjjoL17hGI7b4bMSzHh2lbPSa4T6
	VMeFlGNEWzZljBOCsQaxe6gkOjoeMDtaAesK3a/MqNyoXHVtN9sSosNSL09zgJL6kxyof9kGRlR
	jX+lSP0WPHmSR4866LhBjZfrqm+NtJAqUBzYVteZ2kaU49MDaF/SfcsnpPW6kXhJEJIap7/coHJ
	tiQYA8sSaC4aGK516N2LWqTccVPVx+M+p5PR6o1cFg1d5K56DbxO9tV/9NYg/doHoZW0LA/T55u
	wLxkYtH/gbgHVxb9rm3AMRndPh3tF4Jz7j1OVfQxEWovzrbPWWe4ONPEdYC7q6du7ejz9BdWKRA
	AsvHOb8tdCUXFIPnhHQxqRBgwubEtIrXpvd179dH6mNkHxJuCmaB2Ti5c9Syv9RZxGgZVacOdaG
	4l+anyZ4S/ZZYYYABniq9N1Vybn8COCXxbck=
X-Received: by 2002:a17:90b:1801:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b41c8e16efmr9088622a91.11.1795393278264;
        Sun, 22 Nov 2026 16:21:18 -0800 (PST)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm4860403a91.3.2026.11.22.16.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:21:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 00:21:16 +0000
Message-Id: <DN25ST0D5K1J.1NI5236BF2BPY@gmail.com>
Cc: <bpf@vger.kernel.org>, <containers@lists.linux.dev>,
 <linux-api@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-security-module@vger.kernel.org>, "Aleksa Sarai"
 <aleksa@amutable.com>, "Alexander Mikhalitsyn" <alex@amutable.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Andy Lutomirski"
 <luto@amacapital.net>, "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner"
 <brauner@kernel.org>, "David Howells" <dhowells@redhat.com>, "Eric Biggers"
 <ebiggers@kernel.org>, "Giuseppe Scrivano" <giuseppe@scrivano.org>, "Hugh
 Dickins" <hughd@google.com>, "Jan Kara" <jack@suse.cz>, "Jeff Layton"
 <jlayton@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Josef Bacik"
 <josef@toxicpanda.com>, "Kees Cook" <kees@kernel.org>, "KP Singh"
 <kpsingh@kernel.org>, "Lennart Poettering" <lennart@poettering.net>, "Neal
 Gompa" <neal@gompa.dev>, "Oleg Nesterov" <oleg@redhat.com>, "Paul Moore"
 <paul@paul-moore.com>, "Pavel Tikhomirov" <ptikhomirov@virtuozzo.com>,
 "Serge Hallyn" <sergeh@kernel.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Zygmunt Krynicki"
 <zygmunt.krynicki@canonical.com>
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-fsdevel@vger.kernel.org>
In-Reply-To: <20261122193539.3334213-1-jarkko@kernel.org>
References: <20261122193539.3334213-1-jarkko@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 11:35 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> v6: https://lore.kernel.org/linux-fsdevel/20261122011809.2667684-1-jarkko@kernel.org/

v7 was sent 18 hours after v6. v6 got replies from the bots only.
v1 was +2559 lines. v7 is +5782.
All six findings of sashiko on v6 are still in v7.
None of the seven versions got a reply from the vfs or LSM maintainers.

The way you're spamming people you're only reducing chances of anything going in.

