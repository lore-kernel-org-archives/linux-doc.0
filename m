Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9136036C0B3
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 04:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769055714; cv=pass; b=sZ49UO+qHjKVvGYpCv2D+N+RZoMcdUaaAkYdsVxrnidqlpNfp4ywejGfqeW1xsT2ang++648IK/pPDKjPeUvvgnx9SsmzyrbqjkcJkEPa2T/fqjSkSQKYUnRALn/18IsAGiGiCfQXSYgerwAI49oUIDhfvzKpc7/YhxjUpZDThU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769055714; c=relaxed/simple;
	bh=mH5awB6ralgR77aSnZe5QraaBsnwcsK7oANg9mkpPlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koGMFLLsi2VgYQXI9asiZcd5re/MZdnSyGTF9AAHmI1+rgccV9PoihAki7NVvkS8gAn+Rs2M8WzJiM5412aAxGSW/F+mUFTHei9Ng0jDUw5tuPpXY7uVgNtdc7BIETMndDOXrje9GAild4evsT9AqmLvGmkq/QI5HaIEPjspR78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0zQy/Dm8; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0zQy/Dm8"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59ddb20b720so1527e87.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 20:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769055709; cv=none;
        d=google.com; s=arc-20240605;
        b=cBDQtaRwOSFkoMlmPMiFdeqKed7KoCxx9UIei5L58vH6dlDyYPK91qSN/s4TgrbuMW
         c6/PqHCFyqVx+bxuO0sIGjGiYLipLTSmF2d+0MU14kIh3dHkrAAuVTmnN16wz6itWilA
         gCvwxMIhK14m4BgJaDVkR+2ZpW7w3BFheNBClkGOcbedUyFSqLSL7OduFtWfKn7TGfcy
         OpWY2mpyl4A10pbCtQqulq5jgkN8C2ZQ7x08xWHXiRq6ePyYj33ZRfzw43SkD0CT/bE6
         niS2cnGGLrG/mHDNFbYzjFJr/SiAqpUdkZutONUvFoADbpAkiuIUGtzXn4doGeHuJXE7
         qHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGE6hsUQ8af9Nnk2uwraZMl2mJJDDg6fHFgsmYD1lkk=;
        fh=Ch23hLATnwVgSAUI/iq4td12y9SwBV5tR4xMOR8dti8=;
        b=iMGDGYdgw0NcpkjXbTdLLWz5BDGmlAhNtgX4nRNyjQ+VgRlYFT7tYICXjMyzpbuTuH
         6XNkKX+pvy4F1zsE/EoOhaX09a67ZvtbZ2td/l72euH8cjUOlHyojSSCN3iMPGlIUJFP
         l81GBzfwvfbBlql2iEOay841W8F+4J/rCsWYM1BIDHU8GkuVluWOTvBX60bI0U0u6pLV
         xAT+cynQt5KzsfIktst8yIDzErFdXn+8eqLoQH7s9H3rS3S465qxVKJFhIxQUo6kRSsc
         UPhAizX8cO4OaXKd0LXtJ1h3fKc3sqNAFVJf4Ldnfn1bBiA/YDNjygkoB9TQnJqvIRPB
         d8BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769055709; x=1769660509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGE6hsUQ8af9Nnk2uwraZMl2mJJDDg6fHFgsmYD1lkk=;
        b=0zQy/Dm8TcfK/iDLejdkGKUQOOP3jWZ7ooOgqQrJPCLTZPZAkZopKiYUKC/C7+yYyy
         ClAhXuIspjsgDJdrLUXWIvf5fU7cM8RNVLOHF4xa7pcqUFVXjYw5SU5+puHobJPif2aO
         PZ1Q3cGElKY0o9+bhHRNBXB+DMSyGFS3NrchUlN5JJnv8ETEb2TMUSzEhZQKvq3ctDeu
         fRPG6U+awhPadcCc2e79h1fOQ5Thak56rWPGd+9eDu55QW/EV7hYDrPWCEr77D3zPnkl
         xZ40KACcgE0khhhG8tdoQsHlmlcUL0VhwcpZHXQz0PMbivuHp5E0UL1P1LoIVBW9MZuS
         sfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769055709; x=1769660509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGE6hsUQ8af9Nnk2uwraZMl2mJJDDg6fHFgsmYD1lkk=;
        b=xKpLnIShJiUw2Cm34KDjdTD/52qgn7kHVFM1l3qAXAnZ78GQt8K7saB2U1SPylk4nF
         kdGp2kQ6Rkl9COi73jJx85VucVbclnQpzOo8YccVHf/wMaUZ8t42NzeZ0xZaSN3shWtK
         jkdu0BNC0JgQP8BECJyj/z8HHkjEAlwV26VShW8+leP6aO9O42M1x7o0BJh4r4StBx2h
         uVCfjwnpkCpiJBAljyN5vUECxzq+BEjAtOvANEMkIaWROwRaP3s/rhgq+l+pcURtqpaS
         7e/UJT3AAkaaZpIGkMUX60cBJt1ibdzGCiGSYxGvVrgaFPnU8oGoG7y2D2VNTtlAHx0o
         SStQ==
X-Forwarded-Encrypted: i=1; AJvYcCWntNu/S5yAomGLRG60O8be/LyTavLVZIbGcpF0/7CafF12zz49sHJiLJTRiHU0ce2o7tMwypaEXpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLZe9Gi4RNJDQNxBfCDxpLzmr3LjPLRkjk3KrZPsYStRZX15I
	wULnJQJDbtGclJ6Ya5RkSrp5D/w5N3P6MFxXIN59IHKKR074zDaUoEzTjjw8bMt2cWMI6pCsdAe
	5V36mK5z/Eg7zZohPC1mZAEnzptFSlgFd+AVr6dvb
X-Gm-Gg: AZuq6aLw9MD9mc79jiG88pMNkJmAoPNjQAOO9SLBfUdVnKgUrswg3Z0QMupmwn9a/0s
	HedsDcN8BEdjU3CXmRPS+E/g9SzwdBzj+fWurHUMnWoCtecbvqz+1kMukKJLEp5uG4/HChjOcY4
	2aOgRcYo2NyZgLmehYaDKXgECadDiMfatjM/to0DcLKH46yIXZjByqyoPP8KuB9IIREhvI2TouM
	AqOmmFuvxH8HjpgzyJP3XhJEY/HKHA1qAQvsQpfwkOC2Okf571d+3/Kz5iS7oGAGoZIWXA=
X-Received: by 2002:a19:f009:0:b0:595:8927:8a32 with SMTP id
 2adb3069b0e04-59dd9e0ac3dmr85586e87.16.1769055708809; Wed, 21 Jan 2026
 20:21:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260120170749.101e8bcc@kernel.org>
In-Reply-To: <20260120170749.101e8bcc@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 21 Jan 2026 20:21:36 -0800
X-Gm-Features: AZwV_QgK7aDkPrzxUeGdcAMqS5gjfqbpQkTe0opAcE2mJCNB7DPzAw0bMRr6cbI
Message-ID: <CAHS8izMZxM6rcF+7Lfw=KFv4dmbHGSUrQBPmxO+sYj=V3TRuwQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX
 token management
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 5:07=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 15 Jan 2026 21:02:11 -0800 Bobby Eshleman wrote:
> > This series improves the CPU cost of RX token management by adding an
> > attribute to NETDEV_CMD_BIND_RX that configures sockets using the
> > binding to avoid the xarray allocator and instead use a per-binding nio=
v
> > array and a uref field in niov.
> >
> > Improvement is ~13% cpu util per RX user thread.
> >
> > Using kperf, the following results were observed:
> >
> > Before:
> >       Average RX worker idle %: 13.13, flows 4, test runs 11
> > After:
> >       Average RX worker idle %: 26.32, flows 4, test runs 11
> >
> > Two other approaches were tested, but with no improvement. Namely, 1)
> > using a hashmap for tokens and 2) keeping an xarray of atomic counters
> > but using RCU so that the hotpath could be mostly lockless. Neither of
> > these approaches proved better than the simple array in terms of CPU.
> >
> > The attribute NETDEV_A_DMABUF_AUTORELEASE is added to toggle the
> > optimization. It is an optional attribute and defaults to 0 (i.e.,
> > optimization on).
>
> IDK if the cmsg approach is still right for this flow TBH.
> IIRC when Stan talked about this a while back we were considering doing
> this via Netlink. Anything that proves that the user owns the binding
> would work. IIUC the TCP socket in this design just proves that socket
> has received a token from a given binding right?

Doesn't 'doing this via netlink' imply it's a control path operation
that acquires rtnl_lock or netdev_lock or some heavy lock expecting
you to do some config change? Returning tokens is a data-path
operation, IIRC we don't even lock the socket to do it in the
setsockopt.

Is there precedent/path to doing fast data-path operations via netlink?

There may be value in not biting more than we can chew in one series.
Maybe an alternative non-setsockopt dontneeding scheme should be its
own patch series.

--=20
Thanks,
Mina
